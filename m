Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF12B1B0BD
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 09:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D922E895B6;
	Mon, 13 May 2019 07:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC4789B20
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 17:46:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n25so11481677wmk.4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 10:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O/WO/ffKN1nR7MAqYGhQYYeumvZlvKqHgg+H3sUnXZQ=;
 b=gBEQ0sILyxk8fHDBnNHt4FPl7y1nA/3YCJ1VZG7s80daCDJDTToll1NEzxjz1GXePO
 Zds9F7TWpacBxLL9u9e4C0Btosir/5SIKy++SDpN5zg5OBm0rzfN2B0efVCcudI4C4Jf
 4cQ461C4crwuqA965fZ5g/DvqBLe+bcwsaGzx0zRTKWTWAnBqlXhPf+oWoObkl+aH2Ez
 2S6EwC2e+V3hObCc2C5c5y9EIsW/cD9WWdSAQ65m8MP7c0pCjU9+Y62NU9bvONMiqJJw
 EDAPubfrEXsQEjhCU6N1s2DjSazY9G9gTn8Ws6EELgJlzJppGBvYzJVMjyWK7iZZRWBs
 iNlw==
X-Gm-Message-State: APjAAAW/dRq6/fAOhOKK7H3jkvFdbQtl7Y4m6AtGHAwvhKXevIK26az1
 uE3p9ApTMQjUppL5UiOiuQs=
X-Google-Smtp-Source: APXvYqzi9o0UaKC2uI0n2gwk41XjsRknm8NfjHda1nCX7OznFRIL6qrFRg5m6GcNJ+2ExgmPPAPjqQ==
X-Received: by 2002:a05:600c:2291:: with SMTP id
 17mr12838376wmf.132.1557683183110; 
 Sun, 12 May 2019 10:46:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id d14sm9090558wre.78.2019.05.12.10.46.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 10:46:22 -0700 (PDT)
From: peron.clem@gmail.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 7/8] arm64: dts: allwinner: Add mali GPU supply for
 OrangePi Boards
Date: Sun, 12 May 2019 19:46:07 +0200
Message-Id: <20190512174608.10083-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190512174608.10083-1-peron.clem@gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 May 2019 07:04:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O/WO/ffKN1nR7MAqYGhQYYeumvZlvKqHgg+H3sUnXZQ=;
 b=BfFp3mD1gJ83voX20yOdlNujQc4iP8GMJNSAhGKW9J+ieaGZrQZm70MlVwNRlAovJf
 cLFpPO4p3cCkiMwLKCMP3iIR2kpy2CwY88bzuvwuI29Rj1cxv6j36TrXibdYc/wS972g
 LokaEdxI8LH8sUVepVtWfShY3al33AYxz9wlelH2iHOQxrIUS7JQLWyjX+SBd/NT1JqG
 kh1JzmOkAKJLN4hcDplcv95TbVrzyCJiKzjHKPHo04KeZhCtZ+Q4/gkuu3KYJ/JUORGv
 D1fuidpRei9PjrnLRshDSoDfeqvNshBjQT3U9hUX6owqSSoRPARUTEn6Wo6xab5CBHev
 lMnQ==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KCkVuYWJsZSBhbmQg
YWRkIHN1cHBseSB0byB0aGUgTWFsaSBHUFUgbm9kZSBvbiB0aGUKT3JhbmdlIFBpIE9uZSBQbHVz
IGFuZCBMaXRlMiBib2FyZHMuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9u
LmNsZW1AZ21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUw
aS1oNi1vcmFuZ2VwaS5kdHNpIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1o
Ni1vcmFuZ2VwaS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2
LW9yYW5nZXBpLmR0c2kKaW5kZXggNjJlMjc5NDhhM2ZhLi5iZDEzMjk3NTU1YWIgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS5kdHNp
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS5k
dHNpCkBAIC01NSw2ICs1NSwxMSBAQAogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKKyZncHUgewor
CW1hbGktc3VwcGx5ID0gPCZyZWdfZGNkY2M+OworCXN0YXR1cyA9ICJva2F5IjsKK307CisKICZt
bWMwIHsKIAl2bW1jLXN1cHBseSA9IDwmcmVnX2NsZG8xPjsKIAljZC1ncGlvcyA9IDwmcGlvIDUg
NiBHUElPX0FDVElWRV9MT1c+OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
