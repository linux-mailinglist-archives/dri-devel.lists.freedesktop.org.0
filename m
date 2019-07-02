Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120735D100
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 15:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC1089E63;
	Tue,  2 Jul 2019 13:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68D989E47
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 13:50:55 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190702135054euoutp0296a8313f01bf49c3c35e014e4880c170~tm1lpHmCN0503405034euoutp02y
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 13:50:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190702135054euoutp0296a8313f01bf49c3c35e014e4880c170~tm1lpHmCN0503405034euoutp02y
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190702135053eucas1p27fa8afa8ffd95904739239c9087ab582~tm1k-mVWV2180921809eucas1p21;
 Tue,  2 Jul 2019 13:50:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id EB.36.04325.D316B1D5; Tue,  2
 Jul 2019 14:50:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190702135052eucas1p11e2621af0514505789c7947b84cf133c~tm1kIZxEP3174531745eucas1p18;
 Tue,  2 Jul 2019 13:50:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190702135052eusmtrp1a4023efb84b0bc0645425edbba386b10~tm1j6UDrY2300423004eusmtrp1E;
 Tue,  2 Jul 2019 13:50:52 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-81-5d1b613d9404
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 14.CB.04140.C316B1D5; Tue,  2
 Jul 2019 14:50:52 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190702135051eusmtip176499a97ab5902991cdda48ee3d07695~tm1jZuF-w1685916859eusmtip1b;
 Tue,  2 Jul 2019 13:50:51 +0000 (GMT)
Subject: Re: [PATCH v7 1/2] drm/bridge: sil_sii8620: make remote control
 optional.
To: =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Inki Dae
 <inki.dae@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Newsgroups: gmane.linux.kernel, gmane.linux.kernel.input,
 gmane.comp.video.dri.devel
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <2d0fe94c-a2c9-a8f6-967f-c33b53e86518@samsung.com>
Date: Tue, 2 Jul 2019 15:50:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190419081926.13567-2-ronald@innovation.ch>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2zlnO1qzr6X4plG57kE3CjrdzCDhQP4wkQpFcuVhlm7KTlMr
 MsmwObss08pNy260pFrptFypoNHSmSFKZaEzMB3Fupk3KsvtLPLf8z7v83zv88BHEzInFULv
 Vx/kNGpFqlzsT9Y8G3u5fLMiNGFVc46EOX38oohpuuZCTOfQFzHTMvRbzORet4iZQqeBZPLP
 3ZAwXd+HKabDVipmXAOhjKvHLWKeD18QRUxjBys+UmytsVvCmnQlFFuUD+zl5h1sQ9kdCess
 sIvYM9YKxNb1WEl2sHIOe+lkDRU9Nc5/UxKXuj+D06wMT/RPLi8IS++WZX296iZykHW6HvnR
 gNeCodeE9MiflmEzgvf3LJQw/EDQYrkiEYZBBJ/fWUT/LO7iPLGwuIXgmc3o87sR6Mp6KI9q
 Jo6F0/pSryoQm0RgLzaJPAOBXQjOf2glPaoAHAN1o+1eLMZL4XdV14SDpqU4HMYLgzw0iRdA
 Z2eNVxKEd0OH1YY8WIpnQHNJn5f3wxtg1NXvjUfgYHjbd8WH50JutYnw3AV8jgbzq4cSocM2
 sN4bIAQ8Ez7arT5+NjjOnyIFfAyc5hM+sw5B9f1an2EjNNnbKU9QYiK0xbZSoLfCT4fnHXoC
 B8Ab9wwhQwAU1lwkBFoKujyZoA4D54tqwoDmGye1MU5qYJzUwPj/VjkiK1Awp+VVSo5fo+Yy
 V/AKFa9VK1fsS1NVoolv5xi3Dz1C9b/2NiJMI/k0aXl0aIKMUmTwh1SNCGhCHihtMM9KkEmT
 FIcOc5q0PRptKsc3olCalAdLj0zpjZdhpeIgl8Jx6Zzm31ZE+4XkoLOqiGj82a+ytr/xwcJr
 yux5fMqIJqvtz6ZdD0aGq4oNQ+nZHd+O6LmTBy4k2jrzb8qV9XFL4t9WLCg2bNl59+uTWOUW
 3WBMq3J363je00VHAxf25jq0y3K7t8dERI6W8vMv3/7Ttm5x1KfE4cQo+evH5sgxpmidw6av
 cmZK1FnrB+Qkn6xYvYzQ8Iq/0G+w8XIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsVy+t/xu7o2idKxBpeOcVv0Nk1nsji86AWj
 xZWv79ksTn39y2bRvHg9m8Wk+xNYLDonLmG3uPnpG6vF5V1z2CxePJe2eHHvLZPFiW/TmBx4
 PD6vesXqsXPWXXaP2R0zWT2mdEp4zDsZ6LF/7hp2j/vdx5k8+rasYvTYe28Li8fnTXIeM9q3
 sQZwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehl
 LOhWLLgrVPFh4VvmBsYt/F2MnBwSAiYSb6e2sXUxcnEICSxllLiz5hw7REJcYvf8t8wQtrDE
 n2tdUEWvGSV2/F/OCJIQFgiR6O2aA5YQEZjPJHHr5z92EIdZ4BWjxP3108Cq+ASCJPb+uMgC
 YgsJZEpc33GHCcRmE9CU+Lv5JlA3BwevgJ3Ev0miIGEWARWJK1e2gZWLCkRI9LXNZgOxeQUE
 JU7OfAIW5xSwkvjx4hnYGGYBdYk/8y4xQ9jiEreezIeKy0s0b53NPIFReBaS9llIWmYhaZmF
 pGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwKjfduznlh2MXe+CDzEKcDAq8fB6+EnH
 CrEmlhVX5h5ilOBgVhLh3b9CMlaINyWxsiq1KD++qDQntfgQoynQcxOZpUST84EJKa8k3tDU
 0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA+MGBofSYsVpevV8GRs3t+6K
 KJH+z7O968a/1VMDbz1NFd9UuO2ocbfgb073u5N12jcGyXLP+d9+Nz7wnrv075TCi1/3PH67
 30aH3dkmNyR4kuyF07EXgifzfZkjO+X13POll0Of9tnel6ubZpLpfCikSMKlO/PQ8V2XE8rF
 5mXM+sGeaX91t6USS3FGoqEWc1FxIgC8cTM9EAMAAA==
X-CMS-MailID: 20190702135052eucas1p11e2621af0514505789c7947b84cf133c
X-Msg-Generator: CA
X-RootMTR: 20190702135052eucas1p11e2621af0514505789c7947b84cf133c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702135052eucas1p11e2621af0514505789c7947b84cf133c
References: <20190419081926.13567-1-ronald@innovation.ch>
 <20190419081926.13567-2-ronald@innovation.ch>
 <CGME20190702135052eucas1p11e2621af0514505789c7947b84cf133c@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562075454;
 bh=kM0PAOZlcGdWVDnx1xJTwwuahc1a7vYgK76oZBXb47c=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=sMWK9XTvKafsyBHI7tx0uIr8SZoLEztx7S8tDEdoIZDHOFsG3bXOf1mJMaAtOPoh0
 992Thi2TiaJIb6baI43mm3rXT9Yf1aSaVAZESV2BAQRWE589pAzMrk7i7ha2xH3ju1
 G7POYfi4QRkni/s99zEpcNLHGGnl/0DosAZvuCc4=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Federico Lorenzi <federico@travelground.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkuMDQuMjAxOSAxMDoxOSwgUm9uYWxkIFRzY2hhbMOkciB3cm90ZToKPiBjb21taXQgZDZh
YmU2ZGY3MDZjIChkcm0vYnJpZGdlOiBzaWxfc2lpODYyMDogZG8gbm90IGhhdmUgYSBkZXBlbmRl
bmN5Cj4gb2YgUkNfQ09SRSkgY2hhbmdlZCB0aGUgZHJpdmVyIHRvIHNlbGVjdCBib3RoIFJDX0NP
UkUgYW5kIElOUFVULgo+IEhvd2V2ZXIsIHRoaXMgY2F1c2VzIHByb2JsZW1zIHdpdGggb3RoZXIg
ZHJpdmVycywgaW4gcGFydGljdWxhciBhbiBpbnB1dAo+IGRyaXZlciB0aGF0IGRlcGVuZHMgb24g
TUZEX0lOVEVMX0xQU1NfUENJICh0byBiZSBhZGRlZCBpbiBhIHNlcGFyYXRlCj4gY29tbWl0KToK
PiAKPiAgIGRyaXZlcnMvY2xrL0tjb25maWc6OTplcnJvcjogcmVjdXJzaXZlIGRlcGVuZGVuY3kg
ZGV0ZWN0ZWQhCj4gICBkcml2ZXJzL2Nsay9LY29uZmlnOjk6ICAgICAgICBzeW1ib2wgQ09NTU9O
X0NMSyBpcyBzZWxlY3RlZCBieSBNRkRfSU5URUxfTFBTUwo+ICAgZHJpdmVycy9tZmQvS2NvbmZp
Zzo1NjY6ICAgICAgc3ltYm9sIE1GRF9JTlRFTF9MUFNTIGlzIHNlbGVjdGVkIGJ5IE1GRF9JTlRF
TF9MUFNTX1BDSQo+ICAgZHJpdmVycy9tZmQvS2NvbmZpZzo1ODA6ICAgICAgc3ltYm9sIE1GRF9J
TlRFTF9MUFNTX1BDSSBpcyBpbXBsaWVkIGJ5IEtFWUJPQVJEX0FQUExFU1BJCj4gICBkcml2ZXJz
L2lucHV0L2tleWJvYXJkL0tjb25maWc6NzM6ICAgIHN5bWJvbCBLRVlCT0FSRF9BUFBMRVNQSSBk
ZXBlbmRzIG9uIElOUFVUCj4gICBkcml2ZXJzL2lucHV0L0tjb25maWc6ODogICAgICBzeW1ib2wg
SU5QVVQgaXMgc2VsZWN0ZWQgYnkgRFJNX1NJTF9TSUk4NjIwCj4gICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL0tjb25maWc6ODM6ICAgIHN5bWJvbCBEUk1fU0lMX1NJSTg2MjAgZGVwZW5kcyBvbiBE
Uk1fQlJJREdFCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWc6MTogICAgIHN5bWJv
bCBEUk1fQlJJREdFIGlzIHNlbGVjdGVkIGJ5IERSTV9QTDExMQo+ICAgZHJpdmVycy9ncHUvZHJt
L3BsMTExL0tjb25maWc6MTogICAgICBzeW1ib2wgRFJNX1BMMTExIGRlcGVuZHMgb24gQ09NTU9O
X0NMSwo+IAo+IEFjY29yZGluZyB0byB0aGUgZG9jcyBhbmQgZ2VuZXJhbCBjb25zZW5zdXMsIHNl
bGVjdCBzaG91bGQgb25seSBiZSB1c2VkCj4gZm9yIG5vbiB1c2VyLXZpc2libGUgc3ltYm9scywg
YnV0IGJvdGggUkNfQ09SRSBhbmQgSU5QVVQgYXJlCj4gdXNlci12aXNpYmxlLiBGdXJ0aGVybW9y
ZSBhbG1vc3QgYWxsIG90aGVyIHJlZmVyZW5jZXMgdG8gSU5QVVQKPiB0aHJvdWdob3V0IHRoZSBr
ZXJuZWwgY29uZmlnIGFyZSBkZXBlbmRzLCBub3Qgc2VsZWN0cy4gRm9yIHRoaXMgcmVhc29uCj4g
dGhlIGZpcnN0IHBhcnQgb2YgdGhpcyBjaGFuZ2UgcmV2ZXJ0cyBjb21taXQgZDZhYmU2ZGY3MDZj
Lgo+IAo+IEluIG9yZGVyIHRvIGFkZHJlc3MgdGhlIG9yaWdpbmFsIHJlYXNvbiBmb3IgY29tbWl0
IGQ2YWJlNmRmNzA2YywgbmFtZWx5Cj4gdGhhdCBub3QgYWxsIGJvYXJkcyB1c2UgdGhlIHJlbW90
ZSBjb250cm9sbGVyIGZ1bmN0aW9uYWxpdHkgYW5kIGhlbmNlCj4gc2hvdWxkIG5vdCBuZWVkIGhh
dmUgdG8gZGVhbCB3aXRoIFJDX0NPUkUsIHRoZSBzZWNvbmQgcGFydCBvZiB0aGlzCj4gY2hhbmdl
IG5vdyBtYWtlcyB0aGUgcmVtb3RlIGNvbnRyb2wgc3VwcG9ydCBpbiB0aGUgZHJpdmVyIG9wdGlv
bmFsIGFuZAo+IGNvbnRpbmdlbnQgb24gUkNfQ09SRSBiZWluZyBkZWZpbmVkLiBBbmQgd2l0aCB0
aGlzIHRoZSBoYXJkIGRlcGVuZGVuY3kKPiBvbiBJTlBVVCBhbHNvIGdvZXMgYXdheSBhcyB0aGF0
IGlzIG9ubHkgbmVlZGVkIGlmIFJDX0NPUkUgaXMgZGVmaW5lZAo+ICh3aGljaCBpbiB0dXJuIGFs
cmVhZHkgZGVwZW5kcyBvbiBJTlBVVCkuCj4gCj4gQ0M6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1z
dW5nLmNvbT4KPiBDQzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBDQzog
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IEND
OiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogUm9uYWxkIFRzY2hhbMOkciA8cm9uYWxkQGlubm92YXRpb24uY2g+Cj4gUmV2aWV3ZWQt
Ynk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgoKQXBwYXJlbnRseSB0aGlz
IHBhdGNoIHdhcyBub3QgcXVldWVkIHRvIGtlcm5lbCB5ZXQuIElmIHRoZXJlIGFyZSBubwpvYmpl
Y3Rpb25zIEkgd2lsbCBxdWV1ZSBpdCB2aWEgZHJtLW1pc2MtbmV4dCB0cmVlIHRvbW9ycm93LgoK
UmVnYXJkcwpBbmRyemVqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
