Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B1F24ABE
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 10:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D522D89214;
	Tue, 21 May 2019 08:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFFC89214
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 08:48:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a8so28210161edx.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 01:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YxW4olyjrfcR1+tkKODaDnEd9Z8VUWh5BT2RxJbDCjE=;
 b=OeOGjSJO088NinyZR8L8xXln+VGHX8Z+OoWJG0Oe60U0xFN3pjq+5UtzmMSvJ21iqe
 c+2ehSzpYRhRxn30hq9F42O43fjP7ZpsqsJYLKNaUqdc8uGC153lQ56nh4RtDAerrLaT
 J4yArvc17YG+aEhW00xwNCxHenLKVQ7419mxOWXpgSUF4C/OHqp824XRalQzHAfj0a0S
 7UjE5wVvMmee+s6NYiFY1TV9HF4WdXTYBKawb7GNlayHz1XRVqqwJKAV2dfKHb2popUv
 VrsE4op+JbSPgfgUNQ4n3sPsCAMrLkhjtVX3d0mYbZIx05uUGR6gepwmelZED+xmtRJM
 EJBw==
X-Gm-Message-State: APjAAAW+4jL3QFtHse4LnGSnKXgoB0AJKk7RXT7+4kkBCI/rNKVriDCL
 lmf3n+zvOMdSR29udEZ1VSD0xU7QSuA=
X-Google-Smtp-Source: APXvYqx0wR8FkNgcdM/niCM+mDn8g/8XcNpu85+WReFbH0rjHeOPFoK9phhDjT5MKZUzffhHskMkNg==
X-Received: by 2002:a50:9581:: with SMTP id w1mr81245448eda.6.1558428534986;
 Tue, 21 May 2019 01:48:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m4sm77645edc.24.2019.05.21.01.48.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 01:48:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc: More fine-tuning on userspace review requirements
Date: Tue, 21 May 2019 10:48:49 +0200
Message-Id: <20190521084849.27452-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YxW4olyjrfcR1+tkKODaDnEd9Z8VUWh5BT2RxJbDCjE=;
 b=IzdHVMFOuNxq3CQEksG/UJ4H5H68Xj2f4BjKMG7P581TTwS1Gk/i/0gqH+zW9RnOFS
 V6TzXez4BxUZYWF36SCaGGjwrmnPokr6yta4WTDVYKzY55liwKeQouqhSolvCyhGUJhY
 hI9AnB3DYaXbhGiaQdVUXwsyt2+WjygJnigdI=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, wayland-devel@lists.freedesktop.org,
 contact@emersion.fr, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCBFcmljJ3MgcGF0Y2gKCmNvbW1pdCBiYTZlNzk4ZWNmMzIwNzE2NzgwYmI2YTYwODhhOGQx
N2RjYmExZDQ5CkF1dGhvcjogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KRGF0ZTogICBX
ZWQgQXByIDI0IDExOjU2OjE3IDIwMTkgLTA3MDAKCiAgICBkcm0vZG9jOiBEb2N1bWVudCBleHBl
Y3RhdGlvbiB0aGF0IHVzZXJzcGFjZSByZXZpZXcgbG9va3MgYXQga2VybmVsIHVBUEkuCgp0aGVy
ZSdzIGJlZW4gY29uY2VybnMgcmFpc2VkIHRoYXQgd2UgZXhwZWN0IHVzZXJzcGFjZSBwZW9wbGUg
dG8gZG8KaW4tZGVwdGgga2VybmVsIHBhdGNoIHJldmlldy4gVGhhdCdzIG5vdCByZWFzb25hYmxl
LCBzYW1lIHdheSBrZXJuZWwKcGVvcGxlIGNhbid0IHJldmlldyBhbGwgdGhlIHVzZXJzcGFjZSB3
ZSBoYXZlLiBUcnkgdG8gY2xhcmlmeQpleHBlY3RhdGlvbnMgYSBiaXQgbW9yZS4KCkNjOiBFcmlj
IEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogUGVra2EgUGFhbGFuZW4gPHBwYWFsYW5lbkBn
bWFpbC5jb20+CkNjOiBjb250YWN0QGVtZXJzaW9uLmZyCkNjOiB3YXlsYW5kLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QgfCA2ICsr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QgYi9Eb2N1bWVudGF0aW9u
L2dwdS9kcm0tdWFwaS5yc3QKaW5kZXggMDU4NzRkMDk4MjBjLi5mMzY4ZTU4ZmI3MjcgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdAorKysgYi9Eb2N1bWVudGF0aW9u
L2dwdS9kcm0tdWFwaS5yc3QKQEAgLTg1LDkgKzg1LDkgQEAgbGVhZHMgdG8gYSBmZXcgYWRkaXRp
b25hbCByZXF1aXJlbWVudHM6CiAtIFRoZSB1c2Vyc3BhY2Ugc2lkZSBtdXN0IGJlIGZ1bGx5IHJl
dmlld2VkIGFuZCB0ZXN0ZWQgdG8gdGhlIHN0YW5kYXJkcyBvZiB0aGF0CiAgIHVzZXJzcGFjZSBw
cm9qZWN0LiBGb3IgZS5nLiBtZXNhIHRoaXMgbWVhbnMgcGlnbGl0IHRlc3RjYXNlcyBhbmQgcmV2
aWV3IG9uIHRoZQogICBtYWlsaW5nIGxpc3QuIFRoaXMgaXMgYWdhaW4gdG8gZW5zdXJlIHRoYXQg
dGhlIG5ldyBpbnRlcmZhY2UgYWN0dWFsbHkgZ2V0cyB0aGUKLSAgam9iIGRvbmUuICBUaGUgdXNl
cnNwYWNlLXNpZGUgcmV2aWV3ZXIgc2hvdWxkIGFsc28gcHJvdmlkZSBhdCBsZWFzdCBhbgotICBB
Y2tlZC1ieSBvbiB0aGUga2VybmVsIHVBUEkgcGF0Y2ggaW5kaWNhdGluZyB0aGF0IHRoZXkndmUg
bG9va2VkIGF0IGhvdyB0aGUKLSAga2VybmVsIHNpZGUgaXMgaW1wbGVtZW50aW5nIHRoZSBuZXcg
ZmVhdHVyZSBiZWluZyB1c2VkLgorICBqb2IgZG9uZS4gIFRoZSB1c2Vyc3BhY2Utc2lkZSByZXZp
ZXdlciBzaG91bGQgYWxzbyBwcm92aWRlIGFuIEFja2VkLWJ5IG9uIHRoZQorICBrZXJuZWwgdUFQ
SSBwYXRjaCBpbmRpY2F0aW5nIHRoYXQgdGhleSBiZWxpZXZlIHRoZSBwcm9wb3NlZCB1QVBJIGlz
IHNvdW5kIGFuZAorICBzdWZmaWNpZW50bHkgZG9jdW1lbnRlZCBhbmQgdmFsaWRhdGVkIGZvciB1
c2Vyc3BhY2UncyBjb25zdW1wdGlvbi4KIAogLSBUaGUgdXNlcnNwYWNlIHBhdGNoZXMgbXVzdCBi
ZSBhZ2FpbnN0IHRoZSBjYW5vbmljYWwgdXBzdHJlYW0sIG5vdCBzb21lIHZlbmRvcgogICBmb3Jr
LiBUaGlzIGlzIHRvIG1ha2Ugc3VyZSB0aGF0IG5vIG9uZSBjaGVhdHMgb24gdGhlIHJldmlldyBh
bmQgdGVzdGluZwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
