Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32BF8191D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12B589D60;
	Mon,  5 Aug 2019 12:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D7B89D60
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:23:53 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k21so78477996edq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+QFY1+jfK4rTxgiosrQvn5bsqqg7EEV7J+Kkr69FCU=;
 b=C4UESgpZv7RVdEtsol2HUzTkrly2WcXW0yW37z1f9NQt7XDhlNYrXHsZp8wLQPkDv/
 IALpsNxAZE0gYK5C3PH3i2G6+U9bpEH9ISO1I3tDpw7/HjbCFIRNOe/wuPmjWHNvCNqX
 xqX67vazKgNoWA1DzoO7ub/hjGlq+M4HF/ir97N5mrJ2u7shZgqmy7O20L5k/guNGDWX
 3TgDjYeFswpUbWfgF4ccf+yRG87UvY8RynvDZImGd9tFaR+FjVJg1bg1sDlijCLvLIxt
 k88F6sL2EjdVJ7ifsHLFgqg3+972nzjt4PgPaGhJfeS+mt9/MUMn5DAhfYvKavZjofkZ
 wAuA==
X-Gm-Message-State: APjAAAUOYIqCCv/V+wJzg62wVF76AMlb8AGSq3ClFpG2PfnMwqcs/FLc
 lGK/04eVGPrG44NX5sl7aefJ8hfL
X-Google-Smtp-Source: APXvYqy76joN8ke51yc6PhkgGr0tODzo4lWh977to1HVDEwNh4C/eFUxBJtETKLo5+u6SJXOJCS6NQ==
X-Received: by 2002:a50:ad0c:: with SMTP id y12mr130828315edc.25.1565007832184; 
 Mon, 05 Aug 2019 05:23:52 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id nn19sm13430627ejb.12.2019.08.05.05.23.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:23:51 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/21] drm/dp: Sort includes alphabetically
Date: Mon,  5 Aug 2019 14:23:30 +0200
Message-Id: <20190805122350.8838-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+QFY1+jfK4rTxgiosrQvn5bsqqg7EEV7J+Kkr69FCU=;
 b=DHyYgVhWLGi4GJtt41v7XIC8mvrFUHDruKWgnUmwl65vP/wdfAFuXkDGShQX38Qdvz
 nzIXGjDeKJmmy4txRsW487Qp1YeN7BD/LUNAw6k/8Ge38GTvlqAASno02Qo1bekhvA1Z
 Gowt7S/8mp628IklEavsHWMoyncd+38c0LYXHO3TsUz+7P0rc6lv7wYDNXYXqqIG5Nfm
 oTkGOmrSqreQHwTWSVQWPGt9M9NDS7n3Tb9BGLMdRWtzHfKUePMxRX1QHQFjHfEK9WpA
 GKqPT7ncHsopylatzq1VVNIteLEUA5lrORB/a478wB4ErCGbsWckSDSejmbOCrWPB1Ub
 I9/g==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCktlZXBpbmcgdGhlIGxp
c3Qgc29ydGVkIGFscGhhYmV0aWNhbGx5IG1ha2VzIGl0IG11Y2ggZWFzaWVyIHRvIGRldGVybWlu
ZQp3aGVyZSB0byBhZGQgbmV3IGluY2x1ZGVzLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRp
bmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0v
ZHJtX2RwX2hlbHBlci5oCmluZGV4IDgzNjQ1MDJmOTJjZi4uMTE0MjYxMTU4YjczIDEwMDY0NAot
LS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Rw
X2hlbHBlci5oCkBAIC0yMyw5ICsyMyw5IEBACiAjaWZuZGVmIF9EUk1fRFBfSEVMUEVSX0hfCiAj
ZGVmaW5lIF9EUk1fRFBfSEVMUEVSX0hfCiAKLSNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgotI2lu
Y2x1ZGUgPGxpbnV4L2kyYy5oPgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CisjaW5jbHVkZSA8
bGludXgvaTJjLmg+CisjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KIAogLyoKICAqIFVubGVzcyBv
dGhlcndpc2Ugbm90ZWQsIGFsbCB2YWx1ZXMgYXJlIGZyb20gdGhlIERQIDEuMWEgc3BlYy4gIE5v
dGUgdGhhdAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
