Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HxaJBZSnWkoOgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:24:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47902182FB1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A377010E4C6;
	Tue, 24 Feb 2026 07:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pr0aYSNt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EN59c3Hz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD31610E4C6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:24:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O4Nmgl2016917
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 75bYi11fyYiC46XW/yzaxaazSdDaY5pv28Q4r6DamKE=; b=pr0aYSNtF9VAdAMB
 ZIV+HgNAIbPvGd4tYTlks3ov7Xfys3dUfhFf7dps84i4jTtKkl9N3YOuXDqzieaG
 +AFMa4McAXPCNielYf/uvau9TQr2sW8jRfadXHMuyS71LR5NDU1Npq96a2iRelPU
 D/3/pFnGGs+TTbnuzVP8mNGrkXZVddO/ie15mRAO8lJd4kUjZUssu/uWm5mKDPEC
 cqdUWPPgY35rn39uHcLHAbJSnCIR/lMoi/iTpDTVIpCdKcxL1MLYlcxD79pEA/Kx
 O//5vDPWA2msoJ1HRRMWb86TfZ7s7lobo/tayKhoTvlAZsNAb7aTY+EwEsyjCa6Q
 zGTTRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69jr65-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:24:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb3fae6f60so5982754585a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771917842; x=1772522642;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75bYi11fyYiC46XW/yzaxaazSdDaY5pv28Q4r6DamKE=;
 b=EN59c3HzF0TcPBaXNiOeuTEp3C2+Gr9dsuF6Khoym2P07JwYJdQRadH7dRBQsgw97I
 ynDxyMLuRnQyblLXqmyOUomhvyGNzZywHoFWETedrI7Hom/ayOb+8bgjxOhT0zrQtt/4
 LVnln/b52FcfppoVkCxRe2OrwrhxNxqYl4pRwY5H5reGKYU4+M2ZDV4mdujkUQjo13Ww
 9CE819kihsCuCIO6Il0OxDjNhqoXSDC3OLI2Mn7fljJWwuGemRsO6Cv0nsUm1dqvN1wI
 dEYacRV9y6zq8f78xjdYtgpBDBYOxDlG+oag1AOwjHz+y11Ryi9+klynHC5Jkp5d9hYw
 p6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771917842; x=1772522642;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=75bYi11fyYiC46XW/yzaxaazSdDaY5pv28Q4r6DamKE=;
 b=iUuLan2Qfmleiw7IkivbVdn+t6OV08h7UAxIZWPL2HlIVlXNSlCqLybyj0draVaB+4
 iE0gwvFFf8jP5ThpoUWc44o5fyvwcb2V55FF3O5oFzC4RS1uB1taFCYJO8pS5yDtPGwy
 0cx56XQ8Ai+oaJ9O4DGx/TJQaqLZbKsckodX/kHdq9JZ5Ku+aGHurXSF61wgrWI05s3B
 ieC6hqpkU2SgqhBa0gWA0Y2hhcY/WSUonBz1WFXxLDTwkqB0yAyq/hEW7LMYLQAHm7bX
 d+9NXVx2Von/Cla6FagxkeNCjj/n7hnjjMhzj6qydChm40uBm0CFEmiDnr1h9sKDrQsv
 /sCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfq+yTeDjpvwJoVl4OJrH6dsnI2iVbS4LBgSbIz0+5W+nNuB2zChZZOO7NmMfCb+5kZo3Ez4ulz1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmI8u5I2V/kucTIJF9lJ3KRRwBEI6OPQMH7vEndrBnZz7pnbZ9
 qzuTeu4Dtvahc+g5L7tJnZ/KLtmwbOUbYZwWFnPZiGJWM5mGA/uFGhy72NiM6EozDmGhTM6Hhmq
 VFd+2MKWQUU8ChajWmxEpa5B9u6jc55+ZLdUCgphHZPirbkk03ZIslOuMNhlfJKjppdEP7IA=
X-Gm-Gg: AZuq6aIHiFbFhNmICGkPexdx79ZB1dNxdtOAgXQyQMsi3AqzrjSCtR/5Dx/s/c7ekBm
 oJnMKmMfp2duLWQ+pRv9RCAeI3bcvl7hyCjXjPWri4vv3YmYG4kLYneFLJsrC93LmFdejDoRCRe
 AiZ11jdv4I+kQP8u0U1ncR9vo4cWm6rYMPntFIosKEtKDXRvrhdg4QRPZw+4sgpAO4Fa/CL0KdW
 E3KPTm0Rs7/AEqv4IGIZY+32DfNH998scfr4LHkcEkne5Y9f6hvbJ61610ZTwEzrtxuap9gDrgf
 8CN25icQTdKCVDvdbm8abR4/FLZw4LOeKR2+Vs/2m/ZWw+cMOXVkAZ/3BJRCh59x0qsEQORwhjO
 n/DyhVtO/Pbz5pIjkzqB7Kib5zS7h7KpAmnPLoh6ybZeVAoW5uR1aRmnAoKTi5EkZ8oJP2Or/DT
 OnijiG6IytiO8U6t95blpkwuIWm0HRXeykH/g=
X-Received: by 2002:a05:620a:3949:b0:8cb:4d46:7a6e with SMTP id
 af79cd13be357-8cb7be5dc53mr1837544785a.10.1771917842095; 
 Mon, 23 Feb 2026 23:24:02 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:4d46:7a6e with SMTP id
 af79cd13be357-8cb7be5dc53mr1837542685a.10.1771917841521; 
 Mon, 23 Feb 2026 23:24:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a770ecb7sm21372311fa.0.2026.02.23.23.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 23:24:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260214105145.105308-1-mitltlatltl@gmail.com>
References: <20260214105145.105308-1-mitltlatltl@gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming
 dsi registers
Message-Id: <177191784049.440843.1605828631777709323.b4-ty@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 09:24:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699d5213 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=-6-yqrtIc-1OGEPD6ssA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: esYb1-XwE1h3g0S2L05u6gn74t9hf0Xm
X-Proofpoint-GUID: esYb1-XwE1h3g0S2L05u6gn74t9hf0Xm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2MiBTYWx0ZWRfX8Hj71o+5lSv4
 Ogpp1I+gYdQ0xZf5yH/rqGN6jXyJdgGElCaNlyM2WWWhj4hplsu97vmGlP2pAExgczmArmtTIEZ
 gp5CFzl5Y53rbSEzwzXtdfh1hEWsUIXeHx4ysd15xMboOFDxeIoThCYwJreMSG9pXGsz+N5HFa2
 Fq1KEMyw8i2aJHzBqCgKsgtigCKDQr8+VxNhOL9Gfoe79EouTKQpCNNWaoAJrxpdJZA6vsYQCrk
 q5lFeaV4KC2WDesvnDuht5C0F9rnHTF/tY1/DV8W3vZl1+koln08yrABtZQvisyJ8D993V9tKXd
 OKhxjarAsxLTryz0Gd/wVeju1DnT8zc76AHkkD6rVr+OjNzFJwPsMaVchMcjLz7O0VjGiQHXp9m
 3zYRKwyM2Wb2Jlmypk4kw+zPZ6ZbmSnyQfBFuJYtT2kkc84S+FpHL+mqMnNkdIZvJrwlKeSTr6A
 7qE5jKnJ9WBI6/rJLSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240062
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 47902182FB1
X-Rspamd-Action: no action

On Sat, 14 Feb 2026 18:51:28 +0800, Pengyu Luo wrote:
> Recently, the hdisplay calculation is working for 3:1 compressed ratio
> only. If we have a video panel with DSC BPP = 8, and BPC = 10, we still
> use the default bits_per_pclk = 24, then we get the wrong hdisplay. We
> can draw the conclusion by cross-comparing the calculation with the
> calculation in dsi_adjust_pclk_for_compression().
> 
> Since CMD mode does not use this, we can remove
> !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dsi: fix hdisplay calculation when programming dsi registers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ac47870fd795

Best regards,
-- 
With best wishes
Dmitry



