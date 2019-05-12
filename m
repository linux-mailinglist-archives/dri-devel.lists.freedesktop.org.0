Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E71B0BC
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 09:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDFC895B4;
	Mon, 13 May 2019 07:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF2189A14
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 17:46:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id i3so5853204wml.4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 10:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EXpuW1H5E6JQJvkk+bffS60LiMlJ6FTGBpL+lRXA+/0=;
 b=p7h9zQkTI93tY8Z38kqmTM4T3hPuyzvWzg1kKUr5NSOj3K7PEK9xdl4be2nAFoTkRD
 kdjYcoUlxFud0svMeGR1nYmlBvFDhNS9BKvoHkaxGY2/E1DPaOcVRk8Wix5mpFglC/S4
 vsjU9Wx2bnuOD3unsCjm3cKo1R85QMg7iHzNV4JTBOiofjXg1RVWOGzcGtNWeRe7MH11
 Ys1v9XMgdHUQgVUeKDvS/OBILGriiOV0JQZLE52FZ8ESAAWALJaQ84hAWMmPKEuuBr6O
 5CTzr+2t65aKjnV3Mvni6nHsNJdB5asm197BTC/97aXXzzhZnOomB2w/Rl9tQdpdwB1/
 pWYQ==
X-Gm-Message-State: APjAAAVPc+O2h2KxaUoWYRJowPF9m84oFWv9Vm9Ph/vXeKL/2FRJg+Ux
 RgprvlCWGQMh2n7IJ5MmcwU=
X-Google-Smtp-Source: APXvYqxhB7vibCkxRA4FPfP8y01EU8vmUJIZfLKUu16/cqguHPZ7Vjvf/kWOGAn7GjdIKhCBtdMUHg==
X-Received: by 2002:a1c:7a12:: with SMTP id v18mr13528180wmc.69.1557683179040; 
 Sun, 12 May 2019 10:46:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id d14sm9090558wre.78.2019.05.12.10.46.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 10:46:18 -0700 (PDT)
From: peron.clem@gmail.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 3/8] dt-bindings: gpu: mali-midgard: Add H6 mali gpu
 compatible
Date: Sun, 12 May 2019 19:46:03 +0200
Message-Id: <20190512174608.10083-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190512174608.10083-1-peron.clem@gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 May 2019 07:04:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EXpuW1H5E6JQJvkk+bffS60LiMlJ6FTGBpL+lRXA+/0=;
 b=C87Q+0KZQadrQrFy/za95yC+j5F9HIcOk+MD/C9HIXG+ocEQapjM4S2ITPa0BLHET0
 TveZfiYQ/0GIB0Q3RDpOCPvI8Dq5yBr0wNvFMerC0oF3tyITvUzD/EMkVuawaWcZUeJW
 Losyzn7J5obpJCtjMEmo4hNYOj5ULqh8Mdo7ZOuLLhrEEMff8cwte3uzAy4fMbRvy94O
 YdhlCq/6M2Vyhu/IoB60ud/+9jDueB89Y3+rz/lRGzS5vw/O/YtZa+uLqVQsxXQ+yUt3
 yyK0Fznt12O+GzSnJ+cMNNwKLT0DYr5HX1QPF3OWWx5m5t/RszjCKfW0+mrczm8pWipQ
 Jn0g==
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

RnJvbTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KClRoaXMgYWRkIHRo
ZSBINiBtYWxpIGNvbXBhdGlibGUgaW4gdGhlIGR0LWJpbmRpbmdzIHRvIGxhdGVyIHN1cHBvcnQK
c3BlY2lmaWMgaW1wbGVtZW50YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24g
PHBlcm9uLmNsZW1AZ21haWwuY29tPgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2Fy
ZC50eHQgICAgICAgICB8IDkgKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50eHQKaW5kZXggMmU4YmJjZTM1Njk1
Li40YmYxN2UxY2Y1NTUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dApAQCAtMTUsNiArMTUsNyBAQCBS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAgICsgImFybSxtYWxpLXQ4NjAiCiAgICAgKyAiYXJtLG1h
bGktdDg4MCIKICAgKiB3aGljaCBtdXN0IGJlIHByZWNlZGVkIGJ5IG9uZSBvZiB0aGUgZm9sbG93
aW5nIHZlbmRvciBzcGVjaWZpY3M6CisgICAgKyAiYWxsd2lubmVyLHN1bjUwaS1oNi1tYWxpIgog
ICAgICsgImFtbG9naWMsbWVzb24tZ3htLW1hbGkiCiAgICAgKyAicm9ja2NoaXAscmszMjg4LW1h
bGkiCiAgICAgKyAicm9ja2NoaXAscmszMzk5LW1hbGkiCkBAIC00OSw5ICs1MCwxNSBAQCBWZW5k
b3Itc3BlY2lmaWMgYmluZGluZ3MKIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogCiBUaGUgTWFs
aSBHUFUgaXMgaW50ZWdyYXRlZCB2ZXJ5IGRpZmZlcmVudGx5IGZyb20gb25lIFNvQyB0bwotYW5v
dGhlci4gSW4gb3JkZXIgdG8gYWNjb21vZGF0ZSB0aG9zZSBkaWZmZXJlbmNlcywgeW91IGhhdmUg
dGhlIG9wdGlvbgorYW5vdGhlci4gSW4gb3JkZXIgdG8gYWNjb21tb2RhdGUgdGhvc2UgZGlmZmVy
ZW5jZXMsIHlvdSBoYXZlIHRoZSBvcHRpb24KIHRvIHNwZWNpZnkgb25lIG1vcmUgdmVuZG9yLXNw
ZWNpZmljIGNvbXBhdGlibGUsIGFtb25nOgogCistICJhbGx3aW5uZXIsc3VuNTBpLWg2LW1hbGki
CisgIFJlcXVpcmVkIHByb3BlcnRpZXM6CisgIC0gY2xvY2tzIDogcGhhbmRsZXMgdG8gY29yZSBh
bmQgYnVzIGNsb2NrcworICAtIGNsb2NrLW5hbWVzIDogbXVzdCBjb250YWluICJjb3JlIiBhbmQg
ImJ1cyIKKyAgLSByZXNldHM6IHBoYW5kbGUgdG8gR1BVIHJlc2V0IGxpbmUKKwogLSAiYW1sb2dp
YyxtZXNvbi1neG0tbWFsaSIKICAgUmVxdWlyZWQgcHJvcGVydGllczoKICAgLSByZXNldHMgOiBT
aG91bGQgY29udGFpbiBwaGFuZGxlcyBvZiA6Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
