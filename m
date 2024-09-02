Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C8D968EC8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 22:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C9B10E073;
	Mon,  2 Sep 2024 20:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="hLTYlq7Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF6510E073
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 20:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1725308337; x=1725913137; i=deller@gmx.de;
 bh=O4CTbQRLjIpThMsnO5Gbv/x6RdqXxlV5KCSVtvDJU9w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hLTYlq7QkVrFTE2C8hSDv+mFSAFgP8jmp7yqQdS6aDJoW9Skb/imFtQNaBCDqrY7
 FVxyOUvuujV3ZEVaCkKAm60e/v6e16gqQ66kRZV8LIBfejRylE0N2emOrJJvbVxy0
 3FmbQ+8lx2M3phIBO+dXQ9hhUAO/k/W9fD/sST17cyq5F1mL4o8IYPHHADK8AKXmj
 PISZvFGzwAF1c47s69iyt+G2pX/IMmLCAU/uucNYXnE3IC8jYnIbQFvpp1On11tGT
 tdVfWDzb4srhZMP4nSfoFYrqJGCzQnS0O32DNRUFUssbnCKEGr46MbdrefIqANWlz
 d8fWcAoF1xp/pZmCYQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2V4J-1s4Gzv4B3f-011Chq; Mon, 02
 Sep 2024 22:18:57 +0200
Message-ID: <d5ed77c9-89ad-4de6-b46b-5865378e029a@gmx.de>
Date: Mon, 2 Sep 2024 22:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467
 unregister_framebuffer+0x45/0x160
To: "V, Narasimhan" <Narasimhan.V@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "linux@weissschuh.net" <linux@weissschuh.net>, Borislav Petkov <bp@alien8.de>
References: <DM4PR12MB5086C89FD0EAF070D167733389912@DM4PR12MB5086.namprd12.prod.outlook.com>
 <20240902084546.GAZtV7Ot58w7D90fwQ@fat_crate.local>
 <7cf68133-e6f5-4fef-92ae-7a8c30631fb5@suse.de>
 <DM4PR12MB50863789A621575F937E240F89922@DM4PR12MB5086.namprd12.prod.outlook.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <DM4PR12MB50863789A621575F937E240F89922@DM4PR12MB5086.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6IR0Y4Fjr6+2yCtheKMCZKQ9lSA8aNC+7UKTedDQYC11mBrcYho
 343Dlr/ZyJRxzPBPhhI3KS0OPUsmfYmwzOtskkhjNrAmgMnEHnpJsZ+BPcr8KzXrCc7oX0B
 +vPNaa1FFvIUcXHlMiVKvqxH+eGMOoz4V423bf2/G5fDVM2hF1AYd4XZiFnKlFVU++JulE2
 qh/aWKWqvM2AWsKKcu1og==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LmhA8HHoSw8=;7o8tM9knNu5a/on64MBwOcMzUGx
 7ZHdM0qYy/UA2q7kzRTQpcuweeJHQJS4Wt/6NT8bhto8bo9hRB3Kr+MYeQNbAfrFcDmvzgDUc
 SFoQkeM+IcQtd4MEYRhxjm0wDO70T7a+lsTPCneWihY59k2naGSMFoZJ3+HJoDoMS9P/TAYx7
 db6cpAwKvcHj+AwO7/WfQYPwfHtt8n31GuNALvtEZvrerQzOcxYyGseBa0lM+W6mUmCRMxwG9
 Bre+PR6/mFYaOvtI/QHqKqP4zPYcJPTI7YVrKBecc/FNYQbxwQQalBTWzMEOEpEpI7AHkZCmV
 4boZ+aiK9YBW5j8vAXwzoGDBIwjimBslb/JkAcac8cNPBFm5R40SrXxAUUr+ohBxx9MyhlCoZ
 akdOmlYedDKyoLo4LBld3VvuSPLIlEsMymA4Nu1bs/R98+0HPxlQPpVJZZVT45zlkEPvIZJZI
 VfthJ2kS/aXMJh7bFsA2dwFc5zRWmBt/huVfI5V6Pxd5r/Oaz9OZlj4WPWamIOiR2m7HLwR7D
 khFqIjG3ByZdRM5k0hKPP3F5O1LDDPq/BxPK1O2h5dcm4Yx5ud1Ad/MP6m8Ki5S0uo59im0Rt
 tRKpgtWL9F1/Th64zm0gtikA5RT4Mc2GAOSw0+T9A77h8s7B1U1+OZrKOFjV9CIFsaaeZc7fd
 rel7wL5h4JzfWOMrs4ATkkadwJ9d1M3KpwaPNl7MbIL+L/X6aHXItNliPQfU+eGeEMkkCCvkN
 I8w6R4x9d1gUsDqqbhVliJwc28FoR82rDtgTUUO9BkJxloFzCyklj+BEbw1dKb4jBZcbVVIIc
 sXcA+m0UQo60c6IMgjoP1pOA==
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

On 9/2/24 20:56, V, Narasimhan wrote:
> From: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Seeing the following warning and bug on boot with linux-next-20240829
>>>>
>>>> WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467 unregi=
ster_framebuffer+0x45/0x160
>>>> BUG: kernel NULL pointer dereference, address: 0000000000000000
>
>> Does it work if you revert one of these commits?
>
>>    c2fe0480cd77 ("fbdev/efifb: Use devm_register_framebuffer()")
>
>
> Reverting this commit fixes the issue.

Good.

>> For the latter, there might be a fix at
>
>> https://patchwork.freedesktop.org/patch/611902/?series=3D138008&rev=3D1

Current fbdev git tree and for-next series have this newer patch already.
I expect that the issue is already resolved with there, but it would
be good if you could test.

Helge
