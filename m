Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0BE6070E6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6579E10E2D6;
	Fri, 21 Oct 2022 07:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893C010E1B5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666289428; x=1697825428;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ll9VpcmSRSS3DIgxTB+BtrbvfZxh0/dVfygp8On4h6g=;
 b=jPVT0Oxvm8+FLT3O2E4I4wDQPw3nXT94nhemz1NBFkRrTDVzXz3KAHlq
 qVM9XtBmTbxsWCBlJA4q1oRO+BOxny3pTKmy6F/cbzaYQlU1CHjKKE9Pk
 5vmSU5BXJ2l7J2TCf5nPH4u7qfvJXtFc3Z/Udd4G4wguBFOTcJQE3/7dU
 5usZ3EQUSjy2z6ezj8j1gWKEKQBERDsYjS6Rn39lgFqj+4cUsn2m9Ll05
 wLZaYlsfGuM9F9S7z5dPoaOAToAtexRK2kEBMDsS3iQR3a1Lq8JiYS8dZ
 Q+UQL78cfgYbqWpBy6qn8191H43tMB3PK1553rP9PYSX4KXjNCFW18l8V Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305533151"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="305533151"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 11:10:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="629982135"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="629982135"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.28.120])
 ([10.213.28.120])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 11:10:21 -0700
Message-ID: <788ba9fe-534e-8fc9-aa40-c7a1217d0fb1@linux.intel.com>
Date: Thu, 20 Oct 2022 20:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 01/10] gna: add PCI driver module
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
 <20221020133525.1810728-2-maciej.kwapulinski@intel.com>
 <Y1FcCDhWiQG2p3wW@kroah.com>
 <f3e777c5-c61c-4820-83dd-9bc33932e9c8@linux.intel.com>
 <Y1GMwP1OUlhwAp03@kroah.com>
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
In-Reply-To: <Y1GMwP1OUlhwAp03@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 21 Oct 2022 07:22:31 +0000
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Dragan Cvetic <dragan.cvetic@xilinx.com>,
 linux-doc@vger.kernel.org, Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 maciej.kwapulinski@linux.intel.com,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/20/2022 8:00 PM, Greg Kroah-Hartman wrote:
> On Thu, Oct 20, 2022 at 06:11:49PM +0200, Maciej Kwapulinski wrote:
>> On 10/20/2022 4:32 PM, Greg Kroah-Hartman wrote:
>>> On Thu, Oct 20, 2022 at 03:35:16PM +0200, Kwapulinski, Maciej wrote:
>>>> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
>>>> This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.
>>> This ensures that we can not do anything with these patches.
>>>
>>> Now deleted.
>>>
>>> greg k-h
>>
>> indeed,
>>
>> sorry about that. When I'm done with smtp server footer I'll send 'PATCH v5' unless you have other suggestion for best practice in this case.
> I am not even allowed to look at any of this at the moment with that
> footer.  Actually I wasn't even supposed to tell you this, I should have
> been forced to just delete it and move on to contributions that don't
> have legal entraptments in them :(
>
> greg k-h

I understand your point.

I also appreciate that you decided to tell it to me. I didn't receive these footers, so without your note it would be quite difficult to me to 'debug' it.

thank you

