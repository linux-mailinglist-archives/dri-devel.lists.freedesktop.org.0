Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0960436306
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 19:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7653889322;
	Wed,  5 Jun 2019 17:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5CA89322
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 17:54:26 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C5A19200AA;
 Wed,  5 Jun 2019 19:54:24 +0200 (CEST)
Date: Wed, 5 Jun 2019 19:54:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dingchen Zhang <dingchen.zhang@amd.com>
Subject: Re: [PATCH 2/2] drm: Set crc->opened = false before setting crc
 source to NULL.
Message-ID: <20190605175423.GB20307@ravnborg.org>
References: <20190605170639.8368-1-dingchen.zhang@amd.com>
 <20190605170639.8368-2-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605170639.8368-2-dingchen.zhang@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=zd2uoN0lAAAA:8
 a=OKjHR3uSGCQdXQEvTkoA:9 a=CjuIK1q_8ugA:10
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGluZ2NoZW4KCkkgZG8gbm90IGtub3cgdGhpcyBjb2RlLCBzbyBwbGVhc2UgYXdhaXQgZmVl
ZGJhY2sgZnJvbSBvdGhlcnMgb24gdGhlCnBhdGNoIGl0c2VsZi4KCk9uIFdlZCwgSnVuIDA1LCAy
MDE5IGF0IDAxOjA2OjM5UE0gLTA0MDAsIERpbmdjaGVuIFpoYW5nIHdyb3RlOgo+IHRvIHRlcm1p
bmF0ZSB0aGUgd2hpbGUtbG9vcCBpbiBkcm1fZHBfYXV4X2NyY193b3JrIHdoZW4gZHJtX2RwX3N0
YXJ0L3N0b3BfY3JjCj4gYXJlIGNhbGxlZCBpbiB0aGUgaG9vayB0byBzZXQgY3JjIHNvdXJjZS4K
PiAKPiBDYzpMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4sIEhhcnJ5IDxIYXJyeS5XZW50bGFu
ZEBhbWQuY29tPiwgTmljayA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29tPgpPbmx5IG9uZSBw
YWlyIG9mIG5hbWUvZW1haWwgcGVyIGxpbmUuCkFuZCB0cnkgdG8gdXNlIHRoZSBmdWxsIG5hbWUg
YXMgcmVwb3J0ZWQgYnkgc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbAoKCVNhbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
