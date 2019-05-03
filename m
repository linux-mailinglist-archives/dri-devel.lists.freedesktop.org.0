Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C1514532
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCDB89395;
	Mon,  6 May 2019 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882046E83D;
 Fri,  3 May 2019 17:58:46 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id u17so3241224pfn.7;
 Fri, 03 May 2019 10:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ooXXaTjW3PGU+EmYpvlg4whjJfgEkcywCH6vUZA4h/w=;
 b=YkMRkh5cZkFwZLwXl8Ea/HvNsrtxg7JFG4utDSr85YN5cwvma6Kyw21rIeT+HnD7mN
 n+7xnkRd8T84fHfMmziN9ah9D6OGOPj4KX9/soimofbVR7CA8C8jNyuAGKqjC3Hw7/Es
 uvI3eRxb8hXII4tupYB/LRxZ3KvLOt7hCUZqDMLcNbeEpw1zFohBw1ZVvHChfvkkGCVS
 GRmxk9SdxGKmLbaCn5SqXV96NsgDX8JRn9dd2R0Qn8WjwfJEdn5nm4foPZ9Fff7N2X2w
 mhYwZvq4KMUc8psgZkzNDIv/Z4pOgQ28o25E2LnFcmworSYV/DFw/m1bDxQt4iq4FuqN
 T+Pg==
X-Gm-Message-State: APjAAAVEGil7+fV1zVk1VtkPv3QU/kMUSvTHA0HVI/lvBw2haZYKVOGv
 lzISZFWATmlEPBVhq6U4EMA=
X-Google-Smtp-Source: APXvYqyXJ7yo91DLg3trGKRJzPJZkZarUay0Mj4BFJGWi6q84c8u3OAlKaaNzmKHZkCV8GEJ2jkH9w==
X-Received: by 2002:aa7:83d1:: with SMTP id j17mr12854399pfn.78.1556906325799; 
 Fri, 03 May 2019 10:58:45 -0700 (PDT)
Received: from CentOS76.localdomain.localdomain ([183.82.21.188])
 by smtp.gmail.com with ESMTPSA id n18sm7019262pfi.48.2019.05.03.10.58.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 10:58:44 -0700 (PDT)
From: jagdsh.linux@gmail.com
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, hierry.reding@gmail.com, jcrouse@codeaurora.org,
 jsanka@codeaurora.org, skolluku@codeaurora.org, paul.burton@mips.com,
 jrdr.linux@gmail.com
Subject: [PATCH] gpu/drm: Remove duplicate headers
Date: Fri,  3 May 2019 23:28:13 +0530
Message-Id: <1556906293-128921-1-git-send-email-jagdsh.linux@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ooXXaTjW3PGU+EmYpvlg4whjJfgEkcywCH6vUZA4h/w=;
 b=UXRQHQnpge6zu7lkrvOLU/fef+EsvPdq+ZsTPefd47hyCMMjQKxVVQoz5x9INsCiUC
 cex6+hfa798VKtERv8ixv9vUVWfXkumVMxX0XDT+twT+ztLSRfbPiROXswHAeAKi8Sez
 erFhtAedMXclfQttXvIxPwHbdbb+0sfO2jc+By54JzDJTdZYBjSWAEFtv5cOAbIFVMdE
 2M1hSgz7Qs5RHKaV6i5JJR9vTPi0tItrBng8xOVWBmAyotpHGzd348cyMoq9l2sL+hQc
 a/R5alkElgraFZ10WPkV9h1rJGM3elfoSXGzo/HyzNsonno1Ebhv2GTfk7wS/gH3Dye7
 88LA==
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
Cc: Jagadeesh Pagadala <jagdsh.linux@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFnYWRlZXNoIFBhZ2FkYWxhIDxqYWdkc2gubGludXhAZ21haWwuY29tPgoKUmVtb3Zl
IGR1cGxpY2F0ZSBoZWFkZXJzIHdoaWNoIGFyZSBpbmNsdWRlZCB0d2ljZS4KClNpZ25lZC1vZmYt
Ynk6IEphZ2FkZWVzaCBQYWdhZGFsYSA8amFnZHNoLmxpbnV4QGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfbG0uYyAgICAgICAgICAgICB8IDEgLQog
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYnVzL252MDQuYyAgICAgICAgfCAy
IC0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4u
YyB8IDEgLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19sbS5jIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMKaW5kZXggMDE4ZGYyYy4uNDVhNWJjNiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMKQEAgLTE1LDcgKzE1LDYgQEAK
ICNpbmNsdWRlICJkcHVfaHdpby5oIgogI2luY2x1ZGUgImRwdV9od19sbS5oIgogI2luY2x1ZGUg
ImRwdV9od19tZHNzLmgiCi0jaW5jbHVkZSAiZHB1X2ttcy5oIgogCiAjZGVmaW5lIExNX09QX01P
REUgICAgICAgICAgICAgICAgICAgICAgICAweDAwCiAjZGVmaW5lIExNX09VVF9TSVpFICAgICAg
ICAgICAgICAgICAgICAgICAweDA0CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9idXMvbnYwNC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvYnVzL252MDQuYwppbmRleCBjODBiOTY3Li4yYjQ0YmE1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9idXMvbnYwNC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2J1cy9udjA0LmMKQEAgLTI2LDggKzI2LDYgQEAK
IAogI2luY2x1ZGUgPHN1YmRldi9ncGlvLmg+CiAKLSNpbmNsdWRlIDxzdWJkZXYvZ3Bpby5oPgot
CiBzdGF0aWMgdm9pZAogbnYwNF9idXNfaW50cihzdHJ1Y3QgbnZrbV9idXMgKmJ1cykKIHsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNj
cmVlbi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2Ny
ZWVuLmMKaW5kZXggMmM5Yzk3Mi4uY2FjZjJlMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMKQEAgLTUzLDcgKzUzLDYg
QEAKICNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5oPgogI2luY2x1ZGUgPGxpbnV4L3BtLmg+CiAK
LSNpbmNsdWRlIDxkcm0vZHJtX3BhbmVsLmg+CiAjaW5jbHVkZSA8ZHJtL2RybVAuaD4KICNpbmNs
dWRlIDxkcm0vZHJtX2NydGMuaD4KICNpbmNsdWRlIDxkcm0vZHJtX21pcGlfZHNpLmg+Ci0tIAox
LjguMy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
