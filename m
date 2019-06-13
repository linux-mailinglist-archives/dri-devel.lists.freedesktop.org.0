Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C5F43391
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF015893A8;
	Thu, 13 Jun 2019 07:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD14189261;
 Thu, 13 Jun 2019 02:32:17 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id d30so9994000pgm.7;
 Wed, 12 Jun 2019 19:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:user-agent;
 bh=xkZS/4n8OnrgYSMHiWzUE1/UXhjTe20YLD2dQUV8B4c=;
 b=r9y1IdMb51eGGMu9AmCAdIX1WVfx/Gt/hXEsYNTuPFS/SrhdRO/bkHeRdfvnMR5tbo
 JHgIbW7VcoAW2l1WQYwOTTwKnWKRcjZop62MPRREPDTn4L0EvCOy+89WipbyAaL9xgy+
 TotvmM4liFYbkh5XjsNkfBoNfLo479kqseLF/hONuWgNWsJcpQwLrReDYhgQ1LHmGM4Q
 aLVCjSAmWiUQJl7koB2kAl40I6FcQcwzgg2lTKxQpQxjto14jJNtVnal7E2QmaLWXxwI
 dnhpKqNIP3gsQyfL9YByoEL1zZf+Uy67K9yrEUj5brghP8WuANFCO0AAcKm/XgXdnnJz
 lanw==
X-Gm-Message-State: APjAAAX1MfQWAFfST0mAUXEoaAudIqxddZqR5qbjCXOb1L+o3ftMsSQf
 QqAf3JP52EgBcuoyf4x2GUM=
X-Google-Smtp-Source: APXvYqyzyBy3DZLEzDQ6bGsEY8iDhcE/0Hp2X7J+zhBjxOw3b0aUoNTW3wygUppTkRtvjqARqlhImQ==
X-Received: by 2002:a63:454a:: with SMTP id u10mr26199040pgk.291.1560393137384; 
 Wed, 12 Jun 2019 19:32:17 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.89.153])
 by smtp.gmail.com with ESMTPSA id d123sm937199pfc.144.2019.06.12.19.32.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 19:32:16 -0700 (PDT)
Date: Thu, 13 Jun 2019 08:02:08 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Tony Cheng <tony.cheng@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Charlene Liu <charlene.liu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>,
 Gloria Li <geling.li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: fix compilation error
Message-ID: <20190613023208.GA29690@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:user-agent;
 bh=xkZS/4n8OnrgYSMHiWzUE1/UXhjTe20YLD2dQUV8B4c=;
 b=fFaNK8sAY9lLtLBC0qtTWQ9aup0qNgeIKRhfxV791EHyd1t0s/tufYaba/TmNsvU5D
 f0g142WA4UlPtfiy7L90T97GSeovewO5BcptIoyHDSe+hAcnw/jjDMlxrKbjrJ07ZQtY
 KyhgOBGMuvW1z6w2DqxHDrMLxSDk0GSP2njjeHm8FO0IES4FAR5ADiesXyNlssr8bCY/
 aLkasOlhu1onl6ETsQPp84cLESBdpGOKg2vjmY52jkTsq7/eGo3Ud/nG5gA2PI2Rf43g
 BqkC/vEFGPQkbH9VOsKr9I+apvxsWDJFDtFHBN/S+ZgK/rW0ZP31Iov/sjCyJwH68W6N
 NFuw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGhpcyBwYXRjaCBmaXhlcyBiZWxvdyBjb21waWxhdGlvbiBlcnJvcgoKZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYzogSW4K
ZnVuY3Rpb24g4oCYZGNuMTBfYXBwbHlfY3R4X2Zvcl9zdXJmYWNl4oCZOgpkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jOjIz
Nzg6MzoKZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHVkZWxheeKA
mQpbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgdWRlbGF5KHVuZGVy
Zmxvd19jaGVja19kZWxheV91cyk7CgpTaWduZWQtb2ZmLWJ5OiBIYXJpcHJhc2FkIEtlbGFtIDxo
YXJpcHJhc2FkLmtlbGFtQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwppbmRleCBkMjM1Mjk0OS4uMWFjOWE0ZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3
X3NlcXVlbmNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9k
Y24xMF9od19zZXF1ZW5jZXIuYwpAQCAtMjMsNiArMjMsNyBAQAogICoKICAqLwogCisjaW5jbHVk
ZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogI2luY2x1ZGUgImNv
cmVfdHlwZXMuaCIKICNpbmNsdWRlICJyZXNvdXJjZS5oIgotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
