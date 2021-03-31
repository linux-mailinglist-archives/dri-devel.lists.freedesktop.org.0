Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D534FD83
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E499C6EA35;
	Wed, 31 Mar 2021 09:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BE36EA35
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:55:09 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210331095508euoutp02259aaf08b5bee826b75d617b94a9773a~xZL4ArFPz1919119191euoutp02_
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:55:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210331095508euoutp02259aaf08b5bee826b75d617b94a9773a~xZL4ArFPz1919119191euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617184508;
 bh=kJuwa3yGELX4v8vUPJiYygWAt+yoiG3MTD8i/c8nRIY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=tveD+JR2UKWYt2ZEw+2C0Ww9FfPzCOQHnsCvVYQw7b/jVrJUL7LwXZjFdxFvT9yzB
 KiSi2zhZTNy85jK1pR0nX1/ls9MxqzxEQiFKUV+GRGE/eoQh0B7Ka4yDjk+xHFFmAR
 PZ4xfwJJwlkBpZ18ID6WDYOwgbaQE+5CRsEWK6os=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210331095508eucas1p217b96e8432712e6196f580be0455ce83~xZL3rfE3a3241532415eucas1p2U;
 Wed, 31 Mar 2021 09:55:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 75.1F.09452.BF644606; Wed, 31
 Mar 2021 10:55:07 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210331095507eucas1p13cd1a7bdef3a28839471191e2c999954~xZL3Ebe-F2289722897eucas1p1C;
 Wed, 31 Mar 2021 09:55:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210331095507eusmtrp2604d7e88f12e0ba631f92bb69d2d9447~xZL3DiLxs2740027400eusmtrp2J;
 Wed, 31 Mar 2021 09:55:07 +0000 (GMT)
X-AuditID: cbfec7f2-ab7ff700000024ec-26-606446fb004a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id DC.E6.08696.BF644606; Wed, 31
 Mar 2021 10:55:07 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210331095500eusmtip2dfe5c31afea6bffb67a30d6c50eea4e1~xZLwtR_MJ0784407844eusmtip2m;
 Wed, 31 Mar 2021 09:55:00 +0000 (GMT)
Message-ID: <e1caa468-0998-cddb-938a-06785c381ba0@samsung.com>
Date: Wed, 31 Mar 2021 11:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
 Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 06/14] drm/bridge: ti-sn65dsi86: Move
 drm_panel_unprepare() to post_disable()
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210329195255.v2.6.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNKsWRmVeSWpSXmKPExsWy7djP87q/3VISDDo+W1r0njvJZHF6/zsW
 i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
 +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
 XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFFcNimpOZllqUX6dglcGZOmdDMXnOCu
 eLX4LVsD4znOLkZODgkBE4nFR68wdTFycQgJrGCU6L7zmBEkISTwhVHi2IpMCPszo8Sq3aYw
 DYueN7BDNCxnlFj4ezJUwwtGib5vvCA2r4CdxKK9j1lBbBYBVYm9f86yQsQFJU7OfMICYosK
 JEisurGcCcQWFkiT+DUPooZZQFyi6ctKVpAFIgL/GCVWT3wMdh6zwGcmiU9TDoF1sAloSvzd
 fJMNxOYUCJV42fWPCaJbXqJ562xmkAYJgWucEsf6vzFB3O0i0fn9LRuELSzx6vgWdghbRuL/
 zvlQNfUS91e0QDV3MEps3bCTGSJhLXHn3C+gZg6gDZoS63fpQ4QdJabue8IEEpYQ4JO48VYQ
 4gY+iUnbpjNDhHklOtqEIKoVJe6f3Qo1UFxi6YWvbBMYlWYhhcssJP/PQvLNLIS9CxhZVjGK
 p5YW56anFhvmpZbrFSfmFpfmpesl5+duYgSmx9P/jn/awTj31Ue9Q4xMHIyHGCU4mJVEeIUP
 JCYI8aYkVlalFuXHF5XmpBYfYpTmYFES5101e028kEB6YklqdmpqQWoRTJaJg1OqgUlTTkCU
 9ZvF1p8vHU/9PDGp0nXyJtH261a73xzadU357HRHn9OXZUKb79tWpPeX69yfPiVNuvargu+f
 P+HqL5yiVL/lN+Q9jGAzefmTab7QARGumcd+2E2pWX+zpCRl7YY3t69ruUYeu16yyOSm9jo3
 wRcxWU3bLOr+Su04tttulv2Bbd35aW7JDE+eBW9XPPkgp7V75hTe6Vt8rfa8SVzxsFvCzuzI
 xcbHuUGLckVlImSO7X5w483iQz5ZTBNf/llporzw1mI5n01R2z0qvVf/5tZ4Z3isOmN1uPCq
 RG/eD/+1jwS8nfBqxf0pse2WxStP/Zi2XvmOZP7fvQfSFt+e2fRX84vfk09vOre9vb10uxJL
 cUaioRZzUXEiAMItCXH+AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42I5/e/4Pd3fbikJBq/nCVv0njvJZHF6/zsW
 i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
 +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
 XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
 ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GZOmdDMXnOCueLX4LVsD4znOLkZODgkBE4lF
 zxvYuxi5OIQEljJKLPw7hxUiIS6xe/5bZghbWOLPtS42iKJnjBIP985iA0nwCthJLNr7GKyB
 RUBVYu+fs6wQcUGJkzOfsIDYogIJEmc/zGMCsYUF0iR+zYOoYQZa0PRlJSvIUBGBBiaJS3cX
 M4E4zAJfmSRaXi2Fuuk2o8TM6zfA7mAT0JT4u/km2GpOgVCJl13/mCBGmUl0be1ihLDlJZq3
 zmaewCg0C8kls5BsnIWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzEC08K2Yz+3
 7GBc+eqj3iFGJg7GQ4wSHMxKIrzCBxIThHhTEiurUovy44tKc1KLDzGaAoNjIrOUaHI+MDHl
 lcQbmhmYGpqYWRqYWpoZK4nzmhxZEy8kkJ5YkpqdmlqQWgTTx8TBKdXA1J1duXZa+Bs+SYXD
 /JPXNBQ8FePbb7in7BvXhibLW+K7lRqtoyZNKYmOl4jblqaffaHPkH+X9OGrJ8X4mG6ciY9b
 YX7PdcHSB1MCRLekBky4uyD1ca205ZLLq8Kcv4nXJt9Ku+im0hJy4lOMwd/djo/atm6S73sw
 cWpGr/H5F6ennfr6ameow9vAoPOTRF9+n7JpUtvDqvN+8odW3rYS8D6dIbmz/KiPlQ2TT8PF
 SUYPVET2Srd8cK1d4B+o/eb/ueXbVsWv85wRN6/Stu3w5H2ihbWJzMLz9wvOnHYhgytKY5n6
 +uajHzm/+a58GqMSt0o2b/XN678uiWyf2hcp/UPxIPOP2zz7dl0/9YH3apYSS3FGoqEWc1Fx
 IgAQUTRtlAMAAA==
X-CMS-MailID: 20210331095507eucas1p13cd1a7bdef3a28839471191e2c999954
X-Msg-Generator: CA
X-RootMTR: 20210330025440eucas1p2a49739a015ffc6877fd639011c75ce1e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025440eucas1p2a49739a015ffc6877fd639011c75ce1e
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025440eucas1p2a49739a015ffc6877fd639011c75ce1e@eucas1p2.samsung.com>
 <20210329195255.v2.6.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
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

ClcgZG5pdSAzMC4wMy4yMDIxIG/CoDA0OjUzLCBEb3VnbGFzIEFuZGVyc29uIHBpc3plOgo+IFdl
IHByZXBhcmVkIHRoZSBwYW5lbCBpbiBwcmVfZW5hYmxlKCkgc28gd2Ugc2hvdWxkIHVucHJlcGFy
ZSBpdCBpbgo+IHBvc3RfZGlzYWJsZSgpIHRvIG1hdGNoLgo+Cj4gVGhpcyBiZWNvbWVzIGltcG9y
dGFudCBvbmNlIHdlIHN0YXJ0IHVzaW5nIHByZV9lbmFibGUoKSBhbmQKPiBwb3N0X2Rpc2FibGUo
KSB0byBtYWtlIHN1cmUgdGhpbmdzIGFyZSBwb3dlcmVkIG9uIChhbmQgdGhlbiBvZmYgYWdhaW4p
Cj4gd2hlbiByZWFkaW5nIHRoZSBFRElELgo+Cj4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRl
cnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8
YS5oYWpkYUBzYW1zdW5nLmNvbT4KClJlZ2FyZHMKQW5kcnplago+IC0tLQo+Cj4gKG5vIGNoYW5n
ZXMgc2luY2UgdjEpCj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMg
fCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKPiBpbmRleCBlOGU1MjNi
M2ExNmIuLjUwYTUyYWY4ZTM5ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RpLXNuNjVkc2k4Ni5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNp
ODYuYwo+IEBAIC00NjAsOCArNDYwLDYgQEAgc3RhdGljIHZvaWQgdGlfc25fYnJpZGdlX2Rpc2Fi
bGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgIAlyZWdtYXBfd3JpdGUocGRhdGEtPnJl
Z21hcCwgU05fTUxfVFhfTU9ERV9SRUcsIDApOwo+ICAgCS8qIGRpc2FibGUgRFAgUExMICovCj4g
ICAJcmVnbWFwX3dyaXRlKHBkYXRhLT5yZWdtYXAsIFNOX1BMTF9FTkFCTEVfUkVHLCAwKTsKPiAt
Cj4gLQlkcm1fcGFuZWxfdW5wcmVwYXJlKHBkYXRhLT5wYW5lbCk7Cj4gICB9Cj4gICAKPiAgIHN0
YXRpYyB1MzIgdGlfc25fYnJpZGdlX2dldF9kc2lfZnJlcShzdHJ1Y3QgdGlfc25fYnJpZGdlICpw
ZGF0YSkKPiBAQCAtODc3LDYgKzg3NSw4IEBAIHN0YXRpYyB2b2lkIHRpX3NuX2JyaWRnZV9wb3N0
X2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgIHsKPiAgIAlzdHJ1Y3QgdGlf
c25fYnJpZGdlICpwZGF0YSA9IGJyaWRnZV90b190aV9zbl9icmlkZ2UoYnJpZGdlKTsKPiAgIAo+
ICsJZHJtX3BhbmVsX3VucHJlcGFyZShwZGF0YS0+cGFuZWwpOwo+ICsKPiAgIAljbGtfZGlzYWJs
ZV91bnByZXBhcmUocGRhdGEtPnJlZmNsayk7Cj4gICAKPiAgIAlwbV9ydW50aW1lX3B1dF9zeW5j
KHBkYXRhLT5kZXYpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
