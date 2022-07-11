Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F33F570856
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 18:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A698EE4A;
	Mon, 11 Jul 2022 16:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E4F8F108
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 16:28:57 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4LhTpq4n5Pz9sc5;
 Mon, 11 Jul 2022 18:28:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1657556931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0Ew8vbJofZiPTnLGbAIznC2oE+zfCyp3d/IQXhvecc=;
 b=rcoAD+Bs62GqPvCNjiEGidlJpdRBXoEBlje7Y9vABleFkDiJLxNqThyTi4EFd51BtU3YWz
 ZPzrRXtF9atPnrgz5i2Mlb7USqMaRMUChdpXzhczAeMRDB1M2BunGUW87Dvrnf2nydwiHw
 0oGij+ZZqVAED2m69wDjRXs+eFVqP3EC24ifAHkfGgiM4+7MH8dA3g0sUT3oCl4L2WLDIy
 f62L/iLIxxO4pksmxpiGSXniLBdOsEiFIEE3EmFHTtRbDpREKBc1NTPX40P5eqmlBlhOTU
 5VNUwkvdSAVas3LWvcmpMEGMaHJOjfwiGcq2IOnLsWeMCsGYXC5jmmVSB0hqIg==
Message-ID: <a1249136-ac01-c873-f61b-0c8e812909bd@mailbox.org>
Date: Mon, 11 Jul 2022 18:28:50 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
Content-Language: en-CA
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1657300532.git.geert@linux-m68k.org>
 <0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org>
 <96a87833-d878-dde9-e335-9ea51a4ba406@mailbox.org>
 <CAMuHMdUgdbZeoFLFL8+Hm-6fG9cg5Wzq++JED3KR5P9YZtRQ4A@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAMuHMdUgdbZeoFLFL8+Hm-6fG9cg5Wzq++JED3KR5P9YZtRQ4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2b4b7a29c4e7fa0b9d9
X-MBO-RS-META: 979tt788gbjputer4sjzcn38y86iouji
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
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-11 17:30, Geert Uytterhoeven wrote:
> Hi Michel,
> 
> On Mon, Jul 11, 2022 at 5:23 PM Michel Dänzer
> <michel.daenzer@mailbox.org> wrote:
>> On 2022-07-08 20:21, Geert Uytterhoeven wrote:
>>> As of commit eae06120f1974e1a ("drm: refuse ADDFB2 ioctl for broken
>>> bigendian drivers"), drivers must set the
>>> quirk_addfb_prefer_host_byte_order quirk to make the drm_mode_addfb()
>>> compat code work correctly on big-endian machines.
>>>
>>> While that works fine for big-endian XRGB8888 and ARGB8888, which are
>>> mapped to the existing little-endian BGRX8888 and BGRA8888 formats, it
>>> does not work for big-endian XRGB1555 and RGB565, as the latter are not
>>> listed in the format database.
>>>
>>> Fix this by adding the missing formats.  Limit this to big-endian
>>> platforms, as there is currently no need to support these formats on
>>> little-endian platforms.
>>>
>>> Fixes: 6960e6da9cec3f66 ("drm: fix drm_mode_addfb() on big endian machines.")
>>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> ---
>>> Cirrus is the only driver setting quirk_addfb_prefer_host_byte_order
>>> and supporting RGB565 or XRGB1555, but no one tried that on big-endian?
>>> Cirrus does not support DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN
>>> in cirrus_fb_create, so you cannot get a graphical text console.
>>>
>>> Do we need these definitions on little-endian platforms, too?
>>> Would it be better to use "DRM_FORMAT_{XRGB1555,RGB565} |
>>> DRM_FORMAT_BIG_ENDIAN" instead of "DRM_FORMAT_HOST_{XRGB1555,RGB565}" in
>>> formats[]?
>>
>> The intention of DRM_FORMAT_HOST_* is that they are macros in include/drm/drm_fourcc.h which just map to little endian formats defined in drivers/gpu/drm/drm_fourcc.c. Since this is not possible for big endian hosts for XRGB1555 or RGB565 (or any other format with non-8-bit components), this isn't applicable here.
> 
> I read that as that you prefer to write
> "DRM_FORMAT_{XRGB1555,RGB565} | DRM_FORMAT_BIG_ENDIAN" in formats[]?

In other drivers for hardware which can access these formats as big endian, yes.

Note that AFAIK little if any user-space code uses DRM_FORMAT_BIG_ENDIAN yet though.


>> It's also doubtful that Cirrus hardware would access these formats as big endian (drivers/gpu/drm/tiny/cirrus.c has no endianness references at all, and the hardware was surely designed for x86 first and foremost).
>>
>> Instead, fbcon (and user space) needs to convert to little endian when using DRM_FORMAT_HOST_{XRGB1555,RGB565} with the cirrus driver on big endian hosts.
> 
> Yeah, probably the cirrus driver can use some fixes...

I suspect the fix here would rather need to be in the DRM glue code for fbcon than in the driver. Or maybe some kind of byte-swapping helper(s) which can be used by drivers.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
