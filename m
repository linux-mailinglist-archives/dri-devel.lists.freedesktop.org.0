Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29B570273
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 16:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CC5898C0;
	Mon, 22 Jul 2019 14:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B153E898C4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 14:38:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 165DDAF86;
 Mon, 22 Jul 2019 14:38:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Audio component support for radeon and nouveau
Date: Mon, 22 Jul 2019 16:38:13 +0200
Message-Id: <20190722143815.7339-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgp0aGlzIGlzIGEgcGF0Y2hzZXQgdG8gYWRkIHRoZSBzdXBwb3J0IGZvciBIRE1JL0RQIGF1
ZGlvIG5vdGlmaWNhdGlvbgp2aWEgZHJtX2F1ZGlvX2NvbXBvbmVudCBmcmFtZXdvcmsgb24gcmFk
ZW9uIGFuZCBub3V2ZWF1IGRyaXZlcnMuClRoZSBub3RpZmljYXRpb24gbWVjaGFuaXNtIHdvcmtz
IGZvciBsb25nIHRpbWUgb24gaTkxNSwgYW5kIG5vdyBBTURHUFUKcGF0Y2ggaXMgZmxvYXRpbmcg
YXJvdW5kLiAgVGhpcyBmaWxscyB0aGUgcmVzdCBnYXAsIHRoZSBzdXBwb3J0IGZvcgpyZW1haW5p
bmcgcmFkZW9uIGFuZCBub3V2ZWF1IGRyaXZlcnMuCgpUaGUgaW1wbGVtZW50YXRpb24gaXMgcmF0
aGVyIHNpbXBsZSwgYW5kIGl0IGp1c3QgYWRkcyB0aGUgaG9vayBmb3IKbm90aWZpY2F0aW9uIGFu
ZCBFTEQgcmV0cmlldmFsLiAgVGhlIHBhdGNoIGZvciByYWRlb24gaXMgYmFzaWNhbGx5IGEKcmVz
cGluIG9mIG15IHByZXZpb3VzIFJGQyBwYXRjaC4KClRoZSBjb3VudGVycGFydCBjaGFuZ2UgaW4g
SEQtYXVkaW8gc2lkZSBoYXMgYmVlbiBhbHJlYWR5IG1lcmdlZCBpbgpzb3VuZC5naXQgdHJlZSBm
b3IgNS40IGtlcm5lbC4gIFRoZSBwZXJzaXN0ZW50IGJyYW5jaCwKdG9waWMvaGRhLWFjb21wLWJh
c2UsIGlzIHByb3ZpZGVkIHRoZXJlLCBzbyB0aGF0IHlvdSBjYW4gcHVsbCBpbnRvCnlvdXJzIGZy
ZWVseToKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGl3
YWkvc291bmQuZ2l0IHRvcGljL2hkYS1hY29tcC1iYXNlCgpUaGlzIHBhdGNoc2V0IGl0c2VsZiBp
cyBhbG1vc3QgaGFybWxlc3Mgd2l0aG91dCB0aGUgSEQtYXVkaW8gc2lkZQpjaGFuZ2VzIChJT1cs
IGl0IGRvZXNuJ3QgaGVscCBhbnl0aGluZyBlbHNlLCBlaXRoZXIgOikKCgp0aGFua3MsCgpUYWth
c2hpCgo9PT0KClRha2FzaGkgSXdhaSAoMik6CiAgZHJtL3JhZGVvbjogQWRkIEhELWF1ZGlvIGNv
bXBvbmVudCBub3RpZmllciBzdXBwb3J0CiAgZHJtL25vdXZlYXU6IEFkZCBIRC1hdWRpbyBjb21w
b25lbnQgbm90aWZpZXIgc3VwcG9ydAoKIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAg
ICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmlnICAgICAgICAg
fCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIHwgMTExICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2Rydi5oICAgfCAgIDcgKysKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgg
ICAgICAgICB8ICAgMyArCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5jICAg
fCAgOTIgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwgMjE1IGlu
c2VydGlvbnMoKykKCi0tIAoyLjE2LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
