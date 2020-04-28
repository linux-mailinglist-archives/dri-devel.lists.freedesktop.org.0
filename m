Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF401BD4E1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC7C6ECA2;
	Wed, 29 Apr 2020 06:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DC16E84A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 16:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1588090527;
 bh=8xAdLHi22Afye50tIMhbKEqj7g/+TQevJSFjaSxYdqg=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=MVgTvgZvgNJuS+z2cPeCyp5fB56haCGx4xZoItRrxErQakN6XkP00lcqHyIcseqZ2
 jvxkvf66X1tjgYXATOu6MciNW2j07T1PmbAc5xI4dWD89I4ZZIUDDt0G7h7Tog4ZFx
 FtyOXr7LhUEj3yBd5cswCu9zTWXTUwyOuw6sV8OU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.179.255]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M8iK4-1jJbX92qE8-00C713; Tue, 28
 Apr 2020 18:15:27 +0200
To: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/mcde: dsi: Fix a return value check in mcde_dsi_bind()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1900157b-39fe-e6fe-6fe7-26053a32f507@web.de>
Date: Tue, 28 Apr 2020 18:15:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:5FSzJc0UFp6D0EjhmLJsAt414KiTEdB8XeMKnL+B1QqzWX01Sci
 ALM2gq3tuJCroG6vhkBs953+cNGmvtbyjGzY6lMjmMba0WrY5YRpy+B5Y8yUhvfXUwgFAVn
 H2FlIq24bqqvqmsULR9DreYsjFKUd8FkxRQwLRcN5I2fIHDicn+xOiONqPGCCO7GRuEDPoP
 VCKJkTAF2xfDVC+3uf7zg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+05hwj3gRN0=:5sVYyphrgIkiZWH8cDYeFI
 NxnXgdTF2OnOPFAJlZqQyI8yQYlOhPzVKivirIqk9z3HNgWVPJem+KvCzMO4Wislw8go1Q+Rm
 jYPITCQEC+Hoh0zbCJaiZFdv6XefO/QszCFBBX/JwHT5KFohpbcw5VYKEihMMlngxQFVsvrLW
 1QpIwyFwt7atXXy3tYMEcC53xHg/emSsex+CTmk9FgZDx5obsXCE04D8+4UkVVco0LD+nThv/
 l+ZmYvJiLt0ACqjcniZkrBFzCDPtm0+p5PLwBjO2DSxlyoPNYGncQPjMy80g+hv3CxTMbskPX
 ZKcMZUgE+jX8TCBf84FBWqRk80c+d19/AUp/K1unWzzwFwuPpwg9vbOoP3sw8arMJMXIvLW+P
 vS3qh9KfFtjz8DMzI0FS32JnIFW8TaO/t1p9Wb1Ewz2Aru/rreLr6oyLdjBworEKJuXHD8Y1c
 P1XIbzQfeL5P8rb+eO78LEM3W4nUu5BEhpduBF+JGwYbJxa4RqXmLl3YO7TPwW5RHaBMXas2m
 Psfiq+wNxV9nmhAT2IUWDDjYboVmyCqtHTCrWzEbGOoqluvnRWjfNEjOpAf9CIaCHGtBEEGUF
 IvI/V5cI9/I64trOtaUP+BHzSdAfdfkPhWH4+vfGPiICXy1Nb7rsYOPchha2twovQZ5kr0vkx
 9dMlQPLHgHYSYJqR0yKY5GRWWIhJ66frD+X5uLlyoLQdkSm7vdXpPzeRE7uj18jsgUnOTlU+Q
 uP0kyx4n71mviLkPuo4HkDt70YLzw2DQ3LGY/yaYnMWlmlj1FHJpBlQNcWP6CjHU7Ty2Otd1g
 sxw0EP28F8/YyIs6GMZu1OfW1hsbFU6iizys0kNDSnE1UZT2QwmR0n+dxyjvAWxaXWtB7lmXM
 ay3CR/mgxR3chr78pwQyaZXmRgyu/e6ccCOVX4P+0bFhETSdvit+gUUYSF6PIdnW/EGuOhjMQ
 kCYBCghN+3I3/T3MiF5KCiRQAz01PSMPnTPYe+hHVeSOuRiNHCLMjjeJKKzAw+4Xd09Sna50p
 BxxknXklaCAuAOf3E4vBdCnir89KiH6CoVGuB6iz3WHZGFz91iwLI1MVffFNG5/GJmQeTejBm
 szo0Q0W2vc4xQRAu4jPLBArDdvV2YkdL8o9WCMQGV3R6Mp5sNWhncrP0ZSNfHYEGT5+sK5Z1d
 mrolh92At5emAhNUcb1PF03O4KJQ6EV6nCjnSRTTuLBI9JxjrQdJ+yqPKEnInSdvIHmT/UlTF
 T3WNGQrptvhKroaHL
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJbiBjYXNlIG9mIGVycm9yLCB0aGUgZnVuY3Rpb24gb2ZfZHJtX2ZpbmRfYnJpZGdlKCkgcmV0
dXJucyBOVUxMIHBvaW50ZXIKPiBub3QgRVJSX1BUUigpLgoKU3VjaCBpbmZvcm1hdGlvbiBpcyBo
ZWxwZnVsLgoKCj4gVGhlIElTX0VSUigpIHRlc3QgaW4gdGhlIHJldHVybiB2YWx1ZSBjaGVjayBz
aG91bGQgYmUKPiByZXBsYWNlZCB3aXRoIE5VTEwgdGVzdC4KCiogV291bGQgeW91IGxpa2UgdG8g
Y29udmVydCB0aGlzIGRlc2NyaXB0aW9uIGludG8gYW4gaW1wZXJhdGl2ZSB3b3JkaW5nPwoKKiBQ
bGVhc2UgZml4IHRoZSBwYXRjaCBzdWJqZWN0IGFjY29yZGluZyB0byBhIGZ1bmN0aW9uIG5hbWUu
CgoqIEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0gdG8g
dGhlIGNvbW1pdCBtZXNzYWdlCiAgYmVjYXVzZSBvZiBhbiBhZGp1c3RtZW50IGZvciB0aGUgZXJy
b3IgZGV0ZWN0aW9uPwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
