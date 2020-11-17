Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275012B6C6A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 19:00:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6011689C54;
	Tue, 17 Nov 2020 18:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C2889C54
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 18:00:45 +0000 (UTC)
IronPort-SDR: Fhhx8tBFf0Ac7zbXFwHBn4j6d88G13Al/cJXV8iymB0t8rtb5E1F2vSOHWgmLBhk2OeyMsktOM
 y+74Poh+OB2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="189036375"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="189036375"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 10:00:43 -0800
IronPort-SDR: B8bcZFL873mO5FRWvxRTsIGGke6aZyIbmFQJTv4wpk0B2JexGxN8q0Hb9ZkARnhv02/XUddHzm
 dVWg/53D2Diw==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="476009881"
Received: from rjwysock-mobl1.ger.corp.intel.com (HELO [10.249.148.85])
 ([10.249.148.85])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 10:00:38 -0800
Subject: Re: [PATCH v4] Add power/gpu_frequency tracepoint.
To: Steven Rostedt <rostedt@goodmis.org>, Peiyong Lin <lpy@google.com>
References: <20200820162738.33053904@oasis.local.home>
 <20201022173434.910879-1-lpy@google.com>
 <CA+0soAkD7BG6CjhMW6PYR4yAgDykU2uUizcHx1QQdXqgesCFFg@mail.gmail.com>
 <20201116160508.3e86496f@gandalf.local.home>
From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Organization: Intel Technology Poland Sp. z o. o., KRS 101882, ul. Slowackiego
 173, 80-298 Gdansk
Message-ID: <173158b7-e65e-257f-0e24-aa9d5401d1d1@intel.com>
Date: Tue, 17 Nov 2020 19:00:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201116160508.3e86496f@gandalf.local.home>
Content-Language: en-US
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sidath Senanayake <sidaths@google.com>, linux-kernel@vger.kernel.org,
 Amit Kucheria <amit.kucheria@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Prahlad Kilambi <prahladk@google.com>, Ingo Molnar <mingo@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 Paul Walmsley <paul.walmsley@sifive.com>, zzyiwei@android.com,
 android-kernel@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/2020 10:05 PM, Steven Rostedt wrote:
> On Mon, 16 Nov 2020 12:55:29 -0800
> Peiyong Lin <lpy@google.com> wrote:
>
>> Hi there,
>>
>> May I ask whether the merge window has passed? If so is it possible to
>> ask for a review?
> This is up to the maintainers of power management to accept this.
>
> Rafael?

I'd say up to the GPU people rather (dri-devel CCed) since that's where 
it is going to be used.

Also it would be good to see at least one in-the-tree user of this (or a 
usage example at least).

Cheers!


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
