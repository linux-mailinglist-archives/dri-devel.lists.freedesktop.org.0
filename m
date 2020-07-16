Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D88222F04
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 01:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFD16ED21;
	Thu, 16 Jul 2020 23:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E297A6E135
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 23:31:05 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A488220870;
 Thu, 16 Jul 2020 23:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594942265;
 bh=Bcdw+IuUUhuWHE6ZYrxnpLxm+0jqUc5X3yImBcVA+mE=;
 h=From:To:Cc:Subject:Date:From;
 b=HKAeTQbWyXGIpJljq5h6bH1SoqCM+b2Iq50BzdB0IFkqtnUgPtpss6D/l6tGGcjCs
 2d3udwQpDFt6/MoEvPyknKGZguHBRnokIK5iC3MjBjY9GqJXV/ZxSqDX334P739Lna
 ix3/y8TFmZZxnHjAN1kqYtfq7gvp9546XX5rCq1A=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.9
Date: Fri, 17 Jul 2020 07:31:02 +0800
Message-Id: <20200716233102.566-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhdmUgJiBEYW5pZWw6CgpUaGlzIGluY2x1ZGUgY29udmVydGluZyBtdGtfZHNpIHRvIGRy
bV9icmlkZ2UgQVBJLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KClRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQgNWFiNTQ2ZjVlNjMwOTM3M2FlZjAxYThkMzk4ZTE2M2FiN2E3ODQzMToK
CsKgIGRybS9tZWRpYXRlazogbXRrX2hkbWk6IFJlbW92ZSBkZWJ1ZyBtZXNzYWdlcyBmb3IgZnVu
Y3Rpb24gY2FsbHMgKDIwMjAtMDctMDUgMDY6Mzk6MjEgKzA4MDApCgphcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCsKgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQgdGFncy9tZWRpYXRlay1k
cm0tbmV4dC01LjkKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBhOWQ5ZmVhNzRiZTI4
NWEyODg1ZDhmMzM5NTA0MmNjNGRkZTI3ZTZhOgoKwqAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBD
cmVhdGUgY29ubmVjdG9yIGZvciBicmlkZ2VzICgyMDIwLTA3LTA1IDA4OjA2OjI4ICswODAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpNZWRpYXRlayBEUk0gTmV4dCBmb3IgTGludXggNS45CgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkVucmljIEJh
bGxldGJvIGkgU2VycmEgKDUpOgrCoCDCoCDCoCBkcm0vbWVkaWF0ZWs6IG10a19kc2k6IFJlbmFt
ZSBicmlkZ2UgdG8gbmV4dF9icmlkZ2UKwqAgwqAgwqAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBD
b252ZXJ0IHRvIGJyaWRnZSBkcml2ZXIKwqAgwqAgwqAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBV
c2Ugc2ltcGxlIGVuY29kZXIKwqAgwqAgwqAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBVc2UgdGhl
IGRybV9wYW5lbF9icmlkZ2UgQVBJCsKgIMKgIMKgIGRybS9tZWRpYXRlazogbXRrX2RzaTogQ3Jl
YXRlIGNvbm5lY3RvciBmb3IgYnJpZGdlcwoKwqBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jIHwgMjY5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCsKgMSBmaWxlIGNoYW5nZWQsIDg0IGlu
c2VydGlvbnMoKyksIDE4NSBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
