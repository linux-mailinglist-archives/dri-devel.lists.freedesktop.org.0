Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B3260A98F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 15:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B17710E6C2;
	Mon, 24 Oct 2022 13:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5830610E6AE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 13:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666617744; x=1698153744;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bNuW7y/nj78n2mi90mRlpoh+xVlYoAISeFpKjMT825o=;
 b=hUeGKQoBlyPakptTEqi8SwvZ/uJhmxoyP+BujP9vtwK0SyGag8cm0Udv
 pezl+63pPzZkkRW3vMAQXmkK4U5G6yLMos5e05KxLKds8UtGDUeiT0D8z
 hv97V/LrsP2j6clIgG6rTq1MArIi/+55qF/E8X1OXL3cbqmgoBGd/KCDT
 2vsYajg4xHJ2CNGKHyde+Ql4BaLd5oGOcyzp5WPs7iOVlkrqXEKa8ZLs1
 jCb/lIwklYc8v5Zm1DFeBJrTSO8k7SGpc3sHE/+CAkgeVEgYV9Hf1ti99
 r72AeXR2NJWUejFMY/nU9T+RsLKMRaBiD08sF5AaSN/kQDc8lz+KdLA+I A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="294812346"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="294812346"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 06:22:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="736407795"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="736407795"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.4.149])
 ([10.213.4.149])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 06:22:19 -0700
Message-ID: <abd57af0-644f-15f9-6650-648e7449f4dd@linux.intel.com>
Date: Mon, 24 Oct 2022 15:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <Y1IdWVSgWhHZJ78X@kroah.com>
Content-Language: en-US
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
In-Reply-To: <Y1IdWVSgWhHZJ78X@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/21/2022 6:17 AM, Greg Kroah-Hartman wrote:
> On Thu, Oct 20, 2022 at 07:53:24PM +0200, Maciej Kwapulinski wrote:
>> Dear kernel maintainers,
> <snip>
>
> This really is v6, not v5, right?  Why send 2 v5 out?
>
> greg k-h


what do you mean?

