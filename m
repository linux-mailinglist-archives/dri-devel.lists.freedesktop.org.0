Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30475AD7D77
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 23:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9740F10E1D5;
	Thu, 12 Jun 2025 21:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Oy74bZvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5B510E1D5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 21:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749763564; x=1750368364; i=deller@gmx.de;
 bh=kxw0fDxE1DLcs4cB4WirXHI7QfLiYGW8x1EO2EU5Z44=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Oy74bZvZX0Zt6VpleUJ5umjwfFKUcTKeBRaRtk4jnPuJQEb/eYtXNAV6nIpYq5Rf
 +DApr5NEkJgyQYNWZnpb4Ek+UWHIND3Vtz8Xg5/d8jlbdLwDYNriymHvRsdG7sC3u
 QO+cvXhih439vA1KZcZVVKergs7xY3JqtV7Hg7v2aLQnq6RXjpkh6pJyTLj6qt2p2
 sMXvwFLkQKnpJAkvhk40bjfG9ts0GwvBUNkfj9K3W8RE6l74wpEol3LLFrtRPceyj
 JZUSsusbkF8TKXqdhT3CxoGenSPmoy6iZcdacQ4Ezdee9P5gGI1zno58JbzL27wcm
 EeVXw6Tblt9GgxwXZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGRp-1uBCpa46QP-00WmDh; Thu, 12
 Jun 2025 23:26:04 +0200
Message-ID: <8ff0a7e8-9e6b-4807-9bcc-9a487ba04614@gmx.de>
Date: Thu, 12 Jun 2025 23:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] fbdev/viafb: Include <linux/export.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250612081738.197826-1-tzimmermann@suse.de>
 <20250612081738.197826-14-tzimmermann@suse.de>
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
In-Reply-To: <20250612081738.197826-14-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8PlDOCIkbTpR9D9RQeXztcW/EqGKsQIU8miAy6Yi0cJK2pR+o7Q
 zxjauBwKS7LyhaH+OVVvTtRPo+m2oIScY15u2Cq+C9yCqsvuv5Pnc0IlQhQNmN7gnvkJ/vF
 LavMHESkIVy6KN4bZMm7h4P2ePGup0OmDcHqVlz3ZMdfE2csgI/zULbc3YDwclgfOHrWua1
 mwfu7OG5qmbK44CoumQew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3+AT/Vnfu0A=;NU+UsBFbN3+neMIJRUJ+UwJ/H9n
 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
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

On 6/12/25 10:16, Thomas Zimmermann wrote:
> Fix the compile-time warnings
>=20
>    drivers/video/fbdev/via/via-core.c: warning: EXPORT_SYMBOL() is used,=
 but #include <linux/export.h> is missing
>    drivers/video/fbdev/via/via_i2c.c: warning: EXPORT_SYMBOL() is used, =
but #include <linux/export.h> is missing
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/via/via-core.c | 1 +
>   drivers/video/fbdev/via/via_i2c.c  | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Helge Deller <deller@gmx.de>
