Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC15B198E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 10:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5C36EECA;
	Fri, 13 Sep 2019 08:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F1D6EECE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 08:25:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190913082509euoutp0290649375212ceeaa2f76eb433bcb90b0~D8fBeqapI2584625846euoutp02F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 08:25:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190913082509euoutp0290649375212ceeaa2f76eb433bcb90b0~D8fBeqapI2584625846euoutp02F
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190913082509eucas1p25aefda01ff4af9b0fd4b9d23d2e98a0e~D8fAtmFO-2693226932eucas1p2r;
 Fri, 13 Sep 2019 08:25:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 44.38.04469.4625B7D5; Fri, 13
 Sep 2019 09:25:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190913082508eucas1p1fe8f4a4dd962539e0831da3950f6f017~D8e-77knv1656016560eucas1p1P;
 Fri, 13 Sep 2019 08:25:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190913082508eusmtrp1bfa0be12c15e864cffef846e714258d9~D8e-6r_LY1187411874eusmtrp12;
 Fri, 13 Sep 2019 08:25:08 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-6e-5d7b52641f5f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3F.91.04117.4625B7D5; Fri, 13
 Sep 2019 09:25:08 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190913082507eusmtip1a5e208f4d2fdc951fa14515d85d2978e~D8e-Wv34X0164301643eusmtip1V;
 Fri, 13 Sep 2019 08:25:07 +0000 (GMT)
Subject: Re: [PATCH] Revert
 "drm/bridge: adv7511: Attach to DSI host at probe time"
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <5b277456-2508-981c-7909-dde5f38f8ef6@samsung.com>
Date: Fri, 13 Sep 2019 10:25:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829180836.14453-1-robdclark@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHe/bcO6/WtesyPGpUDnqz1DQ/XEskKeIGfYggkMRq5W1Kvu6q
 ZUIuSJuaY2VZm/kSGVoEhe9OemFSU6yVpqaGTbK0LDN8q1lWzjvJb7/znOd/zv8Ph8KyMdKL
 ik1I4VUJiji51IWoe2az+EUfyIjaOvg8mM23tErYv3WXMNs5NSZlu358xmzr1y6CzblU7sS+
 Nt6QskZrmYQ1aSPZbtsgZodv/sRspa0WsdVVV/FOmhvryXLiitTtBPdwuozgGg39c6VGT3It
 ug4J981iceLqpwdIzppnlnDlhV1S7kl+AcEVFbwnuYmq1fvpQy6h0XxcbBqvCgg76hLT80dH
 Jk26nS5/PCJRo07XXORMARMMhX0XyFzkQsmYSgTDnz5hsZhEMPmsAInFBILSbKPTgkTX+8Uh
 qUDwVqt3SEYR6FsHsP3XCuYgvKzRSezszuyGlo5f8wrMGDFc+V4itTekzCaYre6dY4qimTCY
 nZnfQDDr4Lf2/fyclUwEjA80k3amGTdo1X8g7OzMhEBn9Z15xswaqB+9gUX2gL4PpRL7LmD0
 FHRbrpOi7d0wNFjsiLACRsw1Dl4FbQUXCZEzwVp5HotiDYLaB41YbOyAZnM7aTeK50zfNwbY
 EZhwuD6cLKIr9Iy6iRZc4XLdNSw+06DJlokzfMD6otYxzwNuv5qS6pDcsCiYYVEYw6Iwhv9r
 yxBxF3nwqUK8khcCE/hT/oIiXkhNUPofT4yvQnNn2PbHPN6ApjqOmRBDIfkymt1yJkpGKtKE
 9HgTAgrL3el9X9OjZHS0Iv0Mr0o8okqN4wUT8qYIuQedsWQgUsYoFSn8SZ5P4lULXQnl7KVG
 ruoHkfqSj6acZG+z8oTzroZwQ1a257ZOQ9HnN5lThSGr1xbLD556pHmleipV52ws3fzOz0d7
 c79hz/JN3yzVynsREVUKyluzwWdPPdedmZIS7h8UYw39e6sifCzI5t1/fL1n21Lt5hjf2JLS
 phbhbOG5XA2/d+Lw2tiZoYqmvO02OSHEKAJ9sUpQ/ANF+ZDDggMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42I5/e/4Xd2UoOpYg793+Sx6z51ksvi/bSKz
 xZWv79ksrn5/yWxx8s1VFovOiUvYLS7vmsNmsev+AiaLQ33RFtd+Pma2eL7wB7PFip9bGS02
 b5rK7MDr8f5GK7vH7IaLLB57vy1g8dg56y6Q2zGT1ePEhEtMHu/OnWP32P7tAavH/e7jTB5L
 pl1l8zjQO5nFY/bkR6wenzfJBfBG6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZ
 mSrp29mkpOZklqUW6dsl6GXc+DeBteCLYMWS/a+YGhiv8HUxcnJICJhITLj5mhXEFhJYyiix
 f2o2RFxcYvf8t8wQtrDEn2tdbF2MXEA1rxkl/nzfyNLFyMEhLBAqMaGXC6RGRMBF4sSl36wg
 NcwCe5glHr24CdXQAzT06VKwSWwCmhJ/N4MkODh4Bewk/v5iBwmzCKhK/Ol7BFYiKhAhcXjH
 LEYQm1dAUOLkzCcsIDangKXElc0rwWxmAXWJP/MuMUPY8hLb386BssUlbj2ZzzSBUWgWkvZZ
 SFpmIWmZhaRlASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMDo33bs55YdjF3vgg8xCnAw
 KvHwWuhUxQqxJpYVV+YeYpTgYFYS4fV5UxkrxJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnA
 xJRXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGxpyd174655S9P
 6XAtOClV2lnzadvCgwcyfbboKYUWfPA+uunc+kk9YSzHfoRs2jDvPb+9iQw/g4vE5cVWq9f4
 Fk6tevO57PGh9tfzW+6di7YLMEjQCrKdbzAz6f/029lXD8jf3cLvWbXtju0E38DVLOHJJ8xi
 2DyZt8byi2zMyOpWTawVn3BYiaU4I9FQi7moOBEAcSHrSxQDAAA=
X-CMS-MailID: 20190913082508eucas1p1fe8f4a4dd962539e0831da3950f6f017
X-Msg-Generator: CA
X-RootMTR: 20190829181055epcas3p3ee33cfe662517555ff0c1ce456757e7c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190829181055epcas3p3ee33cfe662517555ff0c1ce456757e7c
References: <CGME20190829181055epcas3p3ee33cfe662517555ff0c1ce456757e7c@epcas3p3.samsung.com>
 <20190829180836.14453-1-robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568363109;
 bh=Y+70eoeOySg6zv/t1zkRpHQ8LjxlLH2L7D/4kmCRFa8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=HZff8Y2UObY+CiWyoEps6RUlvLHXoU0MaglGKAADzFkgOHKnB9Zs5k5IC5/c+U8pK
 8DCl6t3ShsknCrkSOowId5JCjDYjLpC1EA+Iyt75JIS5Q0k0sySA3ch/I2LpU0wDDB
 t0uhDxaBmRUTc5JvAnxxuztheziutRfvtDuxhsSM=
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Matt Redfearn <matt.redfearn@thinci.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkuMDguMjAxOSAyMDowOCwgUm9iIENsYXJrIHdyb3RlOgo+IEZyb206IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPgo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgODNmMzViYzNh
ODUyZjFjMzg5MmM3NDc0OTk4YzVjZWM3MDdjN2JhMy4KPgo+IFRoaXMgY29tbWl0IHRoZSB3cm9u
ZyBkaXJlY3Rpb24sIHdlIHNob3VsZCByZWFsbHkgYmUgY2hhbmdpbmcgcGFuZWwKPiBmcmFtZXdv
cmsgdG8gYXR0YWNoIGRzaSBob3N0IGFmdGVyIHByb2JlLCByYXRoZXIgdGhhbiBpbnRyb2R1Y2lu
Zwo+IHRoZSBzYW1lIHByb2JlLW9yZGVyIHByb2JsZW0gdGhhdCBwYW5lbHMgYWxyZWFkeSBoYXZl
IHRvIGJyaWRnZXMuCj4KPiBUaGUgcmVhc29uIGlzLCB0aGF0IGluIG9yZGVyIHRvIGRlYWwgd2l0
aCBkZXZpY2VzIHdoZXJlIGRpc3BsYXkgaXMKPiBlbmFibGVkIGJ5IGJvb3Rsb2FkZXIgYW5kIGVm
aWZiL3NpbXBsZWZiIGlzIHVzZWQgdW50aWwgdGhlIHJlYWwKPiBkcml2ZXIgcHJvYmVzLCB3ZSBu
ZWVkIHRvIGJlIGNhcmVmdWwgdG8gbm90IHRvdWNoIHRoZSBoYXJkd2FyZQo+IHVudGlsIHdlIGhh
dmUgYWxsIHRoZSBwaWVjZXMgcHJvYmVkIGFuZCByZWFkeSB0byBnbywgb3RoZXJ3aXNlIHlvdQo+
IHdpbGwga2lsbCB0aGUgd29ya2luZyBkaXNwbGF5LCBsZWF2aW5nIHlvdXJzZWxmIChhdCBsZWFz
dCwgaW4gdGhlCj4gY2FzZSBvZiByZWFsIGNvbnN1bWVyIGRldmljZXMgdGhhdCBkbyBub3QgaGF2
ZSBhIGRlYnVnIFVBUlQpIHdpdGgKPiBubyBnb29kIHdheSB0byBkZWJ1ZyB3aGF0IHdlbnQgd3Jv
bmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+
CgoKQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LWZpeGVzLCB3aXRoIGNoYW5nZWQgY29tbWl0IG1l
c3NhZ2UgLSBJIGhvcGUgaXQKaXMgT0sgZm9yIHlvdS4KCgpSZWdhcmRzCgpBbmRyemVqCgoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgfCAxMiAr
KystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2
NzUxMV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5j
Cj4gaW5kZXggOThiY2NhY2U4YzFjLi5mNmQyNjgxZjY5MjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYwo+IEBAIC04NzQsNiArODc0LDkgQEAg
c3RhdGljIGludCBhZHY3NTExX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRn
ZSkKPiAgCQkJCSAmYWR2NzUxMV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKPiAgCWRybV9jb25u
ZWN0b3JfYXR0YWNoX2VuY29kZXIoJmFkdi0+Y29ubmVjdG9yLCBicmlkZ2UtPmVuY29kZXIpOwo+
ICAKPiArCWlmIChhZHYtPnR5cGUgPT0gQURWNzUzMykKPiArCQlyZXQgPSBhZHY3NTMzX2F0dGFj
aF9kc2koYWR2KTsKPiArCj4gIAlpZiAoYWR2LT5pMmNfbWFpbi0+aXJxKQo+ICAJCXJlZ21hcF93
cml0ZShhZHYtPnJlZ21hcCwgQURWNzUxMV9SRUdfSU5UX0VOQUJMRSgwKSwKPiAgCQkJICAgICBB
RFY3NTExX0lOVDBfSFBEKTsKPiBAQCAtMTIxOSwxNyArMTIyMiw4IEBAIHN0YXRpYyBpbnQgYWR2
NzUxMV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjLCBjb25zdCBzdHJ1Y3QgaTJjX2Rldmlj
ZV9pZCAqaWQpCj4gIAlkcm1fYnJpZGdlX2FkZCgmYWR2NzUxMS0+YnJpZGdlKTsKPiAgCj4gIAlh
ZHY3NTExX2F1ZGlvX2luaXQoZGV2LCBhZHY3NTExKTsKPiAtCj4gLQlpZiAoYWR2NzUxMS0+dHlw
ZSA9PSBBRFY3NTMzKSB7Cj4gLQkJcmV0ID0gYWR2NzUzM19hdHRhY2hfZHNpKGFkdjc1MTEpOwo+
IC0JCWlmIChyZXQpCj4gLQkJCWdvdG8gZXJyX3JlbW92ZV9icmlkZ2U7Cj4gLQl9Cj4gLQo+ICAJ
cmV0dXJuIDA7Cj4gIAo+IC1lcnJfcmVtb3ZlX2JyaWRnZToKPiAtCWRybV9icmlkZ2VfcmVtb3Zl
KCZhZHY3NTExLT5icmlkZ2UpOwo+ICBlcnJfdW5yZWdpc3Rlcl9jZWM6Cj4gIAlpMmNfdW5yZWdp
c3Rlcl9kZXZpY2UoYWR2NzUxMS0+aTJjX2NlYyk7Cj4gIAlpZiAoYWR2NzUxMS0+Y2VjX2NsaykK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
