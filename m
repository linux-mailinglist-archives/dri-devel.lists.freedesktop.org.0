Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22981D96
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 15:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD356E44C;
	Mon,  5 Aug 2019 13:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CCB6E44C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:43:29 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s3so74783685wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGMV7QhC8DNNZSd4DygDFTwAShSfi/80pVWOD2ZlzJ4=;
 b=b9Nv8fQwbvsuRH1FI3dJEC7x3Fez6ki4nPAIqNYqbFYZxFtv+VZbed5yvJT6iMA2i6
 9KeAgQtWC5evDZQAgj5DR9Bb2pk/2CWCc2BSOopa3PBe/W0fn6NyGwGu1Fnmvu7E6oBs
 Emr/1OvJoclgkijNQE/aD88EmbiV2iRIngwBaeg++t9Ai16Yh1pxF+djYQRXyP+aPp2t
 ZVzGWIL6GpuQyUh2NH54QBszNZYJklzsgThB1gblt916QRw+dYyxCK5YWodpISFd8TdG
 cs9kKrOtSw9EQPjrUb1yvkNoNfGTIMOmSKuP1C41EvLnI4OG0OnS+g7MeMdEBg/YDgHx
 srQg==
X-Gm-Message-State: APjAAAWCXnzeCQhcb1hotkwMrtknQZeB9sfdFspQOQTSuO9OXKFPNQ/S
 PcucSy52Wq/KnyHatN8o8uGt5w==
X-Google-Smtp-Source: APXvYqwwWryXK9vXOEQg9N4QQcQMr9Yj0vLdZlzKaPKS8EdfFo7G7Jmuqo5lcERdhsA70RGznVFIiw==
X-Received: by 2002:a1c:cfc7:: with SMTP id f190mr17881896wmg.85.1565012608012; 
 Mon, 05 Aug 2019 06:43:28 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t3sm67835842wmi.6.2019.08.05.06.43.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:43:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH 3/3] MAINTAINERS: Update with Amlogic DRM bindings converted
 as YAML
Date: Mon,  5 Aug 2019 15:43:19 +0200
Message-Id: <20190805134319.737-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805134319.737-1-narmstrong@baylibre.com>
References: <20190805134319.737-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGMV7QhC8DNNZSd4DygDFTwAShSfi/80pVWOD2ZlzJ4=;
 b=KQy8WXqzt+GT9Ms3PweAVyKX7a6Hz4OupUPGYZHWgTfDcqep0bpg+Ae519mvu3I1hg
 e7D3VkMTXiDn6NYIBOHYnO98ca4Un2PjNk4qlQGrPJmMjCssBy4fnjw1zMBLLVi4o03t
 UoSPskgV31NkcygwDhsvZJLmfTwD1XQOCdxLp6plgpCUgL3Bgqh68dfiHOCZ8/6dBoN+
 kvHN3X/WTRCXQX552Cg9EIV5FM80awl2WLwGgAnRA+3tTtMRBYQ+GSuZknWw76zvdVFo
 4L4qGFV/M2HNbRXP+0ZYaAWfuLPYsR8W/ACFQaq6f8r3IqsnmGp58pjlpV28OaAKLLCz
 XrgQ==
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
