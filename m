Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E539A2F45C6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5636E04B;
	Wed, 13 Jan 2021 08:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C886E04B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id i63so687669wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxvdNrF1R3ytfMPmOtkgE2Af/C+vkAzGpGIm/SfWWGY=;
 b=aM/IyLaQDgZMmI9S/Vft91mXvPtknL7mM075lNY84v6jesMbWuuSZ6ra4spDo4Abh9
 BG7gD8ulNfeh7oDnJONekJD0JKJ/pA5AAfcWA1b0cYkDeFS++d7JlsRrX4zyipcVql51
 AW2BZrl/DU3T0Q0ymCyFSA59pVimVhosCLnqkg7vj9ws6Z/1teE4JLUCCn8m65iz+JIg
 DE//VEp5ySmb4ydjd9f2W/i0FCymeGPPSI0hx1JXBR/5HEHUwt+suVJkBm6AL8Zi/mxl
 e7AOEOL4RsxRRT4pNkECQqoL4LLJGIXe0hMMu+dppVXUZK2NaEowd40E3HTW7kTGuT3p
 x4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GxvdNrF1R3ytfMPmOtkgE2Af/C+vkAzGpGIm/SfWWGY=;
 b=KnpOgTqbFJxZvq3Ngg5IZvxIV0Yaw19+eKlPa5JGR0ND4oK+NxBcUNmAV8UqXluiG5
 BoDRIdnPYVm5kJ2qPDe4uB3t60DKXndoprTeeA6H2hExNP1JMn51u3A91Yr/njmMoWAp
 3FhkmFFLvwT0KhqHZaYGCT6/COOyFFehgdTwQE9AfZWLeWzF87ScTtWPRN+Ft6QGtC+B
 ZFcyPiB5WNk6oBDCdevG01HRMqWhuivGUYbDy2Pi7lasR/ChAFLk7/EVDe71Cgb1kiNp
 TAIf7JkguiMTOJ7MstsrbMODsLWEcgltD+sQ0XMUZa/NVdQCjH35dFCCTUVA8qKnHn1n
 G4Nw==
X-Gm-Message-State: AOAM532uuvhJx9yr19WyoNHuAWOupHSzJzL7A7T5HLnoNk/2DKOiqJlS
 dfBsf5Em8XXaRKnjvp1QtL5m3w==
X-Google-Smtp-Source: ABdhPJwp+34ijPPH0xN65sVQFc0LBa9PN+kz+Uvj3voNtUl/Kgh1bQoAjfkuiMZ3Bumq5jCehUDCcw==
X-Received: by 2002:a1c:7217:: with SMTP id n23mr907233wmc.167.1610525293758; 
 Wed, 13 Jan 2021 00:08:13 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:13 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/30] drm/amd/display/dc/dce80/Makefile: Ignore
 -Woverride-init warning
Date: Wed, 13 Jan 2021 08:07:36 +0000
Message-Id: <20210113080752.1003793-15-lee.jones@linaro.org>
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlODAvZGNlODBfcmVzb3VyY2UuYzoyOToKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2luY2x1ZGUvYXNpY19yZWcvZGNlL2RjZV84XzBfc2hfbWFzay5oOjk1NDY6NTg6IHdhcm5pbmc6
IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRdCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4Lmg6MjEzOjE2OiBu
b3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQVVYX1NXX0RBVEFfX0FVWF9TV19BVVRPSU5D
UkVNRU5UX0RJU0FCTEVfX1NISUZU4oCZCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9k
aXNwbGF5L2RjL2RjZS9kY2VfYXV4Lmg6MTAyOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhBVVhfU0bigJkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlODAvZGNlODBfcmVzb3VyY2UuYzozMDU6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
IOKAmERDRTEwX0FVWF9NQVNLX1NIX0xJU1TigJkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2luY2x1ZGUvYXNpY19yZWcvZGNlL2RjZV84XzBfc2hfbWFzay5oOjk1NDY6NTg6IG5vdGU6
IChuZWFyIGluaXRpYWxpemF0aW9uIGZvciDigJhhdXhfc2hpZnQuQVVYX1NXX0FVVE9JTkNSRU1F
TlRfRElTQUJMReKAmSkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlL2RjZV9hdXguaDoyMTM6MTY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhBVVhf
U1dfREFUQV9fQVVYX1NXX0FVVE9JTkNSRU1FTlRfRElTQUJMRV9fU0hJRlTigJkKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaDoxMDI6Mjogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEFVWF9TRuKAmQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jOjMwNToyOiBub3Rl
OiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYRENFMTBfQVVYX01BU0tfU0hfTElTVOKAmQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9hc2ljX3JlZy9kY2UvZGNlXzhfMF9z
aF9tYXNrLmg6OTU0NTo1Njogd2FybmluZzogaW5pdGlhbGl6ZWQgZmllbGQgb3ZlcndyaXR0ZW4g
Wy1Xb3ZlcnJpZGUtaW5pdF0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9hdXguaDoyMTM6MTY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhB
VVhfU1dfREFUQV9fQVVYX1NXX0FVVE9JTkNSRU1FTlRfRElTQUJMRV9NQVNL4oCZCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4Lmg6MTAyOjI6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhBVVhfU0bigJkKCk5COiBTbmlwcGVkIGxvdHMg
Zm9yIHRoZSBzYWtlIG9mIGJyZXZpdHkKCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxh
bmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9NYWtlZmlsZSB8IDIgKysKIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlODAvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNlODAvTWFrZWZpbGUKaW5kZXggNjY2ZmNiMmJkYmJhMC4uMGE5ZDFhMzUwZDhiZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL01ha2VmaWxlCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9NYWtlZmlsZQpAQCAtMjMsNiAr
MjMsOCBAQAogIyBNYWtlZmlsZSBmb3IgdGhlICdjb250cm9sbGVyJyBzdWItY29tcG9uZW50IG9m
IERBTC4KICMgSXQgcHJvdmlkZXMgdGhlIGNvbnRyb2wgYW5kIHN0YXR1cyBvZiBIVyBDUlRDIGJs
b2NrLgogCitDRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5vID0g
JChjYWxsIGNjLWRpc2FibGUtd2FybmluZywgb3ZlcnJpZGUtaW5pdCkKKwogRENFODAgPSBkY2U4
MF90aW1pbmdfZ2VuZXJhdG9yLm8gZGNlODBfaHdfc2VxdWVuY2VyLm8gXAogCWRjZTgwX3Jlc291
cmNlLm8KIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
