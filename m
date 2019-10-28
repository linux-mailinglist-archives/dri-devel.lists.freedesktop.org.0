Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4B1E7168
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 13:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432E86E824;
	Mon, 28 Oct 2019 12:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D2D6E821
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 12:34:38 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id f19so6762682pgn.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 05:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+QFIjkm2Qhd2yMaRyycj1Wp3bAUqh+YRfecnygC6mNI=;
 b=p+nonrZqsopIf0p9NU532EwxWDMS1sLPkn5KZIFNl7uXYQqFsUtnfzsC1QB0GSOYTi
 5GHyeig4EsGxsQqn6s+qys+CZuTXmMBwV/NDw18LGKi6hwGVXZiCpHXdvbyA1+Fd2Cwe
 GpAn2Hdo2bJJqb/4o4LarvWzKSp3kooh061+4NQ1RO+J2kSKE7GEXHXrheTiS6rdRWON
 zbnPNaJe4hD61GHTKmVOass3jLHb9r55nv/f2WjcQN9FYLc3Z28uGOvpS1tT1jyMfTpy
 9mi+86aK2xnV9rWT9MoXLr7HaS9RU6K7BsgbKqkGFpObirVdt9X697/rO6tnx8lnLf8u
 tvlw==
X-Gm-Message-State: APjAAAXpIN9xOfY4Qgq46GC+A5q5CDXRYogbP1xjA2vK7xoxAeuxZUHL
 K37DxRmQHWa95WZdDXmvylY=
X-Google-Smtp-Source: APXvYqzKitfYVtN7MD1eOpJXKawvyUvdD8GUCOJ8QcYwVD8iqf3/nkiVCngZ2+OROidOyS5jt/QDOA==
X-Received: by 2002:a65:554e:: with SMTP id t14mr18370559pgr.370.1572266078225; 
 Mon, 28 Oct 2019 05:34:38 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id 127sm11404868pfw.6.2019.10.28.05.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 05:34:37 -0700 (PDT)
From: Inki Dae <daeinki@gmail.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-next
Date: Mon, 28 Oct 2019 21:34:34 +0900
Message-Id: <20191028123434.30034-1-daeinki@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+QFIjkm2Qhd2yMaRyycj1Wp3bAUqh+YRfecnygC6mNI=;
 b=qIBMP/IIpuieM1XBz8PBGX7WAS6+nFzGcXBzEK8+0lh9orV9ox2skQ9hePA4OeC6e7
 1rOTtOfqd0pCyTrDJHjzFG8/H+gbxaRT1rXleJqRBABb3yc5m+hOxEQRLbZ9iJLf+0WF
 02BIlQNgMOYZy15wFYKB+DHNtm1VYAS0YGc9RV4sj+VqDOZLZH12iF67iG7YZkQaTYLm
 29DtLh+ADKyp0d09juEbUzRP5CwC4OEo9yARB98oE+FqnFUQCuAwFWZsY5F1rwPYqgsl
 zIJc9YCEaC8kxrPyuKMWBHVy7fg7uHj8XiKb/OQ0zJQJLkm4PJRUpLp3APc+vZfDFkbi
 Cqxg==
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKCiAgIEp1c3Qgb25lIGJ1aWxkIHdhcm5pbmcgZml4dXAuCgogICBQbGVhc2Uga2lu
ZGx5IGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueSBwcm9ibGVtLgoKClRoYW5rcywKSW5raSBE
YWUKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMzI3NWE3MWU3NmZhYzViYzI3
NmYwZDYwZTAyN2IxOGMyZThkN2E1YjoKCiAgTWVyZ2UgdGFnICdkcm0tbmV4dC01LjUtMjAxOS0x
MC0wOScgb2YgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXggaW50byBk
cm0tbmV4dCAoMjAxOS0xMC0yNiAwNTo1Njo1NyArMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvZGFlaW5raS9kcm0tZXh5bm9zIHRhZ3MvZXh5bm9zLWRybS1uZXh0LWZvci12
NS41Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNWE4ODRiZTU0Nzg5OTBlZDAxM2My
YjE2MGQ5MDYxNTQyNjg0OGM2MToKCiAgZHJtL2V4eW5vczogTW92ZSBzdGF0aWMga2V5d29yZCB0
byB0aGUgZnJvbnQgb2YgZGVjbGFyYXRpb24gKDIwMTktMTAtMjggMjE6MTI6MjcgKzA5MDApCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCkZpeCBhIGJ1aWxkIHdhcm5pbmcgYXQgbWl4ZXIgZHJpdmVyCi0gaXQgZml4ZXMgYSBi
dWlsZCB3YXJuaW5nIG1lc3NhZ2UsICdzdGF0aWMnIGlzIG5vdCBhdCBiZWdpbm5pbmcKICBvZiBk
ZWNsYXJhdGlvbiBbLVdvbGQtc3R5bGUtZGVjbGFyYXRpb25dLCBieSBtb3Zpbmcgc3RhdGljIGtl
eXdvcmQuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCktyenlzenRvZiBXaWxjenluc2tpICgxKToKICAgICAgZHJtL2V4eW5v
czogTW92ZSBzdGF0aWMga2V5d29yZCB0byB0aGUgZnJvbnQgb2YgZGVjbGFyYXRpb24KCiBkcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
