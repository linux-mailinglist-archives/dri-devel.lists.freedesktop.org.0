Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B50D214E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 09:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376186EAA6;
	Thu, 10 Oct 2019 07:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9E06EAA6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 07:04:54 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191010070452euoutp025ef355d7764b951f61631ad26e4df80b~MNzoNJcMO0321803218euoutp02a
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 07:04:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191010070452euoutp025ef355d7764b951f61631ad26e4df80b~MNzoNJcMO0321803218euoutp02a
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191010070452eucas1p2536e7967a31f117344e66eeb02092173~MNzn4iXeq0392803928eucas1p2C;
 Thu, 10 Oct 2019 07:04:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 86.B6.04374.418DE9D5; Thu, 10
 Oct 2019 08:04:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191010070451eucas1p1c05d72ce4c3709a82de805e38a087813~MNznRCSDS2845628456eucas1p1E;
 Thu, 10 Oct 2019 07:04:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191010070451eusmtrp100dc99bc5b07635c96c8270177c2b855~MNznQVugT2943929439eusmtrp1V;
 Thu, 10 Oct 2019 07:04:51 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-67-5d9ed8148456
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 59.11.04117.318DE9D5; Thu, 10
 Oct 2019 08:04:51 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191010070450eusmtip29f024496be5d307d3780b94a00b1b2f2~MNzmyPmvx1878018780eusmtip2c;
 Thu, 10 Oct 2019 07:04:50 +0000 (GMT)
Subject: Re: [PATCH RESEND] gpu: drm: bridge: analogix-anx78xx: convert to
 i2c_new_dummy_device
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <97111f38-0820-edf5-8316-58fef6b065cf@samsung.com>
Date: Thu, 10 Oct 2019 09:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008203145.3159-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUgUYRju25mdnV1dGVfFN5WihSIlj9QfQ4dmdMyPfgRBSJvYpINr6aq7
 alqUkprmhavQ4qampWlKeZ9gh4K6mEe5phke1BYqiZBnkZrrKPnveZ/neY8HXhKTvRc6kKGq
 aE6tYsPkhARv6vo94Go7WhTgsVGH01n9BgG90aTFaOPSPEEPr8xgtOHnME4/1JaK6LS1RUQP
 tRUQdEe2gs7uP39KwsyPpoiY9uVinHmcli9kenI+Cpjm5SkhM5nRLWB+lFTjzNusPJxZqNt3
 UXxFciKYCwuN5dTuPtckynZdLxHZaBGnzcjBE9FzcToSk0B5w5uFT0Q6kpAyqgJB7YsqEV8s
 Ilgt78P5YgHB1LBJtNOyvJaJeKEcQdKYcbuYQ6DNStx0kaQNxUKD3svcYEtdhq6U0q1JGFUj
 gMrUWcwsEJQzrNV/JsxYSvlAf+v4Fo9TB2HgS/IWb0f5w6+pTiHvsQZDvgk3YzF1FrTGR1se
 jNoPzXMFGI/tYcz0RGBeBtSMCJbaSrbPPgODrbUCHtvAbHfDNu8EvXmZOI8TYLIiGeOb0xA0
 1rRivHAcOrs/CM3JsM2rq9vcedoPhqbbCTMNlBWMzlnzN1hBbpMO42kppD2Q8e4DMNnXuD3Q
 HsoGl4gcJNfvSqbflUa/K43+/95ihFciey5GEx7CabxU3C03DRuuiVGFuAVFhNehzR/rXe9e
 akGv/17vQBSJ5JZSpaEwQCZkYzXx4R0ISExuK32qLwiQSYPZ+NucOiJQHRPGaTqQI4nL7aV3
 9kwpZFQIG83d5LhITr2jCkixQyJSKFJtZRdspvNXXo3b+Rf0OB/72mWhRWUeUYKklD9xjnEr
 I+r4EafvE13uurvWFsrMrD6lb1VQW6pnXeXpl+cuuZxMaJ+tz74q9PaMKjvcYCg0VjVNBPrl
 HnFdfPJs/Ibu/mq1ad5zZsKg+3aIbrnX6GtpeNdgXFfNhbJFe2MmFXJco2SPumBqDfsPKKmD
 dl8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xe7rCN+bFGpz4L2HRe+4kk8X/bROZ
 La58fc9mcfX7S2aLk2+uslh0TlzCbtHx9wujxeVdc9gsDvVFW/Sdc3fg8nh/o5XdY++3BSwe
 sztmsnqcmHCJyWP7twesHve7jzN5PFu4nsXjQO9kFo/Pm+QCOKP0bIryS0tSFTLyi0tslaIN
 LYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MvZOP81WsJW7YmL3BJYGxmWcXYyc
 HBICJhLf/vYwdjFycQgJLGWUuLNuJzNEQlxi9/y3ULawxJ9rXWwQRa8ZJf4caWXpYuTgEBZI
 lNgyyxikRkQgTOLqnDnsIDXMAhuYJP53f2WFaJjBKHHmSzsbSBWbgKbE3803wWxeATuJczvv
 gm1gEVCVOH+7BSwuKhAhcXjHLEaIGkGJkzOfsIDYnAKuEhOvTAOrYRZQl/gz7xIzhC0vsf3t
 HChbXOLWk/lMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQI
 jNxtx35u2cHY9S74EKMAB6MSD++B03NjhVgTy4orcw8xSnAwK4nwLpo1J1aINyWxsiq1KD++
 qDQntfgQoynQcxOZpUST84FJJa8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoR
 TB8TB6dUA2PF37CefzeluSfXhyYtjU//36igdVX3ZL1o2af3vj2vRK+uztZVK10pXb/j9DuR
 ZcsY6ndc+X5zj9IhRRsz8/olKpb3bz5UYFzD9ThKK9fll7Zp/K8tHw3l2+7fm83pI7rdbcJX
 7gXTzKSnXn9YsGblqoY7mz8LVjF3L/nekXD0pD27z63529uVWIozEg21mIuKEwGJ8XFX8gIA
 AA==
X-CMS-MailID: 20191010070451eucas1p1c05d72ce4c3709a82de805e38a087813
X-Msg-Generator: CA
X-RootMTR: 20191008203222epcas4p4a9ab2b8dd10759e61ce9b1ec4547d13f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191008203222epcas4p4a9ab2b8dd10759e61ce9b1ec4547d13f
References: <CGME20191008203222epcas4p4a9ab2b8dd10759e61ce9b1ec4547d13f@epcas4p4.samsung.com>
 <20191008203145.3159-1-wsa+renesas@sang-engineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1570691092;
 bh=IcYxKHi2Xesm/jrMZDTKLhWj1oXp7N/IpwBAwGTZE3I=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=l3hTUmRw7+YtnUgTw8WBf3k5wL80B4GPq0OZNEP1q1O1NqjWmqLyFrm0Tm+gUhDul
 Tsj6brbJr9Ty0HVownVILTMZcN83SeDmNUpDS82Toz9thMqMWGwWgpywPNO33Zuybz
 5YbM/NGv5a/EWEsplhY/SKh59Cu1eYx1d3dSrDW0=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDguMTAuMjAxOSAyMjozMSwgV29sZnJhbSBTYW5nIHdyb3RlOgo+IE1vdmUgZnJvbSB0aGUg
ZGVwcmVjYXRlZCBpMmNfbmV3X2R1bW15KCkgdG8gaTJjX25ld19kdW1teV9kZXZpY2UoKS4gV2UK
PiBub3cgZ2V0IGFuIEVSUlBUUiB3aGljaCB3ZSB1c2UgaW4gZXJyb3IgaGFuZGxpbmcuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcu
Y29tPgoKCkJyaWFuJ3MgcGF0Y2ggaXMgYWxyZWFkeSBhcHBsaWVkLgoKClJlZ2FyZHMKCkFuZHJ6
ZWoKCgo+IC0tLQo+Cj4gUmViYXNlZCB0byB2NS40LXJjMiBzaW5jZSBsYXN0IHRpbWUuIE9uZSBv
ZiB0aGUgbGFzdCB0d28gdXNlcnMgb2YgdGhlCj4gb2xkIEFQSSwgc28gcGxlYXNlIGFwcGx5IHNv
b24sIHNvIEkgY2FuIHJlbW92ZSB0aGUgb2xkIGludGVyZmFjZS4gT25seQo+IGJ1aWxkIHRlc3Rl
ZC4KPgo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyB8IDYgKysr
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYwo+IGluZGV4IDNjN2Nj
NWFmNzM1Yy4uYmU3NzU2MjgwZTQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgtYW54Nzh4eC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC1hbng3OHh4LmMKPiBAQCAtMTM1MCwxMCArMTM1MCwxMCBAQCBzdGF0aWMgaW50IGFueDc4
eHhfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCj4gIAo+ICAJLyogTWFwIHNs
YXZlIGFkZHJlc3NlcyBvZiBBTlg3ODE0ICovCj4gIAlmb3IgKGkgPSAwOyBpIDwgSTJDX05VTV9B
RERSRVNTRVM7IGkrKykgewo+IC0JCWFueDc4eHgtPmkyY19kdW1teVtpXSA9IGkyY19uZXdfZHVt
bXkoY2xpZW50LT5hZGFwdGVyLAo+ICsJCWFueDc4eHgtPmkyY19kdW1teVtpXSA9IGkyY19uZXdf
ZHVtbXlfZGV2aWNlKGNsaWVudC0+YWRhcHRlciwKPiAgCQkJCQkJYW54Nzh4eF9pMmNfYWRkcmVz
c2VzW2ldID4+IDEpOwo+IC0JCWlmICghYW54Nzh4eC0+aTJjX2R1bW15W2ldKSB7Cj4gLQkJCWVy
ciA9IC1FTk9NRU07Cj4gKwkJaWYgKElTX0VSUihhbng3OHh4LT5pMmNfZHVtbXlbaV0pKSB7Cj4g
KwkJCWVyciA9IFBUUl9FUlIoYW54Nzh4eC0+aTJjX2R1bW15W2ldKTsKPiAgCQkJRFJNX0VSUk9S
KCJGYWlsZWQgdG8gcmVzZXJ2ZSBJMkMgYnVzICUwMnhcbiIsCj4gIAkJCQkgIGFueDc4eHhfaTJj
X2FkZHJlc3Nlc1tpXSk7Cj4gIAkJCWdvdG8gZXJyX3VucmVnaXN0ZXJfaTJjOwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
