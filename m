Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C074B7513
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 21:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E162410E57C;
	Tue, 15 Feb 2022 20:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DBE10E57C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 20:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644957393;
 bh=JFXCWCKql48UNlTh7Yst5igG5l8PdTcvllupvHIlkNA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=j9lrOoPnHZXVsdTdCi9OVS5FbdwKCtwVruTCv8Alqiy5wqaK18XGmIvbK6n/BocvI
 oAwYofjeK9RyiRakWr68RudAwa0XJmu6PxylS1s8Q5nv6byMmW6sQvKq7NOO06amWR
 y5peN6jpnuRY0qgYX9/5/U42q//O5f0fi1I44nF4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.185.100]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1nuVm11o7g-00h94m; Tue, 15
 Feb 2022 21:36:33 +0100
Message-ID: <e29f650b-0362-3210-0cff-3d60289268c3@gmx.de>
Date: Tue, 15 Feb 2022 21:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] video: fbdev: atari: Miscellaneous fixes
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220215112126.2633383-1-geert@linux-m68k.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220215112126.2633383-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5i5oc5VahLUo0RFxymkaRjsyilZSwth5e50lwxXduUyW3UQjhFa
 3ZEpcayUb7tQe7k4Yh9AgWly6Q3aZZfYYiaoapOmO0lTlOp5BiLWOGOL0UwtFclaBSpOvc2
 odmGs/+JvT6vDHk8tNOAF5en4d9U0eXKW5jkeZrRG60/a7V2gAtdcNLRvzZ2DYAg7c69KvM
 cA8aNWgm2j6IcI4G85dbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CXeNC8zAOnA=:1B2E38jQGiVxnF5HYzG4vS
 SVk31Kpj9x4nyR6MqQzvhvZqR782uJseyGL/EbTh6di6uerl2N83isFF7GvgPwkGuGveB9Upj
 ltTWsGUjebl84jMSHEhf1j+/jnUz4JWBGLkCfqOy3SE+erlmavcvp0NAVvgFF5bf6F91S+fxw
 nC2O7e6xw7g397+8euGHpsVDEkwNIriaTGKC2jbVOCw4YAUgtMEnbj4zqHz0ijt6HRgZ9J+Tw
 NMaRg42+X4ZlH5Pj2v75NiBEQKJXbZSKP7b4mfg4KumiqIE9Eo9ZYNj+QmBtu53U69lOPJnz6
 pgZFgqsI5fDe7DFsZgE/XFQtd/0lhs/xJZ9mnyhizDYgEvzhqzSfLApu32BUZNKjFVejarBPZ
 z7rLbYU5ZCcBZdtFDWvcgpsYv1ktORIalv6F2ZfrcyqOIP7vevJT17n30weUX+4OsHMljaU6l
 1HRKjBKnb9FdioPQGSmKqaVziHWRBU+mFsmvVVEGhfNCGpJ1ctHnarq308yEJoZZH9G8ivyaF
 tw9CyvaPzYdCKcVWzU0zAO3CbZUKBYT0GmKUmL5ARD2fNcTEIeLS/X0S9+WJBabS2GVXXGhkB
 wDFT5Q1vmpcYIq0dC2f/y2iYR1J7JD2EUGc2e0Vr4jL5NIc5FAfakBhVH8TvYy3oez30j14Dz
 jpfOAaoJ9oA39n2bK6IRSMfoER0QxsjwdcuDFZhRslrOBGkJRCDQp3H0b3qKfkM1b/i+stKhk
 eibMgFshQfFc012hEYDHgKzUvbI76rEvXjGCORJziTMggGkLIVjdWJsqubu8MUwKLV3HKTfID
 NCtCIS6+vgQxrw3vo/HYNaBO6cnau+PA/opJhY8wMqr7bk4EKLdyVcVgb1Hew6ekyUIkR6c3+
 sTKOsoP8t/Zz4gokxxdZBwHZOSwxMkDHuBthojJj1gOYFtNPBGilqEFYlRhlHyKBss18Fz64x
 OeXVkEpX4/f1XyMtFZwwfUTI6UHMmDiyMQws09szDDXUGRUBBC/9vtunPHau6nwgJ4cXlOUwn
 L6PQLI+GaL57s9yjMT6YH0KCKKv0zOarMsxi2dQF3hal20e1v7xxWcHI2nSAGw5PfNfIGLR4F
 9i2vsC1ehm3n4w=
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On 2/15/22 12:21, Geert Uytterhoeven wrote:
> This is a small series of miscellaneous fixes for the Atari frame buffer
> device driver.
>
> The first patch has been sent before, and is untested, as I have no
> access to the hardware.
> The other patches have been tested on ARAnyM.
>
> Thanks!
>
> Geert Uytterhoeven (3):
>   video: fbdev: atari: Fix TT High video mode
>   video: fbdev: atari: Convert to standard round_up() helper
>   video: fbdev: atari: Remove unused atafb_setcolreg()
>
>  drivers/video/fbdev/atafb.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)

I've applied all 3 patches to the fbdev for-next tree.

Thank you!

Helge
