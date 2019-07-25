Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C583074818
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC546E636;
	Thu, 25 Jul 2019 07:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 547 seconds by postgrey-1.36 at gabe;
 Thu, 25 Jul 2019 04:05:20 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30606E3A6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 04:05:20 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20190725035611epoutp0234a5d348220abcd96bc4fde0127ac56a~0ij5lnQ7Y0425904259epoutp02X
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 03:56:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20190725035611epoutp0234a5d348220abcd96bc4fde0127ac56a~0ij5lnQ7Y0425904259epoutp02X
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20190725035610epcas1p4ff863f31e033356100127d9f617b61fa~0ij5I9bAC0134701347epcas1p4Q;
 Thu, 25 Jul 2019 03:56:10 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.157]) by
 epsnrtp5.localdomain (Postfix) with ESMTP id 45vJKg4DmjzMqYkg; Thu, 25 Jul
 2019 03:56:07 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 71.8B.04160.058293D5; Thu, 25 Jul 2019 12:56:00 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20190725035600epcas1p4764e5582e760704ee036ca7648c8fca0~0ijvkdiZP2737927379epcas1p41;
 Thu, 25 Jul 2019 03:56:00 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190725035600epsmtrp1494170a58a4c52ea398f8d4979bca408~0ijvjnu_O1439114391epsmtrp1Q;
 Thu, 25 Jul 2019 03:56:00 +0000 (GMT)
X-AuditID: b6c32a38-b33ff70000001040-8f-5d3928500a94
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E0.31.03638.058293D5; Thu, 25 Jul 2019 12:56:00 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190725035600epsmtip1552edd7a99b30703bf8b3ccc8b9a374f~0ijvZUQ8S1446314463epsmtip1L;
 Thu, 25 Jul 2019 03:56:00 +0000 (GMT)
Subject: Re: [PATCH RESEND] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND
 constant
To: Yue Hu <zbestahu@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 robdclark@gmail.com, sean@poorly.run, robh@kernel.org,
 tomeu.vizoso@collabora.com
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <ecd5c975-615d-2cd0-5507-9ee89e0a228b@samsung.com>
Date: Thu, 25 Jul 2019 12:59:20 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725035239.1192-1-zbestahu@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNJsWRmVeSWpSXmKPExsWy7bCmrm6AhmWswYp2XYvecyeZLP5vm8hs
 ceXrezaLOc/PMlrsmX2X2WLi/rPsFrcbV7BZPF/4g9ni/54d7BZ3Jx9htOhbe4nNYu4pLosD
 S16zOPB67Li7hNFj77cFLB47Z91l99i0qpPNY/u3B6we97uPM3kc33WL3aNvyypGj8+b5Dy2
 rlnMHMAVlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZ
 A3S8kkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAskCvODG3uDQvXS85P9fK0MDA
 yBSoMCE7o2nCA+aCxfwV8/tvszUwvuTpYuTkkBAwkVj6YRN7FyMXh5DADkaJtbM72SCcT4wS
 HW2TWSGcb4wSy9ubWGBa5p78ywyR2MsoceDjJ0aQhJDAe0aJr9uLQWxhgVCJ9/c/gBWJCMxk
 lHh7+zuYwyywklFiatNkdpAqNgEtif0vbrCB2PwCihJXfzwGm8QrYCdxc+9/sBoWAVWJTdOn
 MIHYogIREp8eHGaFqBGUODnzCdhJnALmEs86z4DNYRYQl7j1ZD4ThC0v0bx1NjPE2fvYJa7u
 4e1i5ACyXSS2bzWDCAtLvDq+hR3ClpJ42d8GZVdLrDx5BBwWEgIdjBJb9l9ghUgYS+xfOpkJ
 ZA6zgKbE+l36EGFFiZ2/5zJCrOWTePe1hxViFS8wGIUgSpQlLj+4ywRhS0osbu9km8CoNAvJ
 M7OQPDALyQOzEJYtYGRZxSiWWlCcm55abFhgghzbmxjBCVvLYgfjnnM+hxgFOBiVeHg5kixi
 hVgTy4orcw8xSnAwK4nwBjaYxQrxpiRWVqUW5ccXleakFh9iNAWG9URmKdHkfGA2ySuJNzQ1
 MjY2tjAxNDM1NFQS5134A2iOQHpiSWp2ampBahFMHxMHp1QD44orHLxfv4czucWVvuZOqMw5
 027hG8iyyF9z9mzNaQmfXqT1vDt31icpQr4l5ePl+fE3i041zIjpFFy9cX2ImNA613fda//H
 vsoXVedx4PwQ/7GoI5zZMPje1XUP1D89S1v66YmroW7wz+Yv6fdUP84L5337Rzn2uwDz+6KK
 tiCWznP+Va6TlViKMxINtZiLihMB98bZJ+4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsWy7bCSnG6AhmWswakP4ha9504yWfzfNpHZ
 4srX92wWc56fZbTYM/sus8XE/WfZLW43rmCzeL7wB7PF/z072C3uTj7CaNG39hKbxdxTXBYH
 lrxmceD12HF3CaPH3m8LWDx2zrrL7rFpVSebx/ZvD1g97ncfZ/I4vusWu0ffllWMHp83yXls
 XbOYOYArissmJTUnsyy1SN8ugSujacID5oLF/BXz+2+zNTC+5Oli5OSQEDCRmHvyL3MXIxeH
 kMBuRolb/8+wQSQkJaZdPAqU4ACyhSUOHy6GqHnLKPH22V52kBphgVCJ9/c/gDWLCMxklPhy
 5xgbiMMssJJR4uuLnewQLV2MEj1nLjGBtLAJaEnsf3EDbAW/gKLE1R+PGUFsXgE7iZt7/4ON
 ZRFQldg0fQpYvahAhMThHbOgagQlTs58wgJicwqYSzzrhDiVWUBd4s+8S8wQtrjErSfzmSBs
 eYnmrbOZJzAKz0LSPgtJyywkLbOQtCxgZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7
 iREcv1paOxhPnIg/xCjAwajEw8uRZBErxJpYVlyZe4hRgoNZSYQ3sMEsVog3JbGyKrUoP76o
 NCe1+BCjNAeLkjivfP6xSCGB9MSS1OzU1ILUIpgsEwenVAOjpUVrw+Zbpi7yS3hDb619Jikk
 GH7MTGa7uEiu3aMPMy+ZyGRdF0xUZFtdE+ofsGDZ8eVF1+NOPO5R2hf8fbOpaoposfbNLBmO
 b/Pv2IcdO2QqY1fqcNJOOsvR+1pVsnSZ20kuVcUdn9u8xJQcvsi0FKrabejtYPxsrBB0P02A
 na3qpyJvjBJLcUaioRZzUXEiANJ3c1/bAgAA
X-CMS-MailID: 20190725035600epcas1p4764e5582e760704ee036ca7648c8fca0
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190725035308epcas3p3dbb085335947fc1675773baecbad012e
References: <CGME20190725035308epcas3p3dbb085335947fc1675773baecbad012e@epcas3p3.samsung.com>
 <20190725035239.1192-1-zbestahu@gmail.com>
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1564026971;
 bh=C716pIFwHZ+WjhDZMOaClxutDoCMBDIKk7zqcZGKoyU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=IP17u1Od1O1MNo7Vg/MXwBG7R2nHiXWw7+aCi7jIvEEKDT0s7h5BOzphtHDb7+avb
 CkzFaVSDia1glZKDlVe58HDuXYHQwmvPYw+3yaK98Rutf+XgtU6uNijJ4Fjzv30hHr
 qW87nGzQ97nvOxVlrC9IJ0qKjxb0n40nP15YnztE=
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 huyue2@yulong.com, myungjoo.ham@samsung.com, zhangwen@yulong.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkuIDcuIDI1LiDsmKTtm4QgMTI6NTIsIFl1ZSBIdSB3cm90ZToKPiBGcm9tOiBZdWUgSHUg
PGh1eXVlMkB5dWxvbmcuY29tPgo+IAo+IFNpbmNlIGdvdmVybm9yIG5hbWUgaXMgZGVmaW5lZCBi
eSBERVZGUkVRIGZyYW1ld29yayBpbnRlcm5hbGx5LCB1c2UgdGhlCj4gbWFjcm8gZGVmaW5pdGlv
biBpbnN0ZWFkIG9mIHVzaW5nIHRoZSBuYW1lIGRpcmVjdGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFl1ZSBIdSA8aHV5dWUyQHl1bG9uZy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20v
bXNtX2dwdS5jICAgICAgICAgICAgICAgfCAzICsrLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgMyArKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKPiBpbmRleCA0
ZWRiODc0Li5mNzMwOGQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dw
dS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKPiBAQCAtOTUsNyArOTUs
OCBAQCBzdGF0aWMgdm9pZCBtc21fZGV2ZnJlcV9pbml0KHN0cnVjdCBtc21fZ3B1ICpncHUpCj4g
IAkgKi8KPiAgCj4gIAlncHUtPmRldmZyZXEuZGV2ZnJlcSA9IGRldm1fZGV2ZnJlcV9hZGRfZGV2
aWNlKCZncHUtPnBkZXYtPmRldiwKPiAtCQkJJm1zbV9kZXZmcmVxX3Byb2ZpbGUsICJzaW1wbGVf
b25kZW1hbmQiLCBOVUxMKTsKPiArCQkJJm1zbV9kZXZmcmVxX3Byb2ZpbGUsIERFVkZSRVFfR09W
X1NJTVBMRV9PTkRFTUFORCwKPiArCQkJTlVMTCk7Cj4gIAo+ICAJaWYgKElTX0VSUihncHUtPmRl
dmZyZXEuZGV2ZnJlcSkpIHsKPiAgCQlEUk1fREVWX0VSUk9SKCZncHUtPnBkZXYtPmRldiwgIkNv
dWxkbid0IGluaXRpYWxpemUgR1BVIGRldmZyZXFcbiIpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwo+IGluZGV4IGRiNzk4NTMuLmE3YzE4YmMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKPiBAQCAtMTU3
LDcgKzE1Nyw4IEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0IHBhbmZyb3N0X2Rl
dmljZSAqcGZkZXYpCj4gIAlkZXZfcG1fb3BwX3B1dChvcHApOwo+ICAKPiAgCXBmZGV2LT5kZXZm
cmVxLmRldmZyZXEgPSBkZXZtX2RldmZyZXFfYWRkX2RldmljZSgmcGZkZXYtPnBkZXYtPmRldiwK
PiAtCQkJJnBhbmZyb3N0X2RldmZyZXFfcHJvZmlsZSwgInNpbXBsZV9vbmRlbWFuZCIsIE5VTEwp
Owo+ICsJCQkmcGFuZnJvc3RfZGV2ZnJlcV9wcm9maWxlLCBERVZGUkVRX0dPVl9TSU1QTEVfT05E
RU1BTkQsCj4gKwkJCU5VTEwpOwo+ICAJaWYgKElTX0VSUihwZmRldi0+ZGV2ZnJlcS5kZXZmcmVx
KSkgewo+ICAJCURSTV9ERVZfRVJST1IoJnBmZGV2LT5wZGV2LT5kZXYsICJDb3VsZG4ndCBpbml0
aWFsaXplIEdQVSBkZXZmcmVxXG4iKTsKPiAgCQlyZXQgPSBQVFJfRVJSKHBmZGV2LT5kZXZmcmVx
LmRldmZyZXEpOwo+IAoKVGhlIGluY2x1ZGUvbGludXgvZGV2ZnJlcS5oIGRlZmluZXMgdGhlIGdv
dmVybm9yIG5hbWUuCkl0IGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogQ2hhbndvbyBD
aG9pIDxjdzAwLmNob2lAc2Ftc3VuZy5jb20+CgotLSAKQmVzdCBSZWdhcmRzLApDaGFud29vIENo
b2kKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
