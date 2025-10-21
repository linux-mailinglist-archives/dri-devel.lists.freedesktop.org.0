Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB3FBF681B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 14:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603C0891D1;
	Tue, 21 Oct 2025 12:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjBel/NZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280F08952F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:43:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8QsxJ029841
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YrwiyRfZATb5k2/pvhzdB6tg
 /Ojvbxr5etjGnjqDZ7s=; b=VjBel/NZj/zkmkOHwg4E/r7pzy1GazyeBDSQayN1
 0ZcJhDbtMs1xD+GNdhp9Qqfr4IUMuMYuY1WZr9992UbH7fHDCcDseMnm/d+pJvzS
 VGRsIZi62G+QCopfkjzao2nK0j82YHubb0eRhf8VCAACsR/VFwvLTXdZnyoYXawp
 s0kdAwoHFohAx5g9wSWQc6gxOvauaGbxr5NSKNISrb927F3qpa8T+/OCagMx4kQP
 203SXo9m8AWCJQYKAFhJ76G4Z5n+6iYBeoHR69EzOkHTPlIV4yjvnEeUV4ozJVAh
 +d1voX+AREa+3V3c0jUSa6pTGY4qtk95gY/t9i3FnwY51w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge0q2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:43:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-87c1cc5a75dso298739946d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 05:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761050617; x=1761655417;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YrwiyRfZATb5k2/pvhzdB6tg/Ojvbxr5etjGnjqDZ7s=;
 b=AKca4og2vkO6xqWc66LSshuwfqzCfXzaNoEzntK5xisG27RZ8dVbNbl7X9XwSWbI1Z
 ukLHMqNXWvqVw/wctcDD9Qzrm0rbTIPDhnJq24XrEk+Z2PsC6G77MmJ6Ly6weW6lcl/P
 RSj1/x0W5ob4CGvXUhOzuO/kM77acjlp1MfxUK0WHMBQCzZtkqX34utn2ats6KGfYDW+
 vfxHW4IeYQ77Rtkm23LVTZPFTcFKN6KdRdIlM0+0VABjAuXvqhCocEY+iRfPdXY7C+l7
 7SP9htu0/4M+WBiqAW4Ko1+/0gQxvslWKO9b+MuMoGx4ZtP4oIcJWmPTiLQxLmx84Rrd
 EW8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn/oMjdWDXjRC0wGp1s9dl6JRxXSjW3/DpwzhMbgq+wu2bvr8FXZ+qDZaJlJq0wlYPrW7esKOYAfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywpw5Wp4fXvpL9q7pmCH5WhvdfZYo29sOpwbfywwjJaqqgdMv9p
 Xaxb1hY/W8c81uvsXznkOy6fcGvAutyaizoStI7uH6nrkvaKFlrFK3YIhKeFKb0XsTJbkunJ169
 Ja1SZtgublZQ4+pGfZRrarqXSnegySKZ+2Tyu5OYibbVKqkVoq3Qfgqv4kuNn5UQvjQFY2Vs=
X-Gm-Gg: ASbGncvVqxAUNJc/5ORCxCa1emQ7ng84e9L4HZ/ei4y5JYzQXOy/qghgxUV5MXuAV56
 y3LgecrIHVAeBwfNiJx9hYZrd4z/FFbyl5AEXqDO71ROQEua9iOUw6XU7R7XXpCdLNSgG9GeOWY
 tO5jWgx/v/UnCuQvVodhARgSm+oJTtGmkmUWgpJ0k6Na1mjUA6Qob1/8iE8+Tg1H27BNXC0DS3X
 A/pPSebmgh6e8Fttk9HsGO/LMXhtR51NBQNDVKD47yKXCe3mUh9oTkDHyPNyLwuGMPsJcL175gv
 N+Yb5RHYnXIK0sKeW8ZHwAepD2DpWg+Ub6KrW6CNUTnLOjILsq7fzQLNUrbgiyA3B7Ye7YXXo33
 S7G/hgY1H/CjsB9WoakDPkclQQvTqbyzDCW0xORp+RB2TwEE6a6CqOeDr8lhNgPG6Zdp0XZUmNf
 yoDZQGXI/RLbo=
X-Received: by 2002:ac8:7f54:0:b0:4e7:2626:3de1 with SMTP id
 d75a77b69052e-4e89d1d77d6mr181931681cf.3.1761050617288; 
 Tue, 21 Oct 2025 05:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUPVtv6fqRAU0s5kXiWZo8BfsrvJSnK9mxysoo9yDRgK/Rw7l9S2aSKn0z4+RNQtpmmJBkRQ==
X-Received: by 2002:ac8:7f54:0:b0:4e7:2626:3de1 with SMTP id
 d75a77b69052e-4e89d1d77d6mr181931391cf.3.1761050616813; 
 Tue, 21 Oct 2025 05:43:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a95789f1sm28675421fa.41.2025.10.21.05.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 05:43:36 -0700 (PDT)
Date: Tue, 21 Oct 2025 15:43:34 +0300
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
Message-ID: <nvyjnmd242h3muahzkyii7o7yssrb3h4gbqdvpjytu57nfu46h@s2fdz3tnq3f7>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <658446d1-5d3b-4924-a446-f26a1a8b9be6@kernel.org>
 <942989d4-7a2a-4087-b761-ac8d8bea4d03@kernel.org>
 <wrttwblmgfrey23n2cik4to47ls3me5wq4uvxbj4cwocwgp4k5@aageyrmajo7k>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wrttwblmgfrey23n2cik4to47ls3me5wq4uvxbj4cwocwgp4k5@aageyrmajo7k>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX1Wi1hY67zzI8
 HVdfxrjsypqS8WGeDIEbkkmz5LB52jRNy19Ank2/jodQ1IaroQInUAYxMqytHn6tITLCN/LcFJ9
 HhHWR2jJ3ccjX3xfBoFZN5/d/AyAb29ZlMNMJCFMz31kKIejeML3w8O1fWUoMPjKJVgo1PufdtJ
 KFcECrriunHRTjpfjoYqgIXcJhn1BLjQB0w9wSv2dHBymuWRXenQGawO3u0fQtIxmxdbcc5qn/2
 zlaQTqTO71U5zawE8oEkMMz5Zq9c0Xc2KYOKUgINzpLDIl08KKASX7k1rhMZpQ32U1ZB2PCm+WT
 EZ9ToEm1GqLnzl0vxt0mwjof8HRA9Kl9q5F7ItPYBWTOsqJ1wd6eAHSQHQQIAqN+LEmiF/pnrSf
 TH1ocH8WpnxcndjTRl9unc2i2KQ/dQ==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f77ffa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=hZVqz41iNrEH_Q0D6mkA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: M2VhTiLrufNmCwbTIIEsl5x3FU3LdBY0
X-Proofpoint-ORIG-GUID: M2VhTiLrufNmCwbTIIEsl5x3FU3LdBY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
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

On Tue, Oct 21, 2025 at 03:34:26PM +0300, Dmitry Baryshkov wrote:
> On Tue, Oct 21, 2025 at 01:12:14PM +0200, Krzysztof Kozlowski wrote:
> > On 21/10/2025 13:04, Krzysztof Kozlowski wrote:
> > > On 25/09/2025 06:05, Jianfeng Liu wrote:
> > >> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> > >> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> > >> use msm_dp_audio_prepare instead. While userspace is still calling
> > >> hw_params to do audio initialization, and we get the following errors:
> > >>
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> > >> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> > >> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> > >>
> > >> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> > >> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> > >> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> > >> hdmi-codec driver can work with userspace alsa.
> > >>
> > >> Tested with Radxa Dragon Q6A.
> > >>
> > > 
> > > 
> > > Missing Cc stable.
> > > 
> > >> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> > >> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> > >> ---
> > > 
> > > I confirm this fixes the audio over DP/HDMI on X1E laptops. Please apply
> > > this for fixes.
> > 
> > Forgot:
> > 
> > Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I'm still waiting for the response from Srini (since Oct 3rd). If you
> want it to be applied quicklier, let's resolve the question if it is a
> correct fix or not.

In other words: from my opinion, the correct fix should be to make sure
that DP part is ready after .audio_enable, rather than depending on
.hw_params vs .prepare behaviour. Otherwise after some changes in ASoC
or qcom soundcards we might end up in a situation when DSP's .hw_prepare
is called before DP's .hw_prepare, ending up with the same issue.

-- 
With best wishes
Dmitry
