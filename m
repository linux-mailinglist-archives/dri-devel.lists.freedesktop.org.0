Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F442A28FC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 12:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD77089CF8;
	Mon,  2 Nov 2020 11:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CD789CF8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 11:24:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g12so14111612wrp.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 03:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ka6oG61s56uSi20zjZOTu4QIASes47AodXCRjQdroWM=;
 b=hMv2NTjPlHuthCM9UUVLtzFXjBs0VVOim6KBb8hepefDkfx8HzOilWlHKbADVy53mR
 HrEsOllfzBNwQjIS3Dh+EbIZ1PvdU59dmYvHGGxhd/2SqsjmHoprnfFu3yr57tWm7XoW
 Ms+zcnJpt9oSSip1LfExS2m283N63Hv6W5fd/dJqNJGmVsOHadtbd1r2Ul+hTzSNj8S3
 naUiQkmhngjJQOyopaca7rZWYr4PIwZ8Q+2r/jJADgklPXfkTmAQuTyTim4vgwsHKrvv
 ucUC4UQNMG2Lt5mLhIBQTpR+hpL69TtgFledAviFxkpcqXS78yROoHlrCNWJkGoYyREw
 bytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ka6oG61s56uSi20zjZOTu4QIASes47AodXCRjQdroWM=;
 b=WOy2PlqHh9lCwEY5yHpbjXj+Gadn8WVICXgMM1T1wS1tfyh9QDWzGc6GpGOqsKtYgl
 G26WdHYAP/0RnAaGNz5Apw1FfteHaq9M50HqQVXmwXIrp5FEjRgnDSur162yxF0PC3fg
 DxsXkLygynv1CagpxhPUoP/1tGrZ5rVy0BSLrq2O8vUbHVOnNiWm0veRqGubqMsNW8Nj
 +I5jdhFHozM1MOk2hwur1sFOYmYbq4a762HM9aV5CTGA3Yb9iXOJ0x5aASIy4NLQX3Qx
 G6TNuCKtNpStJ/r+iBJR9t40NpD9gDTlePoFmGNBXtJ+LDz/TXOtCm48HE/4hJa3SejF
 s+pw==
X-Gm-Message-State: AOAM530xJqa0C0Ga1F3T+Z3O4+ssQ3GHnxvMr3rczE82lvKR3ISitTra
 Z0FdmAW1c5JOSq2On7rqoIrt3Q==
X-Google-Smtp-Source: ABdhPJxeqB5NmAXe81Eexs63FfVCwNj4sGmOhyU4D4wEPt10+eqOdNq7ow/T47NsthmDxpFZzShvSQ==
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr19555994wrn.362.1604316266442; 
 Mon, 02 Nov 2020 03:24:26 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id m14sm21867354wro.43.2020.11.02.03.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:24:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: kvalo@codeaurora.org
Subject: [PATCH 07/41] brcmfmac: pcie: Provide description for missing
 function parameter 'devinfo'
Date: Mon,  2 Nov 2020 11:23:36 +0000
Message-Id: <20201102112410.1049272-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102112410.1049272-1-lee.jones@linaro.org>
References: <20201102112410.1049272-1-lee.jones@linaro.org>
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
Cc: brcm80211-dev-list.pdl@broadcom.com,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 brcm80211-dev-list@cypress.com, Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hante Meuleman <hante.meuleman@broadcom.com>,
 linaro-mm-sig@lists.linaro.org, Wright Feng <wright.feng@cypress.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-media@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Franky Lin <franky.lin@broadcom.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYnJvYWRjb20vYnJjbTgwMjExL2JyY21mbWFjL3BjaWUuYzo3NjY6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2RldmluZm8nIG5vdCBkZXNjcmli
ZWQgaW4gJ2JyY21mX3BjaWVfYnVzX2NvbnNvbGVfcmVhZCcKCkNjOiBBcmVuZCB2YW4gU3ByaWVs
IDxhcmVuZC52YW5zcHJpZWxAYnJvYWRjb20uY29tPgpDYzogRnJhbmt5IExpbiA8ZnJhbmt5Lmxp
bkBicm9hZGNvbS5jb20+CkNjOiBIYW50ZSBNZXVsZW1hbiA8aGFudGUubWV1bGVtYW5AYnJvYWRj
b20uY29tPgpDYzogQ2hpLUhzaWVuIExpbiA8Y2hpLWhzaWVuLmxpbkBjeXByZXNzLmNvbT4KQ2M6
IFdyaWdodCBGZW5nIDx3cmlnaHQuZmVuZ0BjeXByZXNzLmNvbT4KQ2M6IEthbGxlIFZhbG8gPGt2
YWxvQGNvZGVhdXJvcmEub3JnPgpDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9m
dC5uZXQ+CkNjOiBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPgpDYzogU3VtaXQgU2Vt
d2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogbGludXgtd2lyZWxlc3NAdmdlci5rZXJuZWwub3Jn
CkNjOiBicmNtODAyMTEtZGV2LWxpc3QucGRsQGJyb2FkY29tLmNvbQpDYzogYnJjbTgwMjExLWRl
di1saXN0QGN5cHJlc3MuY29tCkNjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1t
ZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2Jyb2Fk
Y29tL2JyY204MDIxMS9icmNtZm1hYy9wY2llLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2Jyb2FkY29tL2Jy
Y204MDIxMS9icmNtZm1hYy9wY2llLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9icm9hZGNvbS9i
cmNtODAyMTEvYnJjbWZtYWMvcGNpZS5jCmluZGV4IDM5MzgxY2JkZTg5ZTYuLjFkM2NjMWM3Yzlj
NTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2Jyb2FkY29tL2JyY204MDIxMS9i
cmNtZm1hYy9wY2llLmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYnJvYWRjb20vYnJjbTgw
MjExL2JyY21mbWFjL3BjaWUuYwpAQCAtNzU5LDYgKzc1OSw3IEBAIHN0YXRpYyB2b2lkIGJyY21m
X3BjaWVfYnVzX2NvbnNvbGVfaW5pdChzdHJ1Y3QgYnJjbWZfcGNpZWRldl9pbmZvICpkZXZpbmZv
KQogLyoqCiAgKiBicmNtZl9wY2llX2J1c19jb25zb2xlX3JlYWQgLSByZWFkcyBmaXJtd2FyZSBt
ZXNzYWdlcwogICoKKyAqIEBkZXZpbmZvOiBwb2ludGVyIHRvIHRoZSBkZXZpY2UgZGF0YSBzdHJ1
Y3R1cmUKICAqIEBlcnJvcjogc3BlY2lmaWVzIGlmIGVycm9yIGhhcyBvY2N1cnJlZCAocHJpbnRz
IG1lc3NhZ2VzIHVuY29uZGl0aW9uYWxseSkKICAqLwogc3RhdGljIHZvaWQgYnJjbWZfcGNpZV9i
dXNfY29uc29sZV9yZWFkKHN0cnVjdCBicmNtZl9wY2llZGV2X2luZm8gKmRldmluZm8sCi0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
