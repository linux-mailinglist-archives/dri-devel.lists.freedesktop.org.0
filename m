Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86CB88131E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 15:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBD210F9DA;
	Wed, 20 Mar 2024 14:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="3tjsBrSN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10D610F9DA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 14:14:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42KCsf8Y009234; Wed, 20 Mar 2024 15:14:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:from:subject:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=eSHpvYuMMA/7BKJU5oieTcXas1/vD/WRye6gXn0CtRg=; b=3t
 jsBrSNTz94dOlnVw3NzCmHyRKqn5pL2dbmyDh/jG4Xm4mPjDC8lXa6z9EMWXNBEA
 62r+Q3Wcnk54cm5nUYpzFNOWhmEf0oZYEIPjJvGF6LnB7BBpzW4s0qt9MXfDyGiP
 QWdYBsGYQBlMg3rxRUZY9WGekI24bc+ORFG1XS1VeyY4QN3FbRumbDyBjzoQNOTh
 cQgk+HhcPAktTAmO+RAZl0X5gop/KbeO/aMJd8rS3G0j3QEzwelWJOTvqyvYAHvl
 tDSHQLJKymIEb+Q+rL7/GkMUIKfUMr6h0+mR393GS88osl1eFBsMSc6i17QnnLCa
 76uid9qmsL5CkhyDBSuw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ww1e99wet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Mar 2024 15:14:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A60840045;
 Wed, 20 Mar 2024 15:14:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DE9825F7C5;
 Wed, 20 Mar 2024 15:14:27 +0100 (CET)
Received: from [10.129.178.79] (10.129.178.79) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Mar
 2024 15:14:25 +0100
Message-ID: <99dad358-0ca8-4f19-9d0c-e41c095db8c7@foss.st.com>
Date: Wed, 20 Mar 2024 15:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: STM32 DSI controller driver: mode_valid clock tolerance
To: Sean Nyekjaer <sean@geanix.com>, <yannick.fertre@foss.st.com>,
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, Antonio Maria BORNEO - foss
 <antonio.borneo@foss.st.com>
CC: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
References: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
Content-Language: en-US
In-Reply-To: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_09,2024-03-18_03,2023-05-22_02
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


On 3/8/24 09:35, Sean Nyekjaer wrote:
> Hi,


Hi Sean,


Sorry for not responding earlier.

I've also added Antonio Borneo, which is the author of the implementation of the
mode_valid() hook.

> I’m using a stm32mp157 with a sn65dsi83 DSI2LVDS bridge.
> The LVDS display is having a minimum clock of 25.2 MHz, typical of 27,2 MHz and a max of 30,5 MHz.
>
> I will fail the mode_valid check with MODE_CLOCK_RANGE.
> It will request 27200000 Hz, but is getting 27250000. Guess the display is fine with this :)
>
> In this case it seems a bit harsh to fail if the output clock isn’t within 50 Hz of the requested clock.
>
> If HDMI is requiring a tolerance of 50 Hz, would it be better to do the check in the HDMI bridge driver?

At the time when the driver was implemented, a large set of TVs/HDMI panels were
tested, and it was the 'optimal' parameter found, even if the value is quite
restrictive.

As Maxime said earlier, it was also easier to implement this tolerance directly
within the DSI driver, since only the display-controller and the driver itself
have access to this clock.


Eventually a device-tree parameter could be implemented, with default value to
50Hz, so that fine tuning can be done using other bridges.


Hope this answer to your question.


Regards,

Raphaël


> /Sean
