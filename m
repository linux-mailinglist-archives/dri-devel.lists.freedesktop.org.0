Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AFAF2A76
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 10:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FC86F3BF;
	Thu,  7 Nov 2019 09:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF45F6F3BF
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:21:16 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-iBkKRLxjM9-WalvliPCfcQ-1; Thu, 07 Nov 2019 04:21:12 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18F501800DFB;
 Thu,  7 Nov 2019 09:21:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C86E710013A1;
 Thu,  7 Nov 2019 09:21:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 21D7316E08; Thu,  7 Nov 2019 10:21:10 +0100 (CET)
Date: Thu, 7 Nov 2019 10:21:10 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 8/9] drm/ast: Add cursor plane
Message-ID: <20191107092110.2wro5sbrg3hglfa7@sirius.home.kraxel.org>
References: <20191107083404.6852-1-tzimmermann@suse.de>
 <20191107083404.6852-9-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191107083404.6852-9-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: iBkKRLxjM9-WalvliPCfcQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573118475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxXHVL+V9oMep6v3+ikaGzezrRJ0cAe/QN0DQtz/BVg=;
 b=cLpqBiQhJVLcrSb+3wVN7Lf/0QxzNaJjHlFsY2t8Zc+evzyXGEZba90t8VQqsktUQAf+N5
 qRJRnLuF1RTfmQ7yV4esEo0PCJWY/dzZGL5gqdYRVULxBylSqLE0uLXYj0mD/Ln34ahG4v
 sbwIsY++n1kMsKgN0C0tGkbwQw0KTn8=
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
Cc: airlied@redhat.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDk6MzQ6MDNBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGN1cnNvciBwbGFuZSB1c2VzIGFuIGludGVybmFsIGZvcm1hdCBvZiBB
UkdCNDQ0NC4gVG8gdXNlcnNwYWNlLCB3ZQo+IGFubm91bmNlIEFSR0I4ODg4IGFuZCBkbyB0aGUg
dHJhbnNmb3JtYXRpb24gaW50ZXJuYWxseS4KPiAKPiB2MjoKPiAJKiBkb24ndCBzZXQgcGxhbmUg
Y2FsbC1iYWNrIGZ1bmN0aW9ucyB0byBOVUxMIGV4cGxpY2l0bHkKPiAJKiBkZWZpbmUgcGxhbmUg
Zm9ybWF0IGFycmF5IGluIGdsb2JhbCBzY29wZQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9kcnYuaCAgfCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMg
fCAxNTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTU1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkjCgpBY2tlZC1ieTogR2VyZCBIb2Zm
bWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
