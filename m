Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1648D8B5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 14:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C211123B5;
	Thu, 13 Jan 2022 13:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA778112353
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 13:19:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20DCQN9b024349;
 Thu, 13 Jan 2022 14:19:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=c95u3f+Ax4rlCPiwDXYg6tF8+3Kli+EEnqR9tSyq+L4=;
 b=b2GXZUxY73a6ljxrr0V4gMc9fwNujg+Jfh3ULatFs5rZOHQ8N69/zuNnq6rWp/xtRDQT
 4/hnoZwmF7kSDA1b7PonpvppbSjo5LWa9p9Z3K4BPb5CBIFSJexGcE5mPV0oiIX8Aeh9
 /tvtMwGwg9nH2lp+Q83UfWH9GiLgvKAy/svnVRxP17+YO3OaX/IwmSMw/gBXPT0sdFao
 nqSPmmx5srXKMViwqfGqw9mENvdi50oz4+n6q3F2ddU9XEGDyt7A1rzrFo9rpvfF+jYa
 QWIMKLthRluiM1m8yefBaGnvMFonl6sJQbAox+guoarNFSs/5w39XjUaI7Jz2Ha7Ol7+ Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djfywss15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 14:19:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D128100038;
 Thu, 13 Jan 2022 14:19:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2544020D186;
 Thu, 13 Jan 2022 14:19:24 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan
 2022 14:19:23 +0100
Subject: Re: [PATCH 0/5] drm/stm: new features to display controller
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211215214651.19798-1-yannick.fertre@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <14a5fdf6-020b-ecf4-d566-a1b8a5a62de5@foss.st.com>
Date: Thu, 13 Jan 2022 14:19:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215214651.19798-1-yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_04,2022-01-13_01,2021-12-02_01
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



On 12/15/21 10:46 PM, Yannick Fertre wrote:
> Hello,
> List of new feature:
> * Replace the legacy register access by regmap API.
> * Support of YCbCr 422 output
> * Update layer shadow registers per plane.
> * Support of YCbCr output (planar, semiplanar & coplanar)
> 
> These featues are available only with last hardware version of ltdc
> (0x401000) link to patch"drm/stm: ltdc: support of new hardware version"
> (https://patchwork.freedesktop.org/patch/465207).
> 
> Yannick Fertre (5):
>    drm/stm: ltdc: switch to regmap
>    drm/stm: ltdc: add YCbCr 422 output support
>    drm/stm: ltdc: add per plane update support
>    drm/stm: ltdc: add support of flexible pixel formats
>    drm/stm: ltdc: add support of ycbcr pixel formats
> 
>   drivers/gpu/drm/stm/ltdc.c | 639 +++++++++++++++++++++++++++++--------
>   drivers/gpu/drm/stm/ltdc.h |   9 +-
>   2 files changed, 518 insertions(+), 130 deletions(-)
> 

Hi Yannick,
for the entire serie,
Applied on drm-misc-next.
Many thanks for your patches,
Philippe :-)
