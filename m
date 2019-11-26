Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C9B109F79
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28A76E3E7;
	Tue, 26 Nov 2019 13:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E82F6E3E3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:47:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B6FCDB1C0;
 Tue, 26 Nov 2019 13:47:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH 0/7] drm/udl: Convert to simple-pipe helpers and clean up
Date: Tue, 26 Nov 2019 14:47:00 +0100
Message-Id: <20191126134707.22385-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCBvbmx5IGEgc2luZ2xlIGRpc3BsYXkgcGlwZWxpbmUgYW5kIHByaW1hcnkgcGxhbmUsIHVk
bCBpcyBwZXJmZWN0CmZvciBzaW1wbGUtcGlwZSBoZWxwZXJzLiBQYXRjaGVzIDEgdG8gMyBkbyB0
aGUgY29udmVydGlvbi4gVGhpcyBlbmFibGVzCmF0b21pYyBtb2Rlc2V0dGluZyBmb3IgdWRsIGRl
dmljZXMuCgpQYXRjaGVzIDQgdG8gNyBjbGVhbiB1cCBoYW5kbGluZyBvZiBjb2xvciBkZXB0aCBh
bmQgZnJhbWVidWZmZXJzLiBXaXRoCnVuaXZlcnNhbCBwbGFuZXMgdGhhdCBjb21lIHdpdGggc2lt
cGxlIHBpcGUsIGRpc3BsYXkgdXBkYXRlcyBjYW4gYmUKaW1wbGVtZW50ZWQgd2l0aCBEUk0ncyBk
YW1hZ2UgaGFuZGxlcnMuIFRoZSBwcmltYXJ5IHBsYW5lJ3MgZm9ybWF0cwphcnJheSBhbGxvd3Mg
dG8gZXhwb3J0IHRoZSBjb3JyZWN0IHByZWZlcnJlZCBjb2xvciBkZXB0aC4gVGhlIG9yaWdpbmFs
CnZhbHVlIHdhcyBjaG9vc2VuIGZvciBtYXhpbXVtIGNvbXBhdGliaWxpdHksIGJ1dCBkaWQgbm90
IHJlcHJlc2VudCB0aGUKZGV2aWNlJ3MgY2FwYWJpbGl0eS4KClRoZSBwYXRjaHNldCBoYXMgYmVl
biB0ZXN0ZWQgYnkgcnVubmluZyB0aGUgZmIgY29uc29sZSwgWDExIGFuZCBXZXN0b24Kb24gYSBE
aXNwbGF5TGluayBhZGFwdGVyLgoKVGhvbWFzIFppbW1lcm1hbm4gKDcpOgogIGRybS91ZGw6IElu
aXQgY29ubmVjdG9yIGJlZm9yZSBlbmNvZGVyIGFuZCBDUlRDCiAgZHJtL3VkbDogQ29udmVydCB0
byBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUKICBkcm0vdWRsOiBSZW1vdmUgdW51c2Vk
IGVuY29kZXIgYW5kIENSVEMgY29kZQogIGRybS91ZGw6IFNldCBwcmVmZXJyZWQgY29sb3IgZGVw
dGggdG8gMTYgYnBwCiAgZHJtL3VkbDogQ29udmVydCB0byBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0
eWZiKCkKICBkcm0vdWRsOiBSZW1vdmUgc3RydWN0IHVkbF9kZXZpY2UuYWN0aXZlX2ZiXzE2CiAg
ZHJtL3VkbDogTW92ZSB1ZGxfaGFuZGxlX2RhbWFnZSgpIGludG8gdWRsX21vZGVzZXQuYwoKIGRy
aXZlcnMvZ3B1L2RybS91ZGwvTWFrZWZpbGUgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9k
cm0vdWRsL3VkbF9jb25uZWN0b3IuYyB8ICAxOSArLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
ZHJ2LmMgICAgICAgfCAgMTEgKy0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oICAgICAg
IHwgIDE5ICstCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9lbmNvZGVyLmMgICB8ICA3MCAtLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jICAgICAgICB8IDIxNiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMgICAgICB8ICAgMyAt
CiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgICB8IDI3NiArKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tCiA4IGZpbGVzIGNoYW5nZWQsIDE4NyBpbnNlcnRpb25zKCspLCA0Mjkg
ZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
ZW5jb2Rlci5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIu
YwoKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
