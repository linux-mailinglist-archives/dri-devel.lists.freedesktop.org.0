Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55799F3D66
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 23:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6F610E7D1;
	Mon, 16 Dec 2024 22:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RQD0PjnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1C810E62E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 22:24:08 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso52263841fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 14:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734387846; x=1734992646; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t7TrH1UvKd3oaC2SonGHzYdfePQRSyRbTdYf+pidBv8=;
 b=RQD0PjnED1ZX9+XFVHcAZVJ0+QGDrVq4EPlGRoxM8hbJUgXCWXKSxPfbiX3j+dpX1c
 IS7bVTPeUH6mfKk4mLGJnA/DNag18aIqC9Dw8SukQq9GE8saxtgdj9fPTLkNpTPTE5SI
 l0Wc9UnMlPNlMZExA35hczCZeLjmejCug1wMa5x44BgIxTdClMmwtHpohJgbo7wYlFQy
 +tt7usmR7NTgnt77MgUl0KDz1u2+9r7Lzd/C0tSUOwxUhXFMSWgrkwOPfGyfe2FbHbVV
 aWQY5ICliN90wCyJW7GmThFyoOE4/dNTzrbluS7ui/fMao5luOLjMSuA3Dhdj7EWXsPQ
 31Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734387846; x=1734992646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t7TrH1UvKd3oaC2SonGHzYdfePQRSyRbTdYf+pidBv8=;
 b=XFY4YFU5wLUmuHhSmgdMrhXf3a9t7GgmsG6EZ+5/QAqUQRFWZ75KFevuYC9PCFxU2n
 Ri3+r0LNjp+w77GlG+l1YSL1WYy7/ZsjlJdFT0g9FThggN4c1xUP8SjlAhki5QOWMwPu
 UCVcyOiN1+ZwxIKvLs5mdh7nEl8LJfAXDEIXYr0VqlKaMbmMEL1EkxQhkXjDjnDETVao
 +9R4R9VX20GJzY2fzXpUcDYIGTI5biYVmNMgJD40Hoed4AP30JtRGWXKQXgM1Pnw7qpO
 QcUZd4aHcO3l01w4AKyBoA0eW8G8DKPIoVfivYSfLLZ43IXLEBVcZpNiOC9Y4xjAePV6
 gd0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjbvqG9nYLygOk2jQmtCGqjEX+3DhFjLVc9NVCrU4bLihjIEcXWnApWKuvyueK8ijV1/OIKAXseOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfSsuCINSeGnM5bm3LzQGO6qqQWdOgkIMsQkRpp040drpEv2EE
 9qcBu+2GmechUwL0HQuzN43wpiuzlb/HFGnyijSB4FWwzIoZN4TutzD0fpHkjRM=
X-Gm-Gg: ASbGncvdlyp1uavsEOgDFbibF0+NRXbfILkFGblVCdur08Mb/iK/xoLoqWeLHf3DKla
 XXo2vlBvbBxOO4xT8WbS2F9oK5KC4A5uQB7sYbMB1wBKb2RjLeF6y/VNARLgfFZ8Y3wIPwg4jtg
 14zvuU08G6vevC72SeX5ZTTJDplh3qT2sWG2qG0jvyN/REDNighLREedq6Rn6tzuwjaDL3KKaJO
 1AR6uPQENySx4W2/y/xnuSGrfza9fjsGvLi8Xt4NWONVfIk2w3Cy3jKQrfOqtJ9WgFAWntbjOxv
 FHJZHCPalaSYfBB74GvFaw7pYG46XrXQhkub
X-Google-Smtp-Source: AGHT+IGVrNsBIuWVRv0FfM+cys7dHh0GLTm6LZ/EdLm6AhlrYBZqk0DuZoUJzXDknWjG4LoS58j5OA==
X-Received: by 2002:a05:651c:1a0b:b0:2ff:cb47:3c77 with SMTP id
 38308e7fff4ca-3025459d373mr53682521fa.26.1734387846495; 
 Mon, 16 Dec 2024 14:24:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a43desm10440181fa.98.2024.12.16.14.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 14:24:05 -0800 (PST)
Date: Tue, 17 Dec 2024 00:24:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
Message-ID: <wfgn4oomnlsgckazp6z2cqoj5lk76gd5wmphrg6kwiomfvo2j2@rinnzg2ml7is>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
 <0cbe48cd-b830-444a-8de0-529343d86192@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cbe48cd-b830-444a-8de0-529343d86192@quicinc.com>
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

On Mon, Dec 16, 2024 at 11:32:57AM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
> > Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> > to program audio packet data. Use 0 as Packet ID, as it was not
> > programmed earlier.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c   | 268 ++++++------------------------------
> >   drivers/gpu/drm/msm/dp/dp_catalog.c |  71 ++++++++++
> >   drivers/gpu/drm/msm/dp/dp_catalog.h |  10 ++
> >   3 files changed, 122 insertions(+), 227 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> > index 5cbb11986460d1e4ed1890bdf66d0913e013083c..46fbf8601eea8e43a152049dfd1dc1d77943d922 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> > @@ -14,6 +14,7 @@
> >   #include "dp_catalog.h"
> >   #include "dp_audio.h"
> >   #include "dp_panel.h"
> > +#include "dp_reg.h"
> 
> This change still does reg writes through catalog. Why do you need to
> include dp_reg.h here?

A leftover from the previous patchset.

> 
> >   #include "dp_display.h"
> >   #include "dp_utils.h"

-- 
With best wishes
Dmitry
