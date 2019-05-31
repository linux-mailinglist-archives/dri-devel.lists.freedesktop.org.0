Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1A830EF6
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 15:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C0489452;
	Fri, 31 May 2019 13:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B0489453
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 13:38:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190531133824euoutp021bb9f76635e43c4d493cdd6e379b198a~jyBib7De90407904079euoutp02T
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 13:38:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190531133824euoutp021bb9f76635e43c4d493cdd6e379b198a~jyBib7De90407904079euoutp02T
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190531133822eucas1p2d9e92a10af7a496eb7b6d1ae88428f19~jyBg63Pm-1124311243eucas1p29;
 Fri, 31 May 2019 13:38:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 78.5C.04377.D4E21FC5; Fri, 31
 May 2019 14:38:22 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190531133821eucas1p2234fb790f9e54a5809e39571a28b2f0e~jyBf_i25Z0708907089eucas1p2G;
 Fri, 31 May 2019 13:38:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190531133821eusmtrp11fe1c17ba6c017189a3e7100543b5cb2~jyBfu7pgA1220512205eusmtrp1t;
 Fri, 31 May 2019 13:38:21 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-01-5cf12e4d40d0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 96.B6.04140.D4E21FC5; Fri, 31
 May 2019 14:38:21 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190531133820eusmtip2c175cb37b8e9d0a9f868162557e5c576~jyBfBbog80531305313eusmtip2p;
 Fri, 31 May 2019 13:38:20 +0000 (GMT)
Subject: Re: [PATCHv4 23/24] drm/bridge: tc358767: add IRQ and HPD support
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>, Andrey Gusakov
 <andrey.gusakov@cogentembedded.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Ujfalusi
 <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <cf012f78-503d-71db-4317-7b1505602b11@samsung.com>
Date: Fri, 31 May 2019 15:38:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528082747.3631-24-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRmVeSWpSXmKPExsWy7djP87p+eh9jDL52MFk0d9haNB1qYLX4
 1t/KYnHl63s2i+7ODlaLB3NvMll0TlzCbnH33gkWi1kff7BarJ9/i82By+PB1P9MHjtn3WX3
 mN0xk9XjfvdxJo/+vwYex29sZwpgi+KySUnNySxLLdK3S+DK2LvqAHtBA1PFi94/zA2Mlxi7
 GDk5JARMJM6d+MoOYgsJrGCUuPFYoYuRC8j+wiixdkojM4TzmVGipWMBXMfssyugEssZJeZP
 bmeCcN4ySuyY9oMZpEpYwEti6vKJ7CAJEYF5zBL/m5cwgSTYBDQl/m6+yQZi8wrYSZy7tRgs
 ziKgKvHp8n0WEFtUIELi/rENrBA1ghInZz4Bi3MKWEsc3LQDbAGzgLxE89bZULa4xK0n85kg
 zjvELjHjdTSE7SLxc9JlqLiwxKvjW9ghbBmJ05N7WCDseon7K1rA3pEQ6GCU2LphJzNEwlri
 8PGLQEdwAC3QlFi/Sx8i7Cjx6f9RFpCwhACfxI23ghAn8ElM2jadGSLMK9HRJgRRrShx/+xW
 qIHiEksvfGWDsD0kDv/9yTyBUXEWkidnIXlsFpLHZiHcsICRZRWjeGppcW56arFRXmq5XnFi
 bnFpXrpecn7uJkZgojr97/iXHYy7/iQdYhTgYFTi4Z0g9DFGiDWxrLgy9xCjBAezkgjv3xcf
 YoR4UxIrq1KL8uOLSnNSiw8xSnOwKInzVjM8iBYSSE8sSc1OTS1ILYLJMnFwSjUwaj9NaSop
 n2nS7DJN5/K97k9iwXK3HmX23HTuLupdPHP+kmk+qr/zhJye+88yYLhxbJ7SE5uX86Vc//wQ
 bzp/m01u15vpWzgqVn98obbQ2n/2T88pl05cyKju6eJpsCzcypT8pk5uxnamiSuWh06d8CPk
 y8a2F4fkP+fXzNkdJ7e5cPu22t1ScUosxRmJhlrMRcWJAOKtWxhQAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xe7q+eh9jDBZ1slk0d9haNB1qYLX4
 1t/KYnHl63s2i+7ODlaLB3NvMll0TlzCbnH33gkWi1kff7BarJ9/i82By+PB1P9MHjtn3WX3
 mN0xk9XjfvdxJo/+vwYex29sZwpgi9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1
 MjJV0rezSUnNySxLLdK3S9DL2LvqAHtBA1PFi94/zA2Mlxi7GDk5JARMJGafXcHcxcjFISSw
 lFGi5fVNqIS4xO75b5khbGGJP9e62EBsIYHXjBIzW3lBbGEBL4mpyyeygzSLCCxglrjT8pYd
 YtI+RomHpz+xg1SxCWhK/N18E6ybV8BO4tytxUwgNouAqsSny/dZQGxRgQiJM+9XsEDUCEqc
 nPkEzOYUsJY4uGkH2BXMAuoSf+ZdgrLlJZq3zoayxSVuPZnPNIFRcBaS9llIWmYhaZmFpGUB
 I8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwCjcduznlh2MXe+CDzEKcDAq8fBOEPoYI8Sa
 WFZcmXuIUYKDWUmE9++LDzFCvCmJlVWpRfnxRaU5qcWHGE2BnpvILCWanA9MEHkl8YamhuYW
 lobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhiZptT96WP5tOxJnkPUpTPPP3Q/
 MWA+/URW9NWVTTsv3pF/dP4aZ2f+y/aDW1bcmiRf3elT8sld96u9WayIz5wHl65OPWMbk7RM
 4sSLJM+z5UtUXnRpXI+NMfA6v/J7l11DSLpg9Z/tj17NP1aupOj03N/ttf6XxstlXToLqxZZ
 rdO/xJ1xpvWPEktxRqKhFnNRcSIAbXMWFdgCAAA=
X-CMS-MailID: 20190531133821eucas1p2234fb790f9e54a5809e39571a28b2f0e
X-Msg-Generator: CA
X-RootMTR: 20190528082913epcas3p338135664a4786d55fcf987571010a9b5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190528082913epcas3p338135664a4786d55fcf987571010a9b5
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
 <CGME20190528082913epcas3p338135664a4786d55fcf987571010a9b5@epcas3p3.samsung.com>
 <20190528082747.3631-24-tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559309904;
 bh=6oJWFU3OQOAYT+YRriJiQRZHDEofXWkpb2hwqPF0C7Y=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=mdKowyeoicRC/bvUvvxWUx78dy5kkkDJyRb6+25wBxoxPSKcZqElhjsY+9i5x+n3T
 l/C8k4X7jVMufIdHsvAU4HOeQFGhIXbWji82ByI+id3TwP26LpL1kciIJM3QrrpE+9
 XnrTEfZGYfNs2rpZczpEGFsROAqpCyQxLUNuEd1k=
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

T24gMjguMDUuMjAxOSAxMDoyNywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gQWRkIHN1cHBvcnQg
Zm9yIGludGVycnVwdCBhbmQgaG90cGx1ZyBoYW5kbGluZy4gQm90aCBhcmUgb3B0aW9uYWwuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgoK
UmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJl
Z2FyZHMKQW5kcnplagoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
