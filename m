Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F65ECA85
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 22:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28CF6F884;
	Fri,  1 Nov 2019 21:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CE26F884
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 21:49:07 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id h15so2397061qka.13
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 14:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hZRXOfCkDmbQwzCISueAd+Ee+dZ/XgL8g6yvVaK0HEk=;
 b=IqC+cMBemQ5Y13MOyWB6WtxBDuK/VKTUhCFB+CxQUJG/wdGL3N+0X2PSMykg7SXD8c
 iD29qUIrFnTOdhwuWR/k2IhN+hHgEnPgvMoRJ2/CCn0XIbGm+e6RZWVXV99flEcy3aqx
 c6Pf689UDLbq0pc6NrZWjRYb1vx5V1UdwEfeOrCkPsbMw5mR0EaLfPfAW6cYXBSNb3jP
 IuazUVSVtTuuYBnLTMhcU1rrWqLs+sNFkkq3TTEn0EMb8Y47SiUzF6BPk/9u2510QVwG
 ANyKIDM65yg2OSbLgMsuSabv1IFkhtWHkBLXa/GZjCn3WdV9AraCL1wBWMlpIVOdOrum
 hKNw==
X-Gm-Message-State: APjAAAWXqX3xsUj6CAhAzRAvxpzkEQ5BY0Q86vGpjnEh0rV138d1quEF
 9UmngKXnha9dLRydDyrt+n0=
X-Google-Smtp-Source: APXvYqx0SrL2i9tPsPunuyTY/WLdRVfHllsiDntoDA5pM8CyTIe7JPi13cVHHHhgPWFVcLRPuFLktQ==
X-Received: by 2002:a37:490c:: with SMTP id w12mr2661454qka.101.1572644946513; 
 Fri, 01 Nov 2019 14:49:06 -0700 (PDT)
Received: from GBdebian.ic.unicamp.br (wifi-177-220-84-14.wifi.ic.unicamp.br.
 [177.220.84.14])
 by smtp.gmail.com with ESMTPSA id w24sm5482300qta.44.2019.11.01.14.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 14:49:05 -0700 (PDT)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: outreachy-kernel@googlegroups.com, manasi.d.navare@intel.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
 trivial@kernel.org
Subject: [PATCH v2 VKMS 2/2] drm/vkms: Changing a 'Todo' to a 'TODO' in code
 comment
Date: Fri,  1 Nov 2019 18:48:48 -0300
Message-Id: <20191101214848.7574-3-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101214848.7574-1-gabrielabittencourt00@gmail.com>
References: <20191101214848.7574-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hZRXOfCkDmbQwzCISueAd+Ee+dZ/XgL8g6yvVaK0HEk=;
 b=VtECGWAYmAgHh809vWPORt9NEntfwNpVsMgB0GsJLCUiDrG2fR7ttFlYizoeMWxrKa
 151etwuDqGi0fPOtVUtF3rwpc+3ZVN5ko3UALyVZ0eFlAytqKHSlmUvWPjzpGIjCvVTk
 LfQEtmq49mMblA3C1Qou3Zvc7w4/oup1yP+Rn443dOp1e3X/PKh4M6E1rpwNtoNYDP3o
 p9hJXg04jrqExuGZPGI1FPKMbQOgJQfGxo7zUjiWzBq2A72ONh6yN2+cCi7JxGBQudMd
 IgkXdgCDvsHfgtVPiRFBRTO9CBu0rD81aY8wDXpvOS9zxL39rlQpX65O+ZLz4335X04S
 CotA==
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
Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdpbmcgdGhlIHRhc2sgaW50cm9kdWN0aW9uIGZvciB0aGUgd29yZCAnVE9ETycuIFdpdGgg
dGhlIFRPRE8gd29yZCBhbGwKaW4gdXBwZXJjYXNlLCBhcyBpcyB0aGUgc3RhbmRhcmQsIGl0J3Mg
ZWFzaWVyIHRvIGZpbmQgdGhlIHRhc2tzIHRoYXQgaGF2ZQp0byBiZSBkb25lIHRocm91Z2hvdXQg
dGhlIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBHYWJyaWVsYSBCaXR0ZW5jb3VydCA8Z2FicmllbGFi
aXR0ZW5jb3VydDAwQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Nv
bXBvc2VyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMKaW5kZXggODg4OTBkZGZjNGJk
Li40YWYyZjE5NDgwZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29t
cG9zZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMKQEAgLTU0
LDcgKzU0LDcgQEAgc3RhdGljIHVpbnQzMl90IGNvbXB1dGVfY3JjKHZvaWQgKnZhZGRyX291dCwg
c3RydWN0IHZrbXNfY29tcG9zZXIgKmNvbXBvc2VyKQogICogYXQgdmFkZHJfZHN0IHVzaW5nIGJ1
ZmZlcidzIG1ldGFkYXRhIHRvIGxvY2F0ZSB0aGUgbmV3IHZhbHVlcwogICogZnJvbSB2YWRkcl9z
cmMgYW5kIHRoZWlyIGRlc3RpbmF0aW9uIGF0IHZhZGRyX2RzdC4KICAqCi0gKiBUb2RvOiBVc2Ug
dGhlIGFscGhhIHZhbHVlIHRvIGJsZW5kIHZhZGRyX3NyYyB3aXRoIHZhZGRyX2RzdAorICogVE9E
TzogVXNlIHRoZSBhbHBoYSB2YWx1ZSB0byBibGVuZCB2YWRkcl9zcmMgd2l0aCB2YWRkcl9kc3QK
ICAqCSBpbnN0ZWFkIG9mIG92ZXJ3cml0aW5nIGl0LgogICovCiBzdGF0aWMgdm9pZCBibGVuZCh2
b2lkICp2YWRkcl9kc3QsIHZvaWQgKnZhZGRyX3NyYywKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
