Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2559A4EB95
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483F86E8D0;
	Fri, 21 Jun 2019 15:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5778F6E8D0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 15:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id C96423F79B;
 Fri, 21 Jun 2019 17:12:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkgMz8Vz9Kru; Fri, 21 Jun 2019 17:12:20 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id EC61B3F731;
 Fri, 21 Jun 2019 17:12:19 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BF53E361688;
 Fri, 21 Jun 2019 17:12:19 +0200 (CEST)
Subject: Re: [PATCH v2 00/18] drm/ttm: make ttm bo a gem bo subclass
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190621115755.8481-1-kraxel@redhat.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas@shipmail.org>
Organization: VMware Inc.
Message-ID: <8e022cff-604c-457a-7b85-c1233ac3a2fe@shipmail.org>
Date: Fri, 21 Jun 2019 17:12:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190621115755.8481-1-kraxel@redhat.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1561129939; bh=xHZT1oLMYmxB5Tiw+4OReS7/dJjA9E2oLR46BKDqkZc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rQ8SyZHiEJ1dF1L2ZOb5iZNaP30+QuCdusXpjJINWVyc3g4LnbWpVRQWc6WAo5IFT
 yodZ7iU60ZQE3oe5UsZrVQvDblxBja/wuYf48ErNF3CNiHSoXQpkoiampZi7d3tI8q
 E9afro/WgaY5COJppvIotpwQM0jyNBeUhBRXlrdo=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=rQ8SyZHi; 
 dkim-atps=neutral
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
Cc: ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA2LzIxLzE5IDE6NTcgUE0sIEdlcmQgSG9mZm1hbm4gd3JvdGU6CgpBYXJnaC4gUGxlYXNl
IGRvbid0IGRvIHRoaXMuIE11bHRpcGxlIHJlYXNvbnM6CgoxKSBJIHRoaW5rIEl0J3MgYmFkIHRv
IGR1bXAgYWxsIGJ1ZmZlciBvYmplY3QgZnVuY3Rpb25hbGl0eSB3ZSBjYW4gCnBvc3NpYmx5IHRo
aW5rIG9mIGluIGEgc2luZ2xlIHN0cnVjdCBhbmQgZm9yY2UgdGhhdCBvbiBhbGwgKHdlbGwgYXQg
CmxlYXN0IG1vc3QpIHVzZXJzLiBJdCdzIGJldHRlciB0byBpc29sYXRlIGZ1bmN0aW9uYWxpdHkg
aW4gc3RydWN0cywgaGF2ZSAKdXRpbGl0eSBmdW5jdGlvbnMgZm9yIHRob3NlIGFuZCBsZXQgdGhl
IGRyaXZlcnMgZGVyaXZlIHRoZWlyIGJ1ZmZlciAKb2JqZWN0cyBmcm9tIHdoYXRldmVyIGZ1bmN0
aW9uYWxpdHkgdGhleSBhY3R1YWxseSBuZWVkLgoyKSB2bXdnZnggaXMgbm90IHVzaW5nIGdlbSBh
bmQgd2UgZG9uJ3Qgd2FudCB0byBjYXJyeSB0aGF0IGV4dHJhIHBheWxvYWQgCmluIHRoZSBidWZm
ZXIgb2JqZWN0LgozKSBUVE0gaGlzdG9yaWNhbGx5IGhhc24ndCBiZWVuIHVzaW5nIHRoZSB2YXJp
b3VzIGRybSBsYXllcnMgZXhjZXB0IGZvciAKbGF0ZXIgd2hlbiBjb21tb24gaGVscGVycyBoYXZl
IGJlZW4gdXNlZCwgKGxpa2UgdGhlIHZtYSBtYW5hZ2VyIGFuZCB0aGUgCmNhY2hlIHV0aWxpdGll
cykuIEl0J3MgZGVzaXJhYmxlIHRvIGtlZXAgdGhhdCBsYXllciBkaXN0aW5jdGlvbi4gKHdoaWNo
IAppcyByZWFsbHkgd2hhdCBJJ20gc2F5aW5nIGluIDEuKQoKTm93IGlmIG1vcmUgYW5kIG1vcmUg
ZnVuY3Rpb25hbGl0eSB0aGF0IG9yaWdpbmF0ZWQgaW4gVFRNIGlzIG1vdmluZyBpbnRvIApHRU0g
d2UgbmVlZCB0byBmaW5kIGEgYmV0dGVyIHdheSB0byBkbyB0aGF0IHdpdGhvdXQgZHVwbGljYXRp
bmcgCmZ1bmN0aW9uYWxpdHkuIEkgc3VnZ2VzdCBhZGRpbmcgcG9pbnRlcnMgaW4gdGhlIFRUTSBz
dHJ1Y3RzIGFuZCAKZGVmYXVsdGluZyB0aG9zZSBwb2ludGVycyB0byB0aGUgbWVtYmVyIGluIHRo
ZSBUVE0gc3RydWN0LiBPcHRpb25hbGx5IHRvIAp0byB0aGUgbWVtYmVyIGluIHRoZSBHRU0gc3Ry
dWN0LiBJZiB3ZSBuZWVkIHRvIG1pZ3JhdGUgdGhvc2UgbWVtYmVycyBvdXQgCm9mIHRoZSBUVE0g
c3RydWN0LCB2bXdnZnggd291bGQgaGF2ZSB0byBwcm92aWRlIHRoZW0gaW4gaXRzIG93biBidWZm
ZXIgCmNsYXNzLgoKTkFLIGZyb20gdGhlIHZtd2dmeCBzaWRlLgoKVGhhbmtzLApUaG9hbXMKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
