Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DF91E1FD6
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 12:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D923C89A88;
	Tue, 26 May 2020 10:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5979389A88
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DcCPTegeL4/9yo2vCU/JGoVKdudEoFYRZ1hgMcX0JO0=; b=qhIXUq65KKmkwLWRnRnI9CLOIS
 rD3r9RUkwcBrzCVqh8UlmI4LPMGuYe0mhot5T8qAOpfEpmpCQmJt5AMH+nKfagIPpkJRMleng1mxz
 OyTK+NFKACihHd75NOPNlfEPWMGrMNPGsC1CL0dV/C0BrRk4VRNMqcAb0Anc8TK6hbWNnDiue89PQ
 VT5+lRx38B/PrsaAuVranD0BLfTnG7SmrJxOOM7zDIHSsL7XlSdPJ4LJ5kMngek2ugR4+s3p7omsh
 BmQoIVwFO4bL2f0m9dY/lEGh6ygghp/tRCaOp54B/zfoU6JcRyRvvI0pYLHODI1ez2TMXOONr8GyV
 fwZhjEgQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58843
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jdWyA-00012X-Db; Tue, 26 May 2020 12:38:02 +0200
Subject: Re: [PATCH v5 6/8] drm/panel: Add ilitek ili9341 panel driver
To: dillon min <dillon.minfei@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
 <CAHp75VebSZa6mwAETnM0t42RQCp4iM6_SNjmy3TB48ixsGKV8g@mail.gmail.com>
 <CAL9mu0+jmcivC6zAXxK0-oXy3n44pAU1QGD7BDq=CT2D7twROQ@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <c085e8f5-f626-28a9-1d3f-a1c277ec5052@tronnes.org>
Date: Tue, 26 May 2020 12:38:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0+jmcivC6zAXxK0-oXy3n44pAU1QGD7BDq=CT2D7twROQ@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 26.05.2020 11.08, skrev dillon min:
> Hi Andy,
> 
> Thanks for input.
> 
> On Tue, May 26, 2020 at 3:46 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>>
>> On Mon, May 25, 2020 at 6:46 AM <dillon.minfei@gmail.com> wrote:
>>>
>>> From: dillon min <dillon.minfei@gmail.com>
>>>
>>>     This driver combine tiny/ili9341.c mipi_dbi_interface driver
>>>     with mipi_dpi_interface driver, can support ili9341 with serial
>>>     mode or parallel rgb interface mode by register configuration.
>>
>> Noralf told once that this driver should be unified with mi0283qt.c.
>>
>> So, what should we do here?
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
> 
> from sam's suggestion, we can't setup two drivers to support one panel
> in the tree. so, i copy the mipi dbi part from tiny/ili9341.c. to this driver
> from register settings and dts binding is keep the same to tiny/ili9341.c.
> 
> so, in my opinion if tiny/ili9341.c is unified with mi0283qt.c, this
> driver should be
> too.
> 

There's a discussion about MIPI DBI panels here:

MIPI DSI, DBI, and tinydrm drivers
https://lists.freedesktop.org/archives/dri-devel/2020-May/267031.html

Noralf.

> thanks.
> 
> best regards,
> 
> Dillon,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
