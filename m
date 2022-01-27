Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E48A49EBF3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97A110E502;
	Thu, 27 Jan 2022 20:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1B710E2BF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c0zwNtR9SaqZUtE2VSeLImNsuYYf9Ru2jvQ3WRs6pZ4=; b=JK8DCtH5DW4pWaHH84cN6Qhv8u
 b8d2aAHP6G48V+J+Il8N5V/M6dMABM44YycU+U5i7punR6sxXU2yEJIAIkK319aO+ved6CdmlBwq9
 2TBb/JDckGZjGcqLNXbm7ltuhT87ypCp6CJGrTMFOhBA7QEfU1xqhElwUWuZYnA+/Vo/yMeCu+S4N
 OtalCqFCgwFUetLdQfUPIBYf23FvsyfdTGfIsLAeUeUN117ZuoVBx3hOYWp1602T68wJGsyw6drul
 PEXf50P8Y5hMkmgGvpF7CA8pX0Boac7W8Su1B3ISXnuxWPzNu1Y1zYr38Hl4CUy0a2JfLqZVbzHsP
 YmWFOETQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62402
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nDAyZ-0007Fw-8k; Thu, 27 Jan 2022 21:02:35 +0100
Message-ID: <82008ca7-9c67-d618-2110-6a8de8fa1d7f@tronnes.org>
Date: Thu, 27 Jan 2022 21:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/3] drm/panel: Add MIPI DBI compatible SPI driver
To: David Lechner <david@lechnology.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com
References: <20220125175700.37408-1-noralf@tronnes.org>
 <a975e0b1-7036-4936-a0ca-548d4456bd1b@lechnology.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <a975e0b1-7036-4936-a0ca-548d4456bd1b@lechnology.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, maxime@cerno.tech,
 dri-devel@lists.freedesktop.org, dave.stevenson@raspberrypi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 27.01.2022 18.13, skrev David Lechner:
> On 1/25/22 11:56 AM, Noralf Trønnes wrote:
>> Hi,
>>
>> This patchset adds a driver that will work with most MIPI DBI compatible
>> SPI panels out there.
>>
>> It's a follow up on 'drm/tiny/st7735r: Match up with staging/fbtft
>> driver'[1] which aimed at making the st7735r driver work with all panels
>> adding DT properties.
>>
>> Maxime gave[2] a good overview of the situation with these displays and
>> proposed to make a driver that works with all MIPI DBI compatible
>> controllers and use a firmware file to provide the controller setup for
>> a particular panel.
>>
>> Main change since previous version:
>> - Drop model property and use the compatible property instead (Rob)
>>
>> Noralf.
>>
>> [1]
>> https://lore.kernel.org/dri-devel/20211124150757.17929-1-noralf@tronnes.org/
>>
>> [2]
>> https://lore.kernel.org/dri-devel/20211129093946.xhp22mvdut3m67sc@houat/
>>
>>
>> Noralf Trønnes (3):
>>    dt-bindings: display: add bindings for MIPI DBI compatible SPI panels
>>    drm/mipi-dbi: Add driver_private member to struct mipi_dbi_dev
>>    drm/panel: Add MIPI DBI compatible SPI driver
>>
>>   .../display/panel/panel-mipi-dbi-spi.yaml     |  59 +++
>>   MAINTAINERS                                   |   8 +
>>   drivers/gpu/drm/panel/Kconfig                 |  11 +
>>   drivers/gpu/drm/panel/Makefile                |   1 +
>>   drivers/gpu/drm/panel/panel-mipi-dbi.c        | 394 ++++++++++++++++++
>>   include/drm/drm_mipi_dbi.h                    |   2 +
>>   6 files changed, 475 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>>   create mode 100644 drivers/gpu/drm/panel/panel-mipi-dbi.c
>>
> 
> It would be useful to also include a patch for a tool to create
> these "firmware" files. For example a Python script that takes
> a more human-readable input and generates a .bin file.

I will put a script on the github repo that holds the wiki for the
driver. I haven't made the script yet, just using a hack for now until
the format is decided upon.

Noralf.
