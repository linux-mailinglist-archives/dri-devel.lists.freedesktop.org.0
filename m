Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB4CB05989
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF9C10E37A;
	Tue, 15 Jul 2025 12:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGtPvDSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B31410E37A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:04:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F6Qnmt029012
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uewLyWaWo+XEtP3pU1ovudoo
 X8FXuLSHNKA5wv9Jbhg=; b=dGtPvDSXLEiPdl3CHjLxdrhQbN0NwOq3l+YIPu4X
 hVkm5cNDxft1J4ab42X7iJgqqENQGeXEmEU36rxBCi6BDwLZa78Ii6TK61uWkNEL
 H9DGn7x5fOduOzuOz6Z+S7RbZg9o6LQUuDw4Ls0rRfeHx5bQtUWxnbt379YRfbHq
 1sTTyY7oPBz+I0nqX0ojmZx6Hu2sZ0QI4RiOHoUEHheUKrl//Rs/4oBAGA9QeeUf
 OYwVj54GmbV91u36r1i83vQGmmXpHhYf9guevfNPIWlzlr2Y0RBbxKAzx1cu8Wwq
 shVqwzuDNxs4w5lBq68BQGmYGhYB86tQV8LAGtiCgIoNXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drjxs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:04:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c7c30d8986so1542088485a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 05:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752581049; x=1753185849;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uewLyWaWo+XEtP3pU1ovudooX8FXuLSHNKA5wv9Jbhg=;
 b=qs/8pqmC2gDcdGNPPr2G18pe27zFJ4IB2okFJ9MK5QflcqRBwa5TlLSZrbkjqALzEP
 4TetGTbZADDS4of1f/H3gtvbPaH4mKT99r5JDOgqjOCUuzQAGcrWLnoxoxRsOwcnms58
 5W5VywxTLXbCVFtZd+vgcDK9v1NADBtb7L5vPfChpn460/e+oUcpd9MyGafS3xfZdp44
 x5cGPU/MXPj3HmuhOY066MVZBHGYx1c9hwk5fIG5fGzLdu1P8U0Y6hvf7pLonueyfq/8
 +0+wTGguue7ON3X3j1AN5ZpyHfvz2rxRx6VNyT35Le7C4BqEVjyWB3gqLuBPT8iz9rR+
 MRyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQTSHo2Y4nlcHY4BqKJXw2JdHnSzKCTVt1porFIyn/FFVobWg2HqthYtpR/1oKKpJbpTiLod8OBVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd4IWU4eY+Jkz6FekbPF6spu1BaJsfnycCzOqyqiCRquFJOf0w
 wFikS9xTbmWAOPYJzZi1qC6ooR8xhitfR2VEGqKIZJbsuzVzj89XwrOno3klWy3Jq3pU7DyJD1h
 c7bGi3m4mmULb+ON4nq/1w3Tpq1GwhN1rWjCXwKj2qhJASFZqNt8VzEWaz5vtKWFAELW72BQ=
X-Gm-Gg: ASbGncuc461DkgDYn1MiGjr/PuXSliaQ4T2Ne9uF9nQWY5nQW/b0QznkZfxHE7dxqAt
 /CD2RzEyZjixETwk3J7XjazULunGfyl8pJlaKxn/suqAQroWC7AbIl8BZHLsmZ4g0a9uHUcbdZI
 qjm3lzk3u4Rmegw769NRbmhgrxlSZBwokYTu6KK3IiXXGIamwR2Hd2DeiF0rZf5zvykY7F9+h6c
 SEZsXYyeU9ApDEZN2ooYJNBd2tei41Jqms64bIlmgaLzi5HbWHKylyi+14TLfFX3PnbW/T4ptVA
 a2+ZEaKvqfKGRe4WKXyUbpur+W7s+M7vYqHTpE9fbSqQUDLBiHkpiLucPMT7dnoVcPRciADmUxS
 ydEsY0OcRWNCPvvdWw+y5ySW0mtFPNgdbzuv5Ygrx2HOc1Oom6nK6
X-Received: by 2002:a05:620a:440a:b0:7e3:35dd:4829 with SMTP id
 af79cd13be357-7e335dd4ee6mr517583585a.46.1752581049160; 
 Tue, 15 Jul 2025 05:04:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG+QA3kcqdK27HrgZ41em40tegk2sEjV/HwigntzMPoVZCR1JNaYYEpmMQ+MrBS7T3eBGxTw==
X-Received: by 2002:a05:620a:440a:b0:7e3:35dd:4829 with SMTP id
 af79cd13be357-7e335dd4ee6mr517577685a.46.1752581048678; 
 Tue, 15 Jul 2025 05:04:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c7bbfcfsm2266306e87.40.2025.07.15.05.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 05:04:07 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:04:06 +0300
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
Subject: Re: [PATCH 1/5] dt-bindings: connector: Add displayport connector
 for hotplug notify
Message-ID: <r7b4y74lr5qwejkejquosaar75mthjvjfy4pp6bbl4pgte6cq4@n3gwjolsaw2j>
References: <20250715112456.101-1-kernel@airkyi.com>
 <20250715112456.101-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715112456.101-2-kernel@airkyi.com>
X-Proofpoint-ORIG-GUID: bKl0EjpGYxtiXh-B0jjWNvMn_A_WXcWZ
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687643ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=s8YR1HE3AAAA:8
 a=w3lZJLl83XfeLKIF-PIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: bKl0EjpGYxtiXh-B0jjWNvMn_A_WXcWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDExMCBTYWx0ZWRfX99TlSmNXd9Vu
 07GVGtmFs3xRgf+S71i0VfXJY463/l0C7lRX4cPkUkUU6x+BnxQW9y8gyecRHmahhQpad5N09rG
 Bhqor9o+j8F+/g3VgfmZtsIQoua1goanRR26Y3TuDS9fUQyQVmIo+RMmpvGbuPhJ/iOIhJkifWY
 Aoprgc+gC2x0F3woxtYOXAdXrtSh8VyHcBoqo2aiOIcZHoO9G17Ia1XBG/OhWfu13hV4FNmK6Jn
 R/rrh5GlewhFWZkbkOfrfeabicfzMx5aHUwfnDbPNmIqVpUzIRqxzN20iU7W3cZSN+DN2b18BHC
 yH5j0JBloAl0Dmwe2fVbrpZxWllIX0hwOMpEXtGjGpJFjgPKwdiOqpX/S+Hj96iQTDXG2r2LujO
 Ogo6hRAer+9nHy9sHsj7jUk3U7pg1a7/CN8x3ktCAKjDPSg7wyh1ZcDrK2p0LQxuR8QNfXFA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150110
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

On Tue, Jul 15, 2025 at 07:24:52PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The USB Type-C DisplayPort alternate mode driver will find
> "displayport" property for DRM hotplug event notify[0].
> 
> [0]: https://lore.kernel.org/all/20210817215201.795062-9-hdegoede@redhat.com/
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  .../devicetree/bindings/connector/usb-connector.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Please see how it was done on other platforms. For example, qualcomm
(both tcpm and pmic-glink) use port / endpoint to link to the DP PHY /
DP controller.

-- 
With best wishes
Dmitry
