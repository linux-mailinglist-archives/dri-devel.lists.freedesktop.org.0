Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E214CC4C0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF29510E2EB;
	Thu,  3 Mar 2022 18:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C1210E2FF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 18:11:49 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so3733616wmp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LUNck2qOGIAZFIO08K9dH5K9dUeU/y3CCAiHWVsNaiU=;
 b=Kpcv05RipLSXMkEJacI2qWUGB8DGkLunNPOKAp6q407QfQqPXVYLHuh3tJVflMHewP
 dw0VCX6cq4WM83I5HFN4btHcgUbdKj7KQDUNZKYwjxyfF2HD55eObICGoJao+rnzWtVd
 ZXhNnp9caIWT09rwqvnyT9j7SZz0zUZt2Hpbf8mjXHUEVYoKQlm2CW9oC685CVG4HedG
 8JCNdi9JPUWR8pwtB294VW2E5MeQ4N2LCElCVvGUrnme7/IHs6uwSEghbydoBp4+74Ek
 x7735I3+orSjIhv48+JSmAWzwG36r8JqpjknG3FDuLbq9QxxBnrIsUlbF5fgog54XVja
 QN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LUNck2qOGIAZFIO08K9dH5K9dUeU/y3CCAiHWVsNaiU=;
 b=6Umx1VRsux+zLEvLzRMvWd32USU0MfwnuucH62G2WslIaulXQfjgM+Q3odJh+/lbkf
 MV6CfCwDuLusiNcGaIsRUIER/9FGwZE2gtAqGx3PFxRK8uB2lc3aVFmHwJLmNUek3KQH
 OqQOODlJ8hPayJQfamFpRWjh3CnMYYlh4gjhn3TJwbksG4TjT6o5amDO7fN+j9+aI+GJ
 /b9hbWYuyvT7wng8CI0L71Jl34myF/+bh+aucTyXtkoWq0SgAiQ6wAPmZ+6qav/DUtmG
 D/vUchG68lJkszCT35fdVqr5qUd3GweVDd5f33yiX4rI9Fl0XfPmHduOn1q6UQaTFF0E
 2zDg==
X-Gm-Message-State: AOAM531wG0zurgLF8tII7Bh/5J2pnRMm0/jQd7CfjvcExYpYU4xRJYSv
 9fpFrRxekXARhatIsgQcY7FpU3XkYJ3iAQ==
X-Google-Smtp-Source: ABdhPJzRO7ZiUQqf2Fl/fQaFy6YVw9cLJ9bwUb90MHgEF3jGLGM6QNbhzaMywKv3HqVgyUo7ltZpKQ==
X-Received: by 2002:a7b:c455:0:b0:380:a646:eb0e with SMTP id
 l21-20020a7bc455000000b00380a646eb0emr4675939wmi.170.1646331108203; 
 Thu, 03 Mar 2022 10:11:48 -0800 (PST)
Received: from elementary ([94.73.33.246]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b00380ee4a78fdsm3696436wmq.4.2022.03.03.10.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:11:47 -0800 (PST)
Date: Thu, 3 Mar 2022 19:11:46 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/omap: switch to drm_of_find_panel_or_bridge
Message-ID: <20220303181146.GA330174@elementary>
References: <20220220195212.1129437-1-jose.exposito89@gmail.com>
 <YhK0Y3D0O87T5fVW@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YhK0Y3D0O87T5fVW@ravnborg.org>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomba@kernel.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 20, 2022 at 10:36:35PM +0100, Sam Ravnborg wrote:
> Hi José,
> 
> On Sun, Feb 20, 2022 at 08:52:12PM +0100, José Expósito wrote:
> > Use the "drm_of_find_panel_or_bridge" function instead of a custom
> > version of it to reduce the boilerplate.
> Thanks for looking into this.

Hi Sam,

Thanks for your quick review, and sorry for the error in my patch.
I thought my toolchain was properly configured, but it wasn't and
I missed an include:

  #include <drm/drm_bridge.h>
 +#include <drm/drm_of.h>
  #include <drm/drm_panel.h>

I apologize for the mistake.

> From the documentation of drm_of_find_panel_or_bridge():
>
>  * This function is deprecated and should not be used in new drivers. Use
>  * devm_drm_of_get_bridge() instead.
>
> Are you OK to give this a second try with the above referenced function?
>
> There is a good chance the deprecation happened after you looked into
> this first, sometimes things moves fast in the drm sub-system.
>
>       Sam

I'm getting started in the DRM subsystem, so I might have overlooked
a function, but I think that in this case, since we need to store the
panel in "out->panel" we can not use "devm_drm_of_get_bridge".

"devm_drm_of_get_bridge" returns the bridge and I didn't find a way
to access the panel from it... But as I mentioned, I probably
overlooked the required function or pointer.

Thanks again for your review,
Jose
