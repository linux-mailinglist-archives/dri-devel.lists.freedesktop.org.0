Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A190FEFA0D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE1F6E983;
	Tue,  5 Nov 2019 09:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0596E983
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:51:09 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-QBhGQqVSMGic0mG4Jlqu4g-1; Tue, 05 Nov 2019 04:51:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6130A477;
 Tue,  5 Nov 2019 09:51:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 089655D713;
 Tue,  5 Nov 2019 09:51:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9286316E08; Tue,  5 Nov 2019 10:51:02 +0100 (CET)
Date: Tue, 5 Nov 2019 10:51:02 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 6/9] drm/ast: Add primary plane
Message-ID: <20191105095102.qjqgh3ghx7tctk43@sirius.home.kraxel.org>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-7-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191028154928.4058-7-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: QBhGQqVSMGic0mG4Jlqu4g-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572947469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JS1vmMBQ6l4BpSXhCAaInHWsoaBizVRzhMfLAlPP0yk=;
 b=GKg1CSAZ2pZm8/rHc3ujiVbDbFviiFospBa2A1ffSqNXuGiJKd1+I9mCXDc2bFBlIne7Lb
 LHzPEEAAl8pMZexATanbd2FqhuHbUvMuyzyTIKoz69tZKbL+s6dXvTFYSHM52iVWOAUVU3
 aMQsLEDvNb3p0XYglk6g2K+/HsBYL5k=
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
Cc: airlied@redhat.com, chen@aspeedtech.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgYXN0X3ByaW1hcnlfcGxhbmVf
ZnVuY3MgPSB7Cj4gKwkudXBkYXRlX3BsYW5lID0gZHJtX2F0b21pY19oZWxwZXJfdXBkYXRlX3Bs
YW5lLAo+ICsJLmRpc2FibGVfcGxhbmUgPSBkcm1fYXRvbWljX2hlbHBlcl9kaXNhYmxlX3BsYW5l
LAo+ICsJLmRlc3Ryb3kgPSBkcm1fcGxhbmVfY2xlYW51cCwKPiArCS5yZXNldCA9IGRybV9hdG9t
aWNfaGVscGVyX3BsYW5lX3Jlc2V0LAo+ICsJLnNldF9wcm9wZXJ0eSA9IE5VTEwsCj4gKwkuYXRv
bWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX3BsYW5lX2R1cGxpY2F0ZV9z
dGF0ZSwKPiArCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX3BsYW5l
X2Rlc3Ryb3lfc3RhdGUsCj4gKwkuYXRvbWljX3NldF9wcm9wZXJ0eSA9IE5VTEwsCj4gKwkuYXRv
bWljX2dldF9wcm9wZXJ0eSA9IE5VTEwsCgpJdCdzIG5vdCBuZWVkZWQgdG8gZXhwbGljaXRseSBz
ZXQgb3B0aW9uYWwgZnVuY3Rpb24gcG9pbnRlcnMgdG8gTlVMTC4KCj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIGFzdF9lbmNfaGVscGVyX2Z1bmNzID0gewo+
ICAJLmRwbXMgPSBhc3RfZW5jb2Rlcl9kcG1zLAo+ICAJLnByZXBhcmUgPSBhc3RfZW5jb2Rlcl9w
cmVwYXJlLAo+IEBAIC05NzYsMTAgKzEwNDUsMzMgQEAgc3RhdGljIHZvaWQgYXN0X2N1cnNvcl9m
aW5pKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gIAo+ICBpbnQgYXN0X21vZGVfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQo+ICB7Cj4gKwlzdGF0aWMgY29uc3QgdWludDMyX3QgcHJpbWFy
eV9wbGFuZV9mb3JtYXRzW10gPSB7Cj4gKwkJRFJNX0ZPUk1BVF9YUkdCODg4OCwKPiArCQlEUk1f
Rk9STUFUX1JHQjU2NSwKPiArCQlEUk1fRk9STUFUX0M4LAo+ICsJfTsKCkknZCBzdWdnZXN0IHRv
IG1vdmUgdGhpcyBvdXQgb2YgdGhlIGZ1bmN0aW9uLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
