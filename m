Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1D06070F3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292AA10E5E5;
	Fri, 21 Oct 2022 07:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356D610E151
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 17:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666288764; x=1697824764;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RI4V85sZifCZcDR0JmjeNLGR0AB66tKV7JAJj1roIKU=;
 b=IWzvREwZBZcTG2o9bfawpLmAAF2wfXnfih2lmSjLG/LzDcDFYY2KYcR0
 2ch1gFRgXaOfHjwh0WsNG9BU/FHFzoB14U9BTSSq1XQB+7+yrHcKDB6uJ
 JJSK13ehU8fTVwngBiXVxDi9N4EhbMbD6J859w9ovEjQwwI1ZKopI4QdF
 i/t9fosLheYe53pf2YE0LDiKaZJE61uBBQDS1LUKHwNeuDxdjtOrAcGd+
 nKK7ycXj3x4gMvxsJfQkqShYP2VzOiytpB317vOFTDIDv0PdOYRc8i9ko
 QNaXs4r39KPMfxSXIULvhWYo5z91i8x8Cgl946XqMv5pcuAwUTOuF4D1B w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="368839961"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="368839961"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:59:17 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="719210278"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="719210278"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.28.120])
 ([10.213.28.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:59:11 -0700
Message-ID: <36fdd4c2-6922-146d-da8b-37161b467acb@linux.intel.com>
Date: Thu, 20 Oct 2022 19:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 01/10] gna: add PCI driver module
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>,
 "Kwapulinski, Maciej" <maciej.kwapulinski@intel.com>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
 <20221020133525.1810728-2-maciej.kwapulinski@intel.com>
 <Y1FWtqtX7QSafbGt@casper.infradead.org>
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
In-Reply-To: <Y1FWtqtX7QSafbGt@casper.infradead.org>
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
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/20/2022 4:09 PM, Matthew Wilcox wrote:
> On Thu, Oct 20, 2022 at 03:35:16PM +0200, Kwapulinski, Maciej wrote:
>> +++ b/drivers/gpu/drm/gna/Kconfig
>> @@ -0,0 +1,12 @@
>> +#
>> +# Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)
>> +#
>> +
>> +config DRM_GNA
>> +	tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
>> +	depends on X86 && PCI
>> +  help
> This is mangled; 'help' should be indented by a tab, not two spaces.


Matthew,

thank you for comment. has just been fixed in v5

