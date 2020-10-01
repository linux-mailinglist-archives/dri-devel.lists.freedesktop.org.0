Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F33280DCA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 09:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D25A6E03F;
	Fri,  2 Oct 2020 07:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFBC6E158
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 13:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1601559032;
 bh=JCuC+YxYl97qqlkG4kZ/uganLKGm8eQOvYq7b53mvWU=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=KHJfwD3L3y68bztEHBovGOmSnBluKR2L+GLyxn0s5iiQVAtl5QiBUEQuRAWS2A3CJ
 mb6FjPEKv5XF7iVj9a9sqN8oVhG6FjGRBVeDCx5DVhuOkDU0ZzaRr7gvW5Lz4GozsG
 ZD9Jhpqla5leqNqqNTnrYXxSXt5q0iUmcVY3o9I8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.75.172]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MXHcb-1jrkuo2gSL-00WBNy; Thu, 01
 Oct 2020 15:30:31 +0200
To: Dirk Gouders <dirk@gouders.net>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/amdgpu: Avoid null pointer dereference in
 soc15_reg_base_init()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <6078dfa1-4b54-e58e-7fed-60d751c584e0@web.de>
Date: Thu, 1 Oct 2020 15:30:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:gsmzjVwR+wSlSkWqVU6tovQmQBtZz+8La50DV+1PijsbAloyyIo
 95j6kfsNt55Sup9murAM6GOddYl5MUsKcyJ51jSVCb1OIEJImf5HtSk/JPqZPXgOoPvOVii
 MMRATszaWYi5B4WbmJan9UbpVyj6lvXCvaNnyeVYBLwOm8QQyQFFc5GRWlOHfc2AlJUUsgC
 j8WGiLbjY1voDxLSPHpxQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fGkF/CgZasw=:nRvOatZ77fuU+WdDfERl1x
 86D1RrFM+t0lRJVKDc075CQ44sLSnhRlFsXXVyBtmzwn1Eh9/HTrhkxeUdQhTo0SnjBvE755R
 We8LBdFN1l8c1fxr/kCa32uDZR28yYj4gyFEIofjtFjNovUa63OiHczMGKC8NgiDds1/UnpGI
 kMmRdYRfWmTuy6y+lA5F2977JwYQAQetRfLxGlBaOvWk35pH07jDEu5VWQdpXBsflmr8wSaLd
 m7jfghJZMgVAxiA07AzEeg6AYMmTI1RJez7YVXW2FNlX/WkC46f7q/lc50H4Vbec/iqkEOByN
 OW/jP8hY9yRwbUNP8oIErCx4gFdpBqMdaMrjTRK0WsXA9ZvOSO1tBNFOhUuTJpWTHn8gYdhQG
 Hiljl5a6vnSEkieXwjQVjIqGpRBxsWzNYJd4Ht3qmCCccQqQ29Z61YWOF+uMagvJWOrTg5XCQ
 EVFYqO6oAIy6PQVjjKxduVZxib/tgLl7qxdvq5VGCfYMdP68FnpOeP/b3he0CZiPMukeKU1jL
 anuBV1SBQy8h56r398l61UFreXYNkLhRQETToNnYc881Ktc/0Li8UcFBYt/uW/R8WvjRuFSLF
 uWwzKRLEmF+CMMs/B2wIuTa+p+VypsMHf6F6EPI04Bci91e4wm495b6lmWEdey8foQPGU7cMf
 zzUCW541GnQ8L9eynktGFHWC+XmIl9eFcLHCqkkqcMe4SvEqoV/mCZ0iwTNQYOsr2A6nETGts
 Pmj2l2L3sPhmN7lkX9MCVbEKfzZ64C9oZ9Bk1SZ8j5UNx+MhbWHRa0kK5mdVmcgdulRsvH+4P
 Kc8231tz81SdlMGYWnvy/bOsez178MClKmHSxP60VKDkxfVU/3TnJT3ELAT2ysFiKfm1Lko3T
 hWy4KBPX0wQGfLlu+zeZJGnTyhxntZzY7PJQKjHJNleeR6w44UuvUCTj+ddrYuOpnI7g6fAPF
 7pDUxKLLB3ZdzjYJyxT/q8HBt2an+Oz+ii1+k0ziVwfmEgiIcrHB+/du4ofv0aFqzgMXZPk5Q
 a4T4YmojYRIcwxuBxCMO7UMG1bxAlZFsgQHjPNqxUoCdtWoDgL/dSLIGo+t9P/8nRhAWB44VI
 20NJxHaI83ZIWaGYXvdSVsAaKuCwkbFBq0Bd8iL3/v0/Dr5p2eec0jf2H5gxVTuaxurbTYIAs
 D1Y+Corf9tDm8EhXB/b4rKCsC6jfFkRrivO0MpyLcyuSjCta1Aw2QrrdicRWpvDxQpMzRWUqw
 w7Nz/t1PqYyL/PTVpRpa4If5FGKnY8gCznB1jPA==
X-Mailman-Approved-At: Fri, 02 Oct 2020 07:02:50 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wenhui Sheng <Wenhui.Sheng@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiB0aGF0IGNoYW5nZSwgdGhlIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBkb2VzIG5vdCBvY2N1
cjoKCiogUGxlYXNlIHByb3ZpZGUgYSBwcm9wZXIgdGFnIOKAnFNpZ25lZC1vZmYtYnnigJ0uCgoq
IEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0gdG8gdGhl
IGNvbW1pdCBtZXNzYWdlPwoKKiBXb3VsZCBhbm90aGVyIGltcGVyYXRpdmUgd29yZGluZyBiZWNv
bWUgaGVscGZ1bCBmb3IgdGhlIGNoYW5nZSBkZXNjcmlwdGlvbj8KCiogV291bGQgeW91IGxpa2Ug
dG8gY2hvb3NlIGFuIG90aGVyIHBhdGNoIHN1YmplY3Q/CgoK4oCmCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwo+IEBAIC02OTksNyArNjk5LDggQEAgIHN0YXRpYyB2
b2lkIHNvYzE1X3JlZ19iYXNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZmFsbGJhY2sgdG8gbGVnYWN5
IGluaXQgbWV0aG9kXG4iKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZlZ2Ex
MF9yZWdfYmFzZV9pbml0KGFkZXYpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiAtICAg
ICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICB9IGVsc2UKPiArICAgICAgICAgICAgICAg
ICAgICAgICB2ZWdhMTBfcmVnX2Jhc2VfaW5pdChhZGV2KTsKPiAgICAgICAgICAgICAgICAgYnJl
YWs7CuKApgoKV2lsbCBjdXJseSBicmFja2V0cyBiZSByZWxldmFudCBhbHNvIGZvciB0aGlzIGVs
c2UgYnJhbmNoPwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
