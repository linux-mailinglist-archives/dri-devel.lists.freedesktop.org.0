Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF59B9D477
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 05:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FB110E82A;
	Thu, 25 Sep 2025 03:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvxnQNSC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE31C10E82A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:09:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONiZFo022454
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xxZapyWudFtqXj3PRC44LC7g
 +rW5KB33WelvpZxqWZU=; b=BvxnQNSCJHvelW6XJwzbJMIEuw/uq/zNAVy6+FXQ
 +Bnoj2jWL+UWhgExZvPYyV5bhfxAJoT7zDKW0vgTKZwOx6LjcAkv0L9XFZl5itZP
 EzkInAzyoAZUCUm/Hsi3l4MCV6ptqlnvqaIATCnwzXBTDjsg8JR7gqZJNaWpvOY1
 hsw21tJg+w06fJayEAJDPj7sHRoItxnKF39SFDUrzLdYknwXORUPusYQquUWY+mX
 Qb0r5qxHC7U6AuxfBVxzhFNuONyYRswwQovBgejzIFSRbJ3lycCbyN1hAvOaZ69U
 44yNuvmBJ4qOhPjsCxmp5KrBpIvG/qSnUBCdHyC+/oR+1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budae400-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:09:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d77ae03937so14034531cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 20:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758769743; x=1759374543;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxZapyWudFtqXj3PRC44LC7g+rW5KB33WelvpZxqWZU=;
 b=jMumslJhnbv8byQ4OPHK5oeJXmTVed0kV8pv2QYLjVZbQgCsNpn6ow6ekAp6t/vk0n
 Gqq3TH40eZgIkS42MYDZXorv11XbcU8sDZJBCYfAfVp7OpAVqu7OD3+T43KR5R3zmsta
 9nZeo5gmOwSD8AZ8hhZKEtCBg9CI6txjYcev1dKhdcj0XJzUJiMFJaIpglbFwk1aA4HZ
 FdItDvoxaTdRT+SL11S+dx7aIbKSA2zZai7ZJ79SGmysi/IRkx71ASGjqu0fp5WapQ8D
 8upzeUJPyvHlM7MKt6uVBe9Glqzlqq3LtIPYjNS/91A7zCAbDAhR5UWUfM/219ZUsMlu
 EQpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLAIPPWcdQuuHNTxcWRw/JQ59U2l2qgrunyOj5efbxwidVBbnPu1F1zzXzCUOKmXroAHrz7AGfpEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMxilCQ1oODIwqRuRu4Jg6vtQCGnrj1NPIbirJuZgfrqtbL7EX
 4sZeAfbRp7Vkti4wCDrtgo7QboVbBRWaR3F1irCIL6+2bcTPjv3BGCZiO37aXXplqNDU4VbX9Kc
 0Kr2Yffb8qT1EE+lXdSxs8Kndw07v1iGd4t3NYx+cOEeNwykKGzOg1cvBrE5rZeP1urChL8k=
X-Gm-Gg: ASbGncvEBQSOvMcfykrx0ib66WFMi6fTETINJzlXZFiVRxlvgBK0rT/ZfB29az/oe+G
 WwWJmlbYFLZFvsos3QNzD59ncEQnuQdrOimTy2aeUdA/ZPCrZKALUMX/H/568X+j3GdT36Inl4O
 yoy8tSAMY03kMUapm8r+1eZqR1xn1MrkIQUCY0Jun3X2mcmM9NgqqTX6VOGxxDnxnrNTRHhE88v
 NqG13rViPbi2a1vIPYU5kJ29CCVq1kktUqejCKqVbWSsPGRDGZe+AHVs/7QswAYRbZrngwih9Kw
 ggVIc2DRS3bCW3i8qjKeIc7sYFSvs+Ua5ed/F1UrmmlP8u+FCU+BbFAlkHoacJe/WMo9OAW+5pd
 V5s+yalfYOnGeGdAzKq1ul8cgppexDqYYfrUiLTWlElfWLAdrekYU
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id
 d75a77b69052e-4da4bbe54e6mr28268701cf.54.1758769743179; 
 Wed, 24 Sep 2025 20:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjD6roAMh62lhIixQNgSFreoILQwURlIwfNhtYVCV+e3dpo7i11o2BA0fnbYsIB373kLxg8w==
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id
 d75a77b69052e-4da4bbe54e6mr28268491cf.54.1758769742726; 
 Wed, 24 Sep 2025 20:09:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313431271sm281762e87.20.2025.09.24.20.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 20:09:00 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:08:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: airlied@gmail.com, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, quic_abhinavk@quicinc.com, simona@ffwll.ch,
 sophon@radxa.com, tzimmermann@suse.de
Subject: Re: [PATCH] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <5au5p32oyouifgmqlnl7unm6n7tbxq45wpwpqx57xoepiucmxw@tjqlbh2a57yk>
References: <6mq5morx4kuwmxa3dhpxf42uqedtveectlbeodl5oj74rqk4gy@oweda3unauqj>
 <20250925025714.20121-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925025714.20121-1-liujianfeng1994@gmail.com>
X-Proofpoint-GUID: NlwSxUjvkZUgWysvEDsBJl09qLP02kcq
X-Proofpoint-ORIG-GUID: NlwSxUjvkZUgWysvEDsBJl09qLP02kcq
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4b250 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=5y6PCNOKMUJiDNq-dWAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX5d84T4R4L7fy
 gqJokmkwCaoq4D69RGGmGzvREB59XQwUlS74KA+VclTpZAtB0iyjJQZHi7OnctScaG5dZLx1JM7
 f3kuyVSu7Sh6DXtGpzGEWN0WSAbKQlvKlqsnvfH46MaLkZ9k0P+NYotbiq0sH4ZOvtlvB+MRAJW
 3Lsru/OLphv+XbbEIR7yX/SB5Mz5x5F2CfR17RFvE1zAbgfvO0stYVytILUUAkboDVA2RrnYAnT
 evolXs22X5KCPyOGOx36zTWe4sD973eE15LgbRpTGCNBoNeQo8TVADf7LtYViZzLlLGMjkNWy2/
 BEeW+Fa2hpAy5iIY9oowRCbTaf4mgw/bX73MgbaLJJyXwtEcUqAg0Uio7eCwZkgzs6BCAdbIOkm
 EmH8ImFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113
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

On Thu, Sep 25, 2025 at 10:57:14AM +0800, Jianfeng Liu wrote:
> Hi,
> 
> On 2025-09-25  2:18 UTC, Dmitry Baryshkov wrote:
> >When does q6apm_lpass_dai_prepare() happen?
> 
> q6apm_lpass_dai_prepare() happens both before and after hw_params/prepare
> of hdmi-codec:
> 
> [   14.055198] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.067225] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.089925] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.105988] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> [   14.106027] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.122707] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started

From this log I don't see, why the function would fail in the way you've
described. Could you please post (for comparison) a trace log without
your patch?

> [   14.132017] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.197843] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.633992] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a660_gmu.bin from new location
> [   14.635452] [drm] Loaded GMU firmware v3.1.10
> [   15.929293] rfkill: input handler disabled
> [   19.406507] qcom-soundwire 3210000.soundwire: qcom_swrm_irq_handler: SWR Port collision detected
> [   19.415672] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   19.465864] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   19.581446] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   19.693965] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> [   19.694012] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   19.706621] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started
> [   19.722543] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   19.775071] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> 
> Best regards,
> Jianfeng

-- 
With best wishes
Dmitry
