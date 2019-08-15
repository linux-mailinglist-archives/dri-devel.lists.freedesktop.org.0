Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A18EB0A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 14:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10076E2E4;
	Thu, 15 Aug 2019 12:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D866E2E4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 12:07:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 7589028A017
Message-ID: <ea4f6c860d9dc60504d81c00350cabb7effab496.camel@collabora.com>
Subject: Re: [PATCH libdrm 1/2] modetest: Fix segmentation fault
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Thu, 15 Aug 2019 09:07:23 -0300
In-Reply-To: <20190722160823.26668-1-ezequiel@collabora.com>
References: <20190722160823.26668-1-ezequiel@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Cc: rohan.garg@collabora.com, Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA3LTIyIGF0IDEzOjA4IC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6
Cj4gV2hlbiBhIG1vZGUgaXMgc2V0IHdpdGgganVzdCBhIGNvbm5lY3RvciAiLXMgZm9vIiwKPiB3
ZSBnZXQgYSBuYXN0eSBzZWdtZW50YXRpb24gZmF1bHQuIEZpeCBpdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+CgpUaGVyZSdzIG5v
IHJ1c2gsIGJ1dCBzdGlsbCwgaGVyZSBnb2VzIGEgcmVtaW5kZXIKb2YgdGhpcyBhbmQgdGhlIG5l
eHQgcGF0Y2guIDotKQoKPiAtLS0KPiAgdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYyB8IDIgKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0
cy9tb2RldGVzdC9tb2RldGVzdC5jIGIvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYwo+IGluZGV4
IGU2NmJlNjYwN2UwMC4uNWU2MjgxMjdhMTMwIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL21vZGV0ZXN0
L21vZGV0ZXN0LmMKPiArKysgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCj4gQEAgLTE2OTUs
NiArMTY5NSw4IEBAIHN0YXRpYyBpbnQgcGFyc2VfY29ubmVjdG9yKHN0cnVjdCBwaXBlX2FyZyAq
cGlwZSwgY29uc3QgY2hhciAqYXJnKQo+ICAJCXJldHVybiAtMTsKPiAgCj4gIAkvKiBQYXJzZSB0
aGUgcmVtYWluaW5nIHBhcmFtZXRlcnMuICovCj4gKwlpZiAoIWVuZHApCj4gKwkJcmV0dXJuIC0x
Owo+ICAJaWYgKCplbmRwID09ICdAJykgewo+ICAJCWFyZyA9IGVuZHAgKyAxOwo+ICAJCXBpcGUt
PmNydGNfaWQgPSBzdHJ0b3VsKGFyZywgJmVuZHAsIDEwKTsKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
