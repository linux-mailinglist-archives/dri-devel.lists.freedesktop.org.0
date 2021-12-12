Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D70FF471A66
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 14:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66BB10F3D5;
	Sun, 12 Dec 2021 13:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216DC10EB42;
 Sun, 12 Dec 2021 13:25:39 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id u22so20115561lju.7;
 Sun, 12 Dec 2021 05:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ve598KfcQjMxrN8DF+2cp9+JVJ390WXc4dmmTe7HN5c=;
 b=WSF3+HDisDiQZ8snqo5VYAJMjQ6TsEhaBTf9cGpbPVJEhDcFlIqzko6Y9w4FOpfLPI
 a2IbhnUJP5wdzkMdJ6BuhWMjVf8QJ0dyJS0TpxAqke8i0kH7wqfNqE4scEBhI4ob3ub3
 y51OBOl5gYffizYK2frAmpWuSaSCizO9qv5UtWzLNKp3/YFTtWX1/r/P2UD2LyU6BwjG
 XEeqawPZiJDHhfIfXCeTA8reAJEEML2+TkibGcqqbv40GZiNeQbxP3GiHlsDpjzNE+xh
 0lAm0kHB9huo8Kw3yb6w6ASRzqamGJl+l+iOsoo7mj++MuyL5rPhzNNBcXONb4eeaMmG
 qkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ve598KfcQjMxrN8DF+2cp9+JVJ390WXc4dmmTe7HN5c=;
 b=HR1gq2N0JM7cRhiBPaku4spd5JVqWvmSVlk2gVv8EFtFM8SW63cefF6hSozvHdZ8D/
 RPQ84wu+yQdbBdA6RtEtMQQ56AJdQ2Z7eBDtNTsSZqx2z9gZ3QhVGlep3RYZTsVRfqJP
 0//hHqu1CgAkuw3tgzTR1TgvounoBjTNg0gEGaRChqImIgND+TGXZwxBa/RdB4OZq6y2
 NrDemSlKPa2P9jwVQxgognJRHfPWHs80A2u8DkZIZ9Htx3TnPBp9zaAShBg4y5aesKIj
 k7qiq4CuTW6XwkF57aoXg3PyEncQZulLsQ1dKiz3t0l3tE6Q1u4utPLdMOb7sl6hqz2k
 d2aA==
X-Gm-Message-State: AOAM532Pn9eH2dcvxGDvQDB9w+yzFy1gq7NXBkWumX7vQGdJmt10wDZW
 o0NEQPsqXzoQTagU3sryTu4=
X-Google-Smtp-Source: ABdhPJxrAW+qcnMprjTjS7C6EU0UJV8c47Plc/QFwingZzCya+B1SR+noXjcPHs6Wxk/7N+p8qZ7cA==
X-Received: by 2002:a2e:894e:: with SMTP id b14mr23592116ljk.216.1639315537349; 
 Sun, 12 Dec 2021 05:25:37 -0800 (PST)
Received: from rikard (h-155-4-221-129.NA.cust.bahnhof.se. [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id x23sm1061671ljm.36.2021.12.12.05.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 05:25:36 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
X-Google-Original-From: Rikard Falkeborn <rikard.falkeborn>
Date: Sun, 12 Dec 2021 14:25:33 +0100
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PATCH 0/9] drm/i915/gvt: Constify static structs
Message-ID: <YbX4TYifpiUJ4txx@rikard>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
 <d612055c-e433-4bd0-b819-82e866619b23@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d612055c-e433-4bd0-b819-82e866619b23@intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 09:00:56AM +0000, Wang, Zhi A wrote:
> On 12/4/2021 12:55 PM, Rikard Falkeborn wrote:
> > Constify a number of static structs that are never modified to allow the
> > compiler to put them in read-only memory. In order to do this, constify a
> > number of local variables and pointers in structs.
> >
> > This is most important for structs that contain function pointers, and
> > the patches for those structs are placed first in the series.
> >
> > Rikard Falkeborn (9):
> >    drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
> >    drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
> >    drm/i915/gvt: Constify intel_gvt_irq_ops
> >    drm/i915/gvt: Constify intel_gvt_sched_policy_ops
> >    drm/i915/gvt: Constify gvt_mmio_block
> >    drm/i915/gvt: Constify cmd_interrupt_events
> >    drm/i915/gvt: Constify formats
> >    drm/i915/gvt: Constify gtt_type_table_entry
> >    drm/i915/gvt: Constify vgpu_types
> >
> >   drivers/gpu/drm/i915/gvt/cmd_parser.c   |  2 +-
> >   drivers/gpu/drm/i915/gvt/fb_decoder.c   | 24 ++++-----
> >   drivers/gpu/drm/i915/gvt/gtt.c          | 68 ++++++++++++-------------
> >   drivers/gpu/drm/i915/gvt/gtt.h          |  4 +-
> >   drivers/gpu/drm/i915/gvt/gvt.h          |  2 +-
> >   drivers/gpu/drm/i915/gvt/handlers.c     | 12 ++---
> >   drivers/gpu/drm/i915/gvt/interrupt.c    | 10 ++--
> >   drivers/gpu/drm/i915/gvt/interrupt.h    |  2 +-
> >   drivers/gpu/drm/i915/gvt/sched_policy.c |  2 +-
> >   drivers/gpu/drm/i915/gvt/scheduler.h    |  2 +-
> >   drivers/gpu/drm/i915/gvt/vgpu.c         |  4 +-
> >   11 files changed, 66 insertions(+), 66 deletions(-)
> >
> Thanks so much for the contribuition. You only need to refine the PATCH 
> 2 a little bit and re-send it.
> 

Thanks for reviewing. Just to clarify, did you mean patch 7 (since
that's the one you commented on)? And is it enough to send just that
patch or do you want the entire series resent?

Rikard
