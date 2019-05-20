Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B0C23077
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 11:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1099288CBF;
	Mon, 20 May 2019 09:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5AF88CBF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:36:21 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190520093620euoutp016a4078b83e4f2319a1833d7cbe4db835~gWoDmFdWY0730007300euoutp01k
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:36:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190520093620euoutp016a4078b83e4f2319a1833d7cbe4db835~gWoDmFdWY0730007300euoutp01k
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190520093620eucas1p22d918239882be07df306f7d70fb52c95~gWoDRxNcB0999709997eucas1p2r;
 Mon, 20 May 2019 09:36:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 25.00.04325.31572EC5; Mon, 20
 May 2019 10:36:20 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190520093619eucas1p2b99087dc745ebf065e01406acd57f78f~gWoCeQMIs2516325163eucas1p2v;
 Mon, 20 May 2019 09:36:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190520093619eusmtrp110b60b9931ac95ac6ae88b04cab9b058~gWoCW_3XP1234812348eusmtrp12;
 Mon, 20 May 2019 09:36:19 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-3a-5ce27513a0b0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E1.09.04146.31572EC5; Mon, 20
 May 2019 10:36:19 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190520093618eusmtip29c1b9a6ae075be18a95be634844482ab~gWoB1P_P20448604486eusmtip2j;
 Mon, 20 May 2019 09:36:18 +0000 (GMT)
Subject: Re: [PATCHv3 10/23] drm/bridge: tc358767: add link disable function
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <ddc4c8bf-f563-1f79-51c5-0641a47e8626@samsung.com>
Date: Mon, 20 May 2019 11:36:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503122949.12266-11-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjtt/vY3XRynZYfNkpHIUr5SKELqVQELZCQoJA0dOVlSk5l06WV
 ZdljOvH9yGlMwVAUU0pXFmnNcoq9DCmdj63yAaGYlVKYmvMq+d/5zjnf75wPfhQmfka4U/GJ
 KawqUZ4gJYW4sfvP272uqV+i/Ade4EyWNoS5bsokmIX8mzgzMD9LMrpsLcHY7g7xmOzCWj4z
 OtaDM/q53wTTbLCQB4UyW+kKT9auH+XLKrUVhMyqM/Nk+Uv+MvPgI144eVoYHMsmxGtYlV9o
 jDBuTNeOJZdhaUXDOpSJPvJykIACOggmq29jOUhIiel6BKOLU4gbfiEYaX5NcMNPBCuG52hj
 pbJ3CrdjMV2HoL+cz5lmEBSW5hN2wYUOg66XNWuCK12FwXKxPURAkbQ3LD0cIu1YRIfCgrZt
 rQhO74bh+5Vrnq10BFi7WwjO4wy9FeOraRQloIMh77vCTmP0Tshq4+wY7QaWcQPPngW0iQ8f
 lgf4XNMj0GLsWMcu8M3cuo4l0Feci3P4Kljrb2DcshZBW0s7xgkHoMvcT9iDsdXSzU/8OPoQ
 lOQ1kHYaaCcYnHHmOjhBkbEc42gRaG+JObcnWN+0rT/oBvfez5MclsH0NQu/AHnqNx2p33SZ
 ftNl+v8dqhHegNzYVLVSwaoDE9kLvmq5Up2aqPA9l6R8gFY/Vd+yef4x6vh71oRoCkkdRbLy
 z1FiQq5RpytNCChM6ioK9LJGiUWx8vSLrCopWpWawKpNaDuFS91El7bYIsW0Qp7CnmfZZFa1
 ofIogXsmaqrI2Ncs6Xl3YiJe2rg/UnMi7OhxJw+yQPx1sfsYVjs2UhN9pzVjesJh9owP8zTg
 sKZ8rqruR+Ui+UnT1DEeYZ7L2KHc5qErcZS0Dg3uiQkvGZsMSfLJPNXpazFO7zL0dgadLPPP
 vVJc6LVyebIxrbbVhtV7G/tiBXXmhuFXDhIpro6TB/hgKrX8H3P51R9QAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsVy+t/xe7rCpY9iDM58FLdo7rC1aDrUwGrx
 rb+VxeLK1/dsFt2dHawWD+beZLLonLiE3eLuvRMsFrM+/mC1WD//FpsDl8eDqf+ZPHbOusvu
 MbtjJqvH/e7jTB79fw08jt/YzhTAFqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5r
 ZWSqpG9nk5Kak1mWWqRvl6CXca97J3PBNOaKSbe7GRsYrzF1MXJySAiYSMw++ZwFxBYSWMoo
 8fGrG0RcXGL3/LfMELawxJ9rXWxdjFxANa8ZJa6sP8oOkhAW8JE4fGQhO0hCRGABs0T3lcvs
 EFUHGCXOPXsPtoJNQFPi7+abbCA2r4CdxLeOrWBxFgFVidvrZoOtEBWIkDjzfgULRI2gxMmZ
 T4BsDg5OARuJvg/pIGFmAXWJP/MuMUPY8hLNW2dD2eISt57MZ5rAKDgLSfcsJC2zkLTMQtKy
 gJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmAMbjv2c/MOxksbgw8xCnAwKvHwfpjyMEaI
 NbGsuDL3EKMEB7OSCK+x+v0YId6UxMqq1KL8+KLSnNTiQ4ymQL9NZJYSTc4Hpoe8knhDU0Nz
 C0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2M7Fs4roS7VR/Y4nWw7fIlpXRJ
 i++17kuMJFyZM68ltt3Q+f1ewNP+63qT/0ZPpXXT66tSNl+JUxT9YTvhh3THnTs7VsukrfCp
 u/lO2XLt3fAvL+VtLetCj08+IKx9UNH88W1Gs/j81j0cQiaRpxuznV1fvEv5WPZelP+f/Y/M
 WamH1j7Wu79GiaU4I9FQi7moOBEAbgc+I9cCAAA=
X-CMS-MailID: 20190520093619eucas1p2b99087dc745ebf065e01406acd57f78f
X-Msg-Generator: CA
X-RootMTR: 20190503123115epcas4p438b07a39ecb2bf90fab8b45d6e96c5b3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190503123115epcas4p438b07a39ecb2bf90fab8b45d6e96c5b3
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
 <CGME20190503123115epcas4p438b07a39ecb2bf90fab8b45d6e96c5b3@epcas4p4.samsung.com>
 <20190503122949.12266-11-tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558344980;
 bh=OljTfVulSnFmatCwcjRqguKFmM0KAb0aTOs13OasWak=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=h7LDqgBtVGXJh2wmuKYHlAuLIbVPtepKBNbuyu8R8qTZOAUIXkhvFCphXcWGDpek0
 4zT2oPaX32sb2RJhUyJevA2qpt3vJN+MhnJEUpt5HdIW2WJt6qTScSW1FZFkoQMgZt
 uBH93nYPhdEqNyz7OHD4QzYNfyzD8NIlHeKJBwIU=
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

T24gMDMuMDUuMjAxOSAxNDoyOSwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gQ3VycmVudGx5IHdl
IGhhdmUgdGNfbWFpbl9saW5rX3NldHVwKCksIHdoaWNoIGNvbmZpZ3VyZXMgYW5kIGVuYWJsZWQg
dGhlCj4gbGluaywgYnV0IHdlIGhhdmUgbm8gY291bnRlci1wYXJ0IGZvciBkaXNhYmxpbmcgdGhl
IGxpbmsuCj4KPiBBZGQgdGNfbWFpbl9saW5rX2Rpc2FibGUsIGFuZCByZW5hbWUgdGNfbWFpbl9s
aW5rX3NldHVwIHRvCj4gdGNfbWFpbl9saW5rX2VuYWJsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFRv
bWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVq
IEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
