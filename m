Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6FD608561
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 09:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776FD10E360;
	Sat, 22 Oct 2022 07:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D15410E2E1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666353589; x=1697889589;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=/S5sbckmBratQj0/GUalMmZBADiH48Uig1Bx5YjGDE0=;
 b=gRvUByg2KnIfHEF9OUUyx2pDiZVt25DVqk8ZeAwGJ3mOvxVU511rxrRv
 pFsExdr4JXWsqPtT+u/vqYnoymXsr84F9QmywLMq0axRt0MGmNUZ+8kWO
 bxMZDn1qjKtUi9IBaDMqbRYKBU1/HCLZ5MKFwTAzaRAGaQ8kwjgcGt0uZ
 Jagp4za1g1sS3oYA9ONMI4mFzdyDet8UoNio3f08LFqKYDJmQwaavtWJz
 hhISU+4sqMymVjIbBVQm5WRslAi5cN1vHBD1NWxTrbUZV58h8/5LVqd6g
 MdS37v4dAI/sb8MOBu0mrMd4Ix+ck+O1wVNlxxnOP73OFwMmSgc8nA9vr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="308084302"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="308084302"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 04:57:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="773010716"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="773010716"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.29.238])
 ([10.213.29.238])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 04:57:23 -0700
Message-ID: <babed2a4-5d8d-1c2b-d8f3-7db123bf134b@linux.intel.com>
Date: Fri, 21 Oct 2022 13:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 07/10] gna: add GNA_COMPUTE ioctl
Content-Language: en-US
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-8-maciej.kwapulinski@linux.intel.com>
 <CACRpkdYDYUEx-hWNrUB5cXbH_2oXzRYc2pwn=4u5mivGn14eVw@mail.gmail.com>
 <f72f1d2d-b0cc-6130-05d6-4ec5f5c9d914@linux.intel.com>
In-Reply-To: <f72f1d2d-b0cc-6130-05d6-4ec5f5c9d914@linux.intel.com>
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


On 10/21/2022 1:52 PM, Maciej Kwapulinski wrote:
> On 10/21/2022 11:30 AM, Linus Walleij wrote:
>> Hi Maciej,
> Hi Walleij

oo sorry,  hi Linus

I should say


