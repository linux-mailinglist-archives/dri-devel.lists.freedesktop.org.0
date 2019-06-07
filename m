Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB9238734
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 11:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17B189BA3;
	Fri,  7 Jun 2019 09:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E091489BA3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 09:42:03 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607094202euoutp0185640cf74500e24eb8f3a6d820004aab~l4UKloDrs1049510495euoutp01K
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 09:42:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607094202euoutp0185640cf74500e24eb8f3a6d820004aab~l4UKloDrs1049510495euoutp01K
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190607094201eucas1p17e5c03dfe2482d91ddbce03fca522640~l4UKPik6l3276132761eucas1p1r;
 Fri,  7 Jun 2019 09:42:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 36.D1.04298.9613AFC5; Fri,  7
 Jun 2019 10:42:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607094201eucas1p2385e3db42eea3bde5f3d8ce372fc32b5~l4UJb_v2y2838028380eucas1p2n;
 Fri,  7 Jun 2019 09:42:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607094200eusmtrp288b5a00caa558dbc90834b94998a37c3~l4UJKsYgf0906509065eusmtrp2B;
 Fri,  7 Jun 2019 09:42:00 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-af-5cfa31695515
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 30.B4.04146.8613AFC5; Fri,  7
 Jun 2019 10:42:00 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190607094200eusmtip1452cfc5dce846486ecdeae0406ea94c8~l4UIcGpYr1414914149eusmtip1i;
 Fri,  7 Jun 2019 09:41:59 +0000 (GMT)
Subject: Re: [PATCH][next] drm/bridge: sii902x: fix comparision of u32 with
 less than zero
To: Colin King <colin.king@canonical.com>, Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <60c72c12-472b-0b07-610b-f9edab4679c2@samsung.com>
Date: Fri, 7 Jun 2019 11:41:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190603142102.27191-1-colin.king@canonical.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRj13f3YdbW4TmNPGkazPxZpg35cyixBY+Qf+9PEJjb1oqJO2dWV
 aaRYMRVDrTCnpGCiZKTO1DSy8GusVKYJmqgTWjiskd9oZeZ2V/nvPOc5533OgZfCJN2EL5Wi
 yWK1GnWajBThnUNboydT5D9Up/Q7AUzpqFnA/GwuJZmdznKMmVj/TjIlRXqC6Zj2Y4rKnwqZ
 jz015AVKYcgvJRVvNupwRbW+ilB0bcwTCmuJSaAwTXUJFKtG/yhhjCgkkU1L0bHa4NBromSH
 +TOW2Si6MVYxS+SjdqoYeVJAn4amyjlhMRJREroJgWWgFeeHNQS/ZpoIp0pCryJoeCD851ix
 C3hRIwLz3CzBDw4EM5Yql8ObVsHOxn2Xyoe2IRiZ6MacC4wOgxe1M7gTk3QgbLd/Ip1YTIfC
 8tS2y4zTx6ByeNKlOUhHg3WoleA1XmCusrl4z129wzLufvMIFHZUu7EUpm21rsNA9wnh7nC+
 gM8dDm3D79zYGxZNL919DsNOd62bvw3WpjsYb9Yj6GjlUwN9FvpNY7spqN0LgdDSE8zTYVC3
 1IU7aaAPwJTDi89wACo6KzGeFoP+noRXHwXrSIf7QSk0WNbJMiQz7Glm2NPGsKeN4f/dOoQ/
 Q1I2m0tPYjm5hr0exKnTuWxNUlBCRroR7X6oD79NK6/Q+nh8H6IpJNsvVgi3VBJCreNy0vsQ
 UJjMR6yzbKok4kR1zk1WmxGnzU5juT7kR+EyqTjXY/6qhE5SZ7GpLJvJav9uBZSnbz4qF5z3
 73XUTmJhxufehugYhtJ/e7J+KzaiPk9pjO+89NiIFUfJ8+JOVJguat4X2Psjt1PqUxMi7I2L
 lwtKMkM27bLBK8PhX3V6ZeyCh2zwXPVy7r5km0qbKtQVfilzRL7G1oi25pY5ZbeZDHiLDnED
 wY+WHjbUnFHKexes0zKcS1bLj2NaTv0HiAUOO0wDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xu7oZhr9iDHpbNSx6z51ksvi9upfN
 4v+2icwWV76+Z7Po7uxgtdh6S9qic+ISdovLu+awOXB4zGroZfPY+20Bi8fsjpmsHtu/PWD1
 uN99nMnj+I3tTB6fN8kFsEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb
 2aSk5mSWpRbp2yXoZbw9+Zi5YDlXxcVJd1kbGDdzdDFyckgImEis+PSCqYuRi0NIYCmjRNP3
 f8wQCXGJ3fPfQtnCEn+udbFBFL1mlDj2/BgrSEJYIEbi/7c+sG4RgSeMEldX/2UCSTALOEqs
 m3+HBcQWEpjIKLG5SxbEZhPQlPi7+SYbiM0rYCfx8cZfsEEsAioS089cB6sXFYiQOPN+BQtE
 jaDEyZlPwGxOoPq3Fy4xQ8xXl/gzD8aWl2jeOhvKFpe49WQ+0wRGoVlI2mchaZmFpGUWkpYF
 jCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAmNy27Gfm3cwXtoYfIhRgINRiYfXgeFnjBBr
 YllxZe4hRgkOZiUR3rILP2KEeFMSK6tSi/Lji0pzUosPMZoCPTeRWUo0OR+YLvJK4g1NDc0t
 LA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTAKNpTHqjB27I9mXDz9ZU/miQOR
 j60W1a5bfGFj94OqusLIUAs7uZNueQ6W13sW5fCHhy1VTVrxZYFUk/Peo3r9r+bEqvp973u/
 OWTrZeMD2jpvbT5uz5b/W6mk4nZI9AHrU44p8+rWrlyzK77u4d20TeKntp+VYzZb3lCz9v88
 k4uTJhVuaBZTYinOSDTUYi4qTgQABHO8dN8CAAA=
X-CMS-MailID: 20190607094201eucas1p2385e3db42eea3bde5f3d8ce372fc32b5
X-Msg-Generator: CA
X-RootMTR: 20190603142108epcas2p4625777c1aaea18257804ca86bcb64454
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190603142108epcas2p4625777c1aaea18257804ca86bcb64454
References: <CGME20190603142108epcas2p4625777c1aaea18257804ca86bcb64454@epcas2p4.samsung.com>
 <20190603142102.27191-1-colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559900522;
 bh=i04fqGKSBitdACcC66GRsSl53dxqFLrFmmFEFzkxRcg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=s+/hX2/ZKygoTzMu47BlvFgOF7VkiCK3Dsm3j4RnIEFTCJOHbIp6yRmj3ivp+ncdK
 j+hXkk+VR+7rZuiXqsft+BqGXkA8cTurSO8TrF1BJ7Sqm4Yuth6QjwXQ5bzLm01tVb
 BGfhb/agrTW9wFf/wQdozOiwAhlyPZIjtPadLbl8=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMuMDYuMjAxOSAxNjoyMSwgQ29saW4gS2luZyB3cm90ZToKPiBGcm9tOiBDb2xpbiBJYW4g
S2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+Cj4gVGhlIGxlc3MgdGhhbiBjaGVjayBm
b3IgdGhlIHZhcmlhYmxlIG51bV9sYW5lcyBpcyBhbHdheXMgZ29pbmcgdG8gYmUKPiBmYWxzZSBi
ZWNhdXNlIHRoZSB2YXJpYWJsZSBpcyBhIHUzMi4gIEZpeCB0aGlzIGJ5IG1ha2luZyBudW1fbGFu
ZXMgYW4KPiBpbnQgYW5kIGFsc28gbWFrZSBsb29wIGluZGV4IGkgYW4gaW50IHRvby4KPgo+IEFk
ZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnNpZ25lZCBjb21wYXJlZCBhZ2FpbnN0IDAiKQoKCklzIHRo
ZXJlIGEgcnVsZSBpbiBLZXJuZWwgb2YgYWRkaW5nIHN1Y2ggdGFncz8KCkkgaGF2ZSBzcG90dGVk
IG9ubHk6IEFkZHJlc3Nlcy1Db3Zlcml0eS1JRD8KCgpCZXNpZGUgdGhpczoKClJldmlld2VkLWJ5
OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKwqAtLQpSZWdhcmRzCkFuZHJ6
ZWoKCgo+IEZpeGVzOiBmZjU3ODE2MzRjNDEgKCJkcm0vYnJpZGdlOiBzaWk5MDJ4OiBJbXBsZW1l
bnQgSERNSSBhdWRpbyBzdXBwb3J0IikKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8
Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3NpaTkwMnguYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+IGluZGV4IGQ2Zjk4ZDM4OGFj
Mi4uMjFhOTQ3NjAzYzg4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lp
OTAyeC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBAQCAtNzE5
LDcgKzcxOSw3IEBAIHN0YXRpYyBpbnQgc2lpOTAyeF9hdWRpb19jb2RlY19pbml0KHN0cnVjdCBz
aWk5MDJ4ICpzaWk5MDJ4LAo+ICAJCS5tYXhfaTJzX2NoYW5uZWxzID0gMCwKPiAgCX07Cj4gIAl1
OCBsYW5lc1s0XTsKPiAtCXUzMiBudW1fbGFuZXMsIGk7Cj4gKwlpbnQgbnVtX2xhbmVzLCBpOwo+
ICAKPiAgCWlmICghb2ZfcHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwgIiNzb3VuZC1k
YWktY2VsbHMiKSkgewo+ICAJCWRldl9kYmcoZGV2LCAiJXM6IE5vIFwiI3NvdW5kLWRhaS1jZWxs
c1wiLCBubyBhdWRpb1xuIiwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
