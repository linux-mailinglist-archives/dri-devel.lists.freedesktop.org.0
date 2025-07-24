Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ABFB1049A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9A688A27;
	Thu, 24 Jul 2025 08:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEB2+Nds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBED88A27
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753347015; x=1784883015;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=N1heBisScPzwwpeBakWl3fC2NJleG26Iq9i2cBbg2mE=;
 b=TEB2+NdsBQwMaYnkCA2YFE3NqSuUq/vRs8fi6AKpzKuE/7nT5myfFPPN
 A9dwGiFJ3aaaYF5ZIPJsq450R0BmpKr71mbHcfTGGh/nP5zPpU+KWbOTU
 ltoMUpLpZed6Sz4g1ZSLsjtYuPaYyEQELjg6mdZSS2TPq9xryNEpuijO6
 kPqu+g1o7IdqVteCv9vWDMWPOPfUjvs/DdRwOB5SAuUzVNcX4W2W8JpG2
 PpaMAshgOaRrm3iAm93c3fJBslow4qIEE36nqgIxILVSHxsgK5t6QrGVm
 Ua/ykVUMvamXD5BTReyNtL/u1LW7fyvqTzpc1uC2HqZpONbuErKRyUvg+ g==;
X-CSE-ConnectionGUID: 1rFskJoVRnqtKb9V+SuaAQ==
X-CSE-MsgGUID: njpGlxxYRlWVv5ukoewnIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67082566"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="67082566"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 01:50:14 -0700
X-CSE-ConnectionGUID: 5bqA0Lq6TZqsSOOc/k9Otg==
X-CSE-MsgGUID: v7LXT/36SAmy91vsLc5Z8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="191012243"
Received: from geumanao-mobl3.amr.corp.intel.com (HELO [10.245.86.244])
 ([10.245.86.244])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 01:50:12 -0700
Message-ID: <73d6e78c-a360-40d7-9123-e00d47ee2a7a@linux.intel.com>
Date: Thu, 24 Jul 2025 10:50:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm fixes for 6.16-rc8/final (resend in txt for sure)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAPM=9twUCJj4X-2jf0VG5+A2YN9Gk8hjOAhJ2hxq4SdgZfvtMA@mail.gmail.com>
 <CAHk-=wgLQ+EPeV+JzrvkPWt2jeteqwsRkf-X61jjfV8pefgXeg@mail.gmail.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAHk-=wgLQ+EPeV+JzrvkPWt2jeteqwsRkf-X61jjfV8pefgXeg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/24/2025 3:59 AM, Linus Torvalds wrote:
> On Wed, 23 Jul 2025 at 17:40, Dave Airlie <airlied@gmail.com> wrote:
>>
>> (this time for sure, plain text).
> 
> I knew you could do it! Third time's the charm!
> 
> I hope I don't need to worry about the branch contents as much as I
> apparently need to worry about your email sending capabilities?
> 
>             Linus

Linux is one of the greatest software projects of all time and that's because of the people who build it.

Linus, please don't set this example. Such behavior propagates down and makes the community miserable.

Regards,
Jacek
