Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA3724D63A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 15:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DAB6E14D;
	Fri, 21 Aug 2020 13:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D886E14D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 13:38:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200821133850euoutp014927ed03544f26b4470f12c765eb190c~tTB0VTaaA3035730357euoutp01a
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 13:38:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200821133850euoutp014927ed03544f26b4470f12c765eb190c~tTB0VTaaA3035730357euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598017130;
 bh=PKDp4H0K8uyocu7NrFxiqQ4LluS5nl44yexs6EOXu0w=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ADQBlNiRT6H4+nd6odQYVYj5TWyHLgs0gZ2np3pADtOwQsvPb/5aqZgJwS1Ncvovr
 1OOGsD8XoLofSZorTuxYdJDJLUb+fGv78e6Mrg1qaz8HFbino5iCxnvY788zPcewg0
 HJTMvWcX8HXvYlvFxvAPGptFjHkXdGKzTYbCOyAM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200821133850eucas1p294fd936bcd85ec542b9338f3109cd763~tTBz_Sp0E2703427034eucas1p2l;
 Fri, 21 Aug 2020 13:38:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 47.7A.06456.A6ECF3F5; Fri, 21
 Aug 2020 14:38:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200821133849eucas1p1c5312c4053aac0878841b048755991b5~tTBzqvsBZ0285102851eucas1p1B;
 Fri, 21 Aug 2020 13:38:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200821133849eusmtrp17099eddedfe77d945724c5cd1d30d153~tTBzqHfDc0848908489eusmtrp1f;
 Fri, 21 Aug 2020 13:38:49 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-64-5f3fce6a8eea
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5B.28.06314.96ECF3F5; Fri, 21
 Aug 2020 14:38:49 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200821133849eusmtip1dab3a1fdf015c62eedc9b014cb4f8d45~tTBzUQE5p1814218142eusmtip1O;
 Fri, 21 Aug 2020 13:38:49 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: controlfb: Fix build for COMPILE_TEST=y
 && PPC_PMAC=n
To: Michael Ellerman <mpe@ellerman.id.au>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <cd4324bb-67f7-5ae0-af7b-42681d72d85f@samsung.com>
Date: Fri, 21 Aug 2020 15:38:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200821104910.3363818-1-mpe@ellerman.id.au>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djP87pZ5+zjDS4t57BY+PAus8WVr+/Z
 LE70fWC1uLxrDpvF/xtvWCy2NBxis1jxcyujA7vHopcNLB57vy1g8bjffZzJY+Wli+weS6Zd
 ZfP4vEkugC2KyyYlNSezLLVI3y6BK6Pr9SW2goPcFW9evGRpYNzH2cXIySEhYCIxafcWVhBb
 SGAFo8S651FdjFxA9hdGield+9ggnM+MErffdbPAdBy/vZURIrGcUeLj91PMEO1vGSU2N3iA
 2MICURJLz15hA7FFBDQlru5exgrSwCywlFHiyeOFTCAJNgEriYntqxhBbF4BO4neZY1AcQ4O
 FgFViYZeVZCwqECExKcHh1khSgQlTs58AnYEJ1DrsmtXweYzC4hL3HoynwnClpdo3jqbGWSX
 hMA+dolrTZuZIK52kfg78yIzhC0s8er4FnYIW0bi9OQeFoiGdYwSfzteQHVvZ5RYPvkfG0SV
 tcSdc7/YQK5jBnpn/S59EFNCwFFi+zdeCJNP4sZbQYgb+CQmbZvODBHmlehoE4KYoSaxYdkG
 NpitXTtXMk9gVJqF5LNZSL6ZheSbWQhrFzCyrGIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/d
 xAhMRaf/Hf+0g/HrpaRDjAIcjEo8vD8O2ccLsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUo
 P76oNCe1+BCjNAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OqQbGRWzNhav5xL9GS2aVBOaI
 X3OK2Cs1wV69K/6o2qRFi5atDW5Nzv3oyMrhMsN727m0f3qxMwutvHqPXKt4vTd5O0POZIFb
 7z2FytvYbr6TuqbR3VDxI23t86pjF7/tElywKmK1bbih0+tr62tsW1nPBoiqP93udEJFnydX
 su7H8a6ViZNX1i1RYinOSDTUYi4qTgQAAktlTUEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7qZ5+zjDY5sNLRY+PAus8WVr+/Z
 LE70fWC1uLxrDpvF/xtvWCy2NBxis1jxcyujA7vHopcNLB57vy1g8bjffZzJY+Wli+weS6Zd
 ZfP4vEkugC1Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI
 3y5BL6Pr9SW2goPcFW9evGRpYNzH2cXIySEhYCJx/PZWxi5GLg4hgaWMEps3HmbpYuQASshI
 HF9fBlEjLPHnWhcbRM1rRomvc7aygySEBaIkbkx9xghiiwhoSlzdvYwVpIgZZNDL2UfYITp6
 GSU+bOljA6liE7CSmNi+CqyDV8BOondZIxPINhYBVYmGXlWQsKhAhMThHbOgSgQlTs58wgJi
 cwK1Lrt2FWwMs4C6xJ95l5ghbHGJW0/mM0HY8hLNW2czT2AUmoWkfRaSlllIWmYhaVnAyLKK
 USS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMP62Hfu5eQfjpY3BhxgFOBiVeHh/HLKPF2JNLCuu
 zD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRlOg3yYyS4km5wNTQ15JvKGpobmFpaG5
 sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkb/oFvq71tmTP5vdmG9Q77Iogjvi6t3
 ZYhr+6Xv2HKUn/l6nv1dQ74G9iUPV4hPaFv+9NGjnVZNCpVLjeuqUj48bYv/lWJcyqH0buvc
 PVJS6/b/c+L8328i3bbzt+NJoQ2mPfHuL2Tmer1/eMn+TfnU23J7s33zZOpmCLZc3SN47mSJ
 vuIJlSolluKMREMt5qLiRABNJS5i1QIAAA==
X-CMS-MailID: 20200821133849eucas1p1c5312c4053aac0878841b048755991b5
X-Msg-Generator: CA
X-RootMTR: 20200821104924eucas1p1e4b848e88fe460b9b7063669714a36f3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200821104924eucas1p1e4b848e88fe460b9b7063669714a36f3
References: <CGME20200821104924eucas1p1e4b848e88fe460b9b7063669714a36f3@eucas1p1.samsung.com>
 <20200821104910.3363818-1-mpe@ellerman.id.au>
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
Cc: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linuxppc-dev@ozlabs.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMjEvMjAgMTI6NDkgUE0sIE1pY2hhZWwgRWxsZXJtYW4gd3JvdGU6Cj4gVGhlIGJ1aWxk
IGlzIGN1cnJlbnRseSBicm9rZW4sIGlmIENPTVBJTEVfVEVTVD15IGFuZCBQUENfUE1BQz1uOgo+
IAo+ICAgbGludXgvZHJpdmVycy92aWRlby9mYmRldi9jb250cm9sZmIuYzogSW4gZnVuY3Rpb24g
4oCYY29udHJvbF9zZXRfaGFyZHdhcmXigJk6Cj4gICBsaW51eC9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvbnRyb2xmYi5jOjI3NjoyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24g4oCYYnRleHRfdXBkYXRlX2Rpc3BsYXnigJkKPiAgICAgMjc2IHwgIGJ0ZXh0X3VwZGF0ZV9k
aXNwbGF5KHAtPmZyYW1lX2J1ZmZlcl9waHlzICsgQ1RSTEZCX09GRiwKPiAgICAgICAgIHwgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+Cj4gCj4gRml4IGl0IGJ5IGluY2x1ZGluZyBidGV4dC5oIHdoZW5l
dmVyIENPTkZJR19CT09UWF9URVhUIGlzIGVuYWJsZWQuCj4gCj4gRml4ZXM6IGEwN2E2M2IwZTI0
ZCAoInZpZGVvOiBmYmRldjogY29udHJvbGZiOiBhZGQgQ09NUElMRV9URVNUIHN1cHBvcnQiKQo+
IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KCkFj
a2VkLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5j
b20+CgpUaGFua3MgZm9yIGZpeGluZyB0aGlzLgoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9mYmRl
di9jb250cm9sZmIuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+
IAo+IERvZXMgYW55b25lIG1pbmQgaWYgSSBhcHBseSB0aGlzIHZpYSB0aGUgcG93ZXJwYyB0cmVl
IGZvciB2NS45Pwo+IAo+IEl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IHRoZSBidWlsZCBjbGVhbi4K
Ck5vIG9iamVjdGlvbnMgZnJvbSBteSBzaWRlLgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVq
IFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVj
dHJvbmljcwoKPiBjaGVlcnMKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9j
b250cm9sZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMKPiBpbmRleCA5YzRm
MWJlODU2ZWMuLjU0N2FiZWIzOWY4NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvbnRyb2xmYi5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb250cm9sZmIuYwo+IEBA
IC00OSw2ICs0OSw4IEBACj4gICNpbmNsdWRlIDxsaW51eC9jdWRhLmg+Cj4gICNpZmRlZiBDT05G
SUdfUFBDX1BNQUMKPiAgI2luY2x1ZGUgPGFzbS9wcm9tLmg+Cj4gKyNlbmRpZgo+ICsjaWZkZWYg
Q09ORklHX0JPT1RYX1RFWFQKPiAgI2luY2x1ZGUgPGFzbS9idGV4dC5oPgo+ICAjZW5kaWYKPiAg
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
