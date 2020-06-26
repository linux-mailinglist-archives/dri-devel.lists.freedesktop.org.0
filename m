Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7C220B042
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 13:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F74E6EC6D;
	Fri, 26 Jun 2020 11:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A036EC6E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 11:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UbnmgTxnrp9HkfN2lA8AbZqOmo7SIZckOMmfmke2A2I=; b=LQExg55vWvSSI/lsBIVWxiQ4ab
 ezCgBG8UIt402WsbpMeNr45cTIQL1ypCIyIZZm7Y9/YBXXaXJ0g8gYxJhWZvtKXuD9PDBH/Ugf5GB
 A6riHb8HNEPF+MwXhx0u38ljXfLYIew5EPpjCglC2JbD6aoXJ/cfc7jORlEtRnefF3/cSVuUf8SOG
 iiUGJoeI4xNROv3Kxc1vcM4bKQhN1/VZwdDbPooA7hL6dhn2oLfIH+DsvrlknShb2u0E4364Ww8cd
 XyEu0U7AXGK3CZ9ipn5bHfGnlA0Sr8OPeata4jB4KJVPdqpTkGC4MBfCrCyD4p15Ljoik3F/ABez9
 PloUbvKA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1jomIO-00086O-4e; Fri, 26 Jun 2020 14:13:24 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Karol Herbst <kherbst@redhat.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <cb935527-2eb9-23f3-a823-d6b849fc3c94@kapsi.fi>
Date: Fri, 26 Jun 2020 14:13:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: David Airlie <airlied@linux.ie>, gustavo@padovan.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/26/20 2:06 PM, Karol Herbst wrote:
> On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>>
>> # Host1x/TegraDRM UAPI proposal
>>
>> This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
>> the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
>> many ways.
>>
>> I haven't written any implementation yet -- I'll do that once there is
>> some agreement on the high-level design.
>>
>> Current open items:
>>
>> * The syncpoint UAPI allows userspace to create sync_file FDs with
>> arbitrary syncpoint fences. dma_fence code currently seems to assume all
>> fences will be signaled, which would not necessarily be the case with
>> this interface.
>> * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
>> Not sure if they are still needed.
>>
> 
> Hi, as this wasn't addressed here (and sorry if I missed it): is there
> an open source userspace making use of this UAPI? Because this is
> something which needs to be seen before it can be included at all.
> 

Hi Karol,

not currently, but once we have hashed out the design a little bit (and 
I'm back from vacation), I'll work on open source userspace and 
converting existing code using the staging UAPI to this one.

Mikko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
