Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI8eNPBBqGn8rgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:30:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6AC201813
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583D410EA23;
	Wed,  4 Mar 2026 14:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWC9Fw28";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GclEK0yE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620B610EA22
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 14:30:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624E0cBM029451
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 14:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rh3ft9edmIR3MH+5987NLl83
 siXGjWWNjpTNPh6s+MA=; b=XWC9Fw28jkxty6vemT/FJ/4YZ03XfmeBOQrvZz3v
 aAUSKjC4LZbsJ2/k+YxEob9ZBzRyWQYZQgnH7+p3osyok8nabJdWaxbobYUJCQ/b
 CbZ4E/haNGWtWUQ1kdGCMcv2cnCumrb5UPf4U6psywT9Z0KvGuuGe9rSzv4ufcPf
 xG52Hx5ZxIkkdOxhGHImh6HbqZpj2LzrgkvvjJ3Bd4ilcqb45MhWD/kyN7ugdP5k
 whPGNvYZuCgDalh3Lvwm8Q7y18ehxpD52skdUW4Chep+L2OEGySN88IYdmyAOq9R
 qLL9+WGk4UpcjU9O29R9rXpeNd1E5S+yDHM1PVENzantuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fg381-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 14:30:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c881d0c617so4066782185a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772634602; x=1773239402;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rh3ft9edmIR3MH+5987NLl83siXGjWWNjpTNPh6s+MA=;
 b=GclEK0yEDmSRsoeQN3Rtf0US1Q4v54Jt+ATmxXGq78WG2cTuWRx3mRa/nsE3Fs6PDg
 /SHM7zCHw1W/8o0kMAk3eLgvDcR8v7XqKQTG/dQQhgLFW/5eRzjXi/SKpyVQlmMq0QBM
 DUsWAP1YyluJpTK/IrYF90nJ6bGLgccAkCQGnxiEQjJZuuzQbxpMxJbnKeGmef+b84js
 CwQg5BxN/GMD3ZrW4nVKg7epd1wtSxyr2vurst9BKc7UG49HoNSGhY/GX4w418u5DaEV
 Qx0jqmGltKzugcDcRemWCgwrIuVbtNBYaiBs9ZtjXtsjxwpNwlDq2gXis31gvsE2ramV
 a+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772634602; x=1773239402;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rh3ft9edmIR3MH+5987NLl83siXGjWWNjpTNPh6s+MA=;
 b=lEDm8YF0vJtszjjdfsJoZM2sbogep+48r+GAfQq8T6aGA50m4YBFc8fR+v0kThRvEn
 60ZuP/uNug41gwyScD/pgPfRLIUuFUEnVyqwDLfL8CupwR+KRSqAlpKiNXsk+l7VT+TW
 wk5V+b1GoGyz8owcR3PvmHOzo+eko/fzex5ouRl2vK1CgifxlIoz6fMuIJUIVmas4TQE
 rtih1pWtIgyaC8sfBxorFBWrsyIINDPKBOt87VV9Wht+lRh80yZdR5zZOyq/1XkreMZB
 8apTti7R/4Xmmpr+54Y/hILB2hHlkNE3ME/pRyZ4bO7gGYQL2UIKC+Oj5xBHNUTRXd7i
 qyGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq046hXlDUzBJYqY4K99kLZZPqKAnm9CayViMbXE2YkvqE+oCKabBB++wgs+o6ECkp+uMBf0WDcho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWc9jsbZaWE3RFoidyRm5iqVonIdABhpXt9QcybbDJzR0hWmp8
 YMRKpazn6BRAdeHqOUHwp1nB5o5QDh9qEPsHNDGJmeyDGgb2tm4G1UAh7a6izAvAsiK9p8Ey3m6
 tis+C6pO0MSZWHj8e9SLsQNE+29SDU5ct1DDvxBkQyzEuYECEpbHO4E13FhkEejyoXMC4AAE=
X-Gm-Gg: ATEYQzznwwyZYaqz9OeQ43CGg7MkVdNLs1YIEYXrQfTL1edSHDRrx58SK/GfEglDdnR
 L45tqfkmd6EhlGPcWSPxhG7DfBTwjvP5ziE0uBHjK/zoIOd7q+cCvlbHmQvKFmFn3v0KY53wJSZ
 2/BHscpqWB4hXNZAVrrQafiDRcPZH8nRfuwJHlaxRQA4aGMLPit29/+fulno06QQZqOGk90cm6p
 9SCf0y4f542tonJCdZwEXxMe7H0H7CsJKAWiKY20JbU7qFDleDNawokG9kCoLhv/LCfTssI6dOA
 xfyQyOGFJjD7jl5799nKtEKUkf0mn8VaixmtqAEuHyd+2WLnS9JKTC6chSa+050WrIY+HboqVdn
 ZjqWca1LIQSJ63pGraf6RKu3nWpdNr3k/5Rjsm1w04m1n+84Mc5wiG7e9sHlAJbwjt2QhuZmCUN
 zoRlwIqHT7D1FDIs3fu5w9a5zpIOZswaDZXPw=
X-Received: by 2002:a05:620a:29d2:b0:8c6:e224:926d with SMTP id
 af79cd13be357-8cd5aec695dmr274564985a.16.1772634601881; 
 Wed, 04 Mar 2026 06:30:01 -0800 (PST)
X-Received: by 2002:a05:620a:29d2:b0:8c6:e224:926d with SMTP id
 af79cd13be357-8cd5aec695dmr274560685a.16.1772634601387; 
 Wed, 04 Mar 2026 06:30:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12e9d091csm186828e87.42.2026.03.04.06.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 06:30:00 -0800 (PST)
Date: Wed, 4 Mar 2026 16:29:58 +0200
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
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm: dp-controller: Add
 Eliza SoC
Message-ID: <mru6szaucuqii2n5nhg3kg5kcppzhubu7xggzjwu4vzrx7nnbz@u4f53kr7tcqc>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-1-ea0579f62358@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-1-ea0579f62358@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: D9W_NXfY1mDDZbnMG2nC5iApAaGY-n_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNyBTYWx0ZWRfX6GySIT0iCw+X
 n5C9jEcv81Be1ms1hC+sfYoBfHPqHXp6rV5oym4SEmY6Q9RU9kWur9ieH231CNhFE8jMeKPh45c
 v6ejuzADLOrra6P9VARvJQx/WqN/R+nCqGQYDmfb6S0VfoNw1mxb4NUz5Adaxt1m2Z9C26lyS0+
 sXuoIMEVX75qkRVdUxL3DQqz+oVJfq4KAyEQv7fKEi2vteuu8ySqpIQpQuHUaffaN5fwd02aZce
 5Vb+6N9S0JhCONqASLXxKNtry51qINFen8ZBOIFbwqNtBOTz67cZLK8vUfuo2GwWx7Ko+I2ICvC
 WNlZ4y/H4YMDhIojA5kxAZjFCN91ktLYjncaqZjPl+fqYzMqI5TrjUGfbgX7bbkTRJR1QlduGQo
 kJ2q0r31BIIpWDSF8d1PcfEZvcuwZaD3nS4e1X+EJmM12j+9CaU3DAbi7dQMYX5hFGdXhmQcrmd
 8gn6FpUo6zJS/VZP1uQ==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a841ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wa0heElAoa-4UX5PAWMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: D9W_NXfY1mDDZbnMG2nC5iApAaGY-n_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040117
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
X-Rspamd-Queue-Id: 4B6AC201813
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:58:43PM +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
> SM8650.  The device looks very similar to SM8750 (same DP TX block
> v1.5.1) but with a differences in DP PHY: Eliza and SM8650 use DP PHY
> 4nm v7.0, SM8750 uses 3nm v8.0.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Commit msg
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
