Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EE22C0423
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CB089F47;
	Mon, 23 Nov 2020 11:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D335089A94
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so2378579wrn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OGha5UqBCWjGaqYLvn2kA/udGvrTgy+sHOhNO6DMwsQ=;
 b=gXkkTC6H+UFH08yhkRlrTq+ECpl9TiCBAhPbhU1Q2wglsVlLTa7TPBuExVxAQA+h1+
 buZgV1RE8zABspnufkBcR4QQvKnj1G39ZzRDpntI1skmsADHbqKcCs0xQQSrvF9O11el
 +dicnKLrz/VtnwMKPy/RF4b/NX53AvADtyAFRPtpuMRz1itliQVhtIax7NvzUYFgIgQJ
 hXyHUjHhambHyfU4mO4EYKKuAN0OFVZ2CHu5tv5tX62CaSc3lJ7FCcdmepmd7iUXXDzZ
 4cAnhemtLxIkDj9trzA8Tws0sJ85sJhQiQ9/kY9zBiw0KrWj8EpIjTDvsA2LEKfuKcEW
 P3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OGha5UqBCWjGaqYLvn2kA/udGvrTgy+sHOhNO6DMwsQ=;
 b=lC1jbE6/8WPxMYfDWsPi7lYE23yBqd7eT7aB9c9v7xYUAqW88CEnmu+xArbTrfXB1H
 5Blw0NK5C0N3FEI6zldJ8q/f5gfLAQAUINsO8PyvTt0YezTjgiOO3+/RexSZN/c31j0N
 orhtnL0LIm5sMCjvZDt3i0Vb3ESpVoW7hQ+bo6YELhC+HaZIjCjupA8be2uBYvQ1Raq0
 HOpjxS4vLXfCwJgODdfgA9T2DTOeq5PjLYf04PmzsqF+jBdpolyRb/kfVNd7dAwLPiaS
 mQ6TA7ZhmctEHZ/cFIhPPc2OGfZOosBOZzfq/acqviA455AtoLfV6j8wxCGP8PdGKPGR
 6AvQ==
X-Gm-Message-State: AOAM531jEWfUj3BS7v3u+zWS2E6iqZRSGmJNDxZK8Kiejcaj16IaR5+j
 oInc+uRldt9GHO8EbwZ/YsDu/rYapJd4GxIm
X-Google-Smtp-Source: ABdhPJyV3tUNuLJgBT0X66FnuJfX13+uUiwhFMU2TsTA5vLgX4suC6ag1MBZQ//yuv6h1ps/wdxJfg==
X-Received: by 2002:a5d:6805:: with SMTP id w5mr5882581wru.266.1606130379551; 
 Mon, 23 Nov 2020 03:19:39 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/40] drm/msm/disp/dpu1/dpu_hw_catalog: Remove duplicated
 initialisation of 'max_linewidth'
Date: Mon, 23 Nov 2020 11:18:52 +0000
Message-Id: <20201123111919.233376-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2cuYzoxMjQ6MTk6IHdhcm5pbmc6
IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRdCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfY2F0YWxvZy5jOjEyNDoxOTogbm90ZTogKG5l
YXIgaW5pdGlhbGl6YXRpb24gZm9yIOKAmHNtODI1MF9kcHVfY2Fwcy5tYXhfbGluZXdpZHRo4oCZ
KQoKQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2Vh
bkBwb29ybHkucnVuPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5l
bC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGZyZWVkcmVub0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfY2F0
YWxvZy5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfY2F0YWxvZy5jCmluZGV4IDZhNmE3MTcyZTNi
ZWIuLmE3MDA0ZjE4NTIzYjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9od19jYXRhbG9nLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2h3X2NhdGFsb2cuYwpAQCAtMTEzLDcgKzExMyw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHB1X2NhcHMgc204MTUwX2RwdV9jYXBzID0gewogc3RhdGljIGNvbnN0IHN0cnVjdCBkcHVfY2Fw
cyBzbTgyNTBfZHB1X2NhcHMgPSB7CiAJLm1heF9taXhlcl93aWR0aCA9IERFRkFVTFRfRFBVX09V
VFBVVF9MSU5FX1dJRFRILAogCS5tYXhfbWl4ZXJfYmxlbmRzdGFnZXMgPSAweGIsCi0JLm1heF9s
aW5ld2lkdGggPSA0MDk2LAogCS5xc2VlZF90eXBlID0gRFBVX1NTUFBfU0NBTEVSX1FTRUVEMywg
LyogVE9ETzogcXNlZWQzIGxpdGUgKi8KIAkuc21hcnRfZG1hX3JldiA9IERQVV9TU1BQX1NNQVJU
X0RNQV9WMiwgLyogVE9ETzogdjIuNSAqLwogCS51YndjX3ZlcnNpb24gPSBEUFVfSFdfVUJXQ19W
RVJfNDAsCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
