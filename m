Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC0767087
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 17:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3811C10E719;
	Fri, 28 Jul 2023 15:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE17410E718;
 Fri, 28 Jul 2023 15:29:33 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe1a35a135so3146811e87.1; 
 Fri, 28 Jul 2023 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690558172; x=1691162972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWY5MitYzqJ4d1bWl5n1gXmIbqPwv+V3mvdT6pw4Joo=;
 b=spL3/dRcoa3f8wiIiP4KqpRnJi5z+v7W8ANf+zhQjBOBZZo931y9+BgkQkiNBesEtg
 atYPhabihDsA3VLHbn7Dz08mDbJGqwdJPsliHSHanX0fVDB6WEFf1WnCiJjkrk195LtG
 WimZisfkapB/STS57H7637OhqQ5SuV1fA3uiQCk5QwCD5Lc/bSizj6/trIl/g6AxU2H2
 FiUnXlPE6e9l1sKVkqU0w9etFNmp1tDgw/etFEND+xo7SPaVF0cHQe0smbkpyBNQMLHS
 quujH7k9Vk0rZwusd+jLvaKgIonLmUT/JCeO+57s/O/3oTEGSuPTvF3Khbc8HTkvrCxO
 gBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690558172; x=1691162972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWY5MitYzqJ4d1bWl5n1gXmIbqPwv+V3mvdT6pw4Joo=;
 b=LXV/LjVdOsy0ymw7egkcLJRaMz60V1IJpyo98AV2r62abEzsO+RkBoJa5hS0vazKnM
 hwlXXEIwXOAgJHMOKqEm4Zy6eT6/H6Ad9RfoEmF41s2uRTEZeoxjvzdvPTI1vSsTJQGZ
 K6Tc5Ebc74hWwEJEyfgyoYhSBLRRndBonrCBmHP+UVg6cZqXUknkk2/FEmB2h5V6L0zP
 MFr2WiS2z0Q/QY9UyRbgqbaCA0WhpKgkbZ6vaGjaUOCHEGKZ/WwsGMKuTcZ9XxNO2/kq
 Txe2eOnInUuNm3O/HiAd66nxvwZyKiSTbDLY3REdjU69RBtO4fnORprCMfmVrn/cwwPR
 BlWg==
X-Gm-Message-State: ABy/qLYWTQmCh7OvpXfsuJu7AxUoRz+61J6IcckLa64ATW8HYElDeW2c
 INoR46/TdzYyxxIwwtF6IgN9BQHz8JPeGmvLMZc=
X-Google-Smtp-Source: APBJJlG9HA1renQSWWmK4jFIFA634+RbkACkuwQYa0S4sEwxKAw6D1WHjQhQGkb90LkAwDcSFZFj21mMVuuM+mbHCA4=
X-Received: by 2002:a05:6512:2253:b0:4fd:faa5:64ed with SMTP id
 i19-20020a056512225300b004fdfaa564edmr2283534lfu.11.1690558171553; Fri, 28
 Jul 2023 08:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230727212208.102501-1-robdclark@gmail.com>
 <20230727212208.102501-13-robdclark@gmail.com>
 <08cd9bb5-678f-e03e-4598-dd1785f0d7a7@linaro.org>
In-Reply-To: <08cd9bb5-678f-e03e-4598-dd1785f0d7a7@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 28 Jul 2023 08:29:19 -0700
Message-ID: <CAF6AEGu-aRzi6ADqCnLU46DC0ZoWmSmhYU2sZj83wTyTbazbxg@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] dt-bindings: drm/msm/gpu: Extend bindings for
 chip-id
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 12:27=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/07/2023 23:20, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Upcoming GPUs use an opaque chip-id for identifying the GPU.
>
> Examples?

We'll know when we bring up the hw.  But the main point is that we
shouldn't expect, for example, the high 8 bits to tell us the
generation, any more than we could if it was a pci id.

We may not end up needing to use this new binding much, I _think_ we
should be able to read it from the fw in most cases, at least for
android devices.  I'm unsure at this point about windows/chromebooks.

> Anyway, I think we should insist here of using something human-readable,
> even if Qualcomm/Adreno internally use some weird numbers.

I mean qcom,sc8280cx-adreno is human readable but not really very
informative.  Encoding the chip-id is just a way to avoid the
qcom,chipid field in the bindings, which qcom used downstream.  The
new pattern accomplishes the same thing as the existing one, but
without trying to imply some meaning that becomes increasingly
non-existent as qc moves to decouple the id from marketing names.

> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/D=
ocumentation/devicetree/bindings/display/msm/gpu.yaml
> > index 58ca8912a8c3..56b9b247e8c2 100644
> > --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> > @@ -13,6 +13,12 @@ maintainers:
> >  properties:
> >    compatible:
> >      oneOf:
> > +      - description: |
> > +          The driver is parsing the compat string for Adreno to
> > +          figure out the chip-id.
> > +        items:
> > +          - pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-=
9a-f][0-9a-f][0-9a-f][0-9a-f]$'
>
> {8} should work?
>

so '^qcom,adreno-[0-9a-f]{8}$'

BR,
-R

>
>
> Best regards,
> Krzysztof
>
