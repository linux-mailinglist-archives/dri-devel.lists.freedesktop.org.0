Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508AECEFDC8
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 11:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4051E10E2B3;
	Sat,  3 Jan 2026 09:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ZB0kNWpS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F6810E2B3
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767434386; x=1768039186; i=deller@gmx.de;
 bh=+oB2qEJ0/uV2IY7hY377KY9OnN2R0B9J/svqVYFlOcY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZB0kNWpS49YsH3lKDNkCb4lI4yekq80KILQ/jeDpzLac5tpH/zHZ1NMmdgP6hPi5
 AmcVxmFAiTFigAWN0IGyNAD2PVcAzHlmvd27l6kfvSvsXa0khMAfwjQZjGIzJmFSh
 uuqUoE/Eq2HvUTAm3sJxLV90WfYp7BIrp2W46ksFKB0ao0JmVnaVXNjXjwj4r6Io9
 NcPo1Sk90tnbita6nmhXgmxpTffT4JGJ0thVAycL71LHxs3zuKN0mt+YVgybOFtNh
 nvXGviHkr46iTTtv1B1MEiolb/cj1ltnGeJrVMOjeTMXgVv+UKmjg79URgBIgJbWg
 lRuB2KLZLyY9ugxE2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.116]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKKYx-1vK1vx2D4p-00Hsqf; Sat, 03
 Jan 2026 10:59:46 +0100
Message-ID: <73007a0a-dd96-43eb-be2e-ccbf8b19cd79@gmx.de>
Date: Sat, 3 Jan 2026 10:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
To: Chintan Patel <chintanlike@gmail.com>, Helge Deller <deller@kernel.org>,
 andy <andy@kernel.org>
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-5-chintanlike@gmail.com> <aVOJovo-k6-0KnVg@carbonx1>
 <aa2b08f8-e6c3-4768-bce9-e36ad9d1e74b@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <aa2b08f8-e6c3-4768-bce9-e36ad9d1e74b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hUv6acaVw/xQLfEDLZtvrL+k83ihGb5bw8n2iH0s7531B/RIZhC
 Mhw0oU25FILCboNcSaXR4ELFPmi/VsojQeUNUTPsVPB4Usc3zlxe03V3zHWtemV8hnW+e0G
 v+50RIZ1fooTPr2Sf2inqTo7auS7bZzyIYtW+QvzXhlUWCYgS4XNHikZztGeSVdwPguh3dc
 I9uGUfmYjFa9jCyF5g/tQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nrMa+wj+XVY=;kp5pxxp7c8So4G1YoynPnEo36aH
 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
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

On 12/30/25 19:25, Chintan Patel wrote:
>=20
>=20
> On 12/30/25 00:13, Helge Deller wrote:
>> * Chintan Patel <chintanlike@gmail.com>:
>>> The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but=
 the
>>> core driver does not require CONFIG_FB_DEVICE.
>>>
>>> Make sysfs support optional by defining overlay_sysfs_groups condition=
ally
>>> using PTR_IF(). The driver always sets .dev_groups, and the kernel
>>> naturally skips NULL attribute groups while the code remains buildable
>>> and type-checked.
>>>
>>> Suggested-by: Helge Deller <deller@gmx.de>
>>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>>> ---
>>> =C2=A0 drivers/video/fbdev/sh_mobile_lcdcfb.c | 12 +++++++++++-
>>> =C2=A0 1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fb=
dev/sh_mobile_lcdcfb.c
>>> index dd950e4ab5ce..cb7ed1ff9165 100644
>>> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
>>> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
>>> @@ -1350,7 +1350,17 @@ static struct attribute *overlay_sysfs_attrs[] =
=3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_overlay_rop3.attr,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL,
>>> =C2=A0 };
>>> -ATTRIBUTE_GROUPS(overlay_sysfs);
>>
>> Instead of replacing the ^ ATTRIBUTE_GROUPS() by the code below,
>> isn't it possible to just mark the overlay_sysfs_attrs[] array
>> _maybe_unused, and just do:
>> + #ifdef CONFIG_FB_DEVICE
>> + ATTRIBUTE_GROUPS(overlay_sysfs);
>> + #endif
>>
>> ?
> Hi Helge,
>=20
> Yes, the __maybe_unused + #ifdef ATTRIBUTE_GROUPS() approach would work.
>=20
> I went with the PTR_IF(IS_ENABLED()) pattern because Andy suggested
> using PTR_IF() to conditionally include overlay_sysfs_group in
> overlay_sysfs_groups, and to keep .dev_groups always populated while
> letting the device core skip NULL groups. This avoids conditional
> wiring via #ifdef and keeps the code type-checked without
> CONFIG_FB_DEVICE.
> If you still prefer the simpler #ifdef ATTRIBUTE_GROUPS() approach
> for this driver, I can switch to that, but I wanted to follow Andy=E2=80=
=99s
> guidance here.

I assume Andy will agree to my suggested approach, as it's cleaner
and avoids code bloat/duplication. Maybe you send out a v4 with my
suggested approach, then it's easier to judge... ?

Helge
