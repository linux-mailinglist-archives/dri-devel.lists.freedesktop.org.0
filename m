Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3DB9D53D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 05:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A7810E82F;
	Thu, 25 Sep 2025 03:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQKIQF3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C2010E82F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:43:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Z2uW024258
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PnFBXDYMwHMR4niA1eRDzAyq
 R4AF0gya3k2k3n4pd4A=; b=TQKIQF3D1H0cfkXF5qc5fP2RwPf6GUy1FvMymhg/
 DJLKpzD3UNAIEZuagU1wxAc5YlECDIkR4VQ4sTZg+ca6CFxRsXTdG6j4g3/2ZMKQ
 GUp57+cIydyvDxqHVwqk8Aymu4OxFBbwjZRsWKaNeLBk0dYl8bEYdNpZfmMasfPt
 OTbq8oqn9s5RkDM65Q74RkGCZno6YXuvrPEiVhOJ+MSDzIXKhA4LRwkjtPJKseCd
 ++F2OWLhbz/UQQZATewPtqCrAWktE//axMMpAGLbJsOBZGjAlMezaiKEchMzLuhK
 3XRTtO15WADYGy5bg45nX9Cd1xTjbbmdA70fmnb09k895w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0dneb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:43:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5f6eeb20eso17962141cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 20:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758771806; x=1759376606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PnFBXDYMwHMR4niA1eRDzAyqR4AF0gya3k2k3n4pd4A=;
 b=Tm2XkhhYFayMvytiLRPYdQA2T8F1GVKaKV+I2FrBorU9BcNBag63oRYiqo1RqV1oa7
 W4dIJuh9Cnmi48gj+NGK7dsgStCd4jW4ajSW7sDOAGceFCOGnv6A8A/dncgWUYc1QtzI
 uVh7NBsRKQrqqFS2Xpx7Mi8pE5iQEdlxyM0bjE0AeYO+yLyMtwfO6PcsxAzM5Yn+pxxL
 lSkYZUrCvWWmilYbOEEVvAYXBgoueSvdjFh+9uW2TRrqNkpVQvqeK0Qh2PglTtOzJX0Z
 PDDuNjLwQ4pKVktNzUECYAXIWVO9Fag55gktoKLNXMHfsh2DrAwGajGW47AQL9op8ZwF
 kJ0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnDTyG5iAixpogUdMobyjcGek5/FzdQmwGwuHrtWE3f98ILff4Uby18mW+uh0sHknuL/i0urPGAyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3gBRXLNF6F4aiCR8RCJ3OYpGz96pzW6i+TeWvJc+kSWMSYfwc
 AdXPyRzoA3dHufyeai3ajCbUs/CgDz0ttF0JjotYk4VwUX5IT0sV9RlcAkluKz0FMczOL87SNLw
 J9uiQe/zvubfkqCFuZizm1wJUCuUt7HYJz1RW4MSSTVzPMWkHLtt50wz44rJoQqFVcCX62cI=
X-Gm-Gg: ASbGncuscyFIgv2glqKvG56+qEyqVOWAfQXsHRatxlgTQ6LwLXp2YVjGc81uiHMyn7f
 LBy0NeYSHtKfCRoQF9x0Wx8eZwo2ys1zJXuLzEoANU9/wZXj1k7n6oMdEDxyDgyb+KpXayKZ/Ar
 /LwZ/bJs4uBofDrrpwAysjtyP0qiX0GfLB4oZ4jwcjrRl6L3WkqIrK8RaT06rKDv/LXx3XwmPd0
 Ad/gViBscJH2vG1awMIAnLYa79JMXnGGqlAQzUsBVpYmUf/Hf5urJxCA+mk36CabixJpBBsEvpY
 yj/3JvFe02NPdP5c2SMtibrJHIXybr6KxqAXuOWmPE4w77Mmv6XcXk5FryeveZBoG2O8ypqlXDB
 V//ma2pFnfzgItzSyO802P+9ck76brDS2UeZPIg7EOQr7rWCt+Mvw
X-Received: by 2002:a05:622a:1308:b0:4b4:8f2c:ba3f with SMTP id
 d75a77b69052e-4da4d8e0d40mr31575451cf.76.1758771805659; 
 Wed, 24 Sep 2025 20:43:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCJpBXnXK9vRB+B3gtPfRrk2NcHwsvlg/n3k4nv71c4lmfp/1kkcUFeNgMsag0YU1JgEi30A==
X-Received: by 2002:a05:622a:1308:b0:4b4:8f2c:ba3f with SMTP id
 d75a77b69052e-4da4d8e0d40mr31575361cf.76.1758771805231; 
 Wed, 24 Sep 2025 20:43:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313dd4b98sm306966e87.50.2025.09.24.20.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 20:43:24 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:43:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: airlied@gmail.com, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, quic_abhinavk@quicinc.com, simona@ffwll.ch,
 sophon@radxa.com, tzimmermann@suse.de
Subject: Re: [PATCH] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <t2v7h2wx4onumjkinxvvyxfm6gqxf7p6tewwaaomx76f4wno3o@ngewgnnclg4u>
References: <5au5p32oyouifgmqlnl7unm6n7tbxq45wpwpqx57xoepiucmxw@tjqlbh2a57yk>
 <20250925032338.20243-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925032338.20243-1-liujianfeng1994@gmail.com>
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4ba5e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=LKkRTRVqgOcP5VMVAcwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: fzVyErIyqwHFZD9UidpH4GJiJTRsHNJB
X-Proofpoint-ORIG-GUID: fzVyErIyqwHFZD9UidpH4GJiJTRsHNJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX3cApi1Q+qBoY
 FbP9aUs8U89pQFbxsVJZgAvdSMvVvjnGbsy0/dvXJ3pLNFi0F1RCn3uG2ebZYnerVKiZxf3XUUa
 03yEFzOZGhucBv8VHGbiNWGOhirvOy/T2iQiNjg7fVFVC2Hz0ntl1Qqfk9dZIgkATuc/v+z2pYx
 GIsWXdikRo7+oJ3V+IH2hthQSpDDuMhl/u1oobAtVtyuEa/CAJyVhmr4x3zG588LqEvCVCR1v2L
 8xG0WppnrCCoAMeDy9Rfar4BCACTHWikXe5yFeWLzU+brlcrpJSkDG9Qdl/OyqChz+PPmIXY3wi
 XfdYewUxuLLpqZwjmUvkFzXkEnTSbYBZ7x7q1rY016O1ECI4Di2O6Nc6CBry1a+ZdvI06mdTfoj
 lrQoeaMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
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

On Thu, Sep 25, 2025 at 11:23:38AM +0800, Jianfeng Liu wrote:
> Hi,
> 
> On Thu, 25 Sep 2025 06:08:58 +0300, Dmitry Baryshkov wrote:
> >> [   14.055198] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> [   14.067225] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> [   14.089925] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> [   14.105988] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >> [   14.106027] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> [   14.122707] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started
> >
> >From this log I don't see, why the function would fail in the way you've
> >described. Could you please post (for comparison) a trace log without
> >your patch?
> 
> Here is the trace log without mu patch:
> 
> [   14.093437] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.105285] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.127546] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.144819] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> [   14.144855] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.652233] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> [   14.659556] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> [   14.666326] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> [   14.677484] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> [   14.690897]  MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback

Please include these call traces (up to this point, the rest is not
necessary) into the commit message. You can drop the timestamps to save
space.

Also please drop the empty line between Fixex and SoB.


-- 
With best wishes
Dmitry
