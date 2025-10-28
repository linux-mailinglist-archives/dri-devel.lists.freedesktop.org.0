Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF68C16E31
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355F510E143;
	Tue, 28 Oct 2025 21:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="syYrNjEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DD510E143
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761685959; x=1762290759; i=deller@gmx.de;
 bh=3NqD6sQdAtc/r/zkMijw+9xchBXUUtHVXaeJWtjm+c0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=syYrNjEYlbU7DxsVL5cnys4FITu4EFAUHS1C5MZ/fWBwX40oM58twzBXc7GAFN94
 9vtOLO6yfqoolLqIgHcG8zSYs1jmNDfcAVH+uLnnwNA8nvtUa13+hbYORXwYZgtZ0
 qlqdIEvdQMn5Xxrul2O5pGaKwK69tTVT2PPYJOeTm8qExMlXSHUlvbbAKnzO9tngy
 BgorJBpwLKy6SN+Skx1uLXVNLWZVbyvJBAHUU1W6tA7OOiw/pqVQHNsprMFixEn9Z
 fD3j7/nVZQSeqnxII0U99Gjp3v1my8GN7YEOkrnTq60SpVpI8DEpwNlbFwQeBlQop
 XtQyYBIiEJm0dwfcsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.74]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzBp-1vVFFm2q6D-00IiFX; Tue, 28
 Oct 2025 22:12:39 +0100
Message-ID: <9e81bc14-39e6-419b-bb4f-67d8d2701025@gmx.de>
Date: Tue, 28 Oct 2025 22:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fb: Fix typo in comment
To: PIYUSH CHOUDHARY <mercmerc961@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251019183508.20804-1-mercmerc961@gmail.com>
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
In-Reply-To: <20251019183508.20804-1-mercmerc961@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oQuDQB1onN+CNMAHfFQxqVkvqoJNGeLLNZIdIA9Z8G+fIzcAgBQ
 pJ6VgGsVzVbOsry+3Ad9R9vJHGL+oH3PGbRrm9HFot8jv9aUmPU12s7JcSHfOOMIwwa2lQp
 8d5wgky9hoVavahspBBq5shrbRug14vLxjWvH7PKITjaOyK0epyElanNn83fo8z6kOle+OE
 +2suwqMuWpGLlQLsjnZzA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1begAWGVgWg=;UZhCi6z0t07ZuIMgp5KOdRE4aIk
 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
 xzq9oNlKwJt0Y89hpp7OX7jQXcjrA+MF/kI=
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

On 10/19/25 20:35, PIYUSH CHOUDHARY wrote:
> Fix typo: "verical" -> "vertical" in macro description
>=20
> Signed-off-by: PIYUSH CHOUDHARY <mercmerc961@gmail.com>
> ---
>   include/uapi/linux/fb.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.

Thanks!
Helge
