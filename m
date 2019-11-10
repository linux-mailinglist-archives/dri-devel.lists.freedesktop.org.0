Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D88F69CF
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 16:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7237B6E094;
	Sun, 10 Nov 2019 15:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9586E049
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 15:41:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-eK-Rx17VMZ6OFXnGXzAiKQ-1; Sun, 10 Nov 2019 10:41:07 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0162B800C72;
 Sun, 10 Nov 2019 15:41:05 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-82.ams2.redhat.com
 [10.36.116.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF502608BB;
 Sun, 10 Nov 2019 15:41:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 00/12] drm/modes: parse_cmdline: Add support for specifying
 panel_orientation on the kernel cmdline
Date: Sun, 10 Nov 2019 16:40:49 +0100
Message-Id: <20191110154101.26486-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: eK-Rx17VMZ6OFXnGXzAiKQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573400469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pC+f3G4g3HOWdNg3ntRSqv+/ZvudwC1QIbr3YFUOd50=;
 b=Cgfr1iNrf+Xhk3GKbApVzWobZkhPzFtTSuoSpAeExZVZFP4SUdM52vokehmyzYb6l+scB1
 8vvcYLiN1ooo3nZrlsDlB3Z3wKcA+OGKGliKjMVUMrnUcVQ7AfhAhZm0HTNJzaLGKoX04V
 7Fz9D1WeHCNHGA/5JCe3jg4i0EhJG6o=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Mathieu=20Alexandre-T=C3=A9treault?= <alexandretm@amotus.ca>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxsLAoKSSd2ZSBiZWVuIHRoaW5raW5nIGFib3V0IGFkZGluZyBzdXBwb3J0IGZvciBvdmVy
cmlkaW5nIGEgY29ubmVjdG9yJ3MKcGFuZWwtb3JpZW50YXRpb24gZnJvbSB0aGUga2VybmVsIGNv
bW1hbmRsaW5lIGZyb20gYSB3aGlsZSBub3cuIEJvdGggZm9yCnRlc3RpbmcgYW5kIGZvciBzcGVj
aWFsIGNhc2VzLCBlLmcuIGEga2lvc2sgbGlrZSBzZXR1cCB3aGljaCB1c2VzIGEgVFYKbW91bnRl
ZCBpbiBwb3J0cmFpdCBtb2RlLgoKVGhlbiB0aGlzIHBseW1vdXRoIG1lcmdlLXJlcSBjYW1lIGlu
OgoiRm9yY2UgZGlzcGxheSBvcmllbnRhdGlvbiB1c2luZyBjb25maWd1cmF0aW9uIGZpbGUiCmh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9wbHltb3V0aC9wbHltb3V0aC9tZXJnZV9yZXF1
ZXN0cy84MwoKV2hpY2ggd2FzIHRoZSB0cmlnZ2VyIGZvciBtZSB0byBhY3R1YWxseSBkbyB0aGlz
LiBUaGlzIHR1cm5lZCBvdXQgdG8gYmUKYSBiaXQgbW9yZSB3b3JrIHRoZW4gZXhwZWN0ZWQgYXMg
SSB3YW50ZWQgdXNlcnMgdG8gYmUgYWJsZSB0byBzcGVjaWZ5CnRoZSBuZXcgInBhbmVsX29yaWVu
dGF0aW9uIiBvcHRpb24gYXMgYSBmcmVlc3RhbmRpbmcgb3B0aW9uLCB3aXRob3V0Cm5lZWRpbmcg
dG8gcHJlZml4IGEgcmVzb2x1dGlvbjsgYW5kIHdoZW4gd29ya2luZyBvbiB0aGF0IEkgc3R1bWJs
ZWQgb3Zlcgp2YXJpb3VzIHRoaW5ncyB3aGljaCBjb3VsZCBiZSBpbXByb3ZlZCBpbiB0aGUgY21k
bGluZSBwYXJzaW5nIGNvZGUuCgpUaGlzIHBhdGNoLXNlZXQgaXMgdGhlIGVuZCByZXN1bHQgb2Yg
YWxsIHRoaXMuIEFtb25nc3Qgb3RoZXIgdGVzdHMsCml0IGhhcyBiZWVuIHRlc3RlZCB3aXRoIHRo
ZSB0ZXN0LWRybV9jbWRsaW5lX3BhcnNlci5rbyBzZWxmdGVzdCBhbmQgaXQKYWRkcyBzb21lIG5l
dyB0ZXN0cyB0byB0aGF0IGluIHNvbWUgb2YgdGhlIHBhdGNoZXMuCgpSZWdhcmRzLAoKSGFucwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
