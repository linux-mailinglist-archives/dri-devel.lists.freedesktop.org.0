Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28FD10B24
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 07:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFFD10E041;
	Mon, 12 Jan 2026 06:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nH03xMCc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeZqDiO5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5922C10E041
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 06:23:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C00IQK078499
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 06:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Km5DvJaebtBlt4Xd6bMnxrJoMszvzr8gf7s6KJ2cMFw=; b=nH03xMCc0gDgKYGX
 JIjTXDXIW1TjfHgwTjVsMfzekYG3l73Shl15xcjnUU/ZkltHzBwPVF6k5fL3BAn8
 9+Nlvmr+SFiWFVYjnxdhBxmm7mJBXYsZfLqd53okTXdrCT9ohNOhxI/4UILyvlF8
 uB3wtt6swxgEPW+SuD74/HQhk5UQjXqT3uUQIw+vlfUSsqQvdENmX0Y960XoWP3n
 fhRYG6bkL5IU3Icln8MfTR3QWBeaC9MimjgnLumxYD7faFekA+vKS0nEl6CbJGJk
 vRs2gVxymUoOQS11cklvwze9IX0SihDPL7LcqTiUD4zqXN2kAC+g1kCul1kcMDYH
 pLgj3A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu3u0y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 06:23:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a2cc5b548so126858946d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 22:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768199034; x=1768803834;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Km5DvJaebtBlt4Xd6bMnxrJoMszvzr8gf7s6KJ2cMFw=;
 b=ZeZqDiO5cb7mZEevgPM0NaEQrHo8YU4lM0qC4pzuEcZP6qMjLTr4MKnMLObMhJXdwr
 5GLBouvvvSeSVZJdcrGdckexGcGVtwCKfYQ6LL74GvvppSk75YI5b6n3swSI/0iEPi4c
 KyTzXwGnS+cF6daOZ3ecNoEoq9gqGmcxyWX4gdY1oGPIm+KQPKlqX41KEn3SdXUs4R8+
 WMRNfs7eUZCNg2RU93JeIl/dhTxamVlWVdGIYuvwh8Owtj/UWKoSucQ34Fkw5WkKFKTV
 r0PHBtzrh3u/D78IHyJd0IVFuh03UmBJLB4+ebw63rokIlDtP74JerPbbtfPbmhfJuPJ
 riJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768199034; x=1768803834;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Km5DvJaebtBlt4Xd6bMnxrJoMszvzr8gf7s6KJ2cMFw=;
 b=N7j/aUy2okp09Pkha7Jg6jv43m1/HrpGCyBp7K1JnTkdhgBI7J/i3pIRvEL94HRemI
 DKMOus7l0cc+rB22NNXdw8m1HJ3Q15Ab+j3VCnyG/19hPxwvblRRxPBeOqgGJpCbXXf6
 qgJp2p8B+t+g3YmXrfn9YTJx4Hu1GEWiYcDkVqvG34oZTXNi2/BdN+i+YzybvKKHhIRz
 znESID803hUQxCkfhkM0EHsr+RmQnPXseAe3SQ0YUHAUXsdp136paTQP6V5sUI55TUIC
 wcJSZdwgX3kU7EnTM7kDb3L+TIKkpmQVF9xjITSQ1hPlS6fK7BeILXhmJWEG8cDEAcN0
 0rTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXganSj7njiThtOhR5UncwAvM/IiNe98T9TwF3knDzxF7QoN59E/fSSymY7wFIHta2wMyxjTB3yAcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNChNCDvjzPXeAVqXcTp7KwOkso6P2fsXGAKujb4PYeSwRXwoN
 RKyuC+rBADh0jgys4999hpl1lN5YriqOMia7fLks2e02r/A4ajjCtpCQ4KEYxjUneunES+ZKSp3
 RAjtozSQQD1YGk6zJkcIqDtz+wT/Bn2YtOlNuULLa9mY0Z46UEPRWx86bUjQJMu8MGH3SwUw=
X-Gm-Gg: AY/fxX6lNCu0pUgscf71V3wdHSGxOSjah0kd3UIW3/uCgx200qC9LkFidsLuNeGrPWN
 +ei9K3xzzih9+VVSlvmPXwpLWfudthQ3fsfH+HNQv6Tpk1Xy+9lkLF9YpnPxSeDjAq5ncyTEOpd
 Sos/oIeyFFDscqbyUXXClQej7+LUl5ok+OldMKpe9TLWjB8Gm0koUOHiqNWOuJSi5H3ua8y6DDv
 MFQ1d/ogCN81bD6sj1aH55FNb48SCJheYeMsHYzVT/OalvSnM8ZN1gFWV2fE3umVV76TuG2fQdE
 dkTUPUWpf9eT46+iuZ/zWuNYRnAZcCoVb1ExtSTtqZPtQtkqn/zvViOEDiEMYm3tH0ABMwm54hE
 ZO48xmIjwuOT79epX23+d5DxxxkIf0+39DPugjnrQ1HRt/4Ail1LKAywU8xGe9Qs1iCGyQrM=
X-Received: by 2002:a05:6214:449b:b0:880:5249:be4b with SMTP id
 6a1803df08f44-89083c49d2dmr246929076d6.12.1768199033557; 
 Sun, 11 Jan 2026 22:23:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhWoWXnAmkoZk9GRxeBtUzBXi9ZFKae087r03NDSp0afxk1Z9oa4ANoJpC2jtq6aFa5UtAdA==
X-Received: by 2002:a05:6214:449b:b0:880:5249:be4b with SMTP id
 6a1803df08f44-89083c49d2dmr246928886d6.12.1768199033106; 
 Sun, 11 Jan 2026 22:23:53 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770ce99dsm133195916d6.3.2026.01.11.22.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 22:23:52 -0800 (PST)
Date: Mon, 12 Jan 2026 14:23:44 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
X-Proofpoint-GUID: BOK2dtUhnipOYylCx6txJNsTns7n86HG
X-Proofpoint-ORIG-GUID: BOK2dtUhnipOYylCx6txJNsTns7n86HG
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6964937a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=hW2TlsjfLSOC7mfwDcUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0OCBTYWx0ZWRfX0tdJHOyCyzFl
 sxIneWp2vKC6sw5mAgQY0sdKj56Ss12hYSWwH98c1lTcVgVGus6clZSTlaZZWq1BFMmP+5pfgLx
 MUM19sfF6gZ65YGKs5gmEEVCOzzqWZRGzmRp7d4B3crsUOo93TSmW72FoRxMdi26qUo1PuYv5my
 TTQpBDrSjHC393BrBOz5VBLLSJnAfidF95aqaOBN8G3sb2K3Txhpw9bWGOK2TcCqwJ0pl1fE+YC
 SNtqbczHtE75xQ0ckdf+4rT9sZORCg0WRjcxOZxg3lpniTbq17Ev0+g3tCgW+rGWQxe2F74612h
 ZiNvI1kDv7HlnmDHsSQ9gUJkk9yPrTpnz9QsFfAKqiXCHObDFthLoIga4ROA+e/jt6ooqL/2N3c
 W6jJLNHIgIiaYIPme3I5KUP+LpK/s1mK/7tG26QrWPuu22JfXKkRERhy7ELs6CLYad0CBd8A33T
 5i14rMtveNXClVcacLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120048
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

On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> > the MMCX rail to MIN_SVS while the core clock frequency remains at its
> > original (highest) rate. When runtime resume re-enables the clock, this
> > may result in a mismatch between the rail voltage and the clock rate.
> > 
> > For example, in the DPU bind path, the sequence could be:
> >   cpu0: dev_sync_state -> rpmhpd_sync_state
> >   cpu1:                                     dpu_kms_hw_init
> > timeline 0 ------------------------------------------------> t
> > 
> > After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> > to stay at the highest level. During dpu_kms_hw_init, calling
> > dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> > fall to MIN_SVS while the core clock is still at its maximum frequency.
> 
> Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), which
> doesn't do anything with clocks. I think we should have a call to
> clk_disable_unprepare() before that and clk_prepare_enable() in the
> resume path.

I do check the backtrace on kaanapali: 

active_corner = 3 (MIN_SVS)
rpmhpd_aggregate_corner+0x168/0x1d0
rpmhpd_set_performance_state+0x84/0xd0
_genpd_set_performance_state+0x50/0x198
genpd_set_performance_state.isra.0+0xbc/0xdc
genpd_dev_pm_set_performance_state+0x60/0xc4
dev_pm_domain_set_performance_state+0x24/0x3c
_set_opp+0x370/0x584
dev_pm_opp_set_rate+0x258/0x2b4
dpu_runtime_suspend+0x50/0x11c [msm]
pm_generic_runtime_suspend+0x2c/0x44
genpd_runtime_suspend+0xac/0x2d0
__rpm_callback+0x48/0x19c
rpm_callback+0x74/0x80
rpm_suspend+0x108/0x588
rpm_idle+0xe8/0x190
__pm_runtime_idle+0x50/0x94
dpu_kms_hw_init+0x3a0/0x4a8 

dev_pm_opp_set_rate(dev, 0); just low power to MIN_SVS. 
And freq MDP: 650MHz


And I try change the order:
from: 
	dev_pm_opp_set_rate(dev, 0);
	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
to:
	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
	dev_pm_opp_set_rate(dev, 0);

But the issue is still here.

 
> > When the power is re-enabled, only the clock is enabled, leading to a
> > situation where the MMCX rail is at MIN_SVS but the core clock is at its
> > highest rate. In this state, the rail cannot sustain the clock rate,
> > which may cause instability or system crash.
> > 
> > Fix this by setting the corresponding OPP corner during both power-on
> > and power-off sequences to ensure proper alignment of rail voltage and
> > clock frequency.
> > 
> > Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> > 
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> No empty lines between the tags. Also please cc stable.

Sure, will fix.

> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
> >  2 files changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 0623f1dbed97..c31488335f2b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
> >  	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >  	struct dev_pm_opp *opp;
> >  	int ret = 0;
> > -	unsigned long max_freq = ULONG_MAX;
> > +	dpu_kms->max_freq = ULONG_MAX;
> > +	dpu_kms->min_freq = 0;
> >  
> > -	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> > +	opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
> > +	if (!IS_ERR(opp))
> > +		dev_pm_opp_put(opp);
> > +
> > +	opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
> >  	if (!IS_ERR(opp))
> >  		dev_pm_opp_put(opp);
> >  
> > @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
> >  	struct msm_drm_private *priv = platform_get_drvdata(pdev);
> >  	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >  
> > -	/* Drop the performance state vote */
> > -	dev_pm_opp_set_rate(dev, 0);
> > +	/* adjust the performance state vote to low performance state */
> > +	dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
> 
> Here min_freq is the minumum working frequency, which will keep it
> ticking at a high frequency.  I think we are supposed to turn it off
> (well, switch to XO). Would it be enough to swap these two lines
> instead? 

Yes, just clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks) to
disable clk is OK. 
we can drop change here.

> >  	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >  
> >  	for (i = 0; i < dpu_kms->num_paths; i++)
> > @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
> >  	struct drm_device *ddev;
> >  
> >  	ddev = dpu_kms->dev;
> > +	/* adjust the performance state vote to high performance state */
> > +	if (dpu_kms->max_freq != ULONG_MAX)
> > +		dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
> 
> This one should not be necessary, we should be setting the performance
> point while comitting the DRM state.

No, issue is during dpu binding path. And in msm_drm_kms_init driver just
pm_runtime_resume_and_get enable power and pm_runtime_put_sync disable power.
But We do not set the appropriate OPP each time the power is enabled. 
As a result, a situation may occur where the rail stays at MIN_SVS while the 
MDP is running at a high frequency.

rpm_idle+0xe8/0x190
__pm_runtime_idle+0x50/0x94
dpu_kms_hw_init+0x3a0/0x4a8 [msm]
msm_drm_kms_init+0xb8/0x340 [msm]
msm_drm_init+0x16c/0x22c [msm]
msm_drm_bind+0x30/0x3c [msm]
try_to_bring_up_aggregate_device+0x168/0x1d4
__component_add+0xa4/0x170
component_add+0x14/0x20
dsi_dev_attach+0x20/0x2c [msm]
dsi_host_attach+0x58/0x98 [msm]
mipi_dsi_attach+0x30/0x54
novatek_nt37801_probe+0x13c/0x1c8 [panel_novatek_nt37801]

And I found a a similar bug.
https://lore.kernel.org/all/20220915205559.14574-1-quic_bjorande@quicinc.com/

Since the panel driver does not hold the property power-domains = <&rpmhpd RPMHPD_MMCX> 
once all drivers that do own the RPMHPD_MMCX power domain finish probing, 
the interconnect’s dev_sync_state is triggered, which eventually runs rpmhpd_sync_state 
and starts dynamic voltage adjustment. This is when the issue occurs.


if do change below, this issue can also be fixed.
&mdss_dsi0 {
    ...
	panel@0 {
		compatible = "novatek,nt37801";
        	...
	++	power-domains = <&rpmhpd RPMHPD_MMCX>;
    }
}
But I don't think panel driver should own a power-domains = <&rpmhpd RPMHPD_MMCX>;



Thanks,
Yuanjie

> >  
> >  	rc = clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->clocks);
> >  	if (rc) {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index 993cf512f8c5..8d2595d8a5f6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -92,6 +92,9 @@ struct dpu_kms {
> >  	struct clk_bulk_data *clocks;
> >  	size_t num_clocks;
> >  
> > +	unsigned long max_freq;
> > +	unsigned long min_freq;
> > +
> >  	/* reference count bandwidth requests, so we know when we can
> >  	 * release bandwidth.  Each atomic update increments, and frame-
> >  	 * done event decrements.  Additionally, for video mode, the
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
