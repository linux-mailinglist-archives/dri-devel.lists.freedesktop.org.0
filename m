Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6890C925B7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93D06E131;
	Mon, 19 Aug 2019 14:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964AD6E130
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:02:01 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190819140200euoutp024b9fc61b77a108bb169e698236c33875~8V8_8uwe33176531765euoutp02k
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:02:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190819140200euoutp024b9fc61b77a108bb169e698236c33875~8V8_8uwe33176531765euoutp02k
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190819140159eucas1p2a87c8aec2f1b259b566df03c731f1068~8V8_fy3bf1282112821eucas1p22;
 Mon, 19 Aug 2019 14:01:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F8.A8.04309.7DBAA5D5; Mon, 19
 Aug 2019 15:01:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190819140158eucas1p2b53a7522deb0ca862620d09b578382b7~8V89yL2vz1102711027eucas1p2T;
 Mon, 19 Aug 2019 14:01:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190819140158eusmtrp248c9633966b0ae70d78f46b184f99763~8V89jXzJG2996429964eusmtrp22;
 Mon, 19 Aug 2019 14:01:58 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-56-5d5aabd7aa79
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4A.C4.04117.6DBAA5D5; Mon, 19
 Aug 2019 15:01:58 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190819140158eusmtip14bded87719194c0ae55f019129f491fc~8V89TIDKH0431304313eusmtip1x;
 Mon, 19 Aug 2019 14:01:58 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: pvr2fb: remove unnecessary comparison of
 unsigned integer with < 0
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <7c233700-a6b2-54fd-e86d-a11583bb3ec3@samsung.com>
Date: Mon, 19 Aug 2019 16:01:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190722203358.GA29111@embeddedor>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzned3rq6NiDb5NELO48vU9m8XWPaoW
 J/o+sFpc3jWHzYHFY91BVY/73ceZPD5vkgtgjuKySUnNySxLLdK3S+DKeDTxOFvBJJaKV3d0
 Gxg3MncxcnJICJhI7L/3iK2LkYtDSGAFo8S8WxOZQBJCAl8YJfp+BkLYnxklNs0V7GLkAGv4
 /KgCon45o0TT/SOMEM5bRom7xx6xgjQIC6RLnO7aDzZIRMBIYvaMbrA4s0CCxOlF91hAbDYB
 K4mJ7asYQWxeATuJOX/3sYEsYBFQldgx0w8kLCoQIXH/2AZWiBJBiZMzn4C1cgoYSBzcdIgF
 YqS4xK0n85kgbHmJ7W/nMIPcIyHQzS5xfP8DVogvXSSW3fzJDmELS7w6vgXKlpH4vxOkGaRh
 HaPE344XUN3bGSWWT/7HBlFlLXH4+EVWkOuYBTQl1u/Shwg7SnQ9fcsECRU+iRtvBSGO4JOY
 tG06M0SYV6KjTQiiWk1iw7INbDBru3auZJ7AqDQLyWuzkLwzC8k7sxD2LmBkWcUonlpanJue
 WmyUl1quV5yYW1yal66XnJ+7iRGYRk7/O/5lB+OuP0mHGAU4GJV4eD2mRcUKsSaWFVfmHmKU
 4GBWEuGtmAMU4k1JrKxKLcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnV
 wOj/ZuuzY/td5h1elfChY2vwSsZTJcVVi4zlSu7MKSt8G3Vl/zUlg5aCa6snxrFkfpoufllj
 kfm/D4Hb3dSXfN0ptcswrzJjlqg9787SCyeFjlQ/XCHaw3xBcY2hY/yd83+vMmQqr64/UrG5
 /Pxpld6PgpMZtpj/UwhZmsB86WLOoWctpaJv/dWUWIozEg21mIuKEwGaKUnMHwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xu7rXVkfFGkx8omJx5et7Noute1Qt
 TvR9YLW4vGsOmwOLx7qDqh73u48zeXzeJBfAHKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2Ri
 qWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX8WjicbaCSSwVr+7oNjBuZO5i5OCQEDCR+PyooouR
 i0NIYCmjxN87qxkh4jISx9eXdTFyApnCEn+udbFB1LxmlLiyZgUzSEJYIF3idNd+JhBbRMBI
 YvaMblaQXmaBBIln81Ig6psZJV7ubgSrZxOwkpjYvooRxOYVsJOY83cfG0g9i4CqxI6ZfiBh
 UYEIiTPvV7BAlAhKnJz5BMzmFDCQOLjpEJjNLKAu8WfeJWYIW1zi1pP5TBC2vMT2t3OYJzAK
 zULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRGDfbjv3csoOx613w
 IUYBDkYlHl6PaVGxQqyJZcWVuYcYJTiYlUR4K+YAhXhTEiurUovy44tKc1KLDzGaAv02kVlK
 NDkfGNN5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYZ2xt1lay
 8m1/HMs3bd9pP/e18cxvFsgfmHNcesLSqG1n70imMunsybjZtkJ5SoD6HZG3y/WrSup+zGGf
 8e5489/9XOaKq9d+2Lwj6xBLiP2lhRFrDwn9dvinlLtj8jT5yyttfn5v2O+++uOOi5cZS92n
 KnX6O4V3Fe1wCz61JvvKO4vHmgxv7iuxFGckGmoxFxUnAgDRJrnDsQIAAA==
X-CMS-MailID: 20190819140158eucas1p2b53a7522deb0ca862620d09b578382b7
X-Msg-Generator: CA
X-RootMTR: 20190722203403epcas2p32d13bdd6f29bed37696385baca909abf
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190722203403epcas2p32d13bdd6f29bed37696385baca909abf
References: <CGME20190722203403epcas2p32d13bdd6f29bed37696385baca909abf@epcas2p3.samsung.com>
 <20190722203358.GA29111@embeddedor>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566223320;
 bh=/AOyRB5HeQ/lP4tN2GXWPCVhr7bSMVhaHv/qCtEHGp0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=p3VK2GjloMj8jxxIoTv07gi0yEZNcJIlduSzTxgDMcxP9Ea+vWvOVx3oGL244Yfwn
 EWiahLcFYiBP81C/Ctm/QisD293pJcW4klb+TqTR/uBALuzeCTIz4Ts/ag504Q+tOU
 AFgLXn69oQHSY3qqN3nWGAViRwxkM2LYEzqEGjP8=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjIvMTkgMTA6MzMgUE0sIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4gVGhlcmUg
aXMgbm8gbmVlZCB0byBjb21wYXJlICp2YXItPnhvZmZzZXQqIG9yICp2YXItPnlvZmZzZXQqIHdp
dGggPCAwCj4gYmVjYXVzZSBzdWNoIHZhcmlhYmxlcyBhcmUgb2YgdHlwZSB1bnNpZ25lZCwgbWFr
aW5nIGl0IGltcG9zc2libGUgdG8KPiBob2xkIGEgbmVnYXRpdmUgdmFsdWUuCj4gCj4gRml4IHRo
aXMgYnkgcmVtb3Zpbmcgc3VjaCBjb21wYXJpc29ucy4KPiAKPiBBZGRyZXNzZXMtQ292ZXJpdHkt
SUQ6IDE0NTE5NjQgKCJVbnNpZ25lZCBjb21wYXJlZCBhZ2FpbnN0IDAiKQo+IFNpZ25lZC1vZmYt
Ynk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+ClBhdGNoIHF1
ZXVlZCBmb3IgdjUuNCwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5p
ZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmlj
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
