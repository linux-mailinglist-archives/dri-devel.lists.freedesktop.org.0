Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E00602E9FA1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 22:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B3D89FD7;
	Mon,  4 Jan 2021 21:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A58897D7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 21:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609796735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xcn91ZfGGJoK8HSfx41h+zZbHqXiX3/eZUS1JJ2o7LE=;
 b=St2FmmB12oIZm7SbXAKiNQxRC0jP1b/MoQ4SKThptu83L7pzRGGMyknQHRuTKlSfow7cho
 xZ9FYGIqz6/bYACA0bBJek+dKncL0K7x/XD+P99pa8Tj/Sf2OHwflkO6glvt/EA54HeSpO
 GAhpD4vQYFL81shvaAIkfqNP9JQQWp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-BDRgygg7POOCAuLC2l1O-A-1; Mon, 04 Jan 2021 16:45:30 -0500
X-MC-Unique: BDRgygg7POOCAuLC2l1O-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92ED318C8C00;
 Mon,  4 Jan 2021 21:45:28 +0000 (UTC)
Received: from omen.home (ovpn-112-183.phx2.redhat.com [10.3.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E674260BE5;
 Mon,  4 Jan 2021 21:45:27 +0000 (UTC)
Date: Mon, 4 Jan 2021 14:45:27 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: Couple of issues with amdgpu on my WX4100
Message-ID: <20210104144527.53b59786@omen.home>
In-Reply-To: <158aa1bf-cff5-d3ce-758f-3afcd4a15cae@amd.com>
References: <4df8585ab0aac5abb1e9502d1d7cc49daa2a464f.camel@redhat.com>
 <83f4291c-abe4-2995-b4ba-9f84c9235d14@amd.com>
 <20210104094547.06a61444@omen.home>
 <ea539e21-aed3-8f23-74b2-5a214fa9fdb2@amd.com>
 <20210104114335.3f87ff27@omen.home>
 <158aa1bf-cff5-d3ce-758f-3afcd4a15cae@amd.com>
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

T24gTW9uLCA0IEphbiAyMDIxIDIxOjEzOjUzICswMTAwCkNocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cgo+IEFtIDA0LjAxLjIxIHVtIDE5OjQzIHNjaHJp
ZWIgQWxleCBXaWxsaWFtc29uOgo+ID4gT24gTW9uLCA0IEphbiAyMDIxIDE4OjM5OjMzICswMTAw
Cj4gPiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+
ID4gIAo+ID4+IEFtIDA0LjAxLjIxIHVtIDE3OjQ1IHNjaHJpZWIgQWxleCBXaWxsaWFtc29uOiAg
Cj4gPj4+IE9uIE1vbiwgNCBKYW4gMjAyMSAxMjozNDozNCArMDEwMAo+ID4+PiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4+PiAgIAo+ID4+PiBb
U05JUF0gIAo+ID4+IFRoYXQncyBhIHJhdGhlciBiYWQgaWRlYS4gU2VlIG91ciBHUFVzIGZvciBl
eGFtcGxlIHJldHVybiB3YXkgbW9yZSB0aGFuCj4gPj4gdGhleSBhY3R1YWxseSBuZWVkLgo+ID4+
Cj4gPj4gRS5nLiBhIFBvbGFyaXMgdXN1YWxseSByZXR1cm5zIDRHaUIgZXZlbiB3aGVuIG9ubHkg
MkdpQiBhcmUgaW5zdGFsbGVkLAo+ID4+IGJlY2F1c2UgNEdpQiBpcyBqdXN0IHRoZSBtYXhpbXVt
IGFtb3VudCBvZiBSQU0geW91IGNhbiBwdXQgdG9nZXRoZXIgd2l0aAo+ID4+IHRoZSBBU0lDIG9u
IGEgYm9hcmQuICAKPiA+IFdvdWxkIHRoZSBkcml2ZXIgZmFpbCBvciBtaXNiZWhhdmUgaWYgdGhl
IEJBUiBpcyBzaXplZCBsYXJnZXIgdGhhbiB0aGUKPiA+IGFtb3VudCBvZiBtZW1vcnkgb24gdGhl
IGNhcmQgb3IgaXMgbWVtb3J5IHNpemUgZGV0ZXJtaW5lZCBpbmRlcGVuZGVudGx5Cj4gPiBvZiBC
QVIgc2l6ZT8gIAo+IAo+IFVmZiwgZ29vZCBxdWVzdGlvbi4gSSBoYXZlIG5vIGlkZWEuCj4gCj4g
QXQgbGVhc3QgdGhlIExpbnV4IGRyaXZlciBzaG91bGQgYmVoYXZlIHdlbGwsIGJ1dCBubyBpZGVh
IGFib3V0IHRoZSAKPiBXaW5kb3dzIGRyaXZlciBzdGFjay4KPiAKPiA+PiBTb21lIGRldmljZXMg
ZXZlbiByZXR1cm4gYSBtYXNrIG9mIGFsbCAxIGV2ZW4gd2hlbiB0aGV5IG5lZWQgb25seSAyTWlC
LAo+ID4+IHJlc3VsdGluZyBpbiBuZWFybHkgMVRpQiBvZiB3YXN0ZWQgYWRkcmVzcyBzcGFjZSB3
aXRoIHRoaXMgYXBwcm9hY2guICAKPiA+IFVnaC4gIEknbSBhZnJhaWQgdG8gYXNrIHdoeSBhIGRl
dmljZSB3aXRoIGEgMk1pQiBCQVIgd291bGQgaW1wbGVtZW50IGEKPiA+IFJFQkFSIGNhcGFiaWxp
dHksIGJ1dCBJIGd1ZXNzIHdlIHJlYWxseSBjYW4ndCBtYWtlIGFueSBhc3N1bXB0aW9ucwo+ID4g
YWJvdXQgdGhlIGJyZWFkdGggb2YgU0tVcyB0aGF0IEFTSUMgbWlnaHQgc3VwcG9ydCAob3Igc2Fu
aXR5IG9mIHRoZQo+ID4gZGVzaWduZXJzKS4gIAo+IAo+IEl0J3MgYSBzdGFuZGFyZCBmZWF0dXJl
IGZvciBGUEdBcyB0aGVzZSBkYXlzIHNpbmNlIGhvdyBtdWNoIEJBUiB5b3UgbmVlZCAKPiBkZXBl
bmRzIG9uIHdoYXQgeW91IGxvYWQgb24gaXQsIGFuZCB0aGF0IGluIHR1cm4gdXN1YWxseSBvbmx5
IGhhcHBlbnMgCj4gYWZ0ZXIgdGhlIE9TIGlzIGFscmVhZHkgc3RhcnRlZCBhbmQgeW91IGZpcmUg
dXAgeW91ciBkZXZlbG9wbWVudCAKPiBlbnZpcm9ubWVudC4KPiAKPiA+IFdlIGNvdWxkIHByb2Jl
IHRvIGRldGVybWluZSB0aGUgbWF4aW11bSBzaXplIHRoZSBob3N0IGNhbiBzdXBwb3J0IGFuZAo+
ID4gcG90ZW50aWFsbHkgZW11bGF0ZSB0aGUgY2FwYWJpbGl0eSB0byByZW1vdmUgc2l6ZXMgdGhh
dCB3ZSBjYW4ndAo+ID4gYWxsb2NhdGUsIGJ1dCB3aXRob3V0IGFueSBhYmlsaXR5IGZvciB0aGUg
ZGV2aWNlIHRvIHJlamVjdCBhIHNpemUKPiA+IGFkdmVydGlzZWQgYXMgc3VwcG9ydGVkIHZpYSB0
aGUgY2FwYWJpbGl0eSBwcm90b2NvbCBpdCBtYWtlcyBtZSBuZXJ2b3VzCj4gPiBob3cgd2UgY2Fu
IGd1YXJhbnRlZSB0aGUgcmVzb3VyY2VzIGFyZSBhdmFpbGFibGUgd2hlbiB0aGUgdXNlcgo+ID4g
cmUtY29uZmlndXJlcyB0aGUgZGV2aWNlLiAgVGhhdCBtaWdodCBtZWFuIHdlJ2QgbmVlZCB0byBy
ZXNlcnZlIHRoZQo+ID4gcmVzb3VyY2VzLCB1cCB0byB3aGF0IHRoZSBob3N0IGNhbiBzdXBwb3J0
LCByZWdhcmRsZXNzIG9mIHdoYXQgdGhlCj4gPiBkZXZpY2UgY2FuIGFjdHVhbGx5IHVzZS4gIEkn
bSBub3Qgc3VyZSBob3cgZWxzZSB0byBrbm93IGhvdyBtdWNoIHRvCj4gPiByZXNlcnZlIHdpdGhv
dXQgZGV2aWNlIHNwZWNpZmljIGNvZGUgaW4gdmZpby1wY2kuICBUaGFua3MsICAKPiAKPiBXZWxs
IGluIHRoZSBGUEdBIGNhc2UgSSBvdXRsaW5lZCBhYm92ZSB5b3UgZG9uJ3QgcmVhbGx5IGtub3cg
aG93IG11Y2ggCj4gQkFSIHlvdSBuZWVkIHVudGlsIHRoZSBzZXR1cCBpcyBjb21wbGV0ZWQuCj4g
Cj4gRS5nLiB5b3UgY291bGQgbmVlZCBvbmUgQkFSIHdpdGgganVzdCAyTWlCIGFuZCBhbm90aGVy
IHdpdGggMTI4R0IsIG9yIAo+IHR3byB3aXRoIDY0R0Igb3IuLi4uIFRoYXQncyB0aGUgcmVhc29u
IHdoeSBzb21lYm9keSBjYW1lIHVwIHdpdGggdGhlIAo+IFJFQkFSIHN0YW5kYXJkIGluIHRoZSBm
aXJzdCBwbGFjZS4KClllcywgSSBzdXBwb3NlIHdpdGhvdXQgYSBmdWxsIGJ1cy1yZXNldCBhbmQg
c29mdC1ob3RwbHVnIGV2ZW50LApyZXNpemFibGUgQkFScyBhcmUgdGhlIGJlc3Qgd2F5IHRvIHJl
Y29uZmlndXJlIGEgZGV2aWNlIGJhc2VkIG9uIEZQR0EKcHJvZ3JhbW1pbmcuICBBbnl3YXksIHRo
YW5rcyBmb3IgdGhlIGluc2lnaHRzIGhlcmUuCgo+IEkgdGhpbmsgSSBjYW4gc3VtbWFyaXplIHRo
YXQgc3RhdGljIHJlc2l6aW5nIG1pZ2h0IHdvcmsgZm9yIHNvbWUgZGV2aWNlcyAKPiBsaWtlIG91
ciBHUFVzLCBidXQgaXQgZG9lc24ndCBzb2x2ZSB0aGUgcHJvYmxlbSBpbiBnZW5lcmFsLgoKWXVw
LCBJIGRvbid0IGhhdmUgYSBnb29kIGFwcHJvYWNoIGZvciB0aGUgZ2VuZXJhbCBjYXNlIGZvciBh
IFZNIHlldC4gIFdlCmNvdWxkIGFkZCBhIHN5c2ZzIG9yIHNpZGUgY2hhbm5lbCBtZWNoYW5pc20g
dG8gcHJlY29uZmlndXJlIGEgQkFSIHNpemUsCmJ1dCBvbmNlIHdlJ3JlIGRlYWxpbmcgd2l0aCBh
IFZNIGludGVyYWN0aW5nIHdpdGggdGhlIFJFQkFSIGNhcGFiaWxpdHkKaXRzZWxmLCBpdCdzIGZh
ciB0b28gZWFzeSBmb3IgdGhlIGd1ZXN0IHRvIGNyZWF0ZSBhIGNvbmZpZ3VyYXRpb24gdGhhdAp0
aGUgaG9zdCBtaWdodCBub3QgaGF2ZSBidXMgcmVzb3VyY2VzIHRvIHN1cHBvcnQsIGVzcGVjaWFs
bHkgaWYgdGhlcmUKYXJlIG11bHRpcGxlIHJlc2l6YWJsZSBCQVJzIHVuZGVyIGEgYnJpZGdlLiAg
VGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
