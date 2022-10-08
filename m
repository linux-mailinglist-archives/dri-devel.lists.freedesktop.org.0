Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F135F853E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Oct 2022 14:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A936610E233;
	Sat,  8 Oct 2022 12:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD1710E233
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1665233319;
 bh=EboP4VEtNPwXw+TtUpfywvH3L6c3t8d/QG2++H1uRFs=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=TJ9Vf6B3hRO3F+jJ7e0RaCJ8YpR8YcxNCWPGjcFDo9Wh0iFYlA0Lkzbagnsx3fGmk
 gR8EucaEcqnhaTPSe9Unsd7GDlcwh2FQQQqZmt07F9BE/9lODb3CM5dPt04dw0/e8O
 hPV/fn2gVW4rA4x8w5pIR2wf1Ta3O6xNPfn5exk8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.144.139]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQMuR-1oTaUA2y5x-00MO9Z; Sat, 08
 Oct 2022 14:48:39 +0200
Message-ID: <21ac36e1-fb02-6f92-e3b9-94c2dd4d03b3@gmx.de>
Date: Sat, 8 Oct 2022 14:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH -next] video: fbdev: add missing MODULE_DEVICE_TABLE
Content-Language: en-US
To: Zeng Heng <zengheng4@huawei.com>, javierm@redhat.com,
 tzimmermann@suse.de, maxime@cerno.tech
References: <20220928151710.1951969-1-zengheng4@huawei.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220928151710.1951969-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v/mL+d7UbvYBbwAwHbY1/UWic7O2S4eVMmWG9wW/8AQrSFhCfLa
 789IgWQiPHHWllT+DgItqR3w3EYspT2BQqbILI/tGek34BjBaR525/aAyj7E5b0LBjAg45i
 gyMQ8TqgxZTLy8fIPqtQCGHb8TQjytJfhwTEhDvSCrBLISCsQ1ZMjQHmx26FVItXCL2/VYO
 MzJX1UX9D+eJiXGxGDjaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DnM50TXI6Oc=:UVyXBqDOhA8Pm8PeYcDIRX
 Jek3XZf9IjnpJdUFN12ruzbziTBn42NcXIIrdRgrvQc9/PcG9lBlB8wO6SsxCgUOd4xbN5ynv
 wP5ZoHk6nIdw/TLgGCt1Tw/SiWCT3LGd+VnHQlWhOJoxjSFo+WttzPdyZVNd4F9wG/5u46/zt
 GdaEYOPT/tN+Ze65FrDRbkj4GBicxX7DkYUt8fzH3fuqONC1KjxKDYh+kkzQQ+kvVCCzUpqEX
 Bn4Fy44S77XYGwESIPYGxrhhJ5bSofG1JPqC8gPlimsCLbmRGokP3SohYYcxg7dC+mNnu45GB
 M2XhdzYoh8lp/1i+0o0sB9VsV+R+ShHoul5ZKVkf7vQxBg2KswGh1zdbdB7FklkEC92Ljo39F
 Sfkn701HF5n04F1cRmR92/oja4eZKyJKpZBhf+a0Ulr7Gp0vm8iNbDyXCV8S+/UcaP2qJCao/
 JwOSrpd7Yp680nF099YfT+Mc0fqZF1rNsY9hMDGBFmP9i72KsG//ykW9QUDMTaoeQQ+Qke/Y3
 k1xI+uqLp07OQbJswWcPyTfDQ3mm/Q00bWe7EPvIqXFvReLWoW4MlqEY+M8SyhryVog8GVSJ1
 tLtEiFQ+zxnE0W/6ZSeWhDScTvKFTug3whCyH3DcawhzoZCmyE4vd75motWpxDQ1Dk6q1EZcR
 /Le/Kj06Ydagm4Vj9IvrEJaBrOg8MQH7OxvWkLbH8u/9KHdqz/QUytnBcKplTQXCEI0CS0qCf
 RxHpz9s5LgW1i/3E+nXRhW/dtrKi4gmuavs1KqGkhA46oFP2+9vLWVmMiRrN34uDjncKVP5hj
 8ApmKSonOq1/RqwHlCmPC48P14ZLJf8X9IjVR8TR3Nx64r3XgOzy1QE8aZ9QXbdhYax6rHfgg
 2/9dC2FRy1GWhfkDyd7UTJxqDFXPN9vr5N3YPLgUsisAym8DZxqM37a/X7Mxg/jM8tfapip44
 p4+WYDI87GpFzeZ/aoGvVhR11O/3AuVmvKNnl1qWuDGzCyDxULtEJ1g6lYRn6g1XPd+AkKSjo
 iSIeIjSO1r7IlNKkmOBQ5ZbpzJrL8sd5RiRWj5xEU55PvoiySPviwSlQivJoJjx0U9pkZfhGf
 c/DePJy5wAzOFWvhoUXj5UUL/g3QX6LngXAKTtrH3HRz6Tw19nKOLX/dstTXEZABYmUEJYjvW
 XizXM1cc/adas6GaeBxDosW/m2Yr1Rox4BSKpZoyRYivKoqXqomibDRYwIEcTdHhlhpGM0eN9
 HRD0F/hXOyXTMUgomeh4hQlAD/FNQFGvXw+EhUmoPb8WOuB1xbLeFlo4RClVMaQIM8WUkc3JR
 8gXT1NEW2UFvUJ5hk/ydYC8eyV/PsRdpsFK0mI67OB2LotuEQqFmSY0JnqjTza01/L+dsiCrT
 SUFO52iAlObtfiPpggTUTZkiUjLDm3a8GePFKwyFfxKjkwPttXVahLLM/OHWsn9E8uumwGYzc
 wZWqhB76Gp9NXri/UmJQXJuW86PuKHFnE6Se6qNnZvWmsCH3ha+yf5V1SfLrxx+h/hDDJ8x1L
 HNKZhSpxzu9BaihTDePT/3zw5AuJBmzy6vwQ+hlMNLzai
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
Cc: linux-fbdev@vger.kernel.org, liwei391@huawei.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/22 17:17, Zeng Heng wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition
> which generates correct modalias for automatic loading
> of this driver when it is built as an external module.
>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>

applied.
Thanks!
Helge



>   drivers/video/fbdev/vga16fb.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb=
.c
> index 35cf51ae3292..af47f8217095 100644
> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -1421,6 +1421,7 @@ static const struct platform_device_id vga16fb_dri=
ver_id_table[] =3D {
>   	{"vga-framebuffer", 0},
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(platform, vga16fb_driver_id_table);
>
>   static struct platform_driver vga16fb_driver =3D {
>   	.probe =3D vga16fb_probe,

