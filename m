Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C50F52222DE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 14:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5560C6EC53;
	Thu, 16 Jul 2020 12:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1076E2EC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:50:48 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id f18so6984443wrs.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ucx8Cx6Aued2xkCHjZWrNVH6UHBd3IwmElLgIv7WetE=;
 b=YZHTAEMACMSpQf1f1UITaGNCfVwnSuAOtJO3O9JS7LBk3axjcAiMGJerSAqFK0aoh/
 rvJPYYLtEdGZNGj2Xfc5bpIOWRHbmmMNuXbKd5uZ4hGYF9+vEwLtSoRt/q2KwLamKtMO
 5PITbD6ftRIqGSuebeow42qeVmIpXOMyFiX5W+YVIdhMd+64U4HYuGYxaYJUl6K1hzFz
 0Rc9ilyCGljkgrAWmlH0OdknjnA/Uob2VBompZzyYFpLtFLRiczQtxJmfEZARCgz24zP
 bJI22iLz1r9X/zPNHTLphE2f08/2zzkaTfKrnYB80TsXH9FgVOMio2Q9OVN3oZplgaMS
 Q4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ucx8Cx6Aued2xkCHjZWrNVH6UHBd3IwmElLgIv7WetE=;
 b=E8rSFT49l9L3XXYC/U2AGZMe5uMy8koQ1TlR4ehrBprJndb77pt3NaaDC63sdAiAlB
 ZByayghUaQV4kDMq5mB28XjZ9lWwvaTvxTfS0D+pY2Mtb8mB3PejJN+3hlePIe+JqKwe
 SB4VzSyT5q6Ul99N5zSTI3HZufrpxuldkkaBLipG8BK1jH5h9nWmqFiT7++uFwjFtt8d
 VyG9RNDJAXBvhoiM4ty/h7ZxIBAcbB6PyWWi7FqE0Xuw2XuKFDJtMHziu2xpxFW/dGyP
 XRO0iabngucvVUZqyXsff2s8kztKcn1ZX7E400b4Q2lx35QSe0A6CsPwVrrFn+EhQA1r
 pLVA==
X-Gm-Message-State: AOAM532dIOF3lqaBJ56oFhnL8i21THUWh0YjRnTJV6Jov4OKUHx+RXb7
 1QHyu6VzsKFhBZvDx/M0918GplSB
X-Google-Smtp-Source: ABdhPJwdD5q5XAyPQAs6O8ADEqNb4AQgBesc1i8tfK0h2OIP6s7bs7AL0Mo3kI/t0DoedNvgVtha8w==
X-Received: by 2002:adf:f60a:: with SMTP id t10mr5235106wrp.64.1594903845983; 
 Thu, 16 Jul 2020 05:50:45 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:efc1:eb01:18eb:bff2])
 by smtp.gmail.com with ESMTPSA id z25sm7669872wmk.28.2020.07.16.05.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 05:50:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/ttm: remove TTM_MEMTYPE_FLAG_MAPPABLE
Date: Thu, 16 Jul 2020 14:50:37 +0200
Message-Id: <20200716125037.67437-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716125037.67437-1-christian.koenig@amd.com>
References: <20200716125037.67437-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IHVzZWQgYW55IG1vcmUuIEFuZCBpdCBpcyBiYWQgZGVzaWduIHRvIHVzZSBhIFRUTSBmbGFn
CnRvIGRvIGEgY2hlY2sgaW5zaWRlIGEgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGluY2x1ZGUvZHJtL3R0bS90
dG1fYm9fZHJpdmVyLmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBiL2luY2x1ZGUvZHJtL3R0
bS90dG1fYm9fZHJpdmVyLmgKaW5kZXggNzFiMTk1ZTc4YzdjLi45YjI1MTg1M2FmZTIgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKKysrIGIvaW5jbHVkZS9kcm0v
dHRtL3R0bV9ib19kcml2ZXIuaApAQCAtNDYsNyArNDYsNiBAQAogI2RlZmluZSBUVE1fTUFYX0JP
X1BSSU9SSVRZCTRVCiAKICNkZWZpbmUgVFRNX01FTVRZUEVfRkxBR19GSVhFRCAgICAgICAgICgx
IDw8IDApCS8qIEZpeGVkIChvbi1jYXJkKSBQQ0kgbWVtb3J5ICovCi0jZGVmaW5lIFRUTV9NRU1U
WVBFX0ZMQUdfTUFQUEFCTEUgICAgICAoMSA8PCAxKQkvKiBNZW1vcnkgbWFwcGFibGUgKi8KIAog
c3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
