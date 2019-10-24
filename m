Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623AFE28B9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 05:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B166E072;
	Thu, 24 Oct 2019 03:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1296F6E071;
 Thu, 24 Oct 2019 03:18:29 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id r5so35718094qtd.0;
 Wed, 23 Oct 2019 20:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CqwtGjiHJPsqe79kxiwUoSj6ec+Av4Ks7FNaJqGgEw4=;
 b=IOFXBegzNYb7SbqVdy+stfxl90H8nWCTt4wU9I7E/r0WihMa14OVMdUS0YOksF8Cjo
 NOR1rzPPeZV4O6OGn98N60/D5sejw+xBP8quH6Cb5a0Wizp3kiZ1lWF7TCw5If9r7ANp
 vhyIRex7yRMOZQA5gk3UO/SEk/OdWVQbLfN+C8lcXKeymFnSbL2wCre5PbEiuRPxZmLu
 JbFsPMsilrZWv4mG/KHoBwZVluH4wkM+aA8fc2i3XnYNu4nrBUatUuls3JfcCAzHfd1h
 QuTmZX0KxYKjxxReZH9v1sMaaQ3QxF57EDuEfsOUnWkWrzHfsgMiIh2qkxY2PNW0/KPG
 +7bQ==
X-Gm-Message-State: APjAAAWvIYNxWDFSGhnzFh/Yr1zzo9/ZXyp5Q4mEuZNQjnCEP6Oe5h7Q
 pQKLM5IndMj+x2mDhz2O77GIMo+uX7w=
X-Google-Smtp-Source: APXvYqwQV98s3NgXMYknJeIu6f0sPStFrvr4+HqlU5e080TxN3jp0PYuxCirBx1oOCWLXf0XcfIutA==
X-Received: by 2002:a0c:b454:: with SMTP id e20mr12473781qvf.14.1571887107698; 
 Wed, 23 Oct 2019 20:18:27 -0700 (PDT)
Received: from localhost.localdomain ([198.54.100.4])
 by smtp.gmail.com with ESMTPSA id h184sm6805822qkd.66.2019.10.23.20.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 20:18:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.4
Date: Wed, 23 Oct 2019 23:18:09 -0400
Message-Id: <20191024031809.3155-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CqwtGjiHJPsqe79kxiwUoSj6ec+Av4Ks7FNaJqGgEw4=;
 b=XbACDGD8cMFLgN8ObbfMg9xQddGuwndLuGH2bhqFv9zW4TyU1+f5+ae1HQqK6fUoD7
 oQtSq3sb9gdFXORcR0+DrOW8LB5v3Nv4Q2nc1P66QtNRMUDv7yuizTL0r5KGIpLy3966
 3hME0Iz2vLqa5CxZG5DEvEMEPMYcoYDeZtU/lD9Xar6MCOD7qot9Fel8CtRPqcj8ABHk
 EmYYBsiv+NHRAKtsWgs9jgJW0mzJh0MBtT8arBBOJjfbUxaE+LC8RhXhD/BGS53h0jBU
 RorzO/+cLtHKhulbP9G9aeDcl6AzXoH54M6huvauw6ES2iHWAKDKLJ8coOIocUNhs+Nl
 kHwA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuNCBmb3IgYW1kZ3B1LgoKVGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1YzFlMzRiNTE1OWVjNjViZjMzZTJjMWE2MmZhNzE1ODEz
MmMxMGNmOgoKICBNZXJnZSB0YWcgJ2RybS1taXNjLWZpeGVzLTIwMTktMTAtMTcnIG9mIGdpdDov
L2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYyBpbnRvIGRybS1maXhlcyAoMjAx
OS0xMC0xOCAwNjo0MDoyOCArMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0OgoKICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCB0YWdz
L2RybS1maXhlcy01LjQtMjAxOS0xMC0yMwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IGVlMDI3ODI4YzQwZmFhOTJhN2VmNGMyYjA2NDFiYmIzZjRiZTk1ZDM6CgogIGRybS9hbWRncHUv
dmNlOiBmaXggYWxsb2NhdGlvbiBzaXplIGluIGVuYyByaW5nIHRlc3QgKDIwMTktMTAtMTcgMTc6
MTI6MzQgLTA0MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRybS1maXhlcy01LjQtMjAxOS0xMC0yMzoKCmFtZGdwdToK
LSBGaXggc3VzcGVuZC9yZXN1bWUgaXNzdWUgcmVsYXRlZCB0byBtdWx0aS1tZWRpYSBlbmdpbmVz
Ci0gRml4IG1lbW9yeSBsZWFrIGluIHVzZXIgcHRyIGNvZGUgcmVsYXRlZCB0byBobW0gY29udmVy
c2lvbgotIEZpeCBwb3NzaWJsZSBWTSBmYXVsdHMgd2hlbiBhbGxvY2F0aW5nIHBhZ2UgdGFibGUg
bWVtb3J5Ci0gRml4IGVycm9yIGhhbmRsaW5nIGluIGJvIGxpc3QgaW9jdGwKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQWxl
eCBEZXVjaGVyICg0KToKICAgICAgZHJtL2FtZGdwdS91dmQ2OiBmaXggYWxsb2NhdGlvbiBzaXpl
IGluIGVuYyByaW5nIHRlc3QgKHYyKQogICAgICBkcm0vYW1kZ3B1L3V2ZDc6IGZpeCBhbGxvY2F0
aW9uIHNpemUgaW4gZW5jIHJpbmcgdGVzdCAodjIpCiAgICAgIGRybS9hbWRncHUvdmNuOiBmaXgg
YWxsb2NhdGlvbiBzaXplIGluIGVuYyByaW5nIHRlc3QKICAgICAgZHJtL2FtZGdwdS92Y2U6IGZp
eCBhbGxvY2F0aW9uIHNpemUgaW4gZW5jIHJpbmcgdGVzdAoKQ2hyaXN0aWFuIEvDtm5pZyAoMik6
CiAgICAgIGRybS9hbWRncHU6IGZpeCBwb3RlbnRpYWwgVk0gZmF1bHRzCiAgICAgIGRybS9hbWRn
cHU6IGZpeCBlcnJvciBoYW5kbGluZyBpbiBhbWRncHVfYm9fbGlzdF9jcmVhdGUKClBoaWxpcCBZ
YW5nICgxKToKICAgICAgZHJtL2FtZGdwdTogdXNlciBwYWdlcyBhcnJheSBtZW1vcnkgbGVhayBm
aXgKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jIHwgIDcgKysr
KystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyAgICAgIHwgIDggKyst
LS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jICB8ICAzICsr
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jICAgICB8IDIwICsrKysr
KysrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmggICAg
IHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jICAgICB8IDM1
ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS91dmRfdjZfMC5jICAgICAgIHwgMzEgKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYyAgICAgICB8IDMzICsrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLQogOCBmaWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspLCA0NiBkZWxl
dGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
