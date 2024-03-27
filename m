Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A99E88DB93
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 11:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5850010F3C1;
	Wed, 27 Mar 2024 10:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ristioja.ee header.i=@ristioja.ee header.b="geaiI5fv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.heh.ee (heh.ee [213.35.143.160])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224DF10F3C1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 10:52:02 +0000 (UTC)
Received: from [10.0.0.254] (unknown [10.0.0.254])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.heh.ee (Hehee) with ESMTPSA id 6CF431775D7;
 Wed, 27 Mar 2024 12:51:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ristioja.ee; s=mail;
 t=1711536719; bh=lI3OvkRCjewmjDJYzHda/g0nWqkjbVeLV88bNPS1nDQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=geaiI5fvOBsOMPu6o2vAe0lHNBNXZ+1qEY61/RoyKUFs/8eWD4avMMpd/VOeIrp5w
 m1+G4eN/PBNfFA8ZNvaOFCrCu6syyqiBU4Fx49qGgG/h9+xhYwXrTZ5rfWr9sSLtig
 ho7zFcEeDOdJSKHPLpM2dUShTucYyTdUShS8BM08=
Message-ID: <5573af3e-bd07-4c27-9590-8cbebbc1b6ce@ristioja.ee>
Date: Wed, 27 Mar 2024 12:51:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
 <CAAhV-H5gFqd3z4Etzuz_q3Hs6A4BP0yzJ69GgMcJzJBRdOwGSA@mail.gmail.com>
 <5f52d611-6ec9-429c-aabf-956d23a8c74d@ristioja.ee>
 <CAAhV-H4MKRXb=STOneivyHsU6o2vU=P9cQMwjRo+PKnPpJ67Rw@mail.gmail.com>
 <9608358d-14c6-4ab3-b3e4-89e166d5e17c@ristioja.ee>
 <CAAhV-H7FtWqM0LQ8fkH9ABuFRxkR2rGtGHEfx3R487hpEZoQxQ@mail.gmail.com>
Content-Language: et-EE
From: Jaak Ristioja <jaak@ristioja.ee>
Autocrypt: addr=jaak@ristioja.ee; keydata=
 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
In-Reply-To: <CAAhV-H7FtWqM0LQ8fkH9ABuFRxkR2rGtGHEfx3R487hpEZoQxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

On 22.03.24 16:06, Huacai Chen wrote:
> On Thu, Mar 21, 2024 at 4:55 AM Jaak Ristioja <jaak@ristioja.ee> wrote:
>>
>> Hi Huacai,
>>
>> On 19.03.24 16:16, Huacai Chen wrote:
>>> Hi, Jaak,
>>>
>>> On Mon, Mar 18, 2024 at 11:42 PM Jaak Ristioja <jaak@ristioja.ee> wrote:
>>>>
>>>> Hi Huacai,
>>>>
>>>> Uh, no, sorry, I did not get to test such changes. From what Thomas
>>>> wrote I presumed that this got fixed and no further action would be
>>>> required.
>>>>
>>>> To speed things up I would appreciate it if you provided a patch. As I
>>>> worked around the problem for the end user by changing the kernel
>>>> configuration, I have long forgotten the exact details. It would
>>>> otherwise probably take me a while to understand what and where you
>>>> propose to change exactly.
>>>>
>>>> Also, do you want me to test it on some newer kernel or should I
>>>> re-download the 6.5.# version sources?
>>> Yes, it is better to use 6.5, you can simply change the last line of
>>> drivers/firmware/sysfb.c to fs_initcall(sysfb_init), So no patch
>>> needed.
>>>
>>> And to Thomas,
>>>
>>> I'm sorry that reverting 60aebc95594 solve Jaak's problem, but my
>>> original problem exist (at least in 6.5), and I want to know the
>>> result of the above experiment to understand what happens.
>>
>> Using the sources for 6.5.9 and fs_initcall(sysfb_init) instead of
>> subsys_initcall_sync(sysfb_init) in drivers/firmware/sysfb.c did not
>> help. The screen still went black during the boot and stayed black until
>> SDDM started.
> OK, then can you try rootfs_initcall(sysfb_init)?

Unfortunately, this did not help, I still get the black screen until 
SDDM starts.

Jaak
