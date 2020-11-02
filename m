Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 383972A2A01
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 12:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B60A89D83;
	Mon,  2 Nov 2020 11:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CCB89D83
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 11:54:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g12so14220402wrp.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 03:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sgCfvBJWtLw81z7RjPwr6bormd4FsaQ3wcZ4l8FFWRs=;
 b=moD0ijFtxs3YDF9szj7mvVpXUGbBcJvo25U/w2SGBdKEu2CJe2/R9I45WDZ0zBMghV
 33Ou3U3Z8oI1pYoV1NDil2EEJmk2Jk26h50Eo1qoCzP5PKJ05JjvVMb8Hg2emu5oXtdO
 G/G5/2QBDvcV+xwQHea1IkLwNPNqIpDoKKtCJZjyk+mYoSrpc43UQ53YC9Mfb/ICtOEH
 1KKjRHcQwq3w9Rud0CHnJYkCGpLRFKJe3xaOCRePtSzfvCimRfWnJ3r9d6/PGbghlgae
 SXipOAv3fpd6hLpmhNQhXlntG8L3Ky/YcpO7LvVTqTa91x+Pd4Hbd477hn6dmOeA5sMh
 mvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sgCfvBJWtLw81z7RjPwr6bormd4FsaQ3wcZ4l8FFWRs=;
 b=GJ+z2YboD9Vtp2XpTUfgHZ12mA9re4xqWnGlIwB24Dc13fDcfKnsKgjQMxWRRhcWsq
 CLx9TVRb++HRSPVCANi6Uxss7Ol9xBKnKSB7XrwVClVKWGGlf6QcaK6b8Botb7pq5nJH
 Q2oXdafGWwccujZxKrMNKMdyKFkQhuE8UxiBUUT8gFUnqJ1NkEtemYLkhKynbbutKmjS
 ZjYHLzHzHiKid7Qa2h3StHhY300gaL3zELMxlf+H8284hkEGgVILsNYHPY2sAi3VXxQj
 kXHxPem4K3tURJqzru5hNG8RNwgWPCK8D/+qp2NmY0EI2D2EcSsAWBPYrBRQmLSiwA2T
 MHGA==
X-Gm-Message-State: AOAM530d/OT1XNwBF/eqZvNRY48jMmVAvZV1MAfZfHBB8X8VCAiVU3Y9
 N1m76ZExHWKD7Gb2WxSUVRPSnQ==
X-Google-Smtp-Source: ABdhPJy4Qc6S807GOZhDFOw1vxX6caxNriQqJXpn9auBPJu7Ej+kcF0sDBj8+ECN81+2ejh4BB/VTA==
X-Received: by 2002:adf:804b:: with SMTP id 69mr19675757wrk.274.1604318062508; 
 Mon, 02 Nov 2020 03:54:22 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 07/23] mtd: spi-nor: controllers: hisi-sfc: Demote
 non-conformant kernel-doc
Date: Mon,  2 Nov 2020 11:53:50 +0000
Message-Id: <20201102115406.1074327-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9oaXNpLXNmYy5jOjMyODogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbnAnIG5vdCBkZXNjcmliZWQgaW4gJ2hpc2lfc3BpX25v
cl9yZWdpc3RlcicKIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMuYzoz
Mjg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2hvc3QnIG5vdCBkZXNj
cmliZWQgaW4gJ2hpc2lfc3BpX25vcl9yZWdpc3RlcicKCkNjOiBUdWRvciBBbWJhcnVzIDx0dWRv
ci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+CkNjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgpDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KQ2M6
IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6IFN1bWl0IFNlbXdhbCA8
c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29udHJvbGxlcnMvaGlzaS1zZmMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29u
dHJvbGxlcnMvaGlzaS1zZmMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlz
aS1zZmMuYwppbmRleCA5NWM1MDIxNzNjYmRhLi43YzI2ZjhmNTY1Y2JhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2hpc2ktc2ZjLmMKKysrIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9jb250cm9sbGVycy9oaXNpLXNmYy5jCkBAIC0zMjAsNyArMzIwLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2NvbnRyb2xsZXJfb3BzIGhpc2lfY29udHJvbGxlcl9v
cHMgPSB7CiAJLndyaXRlID0gaGlzaV9zcGlfbm9yX3dyaXRlLAogfTsKIAotLyoqCisvKgogICog
R2V0IHNwaSBmbGFzaCBkZXZpY2UgaW5mb3JtYXRpb24gYW5kIHJlZ2lzdGVyIGl0IGFzIGEgbXRk
IGRldmljZS4KICAqLwogc3RhdGljIGludCBoaXNpX3NwaV9ub3JfcmVnaXN0ZXIoc3RydWN0IGRl
dmljZV9ub2RlICpucCwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
