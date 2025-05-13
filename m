Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8EBAB5F02
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 00:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4858210E5ED;
	Tue, 13 May 2025 22:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jPcYWrQ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B833110E21D;
 Tue, 13 May 2025 22:06:42 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3d96d16b369so56687775ab.0; 
 Tue, 13 May 2025 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747174002; x=1747778802; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3NSr3zCVYmv0aPTkXL+9a8Y73rmWDloOCZ1MASrXE/Q=;
 b=jPcYWrQ2zjH7qj9OOgHETc4w+K1C9oL520czEgqWwMtSdNTdHwIRI2eWPDJbVOpAtt
 nNS/3U7D4r77mnPc3yPy9BhVgJkjt/ty63WqWoEfWgQOE/jHuPdAEGqgdMh0Eo6FLZxV
 bQRF1czHfxlDZPJ5gfhnynef/xpDoZX9o2ofVNFKOwdwjIHHKHhbe/YzioFZCD0nU0cu
 PVdGMCttR7dO4VXc3TSpk6ItAibBRYYTE6Q10l0UBI8oOlb+uIfriuTblDcanQAiQ6Wq
 xdaVQBbBoP8W6OhVX9G6TCn9d1MJHySihB6WmoBPxbAsDv4R9NNN4sMtWLyOl+/ApBih
 E5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747174002; x=1747778802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3NSr3zCVYmv0aPTkXL+9a8Y73rmWDloOCZ1MASrXE/Q=;
 b=saskZlv9QLfh6EH6fKCx4t4a0j/8i1WQZXuvXnyzJAyLjtEsqQyZQ4EYQz+m0yfdZT
 E+LQblXKzTs+0e035ao6AnpKGpgpnt+bQr9coRu7bVMzwyFlvEpV/AbfRAGid6qMJvIj
 tyhJX5LAhnnuNCdkoBcpyEtXmCUt5dT3dd2fFb5FfCOSC37u8DJLLI4p6G1OOxQRy50Q
 sTr7+ciSql7KoDjkIAfqFmlArH0l7T3/BytMOLdz5H7AHZtFyDQEBv60NYtvvWwEWBN6
 YBtDJpptqpng9K9hWMY8kOHebQXnMcDJi0DxB/FycrxHP4vhTUEog+2hVL8MDE2eylhH
 x6ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVARH6bZI8cvn5lG/FKqNIdzeOKP8YAKHHOuMwWNGzT43U2Vg6S3lLlwqveqSuEefsykPAMpiV9+Dg=@lists.freedesktop.org,
 AJvYcCXl8xzPFkueXEwmQCv4xSyk1QeNvF24fi36HPdVLAsr0UMDHbgCxxjpykApsDS7H95cxG4iyNTgGwLM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsK3yABFJa/8Sv/Np02IwSjoSiEPsOrL7NrZW6i66fJtFnPkHa
 j6c5OOKuMaJdxmvs3kkVA/FGNSo8guDnRRi5l15KHUdTE4BncPyznDJKR3v1auhe1OMVuyNrXYM
 AcrXgVJfCt13+c1TaLKjpQyVak7o=
X-Gm-Gg: ASbGncvcLpPi/GhF8bo5XNkc0VmusYfdX92OvLAnYtvNvEw0oqxGro1Kr0zf4xgTljd
 TMFc8FbVcNfA0m/ubq0+fLSxtP+vO6onqh7WXvPFtQzCLgSKfZMpofqhzE/uBVyI9bj3sEhS1bE
 8sfHLTE57SloI7Zf+RDM8cL/2U4LJ32IEgp9Y18xJxe3g6Imxqhb48FXI96cjDG9w=
X-Google-Smtp-Source: AGHT+IHH8XMbXywE7+ILVKsYc3F5InxyGAMPOhQYjsvCcY4gyCKCsqusIh3q+72eHNXy24eHEUamlkcX0NT6vD5p55w=
X-Received: by 2002:a05:6e02:17cc:b0:3d9:43fe:8e49 with SMTP id
 e9e14a558f8ab-3db6f7a54bfmr16529165ab.8.1747174001762; Tue, 13 May 2025
 15:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
 <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
 <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
 <b7bd0f7a-854b-4464-abd6-51f932ee2998@oss.qualcomm.com>
In-Reply-To: <b7bd0f7a-854b-4464-abd6-51f932ee2998@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 May 2025 15:06:18 -0700
X-Gm-Features: AX0GCFsyH0dODUBB_8dHA6zkgfgnHu6B6D4Rxp3wAqz4e7AWlwmSCMHzcPSjotw
Message-ID: <CAF6AEGuDBdmyS+N4pR3gEYz0mSLkKqYZjCASk8am2atdGKq5UA@mail.gmail.com>
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 9, 2025 at 10:00=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/9/25 3:52 PM, Rob Clark wrote:
> > On Fri, May 9, 2025 at 5:31=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 5/8/25 8:41 PM, Rob Clark wrote:
> >>> On Thu, May 8, 2025 at 11:13=E2=80=AFAM Konrad Dybcio <konradybcio@ke=
rnel.org> wrote:
> >>>>
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Start the great despaghettification by getting a pointer to the comm=
on
> >>>> UBWC configuration, which houses e.g. UBWC versions that we need to
> >>>> make decisions.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
> >>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
> >>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
> >>>>  3 files changed, 23 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm=
/msm/adreno/a6xx_gpu.c
> >>>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d62=
14366cfbd22d5bcf4bc7 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu =
*gpu)
> >>>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), =
protect->regs[i]);
> >>>>  }
> >>>>
> >>>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>  {
> >>>> +       /* Inherit the common config and make some necessary fixups =
*/
> >>>> +       gpu->common_ubwc_cfg =3D qcom_ubwc_config_get_data();
> >>>
> >>> This does look a bit funny given the devm_kzalloc() below.. I guess
> >>> just so that the ptr is never NULL?
> >>
> >> Yeah, would you prefer this is changed?
> >
> > I think having an all zeros ubwc cfg isn't really going to work
> > anyways, so probably drop the kzalloc().  Or if there is a case that
> > I'm not thinking of offhand where it makes sense to have an all 0's
> > cfg, then add a comment to avoid future head scratching, since
> > otherwise it looks like a bug to be fixed.
>
> So my own lack of comments bit me.
>
> Without the allocation this will fall apart badly..
> I added this hunk:
>
> ---------------------
> /* Inherit the common config and make some necessary fixups */
> common_cfg =3D if (IS_ERR(common_cfg))
>         return ERR_PTR(-EINVAL);
>
> *adreno_gpu->ubwc_config =3D *common_cfg;
> ---------------------
>
> to get the common data but take away the const qualifier.. because
> we still override some HBB values and we can't yet fully trust the
> common config, as the smem getter is not yet plumbed up.

So I get that common_ubwc_cfg is the const thing without fixups (and
agree that it should say const), and ubwc_config is the fixed up
thing.  But don't see how that necessitates the zeroalloc.  Couldn't
you just:


  if (!IS_ERR_OR_NULL(adreno_gpu->common_ubwc_cfg)
    adreno_gpu->ubwc_config =3D *adreno_gpu->common_ubwc_cfg;

> I can add a commit discarding all the HBB overrides (matching or not)
> or we can keep the zeroalloc around for some time (i'd rather keep
> the function returning const so that when things are ready nobody gets
> to poke at the source of *truth*)

We can keep the overrides to start (although the goal should be to
remove them).. but qcom_ubwc_config_get_data() not finding anything
seems like more or less a fatal condition.

BR,
-R
