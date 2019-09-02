Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8675A54DE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DC6899F2;
	Mon,  2 Sep 2019 11:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45BB899F2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k2so12748069wmj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k+QFY1+jfK4rTxgiosrQvn5bsqqg7EEV7J+Kkr69FCU=;
 b=ZmHT8TFM25ncYnkt946Av33jJAp4v5UaLgH0JUoKYJfKKRA5mke3Ec1CNoK7u/wqnY
 4ZevGwBlKB9vt09guCMXsQlv05V9BETSTiGNOg9Fh6JeJ3+MgGYOi2riyqO71d7/KJ//
 A7PWx6UrnH18WcttFIOCfN8800hqcLinZG+QPuq+wQPrv+dAn05UP9CA5beMuMB5mfv0
 Qip8dEbZqhsZp4x0DXqToz1LgORSKFsmn7gah188Pry9Hul2EVxo51cv4AsKi/DBrGw8
 LAppZMqjHwFQd6KQypaE608FvRx/VoergHBuljF1wgkiuPlJ7Srn6tCHrnXjskz1eiC8
 3Zhg==
X-Gm-Message-State: APjAAAX+1OQMm1TSwgBc2psAGyVTZzZf3D4nZeLS0JoKMJ2H/g/CKghW
 IrbGpj7h9Ir+/eqLQN/YJDq5X6fT
X-Google-Smtp-Source: APXvYqy76etKdLEZDSV/who0klckKUV6h3+Bl426GbVXNuefS+SurbVW1j2pelFqgi2rDs3HJHC4xg==
X-Received: by 2002:a05:600c:21d9:: with SMTP id
 x25mr28957096wmj.130.1567423885698; 
 Mon, 02 Sep 2019 04:31:25 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id z189sm4869434wmc.25.2019.09.02.04.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:24 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/21] drm/dp: Sort includes alphabetically
Date: Mon,  2 Sep 2019 13:31:01 +0200
Message-Id: <20190902113121.31323-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k+QFY1+jfK4rTxgiosrQvn5bsqqg7EEV7J+Kkr69FCU=;
 b=bXkFjv4wrF8+T5IuDvp8KK5VJKVX0uoFv/F56Ehq5Km8OiiTyHPJ+ZpCbHZJEHItfk
 ri8ZE79hyEm9xE7xD28rJXfjMJNSftWXMtTyvLclQCXRmAy4W8BFa6wxdwgfzKGXNzNr
 m77CtFgIfVvRz4g+KnjuF57rvqB/4Ssr3GZ9ywuurMdMnEovqFQQrgoGjC8vANnj5tg4
 sS6zcZcMKJxFTn/1kpNu3tQ4AEmE59z51lV+6RC3GNqyTKQ4vEJcT1LzPc0RB0RX720H
 EfDf5iCdEmOtRni4hLDfahbRyW+qdW89oik6lpnJ9m/wAzKttauB3Y5VVZ3SIuUbQySI
 GEoQ==
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
