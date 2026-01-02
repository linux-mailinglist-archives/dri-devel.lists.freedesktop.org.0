Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68044CEF40C
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 20:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EACB10E2D6;
	Fri,  2 Jan 2026 19:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="lfytrIKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6BE10E281
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 19:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767383960; x=1767988760; i=deller@gmx.de;
 bh=zr5FP1iVCME6ZfilLGQerp0to3iRegjQC8fLB9+l7jo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lfytrIKHaewo7kxUtbSgof6/eB4wc2RgtzAg2maMBLHlPuRCY4gLkgw8hOWzMmnk
 MoKSqyMLzBGIaJpQ/N3UluiDdiPfqWVH12o5E3AeVQpEkHbq8S2nazz/NQo9yN2Kd
 39bM9+IOx7l31Laj5QkIac8Kv687l1mperjreKzgyTMXTsKPar2Ij7E+7u6olE4cp
 +4LMQtq12Goy9202FqACZN/IV9d8nhWdJk0Dah4BUxxfiURka69p+eMqWET2vc4o0
 9a//9yFjD4yoJNNpv9DwxVTBnIst8Z3TbVVhSdmS5aPRkUVPQP/UHP29Q++ZYwn45
 yR6IkoMplwcgGwEBzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.142.105.83] ([138.201.30.247]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlT2-1wLVvE24JC-00mhhS; Fri, 02
 Jan 2026 20:59:18 +0100
Message-ID: <90526885-9597-40eb-903b-7f741f87a7fc@gmx.de>
Date: Fri, 2 Jan 2026 20:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] video/logo: remove orphan .pgm Makefile rule
To: Vincent Mailhol <mailhol@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
 <20251230-custom-logo-v1-1-4736374569ee@kernel.org>
 <e04c9862-761f-4f36-b978-b760d2a0a928@ixit.cz>
 <d1c1d037-7be8-49a3-81d7-59d33efba81b@kernel.org>
 <ec760546-b320-4b14-a792-916ec552a3ea@ixit.cz>
 <d20c6baa-bd1f-4de7-afa7-0abb99e3bcb5@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <d20c6baa-bd1f-4de7-afa7-0abb99e3bcb5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OEedfY3MrwkQkNM34Q2tevIh8SZmi0PNv79F0N9NxEFPOruD5xG
 wF7APeQxqSz9yvMW0vXOMsTFWGjr2EjskKH1DF/5/6mx6qbPmoLUSELxWR6AmBEvDj+T9Xe
 p7GefyH13aLpx5KpsPvO0O/rZhuQKVA1Ul408Io8mkmUqXmCjrLTWuBPHlHiVC92fiWXRUF
 rnPF9shVd8R8a4qwt1lKg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AzFySd8AVQQ=;1xGGq3U9yh0SSRPs2gMFb/4NCEg
 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
 8Xyx1HJQl4J2eiYAkRW6E/0TfSOzUaiFa85oQq
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

On 1/2/26 18:25, Vincent Mailhol wrote:
> On 02/01/2026 at 18:18, David Heidelberg wrote:
>> On 02/01/2026 18:13, Vincent Mailhol wrote:
>>> On 02/01/2026 at 17:34, David Heidelberg wrote:
>>>> On 30/12/2025 23:20, Vincent Mailhol wrote:
>>>>> The kernel has no actual grey-scale logos. And looking at the git
>>>>> history, it seems that there never was one (or maybe there was in th=
e
>>>>> pre-git history? I did not check that far=E2=80=A6)
>>>>>
>>>>> Remove the Makefile rule for the .pgm grey scale images.
>>>>
>>>> Great to see this series.
>>>
>>> Thanks!
>>>
>>>> I think the Fixes: tag should still go here, even if it is not very
>>>> specific.
>>>
>>> But then, what do I put in the fixes tag? This:
>>>
>>>  =C2=A0=C2=A0 Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>>
>>> ?
>>
>> Yes
>>
>>>
>>> I am not sure it is worth bothering the stable team for something that
>>> isn't causing any real harm.
>>
>> That was my original thinking as well, but the Fixes tag is not only
>> about stable backports. It is also used for tracking, tooling, and
>> documentation, so stable picking up such patches is just one of its
>> purposes.
>=20
> OK. Then why not. I added the tag in my local tree, but I will wait a
> couple days for the other review comments before sending. I will not
> spam everyone with a v3 just for that.

I like your patch!
So, I've added the v2 series to the fbdev git tree.

I don't think a "Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")" tag is
appropriate, since it doesn't fixes anything.

Let's see if issues arise due to the wider testing...

Helge
