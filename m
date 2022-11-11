Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA53625B27
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 14:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B742A10E16D;
	Fri, 11 Nov 2022 13:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400EB10E16D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1668173241; bh=AslS6UA+QkhpCx7N4UCcC8p6QUKhFKPG0xeQ88Oxy6Y=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VJ69l5gJt46hBUB436+ZCSwZjGW/41v1m+lo7LCWfKBuIbRsBIo1ouBubtrzpiMKx
 S2WVgzmnaY//lYIn+HxmZYgzqvKEz0uGtxpK3BDaCVObxa7/7KJWcZ3sm3CxKA8eNq
 4OF9TDMU5Va+oTj7BMLFBk6SdYswFuUigxgweMXl2WBIrkMKuiGeoCt0PCWFY73Ajs
 X3FkZXdUdn30dCpu76h7I2toj0tiiQ3EptB9l4SjlU+38hf1cZAH27RMmUdUTtKKGP
 n+MLoSes5X5EBA7i+fzSkkqZdmSqsZiFhuEWcXvZSMVzQKDc4jxBVRQUt9s8mX85Wh
 gHXYAKKh6tB+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.140.172]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfNf-1p7Z4Q253H-00v96C; Fri, 11
 Nov 2022 14:27:21 +0100
Message-ID: <5c332e30-fd05-9eef-8f42-f2899e787906@gmx.de>
Date: Fri, 11 Nov 2022 14:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
 <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
 <6547fba2-a002-f339-2997-5b28df794095@suse.de>
 <d21a0a0d-22fb-99bf-0d29-75b1fe1db677@gmx.de>
 <dfa83c75-4062-93ee-380c-3e0e4f41c448@suse.de>
 <73c7243d-b1b7-ac3c-7b17-1f0084821aa4@redhat.com>
 <3b3d0af7-0ad2-bd45-26ec-bd00eebfa905@gmx.de>
 <33481e86-8c8a-b464-6112-4ffa6decceaa@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <33481e86-8c8a-b464-6112-4ffa6decceaa@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+PVEYq53kmee5aohdr1h6cSZZkyxrcJ/eqhU8Py5n+tB15LGhCk
 aHomMYT7sXLhINU48pezSPhEQ4HbcafTe3GZ+trvvFW1dMmQLCX2nfGuR402+/RSKNiNoms
 hrys5xX6Rd6V3wMJfUawvkrYtoAcatt36tibi8NVSHNlZDNr+Z7doA6yyNMxXPl0bchjfb5
 OFpp4atH/sYpMr+3p8ETw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:flBcKf4Amb0=;ysDVK2Jmhr7YfCkjlRInNw1CSJW
 G/WTcZS+gvjQVXHP9MGbqV8mFNFR/xL+D2KyX4u+uaXqhIaqnCYa+Nyv/qCjXhUTOIPMcMWe1
 1qGlEgBRqfDx4rmMwGO2YmFBkg4Lv0zmyCL6F6SVBJEyTfXForIFy5tDvJbKlf5E+GwjU021M
 PzEkoPdGBcLBWfgqDoQAHarXbJMHWf7y41Enrr6lPL36l3sd2kZyfE+aABDXImfct4q6HQGPW
 GbTcoeaTh4ov6Zmed7kh+tg/XGrqRixWPxaZK2ORktiSyhpKXg51mMRhbaHdz4rHC+jSsTtZt
 b7TJxi8rgB7wnyx4PEtHk44SMA6bGiod6fNkKDhsH45VHB4jFejwaRrHGFygGwEfHbVow4oek
 8Z1kXV5mCbflFD6TVIx6ECLoGHuPakW/WjRNQogcV4veyVSjrg7u+xM75x4RiA8Rqqt6DwOHf
 TMb6pcZpyXbN//8jcf5WQiItpxswUiWRY8XYRBnlm2m1IFYDKgK43WBTOC+JoxgxoOmLGMUZy
 j2Xs08BuXGdCel/a/i3Dpfo19SJsXh5XnQSym+aoqICok3nfQD67VmM21+dPDNN9PcMebyaGC
 eD9/0bTwJs4cPLMVB+UdfgLG27sx9u+p3hbBHKlI+BM89tpziQ5fjieAHaSqgBY6nxLVObqfD
 hKsml9lQTALxnTQXZjOkcKErzjeOFAT54aqOWwQUAl6tgdwG5XizgM/S8e16i28gX8Usmeu2G
 5hVgJ2FHWg1cR0IJsQT4XldQCLpIHuAhAx44h/VJgPmfBdpcxDnhPD28RMg0SOO6dI+8jE3Ym
 bWUztAoK2SAf7nmq3G+DUT6tV0+qQl/OHZxZx/AWF9oGQeIV7upYFDP5ekTQWRkv26Z02sr5l
 PyxtvTozaYYVmuBgSCTZ9LY9ZNG0icavxgp1kMR9Kbhjpm8FyH+GyCK7qHE0X1KEkP7rGRzO4
 o5/eSET5aVkaNMrXq58rqyl6DP0=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/22 12:42, Thomas Zimmermann wrote:
> Hi
>
> Am 11.11.22 um 11:49 schrieb Helge Deller:
>> On 11/11/22 10:49, Javier Martinez Canillas wrote:
>>> On 11/8/22 09:16, Thomas Zimmermann wrote:
>>>> Hi
>>>
>>> [...]
>>>
>>>>
>>>> My proposal would be to add a little helper to fbdev that includes yo=
ur
>>>> suggestions:
>>>>
>>>> =C2=A0=C2=A0=C2=A0 bool fb_modesetting_disabled(const char *drvname)
>>>> =C2=A0=C2=A0=C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fwonly =3D video_firmware_driver=
s_only()
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fbonly && drvname)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0pr_warn("")
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return fbonly;
>>>> =C2=A0=C2=A0=C2=A0 }
>>
>> I'm still wondering why you can't simply merge it with what is printed =
in
>> =C2=A0=C2=A0[1] https://elixir.bootlin.com/linux/latest/source/drivers/=
gpu/drm/drm_nomodeset.c#L18
>
> I don't understand. That message is still there after moving the code
> around.

Sure.

> It is always printed if the nomodeset parameter is given.

Yes, but wouldn't it be better if it would print the name of the really af=
fected DRM driver too?
Currently it even shows up if you don't have any graphic card installed (a=
nd gave that parameter).

> In addition to that, you get a per-driver warning for fbdev, so that it'=
s clear which drivers are affected.

and a per-drm-driver message would be nice too (can be added by follow-up =
patches).

Helge

>
> Best regards
> Thomas
>
>>
>> Other than that, your the proposal is okay, if you adjust your patches =
to
>> call this new function "fb_modesetting_disabled()" instead of
>> calling video_firmware_drivers_only() like this:
>>
>>> +=C2=A0=C2=A0=C2=A0 if (video_firmware_drivers_only())
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>
>> Helge
>

