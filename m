Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6A29FA42E
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 07:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6858F10E15D;
	Sun, 22 Dec 2024 06:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="HukecmDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA6810E15D
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 06:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1734847532; x=1735452332; i=deller@gmx.de;
 bh=tclHqGZakrwWWC3BNqRNF0lu/5w/slKu1fIr1igTWmM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=HukecmDhbSadmUfoHCrtDv57I5d1csaNwm6fCAMy7w9Krl0BH/tBJQdpAiquQ91d
 pubeJUkQNQcOtlvygwimbR5lnhnqQB4vtAyV/svkbSD/EeuG/uceR1PPd2N7pVqk0
 PD56bmK32lwhd7dVlhwZAtmSPhhC2qVluxrVHgVfIIturxjVhgrIeEhK0NOUivaai
 l8sffv8xj796AeLJqw2OrPoudRD9pAfH/gwEKpwWq8BcwtC09K3mEfy6lA3R7ruQc
 /ok7wvIT362H+Vz/9g2MMP2PgqHtsNMiUNB8Cb7xDVBLbYdvIddpkqirffo0Be22o
 9+9RIXap4psoFR/beg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiU3-1szgwr2HDJ-00UK4s; Sun, 22
 Dec 2024 07:05:32 +0100
Message-ID: <c731fffa-c209-4f12-b129-9ddab853a8b9@gmx.de>
Date: Sun, 22 Dec 2024 07:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/radeon: Use const 'struct bin_attribute' callbacks
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241215-sysfs-const-bin_attr-radeonfb-v1-1-577bcffa1100@weissschuh.net>
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
In-Reply-To: <20241215-sysfs-const-bin_attr-radeonfb-v1-1-577bcffa1100@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7lNv9x967yupb5iYp99fxC58Jd6ZOqGMvm265MsQctIjm/Kqpw3
 scHe0rhM/KvuyBCVVUExOuHsPhAZs79RmDh960Pw+vGuByC4OgvY88TnGHHxuZSagiowAXh
 jayvD4T/bWdHigK0Nqj+0W7XniJX+T5eytnOB5wrJbddRqhHkVJ0kEWMqLEdN6tbNeHzeri
 qIddd+ENNBj7Xnm/Gm1Jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f7E8WZqLdUs=;kbhDw0axOpUJywTyR6mgPX0ACsn
 xFvT9mzvErxMsFS7dhQLTCMceIdNWuhl0ZrzGhrt7NQCbEZvHs9MeHLRXOcEwUZPfGdSqjtna
 FieEb6o+dGls0dRiaF6ywiZEwrdiK6yBEukqZ45S0UMyzXUo2GoIWOF9GdBBbNVF5yKmz0aAX
 H6zxm9zyzyNd5Ew2n1B21AK7kWIkv8cCubc7hGK2fIS77XCIAVZgvtDeiS/uxiOSdPl2WbRQB
 DHLvbYxGr1dHgaX9ms/WsumtmALYycLyiB/f5Ya8ffjzMxhtGAm+qTzTC6f9AXCrYDrD5zzPr
 PZaP6b2LzjSCkS6PdYUXWFq9ZQ2a/xV9rv6ug/dWhCSGFXoZVuAQGYj5um98OXYXHbT7q+pH6
 7K6WqZhJ0wofOx4rLvDv0SQ63GNfFL/LMwT/fz7wXkhB5iJVLYc4XsonrpjkX8JlkRiL77R6y
 DUOuY3lS1aCw4HTbPSaZf8I+WkZiLxgPYM53dWYXZwFbUa9wsBb4soOEj8aOfZgxh7dodEIhj
 n9T4SdilrsYRbJlk3BxS4NueOIvPJKlJKBPrMqv8uNue5LWDB9NU6CNU+qGY+qPuAHrqFiij+
 V8cSDbXw+s2ukEcPnxZsgqnZOCdlwlWQ99HqEyHfBCKIT2Q/GbsoP1P7ZniubAbIHD73Op01m
 5F7mJeXhizoxzrVEDO3esKOwsS+IfYtUiVE4Z9uQcZ8Otap9/zMSn6sWddXj7afHlFbdQNcP4
 i5RYzQLPn0ebLqLA7nAjXuKQnrgwECZvCP5msb6uuJW2bkn2ls+8B6W15ZmVyY/EYPGOQ9LnF
 yg2Q2Ed3AyFbzHNxJ77GRSRvjcE+SfEBeXmWz7jm87Ii+gVbQr2TAIBtS5Ui5iDjqEcNqfqxK
 YIs5yWBWvJeMked+TsgK+jmqUmGXaSYugSkAd5Qp8cL8+ROhAaS6gIx9SpUH8hJEmt7ZjB/74
 wR/AUwHXAl+BW8mSNx8ey1xmVbNmDkZiWk/qLQtXuOHOSHdcsudIfSHGb+UjpDr1DeztPW9JP
 jLaZbxSHP6o1ykCmajezc1WuxsB5aBgLf7otLLo6rrWDDZGx98SpaiQuX+jOe5xrLvJVnpTHu
 KsgBG0sQPmjOaI4KEgT+pS8sIgtzMI
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

On 12/15/24 15:58, Thomas Wei=C3=9Fschuh wrote:
> The sysfs core now provides callback variants that explicitly take a
> const pointer. Make use of it to match the attribute definitions.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   drivers/video/fbdev/aty/radeon_base.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

applied.

Thanks!
Helge
