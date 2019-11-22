Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 090C9106691
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 07:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFC66E20C;
	Fri, 22 Nov 2019 06:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C386E1F8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 06:37:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-bu3fkhe2OQyl4q8l5mCNvw-1; Fri, 22 Nov 2019 01:37:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF8261883551;
 Fri, 22 Nov 2019 06:37:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E19AC5D6A3;
 Fri, 22 Nov 2019 06:37:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C57021747D; Fri, 22 Nov 2019 07:37:49 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm: mmap fixups
Date: Fri, 22 Nov 2019 07:37:47 +0100
Message-Id: <20191122063749.27113-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: bu3fkhe2OQyl4q8l5mCNvw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574404678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HeuI7xLDSgSE13ZKCsNtKypUyZbFhvq2S4rg9XIO9pA=;
 b=ZyIKT0X7pPon0JM+5bSu23mstcqcKyNKBkVeDMOOywPGfGV534eQAXDCbNK9OM5CmNGSCa
 VBNOZkwGsJN9J7h/KkVSq5KTkVLHxAI7vk1/AAjG1zzvsZnavbqDiy77peuylZO7EiwrYN
 mFDYSM6Sq0kioz5o7KF2TeBS3QRwIoY=
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
Cc: intel-gfx@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGVzdGVkIG9uIHFlbXUsIHdpdGggYm9jaHMgKHZyYW0gaGVscGVycykgYW5kIGNpcnJ1cyAoc2ht
ZW0gaGVscGVycykuCkNjJ2luZyBpbnRlbC1nZnggZm9yIENJIGNvdmVyYWdlLgoKR2VyZCBIb2Zm
bWFubiAoMik6CiAgZHJtOiBjYWxsIGRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAgd2l0aCBmYWtl
IG9mZnNldAogIGRybTogc2hhcmUgYWRkcmVzcyBzcGFjZSBmb3IgZG1hIGJ1ZnMKCiBpbmNsdWRl
L2RybS9kcm1fZ2VtLmggICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIHwgNCArLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbS5jICAgICAgICAgICAgICAgICAgIHwgMyAtLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3NobWVtX2hlbHBlci5jICAgICAgfCAzICsrKwogZHJpdmVycy9ncHUvZHJtL2RybV9w
cmltZS5jICAgICAgICAgICAgICAgICB8IDcgKysrKysrLQogZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdm0uYyAgICAgICAgICAgICB8IDcgLS0tLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
