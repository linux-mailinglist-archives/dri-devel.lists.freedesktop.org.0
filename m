Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9581221B09E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B2F6EB84;
	Fri, 10 Jul 2020 07:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EEC6EA77
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:36 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id j18so1941562wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JKW/GFXJRvXHBJ7nA8bjC5XW9nj30bx6DuRlEB0HNtQ=;
 b=NMgaLp5jU8o/Dd3Jp7/66haZtao+33lbMBXYdUVDYGLT7KlbSQWZRSh+T67gWuTkft
 sHofRUKjWfYOkUir0htLzyVeGAL+qTCnf73DqSZSeJh0UOzmEGAoSS9hijBO93aZswti
 hsW5ItgZlpUkt9Uae5JBxyrL6OszGvaG3dPKYkJh+6wYoHqGcSmqyhy0hFUQJLvO7TNJ
 5oZHfxKoC0L3OMQNOmdovrK5BI6QTsX6G7aP2b38vpphpFfP1M1o6pQxbvA3OPWUWylA
 a/iUnP/O5arGTq/U8govaQBY0l6afrlrdLtvo9rccYca9bp9ZaKvv4M4iLSAhAMBLNap
 gcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JKW/GFXJRvXHBJ7nA8bjC5XW9nj30bx6DuRlEB0HNtQ=;
 b=TT+KkUM1B7FYyvwylX1HYzGjLleEx6TVNCGAe9YTmcSY5hFkyFhX5ENRE6zg3A4D25
 CUpXWW590Cgj3WvUvmo3+JsgITTQpzN0YCb52H91ykTvjWxaRFbvHzfuf1vNEOrQ4PvC
 hmlTahIleC5HUuGF9IY76GQDI5viDwdYhBY4RSgORgrDPSDPFKIn7fbRxPwBIgPyehVN
 6z3EXH9LuJXE6AyA9gwBLrHeu4QUZvYr+ysrYb16x4zz2Uxr/cCINJeTz+0zXP7F7WvV
 fteF4shOVZ5k7MV3KBV2nN5vIkztNESqWm2a2GuuWvOMROKo2S87PVccYuSLMU9pl79o
 vFCg==
X-Gm-Message-State: AOAM532cnxWWnCFTCXqK9plo1mmj8OoogR/O7/ZXEgMyxWkBVF7+Yftr
 CVWAJ/bLpujYs4KO4fWF0d4=
X-Google-Smtp-Source: ABdhPJxILflVyu8Lm0seStqnwju2jYItTgeZ7W0SCCrBRXZTDmDCDL7zzPjGyEeU/IQ2UoSUomR6rA==
X-Received: by 2002:a05:600c:281:: with SMTP id 1mr127812wmk.143.1594303414757; 
 Thu, 09 Jul 2020 07:03:34 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:34 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 07/14] drm/panfrost: rename error labels in device_init
Date: Thu,  9 Jul 2020 16:03:15 +0200
Message-Id: <20200709140322.131320-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709140322.131320-1-peron.clem@gmail.com>
References: <20200709140322.131320-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVuYW1lIGdvdG8gbGFiZWxzIGluIGRldmljZV9pbml0IGl0IHdpbGwgYmUgZWFzaWVyIHRvIG1h
aW50YWluLgoKUmV2aWV3ZWQtYnk6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2Vp
Z0Bjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNs
ZW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZp
Y2UuYyB8IDMwICsrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2aWNlLmMKaW5kZXggODEzNmJhYmQzYmE5Li5jYzE2ZDEwMmIyNzUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKQEAgLTIxNSw1NyArMjE1LDU3
IEBAIGludCBwYW5mcm9zdF9kZXZpY2VfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRl
dikKIAllcnIgPSBwYW5mcm9zdF9yZWd1bGF0b3JfaW5pdChwZmRldik7CiAJaWYgKGVycikgewog
CQlkZXZfZXJyKHBmZGV2LT5kZXYsICJyZWd1bGF0b3IgaW5pdCBmYWlsZWQgJWRcbiIsIGVycik7
Ci0JCWdvdG8gZXJyX291dDA7CisJCWdvdG8gb3V0X2NsazsKIAl9CiAKIAllcnIgPSBwYW5mcm9z
dF9yZXNldF9pbml0KHBmZGV2KTsKIAlpZiAoZXJyKSB7CiAJCWRldl9lcnIocGZkZXYtPmRldiwg
InJlc2V0IGluaXQgZmFpbGVkICVkXG4iLCBlcnIpOwotCQlnb3RvIGVycl9vdXQxOworCQlnb3Rv
IG91dF9yZWd1bGF0b3I7CiAJfQogCiAJZXJyID0gcGFuZnJvc3RfcG1fZG9tYWluX2luaXQocGZk
ZXYpOwogCWlmIChlcnIpCi0JCWdvdG8gZXJyX291dDI7CisJCWdvdG8gb3V0X3Jlc2V0OwogCiAJ
cmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBmZGV2LT5wZGV2LCBJT1JFU09VUkNFX01FTSwg
MCk7CiAJcGZkZXYtPmlvbWVtID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKHBmZGV2LT5kZXYsIHJl
cyk7CiAJaWYgKElTX0VSUihwZmRldi0+aW9tZW0pKSB7CiAJCWRldl9lcnIocGZkZXYtPmRldiwg
ImZhaWxlZCB0byBpb3JlbWFwIGlvbWVtXG4iKTsKIAkJZXJyID0gUFRSX0VSUihwZmRldi0+aW9t
ZW0pOwotCQlnb3RvIGVycl9vdXQzOworCQlnb3RvIG91dF9wbV9kb21haW47CiAJfQogCiAJZXJy
ID0gcGFuZnJvc3RfZ3B1X2luaXQocGZkZXYpOwogCWlmIChlcnIpCi0JCWdvdG8gZXJyX291dDM7
CisJCWdvdG8gb3V0X3BtX2RvbWFpbjsKIAogCWVyciA9IHBhbmZyb3N0X21tdV9pbml0KHBmZGV2
KTsKIAlpZiAoZXJyKQotCQlnb3RvIGVycl9vdXQ0OworCQlnb3RvIG91dF9ncHU7CiAKIAllcnIg
PSBwYW5mcm9zdF9qb2JfaW5pdChwZmRldik7CiAJaWYgKGVycikKLQkJZ290byBlcnJfb3V0NTsK
KwkJZ290byBvdXRfbW11OwogCiAJZXJyID0gcGFuZnJvc3RfcGVyZmNudF9pbml0KHBmZGV2KTsK
IAlpZiAoZXJyKQotCQlnb3RvIGVycl9vdXQ2OworCQlnb3RvIG91dF9qb2I7CiAKIAlyZXR1cm4g
MDsKLWVycl9vdXQ2Ogorb3V0X2pvYjoKIAlwYW5mcm9zdF9qb2JfZmluaShwZmRldik7Ci1lcnJf
b3V0NToKK291dF9tbXU6CiAJcGFuZnJvc3RfbW11X2ZpbmkocGZkZXYpOwotZXJyX291dDQ6Citv
dXRfZ3B1OgogCXBhbmZyb3N0X2dwdV9maW5pKHBmZGV2KTsKLWVycl9vdXQzOgorb3V0X3BtX2Rv
bWFpbjoKIAlwYW5mcm9zdF9wbV9kb21haW5fZmluaShwZmRldik7Ci1lcnJfb3V0MjoKK291dF9y
ZXNldDoKIAlwYW5mcm9zdF9yZXNldF9maW5pKHBmZGV2KTsKLWVycl9vdXQxOgorb3V0X3JlZ3Vs
YXRvcjoKIAlwYW5mcm9zdF9yZWd1bGF0b3JfZmluaShwZmRldik7Ci1lcnJfb3V0MDoKK291dF9j
bGs6CiAJcGFuZnJvc3RfY2xrX2ZpbmkocGZkZXYpOwogCXJldHVybiBlcnI7CiB9Ci0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
