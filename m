Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5AE27FE54
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 13:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD906E1DE;
	Thu,  1 Oct 2020 11:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F2E6E1DE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 11:28:20 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id lo4so7485453ejb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 04:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mSblCRhZmRMFN5R/2GdB5z9M9WDHrv8PkAcMVpxBjvE=;
 b=Xr1+OPqfqRCCiDXjF9LxojzSA22IfoQ8EamdNvni9fjgUC1aVf1KLQMH47IXuYlvTd
 ZjiKuASifiSS30uZBB7VskQ+IIJadrm5vl61DBXyly7FDldA7LW96jYurhdkNNdYw6eJ
 qxhD3O8t0nAUhXz0cmDLk7Clf43O7JDCV523xxMgQMxR29+FDgEKVt6OhWbC+SodByDW
 SRsNBVysPgEuUrtVz5r2quj0oRr5cZyhdexrsHoEd9QlTyKsgfgpRMQdpcpp9q9Ea3Be
 6RLrXpn+3763nGANKs6INKLD1fFqUikc3XAMM0uPMKHnHYjmP8gc/RTg9aAXiSBQBYK+
 P8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mSblCRhZmRMFN5R/2GdB5z9M9WDHrv8PkAcMVpxBjvE=;
 b=YEoP344Gu8dVNIkLa2Fw2L3eNCUOsa6ihM5vN7b3mbvxJnnjf1Ki9/lOQo+GDuZjLY
 B8PcWSnFYL2r9qxFAGkj6nn49/CC7dsHHCJACuP66YiPgQWybbmsAEKcZf14XyHyy3q6
 oi354gIjSJzNCnzilW9HsvwPF1vR/jjW9mDjoReOVn2P3jFfOFZREQ2pAm9AxK/UR3hJ
 dlKsefrzfJ9m1I90osFzxRwkWLGW7DHVJEDO59pDer/B7rZz12xiqmaeCq14Fjnh4MP4
 nV8kvDs0qlamyA21rjVBGdJ3EqEdVzeBWcQCmoAtrRwnb2m7yeCer8wJIarASeQg+Wzj
 lp/g==
X-Gm-Message-State: AOAM530m/E/lGp/V0Q5r5l4H1pFCNAVBcqeZc75g0KwuwpoT6EX/kH2M
 ao3bwACoDUzSKlH10nRjAqHHr7dXLx0=
X-Google-Smtp-Source: ABdhPJzDT9h1LK/KjMRVY2swUfgW7CYKqt53cs4o9uXcxNKi9pvTxkBi7cRXOATmYo6ihRoh5IxhDg==
X-Received: by 2002:a17:906:874f:: with SMTP id
 hj15mr7968220ejb.539.1601551698561; 
 Thu, 01 Oct 2020 04:28:18 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:36be:5a08:8c1d:6b2b])
 by smtp.gmail.com with ESMTPSA id p3sm3834892edp.28.2020.10.01.04.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 04:28:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 1/8] drm/ttm: remove TTM_PAGE_FLAG_WRITE
Date: Thu,  1 Oct 2020 13:28:10 +0200
Message-Id: <20201001112817.20967-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

Tm90IHVzZWQgYW55IG1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vdHRtL3R0bV90dC5oIHwgMSAt
CiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L3R0bS90dG1fdHQuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fdHQuaAppbmRleCA5MTY5MTI0MGE1
MDkuLjVkMTgzNWQ0NDA4NCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV90dC5oCisr
KyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fdHQuaApAQCAtMzQsNyArMzQsNiBAQCBzdHJ1Y3QgdHRt
X3Jlc291cmNlOwogc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0Owogc3RydWN0IHR0bV9vcGVyYXRp
b25fY3R4OwogCi0jZGVmaW5lIFRUTV9QQUdFX0ZMQUdfV1JJVEUgICAgICAgICAgICgxIDw8IDMp
CiAjZGVmaW5lIFRUTV9QQUdFX0ZMQUdfU1dBUFBFRCAgICAgICAgICgxIDw8IDQpCiAjZGVmaW5l
IFRUTV9QQUdFX0ZMQUdfWkVST19BTExPQyAgICAgICgxIDw8IDYpCiAjZGVmaW5lIFRUTV9QQUdF
X0ZMQUdfRE1BMzIgICAgICAgICAgICgxIDw8IDcpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
