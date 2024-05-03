Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0F48BB4B2
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 22:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9ED113236;
	Fri,  3 May 2024 20:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UrpKY3p3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABFA113235
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 20:20:17 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-de603e3072dso113614276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 13:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714767616; x=1715372416; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i/q/SogMvCoOqZoAt+GfE+x38sUg5iDJ97SmB2A6bj8=;
 b=UrpKY3p3tmQlKCcEn56z8WS1e9lP5GwbVZhgjeJKMGJxWLe0EnMkCSRSP3sP87ohX8
 0ax6Zy41Eyhy/eMRWWNAT9GxZzwlTX+9CXulmeUwo/VBOIXcrN/pOQph9HabBFOKaMgI
 dSaKHVrawiaSzg99Cg+R4A/AOBLfw6tNWuX/2z07M1RN58hM1bUW7jIcpi6ozWR6LyiP
 9N7qzZ35GWzcPH0z2HmA7n4eIg3VjRE8KfsWk1tZWisnlCe/rLXbFE2HYjw44ObQfV44
 3zTPQo1sdMMVniOgEz27ajLonbYEcMLoS0pg+29FRdZYY1n9mXUai+qULTSMcbNPZd5H
 X58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714767616; x=1715372416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i/q/SogMvCoOqZoAt+GfE+x38sUg5iDJ97SmB2A6bj8=;
 b=D/h+pQ5wGeTwLm7ZwoOEMTONoNhMPA9ZqgyC2OPUZ/wZn8OEUBImDdpw442OSYJtU6
 yIDLmW/qNaPcICtmJo18JbawxGcSe1Y/tT5m+s8IOr5BdwaY5TTiesIZHrWl1N7y3B+H
 +KwvAiurfR3UQKAJsGLsJooN/RU1vnNBqSCljeGacpaBRqTcbC36WYPytJ5IkZW8aFBe
 Zrw4dtHsYfC8m53x3qkJd5LNZkfqtrSlrmpZP0TcI6kmzEzMJY88NtuTKTD/BPNnAy8K
 aVHtp7Hahorm32RaxpG9Bl5gu7K1wrwJqmmAhNJSScsIxPW9pGESlNOL4Gaw189VT2vc
 QF2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeydXRY/ig9Kb/kwxcAyFyx2OF02B/GO1UgBql0hPqG3pURSgfekHz3cP5AviuvvkmS5Z8bjWzGBDBgnbz7wQqEMaol5Mhzupc/tAFOPhM
X-Gm-Message-State: AOJu0Yzi6cbWNvFknOYbu+tir+V8cJE7IITthjs6GdGOY2sCnF+I2G/J
 8mfKc9gcXQcovpJNM8J3Pq1aNjvgrRss5IKpVCMSy9YeJgNuoQh/9xSiWBAzRPNtXfO8OCjJvon
 7RqKsbrQFSzDLdNijCGeaW4z1evSax7u044JKOA==
X-Google-Smtp-Source: AGHT+IF12FMQpgSacsvMJfXaH57exZcVdrXcTVSS3Xjq/IP0kmCZmWj8nzgcfH/Kp8QpD6oWbL2jBz3ac6XWQ05VSLQ=
X-Received: by 2002:a5b:acd:0:b0:de6:1c59:bdaa with SMTP id
 a13-20020a5b0acd000000b00de61c59bdaamr4064323ybr.40.1714767616600; Fri, 03
 May 2024 13:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org>
 <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
In-Reply-To: <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 3 May 2024 23:20:05 +0300
Message-ID: <CAA8EJpp4x+NEpMAGtgOmu-0NY8ycTu0iQX6-1Vv76mkKPea_Cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files
 against schema
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 3 May 2024 at 22:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/3/2024 11:15 AM, Dmitry Baryshkov wrote:
> > In order to validate drm/msm register definition files against schema,
> > reuse the nodebugfs build step. The validation entry is guarded by
> > the EXPERT Kconfig option and we don't want to enable that option for
> > all the builds.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/ci/build.sh  | 3 +++
> >   drivers/gpu/drm/ci/build.yml | 1 +
> >   2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> > index 106f2d40d222..28a495c0c39c 100644
> > --- a/drivers/gpu/drm/ci/build.sh
> > +++ b/drivers/gpu/drm/ci/build.sh
> > @@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
> >   apt-get update
> >   apt-get install -y libssl-dev
> >
> > +# for msm header validation
> > +apt-get install -y python3-lxml
> > +
> >   if [[ "$KERNEL_ARCH" = "arm64" ]]; then
> >       GCC_ARCH="aarch64-linux-gnu"
> >       DEBIAN_ARCH="arm64"
> > diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
> > index 17ab38304885..9c198239033d 100644
> > --- a/drivers/gpu/drm/ci/build.yml
> > +++ b/drivers/gpu/drm/ci/build.yml
> > @@ -106,6 +106,7 @@ build-nodebugfs:arm64:
> >     extends: .build:arm64
> >     variables:
> >       DISABLE_KCONFIGS: "DEBUG_FS"
> > +    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
> >
>
> Wouldnt this end up enabling DRM_MSM_VALIDATE_XML for any arm64 device.
>
> Cant we make this build rule msm specific?

No need to. We just need to validate the files at least once during
the whole pipeline build.

-- 
With best wishes
Dmitry
