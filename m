Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449834F7D5
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 20:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA346E8E8;
	Sat, 22 Jun 2019 18:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A90F6E8E8
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 18:49:54 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id m29so10459345qtu.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 11:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AjRdUNJz6iJf3T4p4N5sgiKPSaBuomnHkkV8K9p9Sx8=;
 b=XAKxJnJQZNA6SfbFIuJ9Gv1SGsdiy2Hd3RFyhFb2P9tAN3pq1xEURLHLKnsBnASB2f
 /XhyeWpuGVSAruqxDzjLk9pIC9epCDDqxkXgXIeg4t3bSua/yAmDUrGJiBUVzyA7wFHj
 Ftj8Up/lOrxu0w0kGywtQ5mZFhVNC/5YAcHrOj/RMDZZIQ6y8T6LPp5WKovtUhfge/Wx
 5Zdg9dT5SVTJH5x79H9qFV0yzSvVNalp/henXxPvNNJKV70J1jBvxSRZyUKZpQ7Ozc8t
 xXrIu4wM6SDB+bBdJsaWJqxtz9YPqC6Kph+eFBdiJ0ekfaVrKa8zwOI/ytfnw4BURL4L
 9G+Q==
X-Gm-Message-State: APjAAAWhqbTLpIuqbMTrplqwJhzGD67aFc/VMg05vxN5MEGo4H8eGNBh
 Lc58AyYdh4L/qnjZTpdgtayb9nymyLo=
X-Google-Smtp-Source: APXvYqw3qTNjiKNYGJreJBNPaZ4/QmL/wudqIpYea9bFsUf6DGIYlQoENDRBLUQZLzJg8NR4SKbBkQ==
X-Received: by 2002:a0c:bf4a:: with SMTP id b10mr25918106qvj.120.1561229393259; 
 Sat, 22 Jun 2019 11:49:53 -0700 (PDT)
Received: from athos.hellosponsor.com
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id u19sm3582609qka.35.2019.06.22.11.49.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 22 Jun 2019 11:49:52 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] util: fix include path for drm_mode.h
Date: Sat, 22 Jun 2019 14:49:50 -0400
Message-Id: <20190622184950.16243-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AjRdUNJz6iJf3T4p4N5sgiKPSaBuomnHkkV8K9p9Sx8=;
 b=SsiwMzb1MxYMHnQ8HqgOubLUebbawJvNV9Ve6H/+XwUx6Sh5aolnuqBRmgcQ9uVxJl
 Q3jKGdqTUs1hwImYmq4uf0xvFThSf/s6hdSObDmzEJqKYxN+NM3ULbDgVn8IYL2myit6
 22ITZzjqKt/oO9Ikz1kjm6by8fC4NujXBkKXdJo6c3nBR3w4EQbVcksDz9IyuJgJvDah
 6vudDzpjZg94tqtyyVyl0oBduLi26EFzj2qxGTR8Wdbeo03ll9xnVEPkdfz59Lmx8fG4
 IUKFdZXoUrD+CQGaPbwZNcz4CJ7t9E7Xmy/35+nh+fQUUwlSvK0w7ZRvLtx3QAeY/4cG
 GXGw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgotLS0KIHRl
c3RzL3V0aWwvcGF0dGVybi5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdXRpbC9wYXR0ZXJuLmggYi90ZXN0
cy91dGlsL3BhdHRlcm4uaAppbmRleCA0MjRiMGUxOS4uZWEzOGNhZmQgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL3V0aWwvcGF0dGVybi5oCisrKyBiL3Rlc3RzL3V0aWwvcGF0dGVybi5oCkBAIC0yNiw3ICsy
Niw3IEBACiAjaWZuZGVmIFVUSUxfUEFUVEVSTl9ICiAjZGVmaW5lIFVUSUxfUEFUVEVSTl9ICiAK
LSNpbmNsdWRlIDxkcm0vZHJtX21vZGUuaD4KKyNpbmNsdWRlIDxkcm1fbW9kZS5oPgogCiBlbnVt
IHV0aWxfZmlsbF9wYXR0ZXJuIHsKIAlVVElMX1BBVFRFUk5fVElMRVMsCi0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
