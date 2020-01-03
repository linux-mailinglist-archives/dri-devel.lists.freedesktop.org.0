Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762712F825
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 13:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A58C6E2E4;
	Fri,  3 Jan 2020 12:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E643A6E2E4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:22:50 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103122249euoutp0287fc8f8b7f669b8d6861cd51ee1824ec~mX_fstHBV2568425684euoutp026
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:22:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200103122249euoutp0287fc8f8b7f669b8d6861cd51ee1824ec~mX_fstHBV2568425684euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578054169;
 bh=qz3vCml/Vlv9r1Aqb/Ae+7dojZSRbFwZFZBgN3gJ9PE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=PeH+ouAbYcLItY9Eeq02aCEmLyuCBXJlL1vjfJpM6vxMew8MEboyvnGTNvA28LOT9
 etdkyw1DHRpnPxZ8k5xYK63DWAIsUIQathoxzF+uLDSwxclNok/nW762ehBeSjBHzs
 ORiwL5p6O4BcXhNLh8kcd3iRt3Qt/Z1w9GCUxZHs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200103122249eucas1p17ca28c5846788fef6b0f3b5b00ede7c8~mX_foA69D2967629676eucas1p1Z;
 Fri,  3 Jan 2020 12:22:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 21.7A.61286.8123F0E5; Fri,  3
 Jan 2020 12:22:48 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200103122248eucas1p1f3053cb6b27525299714825e771cd92a~mX_fGGjIj2965629656eucas1p1d;
 Fri,  3 Jan 2020 12:22:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200103122248eusmtrp23d8ab4de1d67357e5c4342a454d60add~mX_fFhsAd2952829528eusmtrp2f;
 Fri,  3 Jan 2020 12:22:48 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-09-5e0f3218a055
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 91.34.07950.8123F0E5; Fri,  3
 Jan 2020 12:22:48 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200103122248eusmtip2c33eba0f91e0b29ed1c6092afd6d6fb9~mX_eztqxD0532905329eusmtip2J;
 Fri,  3 Jan 2020 12:22:48 +0000 (GMT)
Subject: Re: [PATCH] fbdev: matrox: make array wtst_xlat static const, makes
 object smaller
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Colin
 King <colin.king@canonical.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <fce5c5cc-bbb3-40a9-27fe-90957d25e7fe@samsung.com>
Date: Fri, 3 Jan 2020 13:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906181714.GU7482@intel.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsWy7djPc7oSRvxxBl8vWVj8Xt3LZnHl63s2
 i623pC1O9H1gtbi8aw6bxfd/C5kc2DxmNfSyecw7Gehxv/s4k8fnTXIBLFFcNimpOZllqUX6
 dglcGScvL2AueM1fMWPvC/YGxgM8XYycHBICJhIzTvxi6mLk4hASWMEocez2LjYI5wujxJ8b
 jxghnM+MEpP/7wJyOMBafraIQMSXM0o8uL4Zqv0to8SjD1MZQeYKC8RKbF/zjB3EFhHIlfiz
 /RMrSBGzQCOjxLk7V9lAEmwCVhIT21eBNfAK2EksOf6XGWQDi4CKxKXLkiBhUYEIiU8PDrNC
 lAhKnJz5hAXE5hTQk2i8eRpsPrOAuMStJ/OZIGx5ieats5khflvELvGsmQvCdpFonvKMCcIW
 lnh1fAs7hC0j8X/nfLAHJATWMUr87XjBDOFsZ5RYPvkfG0SVtcSdc7/YQI5jFtCUWL9LHyLs
 KHH75CR2SKjwSdx4KwhxA5/EpG3TmSHCvBIdbUIQ1WoSG5ZtYINZ27VzJfMERqVZSD6bheSb
 WUi+mYWwdwEjyypG8dTS4tz01GLDvNRyveLE3OLSvHS95PzcTYzAVHP63/FPOxi/Xko6xCjA
 wajEw5ugzB8nxJpYVlyZe4hRgoNZSYS3PJA3Tog3JbGyKrUoP76oNCe1+BCjNAeLkjiv8aKX
 sUIC6YklqdmpqQWpRTBZJg5OqQbGjQaX36aZcDZ8ZuCWMeSJd59c6bT4QdUFx0V8//2LnaqO
 3i9Tjd/pd8R4o2DX0x/tGWwrKlqzZnI8+NZxMM93s1p35oVXd39+uV1i82vprUurPD1Yl1xc
 tDWmv3DFy/dL/t1f0vxwmoKQm+5r64sHnz07MSH8bJ6uqq9KfNhB1+QnEv80l3c6KLEUZyQa
 ajEXFScCAMqB/tcxAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xe7oSRvxxBtdWy1r8Xt3LZnHl63s2
 i623pC1O9H1gtbi8aw6bxfd/C5kc2DxmNfSyecw7Gehxv/s4k8fnTXIBLFF6NkX5pSWpChn5
 xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GScvL2AueM1fMWPvC/YG
 xgM8XYwcHBICJhI/W0S6GLk4hASWMkqc6bnFAhGXkTi+vqyLkRPIFJb4c62LDaLmNaNE16d2
 ZpCEsECsxPY1z9hBbBGBXIkb2zYxgxQxCzQySiw58p8JomMro8TZ3cfBOtgErCQmtq9iBLF5
 Bewklhz/ywyyjUVAReLSZUmQsKhAhMThHbOgSgQlTs58wgJicwroSTTePA22jFlAXeLPvEvM
 ELa4xK0n85kgbHmJ5q2zmScwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqX
 rpecn7uJERhb24793LKDsetd8CFGAQ5GJR5eDkX+OCHWxLLiytxDjBIczEoivOWBvHFCvCmJ
 lVWpRfnxRaU5qcWHGE2BfpvILCWanA+M+7ySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp
 2ampBalFMH1MHJxSDYyBUy6YSJ3LdlpU1CJ5lOm31MPOfOnpeRO/sDup+8W4XHCUmb+40+3O
 ko9dpxulQqIvCNpvYZVJWO+dstN7y7z6ybnfalZv8by+/n77teyVrVIdp/pLjuaenvWmjW91
 sOwN5oDg+EJ54ZgDK5o3McnbVfpOVperLf1z667tFjadG9Zhd9uSxJVYijMSDbWYi4oTAcCX
 MPbDAgAA
X-CMS-MailID: 20200103122248eucas1p1f3053cb6b27525299714825e771cd92a
X-Msg-Generator: CA
X-RootMTR: 20190906181721epcas4p4be0f813e9da4d8e386b7a1c0b2ab1da7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190906181721epcas4p4be0f813e9da4d8e386b7a1c0b2ab1da7
References: <20190906181114.31414-1-colin.king@canonical.com>
 <CGME20190906181721epcas4p4be0f813e9da4d8e386b7a1c0b2ab1da7@epcas4p4.samsung.com>
 <20190906181714.GU7482@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvNi8xOSA4OjE3IFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gRnJpLCBTZXAg
MDYsIDIwMTkgYXQgMDc6MTE6MTRQTSArMDEwMCwgQ29saW4gS2luZyB3cm90ZToKPj4gRnJvbTog
Q29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPj4KPj4gRG9uJ3QgcG9w
dWxhdGUgdGhlIGFycmF5IHd0c3RfeGxhdCBvbiB0aGUgc3RhY2sgYnV0IGluc3RlYWQgbWFrZSBp
dAo+PiBzdGF0aWMgY29uc3QuIE1ha2VzIHRoZSBvYmplY3QgY29kZSBzbWFsbGVyIGJ5IDg5IGJ5
dGVzLgo+Pgo+PiBCZWZvcmU6Cj4+ICAgIHRleHQJICAgZGF0YQkgICAgYnNzCSAgICBkZWMJICAg
IGhleAlmaWxlbmFtZQo+PiAgIDE0MzQ3CSAgICA4NDAJICAgICAgMAkgIDE1MTg3CSAgIDNiNTMJ
ZmJkZXYvbWF0cm94L21hdHJveGZiX21pc2Mubwo+Pgo+PiBBZnRlcjoKPj4gICAgdGV4dAkgICBk
YXRhCSAgICBic3MJICAgIGRlYwkgICAgaGV4CWZpbGVuYW1lCj4+ICAgMTQxNjIJICAgIDkzNgkg
ICAgICAwCSAgMTUwOTgJICAgM2FmYQlmYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlzYy5vCj4+Cj4+
IChnY2MgdmVyc2lvbiA5LjIuMSwgYW1kNjQpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpUaGFua3MsIHBhdGNoIHF1ZXVlZCBm
b3IgdjUuNiAoYWxzbyBzb3JyeSBmb3IgdGhlIGRlbGF5KS4KCj4+IC0tLQo+PiAgZHJpdmVycy92
aWRlby9mYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlzYy5jIHwgNSArKysrLQo+PiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9mYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlzYy5jIGIvZHJpdmVycy92aWRl
by9mYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlzYy5jCj4+IGluZGV4IGM3YWFjYTEyODA1ZS4uZmVi
MDk3N2M4MmViIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJveC9tYXRy
b3hmYl9taXNjLmMKPj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9tYXRyb3gvbWF0cm94ZmJf
bWlzYy5jCj4+IEBAIC02NzMsNyArNjczLDEwIEBAIHN0YXRpYyBpbnQgcGFyc2VfcGluczUoc3Ry
dWN0IG1hdHJveF9mYl9pbmZvICptaW5mbywKPj4gIAlpZiAoYmQtPnBpbnNbMTE1XSAmIDQpIHsK
Pj4gIAkJbWluZm8tPnZhbHVlcy5yZWcubWN0bHd0c3RfY29yZSA9IG1pbmZvLT52YWx1ZXMucmVn
Lm1jdGx3dHN0Owo+PiAgCX0gZWxzZSB7Cj4+IC0JCXVfaW50MzJfdCB3dHN0X3hsYXRbXSA9IHsg
MCwgMSwgNSwgNiwgNywgNSwgMiwgMyB9Owo+PiArCQlzdGF0aWMgY29uc3QgdV9pbnQzMl90IHd0
c3RfeGxhdFtdID0gewo+PiArCQkJMCwgMSwgNSwgNiwgNywgNSwgMiwgMwo+IAo+IEFsbCBvZiB0
aG9zZSB3b3VsZCBlYXNpbHkgZml0IGluIHU4IGFzIHdlbGwuCgpHb29kIGlkZWEsIEkndmUgY29u
dmVydGVkIHRoZSB0YWJsZSB0byB1OCB3aGlsZSBhcHBseWluZyB0aGUgcGF0Y2guCgpCZXN0IHJl
Z2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRl
IFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCgo+PiArCQl9Owo+PiArCj4+ICAJCW1pbmZvLT52
YWx1ZXMucmVnLm1jdGx3dHN0X2NvcmUgPSAobWluZm8tPnZhbHVlcy5yZWcubWN0bHd0c3QgJiB+
NykgfAo+PiAgCQkJCQkJICB3dHN0X3hsYXRbbWluZm8tPnZhbHVlcy5yZWcubWN0bHd0c3QgJiA3
XTsKPj4gIAl9Cj4+IC0tIAo+PiAyLjIwLjEKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
