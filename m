Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB315248C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0889F89FC8;
	Tue, 25 Jun 2019 07:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290BB897D4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:49:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s15so13669519wmj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:references:reply-to
 :message-id:mime-version;
 bh=qICt3tvrDEjsshgOgeqB9NCEtKIKhDes2GEOtGUCIpo=;
 b=GjlLCrKx6fmxUKin3xGK0wpyEkYnxrVn4A5svprCZrU7fLI1MMD/T7tUwiFQbGmHQx
 1DT11KdIhgE3QUFRnn6viThww4curaAVZ3MBhGPAJBFTlavwSbuyv1vD//SGhGLTE+AV
 5JUC5C/2NLvSlOAVRoEjnwe+LsAg7T6BY9RjjmJcRuD14oeFXuC+nw2jXedpHZ4jwb5u
 DLy7eQXOX2fohFgzA7xuh+K1usfEufjbXWBSKxOU8IeJlMb3B2thf2r3GAhDdyORNe+b
 D1YnOaDT0aBa/F+eLaLt+UykO0RYxCcR7lq1WXhdOTayVGmo7a0UDd0knqTUd/AYuvKt
 SpTA==
X-Gm-Message-State: APjAAAUJvUnWUnPE7hnKrZzQWDrp5sitXjkTyoCIfEHo1zqaaVgViCZJ
 5E4OrTftW9FF3Dld7SNlw3z0OQ==
X-Google-Smtp-Source: APXvYqyo+n4FXVEBememSCgVf3nyfXvEm0+s6OodWbZ0mTPQMuiNLuOddy70bQx8iLDOUizpxuJGKg==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr15799778wmb.119.1561387759831; 
 Mon, 24 Jun 2019 07:49:19 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t63sm11204083wmt.6.2019.06.24.07.49.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 07:49:19 -0700 (PDT)
From: Julien Masson <jmasson@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 9/9] drm: meson: venc: set the correct macrovision max
 amplitude value
Date: Mon, 24 Jun 2019 16:49:12 +0200
References: <86zhm782g5.fsf@baylibre.com>
Message-ID: <86mui782dt.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:references:reply-to:message-id:mime-version;
 bh=qICt3tvrDEjsshgOgeqB9NCEtKIKhDes2GEOtGUCIpo=;
 b=mnrc7AJREizTtyko4LB8qv6Cg5B7WxC4INlkHs9Ks4iSd2+apictmURS40KuI0t5Tn
 IB2Vnf/t+LVnP+tv1JvqK0FMsszntab9bsBVDhaq6iH/5dr9u7y6ngMLni2/8v8/KD3I
 1RNcMErB5MGZrpdrKROpddh54ZDHRNg8rOMycQTJexvvjS09bSP+7duvAXFZuxYnmwGn
 Wpgf31NfM9CwuosNa95m1z+0d2TNHFTO5beH//s/fat/KCaC+gG8C9eFd8v7zvt8OC3u
 asoDvcItzT1/rBmW1y+Ab6G7mIjNAxdR7PXNNpiCVmsN1jFfPqU98sGJajv6Icl+rVEt
 2jCg==
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
Reply-To: 86zhm782g5.fsf@baylibre.com
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIHRoZSByZWdpc3RlciBkZXNjcmlwdGlvbiBvZiBFTkNJX01BQ1ZfTUFYX0FN
UCwgdGhlCm1hY3JvdmlzaW9uIG1heCBhbXBsaXR1ZGUgdmFsdWUgc2hvdWxkIGJlOgotIGhkbWkg
NDgwaSA9PiAweGIKLSBoZG1pIDU3NmkgPT4gMHg3CgpUaGUgbWF4IHZhbHVlIGlzIDB4N2ZmICgx
MCBiaXRzKS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBNYXNzb24gPGptYXNzb25AYmF5bGlicmUu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMgfCA0ICsrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9tZXNvbl92ZW5jLmMKaW5kZXggMjgzNTEzM2FiNjc2Li5hY2FkMTZmZjczNzEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX3ZlbmMuYwpAQCAtMTkyLDcgKzE5Miw3IEBAIHVuaW9uIG1lc29u
X2hkbWlfdmVuY19tb2RlIG1lc29uX2hkbWlfZW5jaV9tb2RlXzQ4MGkgPSB7CiAJCS5oc29fZW5k
ID0gMTI5LAogCQkudnNvX2V2ZW4gPSAzLAogCQkudnNvX29kZCA9IDI2MCwKLQkJLm1hY3ZfbWF4
X2FtcCA9IDB4ODEwYiwKKwkJLm1hY3ZfbWF4X2FtcCA9IDB4YiwKIAkJLnZpZGVvX3Byb2dfbW9k
ZSA9IDB4ZjAsCiAJCS52aWRlb19tb2RlID0gMHg4LAogCQkuc2NoX2FkanVzdCA9IDB4MjAsCkBA
IC0yMTIsNyArMjEyLDcgQEAgdW5pb24gbWVzb25faGRtaV92ZW5jX21vZGUgbWVzb25faGRtaV9l
bmNpX21vZGVfNTc2aSA9IHsKIAkJLmhzb19lbmQgPSAxMjksCiAJCS52c29fZXZlbiA9IDMsCiAJ
CS52c29fb2RkID0gMjYwLAotCQkubWFjdl9tYXhfYW1wID0gODEwNywKKwkJLm1hY3ZfbWF4X2Ft
cCA9IDB4NywKIAkJLnZpZGVvX3Byb2dfbW9kZSA9IDB4ZmYsCiAJCS52aWRlb19tb2RlID0gMHgx
MywKIAkJLnNjaF9hZGp1c3QgPSAweDI4LAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
