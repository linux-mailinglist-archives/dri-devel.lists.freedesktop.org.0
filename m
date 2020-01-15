Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8E913C16C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58906E9AD;
	Wed, 15 Jan 2020 12:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742046E9AD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id EF6C83F580;
 Wed, 15 Jan 2020 13:45:43 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=AeI6b8ax; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sk4cqvU11fdV; Wed, 15 Jan 2020 13:45:43 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id D7AE53F3F2;
 Wed, 15 Jan 2020 13:45:42 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0EC78360315;
 Wed, 15 Jan 2020 13:45:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579092342; bh=rDCh+vypIt6vDxtPBNzzQsrA8yTJPEVD51kHOHd6c4c=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=AeI6b8axnWrmnsrq2F3T+dDoK/ne74N1/PXSgsSnt1sPv+CQWg7YwUoKQT885xXdl
 cRkkmsI+Mz5k7k7doxtUXfySBZKFC5gzAMNXfViCGku2V8VUqL5VTy2v1naqcTGR0y
 KuRCZXp7O2uoPXRnKmUSxNqubZDgTKyZyQHGUSNg=
Subject: TTM or vmwgfx tree? Re: [PATCH v5 0/2] mm, drm/ttm: Fix pte insertion
 with customized protection
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20200115124107.3845-1-thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <01560aef-b21e-57b9-a7a1-fd7ff3aabfb2@shipmail.org>
Date: Wed, 15 Jan 2020 13:45:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200115124107.3845-1-thomas_os@shipmail.org>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKT24gMS8xNS8yMCAxOjQxIFBNLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13
YXJlKSB3cm90ZToKPiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5j
b20+Cj4KPiBUaGUgZHJtL3R0bSBtb2R1bGUgaXMgdXNpbmcgYSBtb2RpZmllZCBvbi1zdGFjayBj
b3B5IG9mIHRoZQo+IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCB0byBiZSBhYmxlIHRvIHNldCBhIHBh
Z2UgcHJvdGVjdGlvbiB3aXRoIGN1c3RvbWl6ZWQKPiBjYWNoaW5nLiBGaXggdGhhdCBieSBhZGRp
bmcgYSB2bWZfaW5zZXJ0X21peGVkX3Byb3QoKSBmdW5jdGlvbiBzaW1pbGFyCj4gdG8gdGhlIGV4
aXN0aW5nIHZtZl9pbnNlcnRfcGZuX3Byb3QoKSBmb3IgdXNlIHdpdGggZHJtL3R0bS4KPgo+IFBh
dGNoZXMgYXJlIGFja2VkIHRvIGJlIG1lcmdlZCB0aHJvdWdoIGEgZHJtIHRyZWUuCgpUaGlzIHNt
YWxsIHBhdGNoc2V0IHNob3VsZCBiZSByZWFkeSB0byBiZSBtZXJnZWQgbm93LCB3aXRoIGFja3Mg
ZnJvbSBBbmRyZXcuCgpEbyB5b3Ugd2FudCB0byB0YWtlIGl0IHRocm91Z2ggdGhlIHR0bSB0cmVl
LCBvciBzaG91bGQgSSBhc2sgRGF2ZSAvIApEYW5pZWwgdG8gcHVsbCBpdCBzZXBhcmF0ZWx5PwoK
Tm90ZSB0aGF0IHNpbWlsYXIgdG8gdGhlIHZtd2dmeCBjb2hlcmVudCBwYXRjaGVzLCBMaW51cyBo
YXMgaW5kaWNhdGVkIAp0aGF0IGhlIHdhbnRzIHNlcGFyYXRlIHB1bGwgcmVxdWVzdHMgZm9yIHN0
dWZmIGxpa2UgdGhpcyB0aGF0IHRvdWNoZXMgbW0uCgpUaGFua3MsCgpUaG9tYXMKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
