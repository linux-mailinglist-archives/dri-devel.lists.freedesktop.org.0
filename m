Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D35B701BD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 15:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6612189C13;
	Mon, 22 Jul 2019 13:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3917B89C13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:53:05 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190722135303euoutp02336b7dbccbd706bb4352d5183cbda8f4~zvxLfjFhM0540505405euoutp02i
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:53:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190722135303euoutp02336b7dbccbd706bb4352d5183cbda8f4~zvxLfjFhM0540505405euoutp02i
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190722135302eucas1p139956bc07fe600afda0a47e37a1c3284~zvxKx6Xc_1319113191eucas1p1c;
 Mon, 22 Jul 2019 13:53:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C7.63.04325.EBFB53D5; Mon, 22
 Jul 2019 14:53:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190722135301eucas1p2190b3f28552030bbf267dc9963059ddc~zvxJ4X6Cy1061410614eucas1p2h;
 Mon, 22 Jul 2019 13:53:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190722135301eusmtrp17b1d49a54131d28f1ebda2550054bf25~zvxJp-FDe2902729027eusmtrp1Q;
 Mon, 22 Jul 2019 13:53:01 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-5b-5d35bfbe93e2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 40.5C.04140.DBFB53D5; Mon, 22
 Jul 2019 14:53:01 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190722135301eusmtip2c6e087dac5a78ef9e173e306f366c339~zvxJVpDHE3197731977eusmtip23;
 Mon, 22 Jul 2019 13:53:01 +0000 (GMT)
Subject: Re: [PATCH] fbdev: Ditch fb_edid_add_monspecs
To: Linus Torvalds <torvalds@linux-foundation.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <8d925bb9-0769-bc1a-20df-a7fa33e84bae@samsung.com>
Date: Mon, 22 Jul 2019 15:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wiaHB_0bS_x=p-xeyp7bW7bGgkZ9QkXe6SS9axu7OP95w@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRmVeSWpSXmKPExsWy7djP87r79pvGGiyeJGax8OFdZovlZ9Yx
 W1z5+p7N4kTfB1aLy7vmsFksa57PaPGo7y27A7vH3m8LWDx2zrrL7rF4z0smjxMzfrN43O8+
 zuTxeZNcAFsUl01Kak5mWWqRvl0CV0b3lkVMBXeYKl7um8vewDiZqYuRk0NCwETi6PM37F2M
 XBxCAisYJc7MeMEG4XxhlOiY9RHK+cwose9pMzNMy+WPJ9lBbCGB5YwS8x5VQhS9ZZTYe+Q8
 WJGwgJnEjMs3WUFsEYEYiWW7VzCCFDELHGOUmHymlwUkwSZgJTGxfRUjiM0rYCfR39gJ1MzB
 wSKgKvHptg1IWFQgQuL+sQ2sECWCEidnPgFr5RQIlHgzaSkbiM0sIC5x68l8JghbXmL72znM
 ILskBPaxS7zf9YcdZKaEgIvE1D9WEA8IS7w6voUdwpaROD25hwWifh2jxN+OF1DN2xkllk/+
 xwZRZS1x+PhFVpBBzAKaEut36UOEHSUWzr7DBDGfT+LGW0GIG/gkJm2bzgwR5pXoaBOCqFaT
 2LBsAxvM2q6dK5knMCrNQvLZLCTfzELyzSyEvQsYWVYxiqeWFuempxYb56WW6xUn5haX5qXr
 JefnbmIEJqPT/45/3cG470/SIUYBDkYlHt4Ne0xjhVgTy4orcw8xSnAwK4nw5hkAhXhTEiur
 Uovy44tKc1KLDzFKc7AoifNWMzyIFhJITyxJzU5NLUgtgskycXBKNTDWnpwf/OjdigZV1gUS
 kubzcuUEGURCmm+sel9h4SLduSAq6qbmtn47nbs6i2Qyt8pyGBVqvn4yvZI9+8PRd/ckt793
 ypO0uy5j9bD1qDVfz8PuqjnTWm5PDlI8oOT9/kO6oPa5NWLq1Yn+taf//c187mhguXaKwWd3
 lgcrFvKy9/fmVTWknFJiKc5INNRiLipOBADarBCQQgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7p795vGGjSslbRY+PAus8XyM+uY
 La58fc9mcaLvA6vF5V1z2CyWNc9ntHjU95bdgd1j77cFLB47Z91l91i85yWTx4kZv1k87ncf
 Z/L4vEkugC1Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI
 3y5BL6N7yyKmgjtMFS/3zWVvYJzM1MXIySEhYCJx+eNJ9i5GLg4hgaWMEsvWLAdKcAAlZCSO
 ry+DqBGW+HOtiw2i5jWjxKMf25hBEsICZhIzLt9kBbFFBGIk7l79DDaIWeAYo0R/2xeojiuM
 Eptmz2cBqWITsJKY2L6KEcTmFbCT6G/sZAbZxiKgKvHptg1IWFQgQuLM+xUsECWCEidnPgGz
 OQUCJd5MWsoGYjMLqEv8mXeJGcIWl7j1ZD4ThC0vsf3tHOYJjEKzkLTPQtIyC0nLLCQtCxhZ
 VjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgTG37ZjP7fsYOx6F3yIUYCDUYmHd8Me01gh1sSy
 4srcQ4wSHMxKIrx5BkAh3pTEyqrUovz4otKc1OJDjKZAv01klhJNzgemhrySeENTQ3MLS0Nz
 Y3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYzNvMGp0tKrsyeYTOvr3ywmcdVsqbxk
 nVkLqwWX9s6jZhMnPV4puebN2XMnF0nePSvHabChb/LEw96H3JmMN1k5Gh5Uid0pef/SX+Hn
 pef+6D0XW28j1hO996OE3y8J5d/zJS8f6JaoaX0TaKvBtNd+Cf+bz3efM21Y8WC+WqnN/pLd
 Gnv7G0KUWIozEg21mIuKEwHCwBB01QIAAA==
X-CMS-MailID: 20190722135301eucas1p2190b3f28552030bbf267dc9963059ddc
X-Msg-Generator: CA
X-RootMTR: 20190721203902epcas2p22e8ac33f84bcfb1a414c02d6c8770d91
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190721203902epcas2p22e8ac33f84bcfb1a414c02d6c8770d91
References: <20190721201956.941-1-daniel.vetter@ffwll.ch>
 <CGME20190721203902epcas2p22e8ac33f84bcfb1a414c02d6c8770d91@epcas2p2.samsung.com>
 <CAHk-=wiaHB_0bS_x=p-xeyp7bW7bGgkZ9QkXe6SS9axu7OP95w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563803583;
 bh=+3Tk5iOm0W8JTrOZ9SZseZOnDzDIJpQ/TXOX8kSrdoM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=hocfqtSLdVtdb2QdoYbroYl+heWxAt5OEryMZfJyLAO+IHgstdynpaO858P4Fzea5
 4J9CmLADZIXX0GTNrw/ec8w88l8Nw6AkRHH56NSzb+qYbhLPFats296yq/u/M+Y5m9
 PagsTEjuHWcr/wHJlYA60XxDcqGqHJGriIcmmX1g=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, linux-fbdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tavis Ormandy <taviso@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjEvMTkgMTA6MzggUE0sIExpbnVzIFRvcnZhbGRzIHdyb3RlOgo+IE9uIFN1biwgSnVs
IDIxLCAyMDE5IGF0IDE6MjAgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4gd3JvdGU6Cj4+Cj4+IEl0J3MgZGVhZCBjb2RlIGV2ZXIgc2luY2UKPiAKPiBMb3ZlbHkuIEFj
ay4KCkdvb2QgY2F0Y2ggaW5kZWVkLgoKVGhhbmtzIERhbmllbCwgSSdsbCBxdWV1ZSBpdCBmb3Ig
djUuNCBsYXRlci4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpT
YW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
