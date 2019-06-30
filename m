Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E87E5B17F
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 22:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E601389D7B;
	Sun, 30 Jun 2019 20:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B174989CB8;
 Sun, 30 Jun 2019 20:36:33 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so12506668qtj.8;
 Sun, 30 Jun 2019 13:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WzMoDY2PVdsaZxFUKIEpPbUDj5ALelERAN3KJa8FN/g=;
 b=bDTtWjm6nU4JtW1boRLCbuLMxtKOw4QrAklWzxnbqNcYJYSOtvfCIpW3D4yYbTWJsM
 aOiKQt0k7kSxVQ5Ov1WLHUbNFOxUVAfbZIigT8jrqINKfA7T6sMp5BuZXXsqR8Gd/BH2
 QkT6GhluUe05EgCL2bKW3q5cTcQnnjwE7ka3UpmH8NmELS+cBYMmCfFZ0+NT4/j8Dqqs
 Qss3g4XHjvPVn3HxqppZHEAtDtDkjpE44J9lpHSkpAhOCYWDxtVkX6KbivbQ8NUJhBa2
 0F5a2wmQVymHwpz07g0dKRXkwOBlW72BhCNOGiTng/ZDgoDEapcD0EA+BXi4C9bxEgXH
 BQbQ==
X-Gm-Message-State: APjAAAWEhC7K14TCbWjNdT3bSbE8o6QtoSl7Je+hN88UXuXT6AKP0jrf
 2oZ2sjG039vWlLH44FMT2DAtBGQtXFcmvg==
X-Google-Smtp-Source: APXvYqwQfaHdQ/vGbGlCFGNupx1trzPU/pHEUuoPA5ez15XzPmvs8A2wjIpUozB0pTNRCtr8UHzWUA==
X-Received: by 2002:ac8:2971:: with SMTP id z46mr17115175qtz.322.1561926992481; 
 Sun, 30 Jun 2019 13:36:32 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id j2sm4167172qtb.89.2019.06.30.13.36.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 13:36:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/4] drm+dt+efi: support devices with multiple possible panels
Date: Sun, 30 Jun 2019 13:36:04 -0700
Message-Id: <20190630203614.5290-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WzMoDY2PVdsaZxFUKIEpPbUDj5ALelERAN3KJa8FN/g=;
 b=UZNSu2Oc32IchdcgBkZBLJZf2WcpYM2hi5A6sV0emvQLkxDtWCGnoNRGiNzSE0t4pa
 YIX3DjFpX/187JCvcH1aeMTVrjNYEnxKR58L33zl3vThrzv67djM6PvwI90+47wGuhEa
 AMfyyrKD10l76y5uNo+x5Pt2BI6oc9RQILmeAW6fyaYDgvp5TtgANjRtoVgr8bCnA+Ix
 Kg1aBL9B19wcj4yz1RUKpj5dPIN9vSU0XUDtQQ9Yl+ZDdhvtj2xRRS7MBHIsCtBl7nMc
 p78dsh3opbJdC7eF6/BFdoRs94qJ7VzmXmZkD8a/7676iDcxhH66XfPj5lzVhrB+2s8U
 PCOw==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Julien Thierry <julien.thierry@arm.com>,
 "open list:EXTENSIBLE FIRMWARE INTERFACE EFI" <linux-efi@vger.kernel.org>,
 Will Deacon <will@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 freedreno@lists.freedesktop.org, Ingo Molnar <mingo@kernel.org>,
 Steve Capper <steve.capper@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKTm93IHRoYXQgd2UgY2Fu
IGRlYWwgZ3JhY2VmdWxseSB3aXRoIGJvb3Rsb2FkZXIgKGZpcm13YXJlKSBpbml0aWFsaXplZApk
aXNwbGF5IG9uIGFhcmNoNjQgbGFwdG9wc1sxXSwgdGhlIG5leHQgc3RlcCBpcyB0byBkZWFsIHdp
dGggdGhlIGZhY3QKdGhhdCB0aGUgc2FtZSBtb2RlbCBvZiBsYXB0b3AgY2FuIGhhdmUgb25lIG9m
IG11bHRpcGxlIGRpZmZlcmVudCBwYW5lbHMuCihGb3IgdGhlIHlvZ2EgYzYzMCB0aGF0IEkgaGF2
ZSwgSSBrbm93IG9mIGF0IGxlYXN0IHR3byBwb3NzaWJsZSBwYW5lbHMsCnRoZXJlIG1pZ2h0IGJl
IGEgdGhpcmQuKQoKVGhpcyBpcyBhY3R1YWxseSBhIHNjZW5hcmlvIHRoYXQgY29tZXMgdXAgZnJl
cXVlbnRseSBpbiBwaG9uZXMgYW5kCnRhYmxldHMgYXMgd2VsbCwgc28gaXQgaXMgdXNlZnVsIHRv
IGhhdmUgYW4gdXBzdHJlYW0gc29sdXRpb24gZm9yIHRoaXMuCgpUaGUgYmFzaWMgaWRlYSBpcyB0
byBhZGQgYSAncGFuZWwtaWQnIHByb3BlcnR5IGluIGR0IGNob3NlbiBub2RlLCBhbmQKdXNlIHRo
YXQgdG8gcGljayB0aGUgZW5kcG9pbnQgd2UgbG9vayBhdCB3aGVuIGxvYWRpbmcgdGhlIHBhbmVs
IGRyaXZlciwKZS5nLgoKLyB7CgljaG9zZW4gewoJCXBhbmVsLWlkID0gPDB4YzQ+OwoJfTsKCglp
dm9fcGFuZWwgewoJCWNvbXBhdGlibGUgPSAiaXZvLG0xMzNud2Y0LXIwIjsKCQlwb3dlci1zdXBw
bHkgPSA8JnZsY21fM3YzPjsKCQluby1ocGQ7CgoJCXBvcnRzIHsKCQkJcG9ydCB7CgkJCQlpdm9f
cGFuZWxfaW5fZWRwOiBlbmRwb2ludCB7CgkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZzbjY1ZHNp
ODZfb3V0X2l2bz47CgkJCQl9OwoJCQl9OwoJCX07Cgl9OwoKCWJvZV9wYW5lbCB7CgkJY29tcGF0
aWJsZSA9ICJib2UsbnYxMzNmaG0tbjYxIjsKCQlwb3dlci1zdXBwbHkgPSA8JnZsY21fM3YzPjsK
CQluby1ocGQ7CgoJCXBvcnRzIHsKCQkJcG9ydCB7CgkJCQlib2VfcGFuZWxfaW5fZWRwOiBlbmRw
b2ludCB7CgkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZzbjY1ZHNpODZfb3V0X2JvZT47CgkJCQl9
OwoJCQl9OwoJCX07Cgl9OwoKCXNuNjVkc2k4NjogYnJpZGdlQDJjIHsKCQljb21wYXRpYmxlID0g
InRpLHNuNjVkc2k4NiI7CgoJCS4uLgoKCQlwb3J0cyB7CgkJCSNhZGRyZXNzLWNlbGxzID0gPDE+
OwoJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCgkJCS4uLgoKCQkJcG9ydEAxIHsKCQkJCSNhZGRyZXNz
LWNlbGxzID0gPDE+OwoJCQkJI3NpemUtY2VsbHMgPSA8MD47CgkJCQlyZWcgPSA8MT47CgoJCQkJ
ZW5kcG9pbnRAYzQgewoJCQkJCXJlZyA9IDwweGM0PjsKCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8
JmJvZV9wYW5lbF9pbl9lZHA+OwoJCQkJfTsKCgkJCQllbmRwb2ludEBjNSB7CgkJCQkJcmVnID0g
PDB4YzU+OwoJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmaXZvX3BhbmVsX2luX2VkcD47CgkJCQl9
OwoJCQl9OwoJCX07Cgl9Cn07CgpOb3RlIHRoYXQgdGhlIHBhbmVsLWlkIGlzIHBvdGVudGlhbGx5
IGEgc3BhcnNlLWludC4gIFRoZSB2YWx1ZXMgSSd2ZQpzZWVuIHNvIGZhciBvbiBhYXJjaDY0IGxh
cHRvcHMgYXJlOgoKICAqIDB4YzIKICAqIDB4YzMKICAqIDB4YzQKICAqIDB4YzUKICAqIDB4ODAx
MQogICogMHg4MDEyCiAgKiAweDgwNTUKICAqIDB4ODA1NgoKQXQgbGVhc3Qgb24gc25hcGRyYWdv
biBhYXJjaDY0IGxhcHRvcHMsIHRoZXkgY2FuIGJlIGFueSB1MzIgdmFsdWUuCgpIb3dldmVyLCBv
biB0aGVzZSBsYXB0b3BzLCB0aGUgYm9vdGxvYWRlci9maXJtd2FyZSBpcyBub3QgcG9wdWxhdGlu
ZyB0aGUKY2hvc2VuIG5vZGUsIGJ1dCBpbnN0ZWFkIHByb3ZpZGluZyBhbiAiVUVGSURpc3BsYXlJ
bmZvIiB2YXJpYWJsZSwgd2hpY2gKY29udGFpbnMgdGhlIHBhbmVsIGlkLiAgVW5mb3J0dW5hdGVs
eSBFRkkgdmFyaWFibGVzIGFyZSBvbmx5IGF2YWlsYWJsZQpiZWZvcmUgRXhpdEJvb3RTZXJ2aWNl
cywgc28gdGhlIHNlY29uZCBwYXRjaCBjaGVja3MgZm9yIHRoaXMgdmFyaWFibGUKYmVmb3JlIEVC
UyBhbmQgcG9wdWxhdGVzIHRoZSAvY2hvc2VuL3BhbmVsLWlkIHZhcmlhYmxlLgoKWzFdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjMwMDEvCgpSb2IgQ2xhcmsgKDQp
OgogIGR0LWJpbmRpbmdzOiBjaG9zZW46IGRvY3VtZW50IHBhbmVsLWlkIGJpbmRpbmcKICBlZmkv
bGlic3R1YjogZGV0ZWN0IHBhbmVsLWlkCiAgZHJtOiBhZGQgaGVscGVyIHRvIGxvb2t1cCBwYW5l
bC1pZAogIGRybS9icmlkZ2U6IHRpLXNuNjVkc2k4NjogdXNlIGhlbHBlciB0byBsb29rdXAgcGFu
ZWwtaWQKCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2hvc2VuLnR4dCB8IDY5
ICsrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL2FybS1z
dHViLmMgICAgICB8IDQ5ICsrKysrKysrKysrKysrCiBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJz
dHViL2VmaXN0dWIuaCAgICAgICB8ICAyICsKIGRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIv
ZmR0LmMgICAgICAgICAgIHwgIDkgKysrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVk
c2k4Ni5jICAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMgICAgICAgICAg
ICAgICAgICAgICB8IDIxICsrKysrKwogaW5jbHVkZS9kcm0vZHJtX29mLmggICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNyArKwogNyBmaWxlcyBjaGFuZ2VkLCAxNjAgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
