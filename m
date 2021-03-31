Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44234FD6E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6B36EA32;
	Wed, 31 Mar 2021 09:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF8F6EA32
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:50:41 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210331095039euoutp022e59d3f0eeca74be1ee23275c8ceae17~xZH9iV_c21694916949euoutp02H
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:50:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210331095039euoutp022e59d3f0eeca74be1ee23275c8ceae17~xZH9iV_c21694916949euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617184239;
 bh=n4ijVkW2p2CbAjNlaISf5YB9Unqy0tGgSS/tBxUJTwA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=bzm8gFrsVVfkINNQPIwJUp0A3JOgzL3UJlUJcAkRarXPkt+zy7vnw1U1UwFWtGz1z
 7dLAbYVVg4cZ9HFlFsDWhGyFCW8JhgXb/5+PQnuXKjW32FrF3wVXCZe4plB7DlUwgC
 rdtEic7E6LiNW1SmLyD/yq0J3nUuJj6gQlt9iMwI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210331095039eucas1p289ed193f5a81de10a1de804bcf72937f~xZH9Oec1s0532205322eucas1p25;
 Wed, 31 Mar 2021 09:50:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 12.4E.09452.EE544606; Wed, 31
 Mar 2021 10:50:38 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210331095038eucas1p156a73f3dd0f205a44856e27b9682ab2b~xZH8kx2oX2614426144eucas1p1t;
 Wed, 31 Mar 2021 09:50:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210331095038eusmtrp2e5306a4a5d0799cb7f4007cd8b3c6992~xZH8j5_v92531125311eusmtrp2Y;
 Wed, 31 Mar 2021 09:50:38 +0000 (GMT)
X-AuditID: cbfec7f2-a9fff700000024ec-8f-606445ee41ae
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F8.F4.08705.EE544606; Wed, 31
 Mar 2021 10:50:38 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210331095036eusmtip25338a8acbe16b9a4ffd03c449074ce49~xZH6yaBqN0921909219eusmtip2G;
 Wed, 31 Mar 2021 09:50:36 +0000 (GMT)
Message-ID: <4c70cdb6-7fab-dc53-121e-f355da1ea14f@samsung.com>
Date: Wed, 31 Mar 2021 11:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
 Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 04/14] drm/bridge: ti-sn65dsi86: Reorder remove()
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210329195255.v2.4.Ifcf1deaa372eba7eeb4f8eb516c5d15b77a657a9@changeid>
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUwTZxzH99xzvbsSC0dx4RHfYsfULVrmZpabEpgZZJctSxRfkmGivckN
 HbSwtuA0vrDhENupIAZCi2AUCnZuoFAo2o1ycyuMUVAGVm2sUhcGEVCKmjLHZjmW8d/n9/09
 399bHgrKRyUx1B6NntdquEwFEYY3/xLsWT2WnKZ64/Toeua4uxNjutrGcKbb0k4wvz8ZJ5j+
 Z8OQ6XzYjzPHiqtJpritm2T6rlQQjHBiOzMQ9ENmwnQfMnVBG2COGuKZ4M0CyLi8f2Dv0uy4
 52uSNeddx1lzYbmEPe8YxtiKcx7IdhTdwFjvgINgW57ek7A+owtjq0v7CdZ5vARnA5eXbJyX
 GhafxmfuyeW1cQmqsN3CAxeR3RbxxVTAS+SB6nkGIKUQvRa5/VbcAMIoOV0HUEPJJCYGkwB5
 3E2zQQCgpyfKgAFQMxaL+4Co1wJU6eyAYvAnQHeMJ8lQXRmdgIyDjTDEOP0q6uu6C0U9EnWW
 P8BD/DKtQlZPLRbiKJpFBpsgCTGko9FXkxckoaLz6WmAvi32z4wB6QCGJk4LMw6Cfg393XiL
 CLGU3ooqbfmk6F6K8m3mmZEQfVuKrg76obhqErJZL+IiR6ERVxMp8iL0T2sVJvJh5Ks7Mmsu
 BMjW0DprXo+87ikidAD4onP9lThR3oCe+aoI8S7hyDMaKc4Qjk41l0FRlqHCArn4ehnyddtm
 C0ajmt4nRBFQmObcxTRnf9OcbUz/9z0LcCuI5nN06nRet0bD71XqOLUuR5Ou3JWlvgxe/Miu
 adeEHZwZeawUAEYBASAKKubLopycSi5L4/bt57VZO7U5mbxOAAspXBEts5ov7pTT6Zyez+D5
 bF77XxajpDF5mJzb8tGCtYszfr72w8fKXvsrsVHDMRHKgrtLN5S/pT6UvPrST1cvfJ9QBVeQ
 i5XPT5Lm2rfP+D4cyrqtInu26/sqHD360pSN4yt2bKMnfjs28s2gsshyZ1Pjqpq+fZ9kTD9K
 eScVFhpf2vppZKJ98H3HskC9IpB/qdY/5EmKmLoXk20NJIH2dYlxkzX6+nAtqvi8zBGMbR5L
 Wbn8eYOio+gvYQE9FH9+ubN1VVMu2PZmguZWO2c3Lxmg/EON6u/eO/fQYi3ZW+lsSbwmWHZ8
 GVua25D846ZeLjJ1JSWBWz47mnW//NfEs7uAvUa6/8jBwAePFJuNN242Fwx7q0s3X2+jW0gF
 rtvNrXkdanXcv6BfVrMABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRmVeSWpSXmKPExsVy+t/xe7rvXFMSDP7sE7LoPXeSyeL0/ncs
 FmeXHWSzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9ktLu+aw2ZxqC/a4trPx8wWn2Y9ZLZY
 8XMro0V7l43Fz+ttzBbH7zxlchDweH+jld1jdsNFFo/ZHTNZPRbvecnkMWfRDWaPExMuMXnc
 ubaHzWP7twesHve7jzN5LJl2lc3jQO9kFo/Pm+QCeKL0bIryS0tSFTLyi0tslaINLYz0DC0t
 9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mg49Oc5WsJ+/4tfnO2wNjEt4uhg5OCQETCSW
 navpYuTiEBJYyigxd+pyxi5GTqC4uMTu+W+ZIWxhiT/XuthAbCGBZ4wSi+cHgti8AnYS3Y82
 g9WwCKhKXD59jxkiLihxcuYTFhBbVCBB4uyHeUwgtrCAh0TX1kOsIDYz0PymLytZQRaLCDQw
 SVy6u5gJxGEW+Mok0fJqKTvESbcZJeYf+wbWwiagKfF3802wMzgFQiXmbW1mhxhlBjS2ixHC
 lpdo3jqbeQKj0Cwkl8xCsnEWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECEwJ
 24793LyDcd6rj3qHGJk4GA8xSnAwK4nwCh9ITBDiTUmsrEotyo8vKs1JLT7EaAoMjonMUqLJ
 +cCklFcSb2hmYGpoYmZpYGppZqwkzrt17pp4IYH0xJLU7NTUgtQimD4mDk6pBqblB45ezXb8
 LtO5eDLH1hoVbdM8j0yLBe+FVcp9Fv35d0blqMSUXstrzxb6C68r3aG3KEbP/PG21qq7O+Ot
 DjwSzpac7XHxpxPDjO9G2+ME+9nWPZy4527gzKmly3Xubru9qCX8X8LPhbWp3lsXJzmdsb39
 cV27/ZojfrNnLeuZ4Fm/32KNh4ZwRWjt7Ba+xtytBWZT9V9nrP5p9LomT70yQVSgdOqxroQJ
 6m+mPGrIOf/23a9d55NjTudt+CyRtNTX+4+w9xt7uWf7lNL4OZXWu23VYxX6ppK36cw7XR0/
 lrerv3xgCxTWDHph/Prfg328x+ROZE1lS8qI/nG7Lmxn/TTmKeYy0zcbBEw+fsxaiaU4I9FQ
 i7moOBEAMaA6JpIDAAA=
X-CMS-MailID: 20210331095038eucas1p156a73f3dd0f205a44856e27b9682ab2b
X-Msg-Generator: CA
X-RootMTR: 20210330025419eucas1p2982892803a5d05226dbe6781bff61233
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025419eucas1p2982892803a5d05226dbe6781bff61233
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025419eucas1p2982892803a5d05226dbe6781bff61233@eucas1p2.samsung.com>
 <20210329195255.v2.4.Ifcf1deaa372eba7eeb4f8eb516c5d15b77a657a9@changeid>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClcgZG5pdSAzMC4wMy4yMDIxIG/CoDA0OjUzLCBEb3VnbGFzIEFuZGVyc29uIHBpc3plOgo+IExl
dCdzIG1ha2UgdGhlIHJlbW92ZSgpIGZ1bmN0aW9uIHN0cmljdGx5IHRoZSByZXZlcnNlIG9mIHRo
ZSBwcm9iZSgpCj4gZnVuY3Rpb24gc28gaXQncyBlYXNpZXIgdG8gcmVhc29uIGFib3V0Lgo+Cj4g
Tk9URVM6Cj4gLSBUaGUgTUlQSSBjYWxscyBwcm9iYWJseSBiZWxvbmcgaW4gZGV0YWNoKCkgYnV0
IHdpbGwgYmUgbW92ZWQgaW4gYQo+ICAgIHNlcGFyYXRlIHBhdGNoLgoKClRoZSBtaXBpIGlzIGlu
Y29ycmVjdGx5IGhhbmRsZWQgYWxyZWFkeSAtIG1pcGkgZGV2aWNlcyBhcmUgc2VhcmNoZWQgCmFm
dGVyIGJyaWRnZSByZWdpc3RyYXRpb24gLSBpdCBzaG91bGQgYmUgcmV2ZXJzZSwgdGhlcmUgaXMg
Y29tbWVudCBpbiAKdGhlIGRyaXZlciB0aGF0IGl0IGlzIGR1ZSB0byBzb21lIGRzaSBob3N0cywg
bWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIApmaXggaXQgdGhlcmUgaW5zdGVhZCBvZiBjb25z
ZXJ2ZSB0aGlzIGJhZCBkZXNpZ24uCgoKPiAtIFRoZSBjYWNoZWQgRURJRCBmcmVlaW5nIGlzbid0
IGFjdHVhbGx5IHBhcnQgb2YgcHJvYmUgYnV0IG5lZWRzIHRvIGJlCj4gICAgaW4gcmVtb3ZlIHRv
IGF2b2lkIG9ycGhhbmluZyBtZW1vcnkgdW50aWwgYmV0dGVyIGhhbmRsaW5nIG9mIHRoZQo+ICAg
IEVESUQgaGFwcGVucy4KPiBUaGlzIHBhdGNoIHdhcyBjcmVhdGVkIGJ5IGNvZGUgaW5zcGVjdGlv
biBhbmQgc2hvdWxkIG1vdmUgdXMgY2xvc2VyIHRvCj4gYSBwcm9wZXIgcmVtb3ZlLgo+Cj4gU2ln
bmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+IC0t
LQo+Cj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGktc242NWRzaTg2LmMgfCAxNSArKysrKysrKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
c242NWRzaTg2LmMKPiBpbmRleCA3NmY0M2FmNjczNWQuLmMwMDY2NzhjOTkyMSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+IEBAIC0xMzE1LDIwICsxMzE1LDIxIEBA
IHN0YXRpYyBpbnQgdGlfc25fYnJpZGdlX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
KQo+ICAgCWlmICghcGRhdGEpCj4gICAJCXJldHVybiAtRUlOVkFMOwo+ICAgCj4gLQlrZnJlZShw
ZGF0YS0+ZWRpZCk7Cj4gLQl0aV9zbl9kZWJ1Z2ZzX3JlbW92ZShwZGF0YSk7Cj4gLQo+IC0Jb2Zf
bm9kZV9wdXQocGRhdGEtPmhvc3Rfbm9kZSk7Cj4gLQo+IC0JcG1fcnVudGltZV9kaXNhYmxlKHBk
YXRhLT5kZXYpOwo+IC0KPiAgIAlpZiAocGRhdGEtPmRzaSkgewo+ICAgCQltaXBpX2RzaV9kZXRh
Y2gocGRhdGEtPmRzaSk7Cj4gICAJCW1pcGlfZHNpX2RldmljZV91bnJlZ2lzdGVyKHBkYXRhLT5k
c2kpOwo+ICAgCX0KPiAgIAo+ICsJa2ZyZWUocGRhdGEtPmVkaWQpOwo+ICsKPiArCXRpX3NuX2Rl
YnVnZnNfcmVtb3ZlKHBkYXRhKTsKPiArCj4gICAJZHJtX2JyaWRnZV9yZW1vdmUoJnBkYXRhLT5i
cmlkZ2UpOwo+ICAgCj4gKwlwbV9ydW50aW1lX2Rpc2FibGUocGRhdGEtPmRldik7Cj4gKwo+ICsJ
b2Zfbm9kZV9wdXQocGRhdGEtPmhvc3Rfbm9kZSk7Cj4gKwoKCkxvb2tzIGdvb2QuCgpSZXZpZXdl
ZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KClJlZ2FyZHMKQW5kcnpl
agoKCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAJCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
