Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC700E073E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 17:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D69B6E84A;
	Tue, 22 Oct 2019 15:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06FE6E84A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 15:25:37 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s1so9807790wro.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+LH15woUHFV9Sv24z7gvZy7aG33Jvdl2MxKUB928QW4=;
 b=WjM5KIjOf1ID4+ITA4FdgjShMamn1gQehgcbyAZ62pMKqfG/XQeRR0ANsrasXvV6je
 Ta9ClkcuXR7cQlUOAO6uGAil8nMjlLd3iT5dEjgrex6xWxySb8eE8iMMte4LyOJD5Wsn
 ZWFz0mg0/2jBV74Xiq8tW/FWBt3RHsRPgzfrTyZvhoIgcpcv2oivBbETNIrXxi94UrEk
 OsQ0spfkx3s8dXRAdlnoR2Cf3+XcxfzjLnYoKf/r+J2H+HXLVE2/RjoUSJCh6CcG0Q4l
 o35LpHEMCD5HjTP9Nd8RrhhNWsdI6Wu1VhtJLrux84Jbm79WDLeE4rDNt8aRcqYIvtOk
 GlkA==
X-Gm-Message-State: APjAAAUhONPKuy/Fm58j8RQPA6mS6SNUyrAPhPcupLSooS/VF1pPlvr2
 IEuxcZeyypSzYNwzDuyr5Y3bdGhUPBs=
X-Google-Smtp-Source: APXvYqx0WaHe3SLtBQfi5JGfGc06QNVYCwzB1rRY6lHBffbLS0ulrWWgcvHF9TKFPWICJo/POFsTzg==
X-Received: by 2002:a5d:4285:: with SMTP id k5mr3956815wrq.344.1571757936201; 
 Tue, 22 Oct 2019 08:25:36 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b5sm16574513wmj.18.2019.10.22.08.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 08:25:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/todo: Remove i915 device_link task
Date: Tue, 22 Oct 2019 17:25:29 +0200
Message-Id: <20191022152530.22038-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+LH15woUHFV9Sv24z7gvZy7aG33Jvdl2MxKUB928QW4=;
 b=CdKUaCKZEWKtU7OjV7AG4Ag8uzoD9u4BoQ9eCzmXgxSmOtOJi/wc24N6Cf/JrDhuNl
 MozXKdfrXw81vEXnP1rg3FOi8zuT/Ds9BuPMcTQdOF0TT8184tsc+/BLhIzAJMGFlCKe
 ztlzzvC6tx0oDpOT06cSzs83r8N59MxOJ0dIc=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9uZSB3aXRoCgpjb21taXQgYWVmOWYzM2I3NjU4YTc0ODlmNzFkZjVkNmU2ZWNiNDdmMjUyMWU4
YQpBdXRob3I6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KRGF0ZTogICBUdWUgT2N0
IDIzIDE3OjQzOjEwIDIwMTggKzAzMDAKCiAgICBkcm0vaTkxNTogRW5zdXJlIHByb3BlciBIREEg
c3VzcGVuZC9yZXN1bWUgb3JkZXJpbmcgd2l0aCBhIGRldmljZSBsaW5rCgpDYzogSW1yZSBEZWFr
IDxpbXJlLmRlYWtAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgNyAt
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CmluZGV4
IDIzYjNhNjc3OTRiYS4uOWFjMTAyOTIyNzEyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2dw
dS90b2RvLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdApAQCAtNDM4LDEzICs0
MzgsNiBAQCBTZWUgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L1RPRE8gZm9yIHRhc2tzLgog
CiBDb250YWN0OiBIYXJyeSBXZW50bGFuZCwgQWxleCBEZXVjaGVyCiAKLWk5MTUKLS0tLS0KLQot
LSBPdXIgZWFybHkvbGF0ZSBwbSBjYWxsYmFja3MgY291bGQgYmUgcmVtb3ZlZCBpbiBmYXZvdXIg
b2YgdXNpbmcKLSAgZGV2aWNlX2xpbmtfYWRkIHRvIG1vZGVsIHRoZSBkZXBlbmRlbmN5IGJldHdl
ZW4gaTkxNSBhbmQgc25kX2hhZC4gU2VlCi0gIGh0dHBzOi8vZHJpLmZyZWVkZXNrdG9wLm9yZy9k
b2NzL2RybS9kcml2ZXItYXBpL2RldmljZV9saW5rLmh0bWwKLQogQm9vdHNwbGFzaAogPT09PT09
PT09PQogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
