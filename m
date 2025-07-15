Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A045B05994
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BFF10E59F;
	Tue, 15 Jul 2025 12:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQoi5OSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE83110E59F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:06:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F6CBIX023283
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=whgpErroktFXqC6PFq2WcPTx
 Y5NFQM6yRWXrcNe/B5E=; b=oQoi5OSEalOMhOlaVsCQwivDCxIQJkwdw2Gjk36d
 KOoK/PSWH19kWIRgR6wfPCM2d0JymbeYro1VX9x92LvyDpRE3DF1SmtAmAceD+Oi
 zu2OG52GP8B7uh7a7ZCc/ZSEfQPSO18KyCErrQsMv1y/LlXTzYrBp3oFbKt9bclj
 3sdLK0ezqdYtrn1iKYc5rjpr4JzHTvfWeO/5QLqKEJdOKScjpyheIyNgkzOf6sON
 Uuoc4w8OYOGRkDBTcmmTFjb9LXp2TPxZY0wPwtkN4U5VuS2dKdgBjYbhTOuBUaHc
 mn+ycF5PDfrV9hDh5sdBx6QVpeOzJdMVKLJvsMIMSlJVyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpaxhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:06:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so1004329785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 05:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752581159; x=1753185959;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whgpErroktFXqC6PFq2WcPTxY5NFQM6yRWXrcNe/B5E=;
 b=THXRgf0F4xbCURSVEE1CapojSR/gSJkSsnrcUkK4WpKjTQbvSS0vXuJh91g8ZZJxsE
 lSijsiEkqL6TLdTpj3XtVa1f7hu8Hbsm1BW/8VN4SJtWOypK7b6ydwAjRZrI+IIIh2Wh
 ilQSc7IUlLISVmfcY9Iy5YAUoa/2A4jw21uct9+9VXSS5J4oeEfeEj/UHJw95QNLQ9AN
 QFfUzUqhtyJxa/IhGSuxeLD9RK7qGySH7W3EWMCoHohP4UfJGcFWgKx1+HQVS2oiqgRu
 NUdvRT+mflOISob/rVaqQ1pLv16Jbm/Ks8aIWY8K8bweyDaXDiEOaJEbzWU3VO1dfJoe
 SNJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD8xpexkkq8TzYe9f/QHAC33k5AZQXXKZQiEE4sW5vz4rf0R86Hg/Lyn0XatmRnECfobIUlz4sPI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5JTx8zWqb+E/jfpRDQMiF4DqBPa58j8qGGDfw01818gEvotzq
 I5WHS6GUIDM5LvkwbjYMJbdQPgNhgA3Fvt2gQCcD3ooYd1qA/ALA2tNDSz4fVRRSfo51JsOsCQX
 u7uojybR6KiCvGinQy9h/3kA61yekotgSf6mOs+BvovDkW9xZPO+/FJNC3kJw8bhc///FCZI=
X-Gm-Gg: ASbGncta+lo/aGPdhua9I1PT8AhVxZ2S17m5ZdtonbiC/NvRUAQVoeZL/A7xbwT7dRT
 uUS6A4ihE33+bPDRTWsE9Ft0K6eGilL4nS6IOXLWZRB0cX3b2Pv1UEaPk+snynu4dwnlN4tgYVl
 Dulp1TT4Uuezt4o3n4oH9+LNf0ZjLejJyo9CLByYk3KqHgFulIpbiW20m+qWP3FbmV/F8ZAf9JT
 s2nbxA7HwHn0kh6tGmUWV5ewtrLiM8ULJdLICeJBXEm8hsRh+x72ImraxNWwv8fDmnLAkYkyNlF
 gG8JNmF+msrn3TzPK3WRD2GwhbouumqqgSCnO+6kIilZHmi8aba/dfybfcGZ7pJ+QtWnHLo78Ur
 9+VDrEwdaO0yoLzUWx1fxf/eFt1hXMgSiyGy0c6lIzbK1qtV5IMNI
X-Received: by 2002:a05:620a:2617:b0:7db:52b9:2060 with SMTP id
 af79cd13be357-7de06bbb9acmr3084722785a.36.1752581158908; 
 Tue, 15 Jul 2025 05:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIm9VPHvsWFqJ0lg2fwfKKO9Xor4P4bNsy7V94yiewt2Z36zolTE2cwObNp3IrftJTJDg+rw==
X-Received: by 2002:a05:620a:2617:b0:7db:52b9:2060 with SMTP id
 af79cd13be357-7de06bbb9acmr3084715885a.36.1752581158361; 
 Tue, 15 Jul 2025 05:05:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fab8e4b7asm18929411fa.75.2025.07.15.05.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 05:05:57 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:05:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] phy: rockchip: phy-rockchip-typec: Add support for
 Type-C TCPM
Message-ID: <eqb5m22om6bx2ypjtnlwdjmgfyycpmgrlvro34xwlwjj4j2jeq@mrarg36wetp6>
References: <20250715112456.101-1-kernel@airkyi.com>
 <20250715112456.101-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715112456.101-4-kernel@airkyi.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDExMSBTYWx0ZWRfXzPOeto1y7XbY
 OCVv5P9jTs68n8KsViNpTduuEzOxzJ+KU5RhhrAEPE/LXbV/UwI7WCwZfvpBFq1maGpE2z0hbQv
 gOU3ORE+pMtl7EWHoi/8Jy+h11onWxzMEmnWrgkKAk1UJc0KO8zfq+WHC/hPXglOQebb72r6gwu
 qe5FGvHjKfMQ3kqzBDLT1Jgg4UjE7n7JiHu8qsLo0V2N7qdT+9jL20ZI6jnzZKXPMofU5+798+6
 1AOAzLAF0QcPX7YwKe/Ge0hPa8Mjwul2lR9HMf9bLPaTcAKGg7/khHwerFhMwn9fDUJ0LQEdQOv
 Fi4DEY4RRMe185xxqmJQO9Dhguo2DOOLjWjo5R2w/KM96CoCPvZlAw/aXh2CbdsDc9mC9NmV4vn
 RHHf6VLrGqd1PGL8svMbaSfIK2gh37wkEz+esSv8rMshpTzUKKJL6tHNSV6PoV41Bhn8HCnE
X-Proofpoint-GUID: eJqf70XO0VHt9IbjLgRjYpk0uwGK3WK-
X-Proofpoint-ORIG-GUID: eJqf70XO0VHt9IbjLgRjYpk0uwGK3WK-
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68764428 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=8-VJQ8zMMZwrctniyC0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=832 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150111
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

On Tue, Jul 15, 2025 at 07:24:54PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This patch add support for Type-C Port Controller Manager.
> The extcon device should still be supported.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-typec.c | 335 ++++++++++++++++++++--
>  1 file changed, 319 insertions(+), 16 deletions(-)

Please keep TCPM implementation under drivers/usb/typec/tcpm/ . Create
an aux device and write an aux driver for the TCPM part.

-- 
With best wishes
Dmitry
