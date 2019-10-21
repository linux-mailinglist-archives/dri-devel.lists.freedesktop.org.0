Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE61DEFAF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6686E11B;
	Mon, 21 Oct 2019 14:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD83E6E111
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:34:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id i16so13606216wmd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NaQbxwX1q2SG+oqlG4d0ur59jdppQEFsuKLrKODmKFA=;
 b=ULHpyUX5vn3pLDc3doKLexF/oKK76Os5XSIzGxC8hYDPEkl5aIFhBxYIv4YI0kVzyX
 3HUzEUTS9JVrFSlPOBYHK7cZjSAejdSoteUyyCj40urbdzbE9fj5/hWXIhTf+viE7gkD
 RGjZi5V8yn8LCYlNEyMMBG+MepEweW+G1G6MSta/zuvpClB4NUXaJl1g04HjEtGkN+Wy
 xYotM71bteeVpIJZWLzqRkXqbbddcYmt9Jjn8dRYzFU2ldPAMs5U0O8DKlJzhiC3T/+x
 Yq9O1CkViMl16hZz7ytMtQwCETeFBiOsOVMHBJGtFvR5JV22O4oKjNYCCL6mkXyQNVJi
 OK5g==
X-Gm-Message-State: APjAAAUFbCuPuZqaAU1BL/ObblP2YFlVRJdfFAC7LcF7ELdOfDcmMLYs
 izw4T2XtgBlos7MFZZvrzHYtpGQt
X-Google-Smtp-Source: APXvYqzqh6QauJusnvhtQuEv3ffypURDrhwxWSwLYaqxYzSJi0TYjqRMOm5/gs7Sk+EIF+zYVIhbQA==
X-Received: by 2002:a05:600c:1051:: with SMTP id
 17mr6013007wmx.149.1571668483862; 
 Mon, 21 Oct 2019 07:34:43 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id q124sm27892145wma.5.2019.10.21.07.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:34:42 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/13] drm/dp: Sort includes alphabetically
Date: Mon, 21 Oct 2019 16:34:25 +0200
Message-Id: <20191021143437.1477719-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021143437.1477719-1-thierry.reding@gmail.com>
References: <20191021143437.1477719-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NaQbxwX1q2SG+oqlG4d0ur59jdppQEFsuKLrKODmKFA=;
 b=jbstdwCfJP6LtewryExcAl3fKFh6OYEMa/RFPH8Oa1a+zJEKZSXUsMHqxhY3BnABF1
 QJWAc519GVJNO+jHloYhBQ8LEGdGXDTw3soe78Te/yF3szLrt7dx9E7IowbzgmuSa6L6
 1X7c9eG7MYuWfT+ZurxOjTl5sm6tkYo5d7qj67CZj4djBbffBZwULjjr20lJuk3cG/oV
 M2Azler/aHVBpnQwoVnqAHkvtsLlFwfLELU8W7GiBoLh0wdkQ5pXdKbo4oGWzWWTPAfO
 ICnH6I8uxX3KVJjSHRhK8j3+kzXBCwMbdfeQs1d4OyT3YXYNfq/TDP495q6zey6urcDX
 vFkQ==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCktlZXBpbmcgdGhlIGxp
c3Qgc29ydGVkIGFscGhhYmV0aWNhbGx5IG1ha2VzIGl0IG11Y2ggZWFzaWVyIHRvIGRldGVybWlu
ZQp3aGVyZSB0byBhZGQgbmV3IGluY2x1ZGVzLgoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5
dWRlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52
aWRpYS5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIu
aAppbmRleCBjZmFkZWVlZjg0OTIuLmUwZTc2Zjc2MzRhOSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAt
MjMsOSArMjMsOSBAQAogI2lmbmRlZiBfRFJNX0RQX0hFTFBFUl9IXwogI2RlZmluZSBfRFJNX0RQ
X0hFTFBFUl9IXwogCi0jaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KLSNpbmNsdWRlIDxsaW51eC9p
MmMuaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgorI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgor
I2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAKIC8qCiAgKiBVbmxlc3Mgb3RoZXJ3aXNlIG5vdGVk
LCBhbGwgdmFsdWVzIGFyZSBmcm9tIHRoZSBEUCAxLjFhIHNwZWMuICBOb3RlIHRoYXQKLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
