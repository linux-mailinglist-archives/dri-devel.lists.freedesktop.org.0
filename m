Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E4B483FE5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 11:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3E110E269;
	Tue,  4 Jan 2022 10:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5049C10E269
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 10:28:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2049Zt1J025001;
 Tue, 4 Jan 2022 11:27:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2i2fKhlisA3qBUyDd5sOBqAnU1gmhJAF6uiAYaj2g8M=;
 b=Gdodiha7M5up/5mzwTu+KkPWrnLNyvz7L+Lu2MVQQykqsnz4J1d5Wqsjpq0LwfwO8dd5
 BYDoqWira0jSTLuBK6MAURsBM4oU67VBkhd//n3V+o018MMFYwJeEGT8Jta3+bkmhhv2
 +p7Rf4pLeMmywdnrZ74Eq8AXO/eKzQHeARvkxxZXukRKY2PTFTnQa4OPJB0klNwgVIzT
 lrRrfrf3JUJ/i7V/lHbAsw9mIQmX+S3zyMnth/Dp1a6rEsHHCiDTR9L8BsKip1wOwanZ
 sjksqT3+PmYnTdKIFnT63v/7eIKmdSBBYZiEP4LUAW45MeLHJrFekp5xbnUgRxA09JEj Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dcbt0j5fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 11:27:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E66AC10002A;
 Tue,  4 Jan 2022 11:27:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB762234C21;
 Tue,  4 Jan 2022 11:27:57 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 4 Jan
 2022 11:27:56 +0100
Subject: Re: [PATCH 5/5] drm/stm: ltdc: add support of ycbcr pixel formats
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211215214843.20703-1-yannick.fertre@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <5f198ef8-5db1-072f-9e8a-a80e0a6e9113@foss.st.com>
Date: Tue, 4 Jan 2022 11:27:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215214843.20703-1-yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_05,2022-01-04_01,2021-12-02_01
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



On 12/15/21 10:48 PM, Yannick Fertre wrote:
> This patch adds the following YCbCr input pixel formats on the latest
> LTDC hardware version:
> 
> 1 plane  (co-planar)  : YUYV, YVYU, UYVY, VYUY
> 2 planes (semi-planar): NV12, NV21
> 3 planes (full-planar): YU12=I420=DRM YUV420, YV12=DRM YVU420
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 251 +++++++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/stm/ltdc.h |   1 +
>   2 files changed, 245 insertions(+), 7 deletions(-)
> 

Hi Yannick,
many thanks for your patch.
Nice hw features!
Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>
Philippe :-)
