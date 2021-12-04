Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3072468149
	for <lists+dri-devel@lfdr.de>; Sat,  4 Dec 2021 01:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BC4AB71D;
	Sat,  4 Dec 2021 00:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE95AB595
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 00:30:13 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so1648214pjq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 16:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Y4bA6B58sO/DZFiWQPyn2M4tT+W9TdiU/GNQ/jYac3Y=;
 b=dONWm8orH3rHUYSth5Iu/7D5o9GfvJHjytD1XASds1m9DG5Iu2xtV+VIJqFns9+sCW
 gtVXtQ+X75glpuBDyjZuBrz5E2x65R67MRUHyYgMxoRbtj2iT7FB4LVqbxZaCTcsZp/N
 XgqXSY5G2qAHh4XaPeq45yLBcfhCQFiswdF4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y4bA6B58sO/DZFiWQPyn2M4tT+W9TdiU/GNQ/jYac3Y=;
 b=Vtozv293vfjrcVKur1py01uSkVd8vI6Rhwp+MPa3zYPevllHRemB0McyvgzIL+NiPw
 TWMkNF2we1IYjrgcbE0BQY3a3FebSQ2q7vElqCK8oENf5SEtJbEQzW/RnrvUGveuxBzP
 SGwdM6T42X1f/YJlGdDU48d1nKLLMPAyvjOX3o2+OaLIus4KNu09P7Thwbu4O2XASULr
 NxodFTINFG6szynhC1NIgvI2zCDs/0QblceVYQEoyBydotPIApvXCRiWE0VJ61ITeuE4
 5hg5ORx6ey0fl2rZ7ThCjvk7hI4+OV8ypQZZMM6o3ZVSRM3QoKdTnxVnIin2F0KpILmr
 GVaw==
X-Gm-Message-State: AOAM531uZAHz1AffjnB3TFMmDZ3ec/cZTOLk92fCDJo92OzWXDT0oD05
 EWci9xDpGiZ8LSTMzAQTB0j5iw==
X-Google-Smtp-Source: ABdhPJy5+D2oCiE3ykyx5Czt8xcCI64YJaODeOVQrz0mW/Nu4udeXpuxcyGClFdtOCvXH6jCy9Bo8w==
X-Received: by 2002:a17:90b:2251:: with SMTP id
 hk17mr18109616pjb.31.1638577813403; 
 Fri, 03 Dec 2021 16:30:13 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i67sm4367649pfg.189.2021.12.03.16.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 16:30:12 -0800 (PST)
Date: Fri, 3 Dec 2021 16:30:12 -0800
From: Kees Cook <keescook@chromium.org>
To: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2] drm/dp: Actually read Adjust Request Post Cursor2
 register
Message-ID: <202112031627.C312CCDD0@keescook>
References: <20211203092517.3592532-1-keescook@chromium.org>
 <Yao3uMmXM+IvrVrF@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yao3uMmXM+IvrVrF@orome.fritz.box>
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Manasi Navare <manasi.d.navare@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 03, 2021 at 04:28:56PM +0100, Thierry Reding wrote:
> On Fri, Dec 03, 2021 at 01:25:17AM -0800, Kees Cook wrote:
> > The link_status array was not large enough to read the Adjust Request
> > Post Cursor2 register. Adjust the size to include it. Found with a
> > -Warray-bounds build:
> > 
> > drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
> > drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
> >    59 |         return link_status[r - DP_LANE0_1_STATUS];
> >       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
> >   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> >       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> > v2: Fix missed array size change in intel_dp_check_mst_status()
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c |  8 ++++----
> >  include/drm/drm_dp_helper.h             | 10 +++++++++-
> >  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> This sounds very familiar and I vaguely recall typing up a patch like
> that a long time ago. But I obviously failed because that never seems
> to have made it upstream.
> 
> Or perhaps I'm misremembering and was thinking about this instead:
> 
> 	https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/338590/

Oh! Yeah, that's the same thing. Looks like that never made its way
upstream. :(

> 
> Bonus points for adding that comment with background information on why
> we need this.

Thanks! Yeah, I needed to really convince myself everything added up and
made sense, and figured I should try to capture that research. ;)

> Reviewed-by: Thierry Reding <treding@nvidia.com>

Thanks!

-Kees

-- 
Kees Cook
