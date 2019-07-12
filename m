Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0566AEC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 12:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D456E340;
	Fri, 12 Jul 2019 10:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC3A6E340
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 10:31:58 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190712103157euoutp011cd65fecae8a0cefb2b3d2d8ba1df097~wokvb65LG2155221552euoutp01n
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 10:31:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190712103157euoutp011cd65fecae8a0cefb2b3d2d8ba1df097~wokvb65LG2155221552euoutp01n
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190712103156eucas1p2aec8cd3026c079d2e2048d4e65ad5aed~wokuuCVrO2616926169eucas1p2s;
 Fri, 12 Jul 2019 10:31:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C3.F1.04325.C91682D5; Fri, 12
 Jul 2019 11:31:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190712103155eucas1p2927c238305fdacc674f91c488719967d~wokt3gomK0175901759eucas1p2M;
 Fri, 12 Jul 2019 10:31:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190712103155eusmtrp22fb95a427a341078d17a474032433829~woktpQ5Sn1432014320eusmtrp2v;
 Fri, 12 Jul 2019 10:31:55 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-11-5d28619ce435
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CC.53.04140.B91682D5; Fri, 12
 Jul 2019 11:31:55 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190712103154eusmtip2cac930228fdd8f39b08e3668355ec268~woks_lk4a1098410984eusmtip2j;
 Fri, 12 Jul 2019 10:31:54 +0000 (GMT)
Subject: Re: [PATCH 2/3] dt-bindings: display: sii902x: Change audio mclk
 binding
To: Olivier Moysan <olivier.moysan@st.com>, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@st.com,
 alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, jsarha@ti.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <bc2b0a58-d5e2-ce82-d1c8-c17731e44e31@samsung.com>
Date: Fri, 12 Jul 2019 12:31:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhUWRjGO/fce+eONXId250Xi8KBPqGvLdkThSVUHPpiKeqPItq7ddFY
 HW1uuk1B34ZjaFqQ6Ygam2ZmWGMzrbMaNaV3bVjRNk1rw0qDPpykTCsqp7neIv/7ned93pfn
 gSNg8yE+Rthh2yXbbVKylY9gvU0fWmYVS9O3zC258CPJaWlmyOXeACK5pb0cCXnzMSm91cKR
 u4P9PGl/9xyT5r52lhxzZnHEmX/WQNw9HRz5z1fMk+yO8Eb5vTaG+HM3k5P1Lp5kNtwyLI2i
 1SXViPZ3Zhpow1AZS11ZhRx1Vzl5+k/eHYZeHXrE0e5jKkNrz+6n13NOsvTGtXn06fsGTNXO
 qwwdcE/6JXJTxOLtcvKODNk+J/7XiKSg838uzTV2d06mig+gP43ZyCiAuACuu1oN2ShCMIuV
 CLoq7vD64y2CvopGVnOZxQEEj9vDLmFkwxfaqMvnEBysTNM5iGAgSDSOFtfD0JmXI6vjxQ4M
 BUGqMS/OgM+1XbzGJjEeqgZrkMasOAU+qk1Y4x/EjfChzPnVEwXNhb0jd4ziCnj4xj2iY3Ey
 HPa4sM4WuN9bymiZQbwowLv6fkbPuQyGT6/TS0bDC/WKQeeJEKrT/Brvh+7KI1jfzULguVSH
 9cEiuKm2cdodHA5d45ujywkQ8lTw+vlI6AxG6REi4YS3AOuyCbKOmnV3LHT/6/l60ALlrYO8
 zhR6Sk7hPBRbNKpk0ahiRaOKFX3PUIbYKmSR05WURFmZb5P/mK1IKUq6LXH2ttQUNwr/zMCw
 OvgXuvbpNz8SBWQdZ+pcOG2LmZMyFEeKH4GAreNNVaGwZNouOfbI9tSt9vRkWfGjCQJrtZj2
 jnm02SwmSrvk32U5TbZ/mzKCMeYAajqfX7sgEPcq/naPN3I45mJcRsHPq1Z6RQ6/zFwSCq5b
 FHdBdVD3w7aWJ8WpO5dXT064kpQWW9dnkXYWPihvLIlbfdror82d5GAaD71x4PV5rkvup9PX
 dK34u76ysPFIevmGnwIzfWvveYa23YQJe9SpCYv3PVMC0cdb62tsvhevraySJM2bie2K9AV7
 JKmXlQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42I5/e/4Pd3ZiRqxBgdXSFn0njvJZLHxyWlG
 i775T1gt/m+byGwx/8g5VosrX9+zWVz9/pLZ4uSbqywW3Z0drBadE5ewW2x6fI3V4vKuOWwW
 XdeAOpZev8hkcagv2mLyntlsFq17j7A7CHqsmbeG0eP9jVZ2j73fFrB4zO6YyeqxaVUnm8eJ
 CZeYPLZ/e8Dqcb/7OJPH5iX1Hgd6J7N4HNxn6PH0x15mj+M3tjN5fN4kF8AXpWdTlF9akqqQ
 kV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfxtvMOa8Fs7ore1uPM
 DYyLObsYOTgkBEwkdv0P62Lk4hASWMooseb3C9YuRk6guLjE7vlvmSFsYYk/17rYIIpeM0rM
 +/OQCSQhLBAs8W3haxaQhIjANWaJXzu7WCCqrjJK7Dg/G6ydTUBT4u/mm2wgNq+AncSqr+sZ
 QWwWAVWJ38ePMYOcISoQJnH0RB5EiaDEyZlPWEBsTgE3ibufNoG1MguoS/yZd4kZwpaXaN46
 G8oWl7j1ZD7TBEbBWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzEC
 k8K2Yz+37GDsehd8iFGAg1GJh/eGpXqsEGtiWXFl7iFGCQ5mJRHeVf+BQrwpiZVVqUX58UWl
 OanFhxhNgX6byCwlmpwPTFh5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6
 mDg4pRoYA//OuqnL2hP6USA+fMKvBT/LYsU9Tuh2htW4dJ858ORD75SHpbcEnPJ4YoLjuLKT
 21cw/9tYnWHbap44z1dNLvNcOdvOGZ587wJ5yr9eDFmo//jThITufWsPyk+3lVHk+GJgMZH1
 9tVj9wLupDuo3nF96PD4ptrnfUdKVt1+s//DiazHX3kWKrEUZyQaajEXFScCAPejhnMgAwAA
X-CMS-MailID: 20190712103155eucas1p2927c238305fdacc674f91c488719967d
X-Msg-Generator: CA
X-RootMTR: 20190702154806epcas3p4058827de402f54ea3911c56ee17ae631
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702154806epcas3p4058827de402f54ea3911c56ee17ae631
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <CGME20190702154806epcas3p4058827de402f54ea3911c56ee17ae631@epcas3p4.samsung.com>
 <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562927517;
 bh=YxnS2+3M6pr5GjcHTelq9Mz+os4Y/hjBeH+yjaPYcOc=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=R56V/rCIcT6N46VPqh0tmFBlPiHvgRJlSplqyU0+dQ//ST2YtixGtRd1BX3FBUdkH
 1RqUqgNO6SkbSt1iWhhdJZiW5TOcWoUk3UebV8ElRp+8TcNJEtQ0xLlJRmhqUMPZXb
 L3++JPDyZk4Aek/dXQyBsNIKZS0vWYJerq861bpk=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIuMDcuMjAxOSAxNzo0NywgT2xpdmllciBNb3lzYW4gd3JvdGU6Cj4gQXMgc3RhdGVkIGlu
IFNpTDkwMjIvMjQgZGF0YXNoZWV0LCBtYXN0ZXIgY2xvY2sgaXMgbm90IHJlcXVpcmVkIGZvciBJ
MlMuCj4gTWFrZSBtY2xrIHByb3BlcnR5IG9wdGlvbmFsIGluIERUIGJpbmRpbmdzLgo+Cj4gRml4
ZXM6IDNmMTgwMjFmNDNhMyAoImR0LWJpbmRpbmdzOiBkaXNwbGF5OiBzaWk5MDJ4OiBBZGQgSERN
SSBhdWRpbyBiaW5kaW5ncyIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xp
dmllci5tb3lzYW5Ac3QuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQgfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkw
MngudHh0Cj4gaW5kZXggMmRmNDRiN2QzODIxLi42ZTE0ZTA4N2MwZDAgMTAwNjQ0Cj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngu
dHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL3NpaTkwMngudHh0Cj4gQEAgLTI2LDkgKzI2LDggQEAgT3B0aW9uYWwgcHJvcGVydGllczoK
PiAgCS0gY2xvY2tzOiBwaGFuZGxlIGFuZCBjbG9jayBzcGVjaWZpZXIgZm9yIGVhY2ggY2xvY2sg
bGlzdGVkIGluCj4gICAgICAgICAgICAgdGhlIGNsb2NrLW5hbWVzIHByb3BlcnR5Cj4gIAktIGNs
b2NrLW5hbWVzOiAibWNsayIKPiAtCSAgIERlc2NyaWJlcyBTSUk5MDJ4IE1DTEsgaW5wdXQuIE1D
TEsgaXMgdXNlZCB0byBwcm9kdWNlCj4gLQkgICBIRE1JIGF1ZGlvIENUUyB2YWx1ZXMuIFRoaXMg
cHJvcGVydHkgaXMgcmVxdWlyZWQgaWYKPiAtCSAgICIjc291bmQtZGFpLWNlbGxzIi1wcm9wZXJ0
eSBpcyBwcmVzZW50LiBUaGlzIHByb3BlcnR5IGZvbGxvd3MKPiArCSAgIERlc2NyaWJlcyBTSUk5
MDJ4IE1DTEsgaW5wdXQuIE1DTEsgY2FuIGJlIHVzZWQgdG8gcHJvZHVjZQo+ICsJICAgSERNSSBh
dWRpbyBDVFMgdmFsdWVzLiBUaGlzIHByb3BlcnR5IGZvbGxvd3MKPiAgCSAgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9jbG9jay1iaW5kaW5ncy50eHQKPiAgCSAgIGNv
bnN1bWVyIGJpbmRpbmcuCj4gIAoKQWNrZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5kcnplagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
