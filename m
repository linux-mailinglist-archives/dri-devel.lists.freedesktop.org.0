Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B04FE6CD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 22:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A106EAEA;
	Fri, 15 Nov 2019 21:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724226EAEB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 21:07:50 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-gYFElgWXMImczVozR5YyPQ-1; Fri, 15 Nov 2019 16:07:47 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3BB62F2A;
 Fri, 15 Nov 2019 21:07:41 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-11.bss.redhat.com
 [10.20.1.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F5CC69193;
 Fri, 15 Nov 2019 21:07:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 0/3] MST BPC fixes for nouveau
Date: Fri, 15 Nov 2019 16:07:17 -0500
Message-Id: <20191115210728.3467-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: gYFElgWXMImczVozR5YyPQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573852068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fZHCbRTyudvOPs1jp78LmqzUhByFAzYjWlaniYrl0dY=;
 b=JGsWQv/Mm+DHjKjtTB1x2R51wFiDSA8U6Nq0t2Yv/VIoMjVwpPWIFJ6Of604ofi/fi82JX
 JodG5rz86sBD6fpKS0a+Nx9pX9vbWmSkISoEu8irFdt3L1sd/eX/YaN+4EhhAzg3rVprhO
 hpWWRkSxwFUzEU+M9ueTOBuXKTW+22I=
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
 Peteris Rudzusiks <peteris.rudzusiks@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVhbGl6ZWQgd2hlbiBJIG1vdmVkIG5vdXZlYXUgb3ZlciB0byB1c2luZyB0aGUgYXRvbWljIERQ
IE1TVCBWQ1BJCmhlbHBlcnMgdGhhdCBJIGZvcmdvdCB0byBlbnN1cmUgdGhhdCB3ZSBjbGFtcCB0
aGUgQlBDIHRvIDggdG8gbWFrZSB1cwpsZXNzIGxpa2VseSB0byBydW4gb3V0IG9mIGJhbmR3aWR0
aCBvbiBhIHRvcG9sb2d5IHdoZW4gZW5hYmxpbmcgbXVsdGlwbGUKZGlzcGxheXMgdGhhdCBzdXBw
b3J0ID44IEJQQyAtIHNvbWV0aGluZyB3ZSB3YW50IHRvIGRvIHVudGlsIHdlIGhhdmUKc3VwcG9y
dCBmb3IgZHluYW1pY2FsbHkgc2VsZWN0aW5nIHRoZSBicGMgYmFzZWQgb24gdGhlIHRvcG9sb2d5
J3MKYXZhaWxhYmxlIGJhbmR3aWR0aCwgc2luY2UgdXNlcnNwYWNlIGlzbid0IHJlYWxseSB1c2lu
ZyBIRFIgeWV0IGFueXdheS4KVGhpcyBtYXRjaGVzIHRoZSBiZWhhdmlvciB0aGF0IGk5MTUgaGFz
LCBhbG9uZyB3aXRoIHRoZSBiZWhhdmlvciBvZgphbWRncHUgYW5kIHNob3VsZCBmaXggc29tZSBw
ZW9wbGUncyBkaXNwbGF5cyBub3QgdHVybmluZyBvbi4KCkx5dWRlIFBhdWwgKDMpOgogIGRybS9u
b3V2ZWF1L2ttcy9udjUwLTogQ2FsbCBvdXRwX2F0b21pY19jaGVja192aWV3KCkgYmVmb3JlIGhh
bmRsaW5nCiAgICBQQk4KICBkcm0vbm91dmVhdS9rbXMvbnY1MC06IFN0b3JlIHRoZSBicGMgd2Un
cmUgdXNpbmcgaW4gbnY1MF9oZWFkX2F0b20KICBkcm0vbm91dmVhdS9rbXMvbnY1MC06IExpbWl0
IE1TVCBCUEMgdG8gOAoKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2F0b20uaCB8
ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAxMDIgKysr
KysrKysrKysrKystLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9o
ZWFkLmMgfCAgIDUgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgNDQgZGVs
ZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
