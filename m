Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23798BC6D40
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 01:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF6B10E0C5;
	Wed,  8 Oct 2025 23:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="MiwYWopX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289B410E0C5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 23:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759964439; x=1760569239; i=deller@gmx.de;
 bh=oGNozWChSB1vGn3oUw38sAD1O0YAKJ3kA0JV+k+BtzI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MiwYWopXeIASq1phNNfEk0XLTFxnQeRSfAB1nZ2D9KnryOq4DRNdr7wuY1a/S5K+
 hY5SaM1biveusjXCSa6jhCl3q/33ol8L5QwE6dEuSXG8/p/rvUXIQluAtwndPGvc6
 CQY68IABQzWX3ynZEXpqHVAhSfY1tbovwH9O0bwoRyl58RUJuXj+c0R1dbcrNBaTG
 w4YSvGWxp8W/qrocu9DJ+iPTcIB45y/AxwsJvZMH9FVGf6fFHTHtWGWg4yvtNc3QF
 FrpS6c+zJf53dQnnJwPW1Pgw+oej7b9OUj1vIfyZJzKZyQQTzugupw8quSI4gebEi
 m+Ik4r4DxKnZGTgWWQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.53]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mdvqg-1uVdy50NTa-00aEkT; Thu, 09
 Oct 2025 01:00:39 +0200
Message-ID: <4ff70fea-684a-4038-b98d-a9fd38d02f3d@gmx.de>
Date: Thu, 9 Oct 2025 01:00:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
To: Javier Garcia <rampxxxx@gmail.com>, u.kleine-koenig@baylibre.com,
 tzimmermann@suse.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
References: <20251006164143.1187434-1-rampxxxx@gmail.com>
 <20251008183627.1279115-1-rampxxxx@gmail.com>
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
In-Reply-To: <20251008183627.1279115-1-rampxxxx@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6MApAU/96HTR7KpqS1EiacJ3zU1EmI7L1RgLKRzDO6ozmQ8DCiD
 BjjLgBy1w4qRIPTtLtXXUtclydV8UM0QSzP2/4C8/9mcNdQUT1HI8mfYV0Njp5UqmwFgjOj
 mGiu4q+21rCfxmSKSMxt073/wDPABmnCEVSlZy6Lp3BUI0IwXGnPxfZThu4f508Ugnwu6XJ
 YSgv83NcisZ8plZLwqZPg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dwHGYwHcYOw=;bHJ8+DZv4nzWoX2Ef1Wzjo6pCJX
 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
 je3UXMo3qzR2zw==
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

On 10/8/25 20:36, Javier Garcia wrote:
> This patch wraps the relevant code blocks with `IS_ENABLED(CONFIG_FB_DEV=
ICE)`.
>=20
> Allows the driver to be used for framebuffer text console, even if
> support for the /dev/fb device isn't compiled-in (CONFIG_FB_DEVICE=3Dn).
>=20
> This align with Documentation/drm/todo.rst
> "Remove driver dependencies on FB_DEVICE"
>=20
> I've not the card so I was not able to test it.
>=20
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>

applied (with minor changes to the commit message).

Thanks!
Helge
