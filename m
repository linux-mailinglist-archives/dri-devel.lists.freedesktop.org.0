Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDWSDtbmpmkRZgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:49:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3221F0B1E
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C49810E82D;
	Tue,  3 Mar 2026 13:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="irsBFP/H";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXeUgZjv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48D410E828
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:49:06 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239miIO2307491
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 13:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9qTYU08p+T1/fcxXhU5ojAEg
 8g2sM3hAogy14uVclO0=; b=irsBFP/HEFrmEibdtU7XU03+cBf+XO15fNus2Fcb
 Ks7SEXwMWmYCO5nrhIsorkivcrIVQmw8G+QLZ5tie5xr4mEgLj/rvucKjyFLSD7Q
 kuxsbzZMirf3NUy0YVNH6boxb7J3IASf9UOSe9MR2B0xXt2S9iSf1PESnviSUXwD
 zYQm8vl8lz6PReE283y6z73TtbBhwgUe6bvhOs42mFNklry6u/xEpbjRbEk7SW6X
 Bmvpz2Rzv8y7gVyFy1WO8eHYwQzb72gDFdbdufM9zAbHB4CPhm8mk2rQZC+8Wg4e
 sIqbbtlxyiCfzfkf/9gu7B4xGcfrIDroU3EqznvmJV8YSQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu8sqc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:49:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8950562d351so561458376d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 05:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772545745; x=1773150545;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9qTYU08p+T1/fcxXhU5ojAEg8g2sM3hAogy14uVclO0=;
 b=NXeUgZjvfsFaXdXTY90qtF8MRDQNeDbHq1DluxQ3iVQ5ikFIC3y9xshMgV0rA8I/b2
 U/N4xE3N9E1/sKfQt421YJPtvxv2bgpdBsAcOesgJsrFR45XtILMrcUox4EXQJ1jepzd
 0knD2bhSob+vUSGVqYQ1UhSSe5T/pkr9MHQMzyX91Pkwu4xK8lWjgdsDVqjMG0bGxOTG
 tX0gMgDIulssYsYlSUa6FIdzauNIzYU4omX2FJvUIOGfG715YahojssR2kKQWTbYnuoB
 yFs0oWkTyAScSQj9q8FARBmcjME2GYfvfb3iR4CzEOxZYW2a8WoqDpHxjePPLaK47owM
 q2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772545745; x=1773150545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qTYU08p+T1/fcxXhU5ojAEg8g2sM3hAogy14uVclO0=;
 b=mT1YUYEsqTDFCuPeHFkaHZnQxDE/9CadUIkuZCRkLOmFKRJ26g63mcuijN41pWVnwf
 lVrBBzG0CKWgYJsNTNhCMy/at93x3PHFmOPSh/IFkVfs/gr9gVoUbU4JRTIoqfRS0poQ
 tPP3Iq7I02tOVaXt5DavrQQp25aNJqjmA2Xmk24PyTNyX/fPqA22GNo7YOiDOZnBWDsn
 7Pup+hCXuAcov6kysWdsNytWVgZ7qa9Fskab3zSUVgFu6LcVVcyDUw/TiKGlC9X7WR+M
 lCx2OnMFMv/985ebw7nvLme7UgTMCIHC12Rlpxopywa89/Btx2It9QhYnkxPCSpvuHSh
 Pk+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3LnUbp+vMRc93QW0EWmO7E54Q4q24KSLzUPQfbAZy12ywb2rF+GF5B3uk8pBptH02dPlZFu9vUnY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+exaug+b+f2XxZ2tftPq3Rv4WlzO/wPWPzOQvUGChi5BCke23
 fgP1WiSEHT7AouJswvlL0ZUKtETtnTdDuo0Q8MZ1AvIbevYvNdoSOhurQTVMaaje58uTQUqI4M2
 JEbjtTNvFyvi5m9x7GR7MvkaCzTAHRhFetasExsM90VpPgapGh4qgZycFvTxZS8OY6mZQSaU=
X-Gm-Gg: ATEYQzxJjaMshq8oqkTCNYs/dVn4/c2ZjBAKnLnfM7bGui27zgTr/QuoKW0chIzgFR+
 v8V5yMKlOzAp0M3iwz9uzM9pTWHj5vSWnnKaoH1x/3i31g5k4IhoBCHohsiuCPRwoiKPbpqPgTs
 KSJZKbfBZ+LSRCbloKNoWE1R4HAUyN19LDEnB96bMWvystbpajVsEw2OcXvru+Q2XNWmrtI6v/C
 iHDszah1AysswwPVi933lei6gso49fmUIJvXuTM8Q6TPEbE3fH4Jz6r/HaJ6Paumm9ExFs5wIR6
 bNqqSatPb3VhFlqrhxip9Jj98idjCxrjl1ytSawfzq8I3pGK5vwYjKYCHtYieoI7DjxYyYJNMRq
 zuue0ukSwFFO7znEn8f2IC36HSvkf437FSv2/56vvZrr0dqbDwYtT0iImlfz8X7AFGxWRYGAHug
 2lAq8p7N4g95IhxtuBT2RknqOmKUaq3/XzTpQ=
X-Received: by 2002:a05:620a:1905:b0:8cb:3505:443c with SMTP id
 af79cd13be357-8cbc8df0658mr2155304685a.44.1772545745266; 
 Tue, 03 Mar 2026 05:49:05 -0800 (PST)
X-Received: by 2002:a05:620a:1905:b0:8cb:3505:443c with SMTP id
 af79cd13be357-8cbc8df0658mr2155301285a.44.1772545744808; 
 Tue, 03 Mar 2026 05:49:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123578ad6sm607700e87.57.2026.03.03.05.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:49:04 -0800 (PST)
Date: Tue, 3 Mar 2026 15:49:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/8] dt-bindings: display/msm: qcom, sm8650-dpu: Add Eliza
 SoC
Message-ID: <hdwuintcfv4leg534qedh2segu6vn7fhdpl75rddwns3whadvo@n5jaqp6ea3sx>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-4-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-4-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-GUID: NdVcspc2zBxp5D4BMBGfiKLJroQpUlN2
X-Proofpoint-ORIG-GUID: NdVcspc2zBxp5D4BMBGfiKLJroQpUlN2
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6e6d1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fTnWfZjI5X7wAvt4R4YA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfX5fkJ5Pkfv6rA
 TlKKHQ1HW31zp0XS5WK3H3Rx3yktUYypBjATdvstsGrX7biGhrgd9Lezf8c/lgM20sXQ2fSXAUa
 Ub+sh+jL1EyIypBhgR3+jvPXc75VOGEMx0I0q2EHaGxl0O0eGOqBT8tVX6avdM/T+iR71RNY/Hp
 DocAenWaFaokNDCgDFF2vjeq9nYjQXuGFik5mXQ9yxQgfsZxKmxvwdKsRD1xDZvzaCaMz9Z77i1
 8ZQHe6EOv6ALnbIj4V5zYTRjuqKnm+zPGDaeIZ7jlqiD9ebFgoRsnCugYYrLcsDVlk2skZWdB5y
 WKjHOUiBMWMRxirnJwR/rRf891Q58sXCnzktf/3wNr8UgIC4YNcVgDDR4CMu5ornVxqVXUrgd8Y
 wbR4n9aJAc/qWX7tmSPiujNDiI7ExT1OxqvXcxBIuR4RUYCvd76n0CihBYvMIRkNAxLZiYymJxK
 no/1zSXUwIO4HynfsOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030109
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
X-Rspamd-Queue-Id: CA3221F0B1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.906];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:54PM +0100, Krzysztof Kozlowski wrote:
> Add DPU (v12.4) for Qualcomm Eliza SoC which has noticeable differences
> against SM8750 (v12.0) of mostly removing blocks:
> 
>  - Removed CTL4-5 blocks,
>  - Removed VIG2-3 and DMA4-5,
>  - Removed LM4-7, DSPP3, PINGPONG4-7, MERGE4-5 and several DSC blocks,
>  - Added HDMI interface.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
