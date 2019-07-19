Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D12D6E3BC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 11:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642ED6E7EC;
	Fri, 19 Jul 2019 09:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AFE6E7EC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 09:50:40 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190719095038euoutp015a97ab66f808c9bdb27763e181038c99~yxhq0iWqw1679516795euoutp01e
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 09:50:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190719095038euoutp015a97ab66f808c9bdb27763e181038c99~yxhq0iWqw1679516795euoutp01e
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190719095037eucas1p208b65fbc9f78728baf36f6993e00f3e9~yxhpxbFVa2668326683eucas1p2W;
 Fri, 19 Jul 2019 09:50:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E5.15.04298.D62913D5; Fri, 19
 Jul 2019 10:50:37 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190719095036eucas1p2e495ffb551be40283756491b19461024~yxhpDoWtF2668326683eucas1p2V;
 Fri, 19 Jul 2019 09:50:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190719095036eusmtrp2a01400284e656b7bf73222ca42c52791~yxho1hPlC2835628356eusmtrp2S;
 Fri, 19 Jul 2019 09:50:36 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-b3-5d31926df8da
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 85.DB.04146.C62913D5; Fri, 19
 Jul 2019 10:50:36 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190719095036eusmtip103d641f757d278d6ac4685280b0de87b~yxhoZ8lU62903329033eusmtip1N;
 Fri, 19 Jul 2019 09:50:36 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: fix RC_CORE dependency
To: Arnd Bergmann <arnd@arndb.de>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <0a78f32d-009c-fe89-8211-cf5d893d0014@samsung.com>
Date: Fri, 19 Jul 2019 11:50:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2rJ1WqWZ8VtOZZ5YwFrg5bpVve_kS4utL0MjeBUzrLew@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJKsWRmVeSWpSXmKPExsWy7djPc7q5kwxjDQ48ErDoPXeSyeLvpGPs
 Fv+3TWS2OLzoBaPFla/v2Sw6Jy5ht7i8aw6bxYt7b5ks7k4+wujA6fH71yRGj73fFrB47Jx1
 l91jdsdMVo8pnRIe2789YPW4332cyeP4rlvsHp83yQVwRnHZpKTmZJalFunbJXBlvDrcylow
 lafi5/vXLA2Mezm7GDk5JARMJM7u/cPUxcjFISSwglFi16wDjBDOF0aJrVtXQWU+M0rc+HWB
 GablwqwrLBCJ5YwSj/7PgnLeArUcn84KUiUsYC6xa/YjMFtEQFFi6otnzCBFzALvmCTeTOpi
 AkmwCWhK/N18kw3E5hWwk/h7ay47iM0ioCrxsu8D2DpRgTCJnws6oWoEJU7OfMICYnMKBErM
 3LUJrIZZQF5i+9s5ULa4xK0n88HulhC4xy7R/q+REeJuF4lnrYvZIWxhiVfHt0DZMhL/d85n
 grDrJe6vaGGGaO4AemfDTqinrSUOH78I9A4H0AZNifW79CHCjhJn765hAQlLCPBJ3HgrCHED
 n8SkbdOZIcK8Eh1tQhDVihL3z26FGigusfTCV7YJjEqzkHw2C8k3s5B8Mwth7wJGllWM4qml
 xbnpqcWGeanlesWJucWleel6yfm5mxiBCez0v+OfdjB+vZR0iFGAg1GJhzcg1yBWiDWxrLgy
 9xCjBAezkgjv7Zf6sUK8KYmVValF+fFFpTmpxYcYpTlYlMR5qxkeRAsJpCeWpGanphakFsFk
 mTg4pRoYBT8ItP6e3JnLzJ/awT/rdONy8YcFL8WFBDxXNl8/mnWmObJONHzVyT8b/Tkmib/1
 s7sXr3fLzO3Ehub0J2ofD+9V64gNb51k6/g13bbZ+fJy6btGvsZv+Nx728+Z2Jb7VWcJPXnL
 tM5S+E9ysnrYw+V/og44RC/zuy+/5MfzwOllpYJB9bOUWIozEg21mIuKEwEgcxsiXAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsVy+t/xu7o5kwxjDRpuSFv0njvJZPF30jF2
 i//bJjJbHF70gtHiytf3bBadE5ewW1zeNYfN4sW9t0wWdycfYXTg9Pj9axKjx95vC1g8ds66
 y+4xu2Mmq8eUTgmP7d8esHrc7z7O5HF81y12j8+b5AI4o/RsivJLS1IVMvKLS2yVog0tjPQM
 LS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyXh1uZS2YylPx8/1rlgbGvZxdjJwcEgIm
 EhdmXWHpYuTiEBJYyijR3tDGBpEQl9g9/y0zhC0s8edaFxtE0WtGib7fHewgCWEBc4ldsx+x
 gtgiAooSU188YwYpYhZ4xyRxcu90ZoiOFiaJ5187GEGq2AQ0Jf5uvgm2glfATuLvrblgk1gE
 VCVe9n0AauDgEBUIkzh6Ig+iRFDi5MwnLCA2p0CgxMxdm8AuYhZQl/gz7xKULS+x/e0cKFtc
 4taT+UwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiM2G3H
 fm7ewXhpY/AhRgEORiUe3oBcg1gh1sSy4srcQ4wSHMxKIry3X+rHCvGmJFZWpRblxxeV5qQW
 H2I0BfptIrOUaHI+MJnklcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+Lg
 lGpgnPiEO1ByNqvowqe/i6azmdxaXue+NuCEX7pNQc2pm50Zoi07Hlx6v0uy4KjmsycbIy/E
 mLKudb9wblrIiWXZtTxh+q/XTudX3XVTnk/q72xpI492xw1fvwSLPjB7Kds1N7P31dkzV0IF
 H87Rcrtx7fiyoFyZD+v3XYm8sEG6x7+h8LXzWgfOq0osxRmJhlrMRcWJAMoHOFHuAgAA
X-CMS-MailID: 20190719095036eucas1p2e495ffb551be40283756491b19461024
X-Msg-Generator: CA
X-RootMTR: 20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022
References: <CGME20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022@epcas3p3.samsung.com>
 <20190718134240.2265724-1-arnd@arndb.de>
 <763005f0-fc66-51bc-fcfe-3ae4942a9c07@samsung.com>
 <CAK8P3a2rJ1WqWZ8VtOZZ5YwFrg5bpVve_kS4utL0MjeBUzrLew@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563529838;
 bh=UtMj5ktXO8NN/dLxR8ryNqQMtDNRVoeJwep6Dew2dWA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Q8iJ6hKr0Io0uG+8c6wkQzvXqbhw79jbMJssSnAM1w0zLDe0qbKjIBRTA+WaQQJop
 yq6s+/RqgI9uPi9Pp/yRqTo2izVAJYiG+5NgtxlgtfZ6TlNsdE+PWSvFEj59DC7vq/
 sFRGZibV+k3vzeGjYVZ6loiqYi4wW36eXDMW9FDI=
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkuMDcuMjAxOSAxMDozMywgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBGcmksIEp1bCAx
OSwgMjAxOSBhdCA5OjAxIEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdy
b3RlOgo+PiBPbiAxOC4wNy4yMDE5IDE1OjQyLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+Pj4gVXNp
bmcgJ2ltcGx5JyBjYXVzZXMgYSBuZXcgcHJvYmxlbSwgYXMgaXQgYWxsb3dzIHRoZSBjYXNlIG9m
Cj4+PiBDT05GSUdfSU5QVVQ9bSB3aXRoIFJDX0NPUkU9eSwgd2hpY2ggZmFpbHMgdG8gbGluazoK
Pj4KPj4gSSBoYXZlIHJldmlld2VkIGRlcGVuZGVuY2llcyBhbmQgSSB3b25kZXIgaG93IHN1Y2gg
Y29uZmlndXJhdGlvbiBpcwo+PiBwb3NzaWJsZSBhdCBhbGwuCj4+Cj4+IFJDX0NPUkUgZGVwZW5k
cyBvbiBJTlBVVCAoYXQgbGVhc3Qgb24gdG9kYXkncyBuZXh0IGJyYW5jaCkgc28gaWYgSU5QVVQ9
bQo+PiB0aGVuIFJDX0NPUkUgc2hvdWxkIGJlIGVpdGhlciBuIGVpdGhlciBtLCBhbSBJIHJpZ2h0
Pwo+IFJpZ2h0Lgo+Cj4+IEFybmQsIGFyZSB0aGVyZSB1bmtub3duIHRvIG1lIGNoYW5nZXMgaW4g
UkMvSU5QVVQgZGVwZW5kZW5jaWVzPwo+IEkgdGhpbmsgdGhpcyBpcyAnaW1wbHknIGJlaGF2aW5n
IG9kZGx5IHdoZW4gd2UgaGF2ZSBjb25mbGljdGluZyByZXF1aXJlbWVudHM6Cj4KPiAtIElOUFVU
PW0gZm9yY2VzIFJDX0NPUkUgdG8gYmUgPW0gb3IgPW4KPiAtIERSTV9TSUxfU0lJODYyMD15IGFz
a3MgUkNfQ09SRSB0byBiZSA9eSB1bmxlc3MgaXQgY2Fubm90IGJlIGVuYWJsZWQKPgo+IEtjb25m
aWcgZGVjaWRlZCB0byBtYWtlIHRoaXMgUkNfQ09SRT15LCB3aGljaCBjYXVzZWQgdGhlIGxpbmsK
PiBmYWlsdXJlLiBNYWtpbmcgaXQgUkNfQ09SRT1tIGhvd2V2ZXIgd291bGQgbm90IHdvcmsgZWl0
aGVyIGJlY2F1c2UKPiB0aGVuIHdlJ2QgZ2V0IGEgbGluayBmYWlsdXJlIGZyb20gdGhlIHNpaTg2
MjAgZHJpdmVyIHRvIHJjX2NvcmUuCj4KPiBzbyBhIHB1cmUgJ2ltcGx5JyBjYW5ub3Qgd29yayBo
ZXJlLCBhbmQgd2UgbmVlZCBhIGRlcGVuZGVuY3ksIG9uZSBvZjoKPgo+IGEpCj4gICAgZGVwZW5k
cyBvbiBJTlBVVCB8fCAhSU5QVVQKPiAgICBzZWxlY3QgUkNfQ09SRSBpZiBJTlBVVAo+Cj4gYikg
ZGVwZW5kcyBvbiBSQ19DT1JFIHx8ICFSQ19DT1JFCj4KPiBiKSBpcyB3aGF0IG90aGUgZHJpdmVy
cyB1c2UsIGUuZy4gU01TX1NESU9fRFJWCgoKT0ssIHRoYW5rcyBmb3IgZXhwbGFuYXRpb24sIHJl
YWxseSB3ZWlyZC4KCkkgdGhvdWdoIGFib3V0IGltcGx5IGFzICJ3ZWFrIGRlcGVuZGVuY3kiLCBi
dXQgaXQgaXMgIndlYWsgc2VsZWN0IiB3aXRoCmRyYXdiYWNrcyBvZiBzZWxlY3QuCgpBbnl3YXkg
SSBhbSBzdXJwcmlzZWQgdGhhdCBLY29uZmlnIGRpZCBub3QgY29tcGxhaW4gYWJvdXQgY29udHJh
ZGljdG9yeQpyZXF1aXJlbWVudHMgb24gUkNfQ09SRSBzeW1ib2wuCgoKUmVnYXJkcwoKQW5kcnpl
agoKCj4KPiAgICAgICAgQXJuZAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
