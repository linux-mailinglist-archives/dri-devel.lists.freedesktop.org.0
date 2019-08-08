Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A91D85D7C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 10:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A546E4B0;
	Thu,  8 Aug 2019 08:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B776E4B0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 08:55:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t16so3959402wra.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 01:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGMV7QhC8DNNZSd4DygDFTwAShSfi/80pVWOD2ZlzJ4=;
 b=codYeDYEh8Q1ZNJEUEh/yXYbgE0Sfk/7fy3LazXRl4Tue7VEKna0B57vuQP1gkcTzD
 3UprdCnE670E0Y/71gEHY2O36alLclAqoEFqnd31efk/aWshVA4gRcYXxFToxjFL6HQx
 2xtB1elZAkns9D8n6waBY9q01uWqMGraoKgE/PofINwUuXm7NYpoYQIjNAGeL2EVgk0A
 KAb16kgYenGz30RliopPB9klddZd+pmk5wTE4DBU4kHXQWTCFZvkMOXAjUsP6PmgQJZI
 XuYouxHGiyNh5uEftOm98mJO/Ojf/q8Epts5IJnXwoIgPHQ6v4CTdhr9TufbmLKHT2rP
 vvqA==
X-Gm-Message-State: APjAAAXBlCFfEK+3Sqb1QmCkHEOAuGq6LmLj8EeLJUHy6ypUucb2C5g0
 ozMgRe+Ea8Hct6Ra4vzGWd8xPQ==
X-Google-Smtp-Source: APXvYqx4HZQxEVZ8L3lNTFhLUVF9yFAHzskRwJoSI/HZlrCcCvMyPu5yrg2yl0ii5Hl6FetDC3yEvQ==
X-Received: by 2002:adf:a348:: with SMTP id d8mr3321352wrb.235.1565254526837; 
 Thu, 08 Aug 2019 01:55:26 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i66sm3380649wmi.11.2019.08.08.01.55.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 01:55:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH v3 3/3] MAINTAINERS: Update with Amlogic DRM bindings
 converted as YAML
Date: Thu,  8 Aug 2019 10:55:22 +0200
Message-Id: <20190808085522.21950-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808085522.21950-1-narmstrong@baylibre.com>
References: <20190808085522.21950-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGMV7QhC8DNNZSd4DygDFTwAShSfi/80pVWOD2ZlzJ4=;
 b=PeVELfYvvyjsx6clfPeEV6Kyb4FSgsdGONpfUp+mhUWbRbE6lOwzvPOuOzghkx6UY7
 sV7OyXvLbqZR62Qbpmmw4l35xC2kfWcUBQ9+I1cBzj0J6TbruWWxPqzkzawHAzd3dNDq
 LSGhY2wEMrRjIPBV4X3wMMXLBpcdLvif5+dTdz4KVRvyQ7ytn1UF/bgn3kkRGHH7e4T5
 YsHJvm4sGZLQmwtl3c6ZDriwhEv982T5LMZGUnye2w1eT2zjbfINQ/MNb8q8VQ9+jPuP
 epUB01MA29ckMpujdwib4vSG15vWT/tXHrpAh9yXYq7MethOMhpCYaazti6CrRejYT1v
 F2UA==
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGFtbG9naWMsbWVzb24tZHctaGRtaS50eHQgYW5kIGFtbG9naWMsbWVzb24tdnB1LnR4dCBo
YXMgYmVlbgpjb252ZXJ0ZWQgdG8gWUFNTCBzY2hlbWFzLCB1cGRhdGUgTUFJTlRBSU5FUlMgdG8g
bWF0Y2ggdGhlbSBhZ2Fpbi4KClNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ry
b25nQGJheWxpYnJlLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJ
TkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDY0MjZkYjUxOThmMC4uYzU1YzE4NTMxY2QxIDEwMDY0
NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtNTMxOCw4ICs1MzE4LDgg
QEAgTDoJbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCiBXOglodHRwOi8vbGludXgt
bWVzb24uY29tLwogUzoJU3VwcG9ydGVkCiBGOglkcml2ZXJzL2dwdS9kcm0vbWVzb24vCi1GOglE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLXZw
dS50eHQKLUY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9n
aWMsbWVzb24tZHctaGRtaS50eHQKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2FtbG9naWMsbWVzb24tdnB1LnlhbWwKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sCiBGOglEb2N1
bWVudGF0aW9uL2dwdS9tZXNvbi5yc3QKIFQ6CWdpdCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9w
Lm9yZy9kcm0vZHJtLW1pc2MKIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
