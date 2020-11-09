Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161002AC3A3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 19:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E07E8922B;
	Mon,  9 Nov 2020 18:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066C089231
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 18:22:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c9so386321wml.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 10:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEqBSYfgnwhk/ZNzzzB95lzeseOVAaohNofEs1LOZBI=;
 b=E5ipTHd3WeDI78ksj0wsN8ta6sheG/AQB8BQ8iXDHY5Vcd5UP94Rmeb7qV39CI/m/s
 b/TNUumxNIHspIcHhdFCsiyjqRYTDi6pnvzjl7SpwuZ+Oxt03xpdAj/3MRJXnqIcQqWJ
 2CWq8IcW42vMXfoIzw9qhqEQzXFH2P7lqowbg2tr3Hh8NbC7AA/znooc5voi/95YHJWY
 oayfshr76vF8oeDXsIWE4y755y3n4vV4To8KDCOWY1QgtknHx0PM6y01BzoWa4VjGVS3
 lm90zOwPqown5kRN4b1GJ0vNIkHGg1TCABjsQk3PkyG7Wq5ZPMW7LC2B3OmnIXnbkm9I
 pOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEqBSYfgnwhk/ZNzzzB95lzeseOVAaohNofEs1LOZBI=;
 b=ZGPwE3qrNyyPSUWeEzH0qUAts0W72mo7AWHj5ZuKbVuhrlxCa3N+0W6C5sFBmbJH4D
 7RLOru/0tQy06iuaoK1qRPrT8ZgufvfiU9MCRC2lg0YYvLLqdi5l4zXwp5CJeJ/MOExN
 n9+CO/42g+F/vgl7J+zoaVELuIlAHFjGelci4uBrDH8VLpO20rL9ydCmKznl1hxwSGhb
 BoiquvhDBccPkoMetAX1suAZ8yAQrBYkTgzQMAjErcfSnn+W3Mug0Df5xmvny+EAGa0P
 ZGauiKTyCGd1BypiImI58igcugX/1EOyLXwOK0QH2yg0naYaRHzUE/7x1SWvbz9AIEFE
 8szw==
X-Gm-Message-State: AOAM531QmR1bFDKkp2Tsg2KJkEBKF6stAXoV5gDI9xldUqiLrFw3SDS8
 4h8MhTwfBgUoVST+LirW6IQ+TQ==
X-Google-Smtp-Source: ABdhPJyaVPP3HEd2IjowyvIOVawlg8jsDXag6dU6Ag6aKnnQvcujBiDSl7HF2Rx1NPFQXIBYU4qlLg==
X-Received: by 2002:a1c:a98c:: with SMTP id s134mr443690wme.159.1604946150581; 
 Mon, 09 Nov 2020 10:22:30 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:29 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 07/23] mtd: spi-nor: hisi-sfc: Demote non-conformant
 kernel-doc
Date: Mon,  9 Nov 2020 18:21:50 +0000
Message-Id: <20201109182206.3037326-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-media@vger.kernel.org
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
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogVmlnbmVzaCBSYWdo
YXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgotLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJv
bGxlcnMvaGlzaS1zZmMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvaGlzaS1zZmMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMu
YwppbmRleCA5NWM1MDIxNzNjYmRhLi43YzI2ZjhmNTY1Y2JhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2hpc2ktc2ZjLmMKKysrIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci9jb250cm9sbGVycy9oaXNpLXNmYy5jCkBAIC0zMjAsNyArMzIwLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzcGlfbm9yX2NvbnRyb2xsZXJfb3BzIGhpc2lfY29udHJvbGxlcl9vcHMgPSB7
CiAJLndyaXRlID0gaGlzaV9zcGlfbm9yX3dyaXRlLAogfTsKIAotLyoqCisvKgogICogR2V0IHNw
aSBmbGFzaCBkZXZpY2UgaW5mb3JtYXRpb24gYW5kIHJlZ2lzdGVyIGl0IGFzIGEgbXRkIGRldmlj
ZS4KICAqLwogc3RhdGljIGludCBoaXNpX3NwaV9ub3JfcmVnaXN0ZXIoc3RydWN0IGRldmljZV9u
b2RlICpucCwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
