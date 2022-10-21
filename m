Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D012E608565
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 09:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392E810E37F;
	Sat, 22 Oct 2022 07:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3702310E044
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666353446; x=1697889446;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hs0GVoVBHHzGSrFvFA45eSrPK15Ebn9oBq+vLB4jqQE=;
 b=GXGIsUfTtKQXqlePkieuK9Ee1bNsr8a9gYSAzSSTmFeR/6KMVLKmEgz+
 Ge9zjwzgo5lzyHrNyhzz4W0FTCbkyWqA7ljecWnP+uAvckODyJe9kZ/Mw
 Q+TlJ9oqNq6xvGwzugsz4B5LK1dl5UfrOXUHKT5713oD2ohM4iiX7OE/v
 kkb9wO5jCuPpcwBrrXbotCAPCILoSK3P8EUz99Zu3jXLogITucalW7oJY
 xZH6slt9EiyIR07ooxvpWjRPDpcCes0ttCeDpKtugTLp980IqSUTAd2oU
 23UnJhjhdfCgnGjvmLGsr2aAYXjSIVZLmq0h74q+3C96jbyCiflmC1lWJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="308082633"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="308082633"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 04:52:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="755769717"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="755769717"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.29.238])
 ([10.213.29.238])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 04:52:44 -0700
Message-ID: <f72f1d2d-b0cc-6130-05d6-4ec5f5c9d914@linux.intel.com>
Date: Fri, 21 Oct 2022 13:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 07/10] gna: add GNA_COMPUTE ioctl
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-8-maciej.kwapulinski@linux.intel.com>
 <CACRpkdYDYUEx-hWNrUB5cXbH_2oXzRYc2pwn=4u5mivGn14eVw@mail.gmail.com>
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
In-Reply-To: <CACRpkdYDYUEx-hWNrUB5cXbH_2oXzRYc2pwn=4u5mivGn14eVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Oct 2022 07:16:55 +0000
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
Cc: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/21/2022 11:30 AM, Linus Walleij wrote:
> Hi Maciej,
Hi Walleij
>
> thanks for your patch!
>
> On Thu, Oct 20, 2022 at 7:57 PM Maciej Kwapulinski
> <maciej.kwapulinski@linux.intel.com> wrote:
>
>> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
>>
>> This is the ioctl context part of score request + "do nothing" work queue
>> implementation. Work queue context actual part will be added by next patch.
>>
>> signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
>> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
>> Co-developed-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
>> Signed-off-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
>> Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
>> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
>> Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
>> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> This patch start to introduce the actual work processing IIUC.
>
> So there is some funny lingo used here that should be in the commit
> message:
>
> - Patches
> - Processes
> - Scores

patching operation here is in fact the operation of modifying the set of memory cells described by offsets (provided in score request during ioctl) with some values (also provided in the same score request during ioctl). memory cells pointed by offsets belong to memory regions (also being the part of the same score request).

Score requests are put by ioctl to gna_device::request_list FIFO queue and are later processed by gna_device::request_wq work thread one by one. request_wq is the entity that sends requests to GNA device, and just before doing so it 'PATCHES' the memory in a manner described by score request.  request_wq has exclusive access to GNA device.

'Score' is term taken from AI, but from the perspective above, where driver does not (have to) know what is passed to GNA device, maybe we should not use the term 'score' at all. Also, maybe 'patch' should also be renamed on something more agnostic/generic.

