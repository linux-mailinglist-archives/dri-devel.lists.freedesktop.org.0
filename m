Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C342A9E504
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 11:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3568966B;
	Tue, 27 Aug 2019 09:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE5989664
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:58:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p74so2390809wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 02:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KtIIzwTDR1B8HezjMZLd0UUrjubJe6Pa7zbd04NstpY=;
 b=QINBKJtNEdlFj5+DSVGCWIzcwrGVFI+qsBBFtI4n7SeE/Z9KHwXqHKNdXciik9O5iT
 E9mA6UY88nKzSvUWnELnzKH+DjIOYBH7I1TLpit7cNYZMSO+3K1ft4y4lo/ozvuLdKk5
 fytTANVhYyyrTTSfdgLIx5H+thS/ZtDOOphdh6ygu60pSWf41Ahp7oNchBaTt1dY7vCn
 ac8eYJnE+dtPFhYHA7zQIFAOPITn1M1/qUucRbwdyg+yPeghPvLS/YBLbmOViKm2OySw
 1tee3GgY7yU7dwdi2Jpv0iuaTGF6mEXzjgGwBSfKMbZEGiJz1VcH26NzoLG2aj9tQKtG
 9YFA==
X-Gm-Message-State: APjAAAXYIkwt4LqiShzoW7KokZ495xXgPtF7qasnnATrB/Qyw0QALmM5
 ZHnJy7HFnGWgnGg4y8o7BRPx4hxHEmYl9g==
X-Google-Smtp-Source: APXvYqxtnYf1tAwNYwh4f/eAjThvqPmtKVp37xwzQWjJOeB8wQJpDTM2QVLcJ49DhGpTADsj+rGFpA==
X-Received: by 2002:a1c:4383:: with SMTP id q125mr9198967wma.16.1566899907058; 
 Tue, 27 Aug 2019 02:58:27 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m6sm10862084wrq.95.2019.08.27.02.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 02:58:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/meson: add resume/suspend hooks
Date: Tue, 27 Aug 2019 11:58:23 +0200
Message-Id: <20190827095825.21015-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KtIIzwTDR1B8HezjMZLd0UUrjubJe6Pa7zbd04NstpY=;
 b=zAQ2uvSvJSVmWXzSLfN3dfzl/n5RCwFZYCTgk+n/eg1RDaVnKT69s8WDBwU+9jvvNr
 Zcosf/Sm886GfP1In/JAYTq0mTJA5pJq8/H6r8T0TGhOtRm6eaXGSobKTpUikVR6xOzo
 wecGUL4VzblD5iC96+CMpyhOrd2mh3EkQoIpR1P8ZD45ncg76XgjkinMPqym/E6+JmkR
 bqvvNZ/jlk/eMuacEWTOZuUW4ko4sTaXRtCyv82qgtMfVKWNz5FSYSgsaHlg1H01d2wo
 tUN476WU+HcumjeDsmXOuCodvBUolzMK1RnBxrYs3EyEVAp8H9nndkFhicDEZ9WYRtLC
 0nxg==
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
Cc: khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZSBhZGRzIHRoZSByZXN1bWUvc3VzcGVuZCBob29rcyBpbiB0aGUgQW1sb2dpYyBN
ZXNvbiBWUFUgbWFpbiBkcml2ZXIKYW5kIHRoZSBEVy1IRE1JIEdsdWUgZHJpdmVyIHRvIGNvcnJl
Y3RseSBzYXZlIHN0YXRlIGFuZCBkaXNhYmxlIEhXIGJlZm9yZQpzdXNwZW5kLCBhbmQgc3VjY2Vz
ZnVsbHkgcmUtaW5pdCB0aGUgSFcgdG8gcmVjb3ZlciBmdW5jdGlvbm5hbCBkaXNwbGF5CmFmdGVy
IHJlc3VtZS4KClRoaXMgc2VyaWUgaGFzIGJlZW4gdGVzdGVkIG9uIEFtbG9naWMgRzEyQSBiYXNl
ZCBTRUk1MTAgYm9hcmQsIHVzaW5nCnRoZSBuZXdseSBhY2NlcHRlZCBWUlRDIGRyaXZlciBhbmQg
dGhlIHJ0Y3dha2UgdXRpbGl0eS4KCk5laWwgQXJtc3Ryb25nICgyKToKICBkcm0vbWVzb246IGR3
X2hkbWk6IGFkZCByZXN1bWUvc3VzcGVuZCBob29rcwogIGRybS9tZXNvbjogYWRkIHJlc3VtZS9z
dXNwZW5kIGhvb2tzCgogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jICAgICB8ICAz
MiArKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyB8IDExMCAr
KysrKysrKysrKysrKysrKystLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMDggaW5zZXJ0aW9u
cygrKSwgMzQgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
