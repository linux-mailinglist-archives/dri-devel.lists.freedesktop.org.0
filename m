Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE6356628
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC4F6E352;
	Wed, 26 Jun 2019 10:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA5C6E352
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:03:43 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190626100341euoutp01358cf42f40d2ef49572b8b98a97744f2~rt3f7KVnr1142011420euoutp01e
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:03:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190626100341euoutp01358cf42f40d2ef49572b8b98a97744f2~rt3f7KVnr1142011420euoutp01e
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190626100341eucas1p2aa14df76c98d692af1b21e2c62218bee~rt3fTpo9c1263812638eucas1p2k;
 Wed, 26 Jun 2019 10:03:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 66.D2.04298.CF2431D5; Wed, 26
 Jun 2019 11:03:40 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190626100340eucas1p2fb6d5e9c364c2dde52d6eac909edbbe6~rt3ejgxjJ1125411254eucas1p2w;
 Wed, 26 Jun 2019 10:03:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190626100340eusmtrp126e38d9bce3e0164bd8bed4fb64f8be9~rt3eVVrfx1524115241eusmtrp1P;
 Wed, 26 Jun 2019 10:03:40 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-47-5d1342fcb878
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C2.B1.04140.BF2431D5; Wed, 26
 Jun 2019 11:03:39 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190626100339eusmtip2b7c397d60ce7376ae26088dc929bf50c~rt3d0HaRi2962929629eusmtip2U;
 Wed, 26 Jun 2019 10:03:39 +0000 (GMT)
Subject: Re: [PULL] topic/remove-fbcon-notifiers for v5.3, fixes
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <368e0db7-f970-aebb-6b17-88a646b4bbba@samsung.com>
Date: Wed, 26 Jun 2019 12:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7dd06ccb-7f8d-943b-bbc0-f4e58e041a23@linux.intel.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0gUURjtzszOjqsT19XywwppoaAoHxA0VqiZ0Pzp4a8eYrnloLa6xe5q
 D4PMwmwL8gXZZqum+c5n6SougpqriJIPLE1TKyo1DSsNy0fujpL/zv3OOZxz4DKkvFviykSo
 dYJGrYxU0DKqumWuc/e8v1Ow51y9F9f65inBZY8OkVxN4hfE9c58p7nHSVUEl99ThjhzNsEN
 z7xCXPb0S4obGWtAXIOhT8oNpTYjPwfeWBLLm2ezKL7WMCTlc+rHCH6wr57mjW2B/PA9C8Fb
 6gakx5nTsgOhQmREjKDx8AmRhRvLKtClh+wVU9UgHYe+yfTIjgG8B/IW0qV6JGPkuABBS/wS
 aSXk+BeC9A/hIvETgaljSrrqSHtylxCJfATdGR9XHpMIOmbNEqvKCftB80SpzeGMvaEtoZ22
 ikhcSEL/zXvIStB4HyTfKbJhFvtAXlO1zUDhbTBRkmzDG/BJGG4pl4gaR2h79ImyYjt8CH7n
 Nti8JHaBgU+ZhIjdoGYyg7SGAZ6WQtqoGYm9A0Bf8WcFO8G45cXKns3QnnqfEg2lCBYSv664
 axDkpy7Somo/NFm6lmswyxE7oKzOQzwfBHPGF9p6Brwe3k46iiXWQ0r1Q1I8s5CYIBfV26E8
 r5xejdXXFpJJSGFYM82wZo5hzRzD/9wsRBUhFyFaGxUmaL3UwmV3rTJKG60Ocz9/MaoSLf+0
 9kXLDxOa6T7XiDCDFA5snJs8WC5RxmivRjUiYEiFM/tMiYPlbKjy6jVBc/GsJjpS0DaiTQyl
 cGFj140EyXGYUieoBOGSoFllCcbONQ5VxbPFf8+8HdxYY5obmfc91Tl+yzcgcsS7cnFLVV/u
 Uopxql13wuXGg7Zc59dCx7oISfqHptpk7IALqPklv6b+TKFYMAZ2HfbXB3VduP2cbx0PsVcx
 qYoXXiq3luuEc7LHhq2u473DggrZe+p1R47lnHOqY/e+T9yV1fPu6GdvBaUNV3rtJDVa5T/5
 TCDeZQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xe7q/nYRjDT78s7E4cX0Rk8XCh3eZ
 LbZ3PGe0uPL1PZvF7AmbmSyWX17PaLF3IZPF/a9HGS0WftzKYvHg5X5Gi/2zrrFb3J18hNGB
 x2PemmqPvd8WsHjsnHWX3WPxnpdMHneu7WHzmHcy0ON+93Emj+O7brEHcETp2RTll5akKmTk
 F5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZcxbv5GxYDpvxY7Nd9ga
 GN9wdTFyckgImEhMmdvJ1MXIxSEksJRR4t7llaxdjBxACRmJ4+vLIGqEJf5c62KDqHnNKLF6
 aiszSEJYwEHiyOt17CC2iIClxMm202BFzAIrmSV65z5mheiYxijx6WobG0gVm4CVxMT2VYwg
 Nq+AncSyw9vAulkEVCVer5kIZosKREiceb+CBaJGUOLkzCdgNqeAs8T3JfvBepkF1CX+zLvE
 DGGLS9x6Mp8JwpaX2P52DvMERqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nzi430ihNzi0vz
 0vWS83M3MQJjeNuxn1t2MHa9Cz7EKMDBqMTD2yAvFCvEmlhWXJl7iFGCg1lJhHdpokCsEG9K
 YmVValF+fFFpTmrxIUZToOcmMkuJJucD00teSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS
 1OzU1ILUIpg+Jg5OqQbGyU7/Nb580Zm7UPSz3EndHddUGSr3VJ48ZMveWV/31mpm1+UDfwUe
 q2xU/KAQd8NY9vO/wkvcKfHed8J3P942s/K3lZB3/+b9l9Ze+Oe+5fc1Xv7FS6+HL+xnLvny
 XTFo+5zsje4PtedoPufxmKPjtJeV3/hscNnK/c2/76TGmFmV6k/iFHm3R4mlOCPRUIu5qDgR
 AJmPQef3AgAA
X-CMS-MailID: 20190626100340eucas1p2fb6d5e9c364c2dde52d6eac909edbbe6
X-Msg-Generator: CA
X-RootMTR: 20190626084849epcas1p4d2f498599681bfe62d370c7bb48d4f74
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190626084849epcas1p4d2f498599681bfe62d370c7bb48d4f74
References: <CGME20190626084849epcas1p4d2f498599681bfe62d370c7bb48d4f74@epcas1p4.samsung.com>
 <7dd06ccb-7f8d-943b-bbc0-f4e58e041a23@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561543421;
 bh=Pn/qHtBJ9XWw11F8kPQ65R705ebl2GBPHFBJr/nRQII=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=iST83Pvc94LYJxLAK4YAbEYAsbMU/w6Dm4b/uK5baP5HTXt1ludN0nmkFf+9Mr34G
 k92eNJ4dctAUOHMFhTgw/ws4kN1lXh9y5VFOhQr3q/ThDsPczeHGkYpg2PuV25fnl2
 FBQxwm8OasegyH7+5oSlxUL2S56U24tnyB0MJx24=
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
Cc: Sean Paul <sean@poorly.run>, dim-tools@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpLAoKT24gNi8yNi8xOSAxMDo0OCBBTSwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6Cj4gSGkg
YWxsLAo+IAo+IFRoaXMgaXMgdGhlIGZvbGxvd3VwIHB1bGwgcmVxdWVzdCBmb3IgdGhlIHJlbW92
ZS1mYmNvbi1ub3RpZmllcnMgdG9waWMgYnJhbmNoLgo+IE5vIG1ham9yIGNoYW5nZXMsIGp1c3Qg
YSBmZXcgY29tcGlsZSBmaXhlcy4KPiAKPiBUaGlzIHdpbGwgYmUgcHVsbGVkIGludG8gZHJtLW1p
c2MtbmV4dCwgYnV0IGl0IG1pZ2h0IGJlIHVzZWZ1bCBmb3IgdGhlIGZiZGV2IGFuZCBiYWNrbGln
aHQgdHJlZXMgdG9vLgoKUHVsbGVkIGludG8gZmJkZXYtZm9yLW5leHQsIHRoYW5rcyEKCj4gQ2hl
ZXJzLAo+IE1hYXJ0ZW4KPiAKPiB0b3BpYy9yZW1vdmUtZmJjb24tbm90aWZpZXJzLTIwMTktMDYt
MjY6Cj4gLSBFeHBvcnQgZmJjb25fdXBkYXRlX3ZjcyB0byBmaXggc2hfbW9iaWxlX2xjZGNmYi5j
IGNvbXBpbGF0aW9uLgo+IC0gUmVseSBvbiBmYmNvbiBiZWluZyBidWlsdGluIHdoZW4gdmdhc3dp
dGNoZXJvbyBpcyBidWlsdGluLgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQg
MWRjZmY0YWU2NTE4NWU4YzAzMDA5NzJmNmQ4ZDM5ZDlhOWRiMmJkYToKPiAKPiAgIGJhY2tsaWdo
dDogc2ltcGxpZnkgbGNkIG5vdGlmaWVyICgyMDE5LTA1LTI4IDExOjAzOjA0ICswMjAwKQo+IAo+
IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgZ2l0Oi8vYW5v
bmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIHRhZ3MvdG9waWMvcmVtb3ZlLWZiY29u
LW5vdGlmaWVycy0yMDE5LTA2LTI2Cj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDYxMTZiODkyYmQ0ZmQwZGRjNWYzMDU2NmE1NTYyMThiYjJlMWE5YjY6Cj4gCj4gICB2Z2Ffc3dp
dGNoZXJvbzogRGVwZW5kIHVwb24gZmJjb24gYmVpbmcgYnVpbHQtaW4sIGlmIGVuYWJsZWQgKDIw
MTktMDYtMjYgMTA6MzY6NDkgKzAyMDApCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IHRvcGljL3JlbW92ZS1mYmNv
bi1ub3RpZmllcnM6Cj4gLSBFeHBvcnQgZmJjb25fdXBkYXRlX3ZjcyB0byBmaXggc2hfbW9iaWxl
X2xjZGNmYi5jIGNvbXBpbGF0aW9uLgo+IC0gUmVseSBvbiBmYmNvbiBiZWluZyBidWlsdGluIHdo
ZW4gdmdhc3dpdGNoZXJvbyBpcyBidWlsdGluLgo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBEYW5pZWwgVmV0dGVy
ICgyKToKPiAgICAgICBmYmNvbjogRXhwb3J0IGZiY29uX3VwZGF0ZV92Y3MKPiAgICAgICB2Z2Ff
c3dpdGNoZXJvbzogRGVwZW5kIHVwb24gZmJjb24gYmVpbmcgYnVpbHQtaW4sIGlmIGVuYWJsZWQK
PiAKPiAgZHJpdmVycy9ncHUvdmdhL0tjb25maWcgICAgICAgICAgfCAxICsKPiAgZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1
bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
