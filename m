Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B71B043AB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3297710E4BF;
	Mon, 14 Jul 2025 15:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNhQqIjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89F510E498
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:25:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ECeVp4001903
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6LV0K5UJorWZ+7uM8Thq68wdIY0Xdv/k6eWXam/eClc=; b=kNhQqIjoc5cCmRQ7
 wdc6TlBQ7yruYBIu3W+dQihuwiFn+tK6s4LmFT0vP4gI2Q1PQWK9xiVEVvN1HFnf
 JBou7nxc43Fg3nl8pLI1ta7dTzm5nRspNy0P3KOlsD1nu9CpxIT+ZbWgKyCyYrMs
 fPRJlB5TOlY7F7uwC+4hoo4zT7ToA9BETKyikjMRlHoXc8DltnFt2lQmQ/m/zJbe
 DaZcNUVamVB+VoSCsr3Q4LdyQX3tXnbEyNIfej5VPAnSfd6ektwxfHwOxL+NOUKn
 92seAj5xxzqlrbIVpkhLpwbKfiJYbUTWnZCAwbuu5ZPZyBRq09Ktx4T8Pa8P6aTo
 kfZmEw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvay1p0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:25:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c790dc38b4so732263185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752506727; x=1753111527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6LV0K5UJorWZ+7uM8Thq68wdIY0Xdv/k6eWXam/eClc=;
 b=QpC3SWBmM0888yNuuu2NpmWXdulXh4B+HWcKmooKb4wWHYm7IVzQqQemE3Um8uKP8a
 MzgdNz0vrGn5jkFHaNeNuCCc3+OWT1EOeq8mzK4Y+qA7CqsN8qcFs53TBal8YqT56HTR
 jjuz5TJECizGB12RGLkdyn9UPaJ9E+VI8+J60/t4Gkvoxs4/jPkATL36znLmY/B8iYj2
 B9wl7ihqX86523tCNLem7L3ciCOgTEyL0aGmBtCTw+YCIN5JPM4YajFusKhIQcPfhpNx
 XVQoTm+MzS/PbePtIa4tMO0eVw6GtU2bCSaQdGly96ANsFxiVmNTIiTH4qGK0RCbhc7z
 DnYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZTRKVPVFwYfNBAH+0DgjX+rT09lbDRUTZYISuvMvP6M2N1qGMWpglCw1p7i7wh9LIrrGZo2wGYXg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf5bvCcxn/hDZV7VN0eiSrV5PAZ05WqZSL4lHdyPTL0B1z19j5
 HVQluxnHzU5MrCQ+75IFwCa5Mjip/ZWruneIGliVowETYvorHpliCgsDVrZXxuS5oaHjy+dLfJ3
 BYfteQbkEiIhif2XVe1K6YTa992bheG5fS3YDpbpopDLDuqaELfJuHScQkmqbto7NpzZrpUk=
X-Gm-Gg: ASbGncu/QNZUZQnVLAfLGjorI3EZx3T8yKDrsxhmiRML1q4rOscydEIURF2R89xXKLs
 KtGSoUNhfbWcgGPnktv00Y9j/Z05OhqD/eK9h/6owsweZMBBsB6e1lHESTsJ0OYzKaO2/w4Uadq
 scDZC3AhPTeENjsJLH5E3UCQ2xcLWBPkielDNtPRc8Vv9io9siEOOAhEsqli/faiTBa+fP/RvfN
 x8RhhPBb5Q5HgnhbWAAz0zr03SV8rJQoTMHPP440MAW8qn7D77w3x1xV/yjrCb21jTsnuVwTOzy
 th533SZOYH6U1BykLp8HOvFwu0fUkPiaiejtrkE2djffq3OWciZbf5eODNe4fxwu5vj0gvx88b+
 Zy9j4XT/xx+hS+LAXRcju+C7CxGX5uMaLt43h019InhPQ9IwL5SwU
X-Received: by 2002:a05:620a:ac18:b0:7dc:b8aa:d093 with SMTP id
 af79cd13be357-7dcb8aad0d6mr2168476485a.20.1752506726663; 
 Mon, 14 Jul 2025 08:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwZ25/ylUQ3528GkME7MJF3ljBMaRtFCayAvIoA9pqD+T/SbwujgEb5PAw4osLJdBxZhSxNw==
X-Received: by 2002:a05:620a:ac18:b0:7dc:b8aa:d093 with SMTP id
 af79cd13be357-7dcb8aad0d6mr2168470885a.20.1752506726150; 
 Mon, 14 Jul 2025 08:25:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b87bcasm1975359e87.250.2025.07.14.08.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 08:25:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
 rfoss@kernel.org, chunkuang.hu@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 0/2] Pass down connector to drm bridge detect hook
Date: Mon, 14 Jul 2025 18:25:24 +0300
Message-Id: <175250667117.3567548.8371527247937906463.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703125027.311109-1-andyshrk@163.com>
References: <20250703125027.311109-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cEJvdE2B_LmqTqsSGVrA7tWj25ABoayJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA5MiBTYWx0ZWRfX1Trhptzp+63v
 Ovi1LhJxihXt7+fRql2P80AzKlU7INw0gwRFe2BYzlc0GtNyXwObS/zmbMUfsWJWm2JkJEFBZzV
 yoyu3v32gcpHWzSZIaLhSkpbn50SwuK/+GZg6SYIHpsbKyOWM7zUKJfPtKzPNZrFQ2+rbfYYGu6
 rvo5ROiSClv0dY5Y18PE0Q7YJcHK7kAs1fw5QE8L1G4rV2MYx8fkAO8BFbZadaycYTatDBjTGgS
 NFgut847Y/dylPwF/dQxTnjyJa6WtQyg27kVM+T8jYvBzBoAim5l0zmQsGKxry5BCM+fCoNtwWD
 n28R+ISBvsDjN1IOzYOORiCNOSPbyVqZiCap5hEc+V0NwZ9Y/JvqJfjulrF4ItZhnlFwWIcV8aH
 xXAY7C5uMubz2xnQU5gUDLCf5xedSKxIFHRmOdP9EAF63ySo4UqSW5DOXjXrRaQilYLGa09s
X-Authority-Analysis: v=2.4 cv=GNIIEvNK c=1 sm=1 tr=0 ts=68752168 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=0YRiGFPyvPvEouyWwLEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cEJvdE2B_LmqTqsSGVrA7tWj25ABoayJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140092
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

On Thu, 03 Jul 2025 20:49:51 +0800, Andy Yan wrote:
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
> 
> For example, we may want to call drm_dp_read_sink_count_cap(which needs
> a drm_connector) at the dp deteck hook, intel_dp and nouveau_dp do this
> at it's connector's detetc_ctx/detect hook.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: Make dp/hdmi_audio_* callback keep the same paramter order with get_modes
      commit: 02bb63d1a59341032b8e7e4021e18d044bdb1786
[2/2] drm/bridge: Pass down connector to drm bridge detect hook
      commit: 5d156a9c3d5ea3dbec192121259dee2c2f938fa1

I fixed the building of cdn-dp driver while applying.

Best regards,
-- 
With best wishes
Dmitry

