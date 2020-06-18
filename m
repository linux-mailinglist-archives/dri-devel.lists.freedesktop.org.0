Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C21FEEA0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 11:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974DF6EB2D;
	Thu, 18 Jun 2020 09:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EDE1D6E1E2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 09:28:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C7EC1045;
 Thu, 18 Jun 2020 02:28:33 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 483DF3F6CF;
 Thu, 18 Jun 2020 02:28:32 -0700 (PDT)
Subject: Re: [PATCH v3] drm/panfrost: Reduce the amount of logs on deferred
 probe
To: Rob Herring <robh@kernel.org>
References: <20200527200544.7849-1-krzk@kernel.org>
 <20200527204334.GA15485@kevin> <20200617141547.GA30516@kozik-lap>
 <b41bfead-7b73-be78-c63f-79a0a7e23b2a@arm.com>
 <CAL_JsqLrFFOVQVR0dWbru6bJvz7sXs8v6Op-hiNgdMwH3N=2Fw@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <cd609ad6-9672-9fdd-e693-f15395cb6fd0@arm.com>
Date: Thu, 18 Jun 2020 10:28:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLrFFOVQVR0dWbru6bJvz7sXs8v6Op-hiNgdMwH3N=2Fw@mail.gmail.com>
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/06/2020 20:57, Rob Herring wrote:
> On Wed, Jun 17, 2020 at 8:36 AM Steven Price <steven.price@arm.com> wrote:
>>
>> On 17/06/2020 15:15, Krzysztof Kozlowski wrote:
>>> On Wed, May 27, 2020 at 04:43:34PM -0400, Alyssa Rosenzweig wrote:
>>>> Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>>>
>>>> On Wed, May 27, 2020 at 10:05:44PM +0200, Krzysztof Kozlowski wrote:
>>>>> There is no point to print deferred probe (and its failures to get
>>>>> resources) as an error.  Also there is no need to print regulator errors
>>>>> twice.
>>>>>
>>>>> In case of multiple probe tries this would pollute the dmesg.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>>> Reviewed-by: Steven Price <steven.price@arm.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Changes since v2:
>>>>> 1. Rebase
>>>>> 2. Add Steven's review
>>>>>
>>>>> Changes since v1:
>>>>> 1. Remove second error message from calling panfrost_regulator_init()
>>>>> ---
>>>>>    drivers/gpu/drm/panfrost/panfrost_device.c | 8 ++++----
>>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>
>>> Hi Rob, Tomeu and Steven,
>>>
>>> You're listed as maintainers for panfrost. Is anyone going to pick this
>>> up?
>>
>> I'm only a reviewer so I've been leaving it for Rob or Tomeu, but I can
>> pick it up if Rob/Tomeu are happy for me to do that.
>>
>>> Maybe I sent it to wrong mailing list or forgot about anything?
>>
>> No, there's actually a few Panfrost commits waiting, it was on my todo
>> list to ask if Rob/Tomeu needed some help with merging patches.
> 
> Please do, I haven't had the cycles for panfrost lately.
> 
> Rob
> 

Ok, this patch is pushed to drm-misc-next. I'll dig through my emails 
for the other patches which are pending and take a look at them too.

Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
