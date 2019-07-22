Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B38E7126C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326238919D;
	Tue, 23 Jul 2019 07:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jul 2019 14:12:56 UTC
Received: from rosenzweig.io (rosenzweig.io [107.170.207.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB003893ED
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 14:12:56 +0000 (UTC)
Received: by rosenzweig.io (Postfix, from userid 1000)
 id 6B2BC606F5; Mon, 22 Jul 2019 07:12:56 -0700 (PDT)
Date: Mon, 22 Jul 2019 07:12:56 -0700
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 4/5] drm/panfrost: Add support for GPU heap allocations
Message-ID: <20190722141256.GE2156@rosenzweig.io>
References: <20190717183352.22519-1-robh@kernel.org>
 <20190717183352.22519-4-robh@kernel.org>
 <0605b17e-4a6b-df9d-6684-38952ce5a09d@arm.com>
 <CAL_JsqK54bV7GQs+=Q0Ye6owwegPXZxj0UHDe-mQmoXJ_mDfnQ@mail.gmail.com>
 <604cb426-6034-1e92-f653-9ee5a3d4c180@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <604cb426-6034-1e92-f653-9ee5a3d4c180@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBBIGZhaXIgYml0IG9mIHRoZSBjb21wbGV4aXR5IG9mIGtiYXNlIGNvbWVzIGZyb20gdHJ5aW5n
IHRvIGF2b2lkIHRoZQo+IHBvc3NpYmlsaXR5IG9mIG9uZSBwcm9jZXNzIERvU2luZyBhbm90aGVy
IGJ5IHN1Ym1pdHRpbmcgbWFsaWNpb3VzIGpvYnMuCgouLi5hbmQgeWV0IGl0IHdhcyBzdGlsbCBk
b2FibGUgc28gZWFzaWx5IChieSBhY2NpZGVudCwgd2l0aCBidWdneSBqb2JzCmluc3RlYWQgb2Yg
bWFsaWNpb3VzIGpvYnMpLi4uLiBzaWdoLi4uCgpTdGlsbCBpcyBvbiB0aGUgbWFpbmxpbmUga2Vy
bmVsIChlLmcuIHJ1bm5pbmcgZEVRUCBpbiBhIHdpbmRvdyBpbgpXZXN0b24sIHNvbWUgZmF1bHRz
IHRyaWdnZXJlZCBpbiBkRVFQIGVuZCB1cCBtZXNzaW5nIHVwIFdlc3RvbidzCnJlbmRlcmluZyBv
dXRzaWRlIHRoZSBkZXFwIHdpbmRvdykuIFdoYXQncyBvdXIgdGhyZWF0IG1vZGVsIGhlcmU/CgpJ
cyAiYmFubmluZyBXZWJHTCBvbiBQYW5mcm9zdCIgYWxsb3dlZD8gOikKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
