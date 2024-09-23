Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FF897F15F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 21:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCAD10E482;
	Mon, 23 Sep 2024 19:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Em0R3xzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C54710E482
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 19:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727120835; x=1727725635; i=deller@gmx.de;
 bh=rF+a0I9rBNuE3r58vBh/IFWzN5nMqdh6xC86iaOFvIo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Em0R3xzjFKHJ3iwg7skcG+zKJWiWzuOWFaNdFkzYJm7LXz6W+Lva8TFs2f9BYShl
 tia7tLnx1szBOZkZB9Ha3jOEgOjsFChP+L6uvu6r0X+WvDM8Z1rCt7wHfujisu2Lp
 34eyQbYxpuMZQZygkNWtt2Ynmj73xYm8zkw6Xu+UrPdSVbAh5yHTx9YayT79Ga4Rb
 H/wPPD7+8yvbJGXqnfRcfN9JUBqlEaqiIad7wpdSUdZbJyUgwttGhavn5VGm4nwMN
 l5114DCHRYxsAxkCpJCL942f9bLJwIajKaAxApDL1GAq4Idx/obiMNOiB0j3U3xZ0
 9pfkc0ES4yYLHYYPHA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQiS-1slhlF0xXy-004FAU; Mon, 23
 Sep 2024 21:47:15 +0200
Message-ID: <4cbb3fc8-b164-4a29-bd9f-f05fcf534ff7@gmx.de>
Date: Mon, 23 Sep 2024 21:47:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] fbcon: Use 'bool' where appopriate
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-fbdev@vger.kernel.org
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-7-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20240923155749.30846-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IMbevpbM/goG8JO/e5t/WRkQh9OvSf9Dqb8n+962DWnEMVr8r/U
 WoDSjf4gERcXWGvMly4YJ+N5gPLntgkCn0XhdvQzNsl0bWWOSGUrl0Q6tuCTBVuLC5jDGSQ
 ul8KZ51wPnyzJ+CHOIH1FCfL2Mgg6Xyua8r6+chltM7raY6XU0QorxZlm/4tU3fYDZSLWCJ
 cT1dyOkGSc5eNDSfyruqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G0EL9e/cZ8c=;5HEL3yvslbMhXwTvqytkAs2/66n
 8t3GTNj9JjyVnnNS2aJ2RtS3aRPSeCjjZT1icNkQEklczqnjBiQalZ33tipwdfXJIYIVHG1KM
 u0mygIioeyaUsSsKJ3wF1v+qv64SdD2kZCEbNyvM7yg57lgJ5RbOY7ySLZq0+OSg093jfTnmN
 54O3JfIlh5Ye96dd5aSHnBhB2pLob8ehySuf7XxO/zT9LNHLJIjpGhw6jc5En7NxDhXqfZ4PK
 uhjj0KEaCiSJm2NerGw5SjAPvuHehCGP7IWNfgeHJwG+cykBA9UfshHGU2gKND/NtC3upR+iA
 +VyJAb/VZae0wf1vqH4UxGpVSJJJa0Lw1Ui9U3KAuEFMw4xdoFnyOuYBZLOqLq7P4cnI795O6
 rchlDs/qu55ks6CHiPoo1x5IPVF8/ETuvatHCM+BiGeT6TWZ1ZD2RQw7Er+btOn+7qjwu57QT
 beZ8mo96upnlSYXTUf/U55wxGBE6QgteGcUQd8GZiEMnsYaN95EzlgqmAmHXZC72SJtAX1rBa
 isDUFZD/RQT2WKqaS3f9StNhaqojB1hqN/s8F0NfEr343HijuEAOCx5/6YzvM4BbDoiRKj+bN
 hNeIyM+r9+I57aoNlCzg+T0xcSGCKGgWxkUppFWEJvAhL9//YwCzG9JapFcsiXXi4JFs12r/B
 aAqN9o9vKnKpYSLT2RhLKxNLv36RAJrc0i4ZJzQn+KdtvshiQ8wiuYbLeE7aGj+RJ78vSi5xo
 5e/XgVg+XpZYW1RbIx7MVVd1Z1M6XO2H7qRDvnSCDe2fuOjXK0JoePBkxI+E1/iPkqQxIueHt
 NZUO9iIObsv8TYhBrHRfMXTw==
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
> Use 'bool' type where it makes more sense than 'int'.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Looks good.

Acked-by: Helge Deller <deller@gmx.de>

Helge

> ---
>   drivers/video/fbdev/core/fbcon.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 17540cdf1edf..03d48e665bba 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -129,9 +129,9 @@ static int logo_shown =3D FBCON_LOGO_CANSHOW;
>   /* console mappings */
>   static unsigned int first_fb_vc;
>   static unsigned int last_fb_vc =3D MAX_NR_CONSOLES - 1;
> -static int fbcon_is_default =3D 1;
> +static bool fbcon_is_default =3D true;
>   static int primary_device =3D -1;
> -static int fbcon_has_console_bind;
> +static bool fbcon_has_console_bind;
>
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
>   static int map_override;
> @@ -166,7 +166,7 @@ static const struct consw fb_con;
>
>   #define advance_row(p, delta) (unsigned short *)((unsigned long)(p) + =
(delta) * vc->vc_size_row)
>
> -static int fbcon_cursor_blink;
> +static bool fbcon_cursor_blink;
>
>   #define divides(a, b)	((!(a) || (b)%(a)) ? 0 : 1)
>
> @@ -281,7 +281,7 @@ static bool fbcon_skip_panic(struct fb_info *info)
>   #endif
>   }
>
> -static inline int fbcon_is_active(struct vc_data *vc, struct fb_info *i=
nfo)
> +static inline bool fbcon_is_active(struct vc_data *vc, struct fb_info *=
info)
>   {
>   	struct fbcon_ops *ops =3D info->fbcon_par;
>
> @@ -290,7 +290,7 @@ static inline int fbcon_is_active(struct vc_data *vc=
, struct fb_info *info)
>   }
>
>   static int get_color(struct vc_data *vc, struct fb_info *info,
> -	      u16 c, int is_fg)
> +		     u16 c, bool is_fg)
>   {
>   	int depth =3D fb_get_color_depth(&info->var, &info->fix);
>   	int color =3D 0;
> @@ -358,12 +358,12 @@ static int get_color(struct vc_data *vc, struct fb=
_info *info,
>
>   static int get_fg_color(struct vc_data *vc, struct fb_info *info, u16 =
c)
>   {
> -	return get_color(vc, info, c, 1);
> +	return get_color(vc, info, c, true);
>   }
>
>   static int get_bg_color(struct vc_data *vc, struct fb_info *info, u16 =
c)
>   {
> -	return get_color(vc, info, c, 0);
> +	return get_color(vc, info, c, false);
>   }
>
>   static void fb_flashcursor(struct work_struct *work)
> @@ -467,7 +467,7 @@ static int __init fb_console_setup(char *this_opt)
>   				last_fb_vc =3D simple_strtoul(options, &options, 10) - 1;
>   			if (last_fb_vc < first_fb_vc || last_fb_vc >=3D MAX_NR_CONSOLES)
>   				last_fb_vc =3D MAX_NR_CONSOLES - 1;
> -			fbcon_is_default =3D 0;
> +			fbcon_is_default =3D false;
>   			continue;
>   		}
>
> @@ -558,7 +558,7 @@ static int do_fbcon_takeover(int show_logo)
>   			con2fb_map[i] =3D -1;
>   		info_idx =3D -1;
>   	} else {
> -		fbcon_has_console_bind =3D 1;
> +		fbcon_has_console_bind =3D true;
>   	}
>
>   	return err;
> @@ -2802,7 +2802,7 @@ static void fbcon_unbind(void)
>   				fbcon_is_default);
>
>   	if (!ret)
> -		fbcon_has_console_bind =3D 0;
> +		fbcon_has_console_bind =3D false;
>   }
>   #else
>   static inline void fbcon_unbind(void) {}
> @@ -3234,8 +3234,9 @@ static ssize_t cursor_blink_store(struct device *d=
evice,
>   				  const char *buf, size_t count)
>   {
>   	struct fb_info *info;
> -	int blink, idx;
>   	char **last =3D NULL;
> +	bool blink;
> +	int idx;
>
>   	blink =3D simple_strtoul(buf, last, 0);
>

