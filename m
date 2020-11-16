Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370B02B4DBF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03976EA0A;
	Mon, 16 Nov 2020 17:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C856EA01
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b6so19669219wrt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vIBIVuzBlrGyaebIimJgPfSPXPdePz/jLOplaNl77Uc=;
 b=dJjWPHa3XSW+Ks76T1YqjrP8Dal9w+IUPXB7B0WHSP7xUCjZgNZc1GMjFypJy45vz9
 iRTaxjVnCRfTzngcfrS/4Refr2BTlaNkKolSVU5w93MFZHZvZtYlw/GYpoPROQ3wieWI
 4/bncU60X4rvtrzb0eVCC5XTG+4wcKsdWumjKq9VnsyeKq+eyPfQ/2JJAQgU/QnLrjlq
 wm3lnnvmPZHgysqF5d5pd3mSZMy5/H0Fco7jajp+mDVA6a1Y+Uo5R6jJtticd68vu3r0
 YwT4a3Qsyysuyt2/3Xd7BVvi/t3DjsfVrjNQSldCF3NNn0JZO36Y8iz6FdKQ+aUEFuMO
 ektw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vIBIVuzBlrGyaebIimJgPfSPXPdePz/jLOplaNl77Uc=;
 b=NYY3stmerQIrDpiUym3xQlLkstIMCzyRPmokYMWIXaz2l4z1WZTDBAFhgLtOjdznJp
 KKqmqiSKkRQ81lSGyGUJtmIYqG/H2akzRqT5eZzOhEBm1EwapKChK+Ye5+8onQWrEQaZ
 KjiJ148HEKk6UcCt7FUCO/MTDzRmdw5G4RN0r/KmB/QC90udi3d5rj0FpGyu/ZapGsZz
 biu2IxQbaM9V/KBsDdNnGGpTBkexjjNi/mz7V0DUqqmgYZQmHUHSWlpuDZmd2pq5I9M/
 Oij65VfES3dXzqMMKKV/RQkGKo4mzERbiPD3y5KBlOJR1IlVof/ly+f8fpyd9Ukgf8A5
 L2kA==
X-Gm-Message-State: AOAM5308CwcFF+B4kYcEjNWiGIL1oSECi+aW3faC6KGgDD0XKEPD2+ru
 GDhEJA7b92xNNj3V7bwzGUXybQ==
X-Google-Smtp-Source: ABdhPJxDDINDffKvoqG3eEdIP5lWfvrdKvY5h8rEXr/nMWkPCPHtkoWbEr/dVNpmPZeeG4ec1Xg7cw==
X-Received: by 2002:a5d:6783:: with SMTP id v3mr20186302wru.45.1605548516035; 
 Mon, 16 Nov 2020 09:41:56 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:55 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/42] drm/rockchip/rockchip_rgb: Consume our own header
Date: Mon, 16 Nov 2020 17:40:55 +0000
Message-Id: <20201116174112.1833368-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3JnYi5jOjcxOjIyOiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmHJvY2tjaGlwX3JnYl9pbml04oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9yZ2IuYzoxNTk6Njog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyb2NrY2hpcF9yZ2JfZmluaeKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBz
LmNvbT4KQ2M6ICJIZWlrbyBTdMO8Ym5lciIgPGhlaWtvQHNudGVjaC5kZT4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9yZ2IuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX3JnYi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3Jn
Yi5jCmluZGV4IDlhNzcxYWY1ZDBjOTUuLmMwNzk3MTQ0NzdkOGEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9yZ2IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfcmdiLmMKQEAgLTE4LDYgKzE4LDcgQEAKIAogI2luY2x1ZGUgInJv
Y2tjaGlwX2RybV9kcnYuaCIKICNpbmNsdWRlICJyb2NrY2hpcF9kcm1fdm9wLmgiCisjaW5jbHVk
ZSAicm9ja2NoaXBfcmdiLmgiCiAKICNkZWZpbmUgZW5jb2Rlcl90b19yZ2IoYykgY29udGFpbmVy
X29mKGMsIHN0cnVjdCByb2NrY2hpcF9yZ2IsIGVuY29kZXIpCiAKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
