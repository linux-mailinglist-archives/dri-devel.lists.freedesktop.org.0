Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F221A44A7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71ACB6ECB4;
	Fri, 10 Apr 2020 09:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CFE6E130
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586437519;
 bh=pdTvAlI3N4fXOnDTP/rTIVU30iaj/Z2obJ7/NGxzl6M=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=mzrdEIiLKsjxXs2TwVnX6X6JIjVYOhlT64xwsNMWsPYOIeXYQwMxs+RoJ354OXBXv
 AFQUTSsKZzZJe7VuhiETP+9GcBY7v6SqCVUEEVXmARmypWQWanq9CBLBURFvrxKhVL
 saUVqRuEos2R/Co+XhKxF3SI/+rx1iT1+Y27l4Kw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.133.77.56]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0ML8Vd-1jMFkl3iQT-000Ixb; Thu, 09
 Apr 2020 15:05:19 +0200
To: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: drm/tve200: Checking for a failed platform_get_irq() call in
 tve200_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0263f4fb-c349-7651-b590-8722cdd30c85@web.de>
Date: Thu, 9 Apr 2020 15:05:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:wjsT6tNGG/h3uDxJEg4/4mXra+qdNJxG1omsKT7lgkRF5XcgI2Q
 uKdtczR1znRwgemW8s3KkD/iBdBbmlAf6fgUk2Fi/wpa7O9arz8oW9KJLQkyhismGunNZ3m
 PRMRDBg5x+CDDRyqqwp0pOps1Sp9pudMfUNEYIH1g9fwnBDBhpWQu21NFDyWWk58sReD3N8
 Jww1Q6u60QxZ769MEVM8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9hS6Z0RwO1A=:xOb6oXpb2KFdWHAUuHreN4
 nMf1ubiIWbiIvQ0GBG1i30WLMR7dOlWOP8we44+VSX00Y7HMBYBC2Beq0kK868qrWETY6jBTm
 qROz/cHDM6Ujjj6ZYtlsChlRs9Zr/DV81VeAN/QpQFXAHjGO1BqojV1qjvo98N7Gd8mhTkadP
 qE1t+0Itg6X/PkgnFnQ5o4hKajRQYjV6y/UVrmqgM++r033ZB3OBrP7cHWzYliIJ3DV1Sifjp
 Ogl9I5gKsqSYrmgFCMMiiAXKYLssl+FGXW5pIDt8PYrns/iXU0AbV3p61h4T7p3jv6It67WZw
 ouejn0Dj1usi1E7gxvlSMhFYzyUbzFET8GUIeF5PVnEeSt/8CV7hJgakQCFo6IJJZXyV6gH8z
 +AFw1A0v4kNmWVc8A2wkxiuptpO3dQwC8KRWzO850dHLwW4sTx/Z5HuBg0Oj7uCtXFzX+4Lum
 J5OKMIMlK3/hloL2TgAi01vttRE58OSaFhROMoJ9ePOB/KvVN5+JPim8Mf0oDdR1QMZq+trPX
 Qvyj0EKnmjLxnN7MS/FJHoVx3m2zquJ8X+pIw6MjCzB7DIjLCxUX58vcd5afPCD1tjg6THMs9
 wY1hEyoqR60G/8OsFIMXrgVx7SNmjBSVHLZ1cTe2rA0F4rzFI74Cor36bz4HVAmQhSnKhVrQV
 gyoD5sIbbCwu0fKlxp2aM12Y1OHnIfscgHv0AJijpCNOH/bn47GbdvS0dpF7nU6EttitY0swQ
 yiafL7MqqKjE6UxvBDbpnwSRC4ZphBLzwCebbAOaUeMZ728IGTZbKTwn92wiinnq1KvMPg2UW
 L8qYoz+PCbN+NkquWN09D+nnvii0EFGftQczfG+PM97ALJ7pRft+ZHnz0uuz0tcBhlnU3zim7
 itBTdk81c9JpwyWnTkvF31ixVX5m37Mt2lJ6GIOlsVU6JAPaIN7grcyJIXiub94JsFkSwILt8
 nojCHU8R3P8Tb2BxOKhDvf9nCdUVBwxzFFAgMTGro6ptEKsU5WJfcv1Fmf6pP3qGqUghQ4c5i
 Cg3/x9v9TcBpPG720Dag6InnQeyDbC0mN9GrnJ6x0pKHQevCs4wUc5j4PGpuQS8Qe3shavMf4
 gEM1mNwOmuf9mUWHIVZIOr2X6mFTilBf0rBL1HaTsgHkg/qJq7/o0lcKlGdqPTVvgdomUic8j
 A3Wx3S0cg+VTGyfPlNPGtcQV0oDeesPQEnOAu2oYkYVWwjPUlh/rThwWTqcp5DmFzV5wkPMs8
 ePbD9S6qcbAwpTFyL
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJIGhhdmUgdGFrZW4gYW5vdGhlciBsb29rIGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBv
ZiB0aGUgZnVuY3Rpb24g4oCcdHZlMjAwX3Byb2Jl4oCdLgpBIHNvZnR3YXJlIGFuYWx5c2lzIGFw
cHJvYWNoIHBvaW50cyB0aGUgZm9sbG93aW5nIHNvdXJjZSBjb2RlIG91dCBmb3IKZnVydGhlciBk
ZXZlbG9wbWVudCBjb25zaWRlcmF0aW9ucy4KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjUuNi4zL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYyNMMjEy
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvZ3B1L2RybS90dmUyMDAvdHZlMjAwX2Rydi5jP2lkPTVk
MzBiY2FjZDkxYWY2ODc0NDgxMTI5Nzk3YWYzNjRhNTNjZDliNDYjbjIxMgoKCWlycSA9IHBsYXRm
b3JtX2dldF9pcnEocGRldiwgMCk7CglpZiAoIWlycSkgewoJCXJldCA9IC1FSU5WQUw7CgkJZ290
byBjbGtfZGlzYWJsZTsKCX0KCgpUaGUgc29mdHdhcmUgZG9jdW1lbnRhdGlvbiBpcyBwcm92aWRp
bmcgdGhlIGZvbGxvd2luZyBpbmZvcm1hdGlvbgpmb3IgdGhlIHVzZWQgcHJvZ3JhbW1pbmcgaW50
ZXJmYWNlLgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2Jhc2UvcGxhdGZvcm0uYz9pZD01ZDMwYmNh
Y2Q5MWFmNjg3NDQ4MTEyOTc5N2FmMzY0YTUzY2Q5YjQ2I24yMjEKaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjUuNi4zL3NvdXJjZS9kcml2ZXJzL2Jhc2UvcGxhdGZvcm0uYyNMMjAy
CgrigJzigKYKICogUmV0dXJuOiBJUlEgbnVtYmVyIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZlIGVycm9y
IG51bWJlciBvbiBmYWlsdXJlLgrigKbigJ0KCldvdWxkIHlvdSBsaWtlIHRvIHJlY29uc2lkZXIg
dGhlIHNob3duIGNvbmRpdGlvbiBjaGVjaz8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
