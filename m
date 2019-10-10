Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD5D2B5D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36A26EB3C;
	Thu, 10 Oct 2019 13:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E5B6EB3C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:30:58 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58246
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iIYWu-0007X3-KR; Thu, 10 Oct 2019 15:30:56 +0200
Subject: Re: [1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
To: Maxime Ripard <mripard@kernel.org>
References: <20190725105132.22545-2-noralf@tronnes.org>
 <20191001123636.GA8351@ziepe.ca>
 <1fffe7b1-a738-a9e3-ea5f-9d696cb98650@tronnes.org>
 <20191001134555.GB22532@ziepe.ca>
 <75055e2d-44f7-0cba-4e41-537097b73c3c@tronnes.org>
 <20191009104531.GW16989@phenom.ffwll.local>
 <1bc77839-c47a-6e79-dd6e-e26e05b34eae@tronnes.org>
 <20191009133138.scz3i5jjcqt3gnjd@gilmour>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <b3fd63ce-3b8b-c8b8-3ed1-8331ab9a2440@tronnes.org>
Date: Thu, 10 Oct 2019 15:30:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009133138.scz3i5jjcqt3gnjd@gilmour>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=quv4NTOkLsYzLEUOtD0kQGcbjs9O5FlvKDWJavW93Z8=; b=Gg9ms/qnO4DEAYLLFns0SicFJN
 trgL2GUvuLlGpLkHe6v/q2Dunh1KiQdK5FEb8Z6N6AOjp8CoBa1PX23vTi0MDTLZ+la4lT9W/0930
 nxiM5AzSJXo3mI4O/A5hwGAfDGPOtx2ELIbpr1uWm/kxveFF7aTTD2CkUUH9bWXl/Cq2C8BnKHC+m
 R/YwuZhMEhxcW1ltJgIJBMM/VQum3vcyhvyhP31Mne//3/PpEY+gyxOi+0P8YZaJoCWMIXNTENYiO
 Ymx9ZoORbCrU+19MKjsekW6HThTmzAkLGSpf6sMijjtWlCKiV6+XD5kUj8SytHGF5v5RMl6r3KrPh
 eHazJiBw==;
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
Cc: hdegoede@redhat.com, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDkuMTAuMjAxOSAxNS4zMSwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBPbiBXZWQsIE9j
dCAwOSwgMjAxOSBhdCAwMjo0ODoyMFBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
IERlbiAwOS4xMC4yMDE5IDEyLjQ1LCBza3JldiBEYW5pZWwgVmV0dGVyOgo+Pj4gT24gVHVlLCBP
Y3QgMDEsIDIwMTkgYXQgMDQ6MDc6MzhQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+
Pj4+IEhpIGRybS1taXNjIG1haW50YWluZXJzLAo+Pj4+Cj4+Pj4gSSBoYXZlIGp1c3QgYXBwbGll
ZCBhIHBhdGNoIHRvIGRybS1taXNjLW5leHQgdGhhdCBhcyBpdCB0dXJucyBvdXQgc2hvdWxkCj4+
Pj4gaGF2ZSBiZWVuIGFwcGxpZWQgdG8gLWZpeGVzIGZvciB0aGlzIC1yYyBjeWNsZS4KPj4+Pgo+
Pj4+IFNob3VsZCBJIGNoZXJyeSBwaWNrIGl0IHRvIGRybS1taXNjLW5leHQtZml4ZXM/Cj4+Pgo+
Pj4gWXVwLCBjaGVycnkgcGljayBhbmQgcmVmZXJlbmNlIHRoZSBjb21taXQgdGhhdCdzIGFscmVh
ZHkgaW4gLW5leHQgKGluIGNhc2UKPj4+IGl0IGNyZWF0ZXMgY29uZmxpY3RzIGRvd24gdGhlIHJv
YWQgdGhhdCByZWZlcmVuY2UgbWFrZXMgdGhlIG1lc3MgZWFzaWVyIHRvCj4+PiB1bmRlcnN0YW5k
KS4KPj4+Cj4+Cj4+IEkgcmVtZW1iZXJlZCB0aGF0IE1heGltZSBqdXN0IHNlbnQgb3V0IGEgZml4
ZXMgcHVsbCBhbmQgdGhlIHN1YmplY3Qgc2F5cwo+PiBkcm0tbWlzYy1maXhlcy4gVGhlIHByZXZv
dXMgb25lIGhlIHNlbnQgb3V0IHdhcyAtbmV4dC1maXhlcy4KPj4gU28gaXQgbG9va3MgbGlrZSBJ
IHNob3VsZCBjaGVycnkgcGljayB0byBkcm0tbWlzYy1maXhlcyBmb3IgaXQgdG8gc2hvdwo+PiB1
cCBpbiA1LjQ/Cj4gCj4gZHJtLW1pc2MtbmV4dC1maXhlcyBpcyB0aGUgYnJhbmNoIHdoZXJlIHdl
IGdhdGhlciBmaXhlcyBzdXBwb3NlZCB0byBiZQo+IGFwcGxpZWQgb24gdG9wIG9mIGRybS1taXNj
LW5leHQgZHVyaW5nIHRoZSBtZXJnZSB3aW5kb3cuIElmIHlvdSBoYXZlCj4gc29tZXRoaW5nIHRh
cmdldGluZyB0aGUgY3VycmVudCByZWxlYXNlLCBpdCBzaG91bGQgYmUgZHJtLW1pc2MtZml4ZXMK
PiBpbmRlZWQuCgpUaGFua3MsIGl0J3MgYXBwbGllZCBub3cuCgpOb3JhbGYuCgo+IAo+IE1heGlt
ZQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
