Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2BE9FA431
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 07:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF2410E2E4;
	Sun, 22 Dec 2024 06:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="RpONCtIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52C410E2E4
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 06:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1734847595; x=1735452395; i=deller@gmx.de;
 bh=XtmpZVE4yUecp21o7ynL5TR6Kc9uvktwQXnTqBTHxRA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=RpONCtIvmTpIfMHu7o9qHK+kyxtAiscZ2FT6PGr8f68kfj3y+ehEfV3faL7wthGd
 wFZAhnMQ4qEJ6KDoGpbs6Uz4Er13wGqjhG8OYtZ91P6CNQhXWrI7I17ok5utVsQhu
 pqwxJKhklrJv5n/5DJHL7DvnRYnuIJhmklIe2qfeH2UPXc9x2LiCrVrpS6bC5UFQj
 HZTCgQhlfhltFgV63h+5yVquTxIHgmK1uKbF2genNZSA9OuebuxOhnWs1RDWdDcI8
 6Jc3jbopleeZxABVVZn+4Ic+cO18VT4tLEtzXIeKKLeCf9bRizSbjtMsSHSfbCXp/
 YHGfZhh4WpjD4it5Pw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDNl-1tu9TQ3Ukx-00prVF; Sun, 22
 Dec 2024 07:06:35 +0100
Message-ID: <1b1fd689-e111-4109-b7a9-21747fc1bdb8@gmx.de>
Date: Sun, 22 Dec 2024 07:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/udlfb: Use const 'struct bin_attribute' callback
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Bernie Thompson <bernie@plugable.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241215-sysfs-const-bin_attr-udlfb-v1-1-40e87ed71d1f@weissschuh.net>
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
In-Reply-To: <20241215-sysfs-const-bin_attr-udlfb-v1-1-40e87ed71d1f@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OFx3d7nGb5ClVE9xS8/7+Tf5XCIyN8KKkGyqnkvKTmRS6+wVok5
 J45BihEGH6ONJZMBzHrDnYRkRIUwSrPKIeHy6lmceQxe+fesa6XyUrxk9HHR28uLqG9av92
 e2kIYQmoSxsjYB2wxzpgbK6aPtdUVoin710I9YhdSjL1TaRV6hmWlStNNiJxKkbe7xrdGgJ
 RNPkf7tkv5wNJctXEwtnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3vtUtjgtZoQ=;lEi+qHtyP8EQbB3MtXAtzKZD8eH
 92IqiJHp6cS2tRs9lPkeUN9BITasnQWoiu/QqK3TfyoyPzrZPicKZAarB+FyP4EhEiGn/ejIN
 kREqlZ3Mj7cJJxw0SUFpyN9NzgG/rJMF4d0XP0mcIqt2q2x0zVkOE/ZMajZfC+zmkPK6WWyoA
 beQRfJSlQWkthIxAky61kJ7mRadnuvrwkIVCB8KMOr5bkR0bRmdlWw2Rx6tCujbR5lNjhRHMJ
 vKxYFF28NS7MMW58EkG3JZopskx4WtlYRPFK0ro/cxf2RNEir2Mn4dsOUhKXnWkliujXdW+W8
 S34lbNV3PjAaw2XEsKizGTrOA5oWLC7wqXreKcsAsZXMaYvLk4S+sbu2qMIQ/Tjd3x2VPjw5F
 8qt6nPPO4JcM5ZzsRIZpkhpbcPauXlmMWFDq/sA1rTvK6up5KoOEPQhUjCVY2+5N7NwInadrE
 sBQVMfOnE9AC7uWFWWoAZt/ME/YmPGkFsZnjDaHNaZLelOEulRB77m7SJG2+R8DqR5Cjud86c
 TSFI70t0wFr+kd0nldSYJw0AsK7wQ3DL5c28Yyc2oEM7ve2q8DPlgjsWA70nY99kYIqopSI08
 EyAk26upPDDF+QBeHBrTQNkR28e6xtq9elwGGJfbxnxV6P8QTIK0R6ou/8DN0j8lnzVq32qOJ
 Lkz63MrZw8ehje7qafYYpQPdX28ZeLL4Vzt3ieZArshn9HKfb6CF/MMos/QFosDdUBBycyPDK
 8hClskiC2pjgiW5P0sadl/qAXtMQJTv0/+qPjijsBq00Mkf1RoxZ/NeSCt+29Nb8YLfy9lO1t
 HyBp0ETm9euhbryEazVS/VHvG6bJezIUGmZiL+/NQVHGYYbqhY+EIm1l0V100fVCDVEwhDh0f
 u4QnLOZv00Md9er7UWvVor6+dCnzsnYLm2PkMpV0CbsJBkbGO81tdtCf6XWVFQoVCSl3g8SVD
 sm4iRDsWoiKmHJbdXWaGryAzxolR48X9MQhsC+Hx5LQPbq4wiMoeXg9pvd2KAy4mDKCAp9tbj
 isA0aBcnqqhWyqNAxNviPHDNi5YIDTZokDLbKyP+OS72qTvebcgUBLC4enuY0CAN4NgN9tRH0
 4DUgO8MqH2dAC3TLoT9MvJeVMoiFze
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

On 12/15/24 15:55, Thomas Wei=C3=9Fschuh wrote:
> The sysfs core now provides callback variants that explicitly take a
> const pointer. Make use of it to match the attribute definition.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   drivers/video/fbdev/udlfb.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

applied.

Thanks!
Helge

