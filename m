Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0947D59A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 08:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6D96E373;
	Thu,  1 Aug 2019 06:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6743A6E373
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 06:40:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 005543C919;
 Thu,  1 Aug 2019 06:40:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-54.ams2.redhat.com
 [10.36.116.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCF075D6A7;
 Thu,  1 Aug 2019 06:40:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7FFAA16E1A; Thu,  1 Aug 2019 08:40:23 +0200 (CEST)
Date: Thu, 1 Aug 2019 08:40:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [RFC 2/6] udmabuf: add ability to set access flags on udmabuf
Message-ID: <20190801064023.sd3jxlg6aqls523g@sirius.home.kraxel.org>
References: <20190801022517.1903-1-gurchetansingh@chromium.org>
 <20190801022517.1903-3-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801022517.1903-3-gurchetansingh@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 01 Aug 2019 06:40:27 +0000 (UTC)
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

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDc6MjU6MTNQTSAtMDcwMCwgR3VyY2hldGFuIFNpbmdo
IHdyb3RlOgo+IFRoZSBtYWluIHVzZSBmb3IgdWRtYWJ1ZiBpcyBzZW5kaW5nIGd1ZXN0IG1lbW9y
eSBwYWdlcwo+IHRvIHRoZSBob3N0Lgo+IAo+IEl0J3MgZ2VuZXJhbGx5IGEgYmFkIGlkZWEgdG8g
aGF2ZSB0byBzZXBhcmF0ZSBtYXBwaW5ncyB3aXRoCj4gZGlmZmVyZW50IGF0dHJpYnV0ZXMuIEZv
ciBleGFtcGxlLCBhIFdDIG1hcHBpbmcgdGhlIGd1ZXN0Cj4ga2VybmVsIGFuZCBjYWNoZWQgbWFw
cGluZyBvbiB0aGUgaG9zdCBpcyBwcm9ibGVtYXRpYy4KPiAKPiBBZGQgY3JlYXRpb24gdGltZSBm
bGFncyBzbyB0aGUgdXNlciBoYXMgcmVzcG9uc2liaWxpdHkgZm9yCj4gdGhlIHNwZWNpZmljIHVz
ZSBjYXNlLgoKPiAtI2RlZmluZSBVRE1BQlVGX0ZMQUdTX0NMT0VYRUMJMHgwMQo+ICsjZGVmaW5l
IFVETUFCVUZfRkxBR1NfQ0xPRVhFQyAgICAweDAxCj4gKyNkZWZpbmUgVURNQUJVRl9GTEFHU19Q
Uk9UX05PTkUgIDB4MDIKPiArI2RlZmluZSBVRE1BQlVGX0ZMQUdTX1BST1RfUkVBRCAgMHgwNAo+
ICsjZGVmaW5lIFVETUFCVUZfRkxBR1NfUFJPVF9XUklURSAweDA4CgpbIGRpZG4ndCBsb29rIGF0
IGZvbGxvd3VwIHBhdGNoZXMgeWV0IF0KCllvdSBjYW4ndCBoYXZlIHJlYWRvbmx5L3dyaXRlb25s
eSBkbWFidWZzLgpTbyB0aGF0IGlzbid0IGdvaW5nIHRvIGZseS4KClRoZSBjb21taXQgbWVzc2Fn
ZSBzdWdnZXN0cyB0aGlzIGlzIGZvciBjYWNoZSBhdHRyaWJ1dGVzIG5vdCBwcm90ZWN0aW9uLApz
byBoYXZpbmcgdGhlIGZsYWdzIG1pZ2h0IG1ha2Ugc2Vuc2UsIGJ1dCBwbGVhc2UgZG9uJ3QgbmFt
ZSB0aGUgZmxhZ3MKUFJPVF8qIHRoZW4uCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
