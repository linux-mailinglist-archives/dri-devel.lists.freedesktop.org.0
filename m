Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7F074435B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCCD10E17E;
	Fri, 30 Jun 2023 20:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D843B10E17E;
 Fri, 30 Jun 2023 20:41:57 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b8a6ca994eso759106a34.1; 
 Fri, 30 Jun 2023 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688157717; x=1690749717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hei6z5b4CckyhDST/cotdRvq7xJLORaeNw4Fjc7LJac=;
 b=qqpEc0UHC1Pn4HYeR/nCpyWwl1XTPXm6yo7Prv9WxE4SFrVABUui5vEnzQfaBQqq18
 CopnejN3jW7Xq7rQgVzskJQgOtevz3olqA9fmOJpxNDX4NFLxcqjWSfrdn87OPWCE/yK
 OKiUA6LVeBbDRsORPWuH8rt7lsFNS3WpmdIlMtY3U9TaY8KjAnP30tNfWTwFSakFYkfG
 Uw/B8olBlSDdXwDVq+4+rFSu6QIfhBjU7W5VTpGd5wpojXSjjHJ9KfZNSkemoQ92LlCi
 c4lMYH7dbIt0R24D+z6BPUjqIgPYkuxhC5gMQLOHc0q/Em/hSl69QTu2/38SD+fzmfP3
 CJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688157717; x=1690749717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hei6z5b4CckyhDST/cotdRvq7xJLORaeNw4Fjc7LJac=;
 b=EqUroiNkL2JKW6fLkKYKmslcu7/yJgY9XsLkY9Mh/NNiX1OzYuCMNGfS/ie+ixxUy4
 +sShkjYF/cO8FE+9+71hA3FGpLC1akUuOsEccKtbZ1JPrJB7/IsjZuo7y9xK67E3D415
 xWS/8X76e14qmNpLONnxAyzBo492lkK63PLibtMEf9FQ3zP8ruTw2pQH9v+C3qktEu8d
 CKZrnGO+ZldBgDIx80UIH7hBalVXd6HrN51m8Xu/r+WbREEFHJhWRSNQqjFvdHoB4ZAs
 xWc+1uqDMWZXyNWAbDfwRQ+xRNcpoBK3kSzZ8VwMhmhWQs1FmjJUAqS30U3bwAJAQfcD
 Qxqg==
X-Gm-Message-State: ABy/qLZlWBlDr6tWXoqtCrtHaXYxKdPKaE2NwDlAk16asx6DoDCFlbc+
 PW8qwnakZijCFMvw3kF4exbrG99uPyerpERXt6A=
X-Google-Smtp-Source: ACHHUZ4aVwFnH3AO8hYQb728JRge1w32PAsmLUhEcQEnMEUqiTkxHgWJnzSzNRrmiAzZuYJh2YYBAlM5pxy3rrE+wYY=
X-Received: by 2002:a05:6870:b6a5:b0:1ad:565f:df6c with SMTP id
 cy37-20020a056870b6a500b001ad565fdf6cmr4974801oab.46.1688157716743; Fri, 30
 Jun 2023 13:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-a635-v1-1-5056e09c08fb@linaro.org>
 <ef074384-1eee-ec88-b02f-c4ada72037a4@linaro.org>
In-Reply-To: <ef074384-1eee-ec88-b02f-c4ada72037a4@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Jun 2023 13:41:45 -0700
Message-ID: <CAF6AEGug0rrX4BV8=XEV2hZw_C3+W+4WV=2bSADzF5rnsoTS0g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Assign revn to A635
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 28, 2023 at 12:54=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 28/06/2023 22:05, Konrad Dybcio wrote:
> > Recently, a WARN_ON() was introduced to ensure that revn is filled befo=
re
> > adreno_is_aXYZ is called. This however doesn't work very well when revn=
 is
> > 0 by design (such as for A635). Fill it in as a stopgap solution for
> > -fixes.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I'd have probably added:
>
> Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified
> before being set")
>
> or
>
> Fixes: 192f4ee3e408 ("drm/msm/a6xx: Add support for Adreno 7c Gen 3 gpu")

I'd lean towards the former, given that this is a temporary workaround
until we do a more comprehensive overhaul and remove revn entirely

BR,
-R

>
>
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index cb94cfd137a8..8ea7eae9fc52 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .address_space_size =3D SZ_16G,
> >       }, {
> >               .rev =3D ADRENO_REV(6, 3, 5, ANY_ID),
> > +             .revn =3D 635,
> >               .fw =3D {
> >                       [ADRENO_FW_SQE] =3D "a660_sqe.fw",
> >                       [ADRENO_FW_GMU] =3D "a660_gmu.bin",
> >
> > ---
> > base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
> > change-id: 20230628-topic-a635-1b3c2c987417
> >
> > Best regards,
>
> --
> With best wishes
> Dmitry
>
