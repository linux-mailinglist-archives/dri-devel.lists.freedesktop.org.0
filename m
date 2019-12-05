Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA19113CBB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 09:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003226F5B1;
	Thu,  5 Dec 2019 08:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C7E6F5B1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 08:03:07 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-5U51Dx0gO3aKsPWSIB2wow-1; Thu, 05 Dec 2019 03:03:05 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ECBF800D5A;
 Thu,  5 Dec 2019 08:03:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93E4319481;
 Thu,  5 Dec 2019 08:03:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 78FA716E08; Thu,  5 Dec 2019 09:03:02 +0100 (CET)
Date: Thu, 5 Dec 2019 09:03:02 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Debug-print unique revisions id on G200 SE
Message-ID: <20191205080302.4oswszd3znca3xh7@sirius.home.kraxel.org>
References: <20191204133435.17462-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191204133435.17462-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 5U51Dx0gO3aKsPWSIB2wow-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575532986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBV3UZtYzXSFzjUCfgccmTG+qbhGgP9RHXPd/YAVoJs=;
 b=Y9v35sVEtCaUmUdN23Cu4MpOUgPG87EZjUwOWh9lJz3oq32PG08x6yDfkRaZX4ffr8jd4M
 ka3HmBNComLRBVMcArKxjCBKFtChJEqqoSLNQtchTDo44TTMFG4RRZPrns9IQrKslZGoHD
 9l6Ghm2BNmthkN2aiGlfSUn/9Jh4NNg=
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
Cc: airlied@redhat.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 john.p.donnelly@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMDI6MzQ6MzVQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGJlaGF2aW9yIG9mIE1HQSBHMjAwIFNFIGRlcGVuZHMgb24gdGhlIHJl
diBpZC4gUHJpbnQgdGhlIGlkIHdoZW4KPiBkZWJ1Z2dpbmcgaXMgZW5hYmxlZC4KClRoYXQgaXMg
dGhlIG9uZSB3aGVyZSBzb21lIG5lZWQgYSB3b3JrYXJvdW5kLCByaWdodD8KCj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jIHwgNSArKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9tYWluLmMKPiBpbmRleCBlMWJjNWIwYWE3NzQuLmFlYjdjMTBkZWQw
ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jCj4gQEAgLTExOCw4
ICsxMTgsMTEgQEAgc3RhdGljIGludCBtZ2FnMjAwX2RldmljZV9pbml0KHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+ICAJLyogc3Rhc2ggRzIwMCBTRSBt
b2RlbCBudW1iZXIgZm9yIGxhdGVyIHVzZSAqLwo+IC0JaWYgKElTX0cyMDBfU0UobWRldikpCj4g
KwlpZiAoSVNfRzIwMF9TRShtZGV2KSkgewo+ICAJCW1kZXYtPnVuaXF1ZV9yZXZfaWQgPSBSUkVH
MzIoMHgxZTI0KTsKPiArCQlEUk1fREVCVUcoIkcyMDAgU0UgdW5pcXVlIHJldmlzaW9uIGlkIGlz
IDB4JXhcbiIsCj4gKwkJCSAgbWRldi0+dW5pcXVlX3Jldl9pZCk7CgpNYXliZSB1c2UgRFJNX0lO
Rk8gaGVyZT8gIFRlbXBvcmFyaWx5IGZvciBhIGZldyBrZXJuZWwgcmV2aXNpb25zLCB1bnRpbAp0
aGluZ3MgYXJlIHNldHRsZWQ/CgooanVzdCBhIHN1Z2dlc3Rpb24sIHlvdXIgY2hvaWNlKS4KCkFj
a2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCmNoZWVycywKICBHZXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
