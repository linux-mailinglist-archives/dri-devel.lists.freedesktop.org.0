Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2498497F14F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 21:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DF110E295;
	Mon, 23 Sep 2024 19:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="HzthYCsA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F72510E295
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 19:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727120653; x=1727725453; i=deller@gmx.de;
 bh=X5Nj79J5TT7jLCEldh0sVMpe04Vf6k84rEkhYEtikG0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=HzthYCsAcjr5N5v2VYa/hOmJf6Tz9anzvjFV5gx3lHMH1qkZr64nhOAiC72LbmIC
 VhMhLWmbsA6CEU+eFHqOAlmtgivXodjYM+tN3z5qTwLFqC6iPoL6LKqudSWunFf18
 uIPldH3YMHvDnDWvIVjA9H9WZSTPvPmZKMPuj1YDRw4HpUps/6m3if37JJ4w//zHM
 W6DGoG98U2jVn3PPL/2LE8YxPxn8TrSbcZfLj5Gb5+6bXu+J0+qje/Xm70CvEcbeK
 UF2Gb4LFig1HJJyVw6mkYPzOe84IdSwI+RY44JHi52GAVYuPK9/qdusgC8lFgPG7h
 2a2oYF1PTVUAw8yJXQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6Db0-1sqeBh1yDA-00DYo5; Mon, 23
 Sep 2024 21:44:13 +0200
Message-ID: <6aee9b03-af5c-4aff-b4a3-4e7ba84954dc@gmx.de>
Date: Mon, 23 Sep 2024 21:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] fbcon: Introduce get_{fg,bg}_color()
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-fbdev@vger.kernel.org
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-6-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20240923155749.30846-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:StLJjMKgWH5jwQwNNC64TDd6fbNtHSb0zgpyt1dshhnLVgOvqkh
 k9efkLHfMHGxPBKhk6A9HLxiSWJB+afjUKMDqPUnljGg/LgpLOTbs1QQHOkFysFGl1RdrJF
 fwd0lXm5S9FbqK2Nx1LW3Jij733FvpwM4pdMG4ktwqamqiKiGLsR8qBMb/swsgBKA8LFuWg
 +R+Ay/rBpNE98nB3aR+lA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/x8pI6LUJ5o=;6/9WFJr2U+ULcqCTqi3xOD+s7Vp
 e9LJFLLjQMWBGir/zdouQuvYd7vWIr4kLt2cz212fEamHRyR5qKsPCG1a3WfaclH1ysfEiGDi
 9aJyZWMS/jzIq+/EdNZAGkxFkoiMER9XZNkAcwxEiAXku9MfgZGlcVL2e1k0Hrc9Q7jOKdqS1
 4vnC9CSMNebNCZ0eNokPY71lYeROD6OMLwMVCKKiTW2XZjEQnJGOiipIaLESRBh9kptBHmJMb
 cyvdljKyCkyGGE4WTwYKKOUH2O+1TWoflNUKIUxAVT/8mdfzcqKrh+HEqaVwPf/ArHNhg9WN3
 V/K84ZF4RHLSNxra8jAq5Cj45o4oWW5LdATyzuoDU6Ly5V+XzcRs+mwYbbHCdZLME9SHlHpvL
 q39a5NudM61c4H/lOYL+eAhX4eO0biQmTDoBt/l/xpeSVLC8JdJ85DJxMWUiDeq7UPv71ZCdy
 H/GbkYdpnXNu2mDp/ob03p4aYLgKa97gqHJSwC2//m7qmITfS/3t9I5CypejKegaNzGZ737F5
 vDSXUW1dGZYkISHWf+pIhh0vnR8eMnyaBOno97oCH7RFDn92rEi/u6yBX9PBEdzzClULUZdG8
 FOTz7juKfERq8wvwSFZbwMtVgvCkxUfE19QndzkfffJfc7BGAJHtOkK2tz8vI0A/p4iESPGF+
 fizRSCUtkAoTizuTCv4NvOJ52d+T/C8hlIHr/qqM3JFsrOjh5q6Nqz5ZdUU7mz3KxnzzV7jUB
 9YFx8Es/5uyRQo4PTwdjF3tFmZny8PdDHLkX/uI/iB2AB0hjzZSxeU9UksHAk3x6/uKeJ9G44
 ATjm5vse2D7phDXUOHJn40Jw==
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
> Make the code more legible by adding get_{fg,bg}_color()
> which hide the obscure 'is_fg' parameter of get_color()
> from the caller.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Nice cleanup.
Acked-by: Helge Deller <deller@gmx.de>


> ---
>   drivers/video/fbdev/core/fbcon.c | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 2a78cca3e9de..17540cdf1edf 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -356,6 +356,16 @@ static int get_color(struct vc_data *vc, struct fb_=
info *info,
>   	return color;
>   }
>
> +static int get_fg_color(struct vc_data *vc, struct fb_info *info, u16 c=
)
> +{
> +	return get_color(vc, info, c, 1);
> +}
> +
> +static int get_bg_color(struct vc_data *vc, struct fb_info *info, u16 c=
)
> +{
> +	return get_color(vc, info, c, 0);
> +}
> +
>   static void fb_flashcursor(struct work_struct *work)
>   {
>   	struct fbcon_ops *ops =3D container_of(work, struct fbcon_ops, cursor=
_work.work);
> @@ -387,8 +397,9 @@ static void fb_flashcursor(struct work_struct *work)
>
>   	c =3D scr_readw((u16 *) vc->vc_pos);
>   	enable =3D ops->cursor_flash && !ops->cursor_state.enable;
> -	ops->cursor(vc, info, enable, get_color(vc, info, c, 1),
> -		    get_color(vc, info, c, 0));
> +	ops->cursor(vc, info, enable,
> +		    get_fg_color(vc, info, c),
> +		    get_bg_color(vc, info, c));
>   	console_unlock();
>
>   	queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
> @@ -1297,8 +1308,8 @@ static void fbcon_putcs(struct vc_data *vc, const =
u16 *s, unsigned int count,
>
>   	if (fbcon_is_active(vc, info))
>   		ops->putcs(vc, info, s, count, real_y(p, ypos), xpos,
> -			   get_color(vc, info, scr_readw(s), 1),
> -			   get_color(vc, info, scr_readw(s), 0));
> +			   get_fg_color(vc, info, scr_readw(s)),
> +			   get_bg_color(vc, info, scr_readw(s)));
>   }
>
>   static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
> @@ -1331,8 +1342,9 @@ static void fbcon_cursor(struct vc_data *vc, bool =
enable)
>   	if (!ops->cursor)
>   		return;
>
> -	ops->cursor(vc, info, enable, get_color(vc, info, c, 1),
> -		    get_color(vc, info, c, 0));
> +	ops->cursor(vc, info, enable,
> +		    get_fg_color(vc, info, c),
> +		    get_bg_color(vc, info, c));
>   }
>
>   static int scrollback_phys_max =3D 0;

