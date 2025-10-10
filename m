Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A42DBCCD54
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 14:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6418E10EBC3;
	Fri, 10 Oct 2025 12:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="uEr8DHEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712A410EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1760098104; x=1760702904; i=deller@gmx.de;
 bh=Zh6BhKnMA79MWyab0CAzmMs8HsF0Oe7PImX9VjoEZRk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=uEr8DHEqzEp5AsiARDrUfkeBbKxGSB2AS3l2wwkgRPC5jjy/CPfVVV69Jvb37cRf
 lCMaD61UkH7O8fh7IoQfboM8OCfFRhJ7nlSvkSGfTNKMK0kanmTaL1Ee8jB0mEZhA
 7du/I1QrIyY+WSTcwyGqF0dvxm3qHGh1aySo3eIA65OffKaakre4wiI3DxeesbsZ2
 PAQh3WvbZcmEocf5NwyvF/o3VE1CabQeZSZC0rwCFVsFPRRbvaXDUJk1wxE/BFmFI
 0Q60Er5ZM4gQxQ2VamFMv19ulWk7rHa+QhsHaH6OP/FKEdENAr50FcUGyH1CLRRLg
 9lDX83tNUgD8AJWyiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.136]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw7f-1uPqPb0xNb-00gwy2; Fri, 10
 Oct 2025 14:08:24 +0200
Message-ID: <f532c6d3-b6e1-4fc4-9627-1e84f4ba6df8@gmx.de>
Date: Fri, 10 Oct 2025 14:08:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Javier Garcia <rampxxxx@gmail.com>
Cc: tzimmermann@suse.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org
References: <20251006164143.1187434-1-rampxxxx@gmail.com>
 <20251008183627.1279115-1-rampxxxx@gmail.com>
 <dis2jb72ejrbmv26jdj3rwawrdmhmde5fahrkdn6y3elsgg4p7@wsjopejnmz5f>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <dis2jb72ejrbmv26jdj3rwawrdmhmde5fahrkdn6y3elsgg4p7@wsjopejnmz5f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zsjiOZTGZ1wj/tdP4v0oUQPCeHEqqinC1gG4XVGXpm3XwHES9Np
 0AddWeg+R0jT/eu08T3TUnXreY05bg/Qqv8E9xunRs0tjdRzJBDnyzdMPHk0aVRIQU7YJKg
 y+CdmUh67IZ1CoKSVRfKLWGcMpIeGUy5n4D8ZMXwHciHVxmomiMIhs+AGHHYH1Zr7hBtoYl
 7XW6CwXMKsTCogV6bn6WQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:B+G/qZvIa98=;CmxxUvj9S2yxX0w7Og885ssBKVp
 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
 A7Uq1/558SOh7w==
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

On 10/9/25 10:50, Uwe Kleine-K=C3=B6nig wrote:
> Hello Javier,
>=20
> On Wed, Oct 08, 2025 at 08:36:27PM +0200, Javier Garcia wrote:
>> This patch wraps the relevant code blocks with `IS_ENABLED(CONFIG_FB_DE=
VICE)`.
>>
>> Allows the driver to be used for framebuffer text console, even if
>> support for the /dev/fb device isn't compiled-in (CONFIG_FB_DEVICE=3Dn)=
.
>>
>> This align with Documentation/drm/todo.rst

This seems to be Documentation/gpu/todo.rst now...

>> "Remove driver dependencies on FB_DEVICE">>> I've not the card so I was=
 not able to test it.
>=20
> I still don't understand why the creation of the dispregs sysfs file
> should be conditional on FB_DEVICE.=20

I think this is because people simply believe it, as it's documented like =
this
in the todo file. I think this is wrong.

I think the problem was, that device_create_file() has a "struct device *"
pointer as first parameter. Some device drivers probably referenced
the "struct device" pointer of the "/dev/fb" device, which does not exist
when FB_DEVICE isn't enabled. As such, the device_create_file() would fail
during initialization (since the devide ptr is NULL) of the driver and
prevent the driver from working.
That's not the case for this driver here, and probably not for the other
remaining drivers.

> Either they have nothing to do with each other, or I'm missing
> something.=20

Right now you are right... it has nothing to do with each other.

> The former makes this patch wrong, the latter would be an
> indication that the commit log is still non-optimal.
Either way, I've dropped the patch from the git repo for now.
I don't think the patch is wrong, but it's not deemed necessary either.
If someone has that device I'd happy to apply it after some feedback.

In addition, maybe the section from the todo file should be dropped?

Helge
