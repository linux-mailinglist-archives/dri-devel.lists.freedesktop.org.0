Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AAC1EDDBB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C766E284;
	Thu,  4 Jun 2020 07:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA68F89D60
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 16:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591202915;
 bh=TE+7YlXa9CphjYQj4lBe/p+j6I9U+M1rVqU01v24P/I=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=YW115lvVNjR2jH9PLPfr1gZboxWOjIZBDQDmtKgYy+sjA/VBrvDxQrR2U15hdkoc6
 PD6S9apWwMiBjuczMvlrlcvWpFIB2w+EBetf+MPiQNSIAAbewjMtV2AwcwzXmk1vRt
 WG5lpTO8krttpvNOjquegXL4Hv4F1EzU2Sk/N3XQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.82.231]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LkVZr-1j8ZnE01xz-00cMPm; Wed, 03
 Jun 2020 18:48:35 +0200
To: Chuhong Yuan <hslester96@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-geode@lists.infradead.org
Subject: Re: [PATCH] fbdev: geocode: Add the missed pci_disable_device() in
 gx1fb_map_video_memory()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <4bec4498-05a2-9ec5-8b91-7934d05ded68@web.de>
Date: Wed, 3 Jun 2020 18:48:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:EQx1HmrmztYYs1gNBf9Qss7JOHw/RMkgoVB+L6NgVpS/+umFR/V
 MqMloFUD4fENWisJD03digB1Ju+ZMlhJD9vGuOucOmA78rqfpmpaYg8JSXCSOsqseFRJw5j
 kvTEp+xDjsO9b8zCvad69DU5gpE+8arabzKrGusQgPTqFA3q8F9/8Hx756DSi2a2aqpx+O6
 QT03R4NWxvy/jHuzuVXcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BHwkEzjKZuU=:Ou1ujXjeipDwFFpp8brFCZ
 Sn87Zf9YXuFMwrWPXsc8RQzXwX3WPO/UD/uMwK0/e/QV8tZfsFzZTQbn4AMhoqTjXpM36gogX
 3NkP2mvdP9PCdHbe1bBrO6O8aqnIFJPS5bEuqq4BjhRhIRReNoDJXuH6oocC3+wULOOsPxd0P
 NyeWORfBsB3Xz1bltJE24cGz6yABOY78iHE1pXTsU5oTW2602v3NJnBw8x9RUur1e7jXF93g1
 KM8vuUkHdsiukesfuKpys4YnS2Nz03ww8AiOZ0UJkBn9f17yZCJo29kmRYe907soFdO4XolMo
 NWc03y6Zkq4U6zwSS0FS6a/Cx94N7LZj9OMCg6xU4zxwKY8LcTDZ5lsWENKMhHIwewTUZLwIF
 h0RlJdg3b3iQUvZ6mHGinnC8lcS0NZwciTqfSMkU0UGbWzHN0FUo235agQm9qqtWrJenFUyaz
 dkSrG8WUNOKVcfmpRQT2xHx+AURlue20QS9eeKYUF0Cbs1g9kAq15QAvYYgTr5mcZ+MJHp5f8
 4shQaEAR1B4vAl5nDezR+HJ5jUqeqaFvBtzb42HlEGIcmBL/s8Iro0dG8JIbiPk9RNYNft6y4
 xVDGcvbi7tBcvMWk567d6yQPxyjfjjBixcMD4dTbcdHutQDBZR7QqYNI6wURF5jfo7SKsD+u2
 CnE6znCg3wedhPPCw9X9SfZhzT4iCsExmR+nvRsEtC/x4EaLrvedymQfq+D9TlrMX9CGb/prO
 FRpb4ELaKV00vfPWTJFbz+sKM49fRiT/oZvEFFSuj8BuJVp2OYtAaUD2BkGZd2Uw/tNLGjbzT
 EgRLXvvcFSsDFEUuPO+99Dyz2B1dDadsfRTq3LWPSj5cxETzA+LFQ/NIn+WUzlPkqDXONH4Xp
 oMp5YdnkOBocwWc+//inFZXhaalgEEzKRbdVKyBe9A2214Tl2SzZMktn2s5JanuwnvYRKFMWP
 xhMhiOtBj1gv3zfuNVEFDGM7rrPLZudlE5Yuz2Ycywo0FE1SNcGP2nlnMjJZGUzEHntMRcupB
 kqmZcCdD6Ri6pATkZMcqa6xepiy3hWzxNStqGGFRkdL6F5+khJWlNWVStUkmi38CnY4TLLm6N
 y9s6mB4r5TMYwpJadeEKIS7UVgmYi/6ijBKu+IRq3ValdHuEqPiqnjOfAF54trMi0Fu9KfRhT
 mLjdtHYXqkE1vpWOsHr1SIvHphcmtZRdawQXDGftMuD5VbDaCx62KZuK5IoBTsJGjsMya/TUN
 Hx6zdj+t6Ft7QOvUj
X-Mailman-Approved-At: Thu, 04 Jun 2020 07:11:42 +0000
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
Cc: Andrew Morton <akpm@osdl.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Adrian Bunk <bunk@stusta.de>,
 Andres Salomon <dilinger@queued.net>, David Vrabel <dvrabel@arcom.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBBZGQgdGhlIG1pc3NlZCBmdW5jdGlvbiBjYWxsIHRvIGZpeCB0aGUgYnVnLgoK4oCmCj4gKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9nZW9kZS9neDFmYl9jb3JlLmMKPiBAQCAtMjA4LDI5ICsy
MDgsNDQgQEAgIHN0YXRpYyBpbnQgZ3gxZmJfbWFwX3ZpZGVvX21lbW9yeShzdHJ1Y3QgZmJfaW5m
byAqaW5mbywgc3RydWN0IHBjaV9kZXYgKmRldikK4oCmCj4gIAlyZXR1cm4gMDsKPiArCj4gK2Vy
cjoKPiArCXBjaV9kaXNhYmxlX2RldmljZShkZXYpOwo+ICsJcmV0dXJuIHJldDsKPiAgfQrigKYK
Ckkgc3VnZ2VzdCB0byB1c2UgbW9yZSBkZXNjcmlwdGl2ZSBsYWJlbHMgc28gdGhhdCB0aGUgZXhj
ZXB0aW9uIGhhbmRsaW5nCmNhbiBiZSBpbXByb3ZlZCBhY2NvcmRpbmdseS4KCiAJcmV0dXJuIDA7
CisKK2Vfbm9tZW06CisJcmV0ID0gLUVOT01FTTsKK2Rpc2FibGVfZGV2aWNlOgorCXBjaV9kaXNh
YmxlX2RldmljZShkZXYpOworCXJldHVybiByZXQ7CiB9CgoKUmVnYXJkcywKTWFya3VzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
