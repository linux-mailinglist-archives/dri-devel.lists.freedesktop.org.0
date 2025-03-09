Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA703A5880D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 21:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F10810E00B;
	Sun,  9 Mar 2025 20:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="fSGconwL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208710E00B
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 20:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1741551234; x=1742156034; i=deller@gmx.de;
 bh=eFtFN1K0yN/ZgcvJ+6iSKv3QX8JTYag1dKLCaSPLzD8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=fSGconwLMMqUJInJQq1ZhWasF4FOP3W3vJy8sgfUAGJXeNtJkT2zcw/Bv1NGWUBH
 QVAzGjMPvrACT/BFB2gJXEyKAeas3AY0wIjq6b3LyOHe4fx5RPLcViS/kvWOfYem5
 R3SEYkEqX39IssM5RuzdcvHjrZVv+3E3AEdFjGGDPnrMFXgW7JZWU5flj73zhiQZk
 KZwGuqCiFqpgl6iSslSfGYoGz+bpBJ2pLUSm4Fla15uBJ6KFRVV8n4oziJ17SnaUF
 /YkboSN0chZ2cAklnu3OQzFHJTLA4pUAF7uohsytwQtppFmLd5SPyUzC3zfmDDTyI
 XgmYMPs3xMphhczw7g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Msq24-1syAyw2jXc-00raBf; Sun, 09
 Mar 2025 21:13:54 +0100
Message-ID: <de634978-ed7d-4fe7-9390-cb9b3f30e8d7@gmx.de>
Date: Sun, 9 Mar 2025 21:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Refactoring of framebuffer drawing routines
To: Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
References: <20250224205908.26336-1-soci@c64.rulez.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250224205908.26336-1-soci@c64.rulez.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cs8hLpkDeadqwXT/pjcJiAZLpNbFujVZFwQlNM8ZGBPezU8mmkI
 VoBCrp/GeVzyvS/a8TFm8IODezENJAE9YLdn5oNF6Uw9iC5Yas6Bx5QwHZYUP36vzOL2ln0
 5eM/1xh5wkNz9ffO3OejuWmj9bfnmaUxQ6K89m9uZjq2UFHKPySgbejeUKt83gM27Z+B0/M
 7OTTnVB23OTLgd5oVIERQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Q/ngmVJJ574=;soe08s+Ab+NFakcDuvXF98R/zsw
 bmleYw1rg9UhilTCOdCBCaWCJBZE0/zfhNy64TlwCVJ06rgkVPsJmbDDWD0jc6KUOI5JwpI2S
 xVY84vHZI9xI0XpKpllYKbEc+Ysi/JajmAEdKweuOUFhekHE5p6s4jYybQWvQOhKDXQSxg/U2
 fLzhnhIaLJ7GMY7xmWsJQFkUh8YDHvJ3uDjkaC09tX6Mv+a7NFVkHhBZxyW5vJr6qE0/MDeC5
 9tlJcu0Q+qG52XbEM9U2MqetIuW/Mu8QfjevIRwGp7VBbUxy9dNBYzTPdnh4NsQDB6FxcUDcR
 iypYk3bYF7tcoLQz3Da4DBoKAW1BXk5058BybxdjEss0I7Y7YSEqzqb37uV44ZiN14bt0K9Lj
 l0FLeKyRKEysb7BZAR3aB1MMmUUkmMLSGhoLiraTYaxSBppG4phKhKxQf8wG81Rkrw+I4wwC6
 H6qz42afkFrsi99Hu9S5o8VIf0keU9tqQ1mDVtlGscncBWHLfiS/w0sGucHXVNdUpCqD3GMKj
 H1H2UgrzJOaEhbg5ppkIl6YeVxdIqUwICqKUyRZyc9iRunjJ1aRqugLVRJaVPwy5b5KkUgtwV
 sRwOqWi7Yn1FzpffBe45C5US9Z+Y3B6r0Vp5TarWhk2jaUiCbB84pDVWoKMGqOMpYa4TjsJOn
 qZucFguMqcH2JeXQzHh1i6s3keZ6Pjxq4vFnct+s5P/zt78N7swB4B3uAUoUlrLh/22C2p2Wx
 PkVosz+fb7/EYO8gx4T+cZkvtUP4f572bmx02+GcqDJELk5ejlkiqnnWaMY9Ji0AkHV/5BRl+
 FZxQxlxv0YG/Ym0Se8atG/xKqY/Flr7GSRBmdCHiVFyzEQvSpyg9EWI4tFLCz+9oCfUOvjiw2
 b/csHEySbyEPBZhSYv0enzoQZqbjQ3ZGJAfVyKU4KnNGY1+SuG2CLablHYj/pY56SLgPTHTha
 aJwJARY59sI6DheGB195DUntm7pBnNaBCzzYiEZq03AP/GT7qrFvmhfthgTAOyEZw7Vx6PCx6
 wNPtmB7c8v+Rc02grXIcN6cVrTHh87UsWmvsnk0DpRaShV3B9OjVDutMlygIaHJOu+VNHY1NF
 wJl+b4PxHGmQBUg1mjbpG09bnWVLSYxUYamc02G3DcKsjGatyxf21u40mBuUi5WovTPMhohT2
 Ek5AkTyFvwCc/5BcLrMORPNpIMJ66ugessipwqICjCzvYyoamxF40D/DyUjjPXS7wGZCl02iU
 BzveCbeyBafAOFBi7gRdKTi/VpHqfI1vngHwKwi0MoUOubHAHTXPb+KUGL2Nj7LT2aUANUvjV
 7jbLD8h7DK6zv4x4SppZAWPJtAPp2Dwsdak9fLCMfm8Yl2lSv7Nl5fa6AditdIlo9F/M2icQn
 ABGJadxOrlHmpjJqHtOBVnJIMSZXT61hltUigyi8zvgTvHcJj/UjArz6Gu
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

On 2/24/25 21:59, Zsolt Kajtar wrote:
> Proper refactoring of the framebuffer drawing routines. This time it's
> not only the merging of duplicated code. It isn't half finished either
> so the various combinations of foreign endianness, pixel reversing, bits
> per pixel, cpu word sizes and byte order should work.
>
> Added myself to look after this code. Based on the time spent on proving
> it I don't expect a busy inbox. Famous last words.
>
> Zsolt Kajtar (1):
>    Refactoring of framebuffer drawing routines
>
>   MAINTAINERS                             |  16 +
>   drivers/video/fbdev/core/Kconfig        |  10 +-
>   drivers/video/fbdev/core/cfbcopyarea.c  | 428 +-------------------
>   drivers/video/fbdev/core/cfbfillrect.c  | 362 +----------------
>   drivers/video/fbdev/core/cfbimgblt.c    | 357 +----------------
>   drivers/video/fbdev/core/cfbmem.h       |  43 ++
>   drivers/video/fbdev/core/fb_copyarea.h  | 405 +++++++++++++++++++
>   drivers/video/fbdev/core/fb_draw.h      | 274 ++++++-------
>   drivers/video/fbdev/core/fb_fillrect.h  | 280 ++++++++++++++
>   drivers/video/fbdev/core/fb_imageblit.h | 495 ++++++++++++++++++++++++
>   drivers/video/fbdev/core/syscopyarea.c  | 369 +-----------------
>   drivers/video/fbdev/core/sysfillrect.c  | 324 +---------------
>   drivers/video/fbdev/core/sysimgblt.c    | 333 +---------------
>   drivers/video/fbdev/core/sysmem.h       |  39 ++
>   14 files changed, 1480 insertions(+), 2255 deletions(-)
>   create mode 100644 drivers/video/fbdev/core/cfbmem.h
>   create mode 100644 drivers/video/fbdev/core/fb_copyarea.h
>   create mode 100644 drivers/video/fbdev/core/fb_fillrect.h
>   create mode 100644 drivers/video/fbdev/core/fb_imageblit.h
>   create mode 100644 drivers/video/fbdev/core/sysmem.h

I've applied that series to the fbdev git tree so that it gets some testin=
g...

Helge
