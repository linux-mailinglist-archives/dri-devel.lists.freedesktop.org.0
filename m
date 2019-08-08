Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FE885D78
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 10:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFB66E48C;
	Thu,  8 Aug 2019 08:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5656D6E14C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 08:55:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r3so343888wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 01:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U7mRPaAFiVltDPu4JSR3Yp6zM4Cf+22qPlOKI/zfYrU=;
 b=VT6oaAxa5r5tblXmPpB3TdhXvscsgGPcWD602NnELntosrLslTKZUCH8bc8qRNaLoO
 xQ1ePdEuT/DbTLfqHkF6IUCSr1VC+BZLfPR4nTVYdXhDO1tIHXFnYQpvi6jNid0B3lXl
 cD5dAlXdZUkBT4fcfbk2no2sGZ5UnfBpL/2PJSGrxuxKwVt/kaaTdN+xo1KQbH9jEyTa
 cwMLFlQYOGwzAPlqOuji4Q4mnVwt/uvOnKxnuHVBro7fMBlS3HPHfF0VArn8sC/amicu
 tc78jMobRbz6g7cqroQRFNFLNSzbOnSYY7sJkWbYBfI981GCyHvuEKNn9VGHxsUdBIjj
 iJjw==
X-Gm-Message-State: APjAAAVRSaC9cktsSvlyQXIW1t+8BqH46z3kaQ+WSsEvW0wvLzPsj5kI
 VlSzhRmQr7/XPG4nd8CPAyoL8g==
X-Google-Smtp-Source: APXvYqzd7NmT/FM1gVCi923HMojL2+NSOYVprF5ZiqEcVi0GIfQIkAt5xkVVtJuUqtq+PdXpXwjLhw==
X-Received: by 2002:adf:8bd1:: with SMTP id w17mr16642922wra.50.1565254524653; 
 Thu, 08 Aug 2019 01:55:24 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i66sm3380649wmi.11.2019.08.08.01.55.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 01:55:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH v3 0/3] drm/meson: convert bindings to YAML schemas
Date: Thu,  8 Aug 2019 10:55:19 +0200
Message-Id: <20190808085522.21950-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U7mRPaAFiVltDPu4JSR3Yp6zM4Cf+22qPlOKI/zfYrU=;
 b=gkdlcrlz3L1NcoJFdDDV7X9nMVELcEblkgxcYsF7dUHOi/CeiGmlqx+C+uEn5bFvrr
 iwaBW4qCWbND0XKzks4YF81jkntz3/zVTohZhnNkR4jB/rEdApnvA52KVGCuRp3fR9cf
 L+dZcCwOl7xRI8fbor/W9sQCmMbxqnILRlFifyvyeALYukSSWw/we+sx/gCo+qJIyd68
 7IbOKuPNaENrBcYBsvlmBoBMpedoKtj1Y7bQoNcH3f8Pq+sPxe+gsiaVR8+Cks7WPwc6
 b+p/9pcNvEqy95KahteRW7wyIEdDQZhlMC6RGIAClUAa88O28ygd+HCZJ3drLaBwXnfc
 l62Q==
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBjb252ZXJ0cyB0aGUgZXhpc3RpbmcgdGV4dCBiaW5kaW5ncyB0byBZQU1M
IHNjaGVtYXMuCgpUaG9zZSBiaW5kaW5ncyBoYXZlIGEgbG90IG9mIHRleHRzLCB0aHVzIGlzIGlu
dGVyZXN0aW5nIHRvIGNvbnZlcnQuCgpBbGwgaGF2ZSBiZWVuIHRlc3RlZCB1c2luZyA6CiQgbWFr
ZSBBUkNIPWFybTY0IGR0YnNfY2hlY2sKCklzc3VlcyB3aXRoIHRoZSBhbWxvZ2ljIGFybTY0IERU
cyBoYXMgYWxyZWFkeSBiZWVuIGlkZW50aWZpZWQgdGhhbmtzCnRvIHRoZSB2YWxpZGF0aW9uIHNj
cmlwdHMuIFRoZSBEVCBmaXhlcyB3aWxsIGJlIHB1c2hlZCBvbmNlIHRoZXNlIHlhbWwKYmluZGlu
Z3MgYXJlIGFja2VkLgoKQ2hhbmdlcyBzaW5jZSB2MjoKLSBBZGRlZCByZXZpZXcgdGFnIG9uIGFt
bG9naWMsbWVzb24tZHctaGRtaS55YW1sCi0gUmVtb3ZlZCBwb3dlci1kb21haW5zIHR5cGUgZnJv
bSBhbWxvZ2ljLG1lc29uLXZwdS55YW1sCgpOZWlsIEFybXN0cm9uZyAoMyk6CiAgZHQtYmluZGlu
Z3M6IGRpc3BsYXk6IGFtbG9naWMsbWVzb24tZHctaGRtaTogY29udmVydCB0byB5YW1sCiAgZHQt
YmluZGluZ3M6IGRpc3BsYXk6IGFtbG9naWMsbWVzb24tdnB1OiBjb252ZXJ0IHRvIHlhbWwKICBN
QUlOVEFJTkVSUzogVXBkYXRlIHdpdGggQW1sb2dpYyBEUk0gYmluZGluZ3MgY29udmVydGVkIGFz
IFlBTUwKCiAuLi4vZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkudHh0ICAgICAgICAgfCAx
MTkgLS0tLS0tLS0tLS0tLS0KIC4uLi9kaXNwbGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1s
ICAgICAgICB8IDE1MCArKysrKysrKysrKysrKysrKysKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2Ft
bG9naWMsbWVzb24tdnB1LnR4dCAgICB8IDEyMSAtLS0tLS0tLS0tLS0tLQogLi4uL2JpbmRpbmdz
L2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi12cHUueWFtbCAgIHwgMTM3ICsrKysrKysrKysrKysrKysK
IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQog
NSBmaWxlcyBjaGFuZ2VkLCAyODkgaW5zZXJ0aW9ucygrKSwgMjQyIGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2FtbG9naWMsbWVzb24tZHctaGRtaS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFt
bAogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2FtbG9naWMsbWVzb24tdnB1LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tdnB1LnlhbWwK
Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
