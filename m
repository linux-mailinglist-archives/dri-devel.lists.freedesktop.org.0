Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257F190192
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E876E408;
	Mon, 23 Mar 2020 23:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1DD6E400
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:09:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id c187so1332453wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sg2qLtVi/m/AD+n66HzhenmkGMOB9RjitFrDcK+U5kI=;
 b=QD5Ew9+bwCUoWKRRsmA9W2OICeWKc1AKN1CICAKRPeyuFFSauHp28JFV10eJxtX5r0
 XE1lb8GkOVkG0lG5T+WYmVLIzbj6MH+Zqa28LxwSGWp/QwLT1vtxxpxP/Ho9bZSAv0dV
 swp48yIuWFOQ82WOQvi449PMRtvEq47Wo7LLXMWNdquYyTY7glXVPSJf7Cn6Fb6EnNsO
 R+JdWJChkwA+XJsTwudhTxtsHTM5aOT3Jo58cm+N/G6N+GNNsuk3pdxXIkluTAZvxb6m
 00g2wlvYtG46j/iaX6mdrMtd5HMnLTRWv2LZOLP1fqEO++Wtm7YLkmfbVE8k7SkqR9Ex
 MGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sg2qLtVi/m/AD+n66HzhenmkGMOB9RjitFrDcK+U5kI=;
 b=mrB6OA1ptqvn0Y4hsIe4MxkMhTQvEVwj9VeQMEVnzWL3pTJA7zX8NBTYZ55oNHv9xa
 rSS2fIwYPjLtIwy9nQ1OGpTOUaNmo5YgSrw/bbIxiMxMM+2zxV3ErDB7E61ZCY8hKRVB
 1NF+bj2uEUxeL5woeK+doaA6/Zo2VQIaCDZebuvr4Fd0ZoIdWqtHj9cFtjMaFKJO88H3
 Sc0IX7NP5UykrNAjSQFOTNHazkD7z+NKr70Ui0m0Qw94mnLRWuB3yNVeSH59Cz8Za1Vs
 p/Bs9HKVEe8Cm6+MSAtKo7dvjjryicTB8oEB1QrVQq6eTQrwhP3VHciwtqzq+aJ9Lqhv
 B09A==
X-Gm-Message-State: ANhLgQ17KF/L3mxBMLG0idifako6tLy8QIRmzVqcmf1WhBS0Y+0/JcKA
 Y33dei01foI009nRv2Sx5m4rCfqm
X-Google-Smtp-Source: ADFU+vu1b5lFrhSoDLPMR/D1fHszYf9BM6pbk0rAa7UcfduAj/GdZfy+2kE17PjspJ+Mu6qVQxEGxg==
X-Received: by 2002:a1c:8008:: with SMTP id b8mr1760656wmd.43.1585004961955;
 Mon, 23 Mar 2020 16:09:21 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id q185sm1641937wme.10.2020.03.23.16.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:09:21 -0700 (PDT)
From: Roland Scheidegger <rscheidegger.oss@gmail.com>
X-Google-Original-From: Roland Scheidegger <sroland@vmware.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 17/17] drm/vmwgfx: Use vmwgfx version 2.18 to signal SM5
 compatibility
Date: Tue, 24 Mar 2020 00:09:01 +0100
Message-Id: <20200323230901.13302-18-sroland@vmware.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323230901.13302-1-sroland@vmware.com>
References: <20200323230901.13302-1-sroland@vmware.com>
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
Cc: linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgPHRob21hc19vc0BzaGlwbWFpbC5vcmc+
CgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSA8dGhvbWFzX29zQHNo
aXBtYWlsLm9yZz4KUmV2aWV3ZWQtYnk6IENoYXJtYWluZSBMZWUgPGNoYXJtYWluZWxAdm13YXJl
LmNvbT4KUmV2aWV3ZWQtYnk6IEJyaWFuIFBhdWwgPGJyaWFucEB2bXdhcmUuY29tPgpSZXZpZXdl
ZC1ieTogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2FyZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgpfX18KdjI6IFVzZSAy
LjE4IGluc3RlYWQgb2YgMi4xNwotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Ry
di5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggYi9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAppbmRleCAwNDQ3YmU4NzY5N2UuLjVkZGJj
YjlmNmRmNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKQEAgLTU4LDcgKzU4LDcg
QEAKICNkZWZpbmUgVk1XR0ZYX0RSSVZFUl9OQU1FICJ2bXdnZngiCiAjZGVmaW5lIFZNV0dGWF9E
UklWRVJfREFURSAiMjAyMDAxMTQiCiAjZGVmaW5lIFZNV0dGWF9EUklWRVJfTUFKT1IgMgotI2Rl
ZmluZSBWTVdHRlhfRFJJVkVSX01JTk9SIDE3CisjZGVmaW5lIFZNV0dGWF9EUklWRVJfTUlOT1Ig
MTgKICNkZWZpbmUgVk1XR0ZYX0RSSVZFUl9QQVRDSExFVkVMIDAKICNkZWZpbmUgVk1XR0ZYX0ZJ
Rk9fU1RBVElDX1NJWkUgKDEwMjQqMTAyNCkKICNkZWZpbmUgVk1XR0ZYX01BWF9SRUxPQ0FUSU9O
UyAyMDQ4Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
