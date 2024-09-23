Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2A697F15D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 21:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D006210E480;
	Mon, 23 Sep 2024 19:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="lmYYY5yS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7CD10E480
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 19:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727120764; x=1727725564; i=deller@gmx.de;
 bh=XE7hyPQ98AX4IY0oVlgATFeWrupENZZNXbiyhU4Mofs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lmYYY5ySIx8aVSEEOhyD6mWlymr31hWtNGMgBXjFx3UZp6PrmHXln4QJFOBF9/c6
 DUIhKBGsKl5PTiEqedahkjvZfepMNd3NV+NANEPsjYDnWM8fnoYIoBXupHL0I+5B8
 5vrg2gmmEFiUj6oWTdlhOn5czJkjTvRyscWZDxt5J+h93dfl5XriiT+FaeuFCj+Dv
 n79NBxYbfpkNeuRI6WfRsB0f6+WnHuJvVDbc52vsZDn4leqYcJ0OOO5xcyQ6W/0vM
 QvEwdRDsOGlalQjV4e1/4G7Zwa9gQJSZfi3fB8x0GZ7OHRi4vw8+Z0cJQH6o07FcX
 KjchuD5D1b+hg9mI+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5VDE-1rrQpy1NF4-00sdzf; Mon, 23
 Sep 2024 21:46:04 +0200
Message-ID: <89c4a5c6-d83d-4b7e-9a92-99e382e6061d@gmx.de>
Date: Mon, 23 Sep 2024 21:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] fbcon: fbcon_cursor_noblink -> fbcon_cursor_blink
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-fbdev@vger.kernel.org
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-4-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <20240923155749.30846-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:514VykyFi//VkqO10DgrNjzFMAZTjtxsFbjSL8c2LF0zrfmjK+V
 bCUaZtw5JQ+VTazgMC5KSUGfffja3E/1WnfEOdbGCQ1JeipSVDZ/eLjU7uxnqLW3+tQdvFV
 gMQp0H0AYkiYL9360Hs3dnAcmxtd9vJhrb85hxaoDNxcPx/e90NiPfF2LwddiuMgnHVPojB
 MIGi2Wax6edE05wUzXmkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vJhfuYm/nVA=;I79/TTuVEZFi33se62dwblsKXi+
 +YHaH5zsItXUKi0IWXC1bZ704i4XxYHL8ljgKdxnWIoJLAhOhlQVPLc4a4Nx1dSk9glX+ZmnS
 u1CLa6f0xAygtQGpRkj7ZYB2/IDmfdI71bVp83Dn5TwqhlpO8WphD8DvHpEIir/J8HyUToxbW
 jI4fAol6A3k41+uIdIwMNXIJTkXm/+RUVPIFZHD/eBXEkckDLU3NhXbiXWBSoAkV7yjTcW1ZT
 7fL0xPTsDxnV6ebLSUY/wu5GF43uje4lSCStu7HY23CrostJ1yYoDGxzcXQ6vNHsaxCW0UvTm
 /r9x4hoHxhZD2bJ2RD7GvN3M6JrrJEERNfGit9wkH2ysDVItRxZ92rUpyYpelGakXoOInddve
 7gJWUPiygwy7WVRKfVN7abUgyllAujIZpesgZKvwgaVLfNO02VNNPe/sHCWTynnfSGNvNjBn4
 axv3UQ+iv8DtZyQqjZfCpHvcw7mYr6bVSgFJEtzLwm1dd5g9lmjfe8WlHAScmVg1/8PoYgLpi
 2Xvw79GA6q0oz+4cuNSLaEbLcpUEPzeQJ2E4TlH6MHShHzjeaR4Y89NFxFJV8gk+BCs+9SD7F
 LpQpzJerrQQo5iRw8HbaYziSyq2mKhxyOrK0wpIOmJXJE9tY3xXS0bcbyEfPLegtcOf+9ztiK
 /gwLlzHXtkoLEcxQvgcv4U9rKqxf8GUZpolO8p3J7PXTmu0RcVhhWtkjnsbYmlGSsqkztZgre
 xgu2iMDTORb/7++J7H21q2LM2b6yn/K9om0lSchUs1n+2ZhhWMv/lD3QFuL21xcgLQwSZBvVR
 0ZlBBhxrdiOp1xnKrBxgSH3g==
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

On 9/23/24 17:57, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Invert fbcon_cursor_noblink into fbcon_cursor_blink so that:
> - it matches the sysfs attribute exactly
> - avoids having to do these NOT operations all over the place
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>   drivers/video/fbdev/core/fbcon.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index bbe332572ca7..eb30aa872371 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -166,7 +166,7 @@ static const struct consw fb_con;
>
>   #define advance_row(p, delta) (unsigned short *)((unsigned long)(p) + =
(delta) * vc->vc_size_row)
>
> -static int fbcon_cursor_noblink;
> +static int fbcon_cursor_blink;

Shouldn't it default then to value 1, e.g.
+static int fbcon_cursor_blink =3D 1;

Looks good otherwise.

Helge

>
>   #define divides(a, b)	((!(a) || (b)%(a)) ? 0 : 1)
>
> @@ -399,7 +399,7 @@ static void fbcon_add_cursor_work(struct fb_info *in=
fo)
>   {
>   	struct fbcon_ops *ops =3D info->fbcon_par;
>
> -	if (!fbcon_cursor_noblink)
> +	if (fbcon_cursor_blink)
>   		queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
>   				   ops->cur_blink_jiffies);
>   }
> @@ -3214,7 +3214,7 @@ static ssize_t rotate_show(struct device *device,
>   static ssize_t cursor_blink_show(struct device *device,
>   				 struct device_attribute *attr, char *buf)
>   {
> -	return sysfs_emit(buf, "%d\n", !fbcon_cursor_noblink);
> +	return sysfs_emit(buf, "%d\n", fbcon_cursor_blink);
>   }
>
>   static ssize_t cursor_blink_store(struct device *device,
> @@ -3230,7 +3230,7 @@ static ssize_t cursor_blink_store(struct device *d=
evice,
>   	console_lock();
>   	idx =3D con2fb_map[fg_console];
>
> -	fbcon_cursor_noblink =3D !blink;
> +	fbcon_cursor_blink =3D blink;
>
>   	if (idx =3D=3D -1 || fbcon_registered_fb[idx] =3D=3D NULL)
>   		goto err;

