Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A37BF6784
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 14:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1290510E5DC;
	Tue, 21 Oct 2025 12:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgMYy2vd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCB610E5D7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:34:32 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8O75e002534
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JiM0XYOrFQ512EKDfSy47FN1
 IW3pchq+uQUmcduTE64=; b=mgMYy2vdsL+0tuZCKHpBveYaNf6XwSQNqrdr5zu+
 cEfXSAtFbPcBPCeBxSo9ckTGE2RKTZrSjI2Uxw952PE8+A1Mm1NXEzWTKVcUUDHi
 GfeTdE/RuVddRqiU8vUn9ZZeHsIRM/LQOoTzW4nksO6M6ETEy8i8b8E0T8xrXy1b
 62p0WYek8QgvkGx0G2mswg07IsD46Sy0TYAte6p4eXxZNvWzdtYfmUSJ+Z+cvR18
 RlrX8mJqgByxiojUwl7LIokO/auHrG9q3C7nuieqinRpD2y4b1wI4o6zaFKYas/c
 q2eFP+O3F5prt9hzRbqhYux47Kciyu7hcEkcHicvZZTo1A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w68sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:34:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-87a0e9be970so207448266d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 05:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761050070; x=1761654870;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JiM0XYOrFQ512EKDfSy47FN1IW3pchq+uQUmcduTE64=;
 b=W24J4KR0fTNGj17mUI+Pm4RVgjllVNmDBJdNdSsttgK++nS0k4b5vWiZqSHEpZR6x+
 P3L9VKe8R4Q0PqpTTt2XkiOgODv8vbYSqCtTfw85suDwVuiC1cKQPUKfvuMDyPkmoXk+
 lPs9FeRn5fBA9TRo1G5Q9tvVj60lzdmHFVepJwwfpBmfdTYDXYsTKxZiK3OQ/dfL0ecy
 aYjmp0rB56tS8xnqzs+Zl9cSnqH1j50+uynGH+OOxZkJ0Krja7C3V0iu6noAEMzFZSjc
 18SQuad4/N1mZfOEX4EiZpgVU8B4vRz4kBVyv+2rdA4HRFVxO0xly6Nc4Bj7ZqbidjgK
 ax+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYyugcSqiwai+XVFP/w/dweybEMcNCgLsk7HrZjpz6Y0YZUvRf3O21maleFYLfuvMX9q3l8S3SBSs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtYnv4/kz2ws2wOLuVTzkOi5Twjj8Xw9XNtH/jxvNdTEe+xvid
 QC/bRCpvrBUycbq62m+u4p+PIlSQO2i9GdoXe4qLKlz3T4G4I04U+r5vus/YRtc2xd86mNHqTHr
 scSdleih10D+/5u8RZAGPB0n3Cure0N7T/uG+pLbIzOUjTxVQUnEB5YVjZaaALQHDsLqEZ9o=
X-Gm-Gg: ASbGncsTgJXwX/R1OueNzFxfPSW9l2lSTReXct90Fd91QME0aVQI61cyULvpn82vQ7Y
 k9s8fKz5uMrc0d8I0ZYz5gbDDOE4fVHdBHCkMapeTygsTIGa2/rdmrnHHUZtBg11ZUxzhS5oHgF
 8PMr1r2wxKJR8/XHao1sllrj4sJTYhcuRW+68fWk5is8vT2bZiLyLmP/A3qzUWfot0jpYumyrQ3
 JI2+Y14RGlWq4u7Ucaxw2KetN+7GCFYyewDOujTlT3qwMt32sR1/7RwrEswHn4jgGeEFeLR7tqX
 H0zxVaR6V8K5ou4fnbNRvBX/FZBUXVbSLxZK2wZBL+PCMB8b3Igb64+Z2JNjiksneK+qZmLzPoi
 yWv8ZugcpmbjvIbEQnTnGZjHJKr98Pca6wulPl1TbfV77FM0s3gN4cRBSl1+5jCvACqXj0IgJzd
 J9VkSQOknDmbw=
X-Received: by 2002:a05:622a:18a1:b0:4e8:b18b:6b0f with SMTP id
 d75a77b69052e-4e8b18b93a3mr135499521cf.69.1761050069846; 
 Tue, 21 Oct 2025 05:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF4sae4/F0/n5KKexSlPmPvtAvbiOc081SrO+C+Cpbx6Ztk7aNXlSzq8qzHjHjdWz8bhc0gA==
X-Received: by 2002:a05:622a:18a1:b0:4e8:b18b:6b0f with SMTP id
 d75a77b69052e-4e8b18b93a3mr135498931cf.69.1761050069292; 
 Tue, 21 Oct 2025 05:34:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591def268casm3564753e87.104.2025.10.21.05.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 05:34:28 -0700 (PDT)
Date: Tue, 21 Oct 2025 15:34:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, linux-arm-msm@vger.kernel.org,
 Xilin Wu <sophon@radxa.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <wrttwblmgfrey23n2cik4to47ls3me5wq4uvxbj4cwocwgp4k5@aageyrmajo7k>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <658446d1-5d3b-4924-a446-f26a1a8b9be6@kernel.org>
 <942989d4-7a2a-4087-b761-ac8d8bea4d03@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <942989d4-7a2a-4087-b761-ac8d8bea4d03@kernel.org>
X-Proofpoint-ORIG-GUID: M0Obd70QktajFCIfDmq8ADYKvnv2DZcg
X-Proofpoint-GUID: M0Obd70QktajFCIfDmq8ADYKvnv2DZcg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX0DOEA7TwuloJ
 RdsriOOOQN/btXDt4E8J05nIDdPzO/L367gTV21IfKcreVFCIoH2Dk6lkis2ykBG9lI4465okgZ
 h6BlKwD2l5J2HpWMLFHm/AbuXUsMK0mD1fkHG8+uis1MAlajWP1rW9TrAlpHoEyAketQigXJ/G5
 DwhWO6/z8N4kyuy8Y57rbjemZ/Tp4M1m7pwk9GTxReLsebqZn5Dl28A/EZEihXfelQ/srOpbzzJ
 Ef+5tXCrr/2Q3ZPCrx8traRjM+xFLpSOYHUw/wpPXmyqwKqA6L6CDAdeG/4V9838NSaeGNkN4e3
 rEFc0o0KSZ1owzQLckOTeHm5sNJBdMeeWd16iNdlXbqGolgvC9au9FgK7cJRrv1SKc+Gn25I5tU
 6mmIEeMMfwhx8jz7vOs8wIdlRzUO6w==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f77dd7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=SZM-PPiLjDIjgASHbv4A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
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

On Tue, Oct 21, 2025 at 01:12:14PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2025 13:04, Krzysztof Kozlowski wrote:
> > On 25/09/2025 06:05, Jianfeng Liu wrote:
> >> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> >> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> >> use msm_dp_audio_prepare instead. While userspace is still calling
> >> hw_params to do audio initialization, and we get the following errors:
> >>
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> >> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> >>
> >> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >> hdmi-codec driver can work with userspace alsa.
> >>
> >> Tested with Radxa Dragon Q6A.
> >>
> > 
> > 
> > Missing Cc stable.
> > 
> >> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> >> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> >> ---
> > 
> > I confirm this fixes the audio over DP/HDMI on X1E laptops. Please apply
> > this for fixes.
> 
> Forgot:
> 
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I'm still waiting for the response from Srini (since Oct 3rd). If you
want it to be applied quicklier, let's resolve the question if it is a
correct fix or not.

-- 
With best wishes
Dmitry
