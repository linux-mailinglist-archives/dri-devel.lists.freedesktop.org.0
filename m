Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5383E22A605
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 05:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045486E2CF;
	Thu, 23 Jul 2020 03:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244086E2AF;
 Thu, 23 Jul 2020 03:26:25 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id k18so3453492qtm.10;
 Wed, 22 Jul 2020 20:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KoRVa2r+XtTwsNMP0UFwCABgrXO6y/oLw/+uG7Xy8M=;
 b=Juh7FDvkyHyhQPd2JNdZe98gpNWFwC72KRaOjDrvFV3VMC7vQUiYzgv/yl9HZMaIVO
 iQP28xz0lJp8ZZBLKkugUBDnuSV08wv7mCuCNnqKx1JrqFTm5Oq8zaznYMWVmAa5h/bU
 ceplubgIVQpgOMiucLsIZLOEJ3IVgG5E+T5jd9e6puC/iDaj0kouvWVvglIeGV5ZxSCb
 Udf61JeCdaLV/8vJsdaKACb6W6jIEhHaMRJ5Z0i2Q1pyaKztH7XN4T+Cddys+GZ83kI4
 RSL7h83VsQO+1S8FTB8zKFM0Z0rI+1T2EUm6URQ9wS5EOuoNzEDGCkCGf/wlrqYcS0Ta
 gfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KoRVa2r+XtTwsNMP0UFwCABgrXO6y/oLw/+uG7Xy8M=;
 b=jK9peJDZ5s4kalswz7qCnUUUOsxFVs/jqtfkjOQ8LsTScJxGQ+FW61iipjIJw21E3s
 YFrfdpHuFpVOwQLQFvx6pfAXqEBMaHxc4sKkzPn3HM57STK4FwyElhJMyjrYm6wgP/l9
 LsepKSyVGHP0hGBwQfQxJk2AaXA+kVjDPMeTuGx31yZNou8NoqgWLhOSKRGpqXhXn5vi
 vh7U4X/rABwlwAClfQi/dJ2hrRLa4wXvVSbIsel0ldtDVjbzze42BkpbhclceqEu5aq/
 FapGfp/n3+O71+elBgqb1UKNJZShL5Mwtlcex4QNw7dHSLiq9AJupw4f53LYOJruBYBL
 q8Qg==
X-Gm-Message-State: AOAM530fCo1GdF7BpXTBlEcbPZDabqHZ2GuoE5bKe/9J/RWdKUxkEnGC
 XVDntnUfjkFUiarAeEGVcdPxjFGn
X-Google-Smtp-Source: ABdhPJyJt4K5F2YB8T3Ql3HeaONU1UL8dcQ/rJCzBoFGDci3ziKIicApPoVJA0Z8KlpfncVXQQEL2A==
X-Received: by 2002:ac8:6b92:: with SMTP id z18mr2309253qts.96.1595474783996; 
 Wed, 22 Jul 2020 20:26:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id m203sm1494184qke.114.2020.07.22.20.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 20:26:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.8
Date: Wed, 22 Jul 2020 23:26:08 -0400
Message-Id: <20200723032608.3865-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKQ291cGxlIG9mIGZpeGVzIGZvciA1LjguCgpUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IGFkYmU4YTNjYWU5NGE2M2U5ZjQxNjc5NWM3NTAyMzdhOWI3
ODkxMjQ6CgogIE1lcmdlIHRhZyAnYW1kLWRybS1maXhlcy01LjgtMjAyMC0wNy0xNScgb2YgZ2l0
Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXggaW50byBkcm0tZml4ZXMgKDIw
MjAtMDctMTcgMTM6Mjk6MDAgKzEwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXggdGFn
cy9hbWQtZHJtLWZpeGVzLTUuOC0yMDIwLTA3LTIyCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gMzhlMGM4OWExOWZkMTNmMjhkMmI0NzIxMDM1MTYwYTNlNjZlMjcwYjoKCiAgZHJtL2Ft
ZGdwdTogRml4IE5VTEwgZGVyZWZlcmVuY2UgaW4gZHBtIHN5c2ZzIGhhbmRsZXJzICgyMDIwLTA3
LTIxIDE2OjAwOjAxIC0wNDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQphbWQtZHJtLWZpeGVzLTUuOC0yMDIwLTA3LTIy
OgoKYW1kZ3B1OgotIEZpeCBjcmFzaCB3aGVuIG92ZXJjbG9ja2luZyBWZWdhTQotIEZpeCBwb3Nz
aWJsZSBjcmFzaCB3aGVuIGVkaXRpbmcgZHBtIGxldmVscwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQYXdlxYIgR3Jvbm93
c2tpICgxKToKICAgICAgZHJtL2FtZGdwdTogRml4IE5VTEwgZGVyZWZlcmVuY2UgaW4gZHBtIHN5
c2ZzIGhhbmRsZXJzCgpRaXUgV2VuYm8gKDEpOgogICAgICBkcm0vYW1kL3Bvd2VycGxheTogZml4
IGEgY3Jhc2ggd2hlbiBvdmVyY2xvY2tpbmcgVmVnYSBNCgogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BtLmMgICAgICAgICAgICAgIHwgIDkgKysrLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMgfCAxMCArKysrKystLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
