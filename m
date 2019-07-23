Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0147071BBD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 17:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A5C6E2EB;
	Tue, 23 Jul 2019 15:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752206E2EB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:35:09 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190723153508euoutp01a411d2bd74a7c327fffd105de632ad42~0Ezlvni5B1173811738euoutp01b
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:35:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190723153508euoutp01a411d2bd74a7c327fffd105de632ad42~0Ezlvni5B1173811738euoutp01b
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190723153507eucas1p1d113b6a5d1fbfbe7740887de7f218a6f~0EzlEUweA1181411814eucas1p1E;
 Tue, 23 Jul 2019 15:35:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 64.84.04298.A29273D5; Tue, 23
 Jul 2019 16:35:06 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190723153506eucas1p2f9344c53f8b25fb9d89a1f0ee5dddae0~0EzkYliZO0645406454eucas1p20;
 Tue, 23 Jul 2019 15:35:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190723153506eusmtrp2994761be7e7e6d9a011678c88f89e277~0EzkKhiqr0483104831eusmtrp2Q;
 Tue, 23 Jul 2019 15:35:06 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-77-5d37292a17cc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A3.B1.04140.A29273D5; Tue, 23
 Jul 2019 16:35:06 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190723153505eusmtip1bfa1c18450b588d77194751d9bb262dd~0EzjowehC1210512105eusmtip1U;
 Tue, 23 Jul 2019 15:35:05 +0000 (GMT)
Subject: Re: [PATCH] fbmem: remove redundant assignment to err
To: Colin King <colin.king@canonical.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <72586381-9cf1-a401-b9bd-5705ebbaf937@samsung.com>
Date: Tue, 23 Jul 2019 17:35:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190624223724.13629-1-colin.king@canonical.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsWy7djPc7pamuaxBh+3W1v8Xt3LZrHw4V1m
 iytf37NZbL0lbXGi7wOrxeVdc9gc2DxmNfSyeez9toDF4373cSaPz5vkAliiuGxSUnMyy1KL
 9O0SuDKuLb/OVPCQuWLFb50GxnbmLkZODgkBE4ntz3eydjFycQgJrGCU+HiilRHC+cIo0f9m
 BRNIlZDAZ0aJR18EYTpmLDzLDlG0nFHi6fvbUB1vGSU2fDrGAlIlLGAn8ev4DCCbg0NEQFPi
 /LkikBpmgdWMEqs+TwOrYROwkpjYvooRxOYFqj/0ej47iM0ioCox8d85sLioQITE/WMbWCFq
 BCVOznwC1ssJVP/15GQwm1lAXOLWk/lMELa8xPa3c6B+W8QucfWpI4TtItHyaA4ThC0s8er4
 FnYIW0bi/06QXi4gex2jxN+OF8wQznZGieWT/7FBVFlLHD5+kRXkG2agb9bv0ocIO0oceQ4y
 iAPI5pO48VYQ4gY+iUnbpjNDhHklOtqEIKrVJDYs28AGs7Zr50rmCYxKs5B8NgvJN7OQfDML
 Ye8CRpZVjOKppcW56anFhnmp5XrFibnFpXnpesn5uZsYganm9L/jn3Ywfr2UdIhRgINRiYe3
 gsk8Vog1say4MvcQowQHs5IIb2CDWawQb0piZVVqUX58UWlOavEhRmkOFiVx3mqGB9FCAumJ
 JanZqakFqUUwWSYOTqkGxiVLbi/bdDXzfvvUQLcUcYMVLpUrE0Nn/N27tzJG4K72zE0tk9cV
 LuGr6C7PcLF49/WTbUVas+X1CJf2K/HnBS7nhzguPCN1/v5nqxcbjFTun7v35uDplSu1Kl+E
 ZSuarF/vH1KWah4j/OWGTdu53a4TC4s31h5bePuIULTUZM6vn112WmRwtSmxFGckGmoxFxUn
 AgBK1RwOMQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xu7pamuaxBq9OCFj8Xt3LZrHw4V1m
 iytf37NZbL0lbXGi7wOrxeVdc9gc2DxmNfSyeez9toDF4373cSaPz5vkAlii9GyK8ktLUhUy
 8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DKuLb/OVPCQuWLFb50G
 xnbmLkZODgkBE4kZC8+yg9hCAksZJU79zepi5ACKy0gcX18GUSIs8edaF1sXIxdQyWtGiXkf
 vzOCJIQF7CR+HZ/BAlIvIqApcf5cEUgNs8BqRolP8/ewQDRMZJR4NWUVK0gDm4CVxMT2VWDN
 vEDNh17PB1vMIqAqMfHfObC4qECExJn3K1ggagQlTs58AmZzAtV/PTkZzGYWUJf4M+8SM4Qt
 LnHryXwmCFteYvvbOcwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dL
 zs/dxAiMrW3Hfm7Zwdj1LvgQowAHoxIPbwWTeawQa2JZcWXuIUYJDmYlEd7ABrNYId6UxMqq
 1KL8+KLSnNTiQ4ymQM9NZJYSTc4Hxn1eSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU
 1ILUIpg+Jg5OqQbGpr6Vsz5PrBCVnTzRrypBVF97YtViZuZqzbhDDZG17oGvfl5RXsQs/fzA
 4qPqEq+VBNQ3XK6QyVF+tPWsyMH95noJt07JmeTUWcZp+5z03md9pGVbbOLKe7fvnF3gkSe2
 q9nAquDpPSaewKutnd4tZlWGU/a921l3cFXhrmMzlpyaNtNEzC5WiaU4I9FQi7moOBEALFwa
 O8MCAAA=
X-CMS-MailID: 20190723153506eucas1p2f9344c53f8b25fb9d89a1f0ee5dddae0
X-Msg-Generator: CA
X-RootMTR: 20190624223730epcas2p4d2b1ad1200c11a472ba327ee39ede08b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190624223730epcas2p4d2b1ad1200c11a472ba327ee39ede08b
References: <CGME20190624223730epcas2p4d2b1ad1200c11a472ba327ee39ede08b@epcas2p4.samsung.com>
 <20190624223724.13629-1-colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563896108;
 bh=3524MG5ykI7x6NMGcwx0EKgHUZ9KtyeSNKu7ggZci18=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=g21nJ5dPzOpMuc3DMpwdNuHOSFeWhYHFmFbDgbvVZODf1/pXFXK/GfufzUVJvC78/
 FbB8QcDPHC/D5nw+yopTMRHL6mHYZ4i/L7nssvWb7B/cRfsuoj/Q24LEjLJDsGSu8W
 TmFcKmZsDT2CkWBGMfnLfvfkM3nHj8QJ0aSSn2hM=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjUvMTkgMTI6MzcgQU0sIENvbGluIEtpbmcgd3JvdGU6Cj4gRnJvbTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBWYXJpYWJsZSBlcnIgaXMgaW5p
dGlhbGl6ZWQgdG8gYSB2YWx1ZSB0aGF0IGlzIG5ldmVyIHJlYWQgYW5kIGl0Cj4gaXMgcmUtYXNz
aWduZWQgbGF0ZXIuICBUaGUgaW5pdGlhbGl6YXRpb24gaXMgcmVkdW5kYW50IGFuZCBjYW4KPiBi
ZSByZW1vdmVkLgo+IAo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQo+IFNp
Z25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpQ
YXRjaCBxdWV1ZWQgZm9yIHY1LjQsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWll
aiBab2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxl
Y3Ryb25pY3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
