Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CC95D33A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5864789C5E;
	Tue,  2 Jul 2019 15:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650E389C5E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 15:44:35 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id p144so14435503qke.11
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 08:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0SNIqZ1eXNTXTiBWnYdzokV/6s0LphXPV28wgFgO7+Y=;
 b=CYmhqi0jpdJsqhK+OEfPBQiIDC1K0Lzx1VA5uMeIgJ8SK47eLDLQbCSDM4O8pOepON
 DBPObSuRFLqO3ASGtmiEStIMrZmYV55h/Dtd+6H2L8h+4wTnRT/YX5a6zPuJZH34QmIw
 kt1cas/ey68XeRtWmgdA08cd8rp6HbYPskEzsChtXC9/zcLY9J8Ng609q9LrtbRwJqR+
 azIbotXSzFly0ApOT+K2R5QiNp9hNRNfe38rP2gXPRfhTFe+sDeXkXOq3pq//SF55A8Z
 AC1okQVvDCmVB6apHQ7juMjsLSE/jwR9nlbaqR/g1DYTRBwGNwAVAz2v5l/liH/sLHky
 HPnw==
X-Gm-Message-State: APjAAAUltHr0ZmVXV9t73tgTE75c5QyhOrd0VFPOYJrvOtu9HyS2v5ZL
 xsWqzdwtVJrGHz6Ij+VQmgQCu5fWB2U=
X-Google-Smtp-Source: APXvYqy/DQiaFs1LsX0WgEbqxRdbnX6EGJXOOnXyMa0gYPhm28oRBjSKtRB4pJgIl/8V5uuGMGyMYg==
X-Received: by 2002:a37:8741:: with SMTP id j62mr23578387qkd.78.1562082274356; 
 Tue, 02 Jul 2019 08:44:34 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id c192sm6389184qkg.33.2019.07.02.08.44.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 08:44:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/bridge: ti-sn65dsi86: add link to datasheet
Date: Tue,  2 Jul 2019 08:44:16 -0700
Message-Id: <20190702154419.20812-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702154419.20812-1-robdclark@gmail.com>
References: <20190702154419.20812-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0SNIqZ1eXNTXTiBWnYdzokV/6s0LphXPV28wgFgO7+Y=;
 b=A/SfDAFXG8B33NLAuR2aHJKfJq4Yy7L2nviUpcX6L2uRGij6Mq2/MxO7ekS9lkxJ1X
 e1S7zhlW85oULhG1Dfxve8SFAOlLmOGKCkEfOJ9efMIUlS7JC5S1XOhhToUtbZugfnfP
 q+vSwNgnRZTFRjkg+B3LXhmTWckczqo0qf7A1iiV33mCAnUWdonnm/dQc4trsf9lzEyS
 M4KmtaNo6J9m3X2NP++/fVQX4pIwZ/9msZdflOc9RmJoHoksAXDDxYx8B+cBYMXwMkXf
 Pi1RF8ffg6LSphQ6nPrFZoFMGq4a9bPJ+5h+iYhVMCA5cQwi2A67s8YGsQwRH1PuDmmr
 LXtA==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhlIGJyaWRnZSBoYXMg
cHJldHR5IGdvb2QgZG9jcywgbGV0cyBhZGQgYSBsaW5rIHRvIG1ha2UgdGhlbSBlYXNpZXIgdG8K
ZmluZC4KClNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RpLXNuNjVkc2k4Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYu
YwppbmRleCBiY2NhOTE3M2M3MmEuLmYxYTI0OTNiODZkOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RpLXNuNjVkc2k4Ni5jCkBAIC0xLDYgKzEsNyBAQAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAKIC8qCiAgKiBDb3B5cmlnaHQgKGMpIDIwMTgsIFRoZSBMaW51eCBGb3VuZGF0
aW9uLiBBbGwgcmlnaHRzIHJlc2VydmVkLgorICogZGF0YXNoZWV0OiBodHRwOi8vd3d3LnRpLmNv
bS9saXQvZHMvc3ltbGluay9zbjY1ZHNpODYucGRmCiAgKi8KIAogI2luY2x1ZGUgPGxpbnV4L2Ns
ay5oPgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
