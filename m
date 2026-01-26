Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAXrA+e5d2lGkgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:00:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29E78C47E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC9F10E46B;
	Mon, 26 Jan 2026 19:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpmTm/e6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxFbjNns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1345610E46A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:00:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60QHmUd01016264
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RqfsakIPHTwBzETcZdpTqje6
 xP/4nMqp2xVshRQ/NMc=; b=lpmTm/e6ix4LNQPm1ErA67hrm5bi0+CXYTgXGVEB
 5F0JLpjpAhOtHSCDG4vdrvqC2JGo3hCvrEr5e8iZ3F9xYh0FL8olLDjrVQF65e6G
 Jz6c8yof4G15xtOR3MjHdtgW678YRnjlvURa1upnTFISVavfQoASqCblKnTtGXk7
 CM+kgUBwOBUVdSilX3vK7TBANL+8OdtuZXecKObrWvfEeMHye2ytT0PANsdqFpf3
 G/BnHS+NdT/I+N3PgV+FfLkKiUCRrcH9g3LwvfMgqxShe8x4RRsXcgAuNqSE3d4c
 oTGRdGsnap2WRIrzi5qf71AfbPBKQ8X9VO3abyLsJLK1AA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hdkn0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:00:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c6cfd52556so1298375185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 11:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769454049; x=1770058849;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=;
 b=HxFbjNns2QLGW9HW1CQJmVdqWyfM2qdqfveN7hkMhoUxGZP1f8Fn5oKaVZeUJO1jDi
 O1EmBuxZ3ZzKKSF8KItoqfFP+m3UmjyPuTyv1qj6TNShwAQzaGEaEJHmkrptmZDsCJQ8
 5WtzsPrVkuXVouZNeUUfFrROBze3lRN+fmgt2XBj8wOLgBmg52On68H5xPnoC7CR5xB4
 URT81booT53QzJu8HICs1LHYXLx2KYLweppfmfL83HRnli+iCC8++N26zJwOJ5zkT+V3
 ybtnskTCxxT7MXBfuCwzU3R5s5R6xtlAz5+Xquv5u40bRmf1S7WtCPp1OaSRQoSzEg4H
 PuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769454049; x=1770058849;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=;
 b=K4DRsNvENyeMhKIi1gvEbCLrvp40Jy62vLWB+bx0FXfDr2GZglBZmi9cL69Nf0RefU
 UPlLpeXnMwQA/rewCc7bLuPVgoaeknl6tVa6Bx7pFCikb+0xiJz7cfAY43qQok5A57XC
 SKxuSMbQ5moIO05ZhrmfaFvmUuPDJyLc5E0mgDKyHqFfmNlAXzOCsFB+39URVp5zmXn4
 bBWwRqBcRmiRU3l1fHDmSJDSawzaTUCCS94O+Er5wfDL+78ZTuvLChjeIK/yeRxwMKiV
 CiEcPmYRWhRI7DRBPDfTYnGNPrF1Saz5ZsBYOoFd8kti5NSUJLa7+gKtpjnVjN5yxTqo
 rcHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXClmFqNISL9hoikCofys0s3Zz06RHRTDexkOYbCfPeXONApbdE/HDJOsRQwVMVNYPJzox2vCWdrdc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDl0WI2IM5FVPDDcDhSm2cw8ItETccpzG68NFp4B2NR3W2nAeN
 9JvWfIrLggnyPVZ+rWnFFRLOpQcFOzfafkDNicO7EEN1ydPYEt4J4DFiWUS10dAykIQ+kMoLVNG
 DJ3hvbLeCuC4oorZWnjlLbCpIHMXexDTps1Qm6bWs3CZTeTdZiM2oKF22N26Fsue1C5D3YDo=
X-Gm-Gg: AZuq6aLQKt0/CHWz084v2Oh0CZAUgAlQTAW0ZDvKQ/rR6yOCM6H/nsSYHWWpAeEIlzT
 KA0A1n/Hhj9CXFJ9izrvOo/X/jIDb6D1a/L5n4y1gNR3SwiyFnwjeB+xz+x1rvYruS7Z2zJoZjb
 r+6JiTSYEofmr9yuJnAr4IbAB2Tret0gjVASFc6ucA2A76qOTas4Nt8u8//Z+Fq+lF3Gyrg/egM
 OHgWAFbBtIGO7TUxVIH63Xws5jsO6HlL0NyCk1mI2lg5jkbhErAx1vi3TT7szDNzv/qMCw9lMjE
 4c12bZx2M7TL6koNUe72kXO307P91Pe5UU0d7CBALJ85Ml8ghDVqqDTI09nS3tfacxxbdrpmuKc
 ycfMzUtyppeN+5vL+D89Dat6+QSRWGVcdJN1y0Nvw5lfO/IYn3xpLl66GOjawCAn9KhbRk1nZYG
 4AHfHZ70v3aAzwnBVJtIs7bsE=
X-Received: by 2002:a05:620a:28cc:b0:88e:1be9:cf65 with SMTP id
 af79cd13be357-8c6f98c08bemr619841885a.39.1769454049429; 
 Mon, 26 Jan 2026 11:00:49 -0800 (PST)
X-Received: by 2002:a05:620a:28cc:b0:88e:1be9:cf65 with SMTP id
 af79cd13be357-8c6f98c08bemr619828985a.39.1769454048666; 
 Mon, 26 Jan 2026 11:00:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9fae764sm30668421fa.8.2026.01.26.11.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 11:00:47 -0800 (PST)
Date: Mon, 26 Jan 2026 21:00:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
Message-ID: <jiq5ublhbfzuv3qsz3n6bve32wmto5hxc6mxppb2i2wagykafx@d235legi4r5o>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
 <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
 <CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>
 <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE2MSBTYWx0ZWRfX10n4HpJi4AmB
 oNXv29EIMyb+i9E1pGtmJua/Qt7xOXmigf5shkNcvPAE+xPAHF1N22Hu2p/cNmlzVk/Pofad8tE
 zvRfv8wY/sJPRDNA7hDMV0BDp5LXiR/QJbr49nqzoK+DcOMDLrH5hdbp6Ua6hncDhQ+r+VW0guM
 emOm8oKXimydlbrJfumPsG4mwedyFdkzlobbXq9QWeSFdcTfiFssYaZ40wpA4scXj4z8xJUgXlT
 BVxjAf/9gdFUtisukIZJxD6SKn8DRqKGANVQ/XxSrEPzgOEofOB7sZ3XZlVcMca3ixCsYmfs9k5
 OOeG0IbRmdmwaZCzxuFlj+ta8yO+bY2qazlAHBa347CAbjQE0kjCs5Pl5/WmOmN4rr8iOfL+ZQ/
 uSbmbl/3Mqu+B6a5YNNmGNsYyrMUvr0IaKzUJviSao7dVn6/KsZW79lHIIQpM73odk+WgVNW4bD
 eLYUixx01P86vbSXbOQ==
X-Proofpoint-ORIG-GUID: oUIoFZaHaD8LYl_NQcLP0twlGl800Hhi
X-Proofpoint-GUID: oUIoFZaHaD8LYl_NQcLP0twlGl800Hhi
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=6977b9e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FNNbUphbDgaJBy-ozdEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260161
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:victor.liu@nxp.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedeskto
 p.org,m:linux-rockchip@lists.infradead.org,m:jernejskrabec@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,raspberrypi.com,igalia.com,sholland.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,nxp.com,pengutronix.de,collabora.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: B29E78C47E
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 06:44:52PM +0100, Marek Szyprowski wrote:
> On 26.01.2026 18:42, Marek Szyprowski wrote:
> > On 07.01.2026 19:14, Dmitry Baryshkov wrote:
> >> Implement the clear_infoframe callback, disabling corresponding
> >> InfoFrame type.
> >>
> >> Acked-by: Maxime Ripard <mripard@kernel.org>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > This patch landed recently in linux-next as commit 3a4ceb89a972 
> > ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that 
> > it causes the following regression on Qualcomm RB5 board:
> >
> Please ignore my report, it looks that automated bisecting got a bit 
> confused.

See https://lore.kernel.org/dri-devel/9ebc0582b0f7990d7df992a07ec8ef7f@kernel.org/T/#t

I'm going to push it to drm-misc-next-fixes.

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

-- 
With best wishes
Dmitry
