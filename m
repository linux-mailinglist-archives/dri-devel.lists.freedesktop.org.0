Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7948D10EBF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 08:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02CC10E2EA;
	Mon, 12 Jan 2026 07:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIoNQ2Wc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLqEZXgZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653BB10E2EA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:38:54 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C7OcSQ555257
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RFtsdA1HdiIkQGbTLKH9PDklaHIFEli3es+PL58CLIU=; b=SIoNQ2WcPv/lsEa8
 mbhiUzbRuZXgMWLjimArn9sG0yUNzebFjzuVmJO2c0ZT5a3J4VQy8FxqTHJiei0h
 8bd4yXyQqusLJ82PAVJs6/4Q+7Mwh/kFjMuvU2bvgd2l7Pb7R7/HM+T2QWBJ6Mzh
 r5unDJuMG5tACiFnHhI8iZjl5uF7YMjVAKRhYnzZI7/mdnQGJjpTUvKTF9SkibsK
 6iRpMDh4nrtGXdiSB6poq+QEN/O3/RQTNYVOhnquX20Sp3DVoKihLOvhLRp0Y4bM
 8dzVS2wEpFNEWRY7jlKgojwbdhuvdrghEDshEDXxrNw3NVtfLT7teXRHIFEMdc5J
 bgHxGA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw01hm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:38:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34abec8855aso6199786a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 23:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768203533; x=1768808333;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RFtsdA1HdiIkQGbTLKH9PDklaHIFEli3es+PL58CLIU=;
 b=BLqEZXgZUdLHhfQda60Oc99pDshBrLt/U4wRH5QmShZEf6FeWeDx9FC6H//bkQqSVe
 GJayBcHnbs78fF+UTXWvp9ieVFmhBEdrwyAyRL9ux1lrxNPC19XOke7T2D97kskUkC3P
 SJ5NYt7CmYJ1a297inF/8bV0d8FSydV9pMpt15Pgpk129+EqGZ34B8rYTgdledA6x/4V
 Pz49tU7NoF9oeYUrIDQOSuy7O8VpmM2DZ7jGO414qrYL9kHad/TQN/KHCImXvthqBIDo
 H3WqzJpsXH1hLIPHruKqXrHJm2mz54eLd/3vy26PAhEOJwebxGHfbI4x5I4EF34DkTw8
 t6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768203533; x=1768808333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RFtsdA1HdiIkQGbTLKH9PDklaHIFEli3es+PL58CLIU=;
 b=ggMva+M191ivMgmSBds5Zm4XMRKmX9JeQmYqTCyloKENxblpfVH0bjQ26746aO0rFR
 i2wuj+jB3bOIkR1dnoHSY/60Na6BmjZcvY1F0IYeoA/l4WjmTdkGDkUppl6NpbciP/py
 Az0gRyo0YZJNIOJJZRzX+sdF+5IvyKjI62a831K8X5gX6w9de6PHWn643wHdw86tp3G5
 bc/u0U2Oqq7es6tD1M63y4pwrLJHPYxZkjUzvZSzf5B2ZGQ86x7Z0IccYXaSiiAQdPKv
 MEuVt0ZXFUjPyWOgzaX0mZdhUMSu4VJCE4u36c3mlqYwt6u3y6l76qb6rdIKgaAbZr+q
 aLDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7wRxSt89larXjKsJ0XFj4SzL9C+OTN5ZFlJJ9ijlK9zp3HTdcH4CF4KYedpJk8urn74FnMM9upEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB0cTNCe7NvJrj2ce7ckz6zecfrX0FCBK3VLCy908UBwYI/Kmx
 GqxOfJX4MkWnL+S/I/dNAURnIDW6rtpOhYzqitDS0B3sJGuJcBPy+ASHmI5FrAhdWghuP997PSS
 uLlL5zP5u4fLVFc/R5yDN0NM1gHu8nSzys8MS4fVL+ghv5ThDkmNK2slcusp9/I0NY4bQs5P+Hf
 qFm0Mw+lLyolIAWWNQtlm0JRhoi3FaldKj7HTQ2UoKEZyjOQ==
X-Gm-Gg: AY/fxX5qBkqnJVBAf0BA0wgLzeuGhFZ5A1HLq08lemgwhhbir0SBeN81YRyMGw5Zu71
 6G9FVGSaizTqe0QhJ0q62vFqtQzrBO+EzrkCVAj2qf7hcHN58172x8qwRB6fKgvpzYVX86+Cp3p
 SXiLa9lWL5rH/pZOs4Vz95i43rGrO/RUmHYaQiDsAAjV8uO0qXIjiytMMNZSuQKANZDnoMEA2Tp
 2j/blOj
X-Received: by 2002:a17:90b:57f0:b0:349:3fe8:e7de with SMTP id
 98e67ed59e1d1-34f68c27620mr13615393a91.28.1768203532821; 
 Sun, 11 Jan 2026 23:38:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNeZ4F2xzWsiizPQu2h4UkdnywlrKOdvasMIWylHdSP1VUo7D84pgBeE3G5Eneoz9m7J7xZi0+lOdLByq8mpI=
X-Received: by 2002:a17:90b:57f0:b0:349:3fe8:e7de with SMTP id
 98e67ed59e1d1-34f68c27620mr13615355a91.28.1768203532286; Sun, 11 Jan 2026
 23:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
In-Reply-To: <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 09:38:41 +0200
X-Gm-Features: AZwV_QjL9gudYcHpU58rbHr0h-Wj5spnOuZS-hY3AJQJKKknOYhu4H3eLcS1M0Y
Message-ID: <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfXyQd/EHMuI9pN
 dyqqTnAIGA7A8Nb6btEVU5Z/A0NHKpDJ2aQB9bkNlreyLnAzYVGTtmQMfqwyEoMKVrKrsQa2jLc
 mUB5lgU4zAJBFLawqRaBOUcV00HIQDfFZgUzvzMmdf/Af1RXcHW1uKzObJJ1DDC1zUeTnFzwdhf
 9p8yW9DdrIdOAKOaZZ3CsOk9hDifwquDc7dqaPaDi19ONUUmG1BJVIkxtnVCjpzQSw7EWnKqjMT
 jXl8Ub3u1HRMH2n2uZUsXt4CmZAeEDeow43zT/LT+wJnn19KF+phIRlWJoKVI3L4uoBgSMxgnOL
 P42yhvzbrvWNmweXwOZZ0RRYR2mS8MQ5viZBgD1f5ne7oqJgZEQtGhkINKYI1Ha/KSVE4LG4UHT
 eoopex4NF0TCxZl0okNCkaW/58WUqpR7IF1igtQoWua83wnVBeQvEfdEUOBTZr4n1/IS8mXbHYZ
 NcVE03YsKwH9MSg69DQ==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964a50d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=jzdye9AysFvke8xWlIgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wz2hHIiUGdebgpcBD6TzAioSLwq13uOk
X-Proofpoint-ORIG-GUID: wz2hHIiUGdebgpcBD6TzAioSLwq13uOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120058
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

On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrot=
e:
>
> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >
> > > During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> > > the MMCX rail to MIN_SVS while the core clock frequency remains at it=
s
> > > original (highest) rate. When runtime resume re-enables the clock, th=
is
> > > may result in a mismatch between the rail voltage and the clock rate.
> > >
> > > For example, in the DPU bind path, the sequence could be:
> > >   cpu0: dev_sync_state -> rpmhpd_sync_state
> > >   cpu1:                                     dpu_kms_hw_init
> > > timeline 0 ------------------------------------------------> t
> > >
> > > After rpmhpd_sync_state, the voltage performance is no longer guarant=
eed
> > > to stay at the highest level. During dpu_kms_hw_init, calling
> > > dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail =
to
> > > fall to MIN_SVS while the core clock is still at its maximum frequenc=
y.
> >
> > Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), whic=
h
> > doesn't do anything with clocks. I think we should have a call to
> > clk_disable_unprepare() before that and clk_prepare_enable() in the
> > resume path.
>
> I do check the backtrace on kaanapali:
>
> active_corner =3D 3 (MIN_SVS)
> rpmhpd_aggregate_corner+0x168/0x1d0
> rpmhpd_set_performance_state+0x84/0xd0
> _genpd_set_performance_state+0x50/0x198
> genpd_set_performance_state.isra.0+0xbc/0xdc
> genpd_dev_pm_set_performance_state+0x60/0xc4
> dev_pm_domain_set_performance_state+0x24/0x3c
> _set_opp+0x370/0x584
> dev_pm_opp_set_rate+0x258/0x2b4
> dpu_runtime_suspend+0x50/0x11c [msm]
> pm_generic_runtime_suspend+0x2c/0x44
> genpd_runtime_suspend+0xac/0x2d0
> __rpm_callback+0x48/0x19c
> rpm_callback+0x74/0x80
> rpm_suspend+0x108/0x588
> rpm_idle+0xe8/0x190
> __pm_runtime_idle+0x50/0x94
> dpu_kms_hw_init+0x3a0/0x4a8
>
> dev_pm_opp_set_rate(dev, 0); just low power to MIN_SVS.
> And freq MDP: 650MHz
>
>
> And I try change the order:
> from:
>         dev_pm_opp_set_rate(dev, 0);
>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> to:
>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
>         dev_pm_opp_set_rate(dev, 0);
>
> But the issue is still here.

But which clock is still demanding higher MMCX voltage? All DPU clocks
should be turned off at this point.

>
>
> > > When the power is re-enabled, only the clock is enabled, leading to a
> > > situation where the MMCX rail is at MIN_SVS but the core clock is at =
its
> > > highest rate. In this state, the rail cannot sustain the clock rate,
> > > which may cause instability or system crash.
> > >
> > > Fix this by setting the corresponding OPP corner during both power-on
> > > and power-off sequences to ensure proper alignment of rail voltage an=
d
> > > clock frequency.
> > >
> > > Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state"=
)
> > >
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >
> > No empty lines between the tags. Also please cc stable.
>
> Sure, will fix.
>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
> > >  2 files changed, 15 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_kms.c
> > > index 0623f1dbed97..c31488335f2b 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *dde=
v)
> > >     struct dpu_kms *dpu_kms =3D to_dpu_kms(priv->kms);
> > >     struct dev_pm_opp *opp;
> > >     int ret =3D 0;
> > > -   unsigned long max_freq =3D ULONG_MAX;
> > > +   dpu_kms->max_freq =3D ULONG_MAX;
> > > +   dpu_kms->min_freq =3D 0;
> > >
> > > -   opp =3D dev_pm_opp_find_freq_floor(dev, &max_freq);
> > > +   opp =3D dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
> > > +   if (!IS_ERR(opp))
> > > +           dev_pm_opp_put(opp);
> > > +
> > > +   opp =3D dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
> > >     if (!IS_ERR(opp))
> > >             dev_pm_opp_put(opp);
> > >
> > > @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(s=
truct device *dev)
> > >     struct msm_drm_private *priv =3D platform_get_drvdata(pdev);
> > >     struct dpu_kms *dpu_kms =3D to_dpu_kms(priv->kms);
> > >
> > > -   /* Drop the performance state vote */
> > > -   dev_pm_opp_set_rate(dev, 0);
> > > +   /* adjust the performance state vote to low performance state */
> > > +   dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
> >
> > Here min_freq is the minumum working frequency, which will keep it
> > ticking at a high frequency.  I think we are supposed to turn it off
> > (well, switch to XO). Would it be enough to swap these two lines
> > instead?
>
> Yes, just clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks=
) to
> disable clk is OK.
> we can drop change here.
>
> > >     clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> > >
> > >     for (i =3D 0; i < dpu_kms->num_paths; i++)
> > > @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(st=
ruct device *dev)
> > >     struct drm_device *ddev;
> > >
> > >     ddev =3D dpu_kms->dev;
> > > +   /* adjust the performance state vote to high performance state */
> > > +   if (dpu_kms->max_freq !=3D ULONG_MAX)
> > > +           dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
> >
> > This one should not be necessary, we should be setting the performance
> > point while comitting the DRM state.
>
> No, issue is during dpu binding path. And in msm_drm_kms_init driver just
> pm_runtime_resume_and_get enable power and pm_runtime_put_sync disable po=
wer.
> But We do not set the appropriate OPP each time the power is enabled.
> As a result, a situation may occur where the rail stays at MIN_SVS while =
the
> MDP is running at a high frequency.

Please move dev_pm_opp_set_rate() from dpu_kms_init() to dpu_kms_hw_init().

>
> rpm_idle+0xe8/0x190
> __pm_runtime_idle+0x50/0x94
> dpu_kms_hw_init+0x3a0/0x4a8 [msm]
> msm_drm_kms_init+0xb8/0x340 [msm]
> msm_drm_init+0x16c/0x22c [msm]
> msm_drm_bind+0x30/0x3c [msm]
> try_to_bring_up_aggregate_device+0x168/0x1d4
> __component_add+0xa4/0x170
> component_add+0x14/0x20
> dsi_dev_attach+0x20/0x2c [msm]
> dsi_host_attach+0x58/0x98 [msm]
> mipi_dsi_attach+0x30/0x54
> novatek_nt37801_probe+0x13c/0x1c8 [panel_novatek_nt37801]
>
> And I found a a similar bug.
> https://lore.kernel.org/all/20220915205559.14574-1-quic_bjorande@quicinc.=
com/
>
> Since the panel driver does not hold the property power-domains =3D <&rpm=
hpd RPMHPD_MMCX>
> once all drivers that do own the RPMHPD_MMCX power domain finish probing,
> the interconnect=E2=80=99s dev_sync_state is triggered, which eventually =
runs rpmhpd_sync_state
> and starts dynamic voltage adjustment. This is when the issue occurs.
>
>
> if do change below, this issue can also be fixed.
> &mdss_dsi0 {
>     ...
>         panel@0 {
>                 compatible =3D "novatek,nt37801";
>                 ...
>         ++      power-domains =3D <&rpmhpd RPMHPD_MMCX>;
>     }
> }
> But I don't think panel driver should own a power-domains =3D <&rpmhpd RP=
MHPD_MMCX>;

That's not related.

>
>
>
> Thanks,
> Yuanjie
>
> > >
> > >     rc =3D clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->cloc=
ks);
> > >     if (rc) {
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_kms.h
> > > index 993cf512f8c5..8d2595d8a5f6 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > @@ -92,6 +92,9 @@ struct dpu_kms {
> > >     struct clk_bulk_data *clocks;
> > >     size_t num_clocks;
> > >
> > > +   unsigned long max_freq;
> > > +   unsigned long min_freq;
> > > +
> > >     /* reference count bandwidth requests, so we know when we can
> > >      * release bandwidth.  Each atomic update increments, and frame-
> > >      * done event decrements.  Additionally, for video mode, the
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
