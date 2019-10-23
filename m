Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26474E1216
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 08:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A116E956;
	Wed, 23 Oct 2019 06:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16856E956
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:25:49 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-pHL3jc1jOueuiwRn79nvkg-1; Wed, 23 Oct 2019 02:25:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F6321800D6B;
 Wed, 23 Oct 2019 06:25:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE0C560619;
 Wed, 23 Oct 2019 06:25:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C2E299D69; Wed, 23 Oct 2019 08:25:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/virtio: various cleanups
Date: Wed, 23 Oct 2019 08:25:36 +0200
Message-Id: <20191023062539.11728-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: pHL3jc1jOueuiwRn79nvkg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571811948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=il3b9jKKg8pzfoUdZUImqdl3YX472bTEUYnPgh3puTM=;
 b=W6qhuYGpE29bxx+JV9DmI69cvyERwxIy+e8wtJiGUGXNJ8djQz/3qarainv1XEQVTsW7lD
 axfqTfPnWF/X0Q8j34Pcfe1nD/rwE4CLNr3EbW3IQM7Th/taHUb4L4yn38p9pFTO0BEe0j
 FHhsG0N+mpbkb0AyNRhqxeWRL43ZTjc=
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGl0dGxlIHBhdGNoIHNlcmllcyBkb2luZyBzb21lIGNsZWFudXBzIGluIHRoZSB2aXJ0aW8gZHJp
dmVyLgpQYXRjaGVzICMxICsgIzIgaGF2ZSBiZWVuIG9uIHRoZSBsaXN0IGJlZm9yZSBhcyBzaW5n
bGUgcGF0Y2hlcywKaW5jbHVkZXMgaGVyZSBhZ2FpbiBmb3IgcGF0Y2ggZGVwZW5kZW5jeSByZWFz
b25zLgoKdjI6CiAtIGZpeCBzcGFyc2UgZXJyb3JzLgogLSBkcm9wIG1lcmdlZCBwYXRjaGVzICgj
MSArICMyKS4KCnBsZWFzZSByZXZpZXcsCiAgR2VyZAoKR2VyZCBIb2ZmbWFubiAoMyk6CiAgZHJt
L3ZpcnRpbzogZml4IGJ5dGVvcmRlciBoYW5kbGluZyBpbgogICAgdmlydGlvX2dwdV9jbWRfdHJh
bnNmZXJfe2Zyb20sdG99X2hvc3RfM2QgZnVuY3Rpb25zCiAgZHJtL3ZpcnRpbzogU2ltcGxpZnkg
dmlydGlvX2dwdV9wcmltYXJ5X3BsYW5lX3VwZGF0ZSB3b3JrZmxvdy4KICBkcm0vdmlydGlvOiBm
YWN0b3Igb3V0IHZpcnRpb19ncHVfdXBkYXRlX2R1bWJfYm8KCiBkcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfZHJ2LmggICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfaW9jdGwuYyB8IDIyICsrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
cGxhbmUuYyB8IDcwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfdnEuYyAgICB8IDE5ICsrKysrLS0KIDQgZmlsZXMgY2hhbmdlZCwgNjEg
aW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pCgotLSAKMi4xOC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
