Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE9BB8000
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 21:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A60410E158;
	Fri,  3 Oct 2025 19:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="KE6WP5wf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAAE10E164
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 19:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759521014; x=1760125814; i=deller@gmx.de;
 bh=1OoQYUp9pgkze4htt26rmCehHfCdurF9hgtKatrqDIw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KE6WP5wfD7QZoiFHe/bJ6v7JlLNo3xtB057/Kd2JXGWsyQbQ/OQDn76wF2GsALzO
 UJHR4dU3CxTpZjY0qsDyYDRzHcRcz+iGd6dqHGvykO/SuV+ViPR394pliCHrlCLY0
 AwfYvUU5SNjEf/E5+09i8Kve3zByIyMWi4bFyYgDDpWCto8nJ6UyvQCRRFjzFBBh2
 KsPGwIOqsXA2kAIbL1/satJ5E4D0J+wpVSK6+326Aqg89duOgn7lmxZNWCGgSF8pb
 Rp/n0qxePr8z69pFvaMTmcHs5O5sCryHIXJ7/UKZ/Z3KPOprcPTo5+LlzO1FV6Fta
 OTuEvhAE5+PzgFqYGw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzhjF-1uIs6B2Th3-00wFMu; Fri, 03
 Oct 2025 21:50:14 +0200
Message-ID: <c1d86274-44e2-4ceb-b887-5c4af45d8b37@gmx.de>
Date: Fri, 3 Oct 2025 21:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: sukrut heroorkar <hsukrut3@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mikulas Patocka <mpatocka@redhat.com>
Cc: David Hunter <david.hunter.linux@gmail.com>,
 kernel test robot <lkp@intel.com>, Bernie Thompson <bernie@plugable.com>,
 Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org
References: <20250924175743.6790-1-hsukrut3@gmail.com>
 <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
 <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
 <edccab86-321b-4e6e-998f-3ce320ee0193@gmx.de>
 <41ef536d-2399-43f8-8041-c6b0e642aba2@suse.de>
 <CAHCkknrAKGxzAYE-R3QX20W4faR9Wfjgn37peyHRJcZ6PRLENA@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAHCkknrAKGxzAYE-R3QX20W4faR9Wfjgn37peyHRJcZ6PRLENA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E9PRxAmMLLYj2WLkCS6kKwQAR0GDLM4iQvjKOyVpWTP83BJJ5iC
 Nc20JrCUyv89y6K3OkaNEYeotLc6BHjTMI5SJxAUokveYuZ5+5wRfWK1AokoTgPXSaxyqLC
 R+v0OuAA/ZX3yoTHkH0S1RFQNM2XhyLwM5Kl4533TKMMuPT/H8eqmAc8YkbShfLoAjPzlxi
 fagPCKIq3pV+hdOKaQcXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eKU4NJnwsyw=;8gYG0ZVn3XHQJPzK4jjqflIR2gT
 IThPxEGwRETxDFnjMwbpAn7N8RtseY0TvIMljcF+6/R6660BqWrbOigScMVEBjeLKuG3aZVem
 9kx99U+3NCy1+apUaZVjhcARGRe1JGG8Sj9J8NmD3HdoDMKavKQ+z18k7o4x3A+NvObvu8cC0
 GVMJKikh2ugnoeo0Vd1d1P1M+zB02v/hhOLx2a1R9Uj0TA9hQk+/vCFhAIX1k4v+GvyMDG9Fz
 MrmmNSWGhFyJ+O8aiS/WSSq5CFjYP5Xilh8fQ4dktysOTgF+CmH8FBnFadAxZYtnIqb7BEcPf
 T4Tk2hmHx3Wn8/sXZixQ6CHr4b4mLEigaJ/AP5IsBBvjZVTBT6bKbBIOZd6adQ2JL+Z1RB+US
 n1NHIj1QxK6kT4PBeAjAGCTNhFVGKhDXvzBZh/1prsU+dr6vFzWyJ3f8BqWDugGV/8lqBFDKP
 yKRSsteq/jBq9jEnJHUISTRIdpJXvSslkYy2TivxUqdHTP6PpZGEaYW5x2Ex8XcIV3tTOIlpj
 rLHq6+mYduOdrOzyU0j4kr74ZS/cmDpte8JGqTQbdJgAQf9WbIkodvdESD7xiD15dfUl5AMNv
 8E8EvEe9HIkRYW1/QTeXyLc94g1oe3pd+s77vGr3u1EYCHmX7xpDZsEKCDu793ZAosh+xtdbh
 2zeYBHRgZ69eqLpRCmkrIuPxJAqxJsp1pNw7Ld7b27tniomv7/u6Up27TBOtK4hvmM0LK6Aa4
 /4vbgrVmsL3MzjB+OtnekT8A++w95NLOeObYHRAFWAwg+Bp+EkNtQ0xK4Z744i5HrSugKTAHp
 QeHzxZFAGZXCMW7ojxAGDgKnx+fcKGv5/AInwHlnPAXsruRdYOv1+JN/7u/v6UqXqXN2+Yi2u
 3Ww1gsg/OreEmFL2/4EBU42c+7ttrg54sqCLaoQMtuNaN7nprBcFrJD12XUomH3tu1JZ5OM3c
 /cpRfODXoicGBHwkLIuUw2fzW11TB++p96w2+R7t0tp8b1yRP/DqxEJ+5CLul4q1Ho9yEqFyn
 pCk/P4aHUGQBYlt69h/AhARtYDC+3woAiDz+cvgUXn00YmTHRKyQqEEBn59qYt0EgVu6O4T2G
 jGRDnCWYjfHYd30xTaa/OjRuhpeFFA0tuuNJqCmnSHA7LeU7B1UCUlVSl4XRLaUDFAjXFx0mX
 EXMFJlprYH34tIrhMl0ivTw9xgNT+ZJGrVyQs5YarInzH1d2jWRtsgVV4EflszNZFNkfiIux+
 3WEzDa+9gniQn9aAaJOf15RfwPmQJuITZvmSjbhX60nJ2pEkWSHx0AjWxDfVUtQWdfb/GYZtb
 BCAb6OgiagEIQNnt8BDfarhLItIQD+NH2qikSCFbXR85ZCZcbp1ENaNjqyJ5MkHF9Mnl4Fm1G
 rRWUzuQcI3dC835uDTDutkMVVmOcVLINey3wRbPpuAsXtVOjwuDJlUrC6p/gDqM/+4qJ0dQZf
 43JtICCSX/3bz7M/yLVfeLlZ5t8fgJt9O6UmlQ4wc7JIg76pAOBUhELGvQ8QCwtUFVY1oeKIi
 UNMrtHyp4uCIqoJwHZNT51W1mtF3/0w4rmyBnWxQhckrjjHuVMtDlczYmWvZ8fMlgX5FDWJNo
 6yOn8Yx3CUBV07rwzyx9f4sAIAtxPTC3tcrVzg6glkZNlC9ctPjj7FErKWNlKs5WNaO6PA/dr
 khjLCRRyUeKAvROOP6C1wWzw/JXnWvxKRtkUYv1QnFFyyKlpkZqJeuSMvC0aleLnHRTdSFnMd
 1mmAvzzRD8tq6dIVUNn+Sxx2jpORuqpjBVuH1bczfNLD6ZR9UcaguRL2AtQ0OA2ig0OkIw4sv
 KjAk2rTeye/D/pznHih2F5FN9nPjz17C4wHfo4VhXWy+GTvmtCob2o9ByaER85n0KA0bvwIEM
 HURY62WyAt3k39Qw0hHjapXHdooTaoKl8c3q1Rt8uENt3KOPIp21umzVM5uAh9bz4AgYiTztB
 xW5QKVlcy49rN8y/Q0RJN0bl2mw3oltBSz7T1jFEClSlD/BB/7Yjx9qv2NjIfxOAXNSX6gapk
 /NuAbxjh2qdXTq5o2eh0XWR/ad85Vn6DoGedITVFc0wUZ0BvAJQ1qiXLkMtJsGoXlqBgVlD0S
 SPxFW9TMJvuKMXt2a4dRZ/sbM05okv3tXccSnuHR/HfXO2Sn1o+1/gUapaG1NVtpAVXOtvser
 d4t75nHJXvh+CvheRs3ju0zonMN1lQQKR5O+WaQFJUSKqPFRtnSLngcYmaRiomW6ommsG1xv7
 2u1lSvA/j/BYmSnXgxYC6ZAXddBrn8VYzMwbrbo41xFf9Gt/GrXQuuoOkI/0MZ6ZBaQISsRlY
 Xt67mlaHk0WgXmrGDZVOQJj3sLPBpLwtEkk5h4lGrxSZI+n9gyQJwM3fRJJSD4Z7BLB/IZYVF
 bsoOfdXvbyQ5nrgIcTVy/Y4qgAa79eWw96ylPBsm5DEIWRHeraIljHZ5T74lmfKf/ES+9iU9W
 DUY+Gimpo2dwgtf83gxfLSiLp7HsTB9k0a7nbQ4cdoBzVgn4ftRguQTw59rSh1tusFjFLkosK
 0vrxpQeXiKegA3e6NEfWOKQ2DqKgZiDngR4wmY7ahByw1Sk6IPH6meIfj0c4d2EpgYBiGnzuG
 bHNX5AzETsJr2N/Emat5x8YamNzOz5ueN6l7x9hzPhANET+QRkfv5eg1CebzdJThzWIoQJH4C
 OHgjGQ2dO37EgvjUjfdR+GgQhDcU1MWHGGgGYbAm4a9MvDJbfXsfD56X5YkTe0VP3sWL4rONO
 WNRHSSW48CPlKcArtwgoKHk91l5kFdTDYpL6UPwrpcDFBA+VVAum+eKf+y68373+eBiA4x3O/
 sM13nfkNuhfpMP960Fq6z9Dy4FNAow4Wvsffo7ycIueQxCleutmWqx541w01UBJbf+Kcik/XE
 hrkYM+y413S+kA7QjFv1Zdz0WlTNg2pbhAJfNtPDwVcuX5aVsz0MjL3xCwQenFAeGWBUzHuvh
 tjHk7bD5U0AX7SK8TMJpfnt9ab/6RfDEY94hXlwTGCSTuwd7ZbGXHb81au6JTyBvZFPn6QSjI
 4ptFjtAqyDIC9bYRz9gFpFXGWa2qh7zBRDTkwxey1FvRu3BM1yTrTOZQEdouefvWrzL9X63Yy
 JHTnWphyYoxU+m4F831gVLyQcOPDIyLAq/ORf4lMtY/9eNb7gjBUXvmGE0TJkmaLzCVxsTkk4
 OxNS48IsqT6g3f4CVoebuhVBfcqxWgbWlrEtbYl9yzWzzKel0ZIH3CooTcou0RyyG9VWaw/WC
 7soRWRfd1Ta6IG8VOtqyLpNYLdGuwv+ZbYU3ciJbuopzTYNzeRvwDyVruweFUe+lAOf7eMdtO
 nC/2+ivOFcdJHVdhG/0sGzgRk11DLKxGPd09opP/PuZrDd0FfqF4BgRoOzdQaz81Etmt5sRw6
 zA5/7084p9OYCrwn5iUInNe6U8bWm2ZM+8K3y2ifg00Bz/s4Ja8xSHTx5AnZ8XeKly/U/XtVD
 gOJ6FVCUiqmV1D5n7cSgz4EeQsLzY55Hs+6/OpQ8f/1n/Hw/WuOQx2QAeEE9jM+sQ/S9/flsu
 7YBVk3pvyMnc95U2/luyAjsNgzr/IXmO2ne9IpQTIQJImwrydAKBwV9fnKYwvHqkykIFVDdHs
 B96ZXcOfR6uGwqFJgnPJci4h/x8Hks3NvDQhPGXt2Mo7nxpptL6jnFPXVuS/d/FRoilmIXLhX
 CnwaGJNVezO1ILWKYJew81dld2qYIgUv611V1UywE73lmx4GlpIWSy9KavuVwgbM+FyMh/niQ
 N8IcTj0+mbk/9Hi9mNd3227lYVb29cmcy7t1ktRGkH8d8YQ0gkTCEn8Rf+AssKnnwhGRF74Wf
 QjWq4G4OQ3LDHNX4MjRcba5PCXuhzjn5BPrBPoTLsykt1mDdBXxCmV9YulWdz/3Mq+xnp47Bg
 +XupPIEi1pCESQLzEtybfJQgO1t1b+Hm5TmdI5HwlkFBQWG7D2e134EcBplDHTIkFXK13Of4A
 G0SVCJyNWJKPCbfhyxKyeDgycq3aYT091XdMu3LWnlhb86FiydyQOqYXaHYbhPkrYksrjLWgu
 pGq+6aRX5xY+4w19wynccBMz5ndbyn6huOIkBH13VzBVh5iovfppbLTLnJAE43oEqvanjRwWo
 I1jcDqCaVyfHxQchGyMfi0tSTscwqEjIUDVYGWazhDRq2A5nLiBannaK1poMMKATp9wBxMLNc
 r+PUYNq62btqN5Pc16qJiTsSAstJI3WNWB1oQ1B5BZ327baZhlXEwmnwjNh1ALJYZ3Fw6IaM0
 2hNELKxXGvu/43OWOZFXqRbVr+hnjiiboLhdAN7tg6XVkp1Zo36FjWDN+qQ5k5A2nRQhi1N9g
 zHf/BPDfU/0WiIkwtP+s9hEQR2qdQSriQxP0/XiSxWxjEgoMJ+K8nV9JJwvEgyAzClWBDYyM/
 NI/DEsIzU8iItLUR8KG402Iu/k1oHwU/DeuC3IV4r84pKPx/0u2DRPI9mXTNRaxVHANXhZJj3
 GT1nBfaz7wda/7Gc91ayHdcudLFjNo/YbW2USdf1dQ43jgkFKi2vNDkdHmK/H9mH6OdoaOeWz
 JCen5G6PXjrrmYc8mKdjDV7a6luyEGjdfY+ijTYvpbXhSPzs7okQt8gMoDKu56TQfgtTrDqUk
 MT03qDLN7EoSrNgwP1eZqxAIAlLxEhPanjT6uGH47wai54W1FrLneUd38Awp6t/GTm5azsZey
 Y898R7mytFBi6dyYISaslBQcMZF496wQ27SV+7QcixTtXDHs1KEjS4mcIBS6fbMYoeKXXcA3J
 fwBfZGz5/q0ELWPCmJR1auoGanZ/PhaXcUlOc9K678iiTrRflHO24L3jMNYcOdebq17PlPkcJ
 8+RxBEtZByTRyL5Yuvk3Xxrj9Ay4vzNTW61WazFHpDAd4gjfIqh25j69b4HHQBceFIMTP6flT
 zwx9JODipoQPpDXvSz2bBpY71DcAWhv5vENbsy9jFBtQ0cgTrq23cvr2cafHfhO9BhT5m2dZ6
 8IUthmK0wQkCN+j/3VrwEZ7yS02UufcXGNlhNCW/tOX0qX5ZQmxFMJZhBVZYf8zvGw+BNGHxs
 OfN6hW8Wto45imWKqFlY8MHUaw=
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

On 10/3/25 20:43, sukrut heroorkar wrote:
> On Thu, Oct 2, 2025 at 8:52=E2=80=AFAM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
>> Am 02.10.25 um 08:41 schrieb Helge Deller:
>>>>>> kernel test robot noticed the following build errors:
>>>>>
>>>>> Did you compile and test this code before submitting this patch?
>>>>
>>>> Yes, I had compiled & loaded the udlfb module with no errors. Please
>>>> let me know how to proceed in this case.
>>>
>>> Look at the reported build error, which seems to happen in dev_dbg().
>>> So, maybe in your testing you did not have debugging enabled?
>>> The report contains the .config file with which you can test.
>>
>> Can we rather make an effort to remove the udlfb driver entirely? A few
>> years back, there was one user who was still using it because of some
>> problems with the DRM udl driver. But I think we've addressed them. The
>> discussion is at [1].

Would be good to know if they issues/crashes really have been solved.
In [1] it seems the crashes still happened with DRM.

> Should I send a patch series to completely remove udlfb,=20

No. (at least not yet)

> since [1] echoed that DRM udl driver is good enough?
>> [1] https://lore.kernel.org/dri-devel/20201130125200.10416-1-tzimmerman=
n@suse.de/

Well, some people who do *NOT* actively use fbdev with the old
cards say the DRM replacements are "good enough".
For tThose people who really depend on fbdev and the speed it has
over DRM, the DRM "basic-drivers" are simply a nice-to-have-but-not-really=
-useable
type of drivers.
So, unless the really affected people say the DRM replacement
is fully usable, we need to keep the fbdev driver.

Helge
