Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 379AF7063E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098AF89C82;
	Mon, 22 Jul 2019 16:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3306689C82
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:57:09 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s3so35913318wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 09:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Msz7GjedPOl7l/JRWcyDMMDlY4+BCAgreaL7kck9D6g=;
 b=YOnnVobXuPfzXPE6zA11FNNFUcZQNFIcoUKWFaoA23ihBXpm1u0ScGimzSIyrGpgc4
 89+2TtCoyJlrfaxfH8GsLreT5xlTIGCQu/r9E962dYLt80td9S8Pn4bKX7EgIu1EcLWP
 z/iL3UNcPpA21RA22FW/C05T/NyWwItnjM+Gyob9RbNjwIfM7D4sxc9CZxoF/NbaHKgb
 d7k6NqjrvyqdFTSPGAyKS0LY78xZdWqzq74n5tIbuaLdZibTuVPnCpNOAlC9G+qVy0+y
 lkpCioxvQyhnAp3pme29lSpZH8+/xvzMhF2D5tLj+vzb3QZWb5bfnl2r+O3cbVx8JiBi
 rXiw==
X-Gm-Message-State: APjAAAWZeWrrGU9p1liA+vwfHrnzK8cYL4Sh10hGVKw84DtnQnUPao23
 Khh5n2yzYtTPhK/3Hx1CL+8tvyEJ
X-Google-Smtp-Source: APXvYqxJgmpn9RJru3NweBp5sFD1uB6rm9Zigs066g1udz9IBYrGzNwON8Auzryi3ZDjevsmLV1+/g==
X-Received: by 2002:a1c:4c1a:: with SMTP id z26mr63439398wmf.2.1563814627537; 
 Mon, 22 Jul 2019 09:57:07 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id g17sm28991587wrm.7.2019.07.22.09.57.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 09:57:06 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: use correct dev node location in comment
Date: Mon, 22 Jul 2019 17:56:48 +0100
Message-Id: <20190722165648.7828-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Msz7GjedPOl7l/JRWcyDMMDlY4+BCAgreaL7kck9D6g=;
 b=SMt2LbRrN2WGYJ+Y+F/S4xpAXpqsoamaAAw7VyZqzJpfQiJDDR9tDbw/qhtucGtrG6
 CaCmUNvSh+njOmp/JaFP1CglJ6co/MR1UaK/Xq9EOrI0AWa9NLV4YrTg/Lhg8ZKOS4aP
 SgsT0/OrNw8Ub7JNM70YnrXMPyzDq8luEHx5JySGxBvrCnoLslj9D7mVocdPnqW5FZsH
 najZjLslXLj0bXTUxjKd8dKcdHo07isgTPQoQTNCtOP6/xQGJoI+GMKvpsV6YkzgXMHL
 zdAccPFAjq1+OzzNvGtcSoru5Y7/d3KhB5HVpPQs2wVusBIgY5i0TjeBEM8oxxtN+dZ5
 6vmw==
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkN1cnJlbnQg
Y29tbWVudCBtZW50aW9ucyAvZGV2L2RybSB3aGljaCBoYXNuJ3QgYmVlbiBhIHRoaW5nIGV2ZW4g
YmVmb3JlCnRoZSBjb2RlIHdhcyBtZXJnZWQgaW50byB0aGUga2VybmVsIDstKQoKU2lnbmVkLW9m
Zi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmls
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKaW5kZXggZWEzNGJjOTkxODU4Li41Mjc0
YjQwZWI1ZTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCkBAIC0yODUsNyArMjg1LDcgQEAgc3RhdGljIGludCBk
cm1fY3B1X3ZhbGlkKHZvaWQpCiB9CiAKIC8qCi0gKiBDYWxsZWQgd2hlbmV2ZXIgYSBwcm9jZXNz
IG9wZW5zIC9kZXYvZHJtLgorICogQ2FsbGVkIHdoZW5ldmVyIGEgcHJvY2VzcyBvcGVucyAvZGV2
L2RyaS9bbnVtYmVyXQogICoKICAqIFxwYXJhbSBmaWxwIGZpbGUgcG9pbnRlci4KICAqIFxwYXJh
bSBtaW5vciBhY3F1aXJlZCBtaW5vci1vYmplY3QuCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
