Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54C49DEB7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 11:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCF710EFBF;
	Thu, 27 Jan 2022 10:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CC310EFBF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 10:06:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s18so3726374wrv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=iCPc9S/xqKutjtG576RySPC5c4MhlsxdAcWvoCriPRI=;
 b=UXS0cNb0r6A21/Yr+t8ULc7eUWYnKfSr2Xz7F/W4kBv4PxDY2V8IiKS9AVKzoL/A4c
 2QXelZZmI0IvcYButMcGhtQiIwQeVSto8F0tLQS/0i6E39oVBJb4ONuB1wxShRLVAjEd
 qBQfBDs5FDzwXhh+3CWdQE+EinE2wHefcKrMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=iCPc9S/xqKutjtG576RySPC5c4MhlsxdAcWvoCriPRI=;
 b=cmA77zOEk0caXj++tlaUL15SEQlJLLzXf3eP8p5f4GMgtC+DvDxss1sGQJ+uJfppwK
 N2ivLiRiHPbPZ+M6FqhjAStdwUVDdcmLEY3dQASUyt5ZXGeS0T4LTsWiKKW9WCzY9/X6
 uFwcqkiqv40JLZwNBjjJT2bcBmCid2iPEmnX3yYOp5uII0qlIKyVr0r0U/w0KUYmN84i
 HEPiUOu73by1fj9C3ytVzBGrV1xsuSfGY1rU+64O1ZNi4u6LC7fZBk7qsoryqN7JyyMI
 r/t9Quu3GUG2kyiilF7B9d2MyxzmIM2uGrm4RNodjMOtxxcqFM6SjR3BmDqWBIuwuMWH
 PNKQ==
X-Gm-Message-State: AOAM532vv5Lc8Xet1zU9mbtoeYPc413CLOTcxsbY2nduUIlPov7j3Efr
 FhsBz/X4LEtp/oVPV6YqndTsuA==
X-Google-Smtp-Source: ABdhPJxbmhEnlOI80raqLeqmBjMueB3L0ut5WVsnvXgW4cJU2nUFg7KyFIWNlDJldrhPELeM37AAEQ==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr2448712wrr.141.1643277987361; 
 Thu, 27 Jan 2022 02:06:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d6sm1681780wrs.85.2022.01.27.02.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 02:06:26 -0800 (PST)
Date: Thu, 27 Jan 2022 11:06:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers: Fix typo in comment
Message-ID: <YfJuoHfKnwm6LmuY@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
 tangmeng <tangmeng@uniontech.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, jsarha@ti.com,
 tomi.valkeinen@ti.com, linux@dominikbrodowski.net,
 Peter.Chen@nxp.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20220127065156.22372-1-tangmeng@uniontech.com>
 <YfJCBZuc9mOZkIVJ@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfJCBZuc9mOZkIVJ@kroah.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Peter.Chen@nxp.com, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 tangmeng <tangmeng@uniontech.com>, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, jsarha@ti.com,
 tomi.valkeinen@ti.com, linux@dominikbrodowski.net, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 07:56:05AM +0100, Greg KH wrote:
> On Thu, Jan 27, 2022 at 02:51:56PM +0800, tangmeng wrote:
> > Replace disbale with disable and replace unavaibale with unavailable.
> > 
> > Signed-off-by: tangmeng <tangmeng@uniontech.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 2 +-
> >  drivers/gpu/drm/tilcdc/tilcdc_crtc.c  | 2 +-
> >  drivers/pcmcia/rsrc_nonstatic.c       | 2 +-
> >  drivers/usb/chipidea/udc.c            | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> This needs to be broken up per-subsystem, thanks.

For drm please also split it per-driver, so one patch per file you change
here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
