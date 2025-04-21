Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A28A95716
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 22:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B88C10E49B;
	Mon, 21 Apr 2025 20:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l2UHivF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006A610E499;
 Mon, 21 Apr 2025 20:14:06 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-85e46f5c50fso27998239f.3; 
 Mon, 21 Apr 2025 13:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745266446; x=1745871246; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUYYVHs0K9sSiocJ6t2874qRQrS2PCPz1Ru+t8N0kRY=;
 b=l2UHivF/W2ztWcOgyUIymHKaNX2PSEwMXFjn/8G7Nmf7s9kK1JesAiiD6ALUb6Svkw
 ONLfkoGeTz9FGK6H/u7SJUMlpLPca5pFe7eOslH6rAfFL6VZhoBwN8/TUE6CToHLu7tw
 Re9T/Ab+wKMKbLQLVsRr4FBRWLmO7N0Hf7VbPZPXOXO2Y2rr3OBANJ8wSm45QHq09Vq0
 IHqdK1S9CEVdenQdCy0oCffCwRs/kydlroIYnnXvPKiSJJ29tZYI5ROCq6yYJPyDpN3H
 B2IgrFzxB4ly6RxVo9ki5HV0ciQyrho3a3CQSNNE5crkxrPl3RQmtwptuUk9aXQbEii/
 ANcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745266446; x=1745871246;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BUYYVHs0K9sSiocJ6t2874qRQrS2PCPz1Ru+t8N0kRY=;
 b=iJwVREDoLTs/Fr3zSjRYQljYT+o8jVzTDgY9V5kB6QYpgIrfvSnfGYx477I9iaSV07
 l7Y//UryE5KAlauWfGlUhgScHCHUQEOrhtRZ6OyGiXjo/UknRdN03F0LskaacERCC64m
 +rZZ9yYn+IedJS8CbF9l7/iNCz81qxTeNplKAfGwGnSug1CEuy4XirDD0MRF68lURhtx
 sPiRqjOLSymkOvyMxU0r0/EBPwpFRbu6K1zH+4SP4O3mqiNlH4QJGXFJzN3umFzgllcK
 uNe8QV9PWdPGbq1CXBD6TtYq7D9S6QxkXyP15KZw77Ckpgwuoooogq/zeERR2CrQH2FA
 tSIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxzeFGdkTQWaSBiXvwRLZ5DTaMOJVuq0gwqQ8upSXwPdEKkpPhWEA3plh6HUQs0pdbWgRDrluhM5I=@lists.freedesktop.org,
 AJvYcCX34SWLbpFC4jNdKQupvXX6VdGmOZurGjxSM2KRmTRb9wdIAyEcrypJT6gGJhTSIA+RGiIC54Wk2/3m@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYQ54DZv3DyRZEuUojOkepHEv5BEx5F/uone4Id97IrWMVW/aI
 4hteVTVvajAWtR7mFN8eWMrNfnZIex07zg1ZuWy+NTJ4pnvurG9NuSpN+NU39ViccqEFsk0yxRF
 Gg3J2K17+8nSn76zvqF66sejPars=
X-Gm-Gg: ASbGncu+YNzZL8jcT4J/Z9H7pz9TzPHoyGlEUuFh+DvvnLc9rIKnSX5PBtFZioiHkv2
 44K/m/CWvzcRaXKgA4SkYkJnBdteL44WF+vK1Bc0KYxjLMv8q/0zxIn2c+B7515R3ibqBGFhhS5
 NRanJEXfXQFDzlQXTJPBbwiC02+Bppqjes+/phNomeMLzMRtRjP1gT
X-Google-Smtp-Source: AGHT+IFsMVrEWpfqecECl7zT5OQiMCWupejKs7VtqS5rGjPbaevtE5TQaBYY4Va6/egz7G5xy7YIPaM/LB4LD1cYPlU=
X-Received: by 2002:a92:ca48:0:b0:3d3:e287:3e7a with SMTP id
 e9e14a558f8ab-3d88ee5e3c8mr132413655ab.19.1745266445839; Mon, 21 Apr 2025
 13:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
In-Reply-To: <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 21 Apr 2025 13:13:53 -0700
X-Gm-Features: ATxdqUEM_DlVLZMehZNCyiqvxRBh4hgHu9s9MhnYMEPwKOXfVEAoGtGXkOlFs7c
Message-ID: <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-hardening@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

On Fri, Apr 18, 2025 at 9:00=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 4/18/2025 6:40 AM, Connor Abbott wrote:
> > On Thu, Apr 17, 2025, 1:50=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quic=
inc.com> wrote:
> >>
> >> On 4/17/2025 9:02 PM, Connor Abbott wrote:
> >>> On Thu, Apr 17, 2025 at 3:45=E2=80=AFAM Akhil P Oommen <quic_akhilpo@=
quicinc.com> wrote:
> >>>>
> >>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> >>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>
> >>>>> The Highest Bank address Bit value can change based on memory type =
used.
> >>>>>
> >>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
> >>>>> default (the one used prior to this change) on error.
> >>>>>
> >>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>> ---
> >>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu.c
> >>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20=
ae5f8f5e57f38ecc62d9f 100644
> >>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>> @@ -13,6 +13,7 @@
> >>>>>  #include <linux/firmware/qcom/qcom_scm.h>
> >>>>>  #include <linux/pm_domain.h>
> >>>>>  #include <linux/soc/qcom/llcc-qcom.h>
> >>>>> +#include <linux/soc/qcom/smem.h>
> >>>>>
> >>>>>  #define GPU_PAS_ID 13
> >>>>>
> >>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu =
*gpu)
> >>>>>
> >>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>>  {
> >>>>> +     int hbb;
> >>>>> +
> >>>>>       gpu->ubwc_config.rgb565_predicator =3D 0;
> >>>>>       gpu->ubwc_config.uavflagprd_inv =3D 0;
> >>>>>       gpu->ubwc_config.min_acc_len =3D 0;
> >>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno=
_gpu *gpu)
> >>>>>           adreno_is_a690(gpu) ||
> >>>>>           adreno_is_a730(gpu) ||
> >>>>>           adreno_is_a740_family(gpu)) {
> >>>>> -             /* TODO: get ddr type from bootloader and use 2 for L=
PDDR4 */
> >>>>>               gpu->ubwc_config.highest_bank_bit =3D 16;
> >>>>>               gpu->ubwc_config.amsbc =3D 1;
> >>>>>               gpu->ubwc_config.rgb565_predicator =3D 1;
> >>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adren=
o_gpu *gpu)
> >>>>>               gpu->ubwc_config.highest_bank_bit =3D 14;
> >>>>>               gpu->ubwc_config.min_acc_len =3D 1;
> >>>>>       }
> >>>>> +
> >>>>> +     /* Attempt to retrieve the data from SMEM, keep the above def=
aults in case of error */
> >>>>> +     hbb =3D qcom_smem_dram_get_hbb();
> >>>>> +     if (hbb < 0)
> >>>>> +             return;
> >>>>> +
> >>>>> +     gpu->ubwc_config.highest_bank_bit =3D hbb;
> >>>>
> >>>> I am worried about blindly relying on SMEM data directly for HBB for
> >>>> legacy chipsets. There is no guarantee it is accurate on every chips=
et
> >>>> and every version of firmware. Also, until recently, this value was
> >>>> hardcoded in Mesa which matched the value in KMD.
> >>>
> >>> To be clear about this, from the moment we introduced host image
> >>> copies in Mesa we added support for querying the HBB from the kernel,
> >>> explicitly so that we could do what this series does without Mesa eve=
r
> >>> breaking. Mesa will never assume the HBB unless the kernel is too old
> >>> to support querying it. So don't let Mesa be the thing that stops us
> >>> here.
> >>
> >> Thanks for clarifying about Mesa. I still don't trust a data source th=
at
> >> is unused in production.
> >
> > Fair enough, I'm not going to argue with that part. Just wanted to
> > clear up any confusion about Mesa.
> >
> > Although, IIRC kgsl did set different values for a650 depending on
> > memory type... do you know what source that used?
>
> KGSL relies on an undocumented devicetree node populated by bootloader
> to detect ddrtype and calculates the HBB value based on that.

Would it be reasonable to use the smem value, but if we find the
undocumented dt property, WARN_ON() if it's value disagrees with smem?

That would at least give some confidence, or justified un-confidence
about the smem values

BR,
-R

>
> -Akhil.
>
> >
> >>
> >> I have a related question about HBB. Blob driver doesn't support
> >> host_image_copy, but it still use HBB configuration. I was under the
> >> impression this was required for UMD for compression related
> >> configurations. Is that not true for turnip/freedreno?
> >>
> >> -Akhil.
> >
> > AFAIK the HBB (as well as other UBWC config parameters) doesn't have
> > any impact on layout configuration, so the UMD can ignore it except
> > when it's doing CPU texture uploads/downloads. We certainly do in
> > freedreno/turnip. You'd have to ask that team what they use HBB for,
> > but my best guess is that the GLES driver uses it for CPU texture
> > uploads sometimes. That is, the GLES driver might be using
> > functionality similar to host_image_copy "under the hood". It's
> > something we'd probably want for freedreno too.
> >
> > Connor
> >
> >>
> >>>
> >>> Connor
> >>>
> >>>> So it is better to
> >>>> make this opt in, for newer chipsets or those which somebody can ver=
ify.
> >>>> We can invert this logic to something like this:
> >>>>
> >>>> if (!gpu->ubwc_config.highest_bank_bit)
> >>>>     gpu->ubwc_config.highest_bank_bit =3D qcom_smem_dram_get_hbb();
> >>>>
> >>>>>  }
> >>>>>
> >>>>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> >>>>> @@ -2467,6 +2476,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_dev=
ice *dev)
> >>>>>       bool is_a7xx;
> >>>>>       int ret;
> >>>>>
> >>>>> +     /* We need data from SMEM to retrieve HBB in calc_ubwc_config=
() */
> >>>>> +     if (!qcom_smem_is_available())
> >>>>> +             return ERR_PTR(-EPROBE_DEFER);
> >>>>> +
> >>>>
> >>>> We should add "depends on QCOM_SMEM" to Kconfig. Is SMEM device pres=
ent
> >>>> in all Qcom SoC devicetrees? I wonder if there is a scenario where t=
here
> >>>> might be an infinite EPROBE_DEFER here.
> >>>>
> >>>> -Akhil.
> >>>>
> >>>>>       a6xx_gpu =3D kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
> >>>>>       if (!a6xx_gpu)
> >>>>>               return ERR_PTR(-ENOMEM);
> >>>>>
> >>>>
> >>
>
