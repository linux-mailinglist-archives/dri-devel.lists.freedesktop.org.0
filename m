Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C965D1B0BA
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 09:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57011895A8;
	Mon, 13 May 2019 07:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC3A89A14
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 17:46:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v11so12722020wru.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 10:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p98bYKaDXcVUZuwnIBPZ/FdFvePGsYF2RuZMRuVjYxs=;
 b=ME57m/0BNUaV5qgUer1izrm9WnGO1X4lkcn3bl9Iu2TEd99yQ9hlA4oPObUmJUaisY
 JiatqprF/XzEBEk8QwcCmwTVJPWx1AjS0vb7tIm/kZnHHcqAo5mduW9cS0xDMh7qD/8B
 qZyx1uDDz07wcBs/3/ZtGUOVl6CvjxQcDwTVqUx7Zp35TQRMJ+0vRqH1s9T4HssaIm02
 VQEouwmRdoxxK3zZyZclvRINvbmY496k6Hp008wWVmdBIf2L72miYU2FbQhUIs+OSFWm
 irkcUbIVdHJ1Mo7UjuB3RD6DF+r8SF9N2kmww7YaPAwQy87CMkqWNMlhooly9CKs6ym7
 JtyA==
X-Gm-Message-State: APjAAAWbjA+ZPnF8FkRBUNQW5ycnI6KGeJdR9qVTAImlWDs40JjSaQVy
 Tbf0pePn+hUtUXjSf/5UyHQ=
X-Google-Smtp-Source: APXvYqxmVJMgR22Rrgiw76ZfkUKo9ruVzTo1GiQnpLImqxaLzFzVd7hGG/AexLVI7T+n/wNN3jTc9Q==
X-Received: by 2002:adf:c788:: with SMTP id l8mr9151728wrg.143.1557683181952; 
 Sun, 12 May 2019 10:46:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id d14sm9090558wre.78.2019.05.12.10.46.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 10:46:21 -0700 (PDT)
From: peron.clem@gmail.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 6/8] arm64: dts: allwinner: Add mali GPU supply for Beelink
 GS1
Date: Sun, 12 May 2019 19:46:06 +0200
Message-Id: <20190512174608.10083-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190512174608.10083-1-peron.clem@gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 May 2019 07:04:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p98bYKaDXcVUZuwnIBPZ/FdFvePGsYF2RuZMRuVjYxs=;
 b=abLKdOs0RFabo5GEND0zTOZyfkPDvhghjZxq2fsWLSpwzFrhJicR9jyufdbk1CDU9L
 J3wFEG29swfiDgIU8/+h9f3ipbmM27+bznSj7jQ2/s8qArm1YJxI8X0FV78uFY2Ny4xE
 zSXX3yClrh1AF+gwiUi9rla0gY5dVKSoDl75x7sy8/GmgVjfASsokQRovThYJ+kEGeZp
 sQwZb/Ex5wZXFcwJPGqgvyBmMShzFYfMsZ2EDZWzYzYfSwZvhtGn0jinqrK4dB3L+ZB7
 x8NKbN8VeSeE77qlo4ybhdLzsmJINDE9YjebAyaAZmMUYzjSA2H1FQP98ssvV0VPA7UC
 AwVw==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KCkVuYWJsZSBhbmQg
YWRkIHN1cHBseSB0byB0aGUgTWFsaSBHUFUgbm9kZSBvbiB0aGUKQmVlbGluayBHUzEgYm9hcmQu
CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgot
LS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1iZWVsaW5rLWdzMS5k
dHMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LWJlZWxpbmstZ3MxLmR0
cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1iZWVsaW5rLWdzMS5k
dHMKaW5kZXggMGRjMzNjOTBkZDYwLi4yMTQ0MGQ1NzJmMGEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1iZWVsaW5rLWdzMS5kdHMKKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LWJlZWxpbmstZ3MxLmR0cwpAQCAt
NzAsNiArNzAsMTEgQEAKIAlzdGF0dXMgPSAib2theSI7CiB9OwogCismZ3B1IHsKKwltYWxpLXN1
cHBseSA9IDwmcmVnX2RjZGNjPjsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmaGRtaSB7CiAJ
c3RhdHVzID0gIm9rYXkiOwogfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
