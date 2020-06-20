Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1D920253E
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 18:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1043F6E2EC;
	Sat, 20 Jun 2020 16:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C506E2EC;
 Sat, 20 Jun 2020 16:27:29 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e12so10221565eds.2;
 Sat, 20 Jun 2020 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/BMMpD7qtU5pkOn7Z4pc22pm3d3A2SjW9M7WNCHeAiY=;
 b=QVIIupKxa71Or8M1ClPfavFaWT0DeX7jreTr2LyxDbUbYAeTT4y0fkSdjacNshjutr
 BeMoZok/aRl/E36YP4z8utRYnCpQeJ5Aosyto1cXGGEwZB9Gra6J+qWzl386BId7q3Kb
 8zIuaryYutyw+jQVByn0gym1OPyOV3sBKxcJyokF47KHEjiSyBh68bw3mluJMNUxiviE
 l2IIgYY1n6WTEeHI9b0DBJl/ZMaQPepwgGW+9b4jLj3L9tvm3gZwBORH5uWTbppWk5Vy
 fg8a4rck24+F1awR4f3zwPG04llDWfBqgeOfpU4yIasIHqci9y8XaLPxj/eXRtObYhOw
 GO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/BMMpD7qtU5pkOn7Z4pc22pm3d3A2SjW9M7WNCHeAiY=;
 b=LVz1mWb+4YGCXJU9E5hR6rmucNOIpRP07U5/DAFSsbKtCyiTDpDuWaOpuPoLbougbm
 HYl35rc0fyIasbNJRwR3g2/7Flx/uUcFWTgVazq1EHxao2DWV0Uc7EeCQSEYxwEP2sLP
 gg+QFblozSvEV1toJcvvIaFlV/q1AkVRh0McGce19BdIgMcW94QmSe99ZbgM5RQqsTCi
 n+luR2DQ337xHdHSa0HPintBal6fJEC8bjOSZmIpnsAZ5+E0q9/oPfHlYn2fut7e1O/b
 ZIYdBHYh5i/4GKT6gSm/o9RgnIXm2WQF2hiVoteHFhvHdJOThJqV54L8R1Xlojk7pXTK
 A3ng==
X-Gm-Message-State: AOAM533sjNDCnwxFoLht+aD+JgMre810yEN039NvfK7xKv0FXaQOvYsA
 Jz3haT9Ed6yqS5iB9/aSsI2x8PgLwYa/NX5d5ZCV2eoOr3k=
X-Google-Smtp-Source: ABdhPJypOsgdt+fPQZQTGg7oTELjjmivaxGQ2UlMWlYWToihFkcE5WrbmvWFN/dybafH1Uk8WYjOZIkXCWzA5J5yOUI=
X-Received: by 2002:aa7:d952:: with SMTP id l18mr8585130eds.151.1592670447699; 
 Sat, 20 Jun 2020 09:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200528130816.1670-1-yuzenghui@huawei.com>
 <f1357380-9e98-4c1e-c1bf-a0a95bb5910d@huawei.com>
In-Reply-To: <f1357380-9e98-4c1e-c1bf-a0a95bb5910d@huawei.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 20 Jun 2020 09:27:56 -0700
Message-ID: <CAF6AEGun5DgsTzLRswxt2NRG9P+HVake0hQUKPR6czcNvc5LxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix usage of ERR_PTR()
To: Zenghui Yu <yuzenghui@huawei.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, wanghaibin.wang@huawei.com,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 20, 2020 at 3:26 AM Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> ping for this obvious fix...

Hi, thanks, but there is already a similar fix in msm-next:

commit aa472721c8dbe1713cf510f56ffbc56ae9e14247
Refs: v5.7-rc5-33-gaa472721c8db
Author:     Chen Tao <chentao107@huawei.com>
AuthorDate: Mon Jun 8 09:48:59 2020 +0800
Commit:     Rob Clark <robdclark@chromium.org>
CommitDate: Thu Jun 11 20:07:21 2020 -0700

    drm/msm/dpu: fix error return code in dpu_encoder_init

    Fix to return negative error code -ENOMEM with the use of
    ERR_PTR from dpu_encoder_init.

    Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
    Signed-off-by: Chen Tao <chentao107@huawei.com>
    Signed-off-by: Rob Clark <robdclark@chromium.org>


BR,
-R

>
> On 2020/5/28 21:08, Zenghui Yu wrote:
> > ERR_PTR() is used in the kernel to encode an usual *negative* errno code
> > into a pointer.  Passing a positive value (ENOMEM) to it will break the
> > following IS_ERR() check.
> >
> > Though memory allocation is unlikely to fail, it's still worth fixing.
> > And grepping shows that this is the only misuse of ERR_PTR() in kernel.
> >
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index a1b79ee2bd9d..a2f6b688a976 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -2173,7 +2173,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
> >
> >       dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
> >       if (!dpu_enc)
> > -             return ERR_PTR(ENOMEM);
> > +             return ERR_PTR(-ENOMEM);
> >
> >       rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
> >                       drm_enc_mode, NULL);
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
