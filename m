Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D93727DD620
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 19:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B693810E5AF;
	Tue, 31 Oct 2023 18:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610D010E5AF
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 18:36:39 +0000 (UTC)
Received: from [192.168.68.129] (unknown [177.98.22.188])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 40A916607389;
 Tue, 31 Oct 2023 18:36:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698777398;
 bh=bUwJOj01a4F8gGzxLfRaZfqDlFCfc4iAzypRSVm5Q3U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JFCB+FclQIACx9J7Wc5X+zW/xibfhO0kxYSoAyRYSEYnCd31gWhBma3xI0IWg4xOj
 0jqWXPyJtT/OhWC1nzSeNEVyQkYnM0BUoijbTTWqo5zadMq1IBmDidMYcFy/tYAXwD
 axmnMFCmt8lT0QleQb3rvN/eTO53Uk/iUq5b1rFwjdO0ltmSDCct8OFAozw4EZYaqc
 TgbpAX/noA10DNs4PlBoU/0OOk8RynLvlVHagr0xWFI1MvnjV32pTxfORFTYlgxbQL
 46nSxH6pmDaPomFTXZhFZMq8I0sLn7/h3GiPI1Vt1u/UgQI2uN8A/4KofX0xoDs+l3
 nijDPrOK42HLw==
Message-ID: <318c568f-c813-4d16-b577-28f37cde92c7@collabora.com>
Date: Tue, 31 Oct 2023 15:36:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH Resend] Fix line Length
To: Bagas Sanjaya <bagasdotme@gmail.com>, Julia Lawall <julia.lawall@inria.fr>
References: <20231029144312.5895-1-dorine.a.tipo@gmail.com>
 <alpine.DEB.2.22.394.2310291610030.3136@hadrien> <ZT7v39jG4WTxPYjm@debian.me>
 <alpine.DEB.2.22.394.2310300712310.3533@hadrien>
 <3f1fdfa2-e30b-42c6-b290-bb02283b3589@gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <3f1fdfa2-e30b-42c6-b290-bb02283b3589@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Daniel Stone <daniels@collabora.com>,
 Linux Outreachy <outreachy@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Nick Terrell <terrelln@fb.com>, Dorine Tipo <dorine.a.tipo@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30/10/2023 08:36, Bagas Sanjaya wrote:
> On 30/10/2023 13:12, Julia Lawall wrote:
>>
>>
>> On Mon, 30 Oct 2023, Bagas Sanjaya wrote:
>>
>>> Hi Julia,
>>>
>>> The submitter touched one of CI scripts for the DRM subsystem. To test
>>> this patch, there must be a way to run these scripts locally (which
>>> may requires non-trivial setup).

Instructions to test it is on the docs:

https://docs.kernel.org/gpu/automated_testing.html?highlight=drm+ci#how-to-enable-automated-testing-on-your-tree

>>>
>>> Cc'ed DRM maintainers.
>>
>> There is a DRM outreachy project.  I think that motivated this patch.

Yes :)

>>
> 
> OK, thanks!
> 


Thanks
Helen
