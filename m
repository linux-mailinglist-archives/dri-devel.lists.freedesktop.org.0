Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF30CB0F405
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 15:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ABA10E0F6;
	Wed, 23 Jul 2025 13:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wp02TVxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA82910E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:31:15 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N920q9024749
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9SbDNK0Re1Bd83KQmagFa7zcRS3CLi3VXkytT1Mw+wg=; b=Wp02TVxDZb70ynk+
 wrpmaL7X+oqcMiuPP/sZnVEgUIfaLA+YlIe652yCTMYLcHzG7b2HFQw7H8G3jXUg
 2N1eViOaDDwZcKz0o3C6FWWZ5/bnXvthv7olQlAxutu9zKSoXGClsfZ5f/tTf6VO
 qokv8SwKhLO+NmF5TU7L/0iwV2u5k2s4l4hpLW2VwUJKcR292BzAOLiUEmx0DXw6
 98gIg3P37slieTwvIHu5M5dSqJVwzbd/h0bvpY5TK2lK4ewSXqRlvx3s1XdBXkp1
 2E5I4c9fR370nO6mQNXmsP3l53OOjAWx6gpNt/llTYM/wOz8RWewdA400+4g42ya
 Z9D+3w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dn3v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:31:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-4e6fa93343dso507108137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 06:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753277474; x=1753882274;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9SbDNK0Re1Bd83KQmagFa7zcRS3CLi3VXkytT1Mw+wg=;
 b=vK12rMLcTZrKBLwpJuSlDLMCNHpfYFCDTJWBJO+Woz28sg8kOSV9DKcNpRZ0b9LdBK
 DgV9Hcj/gnmd9JcmyJXlWAv5OTFoEd9SzQ+d5srb6H1HwHSoQF5IiMkAnTOjl+zloxrY
 JBfkxlU+92UQTEtzaNNIegZqrCfi3W8EN285X+prtJNNOWPZEXUFAFz7616UhG7LeZQ9
 Niv7fxFzxd/dGEEOgi2XdVq8XwIEHT2YfgNZK8rbCbmo9L9TxbaiDqedKEnAVc8sZQ/m
 PM8CpGoUyMuc/v+/43HjID9QAx5nOxSYFxEH3ddhh0/nzMT1laioYPEDljh9Ec5jgPIW
 eU8g==
X-Gm-Message-State: AOJu0YzoPMb/JCHcT5OvxosnF0nA0th/toRqYmrEmdw57hCBn36f1OT0
 nAbT/gHeID36eFOh36ckZjVtJUDaEujMtrWpTnAy2fA8iAVBQ3yXCeoLhMOdashOE9DO4jiDNL2
 lzO2dB6fOZGFXOyRA6QBi3+t6I/MBja0ZxN+lpCq9zd7iAa8tIzU6bdecChWdaqNPla/YcKyVmU
 /SkiI=
X-Gm-Gg: ASbGncuKymn2axSANbgksPcudcz5W4LEe07OErPhLqCIlaP7bswIAufuWJwjLrYhoBT
 JEiE/tLjyapxDLj9qNW0fynvagl9/p5VzcB3MxRMyHfpVo27ito1jypWycgDe/EN5nBfcNuYdlC
 9wEXVyZIedcocj3Fqc4QPYYH2Z0J+V/0HkYnMXFRKSioUq9SrCTDAIROG/itbfjQFtSKT7n9V73
 I4XZoP3ZvRqKVFxPRLSdvAxUltL7U14Afobhf31tY3lAURGtRFv938ViZwlCQyUJm8Zg03+JN6t
 uJ5C0FsYLL2TWrfPYQmLgG2IjAJbRJMCO0V0lEY8LDB/PS/1Lo0jaD4BOX83bXKN/RJbei9ZA6f
 /tS9gIzlzAkfGRQ8IOGopZcAvPZLTLgIVp5gz85nvQ+nfuyqY3YX0
X-Received: by 2002:a05:6102:4247:b0:4e5:a394:16cb with SMTP id
 ada2fe7eead31-4fa1504c022mr1124313137.7.1753277473618; 
 Wed, 23 Jul 2025 06:31:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHgHJ09XAo/u0keorRW6Ld0UmatwQDlzD5XxfzVALH27XPrtvZ5AfHxDILlDuD3WL99C+7vg==
X-Received: by 2002:a05:6102:4247:b0:4e5:a394:16cb with SMTP id
 ada2fe7eead31-4fa1504c022mr1124229137.7.1753277473147; 
 Wed, 23 Jul 2025 06:31:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a4da8a6f9sm454935e87.9.2025.07.23.06.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 06:31:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20250719-fix-cec-bridges-v1-1-a60b1333c87d@oss.qualcomm.com>
References: <20250719-fix-cec-bridges-v1-1-a60b1333c87d@oss.qualcomm.com>
Subject: Re: [PATCH] drm/display: bridge-connector: correct CEC bridge
 pointers in drm_bridge_connector_init
Message-Id: <175327747217.3825714.6617340923378529554.b4-ty@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 16:31:12 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6880e422 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=seG0_iZ--NnEr864CCQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: G9sLcK1AL7Eb49EiAHf8mAhYn4bSeaBe
X-Proofpoint-ORIG-GUID: G9sLcK1AL7Eb49EiAHf8mAhYn4bSeaBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfX+nWwgJMwYyIH
 IWpoWcmvK22cW41FAGvTJgM3TuWYvjKXLyNQc9dfs4pH7MvIf5TQzlsHNSD5LobZ+B8PPcG6kP+
 8eASrawhmm8Y25FMt0ziYz7iAhrImizetQsw/ZUv/9HVeDTnlMCVL8QwSsmUTyPMFBALzgwyc5h
 Be0Xh3s1fUcnXQCFzvRn6gbS0ZwCLd+8M9/HtXXXSqNSU6STR7c5ZJgcKk/kaTFpM5oSfionU4J
 obYJFteGYG4bNUGzNsulLAasXWls76aJD/KxOy4OqWpYVhpz4/laxj1s90KfCR/n6oj7FXJY/b1
 5z5OJQFnBZwGj67dcHYBs2w0kxDHsn4XmC3rhWkGsKOrJzsm229n6QSw0v9EImW5b9B7P+wLnd2
 o7gRNi3u99rmFJQiN5Rn+VDR0ABu5e45DA7Fufw5+gAm1nbTo0vSeKjeZ9dS9nIP6uQ1wZD2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230116
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

On Sat, 19 Jul 2025 13:58:13 +0300, Dmitry Baryshkov wrote:
> The bridge used in drm_bridge_connector_init() for CEC init does not
> correctly point to the required HDMI CEC bridge, which can lead to
> errors during CEC initialization.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/display: bridge-connector: correct CEC bridge pointers in drm_bridge_connector_init
      commit: 92e34a5241ddf4b084df20e6953275d16f156aa8

Best regards,
-- 
With best wishes
Dmitry


