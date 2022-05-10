Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1701521009
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 10:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B899410E766;
	Tue, 10 May 2022 08:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9A010E766
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 08:51:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A7VkYM021004;
 Tue, 10 May 2022 10:51:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zyQAZ1qCLwSmsqH7mY0+MiDYL0UqFLkA6EXaQGJfp0Y=;
 b=thhIgxUw7pAFwoKaT9QFp5imFybzHuhDHAXb51me6i+o3XNGw9luK2o+BDqf3cZC2FbA
 Fxt+nrcQJE/kiQ6G1BvXbwUdD0wqhA7RrQx3sllVPLx+odZumWBV7rOJuVq+pAGZZO1h
 FelG6Do3Y+nXEe4CAMH2lXmjiM1T+Bdr62W+0lMj1OcZRM5TdFOXXa0shkDUe90KHKuW
 A0HDc3/yxuYejnM1Tu6C4SFX8R/YbRF6RLEuvzdvHtvktHzOYljDk4nTosTCxGNSMkNH
 nXbwOgOaUi1iGWg3/GTD3sIEfGo/F+Ep/7XPsLE2pBPRvIwPMNWhcXUg7Zrp8x3E2YVh jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kq2r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 10:51:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B22EA10002A;
 Tue, 10 May 2022 10:51:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3EF8210F73;
 Tue, 10 May 2022 10:51:11 +0200 (CEST)
Received: from [10.201.21.216] (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 10 May
 2022 10:51:10 +0200
Message-ID: <c04661ca-20a4-17c6-8170-f3ed2594bdbd@foss.st.com>
Date: Tue, 10 May 2022 10:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/stm: dsi: Enable wrapper glue regulator early
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20220429204519.241549-1-marex@denx.de>
 <56f6fc01-4f33-b240-5539-492b2c115476@foss.st.com>
 <24f18d45-09d9-05b6-b1ad-9ee2854c53ec@denx.de>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <24f18d45-09d9-05b6-b1ad-9ee2854c53ec@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
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
Cc: Yannick Fertre <yannick.fertre@foss.st.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, robert.foss@linaro.org,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/5/22 19:40, Marek Vasut wrote:
> On 5/4/22 09:59, Raphael Gallais-Pou wrote:
>> Hi Marek,
>
> Hi,
>
> [...]
>
>>> @@ -499,8 +512,16 @@ static int dw_mipi_dsi_stm_probe(struct platform_device
>>> *pdev)
>>>       }
>>>         dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
>>> +
>>> +    ret = dw_mipi_dsi_phy_regulator_on(dsi);
>>>       clk_disable_unprepare(pclk);
>>>   +    if (ret) {
>>> +        DRM_ERROR("%s: Failed to enable wrapper regulator, ret=%d\n",
>>> +              __func__, ret);
>>> +        goto err_dsi_probe;
>>> +    }
>>> +
>>
>> I have no problem until here. If I understand this correctly, it enables the
>> regulator during all the life of the driver.
>>
>> If you feel an urge to merge this patch into the Linux kernel, the st display
>> team could gladly do it because it enables more hardware bridges. However
>> another solution could be to rework a bit the regulator part of the driver so
>> that you would have only device tree to change, introducing a 'reg-always-on'
>> property.
>>
>> This driver needs in fact a bit of a rework with the power management. A
>> solution could be to move the regulator-related part in
>> dw_mipi_dsi_stm_power_on/off() so that it is only activated when needed.
>> Those functions would integrate the enabling of the regulator, the switch for
>> the internal regulator, and eventually handle the PLL if it cannot lock when
>> the regulator is off.
>>
>> With the DT property, the power management would be only in the
>> probe()/remove(). In that way the DSI bridges would have the logic they need
>> to work.
>>
>> Ultimately there is two possibilities :
>>   * You really need this patch to be merged asap
>>   * You are ok to wait until we send the solution described above
>>
>> If you want to write those patches (each for DT and regulator), feel free to
>> do it.
>>
>> What do you think about it ?
>
> Maybe a more generic question first -- is there a way to pull the data lanes
> to LP11 without enabling the regulator ?
>
> Also note that you likely want to wait with this patch, there is likely soon
> going to be a discussion about how to handle all those different requirements
> for initial DSI LP states and clock needed by DSI bridges, encoding such
> policy into DT is not the right approach.


After quite some time of internal research, it is unfortunately not possible to
adjust data lanes state to LP11 without the regulator enabled.

So I guess, without a change to handle DSI LP states differently within DRM,
your patch may be the best approach to operate such bridges.

Note that I am still trying to understand how other chip vendors managed the
case. Maybe their hardware can effectively handle the DL states without enabling
their regulator ?

I wonder if another solution could be to move the TC356787 bridge reset outside
the probe, so we could also delay the regulator_enable on STM driver side.

Anyway I agree with you that modifying the device tree is not the right method,
and having the driver always powered is not so nice either.


Raphaël

