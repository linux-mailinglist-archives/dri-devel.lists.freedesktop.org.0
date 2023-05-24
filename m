Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 219E870FD8C
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 20:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0463310E19F;
	Wed, 24 May 2023 18:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB70410E19F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 18:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1684951892; i=deller@gmx.de;
 bh=vYF4rxhK78UkwtODl6bqMtSb44Y+lQ/HCY7sfkZcbS8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZYn2zqPaBgoLl/eyE6v34K9o5YkJ940ZepXfCWsk3Z0S1/+IwraZb/OrUu2iv/umK
 VGYfyIzB72VsRDdjZ9fMMp7fjN5HRZk1280ehPukXbVKjXNAR+gvRyuk0RF3FbMjmO
 7gTls4OsSLi/H7VCfcP04utVQoLZDyMeot5xh/tjRXJedBlIlP2KsCsIwmGaPHXDOB
 gDxNpOZisOd1O2EMNLeBhc2RTUtGw69u0dDKLjXPCptxciwMpM1TiZWo3brF2sksoG
 UYdb9l+Zl7WzkC9E4dv9WWDx3zVI8M6yRkvKsIYgGO2cHAtR3b5rzid077QdL40NyH
 +9ZglOt9TgW3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.145.4]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlw3N-1qSB6N1o7n-00j3Km; Wed, 24
 May 2023 20:11:32 +0200
Message-ID: <a4b406f1-5395-1187-a27a-26fc4a5a00c5@gmx.de>
Date: Wed, 24 May 2023 20:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/4] fbdev: imsttfb: Move a variable assignment for an
 error code in imsttfb_probe()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
 <38cd2e4b-3df4-6c69-b790-5762d24e2c29@web.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <38cd2e4b-3df4-6c69-b790-5762d24e2c29@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kwyZx7UVkFvtxjWPnX2J8lIg0jAOScX6U8y+gyILOdLeImC40ps
 TzDm8sPK06FrP28YUAkhqhEo5hszE0JgnmP4BdDPeMs+rLIVD11rvp7zO4SDa6UlPDQExXv
 uh9og1moIlqbrFWyDp1WKn9vKNdAsNuSsl/Ypk/z83bxy9TWJg1G0rcXur2WF0wZGvCsuna
 EL/HKfFVycHCIkYVTSc6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wlg3kCL+FKU=;ZHDw2WCNMHfZo4y5j9oFG5UkHnM
 oJj1BhnsmIZb+t2fnLt4xMxL+rbWcb9+5v4P6ptVsiXQWpUKPsKJDrXwRUo1aOomZbrEunCwV
 wVkXoxbfti/xYronrpDJgPi3rDwyxoBQSJQIgArkBXom6TNa7/XrHYxwid9Pj1Z4tXOQk4Sgz
 j52juP2nzx55hk6TSNftSMUnuEVHu6UA74u6bVGzmY5UZ29DlFdS65w94RLu0sCs/t+k4ptfx
 +kwqi/yQe+wgVOPNYGcYI1+iriIedeokdZWOnsUO53H3ap7/a9+ktRMbK8aJ1HxUkErN4RtSv
 +3qYAtrqcldSLOtucesHtXQqjdIN4bzoYFmnR6rK0PdUGEoePaqXzLbEWyBpKOPKCtVfGwrz4
 Q6APQn0La4RxJ/oJNC+OHb+bKp6oRTKUfxokVl0GjKMefeF625jUqvKwNUeeS9o1Ohqw0ykgZ
 StzY9fV/SVoieEy8Ye+OOiCbLx0UvUI1qaR2ocMOONbf1ynQEEHKrX7ufiVdLoxcCbdKNIuOd
 txMhg9IVk2alVl/IqfvTAawAwNmEHEtqJrc1vWFn6K81M2vGDvG7nCAuEvlbcGbAsh+EjnGiH
 Xn91rQ+2j3jhMavivXmt4WkfrkOYt6CIROyP5ci1x1ghvbmY3Q5iSWBHF3gqUJxfe5esdoamM
 LvIvFbzsG42fJ/jWQwZuOlh2zREnE/7rJM6zXSjgw2dfCUDo3Xq43RQrDqZ1dpfoRRx7KVER6
 NMSKR7uMaPWS5/yTYd3HYESw3rFhQky6yFkcMmPT6x8fcY8MvoKem3QnKHxyerh9Tp6XN77Nq
 R8MIrirb22ydmpruABLrYlMSFEzo/LuMDT7Xa6tS9jCdlbQv9qtyJfe/ek63r+/Y1DDVfTszA
 ZvGLFfVoWmIJE68f5Ux3Mi0U+VOQeF4qBh2tRGPdE+QvSFKqNUcLqAOHADPIGqqprcypzPphl
 ofS29g==
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

On 5/23/23 19:42, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 23 May 2023 18:30:26 +0200
>
> The value =E2=80=9C-ENOMEM=E2=80=9D was assigned to the variable =E2=80=
=9Cret=E2=80=9D
> at the beginning.
> Move this statement directly before the first ioremap() call.

Please do not move such variables without real need.
It makes backporting (of this and maybe follow-up patches) much more
complicated and the compiler will optimize it anyway.

Thanks!
Helge

>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/video/fbdev/imsttfb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb=
.c
> index 6490f544f8eb..90c72428e8d7 100644
> --- a/drivers/video/fbdev/imsttfb.c
> +++ b/drivers/video/fbdev/imsttfb.c
> @@ -1484,7 +1484,6 @@ static int imsttfb_probe(struct pci_dev *pdev, con=
st struct pci_device_id *ent)
>   	ret =3D aperture_remove_conflicting_pci_devices(pdev, "imsttfb");
>   	if (ret)
>   		return ret;
> -	ret =3D -ENOMEM;
>
>   	dp =3D pci_device_to_OF_node(pdev);
>   	if(dp)
> @@ -1525,6 +1524,7 @@ static int imsttfb_probe(struct pci_dev *pdev, con=
st struct pci_device_id *ent)
>   	}
>
>   	info->fix.smem_start =3D addr;
> +	ret =3D -ENOMEM;
>   	info->screen_base =3D (__u8 *)ioremap(addr, par->ramdac =3D=3D IBM ?
>   					    0x400000 : 0x800000);
>   	if (!info->screen_base)
> --
> 2.40.1
>

