Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B919DEFE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD086EC78;
	Fri,  3 Apr 2020 20:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700C46EC76
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 20:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585944495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEsV9eSdWDRaAMBOSt6FSG+jWV6hZRXoz4QAhzcz7j8=;
 b=UC15zoumqeheBRSG17/++Ih+n/eOTbZSxRCmPi/7BucD0AQnyzMSaZ3pxxPvw0Jh8ebhf/
 726xZBTg0R1kBG2fGZG78Vk7Jf1Iu8DjDXS7iT69zWU1/YLrGhXsPDnF0tCyIqW3IMqhhQ
 +3c8MwiTXmC6bWzxEguwImn8SjveuMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-zuo8q5npPduGTdfIw3fzfg-1; Fri, 03 Apr 2020 16:08:13 -0400
X-MC-Unique: zuo8q5npPduGTdfIw3fzfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0909100550D;
 Fri,  3 Apr 2020 20:08:11 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-203.rdu2.redhat.com [10.10.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09D515C541;
 Fri,  3 Apr 2020 20:08:09 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/dp_mst: Increase ACT retry timeout to 3s
Date: Fri,  3 Apr 2020 16:07:55 -0400
Message-Id: <20200403200757.886443-4-lyude@redhat.com>
In-Reply-To: <20200403200757.886443-1-lyude@redhat.com>
References: <20200403200757.886443-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Todd Previte <tprevite@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHdlIG9ubHkgcG9sbCBmb3IgYW4gQUNUIHVwIHRvIDMwIHRpbWVzLCB3aXRoIGEg
YnVzeS13YWl0IGRlbGF5Cm9mIDEwMMK1cyBiZXR3ZWVuIGVhY2ggYXR0ZW1wdCAtIGdpdmluZyB1
cyBhIHRpbWVvdXQgb2YgMjkwMMK1cy4gV2hpbGUKdGhpcyBtaWdodCBzZWVtIHNlbnNpYmxlLCBp
dCB3b3VsZCBhcHBlYXIgdGhhdCBpbiBjZXJ0YWluIHNjZW5hcmlvcyBpdApjYW4gdGFrZSBkcmFt
YXRpY2FsbHkgbG9uZ2VyIHRoZW4gdGhhdCBmb3IgdXMgdG8gcmVjZWl2ZSBhbiBBQ1QuIE9uIG9u
ZQpvZiB0aGUgRVZHQSBNU1QgaHVicyB0aGF0IEkgaGF2ZSBhdmFpbGFibGUsIEkgb2JzZXJ2ZWQg
c2FpZCBodWIKc29tZXRpbWVzIHRha2luZyBsb25nZXIgdGhlbiBhIHNlY29uZCBiZWZvcmUgc2ln
bmFsbGluZyB0aGUgQUNULiBUaGVzZQpkZWxheXMgbW9zdGx5IHNlZW0gdG8gb2NjdXIgd2hlbiBw
cmV2aW91cyBzaWRlYmFuZCBtZXNzYWdlcyB3ZSd2ZSBzZW50CmFyZSBOQUtkIGJ5IHRoZSBodWIs
IGhvd2V2ZXIgaXQgd291bGRuJ3QgYmUgcGFydGljdWxhcmx5IHN1cnByaXNpbmcgaWYKaXQncyBw
b3NzaWJsZSB0byByZXByb2R1Y2UgdGltZXMgbGlrZSB0aGlzIHNpbXBseSBieSBpbnRyb2R1Y2lu
ZyBicmFuY2gKZGV2aWNlcyB3aXRoIGxhcmdlIExDVHMgc2luY2UgcGF5bG9hZCBhbGxvY2F0aW9u
cyBoYXZlIHRvIHRha2UgZWZmZWN0IG9uCmV2ZXJ5IGRvd25zdHJlYW0gZGV2aWNlIHVwIHRvIHRo
ZSBwYXlsb2FkJ3MgdGFyZ2V0LgoKU28sIGluc3RlYWQgb2YganVzdCByZXRyeWluZyAzMCB0aW1l
cyB3ZSBwb2xsIGZvciB0aGUgQUNUIGZvciB1cCB0byAzbXMsCmFuZCBhZGRpdGlvbmFsbHkgdXNl
IHVzbGVlcF9yYW5nZSgpIHRvIGF2b2lkIGEgdmVyeSBsb25nIGFuZCBydWRlCmJ1c3ktd2FpdC4g
Tm90ZSB0aGF0IHRoZSBwcmV2aW91cyByZXRyeSBjb3VudCBvZiAzMCBhcHBlYXJzIHRvIGhhdmUg
YmVlbgphcmJpdHJhcmlseSBjaG9zZW4sIGFzIEkgY2FuJ3QgZmluZCBhbnkgbWVudGlvbiBvZiBh
IHJlY29tbWVuZGVkIHRpbWVvdXQKb3IgcmV0cnkgY291bnQgZm9yIEFDVHMgaW4gdGhlIERpc3Bs
YXlQb3J0IDIuMCBzcGVjaWZpY2F0aW9uLiBUaGlzIGFsc28KZ29lcyBmb3IgdGhlIHJhbmdlIHdl
IHdlcmUgcHJldmlvdXNseSB1c2luZyBmb3IgdWRlbGF5KCksIGFsdGhvdWdoIEkKc3VzcGVjdCB0
aGF0IHdhcyBqdXN0IGNvcGllZCBmcm9tIHRoZSByZWNvbW1lbmRlZCBkZWxheSBmb3IgbGluawp0
cmFpbmluZyBvbiBTU1QgZGV2aWNlcy4KClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRl
QHJlZGhhdC5jb20+CkZpeGVzOiBhZDdmOGExZjljZWQgKCJkcm0vaGVscGVyOiBhZGQgRGlzcGxh
eXBvcnQgbXVsdGktc3RyZWFtIGhlbHBlciAodjAuNikiKQpDYzogU2VhbiBQYXVsIDxzZWFuQHBv
b3JseS5ydW4+CkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2My4xNysKLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMjYgKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDdhYWYxODRhMmU1Zi4u
ZjMxMzQwNzM3NGVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3Bv
bG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTQ0
NjYsMTcgKzQ0NjYsMzAgQEAgc3RhdGljIGludCBkcm1fZHBfZHBjZF93cml0ZV9wYXlsb2FkKHN0
cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogICogQG1ncjogbWFuYWdlciB0byB1
c2UKICAqCiAgKiBUcmllcyB3YWl0aW5nIGZvciB0aGUgTVNUIGh1YiB0byBmaW5pc2ggdXBkYXRp
bmcgaXQncyBwYXlsb2FkIHRhYmxlIGJ5Ci0gKiBwb2xsaW5nIGZvciB0aGUgQUNUIGhhbmRsZWQg
Yml0LgorICogcG9sbGluZyBmb3IgdGhlIEFDVCBoYW5kbGVkIGJpdCBmb3IgdXAgdG8gMyBzZWNv
bmRzICh5ZXMtc29tZSBodWJzIHJlYWxseQorICogdGFrZSB0aGF0IGxvbmcpLgogICoKICAqIFJl
dHVybnM6CiAgKiAwIGlmIHRoZSBBQ1Qgd2FzIGhhbmRsZWQgaW4gdGltZSwgbmVnYXRpdmUgZXJy
b3IgY29kZSBvbiBmYWlsdXJlLgogICovCiBpbnQgZHJtX2RwX2NoZWNrX2FjdF9zdGF0dXMoc3Ry
dWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpCiB7Ci0JaW50IGNvdW50ID0gMCwgcmV0
OworCS8qCisJICogVGhlcmUgZG9lc24ndCBzZWVtIHRvIGJlIGFueSByZWNvbW1lbmRlZCByZXRy
eSBjb3VudCBvciB0aW1lb3V0IGluCisJICogdGhlIE1TVCBzcGVjaWZpY2F0aW9uLiBTaW5jZSBz
b21lIGh1YnMgaGF2ZSBiZWVuIG9ic2VydmVkIHRvIHRha2UKKwkgKiBvdmVyIDEgc2Vjb25kIHRv
IHVwZGF0ZSB0aGVpciBwYXlsb2FkIGFsbG9jYXRpb25zIHVuZGVyIGNlcnRhaW4KKwkgKiBjb25k
aXRpb25zLCB3ZSB1c2UgYSByYXRoZXIgbGFyZ2UgdGltZW91dCB2YWx1ZS4KKwkgKi8KKwljb25z
dCBpbnQgdGltZW91dF9tcyA9IDMwMDA7CisJdW5zaWduZWQgbG9uZyB0aW1lb3V0ID0gamlmZmll
cyArIG1zZWNzX3RvX2ppZmZpZXModGltZW91dF9tcyk7CisJaW50IHJldDsKKwlib29sIHJldHJ5
aW5nID0gZmFsc2U7CiAJdTggc3RhdHVzOwogCiAJZG8geworCQlpZiAocmV0cnlpbmcpCisJCQl1
c2xlZXBfcmFuZ2UoMTAwLCAxMDAwKTsKKwogCQlyZXQgPSBkcm1fZHBfZHBjZF9yZWFkYihtZ3It
PmF1eCwKIAkJCQkJRFBfUEFZTE9BRF9UQUJMRV9VUERBVEVfU1RBVFVTLAogCQkJCQkmc3RhdHVz
KTsKQEAgLTQ0ODgsMTMgKzQ1MDEsMTIgQEAgaW50IGRybV9kcF9jaGVja19hY3Rfc3RhdHVzKHN0
cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKQogCiAJCWlmIChzdGF0dXMgJiBEUF9Q
QVlMT0FEX0FDVF9IQU5ETEVEKQogCQkJYnJlYWs7Ci0JCWNvdW50Kys7Ci0JCXVkZWxheSgxMDAp
OwotCX0gd2hpbGUgKGNvdW50IDwgMzApOworCQlyZXRyeWluZyA9IHRydWU7CisJfSB3aGlsZSAo
amlmZmllcyA8IHRpbWVvdXQpOwogCiAJaWYgKCEoc3RhdHVzICYgRFBfUEFZTE9BRF9BQ1RfSEFO
RExFRCkpIHsKLQkJRFJNX0RFQlVHX0tNUygiZmFpbGVkIHRvIGdldCBBQ1QgYml0ICVkIGFmdGVy
ICVkIHJldHJpZXNcbiIsCi0JCQkgICAgICBzdGF0dXMsIGNvdW50KTsKKwkJRFJNX0RFQlVHX0tN
UygiZmFpbGVkIHRvIGdldCBBQ1QgYml0ICVkIGFmdGVyICVkbXNcbiIsCisJCQkgICAgICBzdGF0
dXMsIHRpbWVvdXRfbXMpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAJcmV0dXJuIDA7Ci0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
