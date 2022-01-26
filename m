Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A69149C8D2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066B710E896;
	Wed, 26 Jan 2022 11:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0260010E83B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643197159;
 bh=OOmy45qoyH77IVhcbZBfMcAcg7U3vJzQ15XvVXqvbIg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=GLekZj2iDruItB18Ip8EszZw97r71SfgZzJYI6nMnS7ycZg3k0inOBa4gLSnM5/Zb
 UPP2IHestadfDarsp2EjOsKkIx687LnuIZ5YnUX4CDB0E0q4+gKF0U7dU1IFamDKDp
 s8EgN/CexKKapiwAJzvBDCRdn9pXcso74dXCO9RM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.143.57]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sDq-1n8olR1gd0-00545E; Wed, 26
 Jan 2022 12:39:19 +0100
Message-ID: <88ea01b8-3fdd-72cc-c3d8-e2890c68533b@gmx.de>
Date: Wed, 26 Jan 2022 12:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <CAKMK7uEqwyZuVheqyNG33Un4WK1cd1B+WBYbCmi20fZi0qVG2w@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAKMK7uEqwyZuVheqyNG33Un4WK1cd1B+WBYbCmi20fZi0qVG2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EEL1soWvWOWlYa2Tiza9VBrmMhfpRqTer6bKYxn/IVZVNXq0xGs
 XnurjAGmcUphnYSKnuo7avlEZki2RHwjJfFGKnbL6v7nPM5eJ/3oQF5HjQZLYPk9Ufcti7x
 JEkhZG+EB13dg/Fb5ovKPhoQqf4vn4vo4JYC8Jst4QqnzgwcSVAxJq06U0H13del5m5vZY9
 DKy2cNuuxYsZKlj5I6ONA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NE2Z/sEthd8=:7UMJJjpUGnwHvZ18Gs7U88
 w6FhnncUsbMduOtuplfDysbJgX6NsAbfSU36OyDi2WnpC/kDqhRd4Pwst/tqd6vuo6XBaYgH8
 a4SOgXQEGxMKzdR80fg4uPceR7Q3s97cts4yVkS/mKk1OjjPPwA6+EbFwAStpPFOCPuETmVDH
 O22+FBrPY8fwadnzWFNOQ7wMJDZafwEV8L9ZoP7PKBpsvqpE2lvCoIs/7M5WbQTB5Xktc+bEZ
 29n2cSU2CYuLshIra+CLEpLncNEtdlz4N8LKgbUEU5fOCKhaP0xmiMLK1v64eVYDRQ0UFonER
 r/ZMC0Ag7QtZpdXGTAYsm4xliaBSxDD+c6H+ddbzGre77BhBAzHCyIdSbC8yafrZDOLweMkez
 JaKuYIsXWAlEbafGz+eDSblWlBnvQXqRDAl/ySmUjo08xeFGpuLZIg528E/xwT7COJRVNm7zp
 PvIjJGfKz6YLaVr7t2lhLoVMaIwCujn7ALfcypIuF0IUGIpsYkbcBOSfqCNRYcTk6A+zEYl42
 R+AisKLFbsvwZ9J383qJcYDmV6F5lrjUFqkVdT5MjKQJ07UEP39BqE9rQ35EufoEf4eLqriB7
 bjZwpJLQAZVTqFYzUsrNc6c2OKPp+3lay8VCmJsENPTDav6dyJZePXSBa64z+0EsFymroVnCf
 QztlbHV0CjVIN3kUolW1OWFLcUIMopJ3XPOu1IDq7MRTd3RE5Pnc28JZHhKOWGhlH/4miMmIZ
 XqwBbFBVZ4+Nxy/GglZw11Tc2KzrmttpzZAJNNnQXHo7p5DOC8bzB7kZ58E63oTIGNLf+1N1e
 kwaGWPoeSzRwoK9CarveeZP2zg77drHWStkUqskFvrnLgl4GyCtdWm8Xn9ajLAySKv2//L6pL
 Qmu1HO3cm2c1cvUNypRMtok/bHVGbbLmcDGI2seDZbj1FluXQpkkR9DJZRRdvh1MAb8P6yLR3
 AoZjTcHxoz0ZAGwXx4y3oyGpnxVPMng2K81NSRrcQ7OSm74n0OtE7uFHS/G/c7rEZJDqh8/QY
 0Pi3/Uts2d6aG7ljF82fEEx4sWOqgEUnM0NnOn8IhRrE3QaAS6Tv3tvyqEvE9KRGP0PQKqIY7
 u5dghG+cAx0j34=
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phillip Potter <phil@philpotter.co.uk>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 12:24, Daniel Vetter wrote:
> On Wed, Jan 26, 2022 at 12:18 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> On 1/26/22 11:59, Helge Deller wrote:
>>> On 1/26/22 11:02, Andy Shevchenko wrote:
>>
>> [snip]
>>
>>>> P.S. For the record, I will personally NAK any attempts to remove tha=
t
>>>> driver from the kernel. And this is another point why it's better not
>>>> to be under the staging.
>>>
>>> I agree. Same as for me to NAK the disabling of fbcon's acceleration
>>> features or even attempting to remove fbdev altogether (unless all
>>> relevant drivers are ported to DRM).
>>>
>>
>> But that will never happen if we keep moving the goal post.
>>
>> At some point new fbdev drivers should not be added anymore, otherwise
>> the number of existing drivers that need conversion will keep growing.
>
> And that point was about 5 years ago, and has been discussed at some
> plumbers meanwhile, resulting in the staging TODO patches to make
> these drm drivers to destage them.
>
> Fixing bugs in fbdev is all fine, reopening it for merging new drivers i=
s not.

We are on the same page!
I'm not at all proposing to include new drivers for (relatively) new
hardware into fbdev, which is capable to be written as DRM driver.

Helge
