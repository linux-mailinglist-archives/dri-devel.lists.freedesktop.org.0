Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD21244701
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 11:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C5E6E3B5;
	Fri, 14 Aug 2020 09:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6826E3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 09:29:50 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07E9Teum124793;
 Fri, 14 Aug 2020 04:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1597397380;
 bh=5/rjwRjZWzx8hrnU6DFNe3GilgF9jyJehzM/soNMCzw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QV5CY1O9r+ReoIfZBeaDczp4KHVDRwKgrMIat2BjlP1FOdaPEdxVTw1mB7TRFiN6/
 goLZyp4jXwyfPkfHwjNriXlV6p02pyp7fcgmxqntNWGS8U4+fnvLRKgO7YiuPBnA+Z
 PoZ5RKlCxFoqpOY0DYcAjUIcur2vjuWmwySJ5j3U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07E9TeZI004961
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Aug 2020 04:29:40 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 14
 Aug 2020 04:29:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 14 Aug 2020 04:29:40 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07E9Ta8k052359;
 Fri, 14 Aug 2020 04:29:36 -0500
Subject: Re: [PATCH v8 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Swapnil Jakhade
 <sjakhade@cadence.com>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
 <1596713672-8146-3-git-send-email-sjakhade@cadence.com>
 <20200811023622.GC13513@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <49c2a4c8-6d84-6164-d350-6a985fc9a3e9@ti.com>
Date: Fri, 14 Aug 2020 12:29:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811023622.GC13513@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org,
 jsarha@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/08/2020 05:36, Laurent Pinchart wrote:

>> +static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8 val)
>> +{
>> +	int ret, full;
>> +
>> +	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
>> +
>> +	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_FULL,
>> +				 full, !full, MAILBOX_RETRY_US,
>> +				 MAILBOX_TIMEOUT_US);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
>> +
>> +	return 0;
>> +}
> 
> As commented previously, I think there's room for optimization here. Two
> options that I think should be investigated are using the mailbox
> interrupts, and only polling for the first byte of the message
> (depending on whether the firmware implementation can guarantee that
> when the first byte is available, the rest of the message will be
> immediately available too). This can be done on top of this patch
> though.

I made some tests on this.

I cannot see mailbox_write ever looping, mailbox is never full. So in this case the
readx_poll_timeout() call is there just for safety to catch the cases where something has gone
totally wrong or perhaps once in a while the mbox can be full for a tiny moment. But we always do
need to check CDNS_MAILBOX_FULL before each write to CDNS_MAILBOX_TX_DATA, so we can as well use
readx_poll_timeout for that to catch the odd cases (afaics, there's no real overhead if the exit
condition is true immediately).

mailbox_read polls sometimes. Most often it does not poll, as the data is ready in the mbox, and in
these cases the situation is the same as for mailbox_write.

The cases where it does poll are related to things where the fw has to wait for something. The
longest poll waits seemed to be EDID read (16 ms wait) and adjusting LT (1.7 ms wait). And afaics,
when the first byte of the received message is there, the rest of the bytes will be available
without wait.

For mailbox_write and for most mailbox_reads I think using interrupts makes no sense, as the
overhead would be big.

For those few long read operations, interrupts would make sense. I guess a simple way to handle this
would be to add a new function, wait_for_mbox_data() or such, which would use the interrupts to wait
for mbox not empty. This function could be used in selected functions (edid, LT) after
cdns_mhdp_mailbox_send().

Although I think it's not that bad currently, MAILBOX_RETRY_US is 1ms, so it's quite lazy polling,
so perhaps this can be considered TODO optimization.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
