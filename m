Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304246070E9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5B110E5CD;
	Fri, 21 Oct 2022 07:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3FD10E1FD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 16:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666282423; x=1697818423;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Obl3XRsotPNVfSb3YBRLJ82NaOc1BT0Rdom2xZ2f5D8=;
 b=jfxsI9QE1E6lP8CHHKoFBQpQj8PAGtbp6Na+ClpJKdqsfYKAzSUdHNZ7
 Xq0c9oPlobyJxK/ifx/FYUjU0Ugpp8boD7c8C7Pm51HZpYvecn5zhWk0k
 Z8hx+HQgOEMprFq6xGHp0nYW7+Vf57OET9HlDKo0a5WS9LESeZ6Gw0Ybf
 +iwK6HC1HCDRVEnWi6InXuCnZawhRdrRmXLntNqicGpfxDVpAng6HRHd9
 03Z23LFTm5QI2+U/nFVs6Xb8L3POvGoZtydxTA77oBRQ1QFqhcEzzuV1e
 yFX2Z5lxIHLEP33BXHxxR95OjTj/+KfdcG7jGg7ZBrxZHgl5usQMQxL6o g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="287159560"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="287159560"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:12:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="734938986"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="734938986"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.28.120])
 ([10.213.28.120])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:11:53 -0700
Message-ID: <f3e777c5-c61c-4820-83dd-9bc33932e9c8@linux.intel.com>
Date: Thu, 20 Oct 2022 18:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 01/10] gna: add PCI driver module
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
 <20221020133525.1810728-2-maciej.kwapulinski@intel.com>
 <Y1FcCDhWiQG2p3wW@kroah.com>
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
In-Reply-To: <Y1FcCDhWiQG2p3wW@kroah.com>
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


On 10/20/2022 4:32 PM, Greg Kroah-Hartman wrote:
> On Thu, Oct 20, 2022 at 03:35:16PM +0200, Kwapulinski, Maciej wrote:
>> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
>> This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.
> This ensures that we can not do anything with these patches.
>
> Now deleted.
>
> greg k-h


indeed,

sorry about that. When I'm done with smtp server footer I'll send 'PATCH v5' unless you have other suggestion for best practice in this case.

