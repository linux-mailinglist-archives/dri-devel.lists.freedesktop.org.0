Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6F0629476
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 10:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C16410E38A;
	Tue, 15 Nov 2022 09:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358CC89830
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 09:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1668504973; bh=HtrL7thnQQRtwG/td36/P5QqoioFTxHJwNQkvhuGD0Q=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=FiQAAc173CPxHWLLoHTh3oIgAJQNL9B8aBJJdxmLZmMnksgFqHjSLKzPDYkeudd2D
 0zQRl/JnCJYAqeGx28KU5kxO1IndZVKBBhK9NMlpEzaMv/kjVxyE5gQl/q2tbKiUCI
 rGkKBkV7i6sBCAwJwlnq9vZ5gWDL625OBzrOZMSVO+S3kxbNNsoPSt78tl6zsw2t1b
 T4HWo2wb08Ryk4HDDKMuT1IqiJxqAOoxaW7t95iDoNaEW4owZtLyetqZtXsyUv/+1X
 f5UF8ySnprvdk1EXNykt1kQxcxv9ZcngtQaphs9kDAmeqqlFQYxIF5XY8szTrca5DX
 Ih65W77VEZzmw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.131.87]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdvmY-1pUl4t28IQ-00b1Ti; Tue, 15
 Nov 2022 10:36:13 +0100
Message-ID: <8753076c-6de7-84d4-cb63-c8efb9bba565@gmx.de>
Date: Tue, 15 Nov 2022 10:36:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH -next] fbdev: via: Fix section mismatch warning in
 via_core_init()
Content-Language: en-US
To: shangxiaojing <shangxiaojing@huawei.com>, FlorianSchandinat@gmx.de,
 corbet@lwn.net, sfr@canb.auug.org.au, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20221115025306.2602-1-shangxiaojing@huawei.com>
 <156a9800-b40a-8e83-86d2-27f9e2e67523@gmx.de>
 <1e9e04d2-29b4-6e37-fa5f-f0f4b767171b@huawei.com>
 <2d79ad8e-45b7-d095-8f26-4f2e8aba66f7@gmx.de>
 <244a4384-91e3-ecff-5957-94df26921cda@huawei.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <244a4384-91e3-ecff-5957-94df26921cda@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LXg3uJ8POsMgkPA18C/QADtILfBJnK4WGIucepwbp3GigYDkmeU
 DTirUi0TGYljF/ZJ18R4Iyw/El6F2rpKC/ltHop7srVvOhUcBnf3AUPPca7+yv+D55k7PWy
 z+vFBvJq2Tdp+hHOsMjuIgWrWEQRsWdea22iumTw8iA3oTUeJVo2FnxbB906XKe5AzF/b6p
 jb7T2nURD37Gii22Qnptw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RV4napGCzRA=;W5E40Tn4yM6AGhiBxv96qXWc9jj
 aRIP15Yb1/eiuLHwcA2YH+Kwk8ssSvBljgsGz3Ux9MiCVqqm8dzxAo5b7EtCn6qcIEAhqUjTH
 KY73k5mxHFJDFIoJJVZxo6exRzp679hHjh/QYJLKFplUZEZZn6ROHJS4QGXzAz3PCmsc9l6mx
 l00nINpzVdF7St8jH4EL8Grnx0n7xzXqX4LBa1mnMKjMlzlKIV7IJ0l6jvqF7lXHC8fzdW+TM
 jg30uXeJDup8IzDajOSGCO4MINK0qwNEjXid0TWr5vQMRnaP87LNrIjLRseq4EaIhsuYdFaGA
 MEM9/E4p/b9L90mZSZoajwIlowlh90xYs0oQ/CvrJzPmIbUgAKupUvJsrAT/Vm/xBMHC2VJml
 uPgyK7oKsWo/i6y8L+0TfYyUsAIoZxd5Glra9j4T7C8StNLZPXA/K6vZSOT+PjQv8pvXyuckR
 rad7pDoT9VoTFEPLJXPPXpDIR/39RB1Zb2gKnDnJrRi4tk5YP3cqjmN91wGsybFWGoVdik3k3
 jV7U9YnA01KJmsRYrO+63oI+y4MYLC7pAhNdQCPX4WcerjkjFC1K+d6+uYz2iiX0RjuEcfhpH
 0lJkWLj8hHw25uNXrZeUoCxBT3NMRckbwcPJt1EsJCBHjGV2QaB2sV1f0VxaYmDGJM8FexeIe
 pOwApntC4LN8kWxYictREowbQYd4NsbZRWPWgF0zehX42JClfHFR+zH8AtPJQMZtV0cPXeGuw
 V/3MyPeeWpsi/TzIG3Y2D3zisjq8032zG9j6O4a3recQJTGfWuDBhFpAvEvsrb9e6fi+9mlkm
 BQOJdZmw8PvyxBdpdhKTdc+MqzOOw/mp3JGmBu5o2bMFxhC3aXUodWO2cYzqNG7tHy1O8HHUP
 3uK6oZmp1ge0pUIPKZUExDCVhjJUdmDwe/11eJAPWT4azTOeh9VaDKR9WsW46hV0hUWZy5ZFn
 vGY3+dG7ZWBcC5T43wY++0Ya2Qo=
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

On 11/15/22 08:09, shangxiaojing wrote:
> On 2022/11/15 15:05, Helge Deller wrote:
>> On 11/15/22 07:52, shangxiaojing wrote:
>>>
>>>
>>> On 2022/11/15 13:14, Helge Deller wrote:
>>>> On 11/15/22 03:53, Shang XiaoJing wrote:
>>>>> Due to viafb_exit() with "__exit" tag, it should not be called by th=
e
>>>>> __init function via_core_init().
>>>>
>>>> I wonder if you can't instead of this and your previous patch (ab885d=
8c7e15)
>>>> turn the i2c and gpio drivers to proper platform drivers, e.g.
>>>> adding to bottom of via/via_i2c.c:
>>>> module_platform_driver(&via_i2c_driver)
>>>> instead of viafb_i2c_init() and viafb_i2c_exit().
>>>>
>>>> Shouldn't they then automatically be loaded/unloaded?
>>>>
>>>
>>> I'm sorry that I have no idea how to change an i2c driver to a platfor=
m driver.
>>>
>>> As for module_platform_driver(), I have checked and it looks like just=
 a helper macro to definite XXX_init() and XXX_exit() instead of automatic=
ally load/unload the driver.
>>
>> module_platform_driver() uses module_driver() which adds module_init() =
which then
>> adds code to call the generated xxx_init() functions at startup and exi=
t.
>>
>>> Besides, the XXX_init() and XXX_exit() definited by the
>>> module_platform_driver() can only call
>>> platform_driver_register()/platform_driver_unregister(), perhaps not
>>> suitable for via_driver? (or just need to call
>>> platform_driver_register() after change to platform driver)
>>
>> platform_driver_register() will be called by the newly generated XXX_in=
it().
>>
>> Do you have such a viafb card and can try?
>>
>
> I'm sorry that I run the test on qemu, and have no viafb card.

Ok, then we leave it like this (your 2 patches merged):
https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/com=
mit/?h=3Dfor-next&id=3D7ecee8104be8303f6b23380f14e06915d79ddd34

Helge
