Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 754BA2E9B41
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 17:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC7589F53;
	Mon,  4 Jan 2021 16:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A8689F53
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609778753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5A588aZGpfVy5zsSnCSRhs6l4RkKAapxTpg6TKoXyU=;
 b=g4dRS4TrcwOtKPsq+Gs9mcA4/Q7gqNSFtDcEfBEYUfwMwP6EcUAy2HHcHrCYNqSo4MgSi8
 W15HnOhMr1r8iuO8SDhI3VwHvzRz9bn1UaklRYMbTADnMKawRrmI1Gu+rDPly0AnOUjWlf
 11g5Uv4E7IQbIhg2kmYT1sbdHKgJWbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-B9UpKEz6Nk-h34HrwGlTSg-1; Mon, 04 Jan 2021 11:45:49 -0500
X-MC-Unique: B9UpKEz6Nk-h34HrwGlTSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DA25107ACE4;
 Mon,  4 Jan 2021 16:45:48 +0000 (UTC)
Received: from omen.home (ovpn-112-183.phx2.redhat.com [10.3.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF99D60BFA;
 Mon,  4 Jan 2021 16:45:47 +0000 (UTC)
Date: Mon, 4 Jan 2021 09:45:47 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: Couple of issues with amdgpu on my WX4100
Message-ID: <20210104094547.06a61444@omen.home>
In-Reply-To: <83f4291c-abe4-2995-b4ba-9f84c9235d14@amd.com>
References: <4df8585ab0aac5abb1e9502d1d7cc49daa2a464f.camel@redhat.com>
 <83f4291c-abe4-2995-b4ba-9f84c9235d14@amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA0IEphbiAyMDIxIDEyOjM0OjM0ICswMTAwCkNocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cgo+IEhpIE1heGltLAo+IAo+IEkgY2FuJ3QgaGVs
cCB3aXRoIHRoZSBkaXNwbGF5IHJlbGF0ZWQgc3R1ZmYuIFByb2JhYmx5IGJlc3QgYXBwcm9hY2gg
dG8gCj4gZ2V0IHRoaXMgZml4ZXMgd291bGQgYmUgdG8gb3BlbiB1cCBhIGJ1ZyB0cmFja2VyIGZv
ciB0aGlzIG9uIEZETy4KPiAKPiBCdXQgSSdtIHRoZSBvbmUgd2hvIGltcGxlbWVudGVkIHRoZSBy
ZXNpemVhYmxlIEJBUiBzdXBwb3J0IGFuZCB5b3VyIAo+IGFuYWx5c2lzIG9mIHRoZSBwcm9ibGVt
IHNvdW5kcyBhYm91dCBjb3JyZWN0IHRvIG1lLgo+IAo+IFRoZSByZWFzb24gd2h5IHRoaXMgd29y
a3Mgb24gTGludXggaXMgbW9zdCBsaWtlbHkgYmVjYXVzZSB3ZSByZXN0b3JlIHRoZSAKPiBCQVIg
c2l6ZSBvbiByZXN1bWUgKGFuZCBtYXliZSBkdXJpbmcgaW5pdGlhbCBib290IGFzIHdlbGwpLgo+
IAo+IFNlZSB0aGlzIHBhdGNoIGZvciByZWZlcmVuY2U6Cj4gCj4gY29tbWl0IGQzMjUyYWNlMGJj
NjUyYTFhMjQ0NDU1NTU2YjZhNTQ5Zjk2OWJmOTkKPiBBdXRob3I6IENocmlzdGlhbiBLw7ZuaWcg
PGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPgo+IERhdGU6wqDCoCBGcmkgSnVuIDI5
IDE5OjU0OjU1IDIwMTggLTA1MDAKPiAKPiAgwqDCoMKgIFBDSTogUmVzdG9yZSByZXNpemVkIEJB
UiBzdGF0ZSBvbiByZXN1bWUKPiAKPiAgwqDCoMKgIFJlc2l6ZSBCQVJzIGFmdGVyIHJlc3VtZSB0
byB0aGUgZXhwZWN0ZWQgc2l6ZSBhZ2Fpbi4KPiAKPiAgwqDCoMKgIEJ1Z0xpbms6IGh0dHBzOi8v
YnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTk5OTU5Cj4gIMKgwqDCoCBGaXhl
czogZDY4OTVhZDM5ZjNiICgiZHJtL2FtZGdwdTogcmVzaXplIFZSQU0gQkFSIGZvciBDUFUgYWNj
ZXNzIHY2IikKPiAgwqDCoMKgIEZpeGVzOiAyNzZiNzM4ZGViNWIgKCJQQ0k6IEFkZCByZXNpemFi
bGUgQkFSIGluZnJhc3RydWN0dXJlIikKPiAgwqDCoMKgIFNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAgwqDCoMKgIFNpZ25lZC1vZmYt
Ynk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4gIMKgwqDCoCBDQzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZ8KgwqDCoMKgwqAgIyB2NC4xNSsKPiAKPiAKPiBJdCBzaG91bGQg
YmUgdHJpdmlhbCB0byBhZGQgdGhpcyB0byB0aGUgcmVzZXQgbW9kdWxlIGFzIHdlbGwuIE1vc3Qg
Cj4gbGlrZWx5IGV2ZW4gY29tcGxldGVseSB2ZW5kb3IgaW5kZXBlbmRlbnQgc2luY2UgSSdtIG5v
dCBzdXJlIHdoYXQgYSBidXMgCj4gcmVzZXQgd2lsbCBkbyB0byB0aGlzIGNvbmZpZ3VyYXRpb24g
YW5kIHJlc3RvcmluZyBpdCBhbGwgdGhlIHRpbWUgc2hvdWxkIAo+IGJlIHRoZSBtb3N0IGRlZmVu
c2l2ZSBhcHByb2FjaC4KCkhtbSwgdGhpcyBzaG91bGQgYWxyZWFkeSBiZSB1c2VkIGJ5IHRoZSBi
dXMvc2xvdCByZXNldCBwYXRoOgoKcGNpX2J1c19yZXN0b3JlX2xvY2tlZCgpL3BjaV9zbG90X3Jl
c3RvcmVfbG9ja2VkKCkKIHBjaV9kZXZfcmVzdG9yZSgpCiAgcGNpX3Jlc3RvcmVfc3RhdGUoKQog
ICBwY2lfcmVzdG9yZV9yZWJhcl9zdGF0ZSgpCgpWRklPIHN1cHBvcnQgZm9yIHJlc2l6ZWFibGUg
QkFScyBoYXMgYmVlbiBvbiBteSB0b2RvIGxpc3QsIGJ1dCBJIGRvbid0CmhhdmUgYWNjZXNzIHRv
IGFueSBzeXN0ZW1zIHRoYXQgaGF2ZSBib3RoIGEgY2FwYWJsZSBkZXZpY2UgYW5kID40RwpkZWNv
ZGluZyBlbmFibGVkIGluIHRoZSBCSU9TLiAgSWYgd2UgaGF2ZSBhIGNvbnNpc3RlbnQgdmlldyBv
ZiB0aGUgQkFSCnNpemUgYWZ0ZXIgdGhlIEJBUnMgYXJlIGV4cGFuZGVkLCBJJ20gbm90IHN1cmUg
d2h5IGl0IGRvZXNuJ3QganVzdAp3b3JrLiAgRldJVywgUUVNVSBjdXJyZW50bHkgaGlkZXMgdGhl
IFJFQkFSIGNhcGFiaWxpdHkgdG8gdGhlIGd1ZXN0CmJlY2F1c2UgdGhlIGtlcm5lbCBkcml2ZXIg
ZG9lc24ndCBzdXBwb3J0IGVtdWxhdGlvbiB0aHJvdWdoIGNvbmZpZwpzcGFjZSAoaWUuIGl0J3Mg
cmVhZC1vbmx5LCB3aGljaCB0aGUgc3BlYyBkb2Vzbid0IHN1cHBvcnQpLgoKQUlVSSwgcmVzb3Vy
Y2UgYWxsb2NhdGlvbiBjYW4gZmFpbCB3aGVuIGVuYWJsaW5nIFJFQkFSIHN1cHBvcnQsIHdoaWNo
CmlzIGEgcHJvYmxlbSBpZiB0aGUgZmFpbHVyZSBvY2N1cnMgb24gdGhlIGhvc3QgYnV0IG5vdCB0
aGUgZ3Vlc3Qgc2luY2UKd2UgaGF2ZSBubyBtZWFucyB2aWEgdGhlIGhhcmR3YXJlIHByb3RvY29s
IHRvIGV4cG9zZSBzdWNoIGEgY29uZGl0aW9uLgpUaGVyZWZvcmUgdGhlIG1vZGVsIEkgd2FzIGNv
bnNpZGVyaW5nIGZvciB2ZmlvLXBjaSB3b3VsZCBiZSB0byBzaW1wbHkKcHJlLWVuYWJsZSBSRUJB
UiBhdCB0aGUgbWF4IHNpemUuICBJdCBtaWdodCBiZSBzdWZmaWNpZW50bHkgc2FmZSB0bwp0ZXN0
IEJBUiBleHBhbnNpb24gb24gaW5pdGlhbGl6YXRpb24gYW5kIHRoZW4gYWxsb3cgdXNlciBjb250
cm9sLCBidXQKSSdtIGNvbmNlcm5lZCB0aGF0IHJlc291cmNlIGF2YWlsYWJpbGl0eSBjb3VsZCBj
aGFuZ2Ugd2hpbGUgYWxyZWFkeSBpbgp1c2UgYnkgdGhlIHVzZXIuICBUaGFua3MsCgpBbGV4Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
