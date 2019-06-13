Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C37714365C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB188899D5;
	Thu, 13 Jun 2019 13:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8387899D5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:19:03 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190613131901euoutp01f86f32a820ef819463414ff4f9f89d0f~nxJVqykQy3098130981euoutp01v
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:19:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190613131901euoutp01f86f32a820ef819463414ff4f9f89d0f~nxJVqykQy3098130981euoutp01v
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190613131900eucas1p16713c43dc85baed1bce0e9512cf9b67e~nxJUzF9zC2155421554eucas1p1T;
 Thu, 13 Jun 2019 13:19:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 1A.27.04298.44D420D5; Thu, 13
 Jun 2019 14:19:00 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190613131900eucas1p1680f5d11a036a408987b7df0b62d2ba5~nxJT401jb1951519515eucas1p1J;
 Thu, 13 Jun 2019 13:19:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190613131859eusmtrp2bd7700830c54379283c748eed9ea700a~nxJTpPtd22663726637eusmtrp2Y;
 Thu, 13 Jun 2019 13:18:59 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-f9-5d024d44b2f4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 9C.C4.04146.34D420D5; Thu, 13
 Jun 2019 14:18:59 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190613131859eusmtip18a229c94875acdda304a9d608b5aa247~nxJTTRQaB0624706247eusmtip1F;
 Thu, 13 Jun 2019 13:18:59 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: analogix_dp: Convert to GPIO descriptors
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <b8e5ef16-bc5c-9d1d-aacc-eae7e4a632e6@samsung.com>
Date: Thu, 13 Jun 2019 15:18:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190609231339.22136-1-linus.walleij@linaro.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djPc7ouvkyxBsd2qVmcXXaQzeLK1/ds
 FmtuH2K06Jy4hN1iyp/lTBZrj9xlt7i74SyjA7vH7IaLLB477i5h9JjdMZPV4861PWwe97uP
 M3n0bVnFGMAWxWWTkpqTWZZapG+XwJVxtOE5W8Fklooft6exNDDuZO5i5OSQEDCRuLSgjb2L
 kYtDSGAFo8TVO/uhnC+MEis3TWaDcD4zSvSuXsMK0/JjaQMLiC0ksJxRYllzKUTRW0aJLycv
 soEkhAU8JW6tWQjWICKQIvF9xU8WkCJmgVuMElOvrwRLsAloSvzdfBOsgVfATuLU253sIDaL
 gKrEwaX/wWxRgQiJLzs3MULUCEqcnPkEbDMnUP36/itgvcwC8hLNW2czQ9jiEreezGcCWSYh
 sI1dYs+d/0DNHECOi8TZpykQHwhLvDq+hR3ClpH4vxOkHsSul7i/ooUZoreDUWLrBlgoWUsc
 Pn6RFWQOM9DR63fpQ4QdJR7MOMoOMZ5P4sZbQYgT+CQmbZvODBHmlehoE4KoVpS4f3Yr1EBx
 iaUXvrJNYFSaheSxWUiemYXkmVkIexcwsqxiFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQI
 TEen/x3/tIPx66WkQ4wCHIxKPLwHrJhihVgTy4orcw8xSnAwK4nw/mAACvGmJFZWpRblxxeV
 5qQWH2KU5mBREuetZngQLSSQnliSmp2aWpBaBJNl4uCUamDcP+nTgd4Twn/b5OWrn9fYfyhy
 bBQoYmLfwCS579MPF8787PnzNpRcSQ5XOXL+HeetJn6zJLmdJ1uWnzU43ef/nNkvNi9oYsGM
 Bwt+J/lwZiW/6k4v+259Ric0gkvxsNlG76qUf07G7hwLAmq/P/50hGXv6qqPPgbn7qZEuJ2/
 +/my7v6EgEYlluKMREMt5qLiRACKhdqfQwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xu7rOvkyxBv92a1ucXXaQzeLK1/ds
 FmtuH2K06Jy4hN1iyp/lTBZrj9xlt7i74SyjA7vH7IaLLB477i5h9JjdMZPV4861PWwe97uP
 M3n0bVnFGMAWpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZa
 pG+XoJdxtOE5W8Fklooft6exNDDuZO5i5OSQEDCR+LG0gaWLkYtDSGApo8SrV3OZIBLiErvn
 v4UqEpb4c62LDaLoNaPE3JUbWUESwgKeErfWLASzRQRSJLpntzKBFDEL3GKUeLz0DTtEx0RG
 iZ1fFrGBVLEJaEr83XwTzOYVsJM49XYnO4jNIqAqcXDpfzBbVCBCYvYukJtAagQlTs58AmZz
 AtWv778C1sssoC7xZ94lZghbXqJ562woW1zi1pP5TBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJ
 LS3OTc8tNtQrTswtLs1L10vOz93ECIzCbcd+bt7BeGlj8CFGAQ5GJR7eA1ZMsUKsiWXFlbmH
 GCU4mJVEeH8wAIV4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5H5gg8kriDU0NzS0sDc2NzY3N
 LJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MGZNvXG2lCtdbsedq30rE0vk7ltMZ9vyq2k1
 70ypmEIxX23PlWuX7RXYEXOjoOiSVOU6S+b4guld5aeT+C4rn9Zfqn7H7UR7+J0ZFZprYt71
 X9rRxRr6qnVhw7NA3hbmmAOvUlzzmxpanHIiNp1lSPuXNN3q/pObt/ULDomqCwgcjLi3WlIw
 RYmlOCPRUIu5qDgRAFV+dCPYAgAA
X-CMS-MailID: 20190613131900eucas1p1680f5d11a036a408987b7df0b62d2ba5
X-Msg-Generator: CA
X-RootMTR: 20190609231345epcas1p378c57c1a30bf63ed0b9ac21cd635b220
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190609231345epcas1p378c57c1a30bf63ed0b9ac21cd635b220
References: <CGME20190609231345epcas1p378c57c1a30bf63ed0b9ac21cd635b220@epcas1p3.samsung.com>
 <20190609231339.22136-1-linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560431941;
 bh=avCKt8m1YLpQn7xGox56gj4dqTelo2c0yU1DVlZFFi0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=JyuDG1hujTQiIkT4IGORvNk2+kbGz+bvQI2/fgVyqbMgn7SGNOdpo3ZC4J0uaveR8
 GnMcOBT3/YF7iZcXcGc7TQRv4nKFXRbwvYX+QULAGtTJCnr59erBgxO59H+YxHjjjN
 NACjKCF+o1P81hL+cIvrkEHOtry3IyvbPqwpgKqk=
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAuMDYuMjAxOSAwMToxMywgTGludXMgV2FsbGVpaiB3cm90ZToKPiBUaGlzIGNvbnZlcnRz
IHRoZSBBbmFsb2dpeCBkaXNwbGF5IHBvcnQgdG8gdXNlIEdQSU8gZGVzY3JpcHRvcnMKPiBpbnN0
ZWFkIG9mIERULWV4dHJhY3RlZCBudW1iZXJzLgo+Cj4gQ2M6IERvdWdsYXMgQW5kZXJzb24gPGRp
YW5kZXJzQGNocm9taXVtLm9yZz4KPiBDYzogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5v
cmc+Cj4gQ2M6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiBD
YzogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
CgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCgpXaWxs
IGJlIHF1ZXVlZCB0byBkcm0tbWlzYy1uZXh0LgoKCsKgLS0KUmVnYXJkcwpBbmRyemVqCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
