Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8B956427
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072686E2EC;
	Wed, 26 Jun 2019 08:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670756E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 10:24:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 7C869288DC0
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Associate ddc adapters with connectors
Date: Tue, 25 Jun 2019 12:24:39 +0200
Message-Id: <cover.1561458051.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190625101655.n246vbwtupb4eoyz@shell.armlinux.org.uk>
References: <20190625101655.n246vbwtupb4eoyz@shell.armlinux.org.uk>
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
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
Cc: linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgZGlmZmljdWx0IGZvciBhIHVzZXIgdG8ga25vdyB3aGljaCBvZiB0aGUgaTJjIGFkYXB0
ZXJzIGlzIGZvciB3aGljaApkcm0gY29ubmVjdG9yLiBUaGlzIHNlcmllcyBhZGRyZXNzZXMgdGhp
cyBwcm9ibGVtLgoKVGhlIGlkZWEgaXMgdG8gaGF2ZSBhIHN5bWJvbGljIGxpbmsgaW4gY29ubmVj
dG9yJ3Mgc3lzZnMgZGlyZWN0b3J5LCBlLmcuOgoKbHMgLWwgL3N5cy9jbGFzcy9kcm0vY2FyZDAt
SERNSS1BLTEvZGRjCmxyd3hyd3hyd3ggMSByb290IHJvb3QgMCBKdW4gMjQgMTA6NDIgL3N5cy9j
bGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvZGRjIFwKCS0+IC4uLy4uLy4uLy4uL3NvYy8xMzg4MDAw
MC5pMmMvaTJjLTIKClRoZSB1c2VyIHRoZW4ga25vd3MgdGhhdCB0aGVpciBjYXJkMC1IRE1JLUEt
MSB1c2VzIGkyYy0yIGFuZCBjYW4gZS5nLiBydW4KZGRjdXRpbDoKCmRkY3V0aWwgLWIgMiBnZXR2
Y3AgMHgxMApWQ1AgY29kZSAweDEwIChCcmlnaHRuZXNzICAgICAgICAgICAgICAgICAgICApOiBj
dXJyZW50IHZhbHVlID0gICAgOTAsIG1heCB2YWx1ZSA9ICAgMTAwCgpUaGUgZmlyc3QgcGF0Y2gg
aW4gdGhlIHNlcmllcyBhZGRzIHN0cnVjdCBpMmNfYWRhcHRlciBwb2ludGVyIHRvIHN0cnVjdApk
cm1fY29ubmVjdG9yLiBJZiB0aGUgZmllbGQgaXMgdXNlZCBieSBhIHBhcnRpY3VsYXIgZHJpdmVy
LCB0aGVuIGFuCmFwcHJvcHJpYXRlIHN5bWJvbGljIGxpbmsgaXMgY3JlYXRlZCBieSB0aGUgZ2Vu
ZXJpYyBjb2RlLCB3aGljaCBpcyBhbHNvIGFkZGVkCmJ5IHRoaXMgcGF0Y2guCgpUaGUgc2Vjb25k
IHBhdGNoIGlzIGFuIGV4YW1wbGUgb2YgaG93IHRvIGNvbnZlcnQgYSBkcml2ZXIgdG8gdGhpcyBu
ZXcgc2NoZW1lLgoKdjEuLnYyOgoKLSB1c2VkIGZpeGVkIG5hbWUgImRkYyIgZm9yIHRoZSBzeW1i
b2xpYyBsaW5rIGluIG9yZGVyIHRvIG1ha2UgaXQgZWFzeSBmb3IKdXNlcnNwYWNlIHRvIGZpbmQg
dGhlIGkyYyBhZGFwdGVyCgpBbmRyemVqIFBpZXRyYXNpZXdpY3ogKDIpOgogIGRybTogSW5jbHVk
ZSBkZGMgYWRhcHRlciBwb2ludGVyIGluIHN0cnVjdCBkcm1fY29ubmVjdG9yCiAgZHJtL2V4eW5v
czogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3IncyBzeXNmcwoKIGRyaXZlcnMvZ3B1
L2RybS9kcm1fc3lzZnMuYyAgICAgICAgICB8ICA3ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2hkbWkuYyB8IDExICsrKysrLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fY29u
bmVjdG9yLmggICAgICAgICAgfCAxMSArKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMyBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
