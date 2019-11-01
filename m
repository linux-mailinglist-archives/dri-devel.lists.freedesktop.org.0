Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F00ECB73
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503DC6E33E;
	Fri,  1 Nov 2019 22:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4EE6E33E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 22:37:47 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id r22so4986795qtt.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 15:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LGdeY7oWB17TnAUMaa0RtkRNLL4fGiuy6QxiZRPpPP8=;
 b=QjFcKbY6wuacVOpe/uIc9j85as6c+lKuCMmRrOjkKDQa75MDxJpzPNs5O0AHz4zTqE
 nNFdorAHPB+7SB5OZcW2tEyRnJQTxPku6x92OHGos5sAfTzJ1fPJ0J5CvxG16HtZ6DGv
 KFVXDTvRMla6XR0pSplpqFWe/fsl8Kan2d0mUez05w22c60kInJHVU/AOOo1BJ9KZxBw
 MonfCrgUH1gbwgGymM7wWpdIxq49fOkWyW1v+6TuZYI6TiJgc7BsZb4YQlXMKTr9jcUz
 t8YZsUzakZMMb+tEXZ13VolFahKAviptRW9dNwzFMAPRYUsjmJJP2e5owvuXeFF92PB7
 BoNw==
X-Gm-Message-State: APjAAAV2jJYH3kqnpHviudSTv3GNRnqoCRQtc2PZwYbvb/2ugrG8UGNy
 vlS4dfaqQH49it57QkAirB8=
X-Google-Smtp-Source: APXvYqzRx6KDYglL02uS0KSCwKYUgED5SRybgScUirfxM9VudDlmhHkE8C/420B3/mS2oT6BWSddZQ==
X-Received: by 2002:ac8:74c3:: with SMTP id j3mr1871355qtr.113.1572647866452; 
 Fri, 01 Nov 2019 15:37:46 -0700 (PDT)
Received: from localhost.localdomain (179-241-199-14.3g.claro.net.br.
 [179.241.199.14])
 by smtp.gmail.com with ESMTPSA id x64sm4192780qkd.88.2019.11.01.15.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 15:37:45 -0700 (PDT)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: outreachy-kernel@googlegroups.com, manasi.d.navare@intel.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Subject: [PATCH] drm/vkms: Update VKMS documentation
Date: Fri,  1 Nov 2019 19:37:35 -0300
Message-Id: <20191101223735.2425-1-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LGdeY7oWB17TnAUMaa0RtkRNLL4fGiuy6QxiZRPpPP8=;
 b=TNdD3ggUUn77JBgZbx0bJOfzDhFbOZLSfI7IOLdB//bieFBARrcHiwoIH87O7YgV0R
 ak+TPpvIhrrItkHz93pykSwRFdmCQr7bbo+ajQetvP4F4HGS7mB+HIZ/VcnUoPZDFkeg
 bNN3HibPUGLwJ5C6qD+vjY+bp4BuGxABAxOQGxjk7Uh10EX13HCgH3NCLo1Qa/QFNEu5
 37RNjHO7LDFzouXUAilGxaIiuZOmhX4QNavQEZI8SKa03uD0mhO7npP0qqjO5Crh0/r5
 IkQpglJqe5tf/aqELFE4swyCAt5BQLVluT11BfqBPve6t5hS1Lh+iUPpYNtUi7w0NDQo
 2DYA==
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

U21hbGwgY2hhbmdlcyBpbiB0aGUgZHJpdmVyIGRvY3VtZW50YXRpb24sIGNsYXJpZmluZyB0aGUg
ZGVzY3JpcHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBHYWJyaWVsYSBCaXR0ZW5jb3VydCA8Z2Ficmll
bGFiaXR0ZW5jb3VydDAwQGdtYWlsLmNvbT4KCi0tLQoKVGVzdGVkIHVzaW5nOiBtYWtlIGh0bWxk
b2NzCi0tLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYyB8IDggKysrKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21z
L3ZrbXNfZHJ2LmMKaW5kZXggODA1MjRhMjI0MTJhLi41MmU3NjFiZDZjMmQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zr
bXMvdmttc19kcnYuYwpAQCAtMywxMCArMywxMCBAQAogLyoqCiAgKiBET0M6IHZrbXMgKFZpcnR1
YWwgS2VybmVsIE1vZGVzZXR0aW5nKQogICoKLSAqIHZrbXMgaXMgYSBzb2Z0d2FyZS1vbmx5IG1v
ZGVsIG9mIGEga21zIGRyaXZlciB0aGF0IGlzIHVzZWZ1bCBmb3IgdGVzdGluZywKLSAqIG9yIGZv
ciBydW5uaW5nIFggKG9yIHNpbWlsYXIpIG9uIGhlYWRsZXNzIG1hY2hpbmVzIGFuZCBiZSBhYmxl
IHRvIHN0aWxsCi0gKiB1c2UgdGhlIEdQVS4gdmttcyBhaW1zIHRvIGVuYWJsZSBhIHZpcnR1YWwg
ZGlzcGxheSB3aXRob3V0IHRoZSBuZWVkIGZvcgotICogYSBoYXJkd2FyZSBkaXNwbGF5IGNhcGFi
aWxpdHkuCisgKiBWS01TIGlzIGEgc29mdHdhcmUtb25seSBtb2RlbCBvZiBhIEtNUyBkcml2ZXIg
dGhhdCBpcyB1c2VmdWwgZm9yIHRlc3RpbmcKKyAqIGFuZCBmb3IgcnVubmluZyBYIChvciBzaW1p
bGFyKSBvbiBoZWFkbGVzcyBtYWNoaW5lcy4gVktNUyBhaW1zIHRvIGVuYWJsZQorICogYSB2aXJ0
dWFsIGRpc3BsYXkgd2l0aCBubyBuZWVkIG9mIGEgaGFyZHdhcmUgZGlzcGxheSBjYXBhYmlsaXR5
LCByZWxlYXNpbmcKKyAqIHRoZSBHUFUgaW4gRFJNIEFQSSB0ZXN0cy4KICAqLwogCiAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
