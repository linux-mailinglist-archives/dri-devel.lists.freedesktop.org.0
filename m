Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927A5B593ED
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8F710E0AC;
	Tue, 16 Sep 2025 10:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcRYcPsy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FEC10E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:40:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9uBll020047
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=64UGI9BPuBduKWijNzoL3Z43
 ABN4/p4PZtHx1EJDkxQ=; b=OcRYcPsye6QNZckINK8F4n1XTAupxaUU9ghuaiKJ
 yFDEQdPJhQ4fBqIZDGNlUdHuy24kgNQAd/21THDDbl62ALt+qH5CxOhxEcErmUjw
 6gC8AW1jZZViaQQP5v9TgWUL4Z+3D9ue9k2qdORlnOjeYy1WqHeiW5b1ITV6e5wv
 IFR+m9UyOzy1oGWblFEDB+gmgxJ0MWkHH0xp3D1CeqmnjRcEwh/zrjZHq8krXtQD
 99ItFKCaeSx7qEgZfcBCZS2MuePAPb4rJKptcEm5Rm6GvaY0Wg3Yguo54l++9G2K
 0B9nM3juueEpdymcRy2YCXmHFr4OAOcNwduQsZ+9jnJDXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sm279-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:40:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8078f1bc588so1193269485a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758019228; x=1758624028;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64UGI9BPuBduKWijNzoL3Z43ABN4/p4PZtHx1EJDkxQ=;
 b=G9jbB7vzaAXDnKBsFSOPOmpCcfgOZ3dKogakDfUK7iJ5vnrBmlSNelsQjlgj3J8Umz
 d3K7rIR8X4bcietT8hALcZljhyBj6kC/lDjbW+1hWyfsF1n3KNOoDKtjnXZRe6Y4IL9Y
 2xQhDHwkl6DgnXZKYDU0Dq8hBIzOKv77vQJel4NwrRM/I+OhpOH3iQu8AnHvYmdJ0C+9
 +X7QOUd5Vl46YWimhsz+82d/ikF5u8jQBFKlGIjwbNQvm/nsW3rFAGBdiT2081838axi
 XqXMpAk2tksJQ2U2ZwPrr4XAsvIvwJMeUIbwNYO+x5zcYqMPkMOuqZ8UG0y8lt0AneJH
 eIKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTgs5M7ZocYalmx8HBg2A7rl0PtYU//YcW3b30iuYzQRqox5CKqOqLF3HPR27YTivbGfg1YmYdkPQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/Y4gY9jTSBCatjLqROJLWbaiRZXU0frZAWUdeACeL0OPPhfzO
 ZTHGRcWLnxZVIPFq11GkH5t0gyTogQ3SyCkejRzTqs/v1zjSSqQCjdUDH0WBb8amnDNGRaP+8xO
 fiVJpHRYuoij+oX0AuOZx8qGPTR9FZtvCWWF4LyzdFR0auRfAqrgvDwdCiz909hu1N0Wsd4s=
X-Gm-Gg: ASbGncuQDEOFdCP5Pek5SVQHo8877INfutwu+yT1WeyeusyehKvyQtN1GC2CMSGRGFH
 djnviF1qUd2KKAwTXUslPtO0iIBmov3Whb6WtAr+vsXwHnC2PWaLQyAeFiFhJj0zv6AHp6SEb4o
 Bp/zB7u08/3W5OXp0lMSiCnJ+buwvP1SsIENFFm/OT1RORTCj4FQtZ6sfGAAhDBAtnNzox+fBcw
 E57Uz0JQfyoBNL36aZNNTYEHrqONUHKNMecQtoZQiJzYVN30vE/LSIYKb4UXZ1aNUS1PZTjn0+s
 3JXhwmm2B+vYH6R+JaoAHLTfzswCQQFZxGw8cKHeXeeHNfyRveMd2GkU5Ncdo8C5tRLlTsYaykd
 hdlSkbjvu+wqWVd4AF2oHmVYH/fW2gsD3qJ7ghcgdgy0jDKNEW2Ev
X-Received: by 2002:ac8:5d92:0:b0:4b7:a68d:6797 with SMTP id
 d75a77b69052e-4b7a68d6ab9mr85368401cf.11.1758019228321; 
 Tue, 16 Sep 2025 03:40:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbkRuukR9ry8LUt3YkRANVRRqlhV3NS52CfGmXVJby66hPtP8JStsr+hyX+plpsZF6lw064g==
X-Received: by 2002:ac8:5d92:0:b0:4b7:a68d:6797 with SMTP id
 d75a77b69052e-4b7a68d6ab9mr85368081cf.11.1758019227845; 
 Tue, 16 Sep 2025 03:40:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e6460f138sm4245745e87.111.2025.09.16.03.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 03:40:27 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:40:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 1/5] drm/bridge: it6505: fix link training
 state HW register reset
Message-ID: <4r5c5tbedw2hnkyqybcaxrjcc7lrdgxdbuhkzdvevdv6kmrxlw@5hb2aw6h4row>
References: <20250916-fix-link-training-v3-0-0f55bfdb272a@ite.com.tw>
 <20250916-fix-link-training-v3-1-0f55bfdb272a@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-fix-link-training-v3-1-0f55bfdb272a@ite.com.tw>
X-Proofpoint-ORIG-GUID: ClC2niv0fXNzbIk5IEMAg7gakCKehpe1
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c93e9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=pqF_GCezRlaNH4nzlkgA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-GUID: ClC2niv0fXNzbIk5IEMAg7gakCKehpe1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX49lh7NP6qjTI
 tk1uv4WZOcriG7x/bHBvVgYMV8r9mAKUjsDjSCzVLLNgDP9uBNL26LZ5TeGEouk8N589ktyl6B+
 1KgpNXizY3zMQTK9qx94x4+4xWKpHJr+3mpGZgmN8xy8HROXf1P5hwy8LNMjVOsKgOdRwsCqbAx
 WTrkrdGgqnzQqOab6UsdAVH3gLFh41C2hQB0rWBuGXi8HGiz338YAWDIZzhZ7e2ervwWZHK58zJ
 7y0C6W0cnL991XgQFO2kQ7KhZBWvMOx7+In+Zvmd3JwGVz9xgRgLt6gWhA4E+HJOsofM/RT5Pww
 rtu0biz+Rt9o3REfN1db1TN5p66y12n96SXRE8Ll+gfvvsX1EnavcNgH2IE4K8dFTqY73sMMKZ3
 6iecty1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098
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

On Tue, Sep 16, 2025 at 12:47:41PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When connect to a DP-to-HDMI device which does not connect
> to HDMI sink, it will report DPCD 00200h with SINK_COUNT = "0",
> and issue HPD_IRQ when SINK_COUNT change to "1".
> 
> IT6505 can not recive HPD_IRQ before training done and driver will
> force HW enter training done state when connect to such devices.
> 
> When HW is force to training done state and restart link training,
> bits FORCE_RETRAIN and MANUAL_TRAIN at REG_TRAIN_CTRL1 must be set
> at the same time to reset HW state.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
