Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6520071260
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C0A884E2;
	Tue, 23 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rosenzweig.io (rosenzweig.io [107.170.207.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D982A896EC
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 14:14:34 +0000 (UTC)
Received: by rosenzweig.io (Postfix, from userid 1000)
 id 3CB776000E; Mon, 22 Jul 2019 07:05:50 -0700 (PDT)
Date: Mon, 22 Jul 2019 07:05:50 -0700
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/5] drm/panfrost: Add a no execute flag for BO allocations
Message-ID: <20190722140550.GA2156@rosenzweig.io>
References: <20190717183352.22519-1-robh@kernel.org>
 <20190717183352.22519-3-robh@kernel.org>
 <ecde43d2-45cc-d00a-9635-cb56a67263d4@arm.com>
 <CAL_JsqLfnMwibCMU8_PqqYj0C895wuW9DNPirFo-LRChxJA-fA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLfnMwibCMU8_PqqYj0C895wuW9DNPirFo-LRChxJA-fA@mail.gmail.com>
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
 Robin Murphy <robin.murphy@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBTZWVtcyBsaWtlIGFsbW9zdCA0R0IgZXhlY3V0YWJsZQo+IGJ1ZmZlciBzaG91bGQgYmUgZW5v
dWdoIGZvciBhbnlvbmUoVE0pLgoKKFRNKSBpbmRlZWQuIEZvciBzdGF0cywgUGFuZnJvc3Qgcmln
aHQgbm93IHVzZXMgYSBzaW5nbGUgMTZNQiBzaGFkZXIKYnVmZmVyIHBlciBjb250ZXh0IGFuZCBu
ZXZlciByZWFsbG9jYXRlcy4KCkkgaGF2ZSBuZXZlciBzZWVuIGl0IHJ1biBvdXQgb2Ygc3BhY2Us
IG5vdCBldmVuIG9uY2Ugb24gYSBjb25mb3JtYW5jZQp0ZXN0LgoKTWFsaSBzaGFkZXIgYmluYXJp
ZXMgYXJlIHNtYWxsIChhIEhVR0Ugc2hhZGVyIHdvdWxkIGJlIHNldmVyYWwKa2lsb2J5dGVzISEh
KSBzby4uLiBob25lc3RseSBpZiB5b3UncmUgZG9pbmcgbW9yZSB0aGFuIDMyTUIgZXhlY3V0YWJs
ZQp0aGF0J3Mgc3VwZXIgcmFpc2luZyBleWVicm93cy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
