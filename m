Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B847A61F4AF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 14:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E6E10E198;
	Mon,  7 Nov 2022 13:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D75810E198
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667829447; bh=4BClMNRktfth1UcCB5lvIjIvsBi5zp0t+Rlr89MuvFE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=D93F5czjRb1Hi6Ru2+1b54rofjiVrBUYj1rKRyr53RoGLXltEllxdMs1FWbeu/Qsl
 5eQ+0mQABpwDrqBsQUJqQpn9Eo+qU+628GSbHlMPzkqb95nLaN/BWFUzzpsapQh3TB
 1/wI5PEi0rosPUBxmRrcQ/dEgWGYZX7YcWiCuED1+DPjsV+9qn3lk9XdGZ5mXI5Dk9
 m3QLLsvg9EQqMsv+CYqEEQR9xXBeHa11+I7uIQpDke6E9TdrUmiFjN2HqrYzjr3AvB
 54zFf9MkI/OJPNXJTI9AydSTgAeHXMmQ8Sh33gv35AoUFhNwLG8x7kagIMYwDWGNwL
 imdeXXnl6i74w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.191.140]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJlc-1pJhsh1mSa-00jKeZ; Mon, 07
 Nov 2022 14:57:27 +0100
Message-ID: <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
Date: Mon, 7 Nov 2022 14:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 javierm@redhat.com
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221107104916.18733-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xUMWzaVhRY8mI5Ap3+Zlf7TkfGAi2LBsljwuLShbi5Z5U/tfUf3
 bBp8I5qnapHHnNmj6zy32qK83NrFJOgjyzcW9RRWqUdq41F39E2Uy6IufVmpZuIq07Mwp4n
 EG8z5csNCQBSjOI6khz4xFC5nA7LDBy/oxJiVmQbAi8ZK/UMnuOhZywO272x43d4EKcdzR5
 oZaEI+yBDLbgkT4jMyZ9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9a3R+vQbCfs=;19bP7TorY1sknckB/lmL2wYFGFs
 wApCRdKwmuj+/AD6uSCivxYLI1TnCydRQKzeOjmbJC1hGyYYVug48/qWMeW4GAK32pslDwJ0p
 k0L9XGg9VpW3WVjsRhwqL5lBSx1BiooODJQsFCIQDWM5GAfLrtV6QuRUpFEOGVU6CM9ZxZfkV
 o3VJpwy/4kNpsGJ4lk0DoSl9qg33mpEQBjW9pHnn0IJy5Bv58KW7YcoeLJBOKAse0ue1XjIJZ
 ZSE5O3tKEMrgKmroAxWqNcggS0vlnFsnukqj21+cFwZce+nR1LRbgQrrhVaFqjpiMEg2dbTW7
 DNPNr3Ik8qdmEDlEdnN5+oYXUtae966EaLsdiXC3hlFQ2Z1AVmJeSHK0gfrdLhS6xBWnI8E5z
 PU+pDndQ2zsXdgaScdKOTKl1A8uB0HMJtSdFGywv+uOSMKikKVAfxRVxsq5oOnZ4ZTxaoS9Qq
 YbkO7pGA1W/osgAmnSBYN+cDFqkr/jRw3mWFw1zeBx6bo4Z81b80BrP3TocGG3bJhfvrQ+5QJ
 O0P6SU2phzyYJFUgai3Wp8ExhDxFI1WN9V0KPInaNzX1wHmrjsFZLSR//0RBGBKr2hwqof+Vk
 172Dgd5rSUNPPO1FlobXU4+eoyqUukhAIeIGAbpe6cV6DhoUSDU2Hsgo/BMkX6iGmXz84Udci
 wSEnH/jQIDtXeBR5jPuDQF1Zq/l51GzTKGa5GGhNLJEyQhw+mcmAOfzd70lo/mvAHFAb7bQAq
 lD/fpOF7aNrDjnubUYPNwrz1EzBoXUTEMAoVWazSjoWExTTYgVMIAZn5Y3SB5/ixgQTHGMlfi
 12RSX6P89QkCCcyDbV04Aw4rw3a3yguqozppnERz5kB40seG41R5OERz2SnynN/UKKf3VUhHE
 /lSH3baK0OVNf+wzjZxAkjxXEBuvw92vHBE9PHkhu5W6uQy6gIAnsK41cSelooAxDr7V72l3t
 VbkKBFeizOkPBqCDfT51mjulr8o=
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

On 11/7/22 11:49, Thomas Zimmermann wrote:
> Support the kernel's nomodeset parameter for all PCI-based fbdev
> drivers that use aperture helpers to remove other, hardware-agnostic
> graphics drivers.
>
> The parameter is a simple way of using the firmware-provided scanout
> buffer if the hardware's native driver is broken.

Nah... it's probably not broken, but you want it disabled in order
to use the DRM driver instead?

> The same effect
> could be achieved with per-driver options, but the importance of the
> graphics output for many users makes a single, unified approach
> worthwhile.
>
> With nomodeset specified, the fbdev driver module will not load. This
> unifies behavior with similar DRM drivers. In DRM helpers, modules
> first check the nomodeset parameter before registering the PCI
> driver. As fbdev has no such module helpers, we have to modify each
> driver individually.

Ok.

> The name 'nomodeset' is slightly misleading, but has been chosen for
> historical reasons. Several drivers implemented it before it became a
> general option for DRM. So keeping the existing name was preferred over
> introducing a new one.

> diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/at=
y/aty128fb.c
> index 57e398fe7a81c..1a26ac2865d65 100644
> --- a/drivers/video/fbdev/aty/aty128fb.c
> +++ b/drivers/video/fbdev/aty/aty128fb.c
> @@ -2503,7 +2504,12 @@ static int aty128fb_init(void)
>   {
>   #ifndef MODULE
>   	char *option =3D NULL;
> +#endif
> +
> +	if (video_firmware_drivers_only())
> +		return -ENODEV;

I think it makes sense to give at least some info, why a specific
driver wasn't loaded, e.g. something like this kernel message:
aty128fb: Driver disabled due to "nomodeset" kernel parameter.

If you e.g. change the function video_firmware_drivers_only()
to become video_firmware_drivers_only(const char *drivername)
then you could print such a message in video_firmware_drivers_only().

And I don't like very much the name of function video_firmware_drivers_onl=
y(),
but don't have any other better idea right now either...

Helge
