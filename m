Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 576522F45C8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E966E071;
	Wed, 13 Jan 2021 08:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E2E89F8E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w5so1043024wrm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mCRcVC8RkZNOsTZmH5MrfFMxeQad14MXuEtj32uCB2s=;
 b=SpmtloZ/cSZhuSXJ9UQ5EJpwFNOKanG/Bh7X1ETpsmkC49Bq+w103SFSlgUo4pLIMH
 2zKhjWxoUnAtjIDu+O6SHLaEgUkdKy4qCZEP7+tBNDWSP9CUt+1Z8x2nm0wSiq8uyq2M
 Ma/YOj18A45z0ky396eCJnoyUf0zmIrZyeR1V4/RYkslXirRP378ubPBXG5RuEKedpSe
 cFbrG8IQ3GYECv1TK7vuuUf8Jl9WAJCn7m9EbmGKl7ng+wYlDrsDlZkUx4y3zv9RdyA9
 B4wot+hsMGmQQqtj9AgLGGvNVnO0BtwuAwu1ZvRizlL9o/HbLAFaiG7V+mY6GCF+NRQj
 YU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mCRcVC8RkZNOsTZmH5MrfFMxeQad14MXuEtj32uCB2s=;
 b=D7uha2yB45lOl5Xg+aPusvxSD5aoOYPwQVI3WOOJWumo/Nxn3UiPsUqeJ+rR6W8oOz
 4H2M0x9WtN8GQm48GWO6LV25iUkVrgMq9fwdnDVcM/umF+trJWQhzmrStecUb1otsPDi
 c3YW+upn2Fts9kqIhLkuTJoBL43m2gu8bUQooWpipVIU0igW4rkQrOmTBJUfsnhy+hG1
 h/51bcejl0jcdbmIqNLPS5Qyl/xdYSDIel8pcsSoPvc5hJhE3gXLA0xwr5fCB9JaoafL
 SDb9ZzwxGTwkANaLZTlbKSkH41iBMUWMkU0ecSdJRxXL6E9a9Ybjh9pp4ntApIamG+eS
 CRvQ==
X-Gm-Message-State: AOAM532g7KsUpxsCCb5cbciFk3TrxqcApfPdZuzSvlGubRsXy6YEsUKG
 KUzKsjq+bYEseuGZkXB0S6aWdw==
X-Google-Smtp-Source: ABdhPJzn69sZitxlxCughkD08VyFfr7F+gsx//bI3xmhw/alZxDQ3q/KiVOwA0KLVvEE1NsA8yaYew==
X-Received: by 2002:a5d:558a:: with SMTP id i10mr1191325wrv.363.1610525286253; 
 Wed, 13 Jan 2021 00:08:06 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/30] drm/amd/display/dc/core/dc_link_dp: Staticify local
 function 'linkRateInKHzToLinkRateMultiplier'
Date: Wed, 13 Jan 2021 08:07:30 +0000
Message-Id: <20210113080752.1003793-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYzozNzEw
OjE5OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGxpbmtSYXRlSW5LSHpU
b0xpbmtSYXRlTXVsdGlwbGllcuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jOiBJbiBmdW5j
dGlvbiDigJhkcGNkX3NldF9zb3VyY2Vfc3BlY2lmaWNfZGF0YeKAmToKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmM6NDQwMzoxODogd2Fy
bmluZzogdmFyaWFibGUg4oCYcmVzdWx0X3dyaXRlX21pbl9oYmxhbmvigJkgc2V0IGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFy
cnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYwppbmRleCAyZmMx
MjIzOWIyMmNiLi4zYzMzYjhmZTIxOGU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCkBAIC0zNzA3LDcgKzM3MDcsNyBAQCBib29sIGRl
dGVjdF9kcF9zaW5rX2NhcHMoc3RydWN0IGRjX2xpbmsgKmxpbmspCiAJLyogVE9ETyBzYXZlIHNp
bmsgY2FwcyBpbiBsaW5rLT5zaW5rICovCiB9CiAKLWVudW0gZGNfbGlua19yYXRlIGxpbmtSYXRl
SW5LSHpUb0xpbmtSYXRlTXVsdGlwbGllcih1aW50MzJfdCBsaW5rX3JhdGVfaW5fa2h6KQorc3Rh
dGljIGVudW0gZGNfbGlua19yYXRlIGxpbmtSYXRlSW5LSHpUb0xpbmtSYXRlTXVsdGlwbGllcih1
aW50MzJfdCBsaW5rX3JhdGVfaW5fa2h6KQogewogCWVudW0gZGNfbGlua19yYXRlIGxpbmtfcmF0
ZTsKIAkvLyBMaW5rUmF0ZSBpcyBub3JtYWxseSBzdG9yZWQgYXMgYSBtdWx0aXBsaWVyIG9mIDAu
MjcgR2JwcyBwZXIgbGFuZS4gRG8gdGhlIHRyYW5zbGF0aW9uLgotLSAKMi4yNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
