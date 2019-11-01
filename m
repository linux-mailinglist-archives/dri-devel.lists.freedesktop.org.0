Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A328CECA82
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 22:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279A56F883;
	Fri,  1 Nov 2019 21:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CDC6F883
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 21:48:58 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id u22so14862221qtq.13
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 14:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ydkaqiUndvm12oKsPXUCT8XdG0VC6PHW8cZ5YaD7Is=;
 b=V7EGSrpjn7lYkSedbe3DNyDkzeFdBnY3oA0vqHZ22iCUkctOnfl36+JuUVGXccv3/6
 kox3LbKQnm9py4ibb86Ud70pu0vu+pe6g4tOceE0gz9J/w1asZ8OXkoNwHO3yd8HVEgW
 JOQ4Ubf1xL5TQjAt0zwJ9xT2ikjvGBIscnQ5M6sqt3FIzybFZFiWMk40q1IpSzFaXY3v
 93Wtiz4MemX0prEQIyyeldgco1KfYf+tBQYTNyn83+7gNR6srKa6F0uJmsws81Ij0wLE
 upuXSximw+1ytRIFSiAiaIPk/HYx3b335TCBtIN+c9dXZjvuAV6dnp8ki2UqgP9vNJjr
 ejDQ==
X-Gm-Message-State: APjAAAVBPWfr/9jippPePUYTeBgfEhFa3XjKV3+7XLYhRilT/EhlgkRy
 bAAsUlOkaRFcoQG7bEz5j8Y=
X-Google-Smtp-Source: APXvYqzC91ObphFfFFrFsQgh1ScFvBn+AK56YCKyqplp9ASMS4yDktUIdICHLEO1znGXJAk6S9Kpbw==
X-Received: by 2002:ad4:57a7:: with SMTP id g7mr12254000qvx.30.1572644937106; 
 Fri, 01 Nov 2019 14:48:57 -0700 (PDT)
Received: from GBdebian.ic.unicamp.br (wifi-177-220-84-14.wifi.ic.unicamp.br.
 [177.220.84.14])
 by smtp.gmail.com with ESMTPSA id w24sm5482300qta.44.2019.11.01.14.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 14:48:56 -0700 (PDT)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: outreachy-kernel@googlegroups.com, manasi.d.navare@intel.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
 trivial@kernel.org
Subject: [PATCH v2 VKMS 0/2] drm/vkms: Changing some words in 'blend' function
 documentation
Date: Fri,  1 Nov 2019 18:48:46 -0300
Message-Id: <20191101214848.7574-1-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ydkaqiUndvm12oKsPXUCT8XdG0VC6PHW8cZ5YaD7Is=;
 b=VkajqyNcqBhTysuY+9L/fqxUYlJRoeFSBdotA9y5qE3URez6Jq5OwAJAvLmEOxg/fQ
 Mu3367pMl5vAKCTzUIaO5TJIGwVPUtpbPtm32kre4hIi7X4ks3TV8nWVS2fC0WpQQiet
 vd+uXgCXb+am1z3HG67PI8nSk3VdE7POz4Zqov4oDyCRbVCgF3SVBzUMj7UuSHNw9qsf
 vFsh+b/Cuq1f+JreP8BlILo4wn1gyyW/amCR6GK+UL8yqoQtlZeiK2zxp6yhQHHex5fw
 4HN9O7nzyxS66p2ZX73FAoJbB+03uawlH46258rLmCZCbHZtsjUbaGLKuzqLZGFDzfmo
 e6vQ==
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

Q2hhbmdlcyBpbiB2MjoKLSBBZGQgZml4aW5nIHR5cG8gaW4gd29yZCAnZGVzdGluYXRpb24nCi0g
QWRkIGNoYW5nZSBvZiB0aGUgcHJlcG9zaXRpb24KLSBJbiB2MSB0aGUgbmFtZSBvZiB0aGUgZnVu
Y3Rpb24gd2FzIHdyb25nLCBmaXggaXQgaW4gdGhpcyB2ZXJzaW9uCi0gQWRkIHRoZSBwYXRjaCBj
aGFuZ2luZyB0aGUgd29yZCAnVE9ETycKCkkndmUgdGVzdGVkIHRoZSBwYXRjaGVzIHVzaW5nIGtl
cm5lbC1kb2MKCkdhYnJpZWxhIEJpdHRlbmNvdXJ0ICgyKToKICBkcm0vdmttczogRml4IHR5cG8g
YW5kIHByZXBvc2lvbiBpbiBmdW5jdGlvbiBkb2N1bWVudGF0aW9uCiAgZHJtL3ZrbXM6IENoYW5n
aW5nIGEgJ1RvZG8nIHRvIGEgJ1RPRE8nIGluIGNvZGUgY29tbWVudAoKIGRyaXZlcnMvZ3B1L2Ry
bS92a21zL3ZrbXNfY29tcG9zZXIuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
