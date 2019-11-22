Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6980A10667F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 07:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501546E0CA;
	Fri, 22 Nov 2019 06:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7116E1D7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 06:32:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-3jIkdFjwOJmqko0S6EzAiQ-1; Fri, 22 Nov 2019 01:32:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B032801E74;
 Fri, 22 Nov 2019 06:32:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F2815F700;
 Fri, 22 Nov 2019 06:32:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D0D161747D; Fri, 22 Nov 2019 07:32:36 +0100 (CET)
Date: Fri, 22 Nov 2019 07:32:36 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm: share address space for dma bufs
Message-ID: <20191122063236.vs3bh6xvmswlszte@sirius.home.kraxel.org>
References: <20191121103807.18424-1-kraxel@redhat.com>
 <20191121103807.18424-3-kraxel@redhat.com>
 <14063C7AD467DE4B82DEDB5C278E8663D9C8F533@FMSMSX108.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663D9C8F533@FMSMSX108.amr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 3jIkdFjwOJmqko0S6EzAiQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574404365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihHqeHetXpxDUSWXALWO2fESEh+WPpRGUu/UkNC3/0k=;
 b=iSyZiWWcaaWHYk4/K9z+CR/QYvErqm4OsWYuKY6m16p6H3yI7W7IDN/i13J+OdReYjCmzP
 Q3L67rVF0NXGuNVDQkM8eg6MGl3BE+U2oJfdMMaeODNgJiNthgKkmzCfhXH+hn5zGcerg4
 8TR2ETya36lKpb22tBuYg/DoArnANsI=
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
Cc: David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDQ6NDI6MTBQTSArMDAwMCwgUnVobCwgTWljaGFlbCBK
IHdyb3RlOgo+ID4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID5Gcm9tOiBJbnRlbC1nZngg
PGludGVsLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEdl
cmQKPiA+SG9mZm1hbm4KPiA+U2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDIxLCAyMDE5IDU6Mzgg
QU0KPiA+VG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+Q2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IG9wZW4gbGlzdAo+ID48bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IE1heGltZSBSaXBh
cmQgPG1yaXBhcmRAa2VybmVsLm9yZz47IEdlcmQKPiA+SG9mZm1hbm4gPGtyYXhlbEByZWRoYXQu
Y29tPgo+ID5TdWJqZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggMi8yXSBkcm06IHNoYXJlIGFkZHJl
c3Mgc3BhY2UgZm9yIGRtYSBidWZzCj4gPgo+ID5Vc2UgdGhlIHNoYXJlZCBhZGRyZXNzIHNwYWNl
IG9mIHRoZSBkcm0gZGV2aWNlIChzZWUgZHJtX29wZW4oKSBpbgo+ID5kcm1fZmlsZS5jKSBmb3Ig
ZG1hLWJ1ZnMgdG9vLiAgVGhhdCByZW1vdmVzIGEgZGlmZmVyZW5jZSBiZXR3ZWVtIGRybQo+ID5k
ZXZpY2UgbW1hcCB2bWFzIGFuZCBkbWEtYnVmIG1tYXAgdm1hcyBhbmQgZml4ZXMgY29ybmVyIGNh
c2VzIGxpa2UKPiA+dW5tYXBzIG5vdCB3b3JraW5nIHByb3Blcmx5Lgo+IAo+IEhpIEdlcmQsCj4g
Cj4gSnVzdCB3YW50IHRvIG1ha2Ugc3VyZSBJIHVuZGVyc3RhbmQgdGhpcy4uLgo+IAo+IFNvIHVu
bWFwcyB3aWxsIG5vdCB3b3JrIGNvcnJlY3RseSBmb3IgbWFwcGluZ3Mgd2hlbiBhIGRyaXZlciBk
b2VzIGEKPiBkcm1fdm1hX25vZGVfdW5hbXAoKT8KCkNvbXBsZXRlbHkgcmVtb3ZpbmcgdGhlIG1h
cHBpbmcgKGFrYSBtdW5tYXAgc3lzY2FsbCkgd29ya3MgZmluZS4KWmFwcGluZyB0aGUgcHRlJ3Mg
KHVzaW5nIG1hZHZpc2UoZG9udG5lZWQpIGZvciBleGFtcGxlKSBkb2Vzbid0LgoKPiBUaGlzIGlz
IGEgZGF5IG9uZSBidWc/CgpJIGd1ZXNzIHNvLCBidXQgSSdsbCBsZWF2ZSB0aGF0IHRvIG90aGVy
cyBiZWluZyBhY3RpdmUgbG9uZ2VyIHRoYW4gbWUgaW4KZHJtIGhhY2tpbmcgdG8gYW5zd2VyIC4u
LgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
