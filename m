Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AEAC9CC25
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 20:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7317A10E0A9;
	Tue,  2 Dec 2025 19:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ZrdX68eD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A932A10E0A9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764703488; x=1765308288; i=deller@gmx.de;
 bh=iQnGZTIkKmRGBktXrQOftt+Fl1P7OVu+eetQ8zPrbOE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZrdX68eD7J7WSMv0HgvwjVeGrt79+MWB680IgvyuG4TsB8dhd34GllUmwZJuDLjk
 dcsoXU1VINwwc8+V0iQ2EN8UwP/lwWPiWctcDJ59KggDbn/SOT8oF28DZsD4rG7GK
 l5DsGQVp8e2nmnNnK8qTz/GFtkUxcfBEwIqvG3tzoxgQElb3G+h27LL6SlNLjuAzF
 fzEwBWUINrIuk50obhl1wLDz6GUoTU/ubtVRc3qV9zE8gPttplsxIJgRHDTy1liY8
 gknRNju3+jlUcblVb6mNH94Modl6tLIC0qRhE4HY3Xy5Zvl99E2b+qekWEWiYEwfI
 VUIRatzA1DJCUdcIEA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.47]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mz9Yv-1wL4sm3xX1-01858w; Tue, 02
 Dec 2025 20:24:47 +0100
Message-ID: <e1bea3b1-2322-45a4-a98d-ba887dfc5bd5@gmx.de>
Date: Tue, 2 Dec 2025 20:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: i810: use appopriate log interface dev_info
To: Shi Hao <i.shihao.999@gmail.com>, linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 adaplas@gmail.com
References: <20251031080942.14112-1-i.shihao.999@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251031080942.14112-1-i.shihao.999@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2LkToBCDg7lAPipl3sYU9imUJ3Ph76F79nf2WqAwo6lGcfD1qrC
 qygs7tYHsmsyy5/va8+OKS/ipN3iCi+U0GkbmflcBwU9wKWyVP+4vovntYCYQA+HUu38po5
 NuHK4NIPHbp1jHw9t+buKdK+CT+1mf1/rw1iylHe0HFaaPvZB9/1GIumcEimDwgXtn8PUvX
 V2/W886hxjw0rk1SyJk2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LcV4eaPu5ak=;urOu+imQkggetUQx5gFkD0DVQBu
 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
 Pf30bHrvcD4jGRRS8=
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

On 10/31/25 09:09, Shi Hao wrote:
> There were many printk log interfaces which do no had
> any KERN_INFO with them and they can be replaced with
> dev_info which will allow better log level handling
> making messages clear and manageable.
>=20
> No functional changes to the driver behavior are introduced.
> Only the logging method has been replaced as per modern
> kernel coding guidelines.
>=20
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> ---
>   drivers/video/fbdev/i810/i810_main.c | 46 ++++++++++++++--------------
>   1 file changed, 23 insertions(+), 23 deletions(-)

applied.
I tweaked the patch a little more to drop the driver name as well
(which will be printed by the dev_*() functions).

Thanks!
Helge
