Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF99B2F6D4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6DF10E93A;
	Thu, 21 Aug 2025 11:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLgrUQ8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DFF10E93A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:36:30 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bArc030622
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+oRchL+ZGiIm6AbmB6F+/gh0
 suQo1rfvXtM2Pmnn/tc=; b=pLgrUQ8UwRDGgkxhghdJLrIo1NxVJOOqX7qU90bN
 vI/JwszjzYwjPdZhF0MbqFeiQcpMQIwV6vQJWHUwjQ345GV7G45MfY/YOYMNGSoz
 3i7GEONr2sY0bl1NSvUNGPk75Qc/P73kUIYdg6yLV63xQ1+DA58rJw1LQ2ZZNCKq
 CBztzVy/m3Dnmm43zUPCaUXTqIVKUiIVreSxGSi1Hxzvhh8ebZg6GRvWrVTDIUQm
 II4t1izcldKcSzC58UHVIC2ohrqew12NSlz7ndjT+vurdehSx7NX0kOF6cFBJook
 6sK8efsNDNbzDUVOtzhn6Pnl9UiMp7QiYidL4c+CJ8oPew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a5b96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:36:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70d903d04dbso7423046d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 04:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755776189; x=1756380989;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+oRchL+ZGiIm6AbmB6F+/gh0suQo1rfvXtM2Pmnn/tc=;
 b=ksm0DW3B3zmG4Ib2sSarjwZlaZxYGY7mDlTA7ASiO/hbEcFGUyUARcliPgeAQN1xIw
 P05HUEOtMrNszWSTIhZVniGCLUhGX8grZEhxwQvSeuRANXZKC6+5dwvo6kk5S1ORm1To
 ftpEB2iGFEuj8gSrq0y6CSzmwezbWR1c4N59aHqYNXQ3cZZsP9t9TrnHVyX+v1eJYMmy
 pSDJBM4B80tIZH2HGUpXin3028gLfcd21C6sKV2TyY1CBB/RElPcnuYLarV8I/b+R6q4
 eQUXlDMg4dw9vlGAQY/yy883hcZVtjbU6VizbZj2u2AK3mjM6vbvsllOO51rVwPZBdFz
 268w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4Rmse/l3lBnHrlgguiaYyeQ17x0W/kaMYNv5KLl6mWvHedHj4/P5pmtFzkBqOPO79oi4YE9+Gepg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5+6/xCzmVhspwKcBKZku+mc53hjZMaCC3+3SEiJb2H8Q/RbeO
 ZNNkyHWISpzKhSvyhsNxn0iHb/FK0SpIA990BKH86aysd+f7ZrpWKIbTKFODWUf9H44P0M7UnLw
 U9IHMRPJ9NuR7dg4MwAIRXC+uVNrYteNYi+y170egcwsxoorB4j5AZ/KU6LicnqBYNfmwBkE=
X-Gm-Gg: ASbGncsQYT8RXq4FWDUiBAH0IokjT4KUEe1fXMgcNvrmyBVLU0L3lshqO9sljPsffBT
 dVDgES9XLWPhn3MeXlgR9JsuzMbuu+ALhOrya9X4U+xyu+lE0aJB6XNs8MDws07v6YSJlHy+HqM
 KP4oY8zl/2RQEmWwpbVFzbbJ+cenE/GVRByXXVrhLZmrC8GfhWmHGeN7Eg/mE6HVpo0r0yZsDLL
 LKOZEAOYEKBKzeSGkP5Zcc//+r7JzzJThE5Ogxa+B6FbX7SIyJaCB0fe2AhM7ajNHvjS9g+4goB
 hBszrvD9P7y7cUZcn+IkiwAv0Rgns8UrS2FERjhJjh3tuST/yHw1y75b/SIFL++AROk3J6wiTXj
 NXYpDNNInn+48HJvV2+x9aPLvxJB2NKm6Q7MXdQ+9tHrQas/h8rEW
X-Received: by 2002:a05:6214:d08:b0:709:d518:74fe with SMTP id
 6a1803df08f44-70d88f6c1b8mr21455426d6.38.1755776189114; 
 Thu, 21 Aug 2025 04:36:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc4pz99CtfcFnUf3vsu43oB3VrYZHY0a8u+w/WlSr/OGxDRM13tso2usgrGww5C5aEQRhY4g==
X-Received: by 2002:a05:6214:d08:b0:709:d518:74fe with SMTP id
 6a1803df08f44-70d88f6c1b8mr21455026d6.38.1755776188614; 
 Thu, 21 Aug 2025 04:36:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f361asm2967476e87.116.2025.08.21.04.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 04:36:27 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:36:26 +0300
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
Subject: Re: [PATCH v6 06/10] drm/birdge: simple-bridge: Add support for
 radxa ra620
Message-ID: <4qs65cbi2u777ykgial37gsyzosj5znduxwvcuwbxi3kxzy5dd@k7tcgcyepjoz>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-7-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728082846.3811429-7-andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a704be cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=HhVUBrKwW8KbpwAMqUoA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: WJJ8b-nd4XoVeskpa_Um4f44iZC02zgD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/t3jzU5cdIJ0
 uhamCb9IUYrbj5s9gPt0UDSKvpSGc8M+F88/NocCUoq+hGOkfNkqjvLeIXQlQhLAsOPm9cJZbui
 OPLsjo+jW5JeB4SkkiTsJqAEsIcVcaoyPc7lBpSnzoiIjDR9LMYH1ZmaRK7K65PfLpgM5807yL/
 KPIXeqOXM16E0scYdoS3juxqnK+IR4+jpgodRmMQPkB1AJ9+LQV5H61B/RGvbDgDd8InmW/SdHG
 E4AXVMiaSVvWlMROMFaZ7MTQ24paUiI+ebpUtb+kRmjE0ZuaYlPJrQvO+g1ZvdgUwaADSNx9hJX
 s1yhwJdUrWjwIwmb8yuwHHpSA0hgN29pcYlRB2LYw1xq/yE8DTpxWtQy8gBxVD/ZA0k6RbRIhqL
 W9PHBuTkmrZZIUu23ts+z6XZfXmcOA==
X-Proofpoint-GUID: WJJ8b-nd4XoVeskpa_Um4f44iZC02zgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Mon, Jul 28, 2025 at 04:28:31PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The RA620 is an active DP to HDMI converter chip, basically
> no software is involved to drive it.
> 
> Add it to simple bridge to make it can be find by the drm bridge chain.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> ---
> 
> (no changes since v3)
> 

Nit: typo in the subject, should be 'bridge'

-- 
With best wishes
Dmitry
