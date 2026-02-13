Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNYCCclUj2lqQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:43:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE39813853C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59A210E838;
	Fri, 13 Feb 2026 16:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvfm7hlJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Spw8/RSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEF610E837
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:43:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61DEk6Ra4096920
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=21pPGFIL/zCrhSvYIYVV0SyF
 kdzI1vjuhcaXVxySdG0=; b=kvfm7hlJLc3wLBNsbbesNIzs3hQZgCZWipk7fD3z
 uRk4coh/UiQF6uAiwpD2bK7+6ph07QbnRnxGr8aJO8Qh2TUJw4OEqYY8H+pZ5g+y
 IHwroE234Iw8XooYJHKBEdyFVX+lgGx9FGF4fr3NDeBHofKZmcmgbsRBZTfApJAx
 6MY5axkXXMB7irXO3FKnL+uqGlrIVJ0PkvYe4SIvgXBuWfUYB+Zti//ML7Jlwv90
 8iAtiZ714vGRgSfQzvxt8jfDsuKbZ5prDCMyu962PkpZOX++UQc21CjBdPlroVOW
 GfVo39Rrxxr8kDPVUZOtPj+SCSe9l/I9KeqP/dVrFAesMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca1hn1gy0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:43:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6ae763d03so124700285a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 08:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771001027; x=1771605827;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=21pPGFIL/zCrhSvYIYVV0SyFkdzI1vjuhcaXVxySdG0=;
 b=Spw8/RSI4YDL6i91XeQOh29SXjSPvgjKIv8m2QuGINpzxejLXEzfydqSym/WnULudA
 un8WSuo7/YMyTHW+7YCump8Ku3jqtTVp6gBp5U6rP7YMV938p8LB5EzSJO24DfQWmaYL
 saJwS73XHyGaaMPuap1o6DeqtcEJwYvrq7R1IIW0pgALFcWxwmD+RBm9CxP9OrJexwpC
 6ItSLJcLuIipLK484TJeHuJaODnp92wzNSH1Jauh/ah6TRYiZelbuF5PMdVVJ81qEDvY
 LMEuKCQvkGwH4ZJcIxNquW7T1YHlq1MgUp7LB22iodjwns9zIJMwkO/07wq3hamKdw2d
 oD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771001027; x=1771605827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21pPGFIL/zCrhSvYIYVV0SyFkdzI1vjuhcaXVxySdG0=;
 b=eWNMgpoRGxRSA+ivDsz4OvN+4txnibapfJbwbugFSj+UQsAt2Fpdhwc89sVhuNXIP4
 pLzdmdutmc973Jl40+OgczNpuNo1S7kICRiHToWxIvaMAqpYMk0AlW1DfvrPgjyWO+yG
 YvlJLrSk60aAud1l8ZbfR31p8Kz7TVu0kw+A80yg2/HsPpl7/ockmWDi0TI6bpZriecs
 P0U6eoKSNCz7vd91u4SJcTo+6LOaDTxmxzdJJ4CXqt3AzeOd3hUIBZRPBRJ5B++9hnIY
 I8nwcazP726iSu4RHiHbkUxcl2rGQIqHpTZNVbzxRtPrne5G4202Y7MLvztZ3d8KYjDp
 a6gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUsx1GjSVe3uF7+uiuY/EeJdM4aoEq3ZCRByZyly7QN3Zq3x5g6v9hHPdoSfdlShqtF3jALxmFKug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/ZQQX3Ny5851PM1ZF8/VP8qD4+Ek0C1eEbcXXFeqxZqcu8xUr
 0CR5R7HYwCC9cjUsF0zTeqwN0opWplAUa+Rhs6z02PyOe9OursmFLedBETUafdr/E2e7rwiKr8T
 M7gihidwDKL7wO2rWhoEztUgmW237faYMXge8MRasoN5Afe4XdXhnOyNqakjhCRHhZSzgQWY=
X-Gm-Gg: AZuq6aKfJcwaFE19b5Ze5LG7yl+InQy9L2jNMx4IZRSNy9yb4WeQj0I2QA+05Cg++f7
 28EmvbOPMKj8EiEBlOD2YJJVleimiI8EHARoHPJcEDWvqM7nd3RoRok6jV/YW0/wbFMWHscxl/X
 w/lyrlhKQSHnifA3X7IV05attjxIQU57LmThfgGf5UbCaC+GuAVngGH16oQ2E9dqeBbuhGnFQNB
 N81OeAAgQ6pkQ3GC4PhjBidMnEh9VwOhRFZVyJtsPAMtP7GUdynV1/GnBFRg/a6TOYRUBFIa3RI
 mRUXrCfQopDYBUa7C52UnwVOkBWtGVSlHBLyNA8BKbK57hgc34URU7Qo4d/2PfvlMLZWiyVBzbP
 fZlr36TIaaAtdCAeqmZ/T74tELiB/Gm25NmvggQQLKVBJPnW44c9KIbBIrLp4mYsknXMdRTaivr
 Z8txfjQMsN0r2cRU5uHV8upB377L+3TARjxV8=
X-Received: by 2002:a05:620a:691a:b0:8c6:ee09:5eae with SMTP id
 af79cd13be357-8cb421628bbmr291427285a.0.1771001026653; 
 Fri, 13 Feb 2026 08:43:46 -0800 (PST)
X-Received: by 2002:a05:620a:691a:b0:8c6:ee09:5eae with SMTP id
 af79cd13be357-8cb421628bbmr291423485a.0.1771001026154; 
 Fri, 13 Feb 2026 08:43:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-387068e5ddfsm13919101fa.23.2026.02.13.08.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:43:45 -0800 (PST)
Date: Fri, 13 Feb 2026 18:43:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
Message-ID: <674jl5pvmoq3vktnc7vpasn43ncx4jj4zhaiegbmek7kqtseod@e7tkjv3uzjq2>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
X-Authority-Analysis: v=2.4 cv=Wt0m8Nfv c=1 sm=1 tr=0 ts=698f54c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=6cJ-CjKpxfkWJcI31lMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: W1j_uYyOQHm4n1D7KWLWOij_OHanBKRh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEyOCBTYWx0ZWRfX5Yfnch+ZZrMS
 x0JlTne3Krl/JVjAGFhTh1VjYOxJccX/u16ajkKEZeMP0drmX5tF9YRGi1HYMRxv5H8IHeICPM2
 6kvqkuHwy+xUsVyHI6FYghMQOhLQOs1PhLXMV5M78SZdfVEBaQThj/qlfYCgX2x/hModX8QAkfR
 AHJZmD6I3XCxPr+ijFCo30lh/3pieY1N57Qfk7WXvHg1qgd/hGPMp1pEYxZQCFifh1ZGVINBf/c
 HkkI5/sRQsHyeiBN+7SrWKrujTfJk15sqNbsqGQu8TGM77nLq4va8BzdqGxIt2NQ/KR1R1kbESC
 CTs2eCVit8O5yMpk79yQWp1ZDIA83xwqjSPFhkJ5vTM2pwOMaIFzQcnf5Ae09odjdF9RyOS/AUM
 mNRlpCvTShLG+W3eEoIEcSLhJiySxhlvJQPAqz8AHbd7t2O3JoQlb5qukDoEZgEC1pSgR9ZmgQh
 sHLx9o34ToXiqx5etlg==
X-Proofpoint-GUID: W1j_uYyOQHm4n1D7KWLWOij_OHanBKRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130128
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:jun.nie@linaro.org,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: AE39813853C
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:54:25PM +0800, Jun Nie wrote:
> dpu_plane_atomic_check_nosspp() currently handles both plane
> validation and plane splitting. For better simplicity and to
> facilitate future refactoring, move the splitting logic into
> its own dedicated function.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 51 ++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
