Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE059A8C7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7C56EBBE;
	Fri, 23 Aug 2019 07:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350FD6EB67;
 Thu, 22 Aug 2019 14:37:27 +0000 (UTC)
Received: from ins7386.localdomain (unknown [207.110.43.92])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 50C6F3E8A5;
 Thu, 22 Aug 2019 14:37:24 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v6 0/7] qcom: add OCMEM support
Date: Thu, 22 Aug 2019 07:36:56 -0700
Message-Id: <20190822143703.13030-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Aug 2019 07:30:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1566484646;
 bh=t6TP/PN3jeU5M3ONQYp1VGGuOKetsTewE0YXyKvmcNg=;
 h=From:To:Cc:Subject:Date:From;
 b=rMJkgk0v/7E+UXNxanhygtbLA3/xPZcasXZyYflUk1Ew5ryK8QGcQsOTFqwhLB08r
 fEHi2aWzztbdf36E9FYl3Sz6uVeuOkrY2fQi/xnkom8/1bw7rZ0GIGwp5uFESDnGO6
 QJjKagQ3mCgBIC6vL4eCKPZcJoR07bN7vmjrdxrA=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBRdWFsY29tbSdzIE9uIENoaXAgTUVN
b3J5IChPQ01FTSkKdGhhdCBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gc3VwcG9ydCBzb21lIGEzeHgg
YW5kIGE0eHgtYmFzZWQgR1BVcwp1cHN0cmVhbS4gVGhpcyBpcyBiYXNlZCBvbiBSb2IgQ2xhcmsn
cyBwYXRjaCBzZXJpZXMgdGhhdCBoZSBzdWJtaXR0ZWQKaW4gT2N0b2JlciAyMDE1IGFuZCBJIGFt
IHJlc3VibWl0dGluZyB1cGRhdGVkIHBhdGNoZXMgd2l0aCBoaXMKcGVybWlzc2lvbi4gU2VlIHRo
ZSBpbmRpdmlkdWFsIHBhdGNoZXMgZm9yIHRoZSBjaGFuZ2Vsb2cuCgpUaGlzIHdhcyB0ZXN0ZWQg
d2l0aCB0aGUgR1BVIG9uIGEgTEcgTmV4dXMgNSAoaGFtbWVyaGVhZCkgcGhvbmUgYW5kCnRoaXMg
d2lsbCB3b3JrIG9uIG90aGVyIG1zbTg5NzQtYmFzZWQgc3lzdGVtcy4gRm9yIGEgc3VtbWFyeSBv
ZiB3aGF0CmN1cnJlbnRseSB3b3JrcyB1cHN0cmVhbSBvbiB0aGUgTmV4dXMgNSwgc2VlIG15IHN0
YXR1cyBwYWdlIGF0Cmh0dHBzOi8vbWFzbmV5Yi5naXRodWIuaW8vbmV4dXMtNS11cHN0cmVhbS8u
CgpDaGFuZ2VzIHNpbmNlIHY1OgotIFJlbmFtZSBvY21lbSBkZXZpY2UgdHJlZSBwcm9wZXJ0eSB0
byBzcmFtCgpTZWUgaW5kaXZpZHVhbCBwYXRjaGVzIGZvciBjaGFuZ2Vsb2dzIGZvciBwcmV2aW91
cyB2ZXJzaW9ucy4KCkJyaWFuIE1hc25leSAoNSk6CiAgZHQtYmluZGluZ3M6IHNvYzogcWNvbTog
YWRkIE9uIENoaXAgTUVNb3J5IChPQ01FTSkgYmluZGluZ3MKICBkdC1iaW5kaW5nczogZGlzcGxh
eTogbXNtOiBnbXU6IGFkZCBvcHRpb25hbCBvY21lbSBwcm9wZXJ0eQogIHNvYzogcWNvbTogYWRk
IE9DTUVNIGRyaXZlcgogIGRybS9tc20vZ3B1OiBhZGQgb2NtZW0gaW5pdC9jbGVhbnVwIGZ1bmN0
aW9ucwogIEFSTTogcWNvbV9kZWZjb25maWc6IGFkZCBvY21lbSBzdXBwb3J0CgpSb2IgQ2xhcmsg
KDIpOgogIGZpcm13YXJlOiBxY29tOiBzY206IGFkZCBPQ01FTSBsb2NrL3VubG9jayBpbnRlcmZh
Y2UKICBmaXJtd2FyZTogcWNvbTogc2NtOiBhZGQgc3VwcG9ydCB0byByZXN0b3JlIHNlY3VyZSBj
b25maWcgdG8KICAgIHFjbV9zY20tMzIKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21zbS9nbXUudHh0ICAgfCAgNTAgKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0vcWNv
bSxvY21lbS55YW1sICB8ICA5NiArKysrCiBhcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmln
ICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9maXJtd2FyZS9xY29tX3NjbS0zMi5jICAg
ICAgICAgICAgICAgIHwgIDUyICsrLQogZHJpdmVycy9maXJtd2FyZS9xY29tX3NjbS02NC5jICAg
ICAgICAgICAgICAgIHwgIDEyICsKIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20uYyAgICAgICAg
ICAgICAgICAgICB8ICA1MyArKysKIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20uaCAgICAgICAg
ICAgICAgICAgICB8ICAgOSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTN4eF9ncHUuYyAg
ICAgICAgIHwgIDI4ICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5oICAg
ICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E0eHhfZ3B1LmMgICAg
ICAgICB8ICAyNSArLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTR4eF9ncHUuaCAgICAg
ICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMgICAg
ICAgfCAgNDAgKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuaCAgICAg
ICB8ICAxMCArCiBkcml2ZXJzL3NvYy9xY29tL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
fCAgMTAgKwogZHJpdmVycy9zb2MvcWNvbS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsKIGRyaXZlcnMvc29jL3Fjb20vb2NtZW0uYyAgICAgICAgICAgICAgICAgICAgICB8IDQz
MyArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvcWNvbV9zY20uaCAgICAgICAgICAg
ICAgICAgICAgICB8ICAyNiArKwogaW5jbHVkZS9zb2MvcWNvbS9vY21lbS5oICAgICAgICAgICAg
ICAgICAgICAgIHwgIDYyICsrKwogMTkgZmlsZXMgY2hhbmdlZCwgODcwIGluc2VydGlvbnMoKyks
IDQ1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zcmFtL3Fjb20sb2NtZW0ueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvc29jL3Fjb20vb2NtZW0uYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc29jL3Fj
b20vb2NtZW0uaAoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
