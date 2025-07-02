Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CC8AF0B8B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 08:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718DC10E301;
	Wed,  2 Jul 2025 06:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="udXL9j1a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E3C10E301;
 Wed,  2 Jul 2025 06:21:56 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bX8tn3B83z9ssQ;
 Wed,  2 Jul 2025 08:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751437313; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ob91oO3Vo7GCUPhrbw641VDdmlJ1ZGqyGVAcVQVYpLk=;
 b=udXL9j1aIsSa1HOw2caxw6IFIpEQqn/HFoTLxJ3Pu9llaSGRw4Q9Wl3yjbGdEdhwgUotGe
 0UjIFPPxm057R6AqntPUw67R5P03iHDTYqwifCNNO7qBXBo/31RK5RkVGib7d86hkcMkbr
 sRPkfmuOpD5Lrg4eSeQ9wyQt0pZRNpH300AqUh6EosRJkxwPmuNHw+yQYWvXDrFUb5h26n
 bXipsEITzSbBoXj704jaBozfQ3ewTjaiLI36jpuBktO9apE5lbnLZTdpNQDNuM1Ievp5a8
 lEivl6nSHO6Gh+/1j7vhM6TfMKDXbLScDlUpnfI9rOcmnxWTOESvFVgoSaI/Jw==
Message-ID: <b1c87f95832a27c4435a24223ac5a715cbdd38c2.camel@mailbox.org>
Subject: Re: [PATCH v9 0/4] Enable debugfs information based on client-id
From: Philipp Stanner <phasta@mailbox.org>
To: Sunil Khatri <sunil.khatri@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de, 
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org, 
 linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>, Jeff Hugo
 <jeff.hugo@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 08:21:48 +0200
In-Reply-To: <20250701164948.8105-1-sunil.khatri@amd.com>
References: <20250701164948.8105-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MBO-RS-ID: b21141670de3f8496bd
X-MBO-RS-META: 4ekzzj8jcxr3eiod1bq13zcb77u8gggq
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDI1LTA3LTAxIGF0IDIyOjE5ICswNTMwLCBTdW5pbCBLaGF0cmkgd3JvdGU6Cj4g
Y2xpZW50LWlkIGlzIGEgdW5pcXVlIGlkIGFjcm9zcyB0aGUgc3lzdGVtIG5vIG1hdHRlciBpZiBp
dHMgZnJvbSBhIFZNCj4gb3Igb24gYSBob3N0IHN5c3RlbS4gVGhpcyB1bmlxdWUgaWQgaXMgYSBn
b29kIGJhc2UgdG8gdXNlIGNyZWF0ZQo+IGNsaWVudC1pZCBiYXNlZCBkZW50cnkgaW4gZGVidWdm
cyBpbiB0aGUgcm9vdCBkaXJlY3RvcnkuCj4gCj4gVGhpcyBkaXJlY3RvcnkgY291bGQgYmUgYSB1
bmlxdWUgZGlyZWN0b3J5IHdoZXJlIGRyaXZlcnMgY291bGQgZHVtcAo+IHRoZSBkZWJ1ZyBpbmZv
cm1hdGlvbi4KPiAKPiBGb3IgYW1kZ3B1IGRyaXZlciwgd2Ugd2FudCB0byBkdW1wIHRoZSBWTSBQ
VEJBU0UgYWRkcmVzcyBhbmQgTVFEIGZvciAKPiB1c2VycXVldWUgd2hpY2ggY2FuIGJlIHVzZWQg
YnkgYSB0b29sIGxpa2UgYW1kIHVtciB0byBkdW1wIHRoZSBtZW1vcnkKPiBhbmQgdGhhdCBpcyBy
ZWFsbHkgaW1wb3J0YW50IHRvIGRlYnVnIHVzZXJxdWV1ZXMgYW5kIFZNIHJlbGF0ZWQKPiBpc3N1
ZXMuCj4gCj4gT25lIG9mIHRoZSBjaGFsbGVuZ2UgaW4gdGhpcyBob3cgdG8gYWNjZXNzIHRoZSBy
b290IGRpcmVjdG9yeSB3aGljaAo+IGlzCj4gYmV5b25kIHRoZSBkcm1fZGV2aWNlIGhlbmNlIG1v
dmluZyB0aGUgZGVidWdmcyByZWxhdGVkIGluZm9ybWF0aW9uIHRvCj4gZHJtX2RlYnVnZnMuYyAK
PiAKPiBTdW5pbCBLaGF0cmkgKDQpOgo+IMKgIGRybTogbW92ZSBkcm0gYmFzZWQgZGVidWdmcyBm
dW5jcyB0byBkcm1fZGVidWdmcy5jCj4gwqAgZHJtOiBhZGQgZGVidWdmcyBzdXBwb3J0IG9uIHBl
ciBjbGllbnQtaWQgYmFzaXMKPiDCoCBkcm0vYW1kZ3B1OiBhZGQgZGVidWdmcyBzdXBwb3J0IGZv
ciBWTSBwYWdldGFibGUgcGVyIGNsaWVudAo+IMKgIGRybS9hbWRncHU6IGFkZCBzdXBwb3J0IG9m
IGRlYnVnZnMgZm9yIG1xZCBpbmZvcm1hdGlvbgoKSGksCgpwbGVhc2Ugd2FpdCA+MjRoIGJlZm9y
ZSBzZW5kaW5nIG5ldyB2ZXJzaW9ucyBvZiBhIHNlcmllcywgc28gdGhhdCBtb3JlCnBlb3BsZSBj
YW4gb3B0IGluIGFuZCB0cmFmZmljIG9uIHRoZSBsaXN0cyBnZXRzIHJlZHVjZWQKClRoeAoKCj4g
Cj4gwqBkcml2ZXJzL2FjY2VsL2RybV9hY2NlbC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAxNiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZWJ1Z2ZzLmMgfMKgIDUyICsrKysrKysrKwo+IMKgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RlYnVnZnMuaCB8wqDCoCAxICsKPiDCoGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9rbXMuY8KgwqDCoMKgIHzCoMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV91c2VycS5jwqDCoCB8wqAgNTIgKysrKysrKysrCj4gwqBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXNlcnEuaMKgwqAgfMKgwqAgMSArCj4gwqBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uY8KgwqDCoMKgwqAgfMKgwqAgNCArLQo+
IMKgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmjCoMKgwqDCoMKgIHzCoMKg
IDQgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDExMwo+ICsrKysrKysrKysrKysrKysrKy0tCj4gwqBkcml2ZXJzL2dwdS9k
cm0vZHJtX2Rydi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNCAr
LS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoCA5ICsrCj4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2ICstCj4gwqBpbmNsdWRlL2RybS9kcm1f
YWNjZWwuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSAt
Cj4gwqBpbmNsdWRlL2RybS9kcm1fZGVidWdmcy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAxMSArKwo+IMKgaW5jbHVkZS9kcm0vZHJtX2Rydi5owqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDE0ICsrLQo+IMKgaW5jbHVkZS9k
cm0vZHJtX2ZpbGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCA3ICsrCj4gwqAxNiBmaWxlcyBjaGFuZ2VkLCAyNjUgaW5zZXJ0aW9ucygrKSwgNDYgZGVs
ZXRpb25zKC0pCj4gCgo=

