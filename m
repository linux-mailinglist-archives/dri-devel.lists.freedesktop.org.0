Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A001CC603B5
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 12:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE74B10E065;
	Sat, 15 Nov 2025 11:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Vz4GFmjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24EF10E065
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763205487; x=1763810287; i=deller@gmx.de;
 bh=fGwnqjc1u6FJxkm7AAJUTsJORLKaWfaHZ5KDorGg2bM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Vz4GFmjHhb9KkHNX7y59V6jWVTkrJhZR7JcD/ylvs8JLWwuwJJxThuB4S4nqCuyt
 31jUwzl5bfGnmlrQmlDv57VlGeF0yZZxwSRaVPyU2CY4wIFzwqsASnSmY5wJ334pD
 lMR3SI/J0lk4ANPDknH/GoIrymuvyqZGvO6ioP26sb3h789eV/ytJ7eD2/nn4zgsu
 7/2tk2EW9M99tPYtDrhF4F6B0w30TdVEg2/TWimTIhtwP+sPhkJU196ogaqNVBg8M
 v1Xd/O6QfnpogQca8tbIo6M9by9RXuV6eGUAGVhdgFWCY5+2WxG3AeY3CDxBoukGr
 MwFwr98mGZFyozhisg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.58]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOiHf-1vX7FB36Dv-00I2iX; Sat, 15
 Nov 2025 12:18:06 +0100
Message-ID: <daa1a9c8-0398-49ba-9edc-345d538cb53d@gmx.de>
Date: Sat, 15 Nov 2025 12:18:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/vga16fb: Use dev_* fn's instead printk.
To: Javier Garcia <rampxxxx@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
References: <20251110090446.2910998-1-rampxxxx@gmail.com>
 <CABPJ0vj9+qWo54X6Rg19kCgdQSpKoP_69Byfj0bjGNXys9LoCQ@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CABPJ0vj9+qWo54X6Rg19kCgdQSpKoP_69Byfj0bjGNXys9LoCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2C3I8330DKWRedKuzjRUwBuAzB9eOnyKqfNMxIcVUWOHWVPlkiy
 LrxXtx7o2MQbVKuTTVkjhsihWS1Gw5aGHC2Ou9ekYrru5c+NnTveA28daWCvIiyaZc4K0aT
 95JyBNVCssGBML0wyAAkHzYquNckBiR3Zg6wIMSgrxkQB7ocnmcEBLoOCUt1dAS+iSJpaYC
 knaO//krWMR6CUNsLQ+sg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gLVKgRKVixI=;i7nYuX67b4/C4d6Uevvxb0tW/uy
 lgSTazf+e+cCpHPpL/StcBbXV5HAZcoHROk83AOBnvd+FbVuhOHx9mLxswMaTP6/qJUlfs4GV
 3ikQsw6VVG8/W+Y8fv/ac3jEEbZjwgGRj06TLooL4Xfc/vS9ML8Bc8MBu6J4k9CpClVkVYCUE
 eWXUSfh6d4GM2kXX898W0QxnD6x5SNpN2XZ/0MOIYoRHnXvZrzw3nV31DvATE+b8G8N69Z4aL
 RnHvXNiZ59flXyy9edRO0ngq7UTB+W1ga3lVe/DGgd3mG7ygBNW2tageTpR+/z9qbvPl1FVa6
 6TPcOmuP+P53yR+TpbLks3vPUFjMGnb3uBEt9E9tpsjiwHrV/ehNHVNPwSdYjMx4CBXNXsDTh
 vM0QMfxxqZ17pILiz1B3CXLH9lCXlVN6PcCh35cpP6/gQoRxmiwLCBnKQew7jKF9kgd9H/5Lt
 oAOCgZlAIIrzS8OR4OLxrxpBg6YsLEeJBjNUSXFjO7WyxmMD9QGEsNaK8O75F5HsVONOZ9NuK
 lwCyz7/BnkWk8Yn+ssUMBzMDFMWcZQ7G/y0XYGCVQAhzE0B8DahEk9gGYnR6Z0PPu4JxT+GM3
 oCfpp7POdo17vCBLnB3Ye5y0MUutRrJParsPkDJ8BpxEQXmw7PQkm8vl2ijEAbUEwbc7p9l2B
 LdxKE9eI3AcXA6hWmRpDIdE7snCNR1/u702NYgorRwj6efdXVhjnAb15eP45NsjY+Ab9beRpf
 zZ1Q9sfQ8bI3eNNfOYErLJjTwQpJjRpA40tEm3SAjYt78TQoej0UnyTShi5M6hV/AqYNMnbt2
 o9ikPrhoL8s456aUt4C4VRDYW2LKXUJn99G7SJ7bvIrlCnSp59k6PiU2WlVuLJeY1d+AQD/j1
 0l0vLc7lnurLw6IAQ2BtCS+hQxz8e/t8v+SJqsJ/C5lWQdK9eJv6jy0QIHOoKNZXxYDWXzysd
 1VyW7EyTs8cD+kWzUJzqiIeEvbkqUmf6KrxhNODmYPjmFQ9aOBf5Q+es4SUPmTrkhLZpsiXAu
 goBGvjPGGX87pvEXFaU0MCSX1hTV5CYxpl+uk4Ux0bQsuv4rtYys9BVVR00kNqhQfXZCOoOz4
 /EZAHX6KCdrzIo5xKafDVpUL35ovKfFjlbyrJnhuCEZEEDkAonFqrOpoYq1lUyTGjwV+8bWWF
 TFauqBVX3ynw8X0JhTQLrDW6P7eo3fhoQ38W8rTdOqJv6nLVbvoWWfGNdtGbWgYHNfezTUUk0
 jgbbVlMpIdVAKOLHS8qU2RlpEcxyCXbQ6SWLBEYPOiozFFM4I8q0R1HnLeBsWu1bY8lHAvYH8
 H75mD1gbWXnXueDgTeGPlDuDpKTkYvcC8XWOX74ehM1gk0cGlnr0J1q7quq7hDKUdfSGbtVy2
 WDQB14t+8PC7JcD3xaLia9HmKKWz1s1wH38HEyMonxHX7Ai4vea5qvJK7BVtGiDfma0Ag8BBU
 x5Jv9UhnzqHwsXQ5Dn4+M0EhI9mE7nVy4ZOadp59uzaidn8LWEZ74AuGa0CsA9clfCFvxMqVj
 LpmdniFmW6D0HUrxXmY2ysUyuFo88GkhnKEGfmgznRkfSGAVMXkhHfdcg31ytgum20+UO8mNQ
 g4q4Lr8OC5Y0ixVYl8nKz7dFtLhwLkjlaqGC/5Vy88jRPL3hnfPIh/fBluiew4+IsL43zOu6m
 1hiCK970O47Xw20rE66suklJZFZLXgbQujLlkSCBSCZFRFxTM/gLBGUxSSGQPlE6HrsapBWGs
 mB8fXzPRLSy98u/2qgvI8z8ZK9Bu+VLZyA+m25SVx/6K5GQ0KI8WfFrnR8SxTZ9N7+Hoq5JeM
 XEMVyJXQOVky6mp3FHetnaxkX3MI8Yc6xZqsYut20uSVs7H6DIPjQZRurs39IpDB1/RcIb8d/
 kR1KZQIgBQpB+4eeY9Wnr1d5RAQZQHhcPRHEA+av+xxJBW2zhNQ90+4Qjw7f9zz6vV11hQ8wq
 DPnbu2oiFrHD72XmUOUMt0o0E23u+ry/lpo2ove/3sAAGpQvnrTHUFPC+dvZIQPP4RTD2GO2i
 JqiI+6seWRePxiZplKc3fnpnrbNl2yQ+aULcKS+79AYONbS89GD7jm1CzCtNfXGx9E0VVrwZK
 sZPZc8hI5KeG+Oyxo/UfykQz0TSy6PC0bs+uRL7Ay1v9FGMcMa9+Bv+0wYp6K/oyUt9eNujjY
 junUv69R/lGtr96GgjeozkeY5Vvx3UaH+1DDtkmI0BYt7JumHVY3mf+YzaTQfjpLfsKtSn3Ul
 zhuFoNx3VDRGXIxDLQ808hdaLd/G2zejCGggDN86wC7C534TyD3zyromAj7k1hTBKEolGskeW
 9WIb8fysa77SbN2Ls3PnKw3C0+PAOHLCYUFX8gaQqbcEtRp/LuMIPBSsP5XrCSfFPXfGJ8XeY
 Yc0EN3EuOSVwbc1ct1nZvjTzRS3B1WFVwLZVhJ1FU3MKSLQQBrOvd+FmeahtdaWYYUZNYZaWO
 6687WJ2w1ohxcEKhfpEH0ZsYYTnUoVFi2LH6kC7otNI8SOtbQPheZJvB2wxh1lQ0XKyju68+9
 Oket7oFrvNTRRGtOg/CH+uuUuobtS/ir2arZDJ5SmLUexd6IxX0Wa3AbnDZd0MiV9LtKzv3vD
 CoMvAEihf5qM7fAgva66wD7n4jhyvfgLVkth4d6O++xIDHgLSNbkKUPhFN1WSHuvyPpx2A3Eg
 Lexu4UKfID2zfBH6pPTGpPLnwB6jh7UeFi43zKZp19I5ZaLJTSnqKoRkH5pepAnKfTVXvAckm
 CUzwF2qBOM2jk9c54MhOFDYw1eeA69UokPp1kGhcJ5CVYNrX6tlcM5aNBpS0ur7krW+dcwCSz
 As/yr1symKTo8DKYkQ/7PPpg8PQzxXOgTgZiBy8WwM47YZXTcGsTUZShpnpHophyo2Spn3eqt
 AiL6P6i/ftYximmbLYKeeAyRXPoDIXE7GaT3zJo74jlroRiKbarvrSTVpZ8A4X8yxmRNJ9kTg
 7sJ+pFp1f2ZbbhS9/+hVohKg69v5SHHJCxsq+BSK+RlxFNEzNlwXTdIgSDa7VqcN2oRjQIAEX
 zlcIYjnIUoSVweK8+sSMPt/efkCLaQwVYcdyOA13Q55o1ITmMT89QeojQEloxdvJxeHQ6vXmH
 KNNJJxHlJPSdcIN6p52ChbVZ2nwdeZHedyekJSnkWkBzNmXAdisZlwRrEFMLA3KwUzy59bAC6
 4oushBxgUKvaucKhKYM3/SJzaTFI+YGGHdDPEWUsMJrgy+BzosTq1bb2W38En4fsux+boXerX
 WYQERKiZ0uMyl3QpPDyh97Oq3k+uv9FSH79NG990E/vCmMwxBCkjDpJh7NZsQKjjURFacpY3O
 8WIqq12HZdgAMTcje76SNiqmpkwJB4pPYu4mwXNlJEkwGrodKcRtx1ltF07b1taTW7HKiFCVM
 FPeSk6Sen2YsTHB4T4ZtChCSyAfq6zCX7ScdTKyQTEbDxR/HNj+oOjVfFjoLLUlwxz1DhF9d3
 EjRqj5n054z3gyqGk38IusAuBmolO7OBGar0hxDrUnD2NGoPPBk9MDK5+hfqnDjfi/wzdujwG
 VLDuIYs4dxT2LkxLgoGheJFXULHs049PnGrILDbMmSA9CZUxoOOIJdSjSvcInqyjjH7CXbwYr
 OeC6Ps9guHxgg9wj/peelMCUmBH0YbODgRbiDH09bhjITBQ1+0nR2wjwLZFf879njmQAJfGMi
 UFqCwi30gCWcK7FiKOsM1AmX7E3FA5Mp/U+UV4bm8EMIHJJR57eAspioqMfoWRMFynzdd+urc
 gGwYaTvQTZvxNwsv9ysJoVLncGTJWbQHIbiYHppoyxc+cyvQenEARyiPz4IPcacSAzIs+kAQ0
 9mtCfbzPDn2i7s3LTrkYil5Lw/kxmuAxJyMn7RdMp12VHoQ0T3cwguysrIsM5Zz3zSQ5Jzn97
 gjK0ezj5X5hnMKnB/MiH0mUuKwmJzF2mrUDAwplNd2GkfkXsre6CDnAIlMW0em2vhvQCZnpnp
 pOEE9UqkQj2ysVSaiAq+IW42Zh8VjiyOe5IL5zeUGFGbziFUgadUMBRa+VLVkVBjHZT4Xfkfc
 Ork8fpY/TqtlWOXmy8taU6gUW1e/nJhlnAX308SJxqAf8IJF56GvpeIoIFAYiz0Q1yujHOcdY
 D4faMOxdA7E04YYfrm2BVUlx7HESqP0QiNvmyFNj2Y0fXLUxEzI2qE8dAXcRzowlh+A5R2mFd
 kRRTLftQZuPHHNE/wvsG+r6l7W05Nb0/eVi8KTch7OoHILRA8R8zTD6gk0Pf0vqcj6lKiu4kO
 1CkWIOEU0/dt/JBRMEtpuL2uggNqf0EvCVoZcxD0UM1f87NNhIE0lUFpisZbRMKgnU5x1lvfR
 41o9+9DD33fgVKvYeyOi+gptusJuNs7eqI1VKxCB/OIVKO6QVBHGU+oA1jINE98LOBosGAhgT
 bGzR16IVjOkeNKfSRMfwYwaOClxB9HpnCLB05t7d42oWnq9BnPIxPfIrwT17atDzyKprxRRTU
 b8RMQiosH6mM5P7y2v7RxaRCN09DdXxybtVL131Utw52LYfHLMvACcIwU3FvasVXfq8lq5KLy
 eJwfP3DwofBusoFkeAfmBysh3jOKIY6RS7I3FeGcPD9giMuUXaPVmJXLjdjZvpDLjlij5ZMeI
 YqE1EowqwEoJnVYIltnR7oy4qPrEE9OkA+37ShCqdU1mJZTxb32kqLu36nQxvMD33tSERhuZV
 20EPHRGB2dG3H/jX+o5KP7dlUNF5nUV7KPrmM2E86DmmY3L9qp63HGcZueBt47b2tvt4gK0cm
 jcwvPI/4/0COpngyQzW3nPZCjoH24po40Ll47UyAY/bA1XRS5q0xDEq/WQFEh1j8LagFauxW9
 1ssgV3o5yGI+5aXcJCb2XSc//tyhLV4w96gVIk1jhRwHGPl+0Pwd1+ywXZqAgr/fzbldo2F2L
 tNv22tyWqyPjymHPSVsETYsPPGsI7FeqZ2A/OIRpEsRrDk1+i5OjJexSQhKam8bVHL9IsMF7O
 cGwL/Pn25/B8leJ7rK7kPbmBsAvV6KCREgCXvaY1j/oLNRIODEcQ4Q5Of2SzKe9am8Ux0dCJX
 ahqV4Rq0LRNLhPdRlPN57amDkaeFhGFitmawJrMuiu3xV9PxoYgH3H1sKkkoON1H72T65wNcG
 0F1eGGhCRBLPdy5rUDKrwQUfsb6SKdiZEEI6ORWxKz1XTRT9TNzrQ9OcjijSZxM2+DLVgTf+P
 yG1sCOMU=
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

On 11/15/25 08:29, Javier Garcia wrote:
> Hi,
>=20
> Helge Deller, any comment on this patch?

You're too late:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/com=
mit/?h=3Dfor-next&id=3Dbcd13134470f81c97ba23b44514c93203261e742

Helge

>=20
> ---
>=20
> Javier Garcia
>=20
> On Mon, 10 Nov 2025 at 10:04, Javier Garcia <rampxxxx@gmail.com> wrote:
>>
>> - Family dev_* fn's will show device name, giving extra info to logs.
>> - Delete the prefix `vga16fb:` from msg strings, not needed now.
>>
>> [    1.037947] vga16fb vga-framebuffer.0: initializing
>>
>> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
>> ---
>>   drivers/video/fbdev/vga16fb.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16f=
b.c
>> index 3b4c50d98ba6..432ba7c8164b 100644
>> --- a/drivers/video/fbdev/vga16fb.c
>> +++ b/drivers/video/fbdev/vga16fb.c
>> @@ -1324,7 +1324,7 @@ static int vga16fb_probe(struct platform_device *=
dev)
>>                  dev_err(&dev->dev, "vga16b: cannot reserve video memor=
y at 0x%lx\n",
>>                         vga16fb_fix.smem_start);
>>          }
>> -       printk(KERN_DEBUG "vga16fb: initializing\n");
>> +       dev_dbg(&dev->dev, "initializing\n");
>>          info =3D framebuffer_alloc(sizeof(struct vga16fb_par), &dev->d=
ev);
>>
>>          if (!info) {
>> @@ -1336,12 +1336,12 @@ static int vga16fb_probe(struct platform_device=
 *dev)
>>          info->screen_base =3D (void __iomem *)VGA_MAP_MEM(VGA_FB_PHYS_=
BASE, 0);
>>
>>          if (!info->screen_base) {
>> -               printk(KERN_ERR "vga16fb: unable to map device\n");
>> +               dev_err(&dev->dev, "unable to map device\n");
>>                  ret =3D -ENOMEM;
>>                  goto err_ioremap;
>>          }
>>
>> -       printk(KERN_INFO "vga16fb: mapped to 0x%p\n", info->screen_base=
);
>> +       dev_info(&dev->dev, "mapped to 0x%p\n", info->screen_base);
>>          par =3D info->par;
>>
>>          par->isVGA =3D screen_info_video_type(si) =3D=3D VIDEO_TYPE_VG=
AC;
>> @@ -1369,13 +1369,13 @@ static int vga16fb_probe(struct platform_device=
 *dev)
>>          i =3D (info->var.bits_per_pixel =3D=3D 8) ? 256 : 16;
>>          ret =3D fb_alloc_cmap(&info->cmap, i, 0);
>>          if (ret) {
>> -               printk(KERN_ERR "vga16fb: unable to allocate colormap\n=
");
>> +               dev_err(&dev->dev, "unable to allocate colormap\n");
>>                  ret =3D -ENOMEM;
>>                  goto err_alloc_cmap;
>>          }
>>
>>          if (vga16fb_check_var(&info->var, info)) {
>> -               printk(KERN_ERR "vga16fb: unable to validate variable\n=
");
>> +               dev_err(&dev->dev, "unable to validate variable\n");
>>                  ret =3D -EINVAL;
>>                  goto err_check_var;
>>          }
>> @@ -1386,7 +1386,7 @@ static int vga16fb_probe(struct platform_device *=
dev)
>>          if (ret)
>>                  goto err_check_var;
>>          if (register_framebuffer(info) < 0) {
>> -               printk(KERN_ERR "vga16fb: unable to register framebuffe=
r\n");
>> +               dev_err(&dev->dev, "unable to register framebuffer\n");
>>                  ret =3D -EINVAL;
>>                  goto err_check_var;
>>          }
>> --
>> 2.50.1
>>
>=20

