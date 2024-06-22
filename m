Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356DB9132A5
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 09:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF09310E16E;
	Sat, 22 Jun 2024 07:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="JEscMpFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C45210E16E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 07:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1719043112; x=1719647912; i=deller@gmx.de;
 bh=dLgWteFmfrhKmfTLeLJCw6alZp9VwXP1tQjR4lYSMwo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=JEscMpFkTEtYNsewWj9juMfE1RMonnEPnICAg/Idue1ENTIRyLvBDo1RYGRJTAvc
 /WVVvuHYFGy+pV8S9r4M2IKLf4lKyNJrPodI1GqzE+kCsLOHOeRv0dSoi0gdDyXF7
 fmxOUbiH7PlZ+/4/yBQ1fjCpNHQDtpOIZFrYX4IN7NH8Ma0uLgMh5aqnQBI5GCUCL
 BVmGZyM3zFbunB9nQni0mwNW8EdWcupxux7KdDE3Lu8wvrqI9P+IvbpBMTIgeGld/
 imdfVjOtWzSUnrm7/IpGWQQ5wSx5DR2G2Uj8SwAzyxJw7aYSahpR2A2q4xwAL+Rrm
 6ykYwD7ahXkC88sbZg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.133]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7iCW-1sOlRF3jcY-00tDqg; Sat, 22
 Jun 2024 09:58:31 +0200
Message-ID: <0d7a6ba6-1140-4382-bea6-fd245ad8d7b5@gmx.de>
Date: Sat, 22 Jun 2024 09:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] agp: add remaining missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 David Airlie <airlied@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240621-md-i386-drivers-char-agp-v1-1-fa03ec5c86ac@quicinc.com>
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
In-Reply-To: <20240621-md-i386-drivers-char-agp-v1-1-fa03ec5c86ac@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+0HJdkiH3jiJ484z2CjK8Xa4TireGSzODV9QCdJj9tuameFW1BR
 G8vTIBKTufysatwTntkGcmxmMgO5b8H76RgMWt5pbQKgwfOCqwrOQqNbAANbLMUCNsi+T3L
 jrsmSW+jNyxW+nRVCH+oa6WZ9hUTDu3uQWNd6E/AG7qBN+JzHcUo2dcT/1xNaH0TRxkfFxZ
 AnIRp0kuHviqOjCT7yKjg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7pZcWNDPI7U=;OB73/8rcte2HHmSQQfX55TgbKhS
 TdKbSXG4LDejgWwR1VJrL9TvH0pqm1CZwb78I3JrRSI5dfvSZoIcCiyCFF1pESGDtmCiefa3y
 UZCm9rKqy6P9r7LXCseMP1vlwo5an3bN3Mi7MQG8Smr31bjacP2LMbjG+Wfe18zrNfY08O/7V
 qbRn3gIut0w84kjbftWrXuPFMZigUrkZqf/VTCgnGzlRo32oB7Famrq4/tNNIGU1Yd9f3WJkH
 pzMB+lbY850TpEPMsXMatevJDQ/Nr0MJgf1Nnrk0mUq12F06Gr4yiYOJNx71ju6DUyLIcXUfk
 ec3NkdyjvySOhioGoAws9BZt+F+YnujQ9dO1ZSJG2/hTF9iHXpJCErQ/SeNFGYLg42upwcAvp
 mlSFn/FeYADVwPMFn0Jc5Idhkal7p8fccs14no+O13blfa+Kc4udLOxBkEw1Ya6LQlqAN7+Mj
 GrINeqx9GhGk+cjVuUJ8vm8oo9ziuF7OVkhdMWVrF8lhqD+YcUyONzMuSGJMxluHzNUJbQ2At
 kbJhJGYS/wdJmUqtnVbkBajOSIY1qYwynKYyEU7HURy5FJj8dXySSQbELjhM0kD/wN1JYF5nV
 QJOBSQTgNU8mHmstrPxv8BucOI5Yee3337Ybf8tSV7AOQZh4GCKN+2gwaEzcIAWM7BMrwS3/I
 tLGpDSOxLa/dFCVik2ZI7DHkW5/hz/n2tF+fDV53nY5FiwFXRJqWxOrgDQwhczQMPOnm6j3fz
 4aRI7nK2w9bI5ttC6r4jd4QHSxck4RJiyfERPh9dk+orYH9frGZJIJVbQWvvh+DUPjjAfpJh8
 S0f7MWLhegwsLJ9gWQ5qKkqa3pIcUzmE89zLxarLEZC6M=
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

On 6/22/24 07:14, Jeff Johnson wrote:
> With ARCH=3Di386, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/ali-a=
gp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/ati-a=
gp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/amd-k=
7-agp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/effic=
eon-agp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/nvidi=
a-agp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/swork=
s-agp.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
>
> This includes alpha-agp.c and parisc-agp.c which, although they did
> not produce a warning with the i386 allmodconfig configuration, may
> cause this warning with other configurations.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

applied to fbdev git tree.
Thanks!
Helge

> ---
>   drivers/char/agp/ali-agp.c      | 1 +
>   drivers/char/agp/alpha-agp.c    | 1 +
>   drivers/char/agp/amd-k7-agp.c   | 1 +
>   drivers/char/agp/ati-agp.c      | 1 +
>   drivers/char/agp/efficeon-agp.c | 1 +
>   drivers/char/agp/nvidia-agp.c   | 1 +
>   drivers/char/agp/parisc-agp.c   | 1 +
>   drivers/char/agp/sworks-agp.c   | 1 +
>   8 files changed, 8 insertions(+)

