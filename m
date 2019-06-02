Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77F329DA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E9889733;
	Mon,  3 Jun 2019 07:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.daemonic.se (mail.daemonic.se [IPv6:2607:f740:d:20::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620B489A57
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2019 18:23:26 +0000 (UTC)
Received: from cid.daemonic.se (localhost [IPv6:::1])
 by mail.daemonic.se (Postfix) with ESMTP id 45H5y445gZz3khN
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2019 18:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at daemonic.se
Received: from mail.daemonic.se ([IPv6:::1]) (using TLS with cipher
 ECDHE-RSA-AES128-GCM-SHA256)
 by cid.daemonic.se (mailscanner.daemonic.se [IPv6:::1]) (amavisd-new,
 port 10587)
 with ESMTPS id UFtaBACOakBo; Sun,  2 Jun 2019 18:17:32 +0000 (UTC)
Received: from vivi.daemonic.se.se (vivi.daemonic.se [IPv6:2001:470:dca9:2::4])
 by mail.daemonic.se (Postfix) with ESMTPSA id 45H5y36PmZz3khL;
 Sun,  2 Jun 2019 18:17:31 +0000 (UTC)
From: Niclas Zeising <zeising@daemonic.se>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 2/2] meson.build: Fix meson script on FreeBSD
Date: Sun,  2 Jun 2019 20:16:00 +0200
Message-Id: <20190602181600.83963-3-zeising@daemonic.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190602181600.83963-1-zeising@daemonic.se>
References: <20190602181600.83963-1-zeising@daemonic.se>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:40:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=daemonic.se; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received; s=20151023; t=1559499452; bh=qIp+nLTkVbiSwcc
 dUiiUVLADSqorxYS1TYKfu5C27mM=; b=N20S0YAsuarhOI0pjqg/OYVQOPIWsvS
 a6A9Qq/bD/d2xSjNLpkzEe6ek+y+JzK3hooppqjRtRNId9pvXsn29bHSpdiooDnm
 flTtgJNlyoqTJGWr+M3KKLpPFCzsuHvA22He1lHv3xRf0A62SVRSFQm50eOD8AGR
 k4YLLcNfl+Jg=
X-Mailman-Original-Authentication-Results: mailscanner.daemonic.se
 (amavisd-new); 
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=daemonic.se
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
Cc: Niclas Zeising <zeising@daemonic.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJlZUJTRCByZXF1aXJlcyBzeXMvdHlwZXMuaCBmb3Igc3lzL3N5c2N0bC5oLCBhZGQgaXQgYXMg
cGFydCBvZiB0aGUKaW5jbHVkZXMgd2hlbiBjaGVja2luZyBmb3IgaGVhZGVycy4KSW5zdGVhZCBv
ZiBzcGxpdHRpbmcgb3V0IHRoZSBjaGVjayBmb3Igc3lzL3N5c2N0bC5oIGZyb20gdGhlIG90aGVy
CmhlYWRlciBjaGVja3MsIGp1c3QgYWRkIHN5cy90eXBlcy5oIHRvIGFsbCBoZWFkZXIgY2hlY2tz
LgoKRnJlZUJTRCBkb2Vzbid0IG5vcm1hbGx5IHNoaXAgYmFzaCwgdHJ5IHJlZ3VsYXIgc2ggaW5z
dGVhZCBpZiB3ZSBjYW4ndApmaW5kIGJhc2guCi0tLQogbWVzb24uYnVpbGQgfCA0ICsrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAppbmRleCA2NGYwZDViMS4uZWI1NWI5MTggMTAw
NjQ0Ci0tLSBhL21lc29uLmJ1aWxkCisrKyBiL21lc29uLmJ1aWxkCkBAIC0xODEsNyArMTgxLDcg
QEAgZW5kaWYKIGRlcF9tID0gY2MuZmluZF9saWJyYXJ5KCdtJywgcmVxdWlyZWQgOiBmYWxzZSkK
IGZvcmVhY2ggaGVhZGVyIDogWydzeXMvc3lzY3RsLmgnLCAnc3lzL3NlbGVjdC5oJywgJ2FsbG9j
YS5oJ10KICAgY29uZmlnLnNldCgnSEFWRV8nICsgaGVhZGVyLnVuZGVyc2NvcmlmeSgpLnRvX3Vw
cGVyKCksCi0gICAgY2MuY29tcGlsZXMoJyNpbmNsdWRlIDxAMEA+Jy5mb3JtYXQoaGVhZGVyKSwg
bmFtZSA6ICdAMEAgd29ya3MnLmZvcm1hdChoZWFkZXIpKSkKKyAgICBjYy5jb21waWxlcygnI2lu
Y2x1ZGUgPHN5cy90eXBlcy5oPlxuI2luY2x1ZGUgPEAwQD4nLmZvcm1hdChoZWFkZXIpLCBuYW1l
IDogJ0AwQCB3b3JrcycuZm9ybWF0KGhlYWRlcikpKQogZW5kZm9yZWFjaAogaWYgY2MuaGFzX2hl
YWRlcl9zeW1ib2woJ3N5cy9zeXNtYWNyb3MuaCcsICdtYWpvcicpCiAgIGNvbmZpZy5zZXQxMCgn
TUFKT1JfSU5fU1lTTUFDUk9TJywgdHJ1ZSkKQEAgLTI0OSw3ICsyNDksNyBAQCBlbmRpZgogd2l0
aF9tYW5fcGFnZXMgPSB3aXRoX21hbl9wYWdlcyAhPSAnZmFsc2UnIGFuZCBwcm9nX3hzbHQuZm91
bmQoKSBhbmQgcHJvZ19zZWQuZm91bmQoKQogCiAjIFVzZWQgZm9yIHRlc3RzCi1wcm9nX2Jhc2gg
PSBmaW5kX3Byb2dyYW0oJ2Jhc2gnKQorcHJvZ19iYXNoID0gZmluZF9wcm9ncmFtKCdiYXNoJywg
J3NoJykKIAogY29uZmlnLnNldDEwKCdIQVZFX1ZJU0lCSUxJVFknLAogICBjYy5jb21waWxlcygn
JydpbnQgZm9vX2hpZGRlbih2b2lkKSBfX2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5KCgiaGlkZGVu
IikpKSk7JycnLAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
