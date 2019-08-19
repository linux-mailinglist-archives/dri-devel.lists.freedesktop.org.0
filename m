Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE14925B3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461146E12E;
	Mon, 19 Aug 2019 14:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E046E12E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:01:26 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190819140124euoutp019ec312f6473acb4cb4d3a908ea34bf98~8V8eFQ-A91481314813euoutp013
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:01:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190819140124euoutp019ec312f6473acb4cb4d3a908ea34bf98~8V8eFQ-A91481314813euoutp013
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190819140124eucas1p1229d9a6cb71d5408021d97d2d0ecdee0~8V8duZWPy0860508605eucas1p1J;
 Mon, 19 Aug 2019 14:01:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2F.B3.04374.4BBAA5D5; Mon, 19
 Aug 2019 15:01:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190819140123eucas1p16849c86d3ff450edcf8f40bef6b86e35~8V8c_noNn3132031320eucas1p1I;
 Mon, 19 Aug 2019 14:01:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190819140123eusmtrp10a8790cabff1469f0d94247e0909582e~8V8cvr5Lt3050930509eusmtrp1S;
 Mon, 19 Aug 2019 14:01:23 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-aa-5d5aabb4cd3c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7E.D2.04166.3BBAA5D5; Mon, 19
 Aug 2019 15:01:23 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190819140123eusmtip188cca4227a1d1a79fbf927aa62662f88~8V8cfV9x90664206642eusmtip1R;
 Mon, 19 Aug 2019 14:01:23 +0000 (GMT)
Subject: Re: [PATCH] efifb: BGRT: Improve efifb_bgrt_sanity_check
To: Hans de Goede <hdegoede@redhat.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <9da1b656-4640-fe16-9def-fe6c069ed39e@samsung.com>
Date: Mon, 19 Aug 2019 16:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a94c96de-16a5-7b52-a964-f8974e867a65@redhat.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87pbVkfFGuzdxGtx5et7Nos3x6cz
 WZzo+8Bq0bXwBrvFgo2PGB1YPe53H2fyeL/vKpvH501yAcxRXDYpqTmZZalF+nYJXBkfr85j
 LnjAUTH34BnmBsZm9i5GTg4JAROJX6v2MXYxcnEICaxglOhauJENJCEk8IVRon+9NoT9mVFi
 5oaaLkYOsIbuy9EQ9csZJTb232WFcN4ySvx+8wesWVjAUeJb1wZmEFtEQF1iakcPWJxZoFri
 wppDYHE2ASuJie2rGEFsXgE7iVud89lBFrAIqEqsP64DEhYViJC4f2wDK0SJoMTJmU9YQGxO
 oPJPzTeZIUaKS9x6Mp8JwpaX2P52DjPIPRICk9klmm/vZ4T40kXi48Y2ZghbWOLV8S1Q38tI
 nJ7cwwLRsI5R4m/HC6ju7YwSyyf/Y4OospY4fPwiK8h1zAKaEut36UOEHSWmLVzLBgkVPokb
 bwUhjuCTmLRtOjNEmFeio00IolpNYsOyDWwwa7t2rmSewKg0C8lrs5C8MwvJO7MQ9i5gZFnF
 KJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmFZO/zv+dQfjvj9JhxgFOBiVeHg9pkXFCrEm
 lhVX5h5ilOBgVhLhrZgDFOJNSaysSi3Kjy8qzUktPsQozcGiJM5bzfAgWkggPbEkNTs1tSC1
 CCbLxMEp1cDY6MIXqjXT1uDw159Xf3VI1Wmdfu11/E/15nalOk21DcdOzt1e9jEx1GHbO+a7
 S3bdVOvbJ/nPWOzS9S3x9VEnHK9tO1u3hu2YifRCj3diPjt8bY7dt1rU/F3hrt1xh6OfOXui
 Qo9t7mne2KvBV7dO6V+dzv0AAYX+WfInZxy705fjVjb5e88pJZbijERDLeai4kQAKrh8ficD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xu7qbV0fFGtzZLGlx5et7Nos3x6cz
 WZzo+8Bq0bXwBrvFgo2PGB1YPe53H2fyeL/vKpvH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
 eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehkfr85jLnjAUTH34BnmBsZm9i5GDg4J
 AROJ7svRXYxcHEICSxklLmx8wQYRl5E4vr6si5ETyBSW+HOtiw2i5jWjRE/HFRaQhLCAo8S3
 rg3MILaIgLrE1I4eNhCbWaBaYvbJm6wgtpDAAUaJncuLQWw2ASuJie2rGEFsXgE7iVud88Fu
 YBFQlVh/XAckLCoQIXHm/QoWiBJBiZMzn4DZnEDln5pvMkOMV5f4M+8SlC0ucevJfCYIW15i
 +9s5zBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIyjbcd+
 bt7BeGlj8CFGAQ5GJR5ej2lRsUKsiWXFlbmHGCU4mJVEeCvmAIV4UxIrq1KL8uOLSnNSiw8x
 mgL9NpFZSjQ5HxjjeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUa
 GNvn2Kazme3llH65T2HxgSBumbsfzdu5+y5sFyzd/s1EQnLOep37z9zeujO+vW3FPTHUr/x0
 yuzza+SUY+bWZNuLeO/a4+/mvi6F+//6W4pdTuJr7/85L7ByXfjLVa4Hvy10izt85uJDWY6L
 ZU8SDU3ublFRmvzr4cr0u4+eT65+ufwN98tD5xWVWIozEg21mIuKEwFiBIEvuQIAAA==
X-CMS-MailID: 20190819140123eucas1p16849c86d3ff450edcf8f40bef6b86e35
X-Msg-Generator: CA
X-RootMTR: 20190817084100epcas3p15bc1b42c02d8d86969a4a403896d6fee
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190817084100epcas3p15bc1b42c02d8d86969a4a403896d6fee
References: <20190721131918.10115-1-hdegoede@redhat.com>
 <CGME20190817084100epcas3p15bc1b42c02d8d86969a4a403896d6fee@epcas3p1.samsung.com>
 <a94c96de-16a5-7b52-a964-f8974e867a65@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566223284;
 bh=DgHvpJWbm0WzTKh+WEF0vbm6R4E6LRefSnXkInKW9uc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FBEJIpNazIcQFqjGM/HoduuNIM3IRKrJ8aNtSo3dTASTCO69PjMBlQ6ybuTJBx+9l
 2TX5oFxtEJvVLdcmMFuBFZa5Ap/EcKBrGEdKgBFGVfA0o/qEPpEr2VxNyNxmVQLA05
 wKFsRKJTOAXHEni7m2mvmRQIOnDW5yceEWSo/yNM=
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
Cc: linux-fbdev@vger.kernel.org, Peter Jones <pjones@redhat.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMTcvMTkgMTA6NDAgQU0sIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4gSGksCgpIaSBIYW5z
LAoKPiBPbiAyMS0wNy0xOSAxNToxOSwgSGFucyBkZSBHb2VkZSB3cm90ZToKPj4gRm9yIHZhcmlv
dXMgcmVhc29ucywgYXQgbGVhc3Qgd2l0aCB4ODYgRUZJIGZpcm13YXJlcywgdGhlIHhvZmZzZXQg
YW5kCj4+IHlvZmZzZXQgaW4gdGhlIEJHUlQgaW5mbyBhcmUgbm90IGFsd2F5cyByZWxpYWJsZS4K
Pj4KPj4gRXh0ZW5zaXZlIHRlc3RpbmcgaGFzIHNob3duIHRoYXQgd2hlbiB0aGUgaW5mbyBpcyBj
b3JyZWN0LCB0aGUKPj4gQkdSVCBpbWFnZSBpcyBhbHdheXMgZXhhY3RseSBjZW50ZXJlZCBob3Jp
em9udGFsbHkgKHRoZSB5b2Zmc2V0IHZhcmlhYmxlCj4+IGlzIG1vcmUgdmFyaWFibGUgYW5kIG5v
dCBhbHdheXMgcHJlZGljdGFibGUpLgo+Pgo+PiBUaGlzIGNvbW1pdCBzaW1wbGlmaWVzIC8gaW1w
cm92ZXMgdGhlIGJncnRfc2FuaXR5X2NoZWNrIHRvIHNpbXBseQo+PiBjaGVjayB0aGF0IHRoZSBC
R1JUIGltYWdlIGlzIGV4YWN0bHkgY2VudGVyZWQgaG9yaXpvbnRhbGx5IGFuZCBza2lwcwo+PiAo
cmUpZHJhd2luZyBpdCB3aGVuIGl0IGlzIG5vdC4KPj4KPj4gVGhpcyBmaXhlcyB0aGUgQkdSVCBp
bWFnZSBzb21ldGltZXMgYmVpbmcgZHJhd24gaW4gdGhlIHdyb25nIHBsYWNlLgo+Pgo+PiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiBGaXhlczogODhmZTRjZWIyNDQ3ICgiZWZpZmI6IEJH
UlQ6IERvIG5vdCBjb3B5IHRoZSBib290IGdyYXBoaWNzIGZvciBub24gbmF0aXZlIHJlc29sdXRp
b25zIikKPj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNv
bT4KPiAKPiBwaW5nPyBJIGRvIG5vdCBzZWUgdGhpcyBvbmUgaW4gLW5leHQgeWV0LCB3aGF0IGlz
IHRoZSBzdGF0dXMgb2YgdGhpcwo+IHBhdGNoPwpQYXRjaCBxdWV1ZWQgZm9yIHY1LjQsIHRoYW5r
cyBhbmQgc29ycnkgZm9yIHRoZSBkZWxheS4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBa
b2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ry
b25pY3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
