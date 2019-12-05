Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B681F113CD6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 09:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4237F6F5C1;
	Thu,  5 Dec 2019 08:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34086F5C1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 08:10:49 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-Eji01YlRNaKAWZG8xqqDjg-1; Thu, 05 Dec 2019 03:10:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 085601005502;
 Thu,  5 Dec 2019 08:10:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 844D410013A1;
 Thu,  5 Dec 2019 08:10:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3EB2816E08; Thu,  5 Dec 2019 09:10:44 +0100 (CET)
Date: Thu, 5 Dec 2019 09:10:44 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/7] drm/ast: Fix modesetting's framebuffer usage
Message-ID: <20191205081044.oqrfwkigxrqlevpk@sirius.home.kraxel.org>
References: <20191202111557.15176-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191202111557.15176-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Eji01YlRNaKAWZG8xqqDjg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575533448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mby0XrJfXhiU7lNCBHGS9RRxQ74Yi+/7MQQWMoX/mcM=;
 b=Z4QQI+P1+rO/P66L4GFV1xAEk0ZG468REqmG/cWzGsenFXBQQLclCJyNwvBl3/J0UGx2R7
 jhlf6dmXfw9m15B2fSpHcQOhXM/ngmFTzlvQfVyUknDWZbrWZ4LrW+FRM5EHua2k2u+u9v
 rTlLBHeZu3JAlsbz9GjrzJQ+w5HXD4k=
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMTI6MTU6NTBQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gKHdhczogZHJtL2FzdDogRml4IHBvdGVudGlhbCBOVUxMLXBvaW50ZXIgcmVh
ZCBkdXJpbmcgYXRvbWljIG1vZGUgc2V0dGluZykKPiAKPiBUaGUgQ1JUQydzIG1vZGVzZXR0aW5n
IGNvZGUgaW4gYXN0IHJlcXVpcmVzIHRoZSBmb3JtYXQgb2YgdGhlIHByaW1hcnkKPiBwbGFuZSdz
IGZyYW1lYnVmZmVyLiBUaGVyZSdzIGN1cnJlbnRseSBhIHNlZ21lbnRhdGlvbiBmYXVsdCBpZiB0
aGUKPiBmcmFtZWJ1ZmZlciBpcyBzZXQgdG8gTlVMTC4gVGhpcyBoYXBwZW5zIHdoZW4gZGlzYWJs
aW5nIHRoZSBkaXNwbGF5Cj4gZHVyaW5nIHN1c3BlbmQuCj4gCj4gUGF0Y2ggMSBtb3ZlcyB0aGUg
bW9kZXNldHRpbmcgY29kZSBiZWhpbmQgYSB0ZXN0IGZvciB0aGUgZnJhbWVidWZmZXIKPiBpbiBh
dG9taWNfZmx1c2goKS4gSXQgcmV0dXJucyBpZiB0aGUgZnJhbWVidWZmZXIgaXMgTlVMTC4gVGhp
cyBmaXhlcwo+IHRoZSBzZWdtZW50YXRpb24gZmF1bHQgaW4gYSBzaW1wbGUgYW5kIGJhY2stcG9y
dGFibGUgd2F5Lgo+IAo+IFRoZSByZXN0IG9mIHRoZSBwYXRjaHNldCBhZGRyZXNzZXMgcHJvYmxl
bXMgaW4gdGhlIGNvZGUgd2hlcmUgYWNjZXNzCj4gYmV0d2VlbiBwbGFuZSBhbmQgQ1JUQyBzdGF0
ZSBpcyBjb252b2x1dGVkIGFuZCBoYXJkIHRvIGZvbGxvdy4gV2l0aAo+IHRoZSBjaGFuZ2VzIGFw
cGxpZWQsIHRoZSBhdG9taWNfY2hlY2soKSBmdW5jdGlvbnMgb2YgcHJpbWFyeSBwbGFuZSBhbmQK
PiBDUlRDIHNldCB0aGUgbmVjZXNzYXJ5IHN0YXRlIHRoYXQgaXMgbGF0ZXIgdXNlZCBieSBhdG9t
aWNfZmx1c2goKS4KPiAKPiBDb25maWd1cmF0aW9ucyB3aXRob3V0IGZyYW1lYnVmZmVyIGNhbm5v
dCBiZSByZWplY3RlZCBiZWNhdXNlIHRoaXMKPiBicmVha3MgZHJtX2ZyYW1lYnVmZmVyX3JlbW92
ZSgpLiBJbnN0ZWFkIGFjY2VwdCB0aGVtIGFuZCBzd2l0Y2ggb2ZmCj4gdGhlIHNjcmVlbiB0byBh
dm9pZCBnYXJiYWdlIG91dHB1dC4gUGF0Y2ggMiBpbXBsZW1lbnRzIHRoaXMgbG9naWMgZm9yCj4g
dGhlIHByaW1hcnkgcGxhbmUuCj4gCj4gUGF0Y2hlcyAzIHRvIDUgaW1wbGVtZW50IGF0b21pY19j
aGVjaygpIGZvciBwbGFuZXMgYW5kIGludHJvZHVjZQo+IHN0cnVjdCBhc3RfY3J0Y19zdGF0ZS4g
SW4gcGF0Y2hlcyA2IGFuZCA3LCB0aGUgYXRvbWljX2NoZWNrKCkgZnVuY3Rpb25zCj4gb2YgQ1JU
QyBhbmQgcHJpbWFyeSBwbGFuZSBzZXQgZGlzcGxheSBtb2RlIGFuZCBmcmFtZWJ1ZmZlciBmb3Jt
YXQgaW4KPiB0aGUgQVNUIENSVEMgc3RhdGU7IGFuZCBhdG9taWNfZmx1c2goKSBwaWNrcyB1cCB0
aGVzZSBzZXR0aW5ncyBmb3IKPiBjb25maWd1cmluZyB0aGUgbW9kZS4KPiAKPiBUaGUgcGF0Y2hz
ZXQgaGFzIGJlZW4gdGVzdGVkIGJ5IHJ1bm5pbmcgdGhlIGZiZGV2IGNvbnNvbGUsIEdub21lLAo+
IGFuZCBXZXN0b24gb24gYW4gQVNUMTEwMCBjaGlwc2V0LiBHbm9tZSdzIGRpc3BsYXkgaGFzIGJl
ZW4gc3VzcGVuZGVkCj4gbXVsdGlwbGUgdGltZXMgdG8gdmVyaWZ5IHRoZSBidWdmaXguCgpEaXNj
bGFpbWVyOiBEb24ndCBrbm93IHRoZSBoYXJkd2FyZS4KQ2FuJ3Qgc3BvdCBhbnkgaXNzdWVzIGlu
IHRoZSBzZXJpZXMsIHNvCkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
