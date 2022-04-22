Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97F50B4ED
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 12:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380CE10E040;
	Fri, 22 Apr 2022 10:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E4810E039
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 10:23:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 80CB88186D;
 Fri, 22 Apr 2022 12:23:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650623011;
 bh=PjfleyKFgNt80rxnsoJ/g6cPfm1pwLqUhJc0ieg/wK8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oKpsa7cvM6EYnbDFXQqkMHrgAAZeH7ZUlTah4uS1g21iD++XSomdQ9u+H/sS9BBBa
 MbhEMVRRz0F4DzdPRqi4WFqYKgJ61Ab+WyhpbYMc5vSHHucoHhbA1+6i2QxG3b4jeS
 N4S8K0Irw0DnmivKVQ+YYYjjHXaycaOaRtmvd5u75Ht5YI1NPhlcMUb04meEfMBHui
 bj3hn3QmmbFt1fXjJsRYV0cxeB+grkkGWhbGaOIp86JerHQW7j/BnQZPv1gZ2E8xxh
 tCrXgcaQ1joNxwrujElYKYifSBahKnvjg53Y2fhDAyGxXBkIaRbGIz4Z6Dzg4oYWYD
 3wOK9XiHwn1bg==
Message-ID: <3ca83315-1163-a690-c79b-bbab9f85a395@denx.de>
Date: Fri, 22 Apr 2022 12:23:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: FG040346DSSWBG04 patch review
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
References: <718e8029-b6a8-f221-156c-ac8ac84a8d77@denx.de>
 <9dca836a-bd84-d200-fc01-56e4d6f13eb9@suse.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <9dca836a-bd84-d200-fc01-56e4d6f13eb9@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/22/22 10:37, Thomas Zimmermann wrote:
> Hi
> 
> Am 21.04.22 um 23:59 schrieb Marek Vasut:
>> Hello all,
>>
>> could either of you please have a look at these two panel patches ?
>> It is yet another DPI panel, but I would like to get some AB/RB on it 
>> before applying.
>>
>> https://patchwork.freedesktop.org/patch/482306/
>> https://patchwork.freedesktop.org/patch/482307/
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thank you. Just for completeness, I sent V2 with your AB.
