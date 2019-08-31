Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46785A4FC5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5A088549;
	Mon,  2 Sep 2019 07:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 855 seconds by postgrey-1.36 at gabe;
 Sat, 31 Aug 2019 17:41:49 UTC
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630126E148
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 17:41:49 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.129.60]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LnB1F-1igkgH456r-00hR0L; Sat, 31
 Aug 2019 19:26:49 +0200
Subject: Re: [PATCH v3 01/11] checkpatch: check for nested (un)?likely() calls
To: Denis Efremov <efremov@linux.com>, Joe Perches <joe@perches.com>
References: <20190829165025.15750-1-efremov@linux.com>
 <0d9345ed-f16a-de0b-6125-1f663765eb46@web.de>
 <689c8baf-2298-f086-3461-5cd1cdd191c6@linux.com>
 <493a7377-2de9-1d44-cd8f-c658793d15db@web.de>
 <c5e4479d-2fb3-b5a5-00c3-b06e5177d869@linux.com>
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
Message-ID: <9de9fb8f-f13f-e9bb-c68d-0ba81010ae8b@web.de>
Date: Sat, 31 Aug 2019 19:26:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <c5e4479d-2fb3-b5a5-00c3-b06e5177d869@linux.com>
Content-Language: en-US
X-Provags-ID: V03:K1:Mb7grKXZ9pH+xlAXEQYPZYdNH7QN+E5OessgUl8uganJH5/1n3T
 faLtS9zrYMJ4tIvgnpUrhBwevqlLRu+WYUkqulrjatf/4Qkg3CHTrYI4KoDABcY7W0k2oNC
 45f3xjVsLioWf+xVr2GDUCLyytlCv1ng76ThWmrQYq56NZnwNTIvNq0PEAQm8/i4TXitEj+
 /ahFCq9RdntQV/9iWiPBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vi85VnigV88=:aP0JDohRX8y/31VBV3NfzM
 V7Mg82eIL9YeMM9JmcLHR2+JSy/u2GSAVahOP5UERpospS4M0hB4xVshAznsIT5Sodwo9BoOq
 R1u9QujmN+egv1gOCtOSs4zA+czJBzEH6jBPfVHQitczc3jzCzcumNyKvZxnHz/R60kEiCkoq
 RCnrg5w9hLHy1dP4MHG9kphz6UWpqQoQZhpybg6N8dZ9/bUYiA1j8jlgkCdS7X+vct2OiB/z6
 k3vUS8GvyOWChpjBR3oj+hoyVJ/xhKCCj2c5He+EUK9o/IZ/Hj9rDFKhf+JTqJTcqrpD87i9R
 wUkTrwGiy9P6iigNetR5eTRjYQ1V3v0U7JIoLautu5/N+nmDo6Vjg4rr4QZOfcFBA9LenX0r1
 HT0pIfTttNMTaDgrVc5y4O0186Ass1osrHMFfJTuUnRP2A3inxSDCOLvbTbDTmIj3/vM4D9mY
 EGPbHXrlaZeVbNPy3iX+b0TYKWtbBeRMboq0eW0TdHfPEJoNJKSIyvVC/aG3VQf9Q57fIG2J7
 fVgXWzQwm29wrBczi/96GmXshyp5SkeF2+lv6OAQXvjxyjcIQ6FesvkvxAglS104S1lruBuKQ
 oDY25pg2O9BOWG1OAzofjlOuIia2hi/OXLzNHdijk5TzUHR7bW+Z3QDnZUWHu59eGP6F3OXgX
 aFKpSpjllfPyz7xzElyy8mAhUQ1BurlGJ5YdL0X819z3u8x+Oh5cv8tz0NpZm5tqlr9NiUmjx
 ksdThYH/merAEL7idhNGuuPjfurUmNzLjOx5DNKKMlkjMV51scxCczkN6SSa3xJtz6g2aJqM8
 FpEIm/L5irPjMyp8KMsZq+mBWoyoOBIYad96UbIcZbK7xkoU+YSgK5FPT9A9qvu3vZMooJLQS
 33vRqZS5mp9PO6ZlhH1Czq7GErpeIf+mOy2JhLF2G1WbigzKlZ0aq72Sojl7exGA0UCPAnwVN
 HN274eCNk0Q2iLFipJalqdbhcU9a5bsgC0/rvzPnCskvPYNIOyQi4A+QerGSdhvNx51cckCm+
 yHcikqTCR6U2m8CH6N8ox1hqhccVu4koCWAk3B3YPaIplXmyatWdzQP/gZ3ivRaIZSFvOhJK6
 DZeRGFjFQwns+MMDnfILC8jLleQGeQszzxH9XpUNO+tQCP/cO67UBZbjEjmlONb8dp3WUC0HF
 nGvJYDdVnbvmt7dloAjn0tvswrsQ//kxwF31KL6MxOFm5aOQ==
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1567273307;
 bh=yQM2//yRNIKgrYfmnX/+7v7UH1bRgtDE8fxceDLJw/k=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=YKBeoSrHEBGlQrsqDLIZXsDLXH66Vo2irpBNqbgWEd9qYzZ9um5Lh+bdtPnBaqVpz
 SdD9kEQa4Wf6MYobBOJRm43ZRSRReCh343udOMEK6gGAD2yd7HbMHSOa/uJXgmwh/u
 ZInqD5whjEjyM3AvdeN8VVAdAj2dZc0/2XrATxnY=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org, Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-rdma@vger.kernel.org,
 Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>,
 Saeed Mahameed <saeedm@mellanox.com>, linux-input@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Pismenny <borisp@mellanox.com>,
 linux-arm-msm@vger.kernel.org, linux-wimax@intel.com,
 Enrico Weigelt <lkml@metux.net>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Whitcroft <apw@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sean Paul <sean@poorly.run>,
 Anton Altaparmakov <anton@tuxera.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4+Pj4gKyMgbmVzdGVkIGxpa2VseS91bmxpa2VseSBjYWxscwo+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKCRsaW5lID1+IC9cYig/Oig/OnVuKT9saWtlbHkpXHMqXChccyohP1xzKihJU19FUlIo
PzpfT1JfTlVMTHxfVkFMVUUpP3xXQVJOKS8pIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgV0FSTigiTElLRUxZX01JU1VTRSIsCuKApgo+PiBcYig/OnVuKT9saWtlbHlccyoKPgo+IFRo
aXMgcGFpciBvZiBicmFja2V0cyBpcyByZXF1aXJlZCB0byBtYXRjaCAidW5saWtlbHkiCj4gYW5k
IGl0J3Mgb3B0aW9uYWwgaW4gb3JkZXIgdG8gbWF0Y2ggImxpa2VseSIuCgpJIGFncmVlIGFsc28g
dG8gdGhpcyB2aWV3IGlmIHlvdSByZWZlciB0byB0aGUgc2hvcnRlbmVkIHJlZ3VsYXIgZXhwcmVz
c2lvbiBoZXJlLgpCdXQgSSBnb3QgYW4gb3RoZXIgZGV2ZWxvcG1lbnQgb3BpbmlvbiBmb3IgYW4g
ZXh0cmEgcGFpciBvZiBub24tY2FwdHVyaW5nIHBhcmVudGhlc2VzCmF0IHRoZSBmcm9udCAoZnJv
bSB0aGUgdmVyc2lvbiB3aGljaCB5b3Ugc3VnZ2VzdGVkKS4KClJlZ2FyZHMsCk1hcmt1cwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
