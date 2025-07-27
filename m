Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E77B13048
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884EF10E177;
	Sun, 27 Jul 2025 16:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="HQgO5h6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B4D10E177
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1753632557; x=1754237357; i=deller@gmx.de;
 bh=tNBWvJHlkTT8By2IleRLKit1kxix2PmFf3MHHcdu/9E=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=HQgO5h6p9r6FoGH/N0xPgjT+rI6bfA3S8TVaz7DxCW1SLLfys77RYPm2E72NxSlS
 KvTLkfTpSxv1HAgxskD/LaWAF6xMubI7jE/KQPb5OQ0l72qNvS4Al/g/FJr8ZMcOp
 QTb7a/6BsiBfEvA+aFu7WeNQ/52cee46CiNDpIUEUgnrcfmeqFImYY58DqmBnMjHn
 x5fVigJ51Zam20agqV5CZTd2ipjrr6tAGm15+WBW7qaLuINiFTiekQ39NWZ1w/SaN
 JPk80FjwfL1RDGT3UEzGJlSY4H4F4fNg81lvgiYEPb5GbM22QvZxU0EzQD0kF/2xe
 QjHAyrCMc9oNr142cg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU5b-1uB8py0Dch-00d8h8; Sun, 27
 Jul 2025 18:09:17 +0200
Message-ID: <81f66a18-a541-49ce-b840-ed18f7637a5f@gmx.de>
Date: Sun, 27 Jul 2025 20:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: svgalib: Clean up coding style
To: "Darshan R." <rathod.darshan.0896@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250721125648.27179-1-rathod.darshan.0896@gmail.com>
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
In-Reply-To: <20250721125648.27179-1-rathod.darshan.0896@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DIJ653D0F5xynzq26/6UHkSIMl8NuQUuWt5zGYWYks7+8I7eYJ2
 yZRsMTlsVhG6hWh+9Mr8gDb//8MkmXcMOJMUJD1JB7vQrXT6+ALTX8dwJkayvy6O3A0vVkk
 eovrhIeXXGS3PVk3qqc3F8YovboQSiz0F9ZTVtUv6RLlSh8HHGNSCqdHMsol2yfFyaIeqhC
 JKPWfLyyQJKNjjBBSLFxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mcQPtSnKV/4=;UT66TkGq+8qpFWwFmzaWCBRyUIS
 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
 ja8hMDCIuTogUUKHm34w==
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

On 7/21/25 14:56, Darshan R. wrote:
> This patch addresses various coding style issues in `svgalib.c` to impro=
ve readability and better align the code with the Linux kernel's formattin=
g standards.
>=20
> The changes primarily consist of:
> - Adjusting whitespace around operators and after keywords.
> - Standardizing brace placement for control flow statements.
> - Removing unnecessary braces on single-statement if/else blocks.
> - Deleting extraneous blank lines throughout the file.
>=20
> These changes are purely stylistic and introduce no functional modificat=
ions.
>=20
> Signed-off-by: Darshan R. <rathod.darshan.0896@gmail.com>
> ---
>   drivers/video/fbdev/core/svgalib.c | 95 +++++++++++++-----------------
>   1 file changed, 42 insertions(+), 53 deletions(-)

applied.

Thanks!
Helge
