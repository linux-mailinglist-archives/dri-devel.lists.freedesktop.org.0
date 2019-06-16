Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318F9474AE
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 15:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D1F891AF;
	Sun, 16 Jun 2019 13:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C780890D2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 13:25:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n9so7084532wru.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 06:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YIXFYxjY0PSo/FTrg9YlPAOOkll9nxmdcu/C6tztHq0=;
 b=D3oslEq5TKspolFHuY5tAlVkIF7aUwPt0JaDDesKUKyRJzy2Jz8mzoWdvD0UsDA21m
 ljDDIocD7+K/tkWu3U3ysu6FqedNAYCUdQn5MOo1aCRFEWspltMMago2PZhEKjDM+k4J
 EBDCn+OqTmX3lCSl88kRyz0BlgEyUXSsAbXie2x4PO6rsGmMlyUssOtWs+So5exAzpUX
 xqiWpO1dN0nzkWPq1GLVLXiAUEIAbUHmRLRgOgy4JG5fvp+IebEAzznOKWVhqWM0Rjdn
 DtdqEfmaULX5M7KGoGDgGPywnuDM4wtnwRZOO2IinWzbjxXi6i1Z3m+Jof7mZvgBdoBg
 rMWA==
X-Gm-Message-State: APjAAAX9amaz18kyFtRXZay32PIBfE7rrxaoS1Ri4qzjqosivkjFawQN
 K90Hi6bQUzOFu8oFkvXAcsDYXe/F
X-Google-Smtp-Source: APXvYqxmwXEeqWm85Pa7u0XEmGe55802qxuqRGnl8XYYdCX7wT0nhKKxU9XlK5xXQc1xqWGabkYufA==
X-Received: by 2002:adf:d081:: with SMTP id y1mr27995575wrh.34.1560691552628; 
 Sun, 16 Jun 2019 06:25:52 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id g2sm9332424wmh.0.2019.06.16.06.25.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 06:25:52 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 4/4] meson.build: Fix meson script on FreeBSD
Date: Sun, 16 Jun 2019 14:23:43 +0100
Message-Id: <20190616132343.26370-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190616132343.26370-1-emil.l.velikov@gmail.com>
References: <20190616132343.26370-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YIXFYxjY0PSo/FTrg9YlPAOOkll9nxmdcu/C6tztHq0=;
 b=mX1CePP3W7QUfsvAA+at9sUN3VewUS57Rv8olmxsfzwYQtezfTayMTwkEhrI64uRKs
 bmQ7pxvmkxd6O0iIc/Chq3BcupgCjfXPtEKMt4QGjvKwEinr3FwEAR3KGTlYUj14RyWx
 5KztN1+0ATNXuSfoT2WbzLDsURUx09gS0l15GmLpwhe1DuQC3mjly6ZUuquy7jJsIvG2
 oyaeeD03Ql1KHPrK5wmyAG3pJFmg4mfZglJiTY3O8r/ktVtMXHeXt4nym2lLrk1klLwN
 b2bxasBLgT/kwe1Ff8vwqKYqFxJJiTQIqc5ALD2sWwveKjuiCYi9jSvxlDuw0PbDn913
 vKdw==
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
Cc: Niclas Zeising <zeising@daemonic.se>,
 Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmljbGFzIFplaXNpbmcgPHplaXNpbmdAZGFlbW9uaWMuc2U+CgpGcmVlQlNEIHJlcXVp
cmVzIHN5cy90eXBlcy5oIGZvciBzeXMvc3lzY3RsLmgsIGFkZCBpdCBhcyBwYXJ0IG9mIHRoZQpp
bmNsdWRlcyB3aGVuIGNoZWNraW5nIGZvciBoZWFkZXJzLgpJbnN0ZWFkIG9mIHNwbGl0dGluZyBv
dXQgdGhlIGNoZWNrIGZvciBzeXMvc3lzY3RsLmggZnJvbSB0aGUgb3RoZXIKaGVhZGVyIGNoZWNr
cywganVzdCBhZGQgc3lzL3R5cGVzLmggdG8gYWxsIGhlYWRlciBjaGVja3MuCgp2MiBbRW1pbF0K
IC0gYWRkIGlubGluZSBjb21tZW50CiAtIGRyb3AgYmFzaC9zaCBodW5rCgpTaWduZWQtb2ZmLWJ5
OiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4KLS0tCiBtZXNvbi5idWls
ZCB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCmluZGV4IGVkNDA3MDA5
Li4xNGY4MmIxZiAxMDA2NDQKLS0tIGEvbWVzb24uYnVpbGQKKysrIGIvbWVzb24uYnVpbGQKQEAg
LTE3OSw5ICsxNzksMTIgQEAgZWxzZQogICBkZXBfcnQgPSBbXQogZW5kaWYKIGRlcF9tID0gY2Mu
ZmluZF9saWJyYXJ5KCdtJywgcmVxdWlyZWQgOiBmYWxzZSkKKyMgRnJvbSBOaWNsYXMgWmVpc2lu
ZzoKKyMgRnJlZUJTRCByZXF1aXJlcyBzeXMvdHlwZXMuaCBmb3Igc3lzL3N5c2N0bC5oLCBhZGQg
aXQgYXMgcGFydCBvZiB0aGUKKyMgaW5jbHVkZXMgd2hlbiBjaGVja2luZyBmb3IgaGVhZGVycy4K
IGZvcmVhY2ggaGVhZGVyIDogWydzeXMvc3lzY3RsLmgnLCAnc3lzL3NlbGVjdC5oJywgJ2FsbG9j
YS5oJ10KICAgY29uZmlnLnNldCgnSEFWRV8nICsgaGVhZGVyLnVuZGVyc2NvcmlmeSgpLnRvX3Vw
cGVyKCksCi0gICAgY2MuY29tcGlsZXMoJyNpbmNsdWRlIDxAMEA+Jy5mb3JtYXQoaGVhZGVyKSwg
bmFtZSA6ICdAMEAgd29ya3MnLmZvcm1hdChoZWFkZXIpKSkKKyAgICBjYy5jb21waWxlcygnI2lu
Y2x1ZGUgPHN5cy90eXBlcy5oPlxuI2luY2x1ZGUgPEAwQD4nLmZvcm1hdChoZWFkZXIpLCBuYW1l
IDogJ0AwQCB3b3JrcycuZm9ybWF0KGhlYWRlcikpKQogZW5kZm9yZWFjaAogaWYgY2MuaGFzX2hl
YWRlcl9zeW1ib2woJ3N5cy9zeXNtYWNyb3MuaCcsICdtYWpvcicpCiAgIGNvbmZpZy5zZXQxMCgn
TUFKT1JfSU5fU1lTTUFDUk9TJywgdHJ1ZSkKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
