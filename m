Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158B8B13A37
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 14:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E67D10E4E1;
	Mon, 28 Jul 2025 12:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/09t9if";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F322410E4E1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 12:05:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlIXd027604
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 12:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MLMkHEXhcpE9zqxnDSOUT7LZ
 JSw53zS0jCgPn9nQ6+g=; b=O/09t9ifQZ5pb1vgPcIgB4ft+YBrnr3NSj2lG8HH
 POO+dTiTkFe87ThnmxxXAY/3hNC9AY/qkpFt9yOkTp9buD7tG5o4So5ilDJSiHcT
 IbrApJia0nx3Yk0fh44+TzLDPGuUEXrNKW49zlTd0lh5kq1A1y7H9wekO+TdyKCw
 gsdgObcQ0Khe1RgBrpY9SVIvkM+PpZOjdoX9noy6s5+Z9HqX5Q4VzEvm2G5ZQr0D
 Qkc1zYcO329+XCB6xDLDLN+4gf3uAmFy1Ngz9e1WwyYl/e0z7Pxn2c+C4bTiZOk/
 h5xJ6Tl/iUnBOO4Y2GtroCJiMPewTlVJ7tYkmCzsULqtww==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860enspt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 12:05:18 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-617a9a4e7bbso1000672eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 05:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753704317; x=1754309117;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MLMkHEXhcpE9zqxnDSOUT7LZJSw53zS0jCgPn9nQ6+g=;
 b=RIemIKJIbSEliwADlzEOpH95OtMFjL4HK7kn/CmksjJCGlHSqBZCe8r7RXCHZyIslL
 hgB7spLCSgyiYFjsfChS2ZaXwBP8+sW1P5MfftLjqFEAvpB9NKRot4j2CK5wE08wP6Sq
 5LzmZ30QV3AJ2fzCXSQZAtrBkKyBKtTXALteIHW9Cp0cMfK6ETOlfBLpa2WMd7+9r60C
 N8Z2OuPnsQI68I2s9Dj4FV3T83uHEyvcvbaYr/k5OUU4vUKXKWI/TDVfkIPbtqGU3rH8
 2q4/0V/as5qZKeTTkGazisUGiydohkcJT/16jm3JHiE5iVK4LMEiZ3ql/IHF8XtyifrX
 n2XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPRvmwyfCuSqXYYLYsz4srqlXN6E2a+mUZLFEEyEpV4OOvfuKEkaycaHSwJQQHpIwGHBJtb43jiqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRVfJhoeZbzv/pofrl7FEXUeisyyfCy67R62JUqv+pjU6vyBtz
 IuatwVgwm3aYZhXoNFct0UX1m4vIjtWbl8rAMCGlc90FJ0VwV9VZbfiLfXlt84Qr+i/X+pfCzDK
 ahPPDAhO/boT+1QZWJ/yT/ZG0wfzlonFHqhin0tAxi7vi6TRE09kHgmw9tNhEgDgzO0WIZ+I=
X-Gm-Gg: ASbGnctEd9X0HA/4HJdZrBW2UmDlhXppqCFLF6HiF1qxODIVoeOSYbzHRrBjAFGSPeR
 D0KxEdka7HswpphHcLDOf/lKC6E+hlO/IGJirbHI7An8eLc5LIeoGwlBD39e/06OL3JkSDa++G+
 hqYEVmENneWJ1TjM8uTM1T+wv3RyCB5Ppr2/qI6D5h7BrLzz9/jTQ0uqN9T4waOpnX9RD0KPqrZ
 CYfYK2RexYl7tZc2GEqUg6jgD8Lgpl7RP+7aIzU+4TjkI6TJdiKJj7V4FZl0SCjsvzX4er7Psj+
 n2u4ohJo1IaSikBqSbGoxeFFcntQdhXFLXbXptQ6+1RFOOcKEKaBRexaggW9M8LEGuUWM4f9M7k
 8daRGOl8M0vTmOOrpVw+V/9TNz87/zzgtdD4v2S+YP3ABBSRzJnou
X-Received: by 2002:a05:6808:1511:b0:3f9:2fdc:ee93 with SMTP id
 5614622812f47-42bba1f2b8amr5993495b6e.30.1753704317223; 
 Mon, 28 Jul 2025 05:05:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHSfeWv4VHXW2+zlLwrnah8CuiseIJTrikxH8XMRdQkuCbQ7xwR1kFZq9NS64k4Bn807RS+w==
X-Received: by 2002:a05:6808:1511:b0:3f9:2fdc:ee93 with SMTP id
 5614622812f47-42bba1f2b8amr5993452b6e.30.1753704316668; 
 Mon, 28 Jul 2025 05:05:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63375932sm1240730e87.152.2025.07.28.05.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 05:05:15 -0700 (PDT)
Date: Mon, 28 Jul 2025 15:05:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, 
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v6 02/10] drm/bridge: synopsys: Add DW DPTX Controller
 support library
Message-ID: <soz3wrbwlogzv6pi7i2cf5iq5gxhspkrti3pcxn5cdhztghwww@xxcdbp2n5cvq>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728082846.3811429-3-andyshrk@163.com>
X-Proofpoint-GUID: TMWfqHl1M_zPGCSTnmBrVQ1dKTIHUMSB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA4NyBTYWx0ZWRfXzOXEJInBQI/Z
 ZYC1PW48xTVAxRotUszfpJW0hwBRAC3YWY39cP1xMwg/1pdWA43v1VDXwGy9PTN6JvdM9LQH/dr
 XRV8ICyDCqcyi9fnlyNIDPKmnpOEJftTJeHVjSrNbNYBdwwxEiD+xabwQEWo/kdWhj0hI+ZmeWl
 JTPJPhDbpsz23hfQeO31bI85BPMMwJbMRh1deHFV5rrS/WTkkX7GlZtn/ydHXW9xGkDnNSK9zj3
 ExzcNYs4xssZVa8hJbyp1OTGXYVWfLT/Ema+ZL1z86hhM5TaM8ybeV3CAJWN2tcZ3Qh8VyqNluQ
 AdZLm85tOVGHJQhOSAzeAl4vs4H6uwPfkOpkFWaTX5P9XA7AP/kKSpjg8/xy4e9jKvSQ4+j60vw
 E1s7KupDioWwIBp0lbfo/Iy9NM1KMVN0tSoJC+u6PT0bYdXhpUMwhWEAlBIr9gxuGgEdxb9+
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=6887677e cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=rZy2__OW2t70H_ViVZ0A:9
 a=CjuIK1q_8ugA:10 a=rBiNkAWo9uy_4UTK5NWh:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: TMWfqHl1M_zPGCSTnmBrVQ1dKTIHUMSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280087
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

On Mon, Jul 28, 2025 at 04:28:27PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The DW DP TX Controller is compliant with the DisplayPort Specification
> Version 1.4 with the following features:
> 
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> * Type-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
> 
> Add library with common helpers to make it can be shared with
> other SoC.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v6:
> - Use drm_dp_vsc_sdp_supported
> - Store bpc/bpp/color format in dw_dp_bridge_state
> 
> Changes in v5:
> - Use drm_dp_read_sink_count_cap instead of the private implementation.
> 
> Changes in v4:
> - Drop unnecessary header files
> - Switch to devm_drm_bridge_alloc
> 
> Changes in v3:
> - Rebase on drm-misc-next
> - Switch to common helpers to power up/down dp link
> - Only pass parameters to phy that should be set
> 
> Changes in v2:
> - Fix compile error when build as module
> - Add phy init
> - Only use one dw_dp_link_train_set
> - inline dw_dp_phy_update_vs_emph
> - Use dp_sdp
> - Check return value of drm_modeset_lock
> - Merge code in atomic_pre_enable/mode_fixup to atomic_check
> - Return NULL if can't find a supported output format
> - Fix max_link_rate from plat_data
> 
>  drivers/gpu/drm/bridge/synopsys/Kconfig  |    7 +
>  drivers/gpu/drm/bridge/synopsys/Makefile |    1 +
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c  | 2094 ++++++++++++++++++++++
>  include/drm/bridge/dw_dp.h               |   20 +
>  4 files changed, 2122 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
>  create mode 100644 include/drm/bridge/dw_dp.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
