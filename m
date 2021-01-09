Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2A2EFF46
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4BE6E954;
	Sat,  9 Jan 2021 11:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1956E8D2
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jan 2021 00:00:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610150457; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+ZNrmFyuKwVLa+pRQs07uHq0NtINzoqRqE8VTiClUHc=;
 b=pJbBgxfm1Zs0ciyxw2YBOKoD3El7Y/vWGygbe5Mh5vK2PtldgQQ5MFdoEQC+tMZVNeydYmeG
 oZpxk6B/2+67Of/UVQoM/OBv+WUOtJG6m2MkF8IwPYwEbc8l4r1JPBr+7Upkrd+X9JlEnvQJ
 iph0J5pxMcHefUoK9BDnfHGvh+E=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5ff8f237f1be2d22c4d6227f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 09 Jan 2021 00:00:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2CAAFC43461; Sat,  9 Jan 2021 00:00:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: veeras)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7936BC433C6;
 Sat,  9 Jan 2021 00:00:54 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 08 Jan 2021 16:00:54 -0800
From: veeras@codeaurora.org
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH RESEND v2 1/2] dma-fence: allow signaling drivers to set
 fence timestamp
In-Reply-To: <CALAqxLVyCuQmEKYh+TBo7k5igP8piz8mAsFt4cChF9q=qmh8XQ@mail.gmail.com>
References: <1609962554-13872-1-git-send-email-veeras@codeaurora.org>
 <CALAqxLVyCuQmEKYh+TBo7k5igP8piz8mAsFt4cChF9q=qmh8XQ@mail.gmail.com>
Message-ID: <5a4f9d51cd07e8a533446e1f093ab4a7@codeaurora.org>
X-Sender: veeras@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, pdhaval@codeaurora.org,
 abhinavk@codeaurora.org, Sean Paul <sean@poorly.run>,
 linux-media <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-01-08 11:55, John Stultz wrote:
> On Thu, Jan 7, 2021 at 12:53 AM Veera Sundaram Sankaran
> <veeras@codeaurora.org> wrote:
>> 
>> Some drivers have hardware capability to get the precise timestamp of
>> certain events based on which the fences are triggered. This allows it 
>> to
>> set accurate timestamp factoring out any software and IRQ latencies. 
>> Add
>> a timestamp variant of fence signal function, 
>> dma_fence_signal_timestamp
>> to allow drivers to update the precise timestamp for fences.
>> 
> 
> So, on quick review, this seems mostly sane. Though, it might be good
> to add some more detail about how the hardware timestamping fits into
> the kernel's CLOCK_MONOTONIC time domain.
> 
> I just want to make sure this interface isn't abused to jam raw
> hardware-domain timestamps into the fence->timestamp, causing the
> meaning or time-domain of the fence->timestamp to be unclear or
> inconsistent.
> 
> It may be useful to add an additional patch to the documentation
> around the dma_fence structure to make the timestamp field semantics
> more explicit and avoid confusion?

Thanks for the comments. Sure, let me add more information in the
commit-text about the HW timestamp conversion to kernel time-domain.
Will explicitly mention the timestamp domain expected as part of the
new dma_fence_signal_timestamp api documentation, since that would
be the only place the timestamp would be set externally from drivers.
On top of it, do suggest if still documentation on dma_fence struct
would be required.

Thanks,
Veera

> 
> thanks
> -john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
