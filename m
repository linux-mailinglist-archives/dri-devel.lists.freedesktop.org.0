Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEAD48D58E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 11:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A464F10EF88;
	Thu, 13 Jan 2022 10:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05BB10EA69
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 10:21:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20D8S77O017161;
 Thu, 13 Jan 2022 11:21:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4DuleFFceRfbztWmfYxXFQO+YBMNDqqrJdOpBXrPzcs=;
 b=u7QfE7iKoPzbNhsK2eB0TQJrDGBm30ie9dAkp+9S0Wa+VdUpNwoXjpgZ5sKwrrQmyaTH
 F//Ff9fsaxvEmNTASmhaD9ZExvAio81iyaQPBNNlYaWqG+3vU104WQ3WWOJ6klnyrE1I
 mn3Uja60eNt8Xsu32dW3S78C8w/2VX8jOvDACS6V1CIGXit5bmjXmC1knsYD59gQMn9D
 +D9Kcl7lEaaijjZnTvDuu11jzDvtpIRM9KBJvXA2ip7egjC0GyAsH5GjfEK4J1uTDNcG
 CjK42rS8AqxRlB3KJjpwFvBouzJ+KYccPJE6T3hD0vX7Er9lLFj3rSyK6ro77x+fwL+C Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djgkkrqmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 11:21:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E244D100034;
 Thu, 13 Jan 2022 11:21:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB1AB20D18E;
 Thu, 13 Jan 2022 11:21:06 +0100 (CET)
Received: from lmecxl1137.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan
 2022 11:21:06 +0100
Subject: Re: [PATCH 4/5] drm/stm: ltdc: add support of flexible pixel formats
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211215214835.20593-1-yannick.fertre@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <9a718ddb-163b-6c9a-b83b-a52df94805cf@foss.st.com>
Date: Thu, 13 Jan 2022 11:21:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215214835.20593-1-yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_02,2022-01-13_01,2021-12-02_01
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
> This feature allows the generation of any RGB pixel format.
> The list of supported formats is no longer linked to the
> register LXPFCR_PF, that the reason why a list of drm formats is
> defined for each display controller version.
>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 196 ++++++++++++++++++++++++++-----------
>  drivers/gpu/drm/stm/ltdc.h |   5 +-
>  2 files changed, 145 insertions(+), 56 deletions(-)


Hello Yannick,


Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Tested-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Many thanks, this is an interesting patch.

Raphaël

