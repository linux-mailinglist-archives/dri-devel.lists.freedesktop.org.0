Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636EAA98E69
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD14010E6CC;
	Wed, 23 Apr 2025 14:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PyeCJKqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF3E10E6CB;
 Wed, 23 Apr 2025 14:55:53 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-85e15dc8035so162988739f.0; 
 Wed, 23 Apr 2025 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745420152; x=1746024952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7m0UzjQSlAnchYu9ifeHwkg6qMlyGsq9HZFdL9+SCys=;
 b=PyeCJKqf/PmoJG+3NqDBsAZZ1PdncDuokEHj/Z/ECJ3wG0RsyUlD+zFkQ8gPU4fpdc
 FL9/L1sceLITuxLDzvt3b9SMt4T674MbG63If7npTCRbWb41VG/6hBC1kYug6ERt0c6a
 ZyCZuNFOVUN+dytaN73KIEMFp41BvbP2/lMWNHKleJi+KpQ+dePlIJSw+Un29e5vuMt9
 4lg5Yu+kYidmNbdhZ6DdPTg8iXYN5YxRnT3bzjL1zvIoWMiDfl6nuVyS4F7WxpXdxPY/
 CWL2eSvuq+9t+lvlSdx9BMT+Pl3UmLsbjGln3b/zFzmpZH87+kJh+Z6LVOpRvXZmmX2m
 2BsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745420152; x=1746024952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7m0UzjQSlAnchYu9ifeHwkg6qMlyGsq9HZFdL9+SCys=;
 b=BeKZeyKUCy0eCSjDROXcplUq7O1qwrnS04pUbimGbJquK2L3sRNL+plLTqaRD9DPpJ
 Co9QB4U1Iidvy5b/1I0r4zwNw466tdJAtzx/VqMiD7386X5m9mXm2iuhvBKF+ix6S6ev
 4NnmWJV03sGF+KCA+Z9YVQpnXv5c8REjOFk/dC/eD72bUd4M3QOoZeAfhCh+iDfiYo10
 3gXGeBDE2RmBAc5OVo+ayb2/8dcvw6FaeURP+0o/fX7Jf+ijBYsizjiTiOoFFpOSwHlu
 0eErutraafuno3oI3zrBlzXSIeBgCmj/VpL+8ixZiKqDjaj0RZAfMCHGUzUBUqOOt+ZS
 Zskw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC0dbjfFZEpp3uOmcoh/QrLrRzxi6sWWBZZ9jrCBM6rj1K5wWLcXsKTEErfV8Tbo7zk32Lbj1if60A@lists.freedesktop.org,
 AJvYcCXwlkc20daHgrguRT2yPtdT5XZ4xi1TmKT2VqCa2ZSuYr5tMIT6qAnUjV2+RWDksZcV9pL3ATp/fP0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydv7rMvT+L7k5N2lUlFVI/9bvccFS78M29g9oCgESA3A53kUQD
 0eQqu/0GqHT62yk4WFPKRR6w/VFcBY0YhnfgDYUVkfTZJYtxmdfihxfrUGyOUyW02ZqzGpzfymU
 JZoUf2hHo4Y+ExyYCRAvUUoUmwoM=
X-Gm-Gg: ASbGncvVTmYmScu+bWxsANADx1+bxLR9JbhiHMTXsLY/5cNWjyoTkPoTc/pkgBLufhO
 c+pHcqNChKdQPT9JWfzsYaoumlki6a8usF66r3xpa4WabF1g5OVxqCXqqGbEHULgKAwShxLlDjy
 mKwF1+my+Bgf3uMhNWtko0wurnHeLs4b+SwQPCE+nIOjNXKma1IUjA
X-Google-Smtp-Source: AGHT+IH/HosXjxOmwFPtGeWQfhxekC8P6qoxTmos7b0mOc58p0+QS9G2JnlqUawjIQiGiopnQR3O+V/TuYdD8NWDOvo=
X-Received: by 2002:a92:ca48:0:b0:3d0:47cf:869c with SMTP id
 e9e14a558f8ab-3d8942886e8mr197937005ab.19.1745420152327; Wed, 23 Apr 2025
 07:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
In-Reply-To: <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 23 Apr 2025 07:55:39 -0700
X-Gm-Features: ATxdqUHj4F4rmzIJwqK9WlP6_xORQ21GMzISXDUuQYh93b8M4VTvVt2-yaAaxlY
Message-ID: <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-hardening@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org
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

On Tue, Apr 22, 2025 at 4:57=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/21/25 10:13 PM, Rob Clark wrote:
> > On Fri, Apr 18, 2025 at 9:00=E2=80=AFAM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>
> >> On 4/18/2025 6:40 AM, Connor Abbott wrote:
> >>> On Thu, Apr 17, 2025, 1:50=E2=80=AFPM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>>>
> >>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
> >>>>> On Thu, Apr 17, 2025 at 3:45=E2=80=AFAM Akhil P Oommen <quic_akhilp=
o@quicinc.com> wrote:
> >>>>>>
> >>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> >>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>
> >>>>>>> The Highest Bank address Bit value can change based on memory typ=
e used.
> >>>>>>>
> >>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
> >>>>>>> default (the one used prior to this change) on error.
> >>>>>>>
> >>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>> ---
> >>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gpu.c
> >>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f=
20ae5f8f5e57f38ecc62d9f 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>> @@ -13,6 +13,7 @@
> >>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
> >>>>>>>  #include <linux/pm_domain.h>
> >>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
> >>>>>>> +#include <linux/soc/qcom/smem.h>
> >>>>>>>
> >>>>>>>  #define GPU_PAS_ID 13
> >>>>>>>
> >>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gp=
u *gpu)
> >>>>>>>
> >>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>>>>  {
> >>>>>>> +     int hbb;
> >>>>>>> +
> >>>>>>>       gpu->ubwc_config.rgb565_predicator =3D 0;
> >>>>>>>       gpu->ubwc_config.uavflagprd_inv =3D 0;
> >>>>>>>       gpu->ubwc_config.min_acc_len =3D 0;
> >>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adre=
no_gpu *gpu)
> >>>>>>>           adreno_is_a690(gpu) ||
> >>>>>>>           adreno_is_a730(gpu) ||
> >>>>>>>           adreno_is_a740_family(gpu)) {
> >>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for=
 LPDDR4 */
> >>>>>>>               gpu->ubwc_config.highest_bank_bit =3D 16;
> >>>>>>>               gpu->ubwc_config.amsbc =3D 1;
> >>>>>>>               gpu->ubwc_config.rgb565_predicator =3D 1;
> >>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adr=
eno_gpu *gpu)
> >>>>>>>               gpu->ubwc_config.highest_bank_bit =3D 14;
> >>>>>>>               gpu->ubwc_config.min_acc_len =3D 1;
> >>>>>>>       }
> >>>>>>> +
> >>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above d=
efaults in case of error */
> >>>>>>> +     hbb =3D qcom_smem_dram_get_hbb();
> >>>>>>> +     if (hbb < 0)
> >>>>>>> +             return;
> >>>>>>> +
> >>>>>>> +     gpu->ubwc_config.highest_bank_bit =3D hbb;
> >>>>>>
> >>>>>> I am worried about blindly relying on SMEM data directly for HBB f=
or
> >>>>>> legacy chipsets. There is no guarantee it is accurate on every chi=
pset
> >>>>>> and every version of firmware. Also, until recently, this value wa=
s
> >>>>>> hardcoded in Mesa which matched the value in KMD.
> >>>>>
> >>>>> To be clear about this, from the moment we introduced host image
> >>>>> copies in Mesa we added support for querying the HBB from the kerne=
l,
> >>>>> explicitly so that we could do what this series does without Mesa e=
ver
> >>>>> breaking. Mesa will never assume the HBB unless the kernel is too o=
ld
> >>>>> to support querying it. So don't let Mesa be the thing that stops u=
s
> >>>>> here.
> >>>>
> >>>> Thanks for clarifying about Mesa. I still don't trust a data source =
that
> >>>> is unused in production.
> >>>
> >>> Fair enough, I'm not going to argue with that part. Just wanted to
> >>> clear up any confusion about Mesa.
> >>>
> >>> Although, IIRC kgsl did set different values for a650 depending on
> >>> memory type... do you know what source that used?
> >>
> >> KGSL relies on an undocumented devicetree node populated by bootloader
> >> to detect ddrtype and calculates the HBB value based on that.
> >
> > Would it be reasonable to use the smem value, but if we find the
> > undocumented dt property, WARN_ON() if it's value disagrees with smem?
> >
> > That would at least give some confidence, or justified un-confidence
> > about the smem values
>
> The aforementioned value is populated based on the data that this
> driver reads out, and only on the same range of platforms that this
> driver happens to cater to

Did I understand that correctly to mean that the dt property is based
on the same smem value that you are using?  In that case, there should
be no argument against using the smem value as the source of truth.

BR,
-R
