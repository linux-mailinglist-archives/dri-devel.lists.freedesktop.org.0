Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C146A8A6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 14:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B21C89D87;
	Tue, 16 Jul 2019 12:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB3689D87
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 12:25:52 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190716122550euoutp026726742dedc540ac3c82e9870e4e3c73~x4tUYgWNv0642906429euoutp02P
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 12:25:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190716122550euoutp026726742dedc540ac3c82e9870e4e3c73~x4tUYgWNv0642906429euoutp02P
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190716122550eucas1p21fd5c85a08af29b5815f294a48464b03~x4tUFrQ4I0472904729eucas1p2f;
 Tue, 16 Jul 2019 12:25:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3B.CE.04298.D42CD2D5; Tue, 16
 Jul 2019 13:25:49 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190716122549eucas1p2c757e92ae6b02f02123f2510415372d8~x4tTbuNjs0470704707eucas1p2Y;
 Tue, 16 Jul 2019 12:25:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190716122549eusmtrp1c5e8222906bc800df7be15a267224311~x4tTNtNcz1452614526eusmtrp1J;
 Tue, 16 Jul 2019 12:25:49 +0000 (GMT)
X-AuditID: cbfec7f2-3615e9c0000010ca-f6-5d2dc24d841c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 21.64.04146.D42CD2D5; Tue, 16
 Jul 2019 13:25:49 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190716122548eusmtip17c4b9af73f748791f459f12dc1abb5fe~x4tS2CZlL1043210432eusmtip1x;
 Tue, 16 Jul 2019 12:25:48 +0000 (GMT)
Subject: Re: [PATCH 02/10] video: sa1100fb: Remove cpufreq policy notifier
To: Viresh Kumar <viresh.kumar@linaro.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <8b0f9adf-8462-eeba-afd1-52201f4e7f47@samsung.com>
Date: Tue, 16 Jul 2019 14:25:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7163e57cfa1780d42732fa6b5ec424c24d1d4dc8.1563270828.git.viresh.kumar@linaro.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djPc7q+h3RjDU68sbS48vU9m8WJvg+s
 Fpd3zWGz+Nx7hNHizOlLrBYdR74xW2z86uHA7nHn2h42j/vdx5k8tlxtZ/H4vEkugCWKyyYl
 NSezLLVI3y6BK2PxlnksBQtZK5ZtXMPUwLiCpYuRk0NCwETiUNMspi5GLg4hgRWMEkeutTJD
 OF8YJV5tuscG4XxmlLi18ToTTMvsG4/ZIRLLGSWa75+D6n/LKDHp/RWwKmEBL4ne/0tZuxg5
 OEQEtCRe3kwFCTMLnGOUOHvTF8RmE7CSmNi+ihHE5hWwk3h7Zy/YTSwCqhIrtjcxg9iiAhES
 949tYIWoEZQ4OfMJWA2nQJzEpA2X2SFmikvcejKfCcKWl9j+dg7YCxICm9gl/s/bwwhxtYvE
 24WroZ4Wlnh1fAs7hC0jcXpyDwtEwzpGib8dL6C6tzNKLJ/8jw2iylri8PGLYN8wC2hKrN+l
 DxF2lNh34BcLSFhCgE/ixltBiCP4JCZtm84MEeaV6GgTgqhWk9iwbAMbzNqunSuZJzAqzULy
 2iwk78xC8s4shL0LGFlWMYqnlhbnpqcWG+allusVJ+YWl+al6yXn525iBCae0/+Of9rB+PVS
 0iFGAQ5GJR7eE3t0YoVYE8uKK3MPMUpwMCuJ8Np+1Y4V4k1JrKxKLcqPLyrNSS0+xCjNwaIk
 zlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnVwBjsO7lt3Ru7+7qPG5ddXVPqlnK4sHbb5kvnnp5L
 DlU9bVmxqMZC+Hey6s0N3/90T3gnwG9cvmS5KUcut0PaY5sDk+W/vk1sLTOVS0v5KCe91E1/
 6wFH2x8Rydc6RLo6hVfvc9zrZV1wzFeN5dGpfW8L/JWK//drbD7wre6Eqrdym/9q6SuPKpRY
 ijMSDbWYi4oTAR1DDzw4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsVy+t/xu7q+h3RjDW485bG48vU9m8WJvg+s
 Fpd3zWGz+Nx7hNHizOlLrBYdR74xW2z86uHA7nHn2h42j/vdx5k8tlxtZ/H4vEkugCVKz6Yo
 v7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2PxlnksBQtZ
 K5ZtXMPUwLiCpYuRk0NCwERi9o3H7F2MXBxCAksZJa5fXcDWxcgBlJCROL6+DKJGWOLPtS42
 iJrXjBJ/3rSwgySEBbwkev8vZQWpFxHQknh5MxWkhlngAqPErA9tjBANfYwSF1ZNYANpYBOw
 kpjYvooRxOYVsJN4e2cv2BUsAqoSK7Y3MYPYogIREmfeQ1zHKyAocXLmEzCbUyBOYtKGy2CL
 mQXUJf7Mu8QMYYtL3HoynwnClpfY/nYO8wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OL
 DfWKE3OLS/PS9ZLzczcxAiNt27Gfm3cwXtoYfIhRgINRiYf3xB6dWCHWxLLiytxDjBIczEoi
 vLZftWOFeFMSK6tSi/Lji0pzUosPMZoCPTeRWUo0OR+YBPJK4g1NDc0tLA3Njc2NzSyUxHk7
 BA7GCAmkJ5akZqemFqQWwfQxcXBKNTCqzNz0hG+/lJbwg+wHh5Mq+/iEZ3HoF+Vu5+WsWPcj
 cYXFbYeJBhz+LHkN63PymnyDKrnuahzTlL/4qT3HPkDrVm937e+qC6bp28/ZTomxabnyoad3
 2q6fZ70dvKed2PRu6+sf1l/5a3492J3+SpB/SWim/UmLhVdOs7memmTJ/WoKp8XTLzpKLMUZ
 iYZazEXFiQD3EvhWygIAAA==
X-CMS-MailID: 20190716122549eucas1p2c757e92ae6b02f02123f2510415372d8
X-Msg-Generator: CA
X-RootMTR: 20190716122549eucas1p2c757e92ae6b02f02123f2510415372d8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190716122549eucas1p2c757e92ae6b02f02123f2510415372d8
References: <cover.1563270828.git.viresh.kumar@linaro.org>
 <7163e57cfa1780d42732fa6b5ec424c24d1d4dc8.1563270828.git.viresh.kumar@linaro.org>
 <CGME20190716122549eucas1p2c757e92ae6b02f02123f2510415372d8@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563279950;
 bh=8dxkZGheuXcwqu+8751Obi1RgIchRJd6UNRg3xcUhVs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=beB6fxJGOZp7/6yovKJephHOmkUOJiv5AmsjvY/Y3fHObUFK+nqsvNWG1UCXcujRA
 /1Nse0QddKyDCEaxDasugN6YEuuW1m3hRWIX7BL+aVyhJLhb4RzI1CXZpwM29uU4+7
 xM7ZZOj8nxTpIwb1RyIi5+bQaWj7csgnS3xQLPvA=
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
Cc: linux-fbdev@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIFZpcmVzaCwKClBsZWFzZSBhbHdheXMgQ2M6IG1lIG9uIGZiZGV2IHBhdGNoZXMuCgpPbiA3
LzE2LzE5IDExOjU0IEFNLCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gVGhlIGNwdWZyZXEgcG9saWN5
IG5vdGlmaWVyJ3MgQ1BVRlJFUV9BREpVU1Qgbm90aWZpY2F0aW9uIGlzIGdvaW5nIHRvCj4gZ2V0
IHJlbW92ZWQgc29vbi4KPiAKPiBUaGUgbm90aWZpZXIgY2FsbGJhY2sgc2ExMTAwZmJfZnJlcV9w
b2xpY3koKSBpc24ndCBkb2luZyBhbnl0aGluZyBhcGFydAo+IGZyb20gcHJpbnRpbmcgYSBkZWJ1
ZyBtZXNzYWdlIG9uIENQVUZSRVFfQURKVVNUIG5vdGlmaWNhdGlvbi4gVGhlcmUgaXMKPiBubyBw
b2ludCBpbiBrZWVwaW5nIGFuIG90aGVyd2lzZSBlbXB0eSBjYWxsYmFjayBhbmQgcmVnaXN0ZXJp
bmcgdGhlCj4gbm90aWZpZXIuCj4gCj4gUmVtb3ZlIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZp
cmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+CgpBY2tlZC1ieTogQmFydGxvbWll
aiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgoKQmVzdCByZWdhcmRz
LAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xh
bmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
