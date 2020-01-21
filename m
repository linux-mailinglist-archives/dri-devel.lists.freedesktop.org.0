Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC421438F7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 10:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CBF6EC04;
	Tue, 21 Jan 2020 09:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1EF6EC04
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 09:04:53 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200121090452euoutp0275c9a9260da8b42acb755cf0e86bd7a9~r24zfvQjL0280602806euoutp02Q
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 09:04:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200121090452euoutp0275c9a9260da8b42acb755cf0e86bd7a9~r24zfvQjL0280602806euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579597492;
 bh=ceIWUcRTC3WbPS2ZAn6jS028UDFnxpbxzFO6J2f0dt0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=vNK7Q4Z+t44twjN2sg21tAfoeUbQWb+NLBFoOAd04sJM733qg6OiwGQOF8e26UrZV
 peSwCqibPeMhC68qjKdelPQNZKBYBJAPCiAlhm6+3lhua8LKuf7C333/4TG3o5TdwP
 Wv9JGfEeviSiAGiy8+Q3MhLnpbkHuEQOHfl7yNm0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200121090451eucas1p145b6d099fbc7ebb9a0bb1e883d5ea16c~r24zFx7Kt1929019290eucas1p1_;
 Tue, 21 Jan 2020 09:04:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 09.04.60698.3BEB62E5; Tue, 21
 Jan 2020 09:04:51 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200121090451eucas1p1969908f90e0b96d36ffebeeb66130550~r24yq8Mso2047920479eucas1p1o;
 Tue, 21 Jan 2020 09:04:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200121090451eusmtrp1ea79911e616a2f1d6fb2516120c48915~r24yqEVW_2107521075eusmtrp1W;
 Tue, 21 Jan 2020 09:04:51 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-2f-5e26beb31b2a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F9.25.07950.3BEB62E5; Tue, 21
 Jan 2020 09:04:51 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200121090450eusmtip208148c50eefbb7f28d109cee6aa95206~r24x0cGzj1135211352eusmtip2E;
 Tue, 21 Jan 2020 09:04:50 +0000 (GMT)
Subject: Re: [PATCH v4 2/3] drm: bridge: adv7511: Add support for ADV7535
To: Bogdan Togorean <bogdan.togorean@analog.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <7079d373-0a76-7071-50de-13ed828a4d97@samsung.com>
Date: Tue, 21 Jan 2020 10:04:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200121082719.27972-3-bogdan.togorean@analog.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUhTURzlvvv29jSXr2XuRx9Eg4KCrNDgRhIGUU8i6Jso+lj5UHFq7LXK
 IFzZyixHtdLSMsuFQxS/muUsSynNVivNTQvDUKm01CSnLbJye0b+d875nd/HuVwWK7OYmWx8
 0iFBl6TRqplAuqrB+2pxZe2CPUvPW1aQTGcTRbI6amTkpPEyJn+qLmLS6hlkSFpBKUNco72Y
 NH110eTsRYucvLFfZ8idtmaK2DvzKVJv2kXc3m5MjA+fyInVa0OksuIKJibnuiglb2wZY/g+
 12q+OK8Y8YPtRjmfa2im+Ycj+TSfm35NxlcUnWX4ZxdaKH7A6ZTz90Y+yPhHN4rlfOe5Roq3
 ZLkY/uOtUpp/nGmmNyp3BkbGCNr4w4Juyap9gXEZD1IOllNH7e96sQH9RBkogAUuAqxuM5WB
 AlklZ0Xg9tZNkGEEBe/PTJDvCEZG08cJ628500BLeiECx/Oncon0I/AayuW+udO5aLC4yxkf
 DuG2gGfI7O/AnAnDcMkJ7Csw3EIYq3zrNym4VfDbVCbzYZqbDw5nF+XDM7gd0NPaLZM806Dp
 Wg/twwFcFIx9fuEPgbm5kGbLxRJWwbuem/6zgXvNQo2jgZaSroGXb34wEp4OfY135RKeDQ7z
 +QlPKnRaT2GpOR2BrawaS4WV0OH8yfjy4/GrS+1LJHk11JVVyKRnmQrt/dOkG6bCpapsLMkK
 SD+tlNzzoPOlbWKgCu689jAXkDpnUrKcSWlyJqXJ+b83H9FFSCXoxcRYQQxPEo6EiZpEUZ8U
 G3YgObECjf9Wx+9Gz31U+2t/PeJYpA5SRGXN36OUaQ6LKYn1CFisDlHknxyXFDGalGOCLnmv
 Tq8VxHo0i6XVKkX47d7dSi5Wc0hIEISDgu5flWIDZhrQzm1TCvKuJkeGjdbmPf0odi9ANv2O
 byUDlxOCWuM9VERjnzF06YbukfXZVTXJm9Z+Lr7iae0aiiuMtdhCQ+ra3Is6ml1zow/oNwex
 wWbz9YTwoC+berWFaTr7cHYcNpi0j4dSrc+On1Md+R6a19Xv2PopZXtwxvLCP3O+fqq+bQ1W
 02KcZtkirBM1fwHJcjYqqQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsVy+t/xe7qb96nFGXz6JmvRe+4kk8W0O7tZ
 LZpapzBb/N82kdniytf3bBbNi9ezWVz9/pLZ4uSbqywWnROXsFtc3jWHzWLp9YtMFrvuL2Cy
 ONQXbXHt52Nmi9a9R9gtVvzcymixedNUZou+c+4OQh6tl/6yeby66uixZt4aRo/3N1rZPWY3
 XGTx2PttAYvH7I6ZrB6bVnWyeZyYcInJ4925c+we2789YPXYP3cNu8f97uNMHkumXWXzeLZw
 PYvHgd7JLAFCUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWp
 Rfp2CXoZXXsqCzYyVey69ZK5gfEXYxcjB4eEgIlE+zGWLkYuDiGBpYwSd9b/ZO5i5ASKi0vs
 nv8WyhaW+HOtiw2i6DWjxP+FB9lBEsICnhJLrm1kA7FFBIIlPv69ARZnFuhjljj7SxWi4SSj
 xLO+/UwgCTYBTYm/m2+CNfAK2En869vACmKzCKhKnD73CKxGVCBC4u3vm6wQNYISJ2c+YQGx
 OQUcJP6+OMMIsUBd4s+8S8wQtrxE89bZULa4xK0n85kmMArNQtI+C0nLLCQts5C0LGBkWcUo
 klpanJueW2ykV5yYW1yal66XnJ+7iRGYSrYd+7llB2PXu+BDjAIcjEo8vA7TVOOEWBPLiitz
 DzFKcDArifAuaAIK8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4wzeWVxBuaGppbWBqaG5sb
 m1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamBUK/oQMUVox+QTIkWOnMm3vYI8f/n/2faW
 ravMdf6VjeYv/my9tsNs2eGdTD9kXp4/FxnesMVxT5va051y7Vqz35ytTty4YJFd30KD0Puv
 vdnW2UubutsxPirkXvNSVvqUwoseAW3OB5t7Pr09vn7D0zNun8QFm5tVH3Su8439fWCy5ca7
 2ra1SizFGYmGWsxFxYkAdjyGjDsDAAA=
X-CMS-MailID: 20200121090451eucas1p1969908f90e0b96d36ffebeeb66130550
X-Msg-Generator: CA
X-RootMTR: 20200121084119eucas1p10ef66cb65ac2a11b1f9da6eba49ee168
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200121084119eucas1p10ef66cb65ac2a11b1f9da6eba49ee168
References: <20200121082719.27972-1-bogdan.togorean@analog.com>
 <CGME20200121084119eucas1p10ef66cb65ac2a11b1f9da6eba49ee168@eucas1p1.samsung.com>
 <20200121082719.27972-3-bogdan.togorean@analog.com>
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
Cc: mark.rutland@arm.com, robdclark@chromium.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, alexander.deucher@amd.com,
 tglx@linutronix.de, sam@ravnborg.org, matt.redfearn@thinci.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEuMDEuMjAyMCAwOToyNywgQm9nZGFuIFRvZ29yZWFuIHdyb3RlOgo+IEFEVjc1MzUgaXMg
YSBEU0kgdG8gSERNSSBicmlkZ2UgY2hpcCBsaWtlIEFEVjc1MzMgYnV0IGl0IGFsbG93cwo+IDEw
ODBwQDYwSHouIHYxcDIgaXMgZml4ZWQgdG8gMS44ViBvbiBBRFY3NTM1Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQm9nZGFuIFRvZ29yZWFuIDxib2dkYW4udG9nb3JlYW5AYW5hbG9nLmNvbT4KUmV2aWV3
ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMK
QW5kcnplagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
