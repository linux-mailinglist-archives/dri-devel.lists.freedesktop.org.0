Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0580CDCC6C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 16:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E1B10FF78;
	Wed, 24 Dec 2025 15:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="os+ZvryB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWuVfnd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D5B10FF85
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:55:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO8p1Wu700995
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iWGedSx1FzSKcUjH2oELnqaBpb+rd2rMQldge1V+adI=; b=os+ZvryBbLSlKgIH
 UG0FOlTmbaja3DtCZCR7C5tqhw5vrpyPiYoHh0rK2EApAtjObYgCfMugLMUQY7jK
 gNLsoFDJMdyXKHhGFNdfekdDsqagZLb5szh3mAXOulQn5IjXTMa/6RpLsFwa2nVS
 7323psaow2kKPSt2Dho5VS2j4P1tbGlPf08wA0DDrTCN8d427qd096hj7E5CaF+g
 9Ojx4+b4yg8IMlBL2VZWEK9oSD2k7Y57RgUBff/VZr/qNP+aFKjtjllN51oEWdob
 +TbhQr54c+SI1a3/rFxHk/Qwu7xSZKaHxG5WiSJlt2u5qqy0YIMbB9wHuQDTixWS
 HmunVA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jv48h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:55:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5e81d6c2ff5so4125904137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766591758; x=1767196558;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWGedSx1FzSKcUjH2oELnqaBpb+rd2rMQldge1V+adI=;
 b=PWuVfnd1sN0qCWKkdKcWfmdb0hm6qfnHomRzcc9MvlziNP2oYLEkcTuiW7Jx9t2FFw
 P9Vk3tSVLsJbVrZ9qt/8dCedHONDKTRZTB0XPaCR1dUyFLADkmgnh4zsF7qm28Gi7vAU
 E621OEnDqxOb6lRt/taTyKxp3ZqwNNUNacMMxoi1pBJqH/EgSa8rylmx6ODep/XKqs1c
 R4ritO9TFNfTs1Tu3j0vjik4wtRVj1kyWxsk/y109aroiZKWKrcf1n1yepQPzrE3VK1w
 yAZ7A9Y3cmLGgFQqldF8P+hWN48GGe7OjmZFcQNSS3V+2wb1EDY3v2B1vH3xq2REfkti
 on/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766591758; x=1767196558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iWGedSx1FzSKcUjH2oELnqaBpb+rd2rMQldge1V+adI=;
 b=qMSHRi3bPQR55aMSh/+My7ehyZBdwB1TfU9TEH/dXAxAX1jR66qEd5+cnCjTJ36L1r
 v+F4rESNHdHiT66MSiT8IsRt5j/d4T92u367nJUxTXa301YE07HhDN0KL99TIqS15TmZ
 up/e9S7CttoxzZclBsGPKsf2+APNO1wKBM6dco6YD7Zh2ZX1X9SXKnRwQeJxvS1sg1rJ
 4PlNRdd6iqSvFWQ/IxHS5vpaNM1SGOb64XNyaS0BU5gpVyiPbbDKkUJdCulvVnsepJRC
 3MimBT7iJJNjfcLroB9h+l38jrtGaW2MswxACAeQTpaP7Hy44LHbX4GEpOI93TnmJzMv
 wy0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeKBR25D4oCe25galOvxIrj6pENXLgRpRYdpvp//KPSBnsu+CgaXDst5NbYLokzMig6Q2dO+PMkiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhsnoM2mMD3IzLz8mw7/zIAu6t91U2Ykg816U+atWKvmJ9la6u
 suI6I2fzRWiOIEsQTu0z3bn+75ngn0GhwVH/zR6fU36SVjBjXzsaz/4C2/wKjwUOiwS2qc96I/d
 ebDCfDnuwbinfdF/4sj6SjyuL5hsp+gajq9CCrkEtqXNeRpB2J85UHnNiaoKDuIcATVB4oPQ=
X-Gm-Gg: AY/fxX4hmkxVvRawhJpmzNN3vVXBKewPCiXpKS4L6sR/8lTj86PZ4NT0BbDkhiqxRSe
 5wrBvw95hA+SyQ0F61nQKrgC/Q0PoTnhgD3wxEyGOWZ43aHpipdMShkveIsRwnx3VntsBO5uqYl
 L9o9IyLPiWztJruPxi7YN4Q7Dp8uNjcMv5lR+KPshww8VCLo7YdiH5YTuGyx5Fzy1Zk5l2jR59v
 dYF9XV6dpK2og0jog53t/rQ6KGAHIxOHMsV892hUZDxb+3kwPxnYnW8TcfFQLuzqMZqE9J60lqq
 OJ4JcdLuglZ1EA5RJ0+QfDZd6xi1fbuhJjFQogkpEOtYcBZQPaqy+K0j9RsMQjy+WHHdkzZneVH
 O9h00Y4PlOyWPZ8p0QMa1SjFg2Ww7ZxNpLoEBDWbpokpHNBLK5n4Aa81vfZk20n9RGmpmoxJekI
 P5VQ6gA8Okak2+8FUBPauI6nc=
X-Received: by 2002:a05:6102:5124:b0:5dd:b100:47df with SMTP id
 ada2fe7eead31-5eb1a61e6demr4946921137.4.1766591757749; 
 Wed, 24 Dec 2025 07:55:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEERFla3B6dDcluPaHksW0ojIo6+QZYY+sSk/hQdyYhKIIJtQbahJAM6fM9o+u9/xtIUoAfrw==
X-Received: by 2002:a05:6102:5124:b0:5dd:b100:47df with SMTP id
 ada2fe7eead31-5eb1a61e6demr4946909137.4.1766591757260; 
 Wed, 24 Dec 2025 07:55:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b360sm45158661fa.28.2025.12.24.07.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:55:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, veygax <veyga@veygax.dev>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: Replace unsafe snprintf usage with scnprintf
Date: Wed, 24 Dec 2025 17:55:55 +0200
Message-ID: <176659174997.4059120.16151098492056445076.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251224124254.17920-3-veyga@veygax.dev>
References: <20251224124254.17920-3-veyga@veygax.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDE0MCBTYWx0ZWRfX//jH+p3ViBzt
 eor8GaPIUROZkkgrh31ryFmoh/M4e2pS0oOV4CnoojtAmjQox/P5rBvBbCd1O4+5F5pTvq51QFo
 EOn3tc4kKtkVe/nZffaDZuYfLKHnv3tmygMcN1AvWGwiPC0OQcd94D2vlWl4Dlz57VzQJhyVpKT
 W2j9AAmd+liXqkqcxp4pLZfN7ta1n+LOYJrqmJrnzl6GieAb/cIIivqS6TswYZuncHxbTh3K0a4
 CSzNT5BCd3M5Crur7PsuRNpAmD/COYnHqFuGUTKsmEQd6BgvQquzO+jkDMlFRIWCkMknbYBiCxH
 2LVscxYVk/oU8NHIl8OMGqdvpzrOeVL5/KKCo3JgkRtqIXauTJfrlhQQzBH+Tr4T7wjYYF9zeNd
 nWr7lIptA0fMytwbsSFSd0BW4xuNwfn3xYw5sCWX3FYPu1YQzKhZcJhjekn8JZx4Pz9T4cgLByF
 dTtwKc9dngcS6at/eFw==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694c0d0e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=Sr6y7Swg9AFsQnQ4lA8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=crWF4MFLhNY0qMRaF8an:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: RNsCK0YOeIfdJ9y3SZSxkgdxudzM14xq
X-Proofpoint-ORIG-GUID: RNsCK0YOeIfdJ9y3SZSxkgdxudzM14xq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240140
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

On Wed, 24 Dec 2025 12:44:22 +0000, veygax wrote:
> The refill_buf function uses snprintf to append to a fixed-size buffer.
> snprintf returns the length that would have been written, which can
> exceed the remaining buffer size. If this happens, ptr advances beyond
> the buffer and rem becomes negative. In the 2nd iteration, rem is
> treated as a large unsigned integer, causing snprintf to write oob.
> 
> While this behavior is technically mitigated by num_perfcntrs being
> locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
> second source was added.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm: Replace unsafe snprintf usage with scnprintf
      https://gitlab.freedesktop.org/lumag/msm/-/commit/66691e272e40

Best regards,
-- 
With best wishes
Dmitry


