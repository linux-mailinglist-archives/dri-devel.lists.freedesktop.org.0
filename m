Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B1564B3D4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 12:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AFE10E300;
	Tue, 13 Dec 2022 11:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61FF10E300
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 11:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670929834; bh=f+5ZQSnpbEML0YsGwf7riPTrfsxhSxd2cXhXJyNQkS0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=E0yCt989mJap3FYLm8ydR+dz3vR2mbIUO9K/RiDs0zfK0YkI/S7x2voJT/vJjDvBr
 LzHkIZ2c7iREPv6OvKO1Tu/IGfl6yaHU89yNgvvO5+Ug5yxo5rqM7K/itRm1wjw7Vf
 BGsTMuoyeKAGFqSgW7T16sBV9dYo3Sx7YpFCttRaMPKy58WDqnNVxH4Co7G8Nl7fvO
 kRQjKbqAOHiZLGMBgcG30R2d6ydEav4kG8MXKwATt7PmzNqZ8QR7QuWDyOG58eO29m
 1ajbo8w3eezSE85bOLSpisD1+M0nQGLnjNB+rjN4AIV40J5XMkmGQU+5Fzo8rW42yA
 jSOtDyHuqLIbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.135.201]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOiHf-1pHsRB01t9-00QBn9; Tue, 13
 Dec 2022 12:10:34 +0100
Message-ID: <4a846563-c0b3-ca89-382b-ef59867b2713@gmx.de>
Date: Tue, 13 Dec 2022 12:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: linux-next: manual merge of the fbdev tree with the drm tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>
References: <20221213111612.7bc1f917@canb.auug.org.au>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221213111612.7bc1f917@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zvZd+u3f4Ihm26U9GMZH8cjMluFouldYp3gQS0xMHdRCfyXpts1
 eQueQpPhSWp0fdC/tXgWb8UrCnaW91tKO7iM6UakvUZpt2HwBrHFUuIOBkVstSrfFot19Cn
 sYwmGhOzpv2ZMIoWhAQTIdHxkkAENPlYb693deGIUYFoazjdZY5JP/0gqQlxaUC+ibrOVhW
 U4fXyKPXpezWmmLHSdnaw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DkYRgCaGGNQ=;0Ii3GXo9yK88DwmceLIY93GvsKU
 zSJIWjZ+YTQJVyMCIKmV2mekhlQnGjcVFLgeCsMHuls/aB0j95FmYgsbWdewpR1q9cj9wxKlX
 Xv+IDP0GRN/usCxin611ymssi9ni2Bs5f0W9FI+4av7EgjEebl8Qu0TOfS6za+J2VG9iljd29
 uTtnzIR7Q9Cnvr2UTlJXGYYBn3P42+ZhgGnbW7wR3P3a+g08umw+/FBVHi6JwPYdYgeXqTWFb
 hQs4sZxXIZXE1mXQKCLM0MNchdcHfgmh9qUFx4rjpU7QDe/9AvYNmX6t5VqZSJoVl0h056L43
 pzmYg2MO3suO+GYMbWjPwd4y7ZIKdjPR3igE+kG5BX4Cgi3vHzRKWPxGMsx/LEUgtjlg/0Jk+
 1M0EuM6a+PQmqo9CN4VKHwrr3Igie38oqCSPafmYyNYDJ0JsZUyJEAxMy3yB7o9UL409Vzz1B
 yRpqF6ER1DYlB7TDvBn1SvO4SXvCyqDAvxF0ChXodg0O+l6KcBMz9OSJeNy2JIg3L+pRd3dup
 nMApJGUod8E9r4BNeTKVyJ4ZAddR1WII9RJbLukCP/VIhmKboarpPCIsb0r5hjlEV7w+STOft
 9AUve4gHdlpw6A+mz8inLJn+JdslVGP+JjvuXxh448TgZ5rpOvfkhzfrcUziMvncU28Zpp14T
 /cguoy+vw6ABnj/+9ksLsNw8wLbv6iyl4LR6GD5DRnUY3KMt/58lrRiXnnk/5cqxsVKN1lAAP
 atot0P177aaUfaZJes4x8JzbinK4AtjXwWGr/t7cWxqicOhNcYPXIRX+W9QFjT9vOrk92eESc
 JVu2qjqegTuD4VbJXNsFoYmCT8QrYwpI+KBDJQMK/2qHy3a5/vPotAQ7MeWmKZUdZ22Dfi4A2
 AzfGQFcMVw+q+ke3d+yJYIa6IEjdy5WEUwLpIyg3Oyw2r1y9cwmRrxuSAXAmSURoX82xp449u
 tR4CyA==
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/13/22 01:16, Stephen Rothwell wrote:
> Today's linux-next merge of the fbdev tree got a conflict in:
>    drivers/video/fbdev/Kconfig
> between commit:
>    c8a17756c425 ("drm/ofdrm: Add ofdrm for Open Firmware framebuffers")
> from the drm tree and commit:
>    225e095bbd3a ("fbdev: offb: make offb driver tristate")
> from the fbdev tree.

I've dropped that patch from the fbdev git tree to resolve the
conflict. It didn't applied cleanly anyway, so @Randy please
resend a new patch if required.

Thanks!
Helge



> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

