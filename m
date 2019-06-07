Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899013873C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 11:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E4289BAC;
	Fri,  7 Jun 2019 09:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAA089BAC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 09:43:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607094316euoutp0157ef767701beb83763ea00ed0479baf2~l4VPoXsku1083010830euoutp01v
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 09:43:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607094316euoutp0157ef767701beb83763ea00ed0479baf2~l4VPoXsku1083010830euoutp01v
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190607094315eucas1p10e8f942c903b3ea97f12293314f630ee~l4VOrT5w40728407284eucas1p1P;
 Fri,  7 Jun 2019 09:43:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E6.1F.04325.3B13AFC5; Fri,  7
 Jun 2019 10:43:15 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607094314eucas1p2a6f327eee49033b24ad9a8c3c607fa08~l4VNs66M30106201062eucas1p2G;
 Fri,  7 Jun 2019 09:43:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607094314eusmtrp2e0796f8ae434085e0b1b1b3c45964149~l4VNdTQDv0958609586eusmtrp2h;
 Fri,  7 Jun 2019 09:43:14 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-53-5cfa31b392f3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 4C.D4.04146.2B13AFC5; Fri,  7
 Jun 2019 10:43:14 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190607094313eusmtip154b6b09db91c8d5c7da944e482aa87b0~l4VM3DzmW2310523105eusmtip1h;
 Fri,  7 Jun 2019 09:43:13 +0000 (GMT)
Subject: Re: [PATCH 2/2] drm/bridge: sii902x: fix a signedness bug in
 sii902x_audio_codec_init()
To: Dan Carpenter <dan.carpenter@oracle.com>, Jyri Sarha <jsarha@ti.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <cd974289-db19-5e80-bd64-4b5f05dcb845@samsung.com>
Date: Fri, 7 Jun 2019 11:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607072727.GB25229@mwanda>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djPc7qbDX/FGDw+wWrRe+4kk8Xrf9NZ
 LP5vm8hsceXrezaL7s4OVoutt6QtOicuYXdg99j7bQGLx+yOmawe2789YPW4332cyePj01ss
 HsdvbGfy+LxJLoA9issmJTUnsyy1SN8ugSvj4bRlbAW/2Cse35nD3MC4j62LkYNDQsBE4sxr
 /y5GLg4hgRWMEjevTWCEcL4wSiw+N4kJwvnMKLHr0zJmmI7jq0Mg4ssZJZ53LmSBcN4ySvyZ
 NJ21i5GTQ1ggSeLGsc9MILaIgIfEjHNf2ECKmAUOMEo83jiPHSTBJqAp8XfzTTYQm1fATuL8
 znvMIDaLgIrEijNzwWxRgQiJ+8c2sELUCEqcnPmEBcTmFNCR+PPhC1icWUBeYvvbOcwQtrjE
 rSfzwc6WEDjELnH6116wZRICLhK7515mgrCFJV4d3wIVl5H4v3M+VLxe4v6KFmaI5g5Gia0b
 djJDJKwlDh+/yAryPzPQ1et36UOEHSVa/i1mhAQLn8SNt4IQN/BJTNo2HRpavBIdbUIQ1YoS
 989uhRooLrH0wle2CYxKs5B8NgvJN7OQfDMLYe8CRpZVjOKppcW56anFxnmp5XrFibnFpXnp
 esn5uZsYgUnp9L/jX3cw7vuTdIhRgINRiYfXg/1njBBrYllxZe4hRgkOZiUR3rILP2KEeFMS
 K6tSi/Lji0pzUosPMUpzsCiJ81YzPIgWEkhPLEnNTk0tSC2CyTJxcEo1MKY4LuYU+5hqaS6k
 Lb2t0FzkJ4v/1wmrAuJXBd0/8ffwwrXsl+rlm57zMTWejGo9OnfCFo/jAkFRam8P3xRN8DrL
 HjC7mcFusr2zX+pzGZ3/3zszndItzq44EH2O4+Li2bUXNbaz9ta9fPY+JPDvjmvrhJ+fSdq4
 yKdudk/JRttXXhNnpS35tk+JpTgj0VCLuag4EQDnmxUaRgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xu7qbDH/FGPz/xWrRe+4kk8Xrf9NZ
 LP5vm8hsceXrezaL7s4OVoutt6QtOicuYXdg99j7bQGLx+yOmawe2789YPW4332cyePj01ss
 HsdvbGfy+LxJLoA9Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
 syy1SN8uQS/j4bRlbAW/2Cse35nD3MC4j62LkYNDQsBE4vjqkC5GLg4hgaWMErf27mbvYuQE
 iotL7J7/lhnCFpb4c62LDcQWEnjNKLF7sR6ILSyQJHHj2GcmEFtEwENixrkvbCCDmAUOMEp0
 XH7HCNFQLzHl1wmwoWwCmhJ/N98EG8QrYCdxfuc9sAUsAioSK87MBbNFBSIkzrxfwQJRIyhx
 cuYTMJtTQEfiz4cvrCA2s4C6xJ95l5ghbHmJ7W/nQNniEreezGeawCg0C0n7LCQts5C0zELS
 soCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgFG479nPzDsZLG4MPMQpwMCrx8Dow/IwR
 Yk0sK67MPcQowcGsJMJbduFHjBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnAxNEXkm8oamh
 uYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRsGc4kr7tXM3aj9iSHnU4lQQ
 nHhnv8/RO/65NtyvKuI363q43hVRrF8dalE67+qZwDSF+p/fH222Pfwqb6lqzv0zKzvTuhe2
 X2BPT13CcTbBJk8yNsRIb2O94WlOsQvbgrZpf7WXLQz8prD5T8b+4zWLJha9dahcp5Imf995
 UmPYZHPGfK2FSizFGYmGWsxFxYkAp3SJ9NgCAAA=
X-CMS-MailID: 20190607094314eucas1p2a6f327eee49033b24ad9a8c3c607fa08
X-Msg-Generator: CA
X-RootMTR: 20190607072751epcas1p1e28023f2b62a6d052a19e4c0558188e1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607072751epcas1p1e28023f2b62a6d052a19e4c0558188e1
References: <CGME20190607072751epcas1p1e28023f2b62a6d052a19e4c0558188e1@epcas1p1.samsung.com>
 <20190607072727.GB25229@mwanda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559900596;
 bh=2aCYatxWWCHU9hiTSSHj1lqwR1mNeFA1loxdsGx/xSw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=SJ2OXf8tb/F5iDjwAPmep4p2YJ89NUWF2qXshsO6fSGiWwPyz8+U15d+TFdizvZpR
 F6Gj0dsHoR5mdwPkZTRAPhjP8yhwXTfG2spUPVWICkk91HAgFxGc4aVD3/m5RENhrD
 NUeX0IvQWN6qL+uzQ8jYini0YkuUPowQQRZlU+5Y=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDYuMjAxOSAwOToyNywgRGFuIENhcnBlbnRlciB3cm90ZToKPiBUaGUgIm51bV9sYW5l
cyIgdmFyaWFibGUgbmVlZHMgdG8gYmUgc2lnbmVkIGZvciB0aGUgZXJyb3IgaGFuZGxpbmcgdG8K
PiB3b3JrLiAgVGhlICJpIiB2YXJpYWJsZSBjYW4gYmUgYSByZWd1bGFyIGludCBhcyB3ZWxsLgo+
Cj4gRml4ZXM6IGZmNTc4MTYzNGM0MSAoImRybS9icmlkZ2U6IHNpaTkwMng6IEltcGxlbWVudCBI
RE1JIGF1ZGlvIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5j
YXJwZW50ZXJAb3JhY2xlLmNvbT4KCgpDb2xpbiBzZW5kIGFscmVhZHkgZml4IGZvciB0aGlzLgoK
ClJlZ2FyZHMKCkFuZHJ6ZWoKCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkw
MnguYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+IGluZGV4IDZiMDM2MTZkNmJjMy4uZGQ3
YWE0NjZiMjgwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBAQCAtNzE5LDcgKzcx
OSw3IEBAIHN0YXRpYyBpbnQgc2lpOTAyeF9hdWRpb19jb2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4
ICpzaWk5MDJ4LAo+ICAJCS5tYXhfaTJzX2NoYW5uZWxzID0gMCwKPiAgCX07Cj4gIAl1OCBsYW5l
c1s0XTsKPiAtCXUzMiBudW1fbGFuZXMsIGk7Cj4gKwlpbnQgbnVtX2xhbmVzLCBpOwo+ICAKPiAg
CWlmICghb2ZfcHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwgIiNzb3VuZC1kYWktY2Vs
bHMiKSkgewo+ICAJCWRldl9kYmcoZGV2LCAiJXM6IE5vIFwiI3NvdW5kLWRhaS1jZWxsc1wiLCBu
byBhdWRpb1xuIiwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
