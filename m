Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70663622A1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925DD6EC26;
	Fri, 16 Apr 2021 14:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202046EC17
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:03 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z1so32560369edb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7F+9DKjv4pSxsjZ8Q4NSxZmBv+NpIxPJbgx2acVLUU=;
 b=xUDIIJR/cLuzx29sMHGLZuOY6AlLTmEc1nYFSxBrGbSXcio6hSFL/Qj5My76RSIH9v
 2TVRPRZTGDZUYukol3Rrr41enxdOCl2w6ae1LlUjfQIp52cn4Hk2ugldcUdfREVUpYyz
 kZ6hBID8yhhVWiYsfLKSwy6p+Exx+V2kxGKoycf7iPUKdzeESN2WkGwvJXSEBud644PT
 I1eg02i76GgWn9puwVkudV9PSwN4mqxmZSc2KqQQyAigrLRsCAImTh+iComP6NC+Xxhc
 HL9krOFybdi4KocyKW5QMBdfBRmX3gL/dmsrCmFfgH13kdZ2wxyGx18f2ddaKZn4iXVK
 ppfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7F+9DKjv4pSxsjZ8Q4NSxZmBv+NpIxPJbgx2acVLUU=;
 b=mohIiP4gQukzkOJsoJLWlm0Hjczg/PcglpB7I5NGOLKf08q+JdjQ6tZF/cg36ntSNr
 OTDhYVj6+ISa6s+oEKnerQ8zBJRGUEABLDDyIHhyTYnP0N1yNmxfbWpZilFLdDjm1S/+
 mxXon2lBIy9cNvhvmEeigritidwTx9sVRQZNaCjWD5DlzgP4hpAU2T1XMh117qGiCRnv
 FmK3K8sC3TSkb2hnNEshwkOjK8Wkhc96HKkU1ckxWvgslO7EiiBmVCZYzgbU7ekXvKxz
 6U6j9QDzanfjDji+Hij39M2KlRqB0ZFaCONk8ixJWIv0wL9UVnydPaP0qofsYR/LYtTs
 j4Qw==
X-Gm-Message-State: AOAM533p4moqz10rlPaLh4SKQ+P/SQlDs8Z7VObr5UPGIjEqEQhD9IDD
 M/tiwJ2fu9tGMZHfF5ruq/FS6A==
X-Google-Smtp-Source: ABdhPJwNxKANqCbAqE4qRNcZ6coZt9d+It6wnNQh5h1d63Ti//CSPf5MsoYyaoVv1NgeAQygdGWyLA==
X-Received: by 2002:a05:6402:3550:: with SMTP id
 f16mr10261727edd.134.1618583881703; 
 Fri, 16 Apr 2021 07:38:01 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:01 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/40] drm/vgem/vgem_drv: Demote kernel-doc abuse
Date: Fri, 16 Apr 2021 15:37:15 +0100
Message-Id: <20210416143725.2769053-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
Cc: Ben Widawsky <ben@bwidawsk.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYzoyOTogd2FybmluZzogVGhpcyBjb21tZW50IHN0YXJ0
cyB3aXRoICcvKionLCBidXQgaXNuJ3QgYSBrZXJuZWwtZG9jIGNvbW1lbnQuIFJlZmVyIERvY3Vt
ZW50YXRpb24vZG9jLWd1aWRlL2tlcm5lbC1kb2MucnN0CgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogU3Vt
aXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6ICJDaHJpc3RpYW4gS8O2bmln
IiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogQWRhbSBKYWNrc29uIDxhamF4QHJlZGhh
dC5jb20+CkNjOiBCZW4gV2lkYXdza3kgPGJlbkBid2lkYXdzay5uZXQ+CkNjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6
IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL3ZnZW0vdmdlbV9kcnYuYwppbmRleCBhMGU3NWYxZDVkMDE2Li5iZjM4YTdlMzE5ZDE0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMKQEAgLTI1LDcgKzI1LDcgQEAKICAqCUJlbiBXaWRh
d3NreSA8YmVuQGJ3aWRhd3NrLm5ldD4KICAqLwogCi0vKioKKy8qCiAgKiBUaGlzIGlzIHZnZW0s
IGEgKG5vbi1oYXJkd2FyZS1iYWNrZWQpIEdFTSBzZXJ2aWNlLiAgVGhpcyBpcyB1c2VkIGJ5IE1l
c2EncwogICogc29mdHdhcmUgcmVuZGVyZXIgYW5kIHRoZSBYIHNlcnZlciBmb3IgZWZmaWNpZW50
IGJ1ZmZlciBzaGFyaW5nLgogICovCi0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
