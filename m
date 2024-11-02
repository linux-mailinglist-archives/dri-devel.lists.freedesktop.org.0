Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E679BA0B1
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 15:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232C710E032;
	Sat,  2 Nov 2024 14:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Bagw+NcQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F253310E032
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1730556496; x=1731161296; i=deller@gmx.de;
 bh=DMWnIdAP+u1d3dBVM9ytl0mdhFdvU1saAtJJL8m9JnE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Bagw+NcQXKFj7OctknH5tt7KLldE4Aj+eVuX+zepkP1MwLNz+T8IRa117msIdHFt
 E4RVfpySKAGD8C5e+v6gyFeW0vXRuSd5413lIVQXRf/Z6ad1ov1gWkmS/6uFyiYMt
 ZnjxPyHskIq/OcKGqZnp/kfAbBpjuca++gilvLdxstV1GqLe0EsMu+e6PhpA2a7dp
 2gMWDqX+RsxcaRQlIgiFg0hG39vvWefyIV3oRVrMbSaqbm6TaiKyVBdRC2JR2vJ4x
 fPIo8VLE8oCvPmDsoLNbH8/wvpNVACvXzNNYQcZnUlna+JvtK1eCPIIqsufHpbcrl
 4lllCa2TXWHWmY9G6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.214]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJqD-1tbqWh1mvj-00juKR; Sat, 02
 Nov 2024 15:08:16 +0100
Message-ID: <9b2afadb-60da-4eb5-9455-b6bf511f2bc6@gmx.de>
Date: Sat, 2 Nov 2024 15:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
 <7aabca78-dd34-4819-8a63-105d1a4cb4ba@gmx.de>
 <7e33bfa5-1444-4152-b240-946a51e12b26@suse.de>
 <5b4bfeaf-d9b4-4196-b1e8-ef58b1b6607e@gmx.de>
 <46712e5b-701b-41c5-82f0-d6b41f5947af@suse.de>
 <3f655f6f-58a7-4526-91ae-6dc4793eeefb@gmx.de>
 <fe074ca8-b330-42b3-ab1c-83cfab3a7ded@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <fe074ca8-b330-42b3-ab1c-83cfab3a7ded@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Mr4jxkuW1E96GxRg5pliPu1nKUVkdgH8BtzRscAHBRPSpj2F2cb
 tjpMIEWLJD5NaxD+4yulSZOp3rJFYBKoXupkowEZ8AnejaHNdipyrJMkGIqIBhl/o76pph8
 INmZfVy8sAR3C+014s3C8fCviRc/Kp1fXoLenr+zL2I6FAG9D3xtyu8Z8tgZ1fyzbjhLtdo
 628AR1inx84iCxo/Ke1iw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6tNqNC2dcZU=;buTE26CRvc0t/N3BekvhEOiCXp/
 1rjU1eyuyjeaUqkcKtek/7zhoyDPoxCEMRIgT8EREe1NWBRwy7UvaYLa/TJIYmHkJmASDjAuk
 nvPGo9OzcBJTLl7dVBhh9YdUmF3pRIPdDscH3vWjuPKpP5dpVhFhMcD9e1bK1c2Xwf80J+LxN
 rsvrkXNwYY6ZivrqDXxnz5B/YtBxe32RB/hQA0XyWQ6P59Wl1gSxa7uA7vg0zyjKklm1iqOmU
 mnf6Heq+xK4OBCwivqlm6dhqAxmPUJtaZahFuQyBXmtfrcSpmJ+ZqvO1/ASLN75URyzFnM+Rk
 dvoLE8jIlQw8q3JdMWsVfpCStnoo+Suvq73oi7y2ok0Dic1zyqjKuJZfyuVxaW+mqciklNzXa
 32AoD2zxDQCbXlmLOmaGT+HkpGtCPYpWPLFv7BsmfPwzuG92MPMAdTQtZg5wKsC17UEcorwNU
 GKsjSBQV8b3TecSnY7fQGctEMDnkdjNH9+8w5t+qPiDpSbVtH5g17dAYqKtW0JrpVsNr/Sm0l
 5XFnf2YQcXGz5T31yrTcrclLy/KR2u0FiQGKeq5iyWc5384yUm8OpwbM9ZelqQt1SdRaUOybs
 mUEU0LCGMzWWqWnWQO0qCmIluyiNFoRq806+A5j0drXSlruNKis4LCwUf4XbCuO1Srkk1AbEJ
 +He5uRzDbaYujiQjq0ea2O+l/a87vWN5HP2dUrhmsaaL1JVJbikbpna98U9Qukpv7lBhNsQFx
 /l8dC9p6DrS46KCcLK7zDgWLGnBwff5yVg6O28MwAqFy6Avx3uhYN4W6qmxZtcvYT4RZ7NzCc
 u/710OCTx5DWCwWXqVsHJ7QeTlWHHdBJ3KlaqsCdKv0t4=
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

On 11/1/24 09:19, Thomas Zimmermann wrote:
> Am 30.10.24 um 10:30 schrieb Helge Deller:
>>>> I'm happy to get rid of the fbdev drivers, but for that DRM really ne=
eds
>>>> to allow some sort of native fillrect, copyarea and imageblt operatio=
ns so
>>>> that we can get performance back on the old cards when implementing t=
hem
>>>> as DRM driver.
>>>
>>> This is unrelated to udl.
>>
>> No, it's not.
>> The udl fbdev driver implements those functions (like the other fbdev d=
rivers)
>> and as such fbcon on top of udl is accelerated, while fbcon on drm driv=
ers
>> is unaccelerated.
>
> Udlfb uses the regular software implementations to draw into its
> shadow buffer. It then schedules an update to copy the update over
> USB to the adapter's internal framebuffer memory. [1] Udl uses
> exactly the same code pattern and most of the involved helpers. [2]> [1]=
 https://elixir.bootlin.com/linux/v6.11.5/source/drivers/video/fbdev/udlfb=
.c#L1145
> [2] https://elixir.bootlin.com/linux/v6.11.5/source/drivers/gpu/drm/drm_=
fbdev_shmem.c#L39

Yes, you are correct with this summary for those drivers which use the dam=
age helpers.
Maybe the previous udlfb driver had one additional optimization where it m=
ight bitblt the screen when scrolling, but this is just an assumption I di=
d not check now.
I don't have that card, but if Mikulas can test and verify that the drm dr=
iver is now ok for him, I'm fine that we drop udlfb.

Please note that my statement above that DRM should support native fillrec=
t, copyarea and imageblt operations is still true. Without those fbcon is =
too slow and flickering on old machines and fbdev cards.

Helge
