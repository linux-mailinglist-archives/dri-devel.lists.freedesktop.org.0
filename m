Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5CEFDB39
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 11:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D716E406;
	Fri, 15 Nov 2019 10:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0906F6E174;
 Fri, 15 Nov 2019 09:04:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 41360AC44;
 Fri, 15 Nov 2019 09:04:25 +0000 (UTC)
Date: Fri, 15 Nov 2019 10:04:21 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/amdgpu/dm: Do not throw an error for a display with
 no audio
Message-ID: <20191115100421.22fe2c1a@endymion>
In-Reply-To: <20191114204413.457504-1-chris@chris-wilson.co.uk>
References: <20191114204413.457504-1-chris@chris-wilson.co.uk>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 Nov 2019 10:23:15 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXMsCgpPbiBUaHUsIDE0IE5vdiAyMDE5IDIwOjQ0OjEzICswMDAwLCBDaHJpcyBXaWxz
b24gd3JvdGU6Cj4gQW4gb2xkIGRpc3BsYXkgd2l0aCBubyBhdWRpbyBtYXkgbm90IGhhdmUgYW4g
RURJRCB3aXRoIGEgQ0VBIGJsb2NrLCBvcgo+IGl0IG1heSBzaW1wbHkgYmUgdG9vIG9sZCB0byBz
dXBwb3J0IGF1ZGlvLiBUaGlzIGlzIG5vdCBhIGRyaXZlciBlcnJvciwKPiBzbyBkb24ndCBmbGFn
IGl0IGFzIHN1Y2guCj4gCj4gQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcv
c2hvd19idWcuY2dpP2lkPTExMjE0MAo+IFJlZmVyZW5jZXM6IGFlMmEzNDk1OTczZSAoImRybS9h
bWQ6IGJlIHF1aWV0IHdoZW4gbm8gU0FEIGJsb2NrIGlzIGZvdW5kIikKPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogSGFycnkgV2Vu
dGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IEplYW4gRGVsdmFyZSA8amRlbHZh
cmVAc3VzZS5kZT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bV9oZWxwZXJzLmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9oZWxwZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9oZWxwZXJzLmMKPiBpbmRleCAxMWU1Nzg0YWE2MmEuLjA0ODA4ZGJlY2FiMyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bV9oZWxwZXJzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9oZWxwZXJzLmMKPiBAQCAtOTcsOCArOTcsNiBAQCBlbnVtIGRjX2VkaWRfc3Rh
dHVzIGRtX2hlbHBlcnNfcGFyc2VfZWRpZF9jYXBzKAo+ICAJCQkoc3RydWN0IGVkaWQgKikgZWRp
ZC0+cmF3X2VkaWQpOwo+ICAKPiAgCXNhZF9jb3VudCA9IGRybV9lZGlkX3RvX3NhZCgoc3RydWN0
IGVkaWQgKikgZWRpZC0+cmF3X2VkaWQsICZzYWRzKTsKPiAtCWlmIChzYWRfY291bnQgPCAwKQo+
IC0JCURSTV9FUlJPUigiQ291bGRuJ3QgcmVhZCBTQURzOiAlZFxuIiwgc2FkX2NvdW50KTsKPiAg
CWlmIChzYWRfY291bnQgPD0gMCkKPiAgCQlyZXR1cm4gcmVzdWx0Owo+ICAKCkkgc3RpbGwgYmVs
aWV2ZSB0aGF0IG15IGFwcHJvYWNoIHdhcyBhIGJldHRlciB3YXkgdG8gc29sdmUgdGhpcyBwcm9i
bGVtOgoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMyOTA2Ni8KCllv
dXIgYXBwcm9hY2ggd291bGQgaGF2ZSB0byBiZSBhcHBsaWVkIHRvIGFsbCBpbmRpdmlkdWFsIGRy
aXZlcnMgKGFsbApjYWxsZXJzIG9mIGRybV9lZGlkX3RvX3NhZCkuIEl0IGFsc28gcHJldmVudHMg
cmVwb3J0aW5nIGFjdHVhbCBlcnJvcnMuCgpTaG91bGQgSSByZXNlbmQgbXkgcGF0Y2g/CgotLSAK
SmVhbiBEZWx2YXJlClNVU0UgTDMgU3VwcG9ydApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
