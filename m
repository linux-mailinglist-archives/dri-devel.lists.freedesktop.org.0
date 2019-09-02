Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D2A5D05
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5351789A4B;
	Mon,  2 Sep 2019 20:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20B8899E6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:43:13 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y72so1367786pfb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 05:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ooe5z12tf4eCBGCVXGJZdyU61lnZf8UxozrPAtJtqFg=;
 b=IWKqnr8zCWeZcxrourQNX+X0UdtNqu7I/hfRhF/Gcsmx90ia4qldtWVf95Wzuu+nTz
 FF+Ngc7t+feLn31rxhX0EHIisLfum7CW4hFrWrsi4i02fMGex7ez8jn/8MRtnY2DU9Sn
 tFSt4rT/6DC7/BMbOxdtLfTU0Yq4elSMms+yulXLCPZ4Bnmx59UMgAjVme4ju5rOZ6Vd
 wVjwZRCD647octGF8pHtBZ3X4DVPAUjQZcaVbLlEPZkIay0Dh88UFdOfA+KcxfuoTxum
 1QzcsPnq6amYNpSSTrHT38R4XK3amHaVOzzZaDfkiQ5Ijb546zMDHu0HjypoqKyRLlEB
 EofA==
X-Gm-Message-State: APjAAAUMLmq0iCtLRaogGXjuffk2MdHBnQKi+66vfvDz8uCeyNfblnDd
 AABFHdFhp/cFXxOeGufEpHo=
X-Google-Smtp-Source: APXvYqyLyzHI4G7B5pK37XIuveSiZGZ9agj2nr+S8QgtKm0qzaCDTZJG50/mG2xYaudRpo8bEPEpEw==
X-Received: by 2002:a62:e30d:: with SMTP id g13mr13849175pfh.42.1567428193475; 
 Mon, 02 Sep 2019 05:43:13 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([49.207.50.39])
 by smtp.gmail.com with ESMTPSA id m102sm2126286pje.5.2019.09.02.05.43.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 02 Sep 2019 05:43:12 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: b.zolnierkie@samsung.com
Subject: [PATCH] video/fbdev/68328fb: Remove dead code
Date: Mon,  2 Sep 2019 18:19:04 +0530
Message-Id: <1567428544-8620-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ooe5z12tf4eCBGCVXGJZdyU61lnZf8UxozrPAtJtqFg=;
 b=LyO2ylq1hMvJP8HhT7mG3uunF78cZErvlO24NmDxqyhxNiCdYGt6pNgVCw1Jxd9HtE
 2gLGK6oFjGGUNacqqhFzoTnVtYoVhI1eP8mHDf2fEY9kSmDDGKqG9tCN00JhEw/uoxWw
 NKw+ZSlhqJnxG5HRQDmIhgAeiBcHi8Qt5xYB+EqzGfeIFHSwzpiIztN/Y33b8qq3zHH1
 dc11/UPJEVWoCK1awbsKTd/NBn0v/c6kBXk4CbcDli9aeug4q0uJc9wLIYhG1Zo4nQ3z
 Ll9kbCP93B+XX6aytGvWmNweWxpbawacxilTi4M4GSiIL6ddW8l+0OE0Xv2FcwOH/BHt
 Ogag==
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
Cc: Souptick Joarder <jrdr.linux@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sabyasachi.linux@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBkZWFkIGNvZGUgc2luY2UgMy4xNS4gSWYgdGhlaXIgaXMgbm8gcGxhbiB0bwp1c2Ug
aXQgZnVydGhlciwgdGhlc2UgY2FuIGJlIHJlbW92ZWQgZm9yZXZlci4KClNpZ25lZC1vZmYtYnk6
IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvNjgzMjhmYi5jIHwgMTIgLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi82ODMyOGZiLmMg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2LzY4MzI4ZmIuYwppbmRleCBkNDhlOTYwLi4wMmQyMmI3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2LzY4MzI4ZmIuYworKysgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2LzY4MzI4ZmIuYwpAQCAtNDA1LDIwICs0MDUsOCBAQCBzdGF0aWMgaW50IG1jNjh4
MzI4ZmJfbW1hcChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEpCiAKIGludCBfX2luaXQgbWM2OHgzMjhmYl9zZXR1cChjaGFyICpvcHRpb25zKQogewotI2lm
IDAKLQljaGFyICp0aGlzX29wdDsKLSNlbmRpZgotCiAJaWYgKCFvcHRpb25zIHx8ICEqb3B0aW9u
cykKIAkJcmV0dXJuIDE7Ci0jaWYgMAotCXdoaWxlICgodGhpc19vcHQgPSBzdHJzZXAoJm9wdGlv
bnMsICIsIikpICE9IE5VTEwpIHsKLQkJaWYgKCEqdGhpc19vcHQpCi0JCQljb250aW51ZTsKLQkJ
aWYgKCFzdHJuY21wKHRoaXNfb3B0LCAiZGlzYWJsZSIsIDcpKQotCQkJbWM2OHgzMjhmYl9lbmFi
bGUgPSAwOwotCX0KLSNlbmRpZgogCXJldHVybiAxOwogfQogCi0tIAoxLjkuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
