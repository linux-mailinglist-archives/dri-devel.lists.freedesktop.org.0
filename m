Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E966A530EBD
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 14:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1C910F4D5;
	Mon, 23 May 2022 12:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EAF10F4D5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 12:55:11 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-30007f11f88so15175647b3.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 05:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eDfy6GqpIfaV2D3gJJczHKjLm3vz3xNZVsVwjBEGHAk=;
 b=XIWqezSV7/NwqmML1vVCi0to8RMc5lNXcUXL3XQPhELyW8dZA2LQAyULwEy2suR0zv
 4uTa57OMPSrjxlJqoLkarNGhJ1s2VlBJHr5Uohuh1UK6t+KvLBJSqGqaCgIGBe6X6HX8
 7EHOYuIukYNOkAEzGhpUyQKgCZKhz5RSMLdOGlJ9aY51zDwLPbPeL+Vy6nmgi+bRbXQw
 3kebQnfjJFdKtMuPHRc7tdKjjPxjL0mvrk9LkQwzKO1nlGQTAJZ0dZ3dc7/K6MeXf6qy
 uJuqKW2ViFJu/C7jbivSInZuS+x4nvyloC8O9pwsFF9ffZlwoceQ9Trju2vJlwI1h+4O
 kcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eDfy6GqpIfaV2D3gJJczHKjLm3vz3xNZVsVwjBEGHAk=;
 b=YA6n0dz9nPFwwV793vRGXZTUQiFXrLVcT5dIUfMJpHS+TDUAkb8mMhyEMrVAZkrrsn
 Ogv5Nt/+5oXxpfYHJv9t59aYZF0K6QLftuWQRyHKU0BxzMy+nIai8AAVr0gS34G9DOId
 WHFBe6k680EFXnOzjJIXZcHH6Q7xGgFSaZ9bWHSu3OHMlZ5GsckZJxcddDjGJNDCT+pC
 oUJJSVl7TyaqxMakPSOwkrcsydwD0qtQUGbPS8u/Le7o4RrcIqSipEDVBdE2i6qRiPsJ
 scI6Y8ArfW4BZaKUkCZmWRijux07CjqG4oI7z+ST6uEcdI31rXuEefYdfKXytHILHasK
 azhw==
X-Gm-Message-State: AOAM533rPP8Ec53hW1TdvZ+07vt2oDOuMBmKDPIHfLrUjaw1asYwuPE7
 lcTid/CRLNx3txZM73m0Bp51nWPOVhPsNYAt0faJgw==
X-Google-Smtp-Source: ABdhPJzy078pPsAixd7aoHZE4fZKF4ic8N0z/2T9Yw3r8eUBViOKz7NYD0OqMiHkS7D5dBNqQ6QLB2GiEpY/njCXIlo=
X-Received: by 2002:a81:c07:0:b0:2ff:8a7b:f37c with SMTP id
 7-20020a810c07000000b002ff8a7bf37cmr15476962ywm.118.1653310510641; Mon, 23
 May 2022 05:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220506123246.21788-1-yuehaibing@huawei.com>
 <CACRpkdZUwfVNZyS6RgcupJ+TRUZVM+1_3ABj_-f_3+v+wNE6mg@mail.gmail.com>
In-Reply-To: <CACRpkdZUwfVNZyS6RgcupJ+TRUZVM+1_3ABj_-f_3+v+wNE6mg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 May 2022 14:54:59 +0200
Message-ID: <CACRpkdaKrk+cj9Yvpe3kmR1iJFczi-yckHiKeLGu9F=hRFiU9w@mail.gmail.com>
Subject: Re: [PATCH v2 -next] drm/display: Fix build error without CONFIG_OF
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 23, 2022 at 2:46 PM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> On Fri, May 6, 2022 at 2:33 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> > While CONFIG_OF is n but COMPILE_TEST is y, we got this:
> >
> > WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
> >   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && OF [=3Dn]
> >   Selected by [y]:
> >   - DRM_MSM [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && (ARCH_QCOM || S=
OC_IMX5 || COMPILE_TEST [=3Dy]) && COMMON_CLK [=3Dy] && IOMMU_SUPPORT [=3Dy=
] && (QCOM_OCMEM [=3Dn] || QCOM_OCMEM [=3Dn]=3Dn) && (QCOM_LLCC [=3Dy] || Q=
COM_LLCC [=3Dy]=3Dn) && (QCOM_COMMAND_DB [=3Dn] || QCOM_COMMAND_DB [=3Dn]=
=3Dn)
> >
> > Make DRM_DP_AUX_BUS depends on OF || COMPILE_TEST to fix this warning.
> >
> > Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus su=
pport")
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>
> Patch applied to the DRM tree.

Nope, failed:

$ dim push-branch drm-misc-next
dim: ac890b9eeb9b ("drm/display: Fix build error without CONFIG_OF"):
Fixes: SHA1 in not pointing at an ancestor:
dim:     f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus supp=
ort")
dim: ERROR: issues in commits detected, aborting

I don't know what to do with this, sorry. The other committers are maybe be=
tter
with this kind of situations. I think it is designed to stop me from
shooting myself
in the foot.

Yours,
Linus Walleij
