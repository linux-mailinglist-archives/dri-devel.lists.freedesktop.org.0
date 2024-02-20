Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F12F85BF72
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E28210E4A6;
	Tue, 20 Feb 2024 15:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z2U0+Vhw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9293410E4AB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:08:03 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-60869c68926so6229367b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 07:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708441682; x=1709046482; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aqJwFAkkc43vrSyN9lwc8naI853QjkeHrfLLwt5JeQE=;
 b=Z2U0+VhwmldL9ytR3qDPnbTSD3i+7bx9FMk12kI0NVIw82ctbitKVbGGZl2iXEWAed
 Uuu2BZs13IN8mzBsqANiiyGrGRgfr8gelqvE9NlWT4WjEp//yXTGWCXNiFxW6/wjpq76
 ljpaah0YvptQ433RAEC7op8t3kn2nNWlAQShPWVw686RH5BUz2Dx17eruvRjqYDAU+kM
 B5KtgVdi25eQdoUrybOpKL8/I2WnXJlI3MzCQvkJkmnF/EbVlLvdAsLySmfl9yJwVLbt
 R6S72/kf459fCLU9mg8mBXZ4Sp2aME6RdWUT5LJI2P7uWSiGRQElYgI7yWOtDO3WMNNs
 qz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708441682; x=1709046482;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aqJwFAkkc43vrSyN9lwc8naI853QjkeHrfLLwt5JeQE=;
 b=Fogyw9NaPFob+suONlzrLJNGbwm/l1SWmbqOL7lJgTYtJaEyyxzK75PDgiGuPg5owr
 1QJ+g9qj5m1w7ZF5JZUzLPtjZOUR9GCTdr3V6FHMsjbFtRpFe5qRVV/RTNfYwsVTLCyd
 ngI1GD4ZPmvOye9Vd1TVOHjNYLPQQycvMCmIM9aJ2u4Lin7VdIEw8Wx5ey40Jww4tUr6
 xA1KRlqfv9A6KgVFTqOo3Ar4eqKBpp0f9YIiOevH4C5Q2fjqXT5V38RaBpz0enhoXYB5
 QRg2PoGUXUZbSaQvFb80vCiMZMWOqzTc451+XludYFjSlwbXNa//gsY8XlhC9h0nZZPt
 svKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOlSes1NDFzxQJFf5hnJWED2krmELqk3rlWmunZrC0aLQRnG8mjKU56EMklNsdlqGxD3vyvP/0IqOqs3g6evT0ADKjZC2ij/c9xApjjVv9
X-Gm-Message-State: AOJu0YwTZULzf8W/x8PVNMHX6Hh/14lyTWuFjU+QitExmiy2kcuWUI1b
 0KZHlt0lr4/jdrZvGKHKS8Fh7OtGNL540jN+4bQ3SZiEi76OZwbTs+EIAof33kW9UVKiNmLxx/4
 WpuvWRdSoX8x9eWVQeeQ5+lSQoR8Hgy+R9eAGyQ==
X-Google-Smtp-Source: AGHT+IHdekKqXY/wwhv1RRDJOaN+kUY/5Ujob9vjM/5eL8M11cX2uP3kIvac0Jr5M2dmGLVcBO8zTmi1JscWBwxIIoI=
X-Received: by 2002:a05:690c:f90:b0:604:9551:f595 with SMTP id
 df16-20020a05690c0f9000b006049551f595mr16731907ywb.50.1708441680946; Tue, 20
 Feb 2024 07:08:00 -0800 (PST)
MIME-Version: 1.0
References: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org>
 <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
In-Reply-To: <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 17:07:49 +0200
Message-ID: <CAA8EJpqaWHVqf8+EbkBktftPzPU0qq00PGhsoxYztRFuXDHv7w@mail.gmail.com>
Subject: Re: [PATCH] drm: ci: uprev IGT
To: Helen Koike <helen.koike@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
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

On Tue, 20 Feb 2024 at 16:31, Helen Koike <helen.koike@collabora.com> wrote:
>
>
>
> On 20/02/2024 09:17, Dmitry Baryshkov wrote:
> > Bump IGT revision to pick up Rob Clark's fixes for the msm driver:
> >
> > - msm_submit@invalid-duplicate-bo-submit,Fail
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Do you have a gitlab pipeline link I can check?

For the drm/msm, same as before (it had this fix in). But at this
point I should probably run it again for the full set of devices.

>
> Thanks
> Helen
>
> > ---
> >   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> > index 8b82e6656924..47e567b4f7a7 100644
> > --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> > +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> > @@ -5,7 +5,7 @@ variables:
> >     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
> >     TARGET_BRANCH: drm-next
> >
> > -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
> > +  IGT_VERSION: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2
> >
> >     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
> >     DEQP_RUNNER_GIT_TAG: v0.15.0



-- 
With best wishes
Dmitry
