Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FAFC78709
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9188210E82C;
	Fri, 21 Nov 2025 10:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="paAp3imy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A408410E82C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763720233; x=1764325033; i=deller@gmx.de;
 bh=AUYZ+FHy+OkjJ/Qsz96W1/vj7q4IVCZCdbgzfj0ocZ8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=paAp3imyiqhHhSdr9FGxA7kfj/dgdNNQjIyyYayanSIXuIq22uWPV/DMg8WdBrlE
 JN+HICYTd1RXUinjhPY2aMNmxjdUMJB1wYB0v1IOf3eimhiUrL08gS9FVQ1O1Aorp
 IT8H3He3uzZ+Bkc/sWoLA1+5VUplCTWUIdRnP97TpxsQemguyhluduWP/hhDtoiHo
 BMg3nyTPLH8JuZE+qiJNsSLSSJBA1DNniW5ih7ZRz7/2r4o5w0ZrsOJKbZeHfdjXk
 aRsPDOZaBV1/u6uP6ekEaZNIsIraf4jqkbCsHJZBavM1afn9UM8Q12kElh7hhfBy/
 tgWo32ZULL0ExqN9Sw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.198]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5GDv-1w5vlk0vGX-014cdR; Fri, 21
 Nov 2025 11:17:13 +0100
Message-ID: <cd870d98-2e40-46d0-ae5a-2299f243cc79@gmx.de>
Date: Fri, 21 Nov 2025 11:17:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/RFT PATCH] fbdev: q40fb: request memory region
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Sukrut Heroorkar <hsukrut3@gmail.com>
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 shuah@kernel.org, david.hunter.linux@gamil.com,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20251120180233.763975-1-hsukrut3@gmail.com>
 <CAMuHMdV3UvDHT0uu8oeiCGc9pURaLPDPmG-Fu9kC9H8DQyqRDw@mail.gmail.com>
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
In-Reply-To: <CAMuHMdV3UvDHT0uu8oeiCGc9pURaLPDPmG-Fu9kC9H8DQyqRDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5f3W+pJxv1yeHw+e3e8+HYVUMI1+A1sWKvZHYpFS8n4k+URysnd
 PqGddL9HDouYPW9CsE8LOYlDTQzKUL6nUm+GTvCQfywEW5W7ouPEDd7WuMSwP72BpmI7pqG
 CeNYsPxvnpTD39hJiBS8Vi0p8u3qHJpSXzjPVcMmvfUZ4VwxVhibqLmdriBjnHCHnFKlHMH
 xpp6b8l2q+eFh1rdtTTpg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QdU6NvWqEFE=;E3kvfLBXvvz0eX8GpKMi0fCwVBr
 NjC2QJauO9N+F9i/WXQ1RUe0148nqAc2ylOBlkXrDYmTfvg5D6A47FjjVEBheMhYkngu+EFMD
 HSgjRXznqstdhKKbm7JU5z5SmxpgL1JTbbnJ49tH9dH14UtsK9Jsw6PTnk3Higt6ZOqeb4Pd3
 3zCB4lupGtjSxtbpdUi0p7xzNbxAUFjUzhrrgHDnw3yUgQl5vJLaQTSQgLz8Te/nsqcxmUmmH
 odQOPU+9iuF/pyfKne9nQ26t7InJ0B7ZcDMrcE3ja7qnHKYzaeRdlA6M2fjbNVacWnd0h/Cta
 hKa3rQzlA5Vq35DXhcAoav7sAlUDNBNsFg7YjwxnxQ6zqyx1/NH+a19zJbnwb4iAonoo0p9T2
 /m5DFCAnP7zjsEsaUF4mVn6dWzo15+6vpRJhS7HWC9dK1JXaIL3PCb1gg608YWOpTEIQ01jmb
 OsX1j2KgyLs4fcOLDxMh8MI0HjbDFr6hmIVvpKBSrZwMbwZMqhw6yDQ6KGqTvvcsXPHSHwiij
 8+ZQ9WGB5ahv872DtsJ4ymlFEZVBIqlmOJuQceayfRPuxTDH8SvqYAxSGqPq4NLJwnAQ5vqAg
 9CVJYCvyUBMMMyOlLzkDMh0Fug1XpcOskq2F9KGwvDaMDSY1TaPml1y1cO5F6l1HHBjmgreNr
 KN7cFqcO4jgDMyL6lp0PjcyV/rmKOTHvrNOUxmFWLIaY5ggqHelJttuP2wQVZxHnd7t5fwerd
 svd1xvN223dttVnWldRqB3YrBlwDPygo3hqE3WZ377iTu6+DJXgOd4hJYEdlGMxA+MOAbhnJx
 ls11ZAxFuv/hvWCpf+/jY8NUsFL23VZNZIQFW3EJC1RfUH4PxLi5u4vsCbdK+dboUrhXDkbxe
 P36KGrvZkkoF+hKV+jgAhx+dfcgqHv2WlFMERT9ayjZYaDpt3Csf0c5sjlFbVxYOnbKuR+CVi
 barUzu6Ts2+k284HfaxhobMpXlmVcf3zXuRLYvD+TATPES4fP0a7Ym4Rq73P/OJCklD9x7aY2
 Kbf0Vswtk4sc9XQcTuz6hyoV0CmyMjww/odxOCKCVFppepomGZHf/Le8wssutXdtkH5/Bieal
 zTprvs5ofNNctl3977nhTvkaNif0yIf+aOJfTJYVqGt4RBR38gVbUiWdFFurA+vH4ULPh18U1
 5Eu9Vt4QQR51frx8c7M9Xw76zH8luPj10kOHsoAmg22t+AdHwetbF6bynAtRlYPRBCYPXqQIe
 KLEgYQeyP/vbk9fD56RkPlVCxEaR1d9FXOkLFTgcb9C51L5LYc+UqxFM72UiQgNcV/+tEOJzr
 yLzwecFvB5FotN4wbpwElNt8t+iDhXjrATrI9tZ5cwfQxtOWZI9QY+I27TaPD3xspM7naESXu
 a16+Ha2eDNbArVlnawv4shX/EWgjB3wWu1EKowzsaGrMStsnldupjKXZsajb6HLBbhtZcQ38P
 hVOyMh1EfBDxmheyapWdya/7RmUyNj9P8QZkp8rQZV1DHrCv9yjtjCx/HJW4McVsRwBfeXGlT
 lRsa39J3ERn4ejpqjPiDO8HhQJq8yGILOCikbGrfzbW1OKjkV//WO38H5OT/GxGLGNv0vU6Bs
 /xalbDDvilx+UcTXga9F0uFXLoazb9aUJewfIH0yX24CEUA9BNx/5L9h/nWxktSL2D5V2nmtp
 TslShrN6ci00zBcsb0S3QDppHaITeFG2G3XKorZuNgOry7JjGSt+cJkJdnpiNkVCVLKk8ceZ2
 j6Y9NGkiElKlX/z7TJGPVfdFK6kEm3WGLK+M4+oC95BIRvGHt0FlyaJjq900/SYCoF4+z4O9m
 oIk/5tSdAfncNNfzOsFzuecARTPGx+MO6zxrI3JWnHQKvQI2rGRLnZJLxb6qqHTKetbnAf+bV
 L+r38k5Nxl6DrpvtpzrHxYqS+9+ToKdmuNq27e9zrOv2duIh42FW4bIybrX1zieMv1XdYmMxE
 NsexU0gOE5Bhf9gs/uhEP44jNNiFYtLO242loYt6nAqORtHlCDYBvGCD1c6T3St817P3B4nkD
 z5tbXJCXijdm0/wbSkPDtJbRbvPYMXwsoGxSW30/ayIjD8EY4sz00zeKvJjOgvydwfW9hJPQC
 dgHt9OehxpoZcY0aNrWRM2zq51Zrig3LcD3NIvnXAKxI/akltcV8hk27hQHB6fC3tgEe/u+ko
 n9jPMWi7KcfeIaDgKB0OITcqv9atBZuBC5l13nhbHeiwqpYwUCWiIycN9dA5vt97JyJiuW9HY
 nL/NNPaPS1ud8Ys68AnYDFxsjZQKt1SvffIvIhikOk0yn6Z/sWbzo1YOEpTKEMcY6bdEl1+tU
 44j6Ju/w+DN6tDP/xbEvLbWULZpVRwa7+d99bfv8yteK5jnbO+RHj8yEOH8Nja5BY6P8XESUG
 AFY1eOMdJo4LmgoJVs8GVAQhG1Ay9w2SG7+TZfa6AWDHR+CnP77K0N0CtPs5NQyYGeLhGE22X
 G8awQSujPWxg2dQwiO7h2m62gkpnh1w0Hkb+5oCahSSoQi8c7vRtI9DWXTfakfcvkw1q6A+dc
 3UkTeA+njaDzPu6PqKlnFyxL3Ri2ORTNxyIWLmD/vc6NFqkNvfd8Wrbdrv+r9Ms2nIkx/UQPR
 TVyu9r/aDzknlghMRs+7kgLKALM/58wjeWakZO1jh/y/KHZ4/TdODtfMTJe+XvZIbx4wWNctx
 go+OF/KlvOtsCqXaQ5yDTEBkM7C2UyUG1iQ1vu99+ku+Nxgmi/tPdcRnV96z41qVsizOcgVXf
 KLSpJeami+PVGcbQcCKslestYK4tOtK6ZrCFn9taAwNGICVM4OOtIaQTlvcujFpVWVyrEL/y8
 mJC5awA9XQqrkTd+NuWbOrpvCU/1Cl/Zv8OoOc1FoZJ8ZWwTqFygfjdfCYv3GlZbA8YMcWtsT
 fpwTz/8xdB5yHk8Ec60iXbs80NvDskhIF8aixcx5HiLV25iOw90Jsoi8PjCerWtaM581S4yFQ
 i2aXsKhTzU4aoSZ3KS/YuCTcFbA4YFyOW39DI7b2jmjTbHOGlk851EkkH4SOYPt/6MrIRzXT+
 McKlciuzcQB0NpnRMOfW4OjbxLXpRsPc2O2w6KNVpo+GyxJnrNNI0o/AE2XAOFhH6aoSt5O+6
 6yeaXHfXe0km6NEldVQh2JvI6/WY6RhS/Dbcl/E0OpHMLKu1YpxrAtfivf2uiKjggfCjbB9uS
 FMeqbmAo4tRQdA8vX0PvYtXiN7eU+YRsfV43+8GXqPxkONiEzbaBs+nF+35R/2fd8t0fJGJ4o
 ge07wJhXApjyrDjf4JgXgBXLfZEGrzOLpRPSVZ2WYxIOY2j/MX5ZfjM8oDFIU1MytWB11dFLS
 TiNuzO0sLNov5vFMbyVQ7yuBEtV2x6DP4amoatbi/yktDqr4IYq/pfxHn9JVl8jiH/dUgVE26
 z0C2yYkYB4PeMqn7uOcYUdkm81QHA2K/LhT1FWHzfEzrQDuKHuJBqTedjSpoJABZ50GKNIQCm
 TNvlAIxMl+JTCfMPaNXs8WcQywQuSCOv5jyJXWA9C37LVdW7E4fVl4Eksi/BLH3WWnS53iJjZ
 BsoNqgrv3k5agg9O4v+VUBfFiio1GMhtLNLe3m7Myij3keZ5eFSLrXTHdwSPNk9aIyfxJWO14
 z/UiZnAU2H5r1qIG6l2oBHQfzJp9a+Qk8CSvdgmeZxW4OWe9mqmYt45eCnUSkwjATDExTSiNL
 mvqIS1xxekqVwqPhwaHQQ4H/FJY+BNzdPr+5vv6LOP/0TUTfOWIHfcCxsXm5aQ4BftQZFuypq
 EsY3BKZya0r2TNg2dwYzpMhzFKR25AYKO/r7y4uR3nU4M0aozwApCHKgQW0LLqV1cYIlRxhlv
 Ca/9o1KRP3xUBJta75kN7Rw8NptRMw0OGfgqq6F/JNBTJY7NcrQImwhScQ9MNnU6hY6LePqOl
 20PRKJuikITxuOG4aCxgTtzHCeTBUV8eLR5E+PGZtBibeVdImY2+uoH5N+ImH9+tS2rw02hGx
 rdHCVxtdbFTPP84yUzmhNE20J6WyGK8B3G3R6EzbNOY/nhqUWIG9FuSIqmvyYFIAmJmPESaKq
 QsSA1JkEHlejEBI/2tdaP52jzq328Jtkbh/pYHrc4mTJWsvYMHLoAieNCPmvWv8wRe/sjVZ82
 judoCX4fXkszX9TZz9Gf5eamChyw/XKQbOVxWP9SDwmVcMVH6BAuTYGGf3NRBxk1F2fkb+hui
 9ZIKcMnctr9bRmnmoC07lB+0tgB9apKYavonNTrLHdDvT4tb+jW0loFFLCv/VdBubnZ5d1l2E
 2FVobWxn2Ejef74JUYtC9/18akgQIB35Hd+Tr4GL0OoUfllAgN7JwR+alGZ9S5ZF0kDHCpamH
 yvgateqTNJiHE+c5B1IS7TluqNoyfCkOgWywstXrtmSuWBcVxK0Yg6v7dPoEfQRdNrFAhq4XX
 GQQtFPTDwe5KoGAc4Vv+yekRcdtz2BuYmWwTXn4Q1ufhajdSBjaLuGooF+vfrDmoR2FeSmZoA
 kOjWqdxin7HAn0syFdU2+oiV8NBx1Jpmh3FFHeVgL3/ytPYug+BEMyaqgypXr6GgcALr/MvPs
 07oD8T6gmMNBCUFKzpqmUjyV5EuTRbJ99S0vnscaiu69ELmDkVWTQfNkslOshvoAjNMhL0UX3
 0rDP97wzrErdq+XiHOrptyhcIX3HpQXzOcBBAGOXPcuXrLssPiWwnkwr41j8t2RDqC6CZjh+V
 Md+bFZ0pKyT86CsLNhiesIByTs2DNya0V0CoqzCy2ueENMaGNPWjtI9NDtrpmAbYx/HZTC7Fo
 fF87vHPOJmDebMGy9mU3oOliWAs/+hz3oLCyKZfB1TiBf8scLUTId2AYVF/0y0YDalr4x9mei
 XqvBLSYO2auIvjXmWKRS4DMG3QkTas/HwUmdpmS2GKr6Ld6dA+YbUwgdyWKUHrncmMy+0Jh7h
 vLewGD8Ls2eOf4H7VifO6cSmaUQt9hGHgDPfUNjz3bjiUA4yLeUMXQnPni6ahLvnlCTryLDHJ
 yETHN+DT/twD04Gkgy8Drb4PpsIieWbgf++JEffr0aHzf0e0JDT7aCd0QAm6BE1O1eyXPDYrc
 aoWrmNAmNKy+o/mWe1kD1pR72q5XZ7t3Y/PcG9wqDdoQOjjn4yUZUil30AxSVuYnoqfabNiWp
 fRiOn55FaxuqQnJo4=
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

Hi Geert & Sukrut,

On 11/21/25 11:03, Geert Uytterhoeven wrote:
> On Thu, 20 Nov 2025 at 19:03, Sukrut Heroorkar <hsukrut3@gmail.com> wrot=
e:
>> The q40fb driver uses a fixed physical address but never reserves
>> the corresponding I/O region. Reserve the range  as suggested in
>> Documentation/gpu/todo.rst ("Request memory regions in all fbdev driver=
s").
>>
>> If the memory cannot be reserved, fail probe with -EBUSY to avoid
>> conflicting with another user of the same address.
>>
>> Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
>=20
> Thanks for your patch!
>=20
>> ---
>> Testing: This patch is sent as RFT since Q40 hardware is unavilable and
>> QEMU does not emulated a Q40 platform. The change is therefore compile-=
tested
>> only.
>=20
> I would suggest not to apply this, unless it is tested on real
> hardware.  It wouldn't be the first time an innocent-looking change like
> this breaks a system. See e.g.
> https://lore.kernel.org/all/Y5I2oQexHNdlIbsQ@shell.armlinux.org.uk

Geert, that's actually my thought as well, so I'm happy you wrote down
your opinion here!

By any chance, do you (or someone on this list) know of someone who has
that card and might be able to test it?

Helge


>> --- a/drivers/video/fbdev/q40fb.c
>> +++ b/drivers/video/fbdev/q40fb.c
>> @@ -101,6 +101,13 @@ static int q40fb_probe(struct platform_device *dev=
)
>>          info->par =3D NULL;
>>          info->screen_base =3D (char *) q40fb_fix.smem_start;
>>
>> +       if (!request_mem_region(q40fb_fix.smem_start, q40fb_fix.smem_le=
n,
>> +                               "q40fb")) {
>> +               dev_err(&dev->dev, "cannot reserve video memory at 0x%l=
x\n",
>> +                       q40fb_fix.smem_start);
>> +               return -EBUSY;
>> +       }
>> +
>>          if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
>>                  framebuffer_release(info);
>>                  return -ENOMEM;
