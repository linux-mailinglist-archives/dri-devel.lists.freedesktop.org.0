Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427063C2144
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 11:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D9E6E9F3;
	Fri,  9 Jul 2021 09:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2425B6E9F1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 09:10:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169918gk031664; Fri, 9 Jul 2021 11:09:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DVH6ZuxNXZTaEp6S+cHLNHrvmkcMuKnL6vylu2Kte94=;
 b=7X5msmvjOn6lK1uy7Ov8hNhhBoUX+ReOVaZHIli8xgs4URQqfsV9h2q3EJXf0IyZyrk6
 7ruDFLQaiTTrqQkNVRP1+z7Rv3updQNngansGwJLOY/0Yix0aqY6xoBjAXTZsih9S+kd
 poVuB4Kx/1KZe0q+NYpzxtuSki2I6bjBhUKmA8xen5CKzs0uCxzrEN5X83BpPYUhxmC3
 +IzXYipnYgtWR+uKtzKR6JP1KdrOrsfZ3uUxa0CnDt320w51GFLgppGJ8WLDLqv86vTj
 HJaalJUplp1g4iT0HZswmfKbe78By3wzgNH0Gryn8cbYrDtO03w7qs/UDlKBYJvXTfkF 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39p4vbbww3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 11:09:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A91B010002A;
 Fri,  9 Jul 2021 11:09:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 87CAF218CB8;
 Fri,  9 Jul 2021 11:09:48 +0200 (CEST)
Received: from lmecxl0557.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 11:09:47 +0200
Subject: Re: [PATCH 0/2] Add "BACKGROUND_COLOR" drm property
To: Simon Ser <contact@emersion.fr>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>, Matt Roper
 <matthew.d.roper@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Yannick FERTRE
 <yannick.fertre@st.com>, Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <31K3xupK1-7HNWorHqIwGwgEJl-1XdFjUQEoNYm6yB-lRoZ8kq5quRji_r3mzPZ0bUayLef6xPfQDiETgZp9lR7vUpDn2nB_37ncSd-J0Wc=@emersion.fr>
 <YOWTCSpOZTGZS2qP@phenom.ffwll.local>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <a8f02b4c-b1ea-320e-a6b2-952f4e641794@foss.st.com>
Date: Fri, 9 Jul 2021 11:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOWTCSpOZTGZS2qP@phenom.ffwll.local>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_04:2021-07-09,
 2021-07-09 signatures=0
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


On 7/7/21 1:42 PM, Daniel Vetter wrote:
> On Wed, Jul 07, 2021 at 09:03:03AM +0000, Simon Ser wrote:
>> Hi,
>>
>> Thanks for working on this. Do you have plans for user-space
>> implementations and IGT?
> Note that these parts are mandatory, and there's a patch floating around
> further clarifying what's all expected for new properties:
>
> https://lore.kernel.org/dri-devel/20210706161244.1038592-1-maxime@cerno.tech/


Hi,


We don't usually test with piglit and igt-gpu-tools. Instead, modetest 
utility of the libdrm is used quite often (as is it the case in order to 
test this property).


We plan to port those tools on our platform before implementing this 
kind of tests, but it will require a bit more time.

An analysis is currently ongoing.


Furthermore, do you have any advice on top of documentation for 
implementing such tests ?


I was also thinking about implementing an option into modetest to ease 
the use of this drm property (support of hexadecimal values for properties).


Regards,

Raphaël

>
> Cheers, Daniel
>
>> Thanks,
>>
>> Simon
