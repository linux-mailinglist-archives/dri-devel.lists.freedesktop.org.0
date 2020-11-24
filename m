Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017882C30FC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECC16E59B;
	Tue, 24 Nov 2020 19:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D138E6E529
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t4so10608679wrr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CKoWa37FzxxsWJDJ0MjgjJtMQHB06cJSx0w1D6sy2RI=;
 b=tdG+cicDEAw8D+/7A8LyoPxQlBhMODERMVzTZCPgy/dm9V6881vT914p6mw6lXskD5
 3ArdWa/noQjV+k4cQYkDPPD8/3gajo2kj0e2GNNtWDOVy2I7bG89rNmzHSU4ZtgoWU+q
 LnWmy27kyREHd/yLaic4WQeUwzBE7q9DRiMrsWgsdjDJDRtYj+Y7N2EbpALNPel9cQly
 2sv6/r2wFhrQMTcol2pmHaDSXwN848CyPzUC2OgzAmqXdXNJdGwCyP1Z6G4HNYheL54h
 a/lyERd/d3ymrIjCN7uGkTGg9s8qVnG//aYFyvz/eGIA9oug2tTU1S5AUQJJd4uvMqs7
 rJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CKoWa37FzxxsWJDJ0MjgjJtMQHB06cJSx0w1D6sy2RI=;
 b=YmZKd3k6HuDCYc9Aocmt5ARk5/4ZPnmpEl9TLCXOiCBN9fZJMbtfv1nfpQGUui9mXx
 VYAfec0fc8ooa1B/uWkZC9gjTD7TaFO+9PzTfU9iDg4JQbjx8kXXTHBpNgat59ayErQB
 aeiAV5AZlIBh05pa6u9sxLHcxLtLYs9uj61uG2gdKCNmFcayjVYLMqkQa5aq+AGhlFeg
 FFlqXdIJw+D7aJjVun2xPjY6PfgwMnyC005xq8ZtD3LmfvY3FEECOH/TmhfEzNJeQ9LN
 0vT/WC8mgcY7+8eLjk8uECAdGIt6H5JLd67kk7nl6dfTP5sTwJWsBBLdKADqWbbPh/FB
 /gyg==
X-Gm-Message-State: AOAM531OmmkTFOjHAoCuvbr9+mvp5dYo8AZcTJUCbNLeRshg9i/tmtmn
 4BPArE4cZ78ZyiD+Nb1f9IFjgg==
X-Google-Smtp-Source: ABdhPJxEBa3RxG2cITK6ou296ZYyJhuQV6fQvAnP/c0MakF1oMc4IzcvdIwOvtz/0wRETKp74r+fPQ==
X-Received: by 2002:a5d:5222:: with SMTP id i2mr62965wra.247.1606247081538;
 Tue, 24 Nov 2020 11:44:41 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 34/40] drm/amd/amdgpu/amdgpu_acp: Fix doc-rot issues
 pertaining to a couple of 'handle' params
Date: Tue, 24 Nov 2020 19:38:18 +0000
Message-Id: <20201124193824.1118741-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcC5jOjE4Mzogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAnaGFuZGxlJyBub3QgZGVzY3JpYmVkIGluICdhY3BfaHdfaW5p
dCcKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYzoxODM6IHdhcm5pbmc6
IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2FkZXYnIGRlc2NyaXB0aW9uIGluICdhY3BfaHdf
aW5pdCcKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYzo0MTI6IHdhcm5p
bmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2hhbmRsZScgbm90IGRlc2NyaWJlZCBp
biAnYWNwX2h3X2ZpbmknCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmM6
NDEyOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdhZGV2JyBkZXNjcmlwdGlv
biBpbiAnYWNwX2h3X2ZpbmknCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9hY3AuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YWNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMKaW5kZXggMTQw
MDk1NzAzNGExMi4uYjg2NTVmZjczYTY1OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FjcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hY3AuYwpAQCAtMTc2LDcgKzE3Niw3IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlICpnZXRf
bWZkX2NlbGxfZGV2KGNvbnN0IGNoYXIgKmRldmljZV9uYW1lLCBpbnQgcikKIC8qKgogICogYWNw
X2h3X2luaXQgLSBzdGFydCBhbmQgdGVzdCBBQ1AgYmxvY2sKICAqCi0gKiBAYWRldjogYW1kZ3B1
X2RldmljZSBwb2ludGVyCisgKiBAaGFuZGxlOiBoYW5kbGUgdXNlZCB0byBwYXNzIGFtZGdwdV9k
ZXZpY2UgcG9pbnRlcgogICoKICAqLwogc3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5k
bGUpCkBAIC00MDUsNyArNDA1LDcgQEAgc3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5k
bGUpCiAvKioKICAqIGFjcF9od19maW5pIC0gc3RvcCB0aGUgaGFyZHdhcmUgYmxvY2sKICAqCi0g
KiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKiBAaGFuZGxlOiBoYW5kbGUgdXNlZCB0
byBwYXNzIGFtZGdwdV9kZXZpY2UgcG9pbnRlcgogICoKICAqLwogc3RhdGljIGludCBhY3BfaHdf
ZmluaSh2b2lkICpoYW5kbGUpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
