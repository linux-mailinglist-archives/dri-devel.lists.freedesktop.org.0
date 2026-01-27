Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJdEKZofeWkQvgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 21:27:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F259A5AA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 21:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6395010E5BE;
	Tue, 27 Jan 2026 20:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlEJLz9J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoIKToce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D357010E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 20:27:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RH1xXQ1334303
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 20:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=R7u/+GzEYAjioDYmkQxOY6xs
 Cw+YDBbFVfBMYmE+PTU=; b=OlEJLz9Jts4JCKDA2sUywDbOlEwV13u5StSD37uO
 3jZ2LqLmnkOlj3tENXxxrto0rqSvazhIxACvFa3vg9Lr0LTfmIGoBSKKWVw7oxiA
 Ygi6pAvHAHWzb6RO4xH6d0S62SdvBx5ZYlidlKngSSWsM9rethdRC2pSYUcDiBTF
 T5FQSQLRcDQhV7oEF8GYAH9Gbn9OVoQhUGC0n7DrBSDA+jXZdZ2uyp0KnpDgA8Sm
 dROwvv75q9PROWNOhczfWpFsK3gmh3eR87eCfuCL8Yc6qCOcag0QIWk8bnEMl7E3
 7ZVSIDQJjUzuMcn7KtzSEzu5NNF2rO7f5YkXeibASpI4Sw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1dfrpc3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 20:27:00 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5f5256bfd3cso6146265137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 12:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769545620; x=1770150420;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=;
 b=RoIKToceNTuio33AFoyNvNvGWqerUMkmSFPfh7y0TPALBBul6mtH/JMzdLevzKlVul
 me+bN23CAbwe/dcTysd59V4kP7H3UpMbs7Nv07WkVQdDdtAv3SjdBuOG/cVnErc7Q7Ry
 who438IlyjsLHlhw8SZ2VPi+4FGhJhnF5wks4S44Clv1wW9DU4KAkVhKGPr9V3lvPi5f
 2mRFPlIuLXawSHJVMxL272HoV7CvJUWw3uf3Q1alQrPERv07WaL+x6drd6JOj4B9n2df
 0I38yfXF4bXc/9HXU2HQVjq3TVl3CIJmVBnedZEsV4wb/vH8C9vQvoLaIxAcxUIe+0ue
 0TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769545620; x=1770150420;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=;
 b=F3OPbdgjYYAdJWxMscZb2ZFg0YXCVgKkfbjHTvJsCCMHCg3vRsKAfjFQRH/FqdLzjV
 K96MV0oDrYmSx+e50QJU1IP1uTKA88n8tKiL8aHvvTy/w23nLm1gBiC7SW+f2+bUIbQl
 YOGkPqmu0KgsGeMstnUvUF4aUHwVzGNRldkQ/icUuwIKuT9qU18zU2b2Hz4scAMM3RO6
 5A4/HuSvIt8goj+mdU8BctDv2NMRa7rs0bBMBjIFVhrsw/e9ePI8zFbv4HaLE295YaNt
 InWJxyoh/0r+XsIwMwOJfR2PCPo977ZQeSSCmYMeKCavn0PPVrkomVxnmnlmX1lFc9BW
 7dVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV6FbUDgqQjFGioIf68Mf6CHXPUdLk4b6C9HE5J+7faFgco8rP1YnxOPI1slh8UsGygwOLfIXsQfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypEAfee0NoXzgg1Zpch/LMrz4uVZa/ZF3h7j7fhMgy2C71MreD
 xHGOSRAOoOlkdhiiN23XfGN5tPsVqjJ65+H60/PwspPCwLuBYqIGjQllkMfq5Xq+mTtQUBOAEbd
 erIUgBrVfozsNUnyxLWIULd76ooGIhF4seeiwjLDAkka+6kL2RR9PmwkCecUhd8cNseqeOqU=
X-Gm-Gg: AZuq6aLKQgLSSqV3v+xTeFZjmJw/T44aKGGx1KeuN7exFRdEpH2yRb3xzg0lKqt4HxK
 FXJ8z1CKu2FXaaoJz35f4N8EOoVQQCC1bxMIKyvSFjYzPtZqAv6FbRG4/Z1/MGKl7Fg0uAhhdY/
 RhAOhXcyJe2gFceU1b1r2rxCN+3r6R1VLCmaiuXXoHqsEzEbcYf25KXT8FjG/t9SoOCY5q7VUHs
 tQ+UDer+FaRP63lrfQqqNi2Buk7/0u7w7qK7Y3cR7lLBLQfSkldW8+zHpsZsEV/iOGOJwPIH+sO
 yzy4bpCF3hFlq+Z3GyNhFX/WMsO8Elqi3oyTgSo1ehGhJ2jD0XxgY5zUkf2Z8FZlyIGeM62YHRZ
 /QCBgd9Alkyq5vrZ7AUmiwwBARFJ7HXKARNaiPQRNfMihvstzQIsnX529/rDib9aSROyssNNVtL
 CCfqgB9ZFlw5531QwIbg9S8QA=
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id
 ada2fe7eead31-5f7237d2386mr962078137.39.1769545619928; 
 Tue, 27 Jan 2026 12:26:59 -0800 (PST)
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id
 ada2fe7eead31-5f7237d2386mr962042137.39.1769545619368; 
 Tue, 27 Jan 2026 12:26:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e07481b72sm147447e87.11.2026.01.27.12.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 12:26:58 -0800 (PST)
Date: Tue, 27 Jan 2026 22:26:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
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
 linux-rockchip@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 05/10] drm/bridge: refactor HDMI InfoFrame callbacks
Message-ID: <6p52srrxddazxiwqfqmjpef7k4bbpzojxqiy57zmhqcpqa2bum@gv555pvqrige>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-5-213d0d3bd490@oss.qualcomm.com>
 <47619a02-c667-4fd0-afa9-f6cf7aba8dd4@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47619a02-c667-4fd0-afa9-f6cf7aba8dd4@sirena.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE2NiBTYWx0ZWRfX8vGZ5GPflFCM
 2ExdDb7EujdTojVajMHmFtSqS5LaEtHCXsLTURlZzxvP/WHkS5XmsmuMpXoFyNi/R9yKzcL3NZR
 sLajUBhM+Q6DA7erx8pcgQ9SBv0U3FhHNAl5KUndT38k2ZwYB2L9gEBD/htGyqihgtm8guTTHma
 xzyd2ZRkb5+LQsvd5T7C9h4getCyqHvZBfCGv0vTt0sYjsmunvSg3Tbo6p7LHvOFwyb9+3nBSfp
 TiRUiq4LK1OoB1EmXENYxOtDSNUtQ7/nafJAg++ptpAqW5UJetsvQItTnsObBZJeiTC1sdHSOVr
 4Qk6SfRlviT/2Bdgu4K+Gqqw4uJ/wSSNE5+I7P/b3FIqb6J+GuXU9AWap9IkKCo/QV3gSWSJHzm
 gdMQrBKvFAd3qoDaXJ+YufGCkv7wz3oglJxK+VgbILaUNOtMrF/sWf7zuxbk8UMkTn3vg8X3TI0
 yB3apL4LblmJwdKEOog==
X-Proofpoint-GUID: gDQVz-2141vI8aZq9Xub86OuZB6KX1YZ
X-Proofpoint-ORIG-GUID: gDQVz-2141vI8aZq9Xub86OuZB6KX1YZ
X-Authority-Analysis: v=2.4 cv=YeuwJgRf c=1 sm=1 tr=0 ts=69791f94 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QCwxOkPKupwELJ-03vgA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270166
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,raspberrypi.com,igalia.com,sholland.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,nxp.com,pengutronix.de,collabora.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:victor.liu@nxp.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,
 m:linux-rockchip@lists.infradead.org,m:Aishwarya.TCV@arm.com,m:jernejskrabec@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 57F259A5AA
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 07:50:25PM +0000, Mark Brown wrote:
> On Wed, Jan 07, 2026 at 08:15:02PM +0200, Dmitry Baryshkov wrote:
> > Having only a single set of callbacks, hdmi_clear_infoframe and
> > hdmi_write_infoframe, bridge drivers don't have an easy way to signal to
> > the DRM framework, which InfoFrames are actually supported by the
> > hardware and by the driver and which are not. Also, it makes it
> 
> We're seeing oopses on Qualcomm RB5 platforms in -next which bisect to
> this patch.  Looking at the patch I'm not immediately seeing what it
> might be getting wrong, though I do note that the board uses a LT9611

LT9611UXC, yes. Fixed with [1], fix committed to drm-misc-next-fixes.

[1] https://lore.kernel.org/dri-devel/176945413960.1492466.3261759749688865592.b4-ty@oss.qualcomm.com/T/#t

> which is updated by the patch.
> 

-- 
With best wishes
Dmitry
