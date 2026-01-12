Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE900D107CE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 04:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4F110E07C;
	Mon, 12 Jan 2026 03:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrLBmvBD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCzaqxYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D38510E06F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:31:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BLU2Me3038593
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nwTPguPrpmiXRmw7m/cNINqZ
 6SyBciSjbwBSLvsVGNk=; b=UrLBmvBDsMTUQ5+eOmDL6kPUBCsCrVFjm+7Z7eg4
 I/30jv11hUMNYYRPXAextkx2CYlfrYbbDVUu9LpdpFYw4z9YvQjnJQEFOuXdqm9I
 Hl0Yspc3v2KhqjTzi45FF0T7SDm39ohFhOy2pGSLMujafIK3d/OqfDelF4P+ZUgP
 Wg4YbZA1kYHq4F6g+jREnKjKnx9+CSERQFDJrZ7IL8vbmvBAPr0l8mhxq2lemzyf
 ScKrrrmwmuiGJBIME80gYvH9teiyo4jKwql+R3vh00o+VZknslMmC2zG5h7wZOtG
 PeAOkOFVurGg/xfujFX/jZrJvLu1zEt5pB6PQgASWUGhtg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntujs7p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:31:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-890805821c0so195035486d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 19:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768188668; x=1768793468;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nwTPguPrpmiXRmw7m/cNINqZ6SyBciSjbwBSLvsVGNk=;
 b=SCzaqxYS07sbrqPQ9KDfcCsLZHQY8dNqnWNzbKRaU0JrGNYrCkxqyLz8ZcmgG7M7Zv
 xoqro3pYka2pvtQ8bloEgqI9fizxjVMc4N2VLQi2vGuaw4ptVDVib7uwrdgLNry2H07v
 62KS6uNdpdcD2/X1az8LQYyDthhamJkBOG9G1WgKNLefIwcta1Fe3d0KMcwbWVfen05A
 zE+oxtDjSPf+/n3TtaDnLh/SgYGfjCrU/L2jKwH1P1DGI3Wcg44lKI3Z+zCbFpo0ozHR
 2Ykerrox0Y0aKVJWi6KsOxPbo4q4QLuMLYOmfecvA3OBabIl03+QkwhYLsHT/A1Ues6m
 5trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768188668; x=1768793468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nwTPguPrpmiXRmw7m/cNINqZ6SyBciSjbwBSLvsVGNk=;
 b=xCy1F8xZqoxC4gXkIevNwdfX8rtz5wo2YoEfhcJBTwBjFwoxaRq1l4GcFx2Sfqg792
 gosTSvWu/S2oT4omRs91rQABWe6ddVCr0iYJEHyCZkPlHnIvHWpLAVuNlJZgv7W4etGb
 lJdWQU53rnIQ1sPjziXd6rz4SgMtuY1f3Ab/VzgMJ4KEQyS25jq58I32iheW5R+Ejx7M
 T1sxlZis8KAQT61uSJHJIU77v5sRpmO6VMdRj9uh5tUeXZalyq4pogs5QifuuhKnk690
 dsmeMPRBgUO5nOmbvO5vfS88/kx2kzNPgPseTFqZShZmbtvj/CrVtDo4WwkIt3p/ziXA
 YANQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdHMhOvOX3hDh8PAEvtc8POeYAKXmta8H714BaYhfl2EDbE0PomLLUvLi7WtTYDhkCdGhLmwRn7Yw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4q7iOMP24xR4nzw2RnAxi1QR3zhTaVEJPFAuZ+x5THl/iA8Jq
 NJRz7W6Q29v7B3VsjabtfK+zT1BUocqWshhNlfzlZ+YDAo90f9xPxFFo5yaar9mqM8uFVlnoLVk
 HyiAij/XJAVIL0ZZmwy7leRl3llPZ1RDRumVZIwE1gYHS8UOgpbRRQsy4GHtYsKFKsuavzLg=
X-Gm-Gg: AY/fxX6ZQiDF8BGV1yYbrf9m47YcV8e0q2GGXykkS4VaPiTNA1PNLcPAuSDiunmgais
 FOi2ogAC1azTEabe9S0hJLjMujGwX0K9kBiJP9v7ULQhNHkI7EQYihaMmtXZ9aabsraZhYCqOEr
 EZWQiLjHoJ7+gw8isMpOMCuxHSAXhg9c8HtbFE/xzX09WxEQzG1cLelUemIhro4Xv1kTYP1RQrt
 nlADxjD5wU24n/AovuK7yr9qV8vIA4Tw/ShqNwIdH3pno3kZspV/X1mh2EgFmC0iiTpb6QWe1qB
 nCrTLeoioUZZiF0XeMbKIdNq0pYdkhmQc0/LTa1o23xEtJrW9ODlmymjab32i7kyXykiNCSLYVP
 wJGP1YRw4ZhoaduWgdmHHb+dkPMIYwKuuGyh2oiSa93JpZec03F6vJYnvwyC3KVf1cUaFG0w=
X-Received: by 2002:a05:6214:c2e:b0:888:4930:82ab with SMTP id
 6a1803df08f44-890842dd44emr259160696d6.71.1768188668563; 
 Sun, 11 Jan 2026 19:31:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0EmdAXthpRDVwaBUjY3AWOzWji71FlmH/kjQtB6Q1Zdj0JN4HNSWEEUPjVTizHHWbaf8EBg==
X-Received: by 2002:a05:6214:c2e:b0:888:4930:82ab with SMTP id
 6a1803df08f44-890842dd44emr259160406d6.71.1768188668135; 
 Sun, 11 Jan 2026 19:31:08 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7b1sm127049726d6.5.2026.01.11.19.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 19:31:07 -0800 (PST)
Date: Mon, 12 Jan 2026 11:30:59 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <aWRq8wDjtj015kq1@yuanjiey.ap.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <dc16d4f8-21a3-42f9-95e6-c508311268c2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc16d4f8-21a3-42f9-95e6-c508311268c2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNyBTYWx0ZWRfX9G03+hKZSNUm
 /JC1vaigLjw1/CksDngbjTzm/wNgsjeOeQjyfocvduJaY7imevo/Ph0avASGIPJrtE+sHzGRHBs
 off8A1KeaFjeWP/AETYWMOf7yqcVy1q5HPIte/2wRwu9XNkh/OkPzidNRRtzRid3GK46zmk1m17
 3iQgA5nRc0KKSO2Ljop/eJ0umzhZT83R96rtHoOrikTRFtBCI4dCH03gIiIrJz4I1h+YZWUCh1s
 wJUm1lEnTkm+dr2vck8MG/naSBTOfgN60sTmQI60sop5HMKReb1tPz1WIy0hnblCnp+MJdlzZ9n
 WWjLQrUolnL5YgRKsVdfX3KWFSc0hbNXFM4OB0mcnY+amnzl9H6Cf7zOPO2ufnd+b22cf6xgE73
 p7U918un3XdS9RQuIaW2b/NaAwDEtcbi093zCnN/x4ZQtMl4RHljBeJfdbYP2ZnrcQFAH5zJ8sr
 WeF5h7RKawfyXDXWbpQ==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=69646afd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BS6H7PxNumziHjRwYM4A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: kKgXCDAqJz_Pbdd4h_KN-qaolVJx6wzS
X-Proofpoint-GUID: kKgXCDAqJz_Pbdd4h_KN-qaolVJx6wzS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120027
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

On Fri, Jan 09, 2026 at 11:44:48AM +0100, Konrad Dybcio wrote:
> On 1/9/26 9:38 AM, yuanjie yang wrote:
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
> > When the power is re-enabled, only the clock is enabled, leading to a
> > situation where the MMCX rail is at MIN_SVS but the core clock is at its
> > highest rate. In this state, the rail cannot sustain the clock rate,
> > which may cause instability or system crash.
> 
> So what this message essentially says is that dev_pm_opp_set_rate(dev, 0)
> doesn't actually set the rate of "0" (or any other rate, unless opp-level
> is at play), nor does it disable the clock.
> 
> Seems like a couple of our drivers make this oversight..
> 
> I see that originally calling dev_pm_opp_set_rate(dev, 0) was forbidden,
> up until Commit cd7ea582866f ("opp: Make dev_pm_opp_set_rate() handle freq
> = 0 to drop performance votes")..
> 
> In fact,
> 
> $ rg 'dev_pm_opp_set_rate\(.*, 0\)'
> 
> returns exclusively Qualcomm drivers where I believe the intention is always
> to disable the clock.. perhaps we should just do that instead. We don't have
> to worry about setting F_MIN beforehand, because a disabled clock won't be
> eating up power and when enabling it back up, calling opp_set_rate with a
> non-zero frequency will bring back the rails to a suitable level

Yes, calling opp_set_rate with a non-zero frequency will bring back 
the rails to a suitable level. The other steps are unnecessary.

And here I just choose the highest freq, because I see 
dpu binding patch:
dpu_kms_init(struct drm_device *ddev) use highest freq to do initialization. 

I want to keep it consistent with the previous initialization logic.

Thanks,
Yuanjie

> 
> Konrad
