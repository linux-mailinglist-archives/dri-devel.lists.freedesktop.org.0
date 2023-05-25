Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DD1710525
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 07:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B69210E11F;
	Thu, 25 May 2023 05:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5660610E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 05:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1684991027; x=1685595827; i=markus.elfring@web.de;
 bh=3CJ3M0DDsyJrCxfQNggtTyY0Dwy9Bnc5hVFb+2wLbmg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=v8P8LtBn0XiUgHz6up0j6v8DeuWCEddxSPH8PznXkTMpIdGiohX59b//I8ksc0+dW86xHkV
 blK+XziUGj33g+bip8YVrFcg+WpY5+e1IuOSBWZJp6kFRz4ZR/r1yNUEJc6UVvIIRg8m6rI1L
 K66byEqtqldWdNNM07EWQdxjHTpDPd/1QNLfxsPcOucmt0GXAn2g/0sjohjI0F6/9Wv89dhIF
 ARO+8vbz4kWgQrXacmVcu9Tg/HvY9gqyxwu0xFu325ZjcnTqyDTAp7jCT4sgn1PiJneXVlkyC
 I2qpE7nFZvqLHk3CQE/hAkZ3pa2V+NwtZ3DYMwRnSHcAZ1vuB7Sw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLARS-1pjpnV2x1e-00IEXO; Thu, 25
 May 2023 07:03:47 +0200
Message-ID: <f14c162f-7b48-39d2-7ff7-75a6dde01f7c@web.de>
Date: Thu, 25 May 2023 07:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/4] fbdev: imsttfb: Move a variable assignment for an
 error code in imsttfb_probe()
Content-Language: en-GB
To: Helge Deller <deller@gmx.de>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
 <38cd2e4b-3df4-6c69-b790-5762d24e2c29@web.de>
 <a4b406f1-5395-1187-a27a-26fc4a5a00c5@gmx.de>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <a4b406f1-5395-1187-a27a-26fc4a5a00c5@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GHRKgosjRZgvysKl/ZPmm5gXmI34Dy0rUc6HdIFE/xuI/AZoMk6
 0RhM2MN4wFwBix5wtGYQwwWDQbWvKuRYr3d2R9XUGRrwn3hPi++3K6E2hCB5lqg86OkGFBv
 IY6DViI8vbHt7yDKKqHcbCwIN16x5gkSvcUP1ark7tVXz5DutenMGmWlxrFEiie9WBpYKN+
 VxQsxK5S+Wjz27/nRmE+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6ZC+WYkoz3A=;d/oi+nuIE1yEvvdGm8ycn6smubT
 wbT7SX4hdcDcBvUG/e7ipPwTo47tyHdYsBOX+y/3wheQaK9z5i3KQuuQ10fgiaIfspFgYnYAd
 vAaEaWVFfkplCkclOeIz1+zAAzVcOGyOwxQuieBVyh13g9QDd6Rm7TEutTrcEZ72ADkXA9Pbo
 0W+F819ObT0LkXjUAVws8cbvEyCkvnMZZx0gn0mnWM2hZcQe5gOEBIghhy8XEEV/4Dv7faNEm
 2ObBiBh6kPSK2B/tQxkQYyi6m4VtpQDnJJCTs7hMuFbUCjZNBpLnfBrM7/wxuPFPZLN6gVhcD
 Y1bBQJNdRtKdI1QnanHLYL7kExFqZ+2UGqCRdiO57dmSa1bWAfi/jfo1T72b3ZBYaCMei326F
 zGfcvEe21jieEMt5OgZNtj+FCDxjOZR8Lb4o4Qclu23j9R+6zNiOPBXUNawsB2qoR1mb0bVYE
 jsw9p3NJzedfC0Sm38vnMNESln7M5xGSfLxOiqP6Ilm0mkcEuaMqYViiduntv8MILcFuSR/X6
 Mev4/Dywn1+jH/zI12gwDhPvA0aJFjlxptg/JMn200ACfr6HpgrcMKifw8sOFmnAN7CMu/rgc
 Onej6CAH0uaiguK4u7jRUUj1nPZUsr5P0UbZeUNO1n5ek1gs4WJpzAR2WB9hKRx+44RJZ0+4F
 AExcxY3L7gH+jVX/YI3km0/c0ThnS9QK3e0PGw1e2RmzWiEbrpbTaSdCa+iMOemmDK9lc+Idp
 U/EdHLGklu3s4f0s04MI3dmqJUvEbfumQbx/3aCtZoKhsMqcNkslmB7h4Y9XUYLyUAmjdUIS7
 S+H9ukRUEHPlFSO4YYpU3E5ZeA5fuostFI7Zf7GqLEivosZt7kjf7gLyEXiqyNoYHbQQ2tOaq
 dfk3nhNDy/HVueJVbSgoHs9Gjby+sHxtOCgYaCcLNJT0XlxEIwL825sfgLZTipkKyP7JzdlXe
 6BFWHA==
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
Cc: 1395428693sheep@gmail.com, hackerzheng666@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr, alex000young@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> The value =E2=80=9C-ENOMEM=E2=80=9D was assigned to the variable =E2=80=
=9Cret=E2=80=9D
>> at the beginning.
>> Move this statement directly before the first ioremap() call.
>
> Please do not move such variables without real need.

Is there a need to explain desirable effects better?


> It makes backporting (of this and maybe follow-up patches) much more com=
plicated

I propose to reconsider such development concerns a bit more.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/dri=
vers/video/fbdev/imsttfb.c?h=3Dv6.4-rc3


> and the compiler will optimize it anyway.

How much do expectations fit to supported and documented software optimisa=
tions?

Regards,
Markus
