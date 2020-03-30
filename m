Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD1A197C1E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 14:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA0A6E296;
	Mon, 30 Mar 2020 12:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2256E296
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 12:40:56 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20739738-1500050 for multiple; Mon, 30 Mar 2020 13:40:44 +0100
MIME-Version: 1.0
In-Reply-To: <20200330123425.3944-1-christian.koenig@amd.com>
References: <20200330123425.3944-1-christian.koenig@amd.com>
To: Christian König <ckoenig.leichtzumerken@gmail.com>, andi.shyti@intel.com, dri-devel@lists.freedesktop.org, joonas.lahtinen@linux.intel.com, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158557204261.3228.10264756093485370990@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Mon, 30 Mar 2020 13:40:42 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDIwLTAzLTMwIDEzOjM0OjI1KQo+IFRoaXMgcmV2
ZXJ0cyBjb21taXQgN2JlMWI5YjhlOWQxZTllZjAzNDJkMmUwMDFmNDRlZWM0MDMwYWE0ZC4KPiAK
PiBUaGUgZHJtX21tIGlzIHN1cHBvc2VkIHRvIHdvcmsgaW4gYXRvbWljIGNvbnRleHQsIHNvIGNh
bGxpbmcgc2NoZWR1bGUoKQo+IG9yIGluIHRoaXMgY2FzZSBjb25kX3Jlc2NoZWQoKSBpcyBpbGxl
Z2FsLgoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzM1ODUzNS8/c2Vy
aWVzPTc0OTg0JnJldj0xCgooVGhvdWdoIEkgZG8gcXVlc3Rpb24gdGhlIHdpc2RvbSBpbiBzZWFy
Y2hpbmcsIHJhdGhlciB0aGFuIGp1c3QgZG9pbmcgYQpjdXJzb3J5IGNoZWNrLCBmcm9tIGFuIGF0
b21pYyBjb250ZXh0IDopCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
