Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4BA94D530
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 19:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AD710E9A9;
	Fri,  9 Aug 2024 17:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WIoyiXLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C43B10E9A9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 17:07:00 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5a79df5af51so5074782a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 10:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723223218; x=1723828018; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bqi0R8E9+yWkIxspBX3nFOrKOj6LKnr9GEzzF8YTptU=;
 b=WIoyiXLFfQ12nlohPAQSde69grZ023m272cSqm3Lip01adPPNAwk4qyHhsyaIWEtQi
 0aoUOTf1X65wNZlnEzlauKyxKoyOKx3URJxVuCbM/RoL6jNvCYH/eq0si5I/gMqdYmo5
 4imbV5Xd43Ac7Njvj8w+bR19K3YyFn7PxhQMiglRBBM20IjDplwri8YFiCKvX7gJamqY
 z4liMGbUMnUAtQ8I+MWp+Cj4nRMnlkHEiG34RmNlHvdBNvMXz/W/LF7O4CyIklpgl2oe
 GTwMyD+IKcujDNoQD3EqTMWioiGg4CPoOQSuF1P7Vq1+Z6GaCzS6OAzDvBG63OkojPqG
 S16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723223218; x=1723828018;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bqi0R8E9+yWkIxspBX3nFOrKOj6LKnr9GEzzF8YTptU=;
 b=uU+inQytxL5KllQ5NpwFreOdwSVP621+E5g1Se3yC75wEiyiNEb0XsG5prwRLsrwhc
 OMRkMyWw0nYN1Ou+4wAkS53EvIBiTHgcDCHfTjX/9ke6W6reL/0Pi6vOH9hKAnwcVkZM
 F8XgLaKtCDCQTTIY1LxHzp4Yu1Xc/bQav4R3n1nTJqtqHLDTa2Ol2au0US+nsEC5fvOm
 +LOkrm90VC0by0Dc2sRkNwKE0LVBzu0FETFzdmXFBv9nUZGbqfRUI/NWXGPHy+aBm9lc
 MnDxVW/wW3nxHkAGUgBhcIAQ3MuLP8uZk+eKaXrajBZKCnvlW5+su6YnHhbEUkddHfYN
 mazA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKcjXYC/TH6qzNw0QDDgiRh5q5ds/Uq36erq9S4faMas2gFnH3Hio/NN3ATx3DTgJH7IZFhLIz9jOHbhfGQVAnlLcQx30QTdYQOvndf4Y1
X-Gm-Message-State: AOJu0YwF5904B1g6u7QMC8eWv4ze2Qn0gBcAapY0+QiK7zF+TBqVm3zC
 Qo2eGhTy4GkPdYPouIyBF4GUI8OBRJ7QhNd4l9Ic2fPg2akEq7Z1kKlvX6RFH1s=
X-Google-Smtp-Source: AGHT+IEeCFPLP0xfg9I587Tui8Mvgeq3K/jroE1CYOnUpQ9zZAYa3E+EGGh4PFeyvJx4Oey5IN0PeA==
X-Received: by 2002:a17:907:368c:b0:a7a:8dcd:ffb4 with SMTP id
 a640c23a62f3a-a8091f1998dmr492925166b.17.1723223218128; 
 Fri, 09 Aug 2024 10:06:58 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d89a8esm872794066b.144.2024.08.09.10.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 10:06:57 -0700 (PDT)
Date: Fri, 9 Aug 2024 20:06:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/ast: astdp: fix pre-op vs post-op bug
Message-ID: <359e5aa5-5908-44d3-8359-4605aac3f5d5@stanley.mountain>
References: <f7790a38-6b72-44dd-aaeb-550d2de14cf2@stanley.mountain>
 <57cea156-1abc-4860-9a6a-0a5fdb4a2971@suse.de>
 <87h6bt3j6w.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6bt3j6w.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 09, 2024 at 04:43:51PM +0300, Jani Nikula wrote:
> On Fri, 09 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Hi,
> >
> > thanks a lot for the bugfix.
> >
> > Am 09.08.24 um 14:33 schrieb Dan Carpenter:
> >> The test for "Link training failed" expect the loop to exit with "i"
> >> set to zero but it exits when "i" is set to -1.  Change this from a
> >> post-op to a pre-op so that it exits with "i" set to zero.  This
> >> changes the number of iterations from 10 to 9 but probably that's
> >> okay.
> >
> > Yes, that's ok.
> >
> >>
> >> Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomic_enable")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> ---
> >>   drivers/gpu/drm/ast/ast_dp.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> >> index 5d07678b502c..4329ab680f62 100644
> >> --- a/drivers/gpu/drm/ast/ast_dp.c
> >> +++ b/drivers/gpu/drm/ast/ast_dp.c
> >> @@ -148,7 +148,7 @@ void ast_dp_link_training(struct ast_device *ast)
> >>   	struct drm_device *dev = &ast->base;
> >>   	unsigned int i = 10;
> >>   
> >> -	while (i--) {
> >> +	while (--i) {
> >
> > If this loop ever starts with i = 0, it would break again. Can we use
> >
> > while (i) {
> >    --i;
> >     ...
> > }
> >
> > instead?
> 
> FWIW, I personally *always* use for loops when there isn't a compelling
> reason to do otherwise. You know at a glance that
> 
> 	for (i = 0; i < N; i++)
> 
> gets run N times and what i is going to be afterwards.
> 
> Sure, you may have to restructure other things, but I think it's almost
> always worth it.

A for statement works here.  I need to resend the patch anyway because
the if (i) msleep() code doesn't make sense now.

regards,
dan carpenter

