Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09FA12D78E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1476E1E6;
	Tue, 31 Dec 2019 09:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56ED89DEA
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 07:18:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191231071804euoutp02feb3d05f3fe7acef1f03fa8221e52915~lY4kaUvwb1290912909euoutp02c
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 07:18:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191231071804euoutp02feb3d05f3fe7acef1f03fa8221e52915~lY4kaUvwb1290912909euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1577776685;
 bh=mxgW3OjCblyLWNF7NbGsSeLkWkVFDm7ORlqp6ibSZIo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=LSgRsQZJyvAH6wRuvs0J7oByWWrJAjeRLGCjkZse14yA0BUIOJUWf5GCj8tqoghV2
 YJ3TIadk6nI/U0AMOq4L65lpcHe8cEuignGUbaVNEftIKMJXlms6rD/sHjBxbPum9W
 U8ADf6FxAJLPKoQA8UIWi54sCywtlyRrnVpKE7no=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191231071804eucas1p2ed176f4b629c2512ef25751c808b001b~lY4kJodxc1217212172eucas1p2B;
 Tue, 31 Dec 2019 07:18:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 67.4F.61286.C26FA0E5; Tue, 31
 Dec 2019 07:18:04 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191231071803eucas1p1f40c18c6a3fe31647f77f96b9b8aff3d~lY4i_Szi01248012480eucas1p1b;
 Tue, 31 Dec 2019 07:18:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191231071803eusmtrp15bcc547f61e3c63b562bb6ebe9d437c0~lY4i9g7hY0485704857eusmtrp1Y;
 Tue, 31 Dec 2019 07:18:03 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-9f-5e0af62c9e6e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 8A.A9.08375.B26FA0E5; Tue, 31
 Dec 2019 07:18:03 +0000 (GMT)
Received: from AMDC3555 (unknown [106.120.51.67]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20191231071802eusmtip282c6a233e34aa05f9bff3892bef303ea~lY4iNOMhH2926629266eusmtip20;
 Tue, 31 Dec 2019 07:18:02 +0000 (GMT)
Message-ID: <2922135223b01126277ef92a53e6b294bc17bb5c.camel@samsung.com>
Subject: Re: [RFC PATCH v3 4/7] arm: dts: exynos: Add interconnect bindings
 for Exynos4412
From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 31 Dec 2019 08:18:01 +0100
In-Reply-To: <20191230154405.GC4918@pi3>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHe3Zfdh1Or1vgwUJpYmWYZondMNKiDxf6Yl/6EGqtvPi+ateX
 DEJTMnUqplE6A8Wkhk6m86VNM0OmCzWnFS5S0V5MDHSopRZYbV7Fvv3O/znn/P8HHgqTDRE+
 VJIqnVOrlKkKUoJ3DvyyHQ5alcQdsb9SMK1VBoKx/5gjmFrLCMG8/+kgmUc9RpKpmC7HGZut
 RczoppYIxvhlnGDedT0mmZVSC2KqbC9FTLNlSsxM3NGRTFXlPBnlyRobi0h2cvwFyU5rrCK2
 rSGHbV00idiy9kbErhh9o8UXJSfjudSkTE4dcuqyJLG/Kw+/3im/WVndLcpFM57FyI0COgys
 +flYMZJQMlqHYNa0JBKKHwhsmhpSKFYQLOrK8e2R4naNyMUy+hmCJotK4G8I7DPnXSylWRh9
 fhe5WE7HgHZ9Wuxiko6ENxOrm7O76UCwb6wRLgOMfoDBqGZ0swmnA0DfY9s0c6MPQlVeNykY
 B8HCYJlTp5wGXrBhkrtkjPaD/I4aTGhZEsNwYaLAZ+GvtWwrsxy+W9vFAu+FocqSLZ2HWfP0
 ZgagcxEYn1q2FkXA5Mhv0uWFOYMaukIE+TR0rLlup5zsAR8WvIQIHlDR+QgTZCkUFsgEVEBX
 tYcwCJDXNL61m4WxhiKiHO3T7pyi/e8U7Y5rHcIakTeXwaclcHyoissK5pVpfIYqIfjqtTQj
 cn6xoT/WZRP6+fZKH6IppHCXFu6SxMkIZSafndaHgMIUu6VhMW5xMmm8MvsWp752SZ2RyvF9
 aA+FK7ylx+rnY2V0gjKdS+G465x6+1VEufnkouZMtqHu9SI8iUgZzCxTG2g28n6HMvpE+DBd
 vEzK/f18a1Zr5/bnmNqmRMfP6Nxbey/0Hph9KDu3PmPW36u3fy6s/jQ8UfI10pwSU5pMmtu7
 +fqAhx/1UQZcv4w71h2c1tFb4H8jucXQG3iUl1TE5mkGmhIc4f1mz3dZY7cVOJ+oDD2EqXnl
 P37/AKBeAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsVy+t/xe7ra37jiDLY3i1psnLGe1eL6l+es
 FvOPnGO1uPL1PZvF9L2b2Cwm3Z/AYnH+/AZ2ixV3P7JabHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFnMmPySzYHfY9OqTjaPO9f2sHnc7z7O5LF5Sb3Hxnc7mDz6tqxi9Pi8SS6A
 PUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4+iu
 JpaCbcIVk2fuZmpgfMDfxcjJISFgItG1pZupi5GLQ0hgKaPEsnXXmSESEhIf199ghbCFJf5c
 62KDKHrCKHFq6TNGkASvgIfEhe2tYLawQIzErB/32UFsNgF7ibO3vzGB2CICmhLX/34HG8Qs
 MJVZYvesABCbRUBVYs3e8ywgNqeAhsSMpt1sILaQwE1Gicn3VCHqNSVat/9mhzhCR+LtqT6g
 eg6gvYISf3cIQ5TISzRvnc08gVFwFpKOWQhVs5BULWBkXsUoklpanJueW2yoV5yYW1yal66X
 nJ+7iREYo9uO/dy8g/HSxuBDjAIcjEo8vA+YuOKEWBPLiitzDzFKcDArifCaxHDGCfGmJFZW
 pRblxxeV5qQWH2I0BXpnIrOUaHI+MH3klcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1O
 TS1ILYLpY+LglGpgzP66/f6HJf9rs78fuTelYOGmW8W6bmnVAoYyO8Pj+vfE/MhawzPB76nw
 nC27AlPOH7e9WdcV8vi6S0TA6h4zbz7tSy/+b7DLWnLnz4mJwbpzZNQbGbZpXHvWcvdI15HV
 M7kS9STkFd7MfbWxIc5NVVTiXZnuynXPv4m8vrZI+fN002MGx4VOBimxFGckGmoxFxUnAgAs
 FhlB5wIAAA==
X-CMS-MailID: 20191231071803eucas1p1f40c18c6a3fe31647f77f96b9b8aff3d
X-Msg-Generator: CA
X-RootMTR: 20191220120144eucas1p119ececf161a6d45a6a194e432bbbd1f9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191220120144eucas1p119ececf161a6d45a6a194e432bbbd1f9
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120144eucas1p119ececf161a6d45a6a194e432bbbd1f9@eucas1p1.samsung.com>
 <20191220115653.6487-5-a.swigon@samsung.com> <20191230154405.GC4918@pi3>
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 georgi.djakov@linaro.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBNb24sIDIwMTktMTItMzAgYXQgMTY6NDQgKzAxMDAsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4gT24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgMTI6NTY6NTBQTSArMDEwMCwgQXJ0
dXIgxZp3aWdvxYQgd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGFkZHMgdGhlIGZvbGxvd2luZyBwcm9w
ZXJ0aWVzIHRvIHRoZSBFeHlub3M0NDEyIERUOgo+ID4gICAtIGV4eW5vcyxpbnRlcmNvbm5lY3Qt
cGFyZW50LW5vZGU6IHRvIGRlY2xhcmUgY29ubmVjdGlvbnMgYmV0d2Vlbgo+ID4gICAgIG5vZGVz
IGluIG9yZGVyIHRvIGd1YXJhbnRlZSBQTSBRb1MgcmVxdWlyZW1lbnRzIGJldHdlZW4gbm9kZXM7
Cj4gPiAgIC0gI2ludGVyY29ubmVjdC1jZWxsczogcmVxdWlyZWQgYnkgdGhlIGludGVyY29ubmVj
dCBmcmFtZXdvcmsuCj4gPiAKPiA+IE5vdGUgdGhhdCAjaW50ZXJjb25uZWN0LWNlbGxzIGlzIGFs
d2F5cyB6ZXJvIGFuZCBub2RlIElEcyBhcmUgbm90Cj4gPiBoYXJkY29kZWQgYW55d2hlcmUuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNv
bT4KPiA+IC0tLQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTItb2Ryb2lkLWNvbW1v
bi5kdHNpIHwgNSArKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAK
PiBUaGUgb3JkZXIgb2YgcGF0Y2hlcyBpcyBjb25mdXNpbmcuIFBhdGNoZXMgNCBhbmQgNiBhcmUg
c3BsaXQgLSBkbyB0aGUKPiBkZXBlbmQgb24gNT8gSSBkb3VidCBidXQuLi4KCkxldCBtZSBlbGFi
b3JhdGU6CgpUaGUgb3JkZXIgb2YgdGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgaXMgc3VjaCB0
aGF0IGV2ZXJ5IHN1YnNlcXVlbnQKcGF0Y2ggYWRkcyBzb21lIGZ1bmN0aW9uYWxpdHkgKGFuZCwg
b2YgY291cnNlLCBhcHBseWluZyBwYXRjaGVzIG9uZS1ieS1vbmUKeWllbGRzIGEgd29ya2luZyBr
ZXJuZWwgYXQgZXZlcnkgc3RlcCkuIFNwZWNpZmljYWxseSBmb3IgcGF0Y2hlcyAwNC0tMDc6Cgog
LS0gcGF0Y2ggMDQgYWRkcyBpbnRlcmNvbm5lY3QgX3Byb3ZpZGVyXyBwcm9wZXJ0aWVzIGZvciBF
eHlub3M0NDEyOwogLS0gcGF0Y2ggMDUgaW1wbGVtZW50cyBpbnRlcmNvbm5lY3QgcHJvdmlkZXIg
bG9naWMgKGRlcGVuZHMgb24gcGF0Y2ggMDQpOwogLS0gcGF0Y2ggMDYgYWRkcyBpbnRlcmNvbm5l
Y3QgX2NvbnN1bWVyXyBwcm9wZXJ0aWVzIGZvciBFeHlub3M0NDEyIG1peGVyOwogLS0gcGF0Y2gg
MDcgaW1wbGVtZW50cyBpbnRlcmNvbm5lY3QgY29uc3VtZXIgbG9naWMgKGRlcGVuZHMgb24gcGF0
Y2hlcwogICAgMDUgJiAwNik7CgpNeSByZWFzb25pbmcgaXMgdGhhdCB0aGlzIG9yZGVyIGFsbG93
cyB0byBlLmcuLCBtZXJnZSB0aGUgaW50ZXJjb25uZWN0CnByb3ZpZGVyIGZvciBleHlub3MtYnVz
IGFuZCBsZWF2ZSB0aGUgY29uc3VtZXJzIGZvciBsYXRlciAobm90IGxpbWl0ZWQgdG8KdGhlIG1p
eGVyKS4gSSBob3BlIHRoaXMgbWFrZXMgc2Vuc2UuCgo+IEFkanVzdCB0aGUgdGl0bGUgdG8gbWF0
Y2ggdGhlIGNvbnRlbnRzIC0geW91IGFyZSBub3QgYWRkaW5nIGJpbmRpbmdzIGJ1dAo+IHByb3Bl
cnRpZXMgdG8gYnVzIG5vZGVzLiBBbHNvIHRoZSBwcmVmaXggaXMgQVJNOiAobG9vayBhdCByZWNl
bnQKPiBjb21taXRzKS4KCk9LLgoKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2V4eW5vczQ0MTItb2Ryb2lkLWNvbW1vbi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5
bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kKPiA+IGluZGV4IDRjZTNkNzdhNjcwNC4uZDlkNzBl
YWNmY2FmIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJv
aWQtY29tbW9uLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTItb2Ry
b2lkLWNvbW1vbi5kdHNpCj4gPiBAQCAtOTAsNiArOTAsNyBAQAo+ID4gICZidXNfZG1jIHsKPiA+
ICAJZXh5bm9zLHBwbXUtZGV2aWNlID0gPCZwcG11X2RtYzBfMz4sIDwmcHBtdV9kbWMxXzM+Owo+
ID4gIAl2ZGQtc3VwcGx5ID0gPCZidWNrMV9yZWc+Owo+ID4gKwkjaW50ZXJjb25uZWN0LWNlbGxz
ID0gPDA+Owo+IAo+IFRoaXMgZG9lcyBub3QgbG9vayBsaWtlIHByb3BlcnR5IG9mIE9kcm9pZCBi
dXQgRXh5bm9zNDQxMiBvciBFeHlub3M0LgoKU3RyYW5nZWx5IGVub3VnaCwgdGhpcyBmaWxlIGlz
IHdoZXJlIHRoZSAnZXh5bm9zLHBhcmVudC1idXMnIChha2EuICdkZXZmcmVxJykKcHJvcGVydGll
cyBhcmUgbG9jYXRlZCAoYW5kIGV2ZXJ5dGhpbmcgaW4gdGhpcyBSRkMgY29uY2VybnMgZGV2ZnJl
cSkuCgpSZWdhcmRzLAotLSAKQXJ0dXIgxZp3aWdvxYQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBv
bGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
