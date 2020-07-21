Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B426A22798B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 09:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F3D6E4A1;
	Tue, 21 Jul 2020 07:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8D36E4B1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:32:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c80so1787102wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 00:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ucx8Cx6Aued2xkCHjZWrNVH6UHBd3IwmElLgIv7WetE=;
 b=IcNl3oByXiVzSJQWCaVO78Q2BzlwuU2GmUngfg5AB9QHQJyqr66WL2oT31Jerbamyf
 Gy6jt76qT+nglB2hyi3E1L5QIbXhxs+XCBYrZSp6vyzameD7mpTBWqqXqEg5bURM4P7M
 cxBg42e/qbhbILiw/FjnVKeEGL9eO2AMBERp5//cVNIAW8ix8G6DxYu3QnRXoX1cP5pX
 pmGScTLbJTxFg2dv1lziqkQg6lsW0pYy3ED2rYkX2j4OsAayAhbw8VGHtKasrr/S47jq
 Y5yq19nHxsDsSW04QAomHeLpPNaVI0tb3N1LC+Gq49L9Mahycog4DFamLWijhHWbdNOs
 wOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ucx8Cx6Aued2xkCHjZWrNVH6UHBd3IwmElLgIv7WetE=;
 b=opv6vzNOpgbcwMVcQqKS7YvO0whuKr03uS8KD7KIfzmNNAfMg+IMFLIKST/UN6esNW
 RA90VYQBzROxzuyrC7mOImHSctdnf1wNKe8EnGllR1hzDCDX9QhVqCgTyjL07sMUM9m6
 aZlbX5+CNFv1F5P4shBg4k7e+Wz5mYESirKFErwIEa25/M4+2UMDqKj3822NeOVrW23Y
 AcHmZDHDI7RQOL21teiohZ9hAFbAyQYgvHaw6mqkV1bIAGkjG/Oy5buB4PI5VNo4q0E+
 MTo7h9JNc6cVjGiThoO8n+f/T1VOxNHmbUc6nYsm7K3ehhvi9ou2NZc+cZOUWuVL1WCF
 Lvhw==
X-Gm-Message-State: AOAM5314zTfUfaG/SQeWoH8MdHSaRrcHcaUItba7XepMn+RfrVjurJtq
 kwTG7y5etOxWizisD4/UsYK9FH6T
X-Google-Smtp-Source: ABdhPJzIZzqmAQexu1+DVrelTMOAv4O1/d5vttK9Oup3UW3RuEkiyX4WANQ1N1Jg4gs+o64dTCpkRA==
X-Received: by 2002:a1c:720e:: with SMTP id n14mr2963740wmc.144.1595316777330; 
 Tue, 21 Jul 2020 00:32:57 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5eb1:eb29:dadc:7fc5])
 by smtp.gmail.com with ESMTPSA id s4sm29740896wre.53.2020.07.21.00.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 00:32:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/11] drm/ttm: remove TTM_MEMTYPE_FLAG_MAPPABLE
Date: Tue, 21 Jul 2020 09:32:45 +0200
Message-Id: <20200721073245.2484-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721073245.2484-1-christian.koenig@amd.com>
References: <20200721073245.2484-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de
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
