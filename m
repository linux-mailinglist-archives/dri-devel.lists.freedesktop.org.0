Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62067AB2E4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDCF6E17E;
	Fri,  6 Sep 2019 07:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364A36E122
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:10 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id u17so1677784pgi.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/ld8MsvJyHX4xiXhT/vACY8V+T9SsrvyxVWLxkWmOHw=;
 b=lPpCi2BXh6faS0cn/Rh5xqpYcUid0wBRS2fvehUPvSMgnqR7JWYjlag/3NPZWrkzHs
 rldiA+WfDcz7UdUlsDVXSbZzp6h1XINCM+Tot0XrrIKpc/tkGvhfoZQJXjHxdELxWW68
 CRNWHEoSD5reJIWIQpvxP/dv00ijzszEPyDyLz4RWlBgYVPijNPjzkM+1hx1YiVyiEiA
 77K6KWQNcauaKCRhB/hdhkKUBaCSdupvbxg42SkO6Bg5nqWZjrgaFu7XFKLLlJaWjijg
 5rVwBBvw0DWQZXZIkfQSLmLQirTWX/2XCsTe7qI2AnAnDEUepgnnoTkFZHwQDdozaoDB
 cZwg==
X-Gm-Message-State: APjAAAWgyVLuMa71b31me0e2ExSUNHqm0Gd5NIYkQaV3gAwZ40of4n/L
 nDpIRm2mH+9gYHcJIHBMGK85GA==
X-Google-Smtp-Source: APXvYqwbHY2l3Y3RI4VI6wb4Zy7sVNDjcmdxm+p9Gx0FC6W1QaFVP9fXezb7/YJ8ZduZPS1+K7YUJg==
X-Received: by 2002:a63:2364:: with SMTP id u36mr3780682pgm.449.1567700289680; 
 Thu, 05 Sep 2019 09:18:09 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:09 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 07/18] mtd: spi-nor: enable 4B opcodes for
 mx66l51235l
Date: Thu,  5 Sep 2019 10:17:48 -0600
Message-Id: <20190905161759.28036-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/ld8MsvJyHX4xiXhT/vACY8V+T9SsrvyxVWLxkWmOHw=;
 b=XT3Az7zzBbgbLvMexBlhl28H1zweak4MTFSDW4Z2X3Ha/QND0Bs7fu1GlJQslffzeB
 LWlUlyWIAmzVk/+mUyPdD+4nZwAO9nk1ji12txKMyNEST223rFfRlFB6AeFPMZvq7wy/
 tXFpIGd7WBH3k/q538r3XaFEMh0s3bPPDl3wPolk9LypaKTfGB6UzVKsLLeAS07gj1rn
 fdweJBOKtEZq8Zmfgu1NcESYEF48FPKrzvVBBc5+gyUyrbJ//dUWwgy6OH85myV+ToOC
 HgL1kn+e4YWS/JFJ4yB6alQ12JjDhFV87for4spwtn7BdUdPfyqfJYpWsYs/lzpIIiIM
 3BKQ==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gWWVyeW9taW4gPGxlcm9pLmxpc3RzQGdtYWlsLmNvbT4KCmNvbW1pdCBkMzQy
YjZhOTczYWY0NTlmNjEwNGNhZDZlZmZjOGVmYzcxYTA1NThkIHVwc3RyZWFtCgpTaWduZWQtb2Zm
LWJ5OiBSb21hbiBZZXJ5b21pbiA8cm9tYW5AYWR2ZW0ubHY+ClNpZ25lZC1vZmYtYnk6IEN5cmls
bGUgUGl0Y2hlbiA8Y3lyaWxsZS5waXRjaGVuQHdlZGV2NHUuZnI+ClNpZ25lZC1vZmYtYnk6IE1h
dGhpZXUgUG9pcmllciA8bWF0aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9t
dGQvc3BpLW5vci9zcGktbm9yLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1u
b3IuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCmluZGV4IDM0ZWNjMTJlZTNkOS4u
NmMwMTMzNDFlZjA5IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwor
KysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwpAQCAtMTAzMCw3ICsxMDMwLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHNwaV9ub3JfaWRzW10gPSB7CiAJeyAibXgy
NWwyNTYzNWUiLCBJTkZPKDB4YzIyMDE5LCAwLCA2NCAqIDEwMjQsIDUxMiwgU1BJX05PUl9EVUFM
X1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCkgfSwKIAl7ICJteDI1dTI1NjM1ZiIsIElORk8oMHhj
MjI1MzksIDAsIDY0ICogMTAyNCwgNTEyLCBTRUNUXzRLIHwgU1BJX05PUl80Ql9PUENPREVTKSB9
LAogCXsgIm14MjVsMjU2NTVlIiwgSU5GTygweGMyMjYxOSwgMCwgNjQgKiAxMDI0LCA1MTIsIDAp
IH0sCi0JeyAibXg2Nmw1MTIzNWwiLCBJTkZPKDB4YzIyMDFhLCAwLCA2NCAqIDEwMjQsIDEwMjQs
IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0sCisJeyAibXg2Nmw1MTIz
NWwiLCBJTkZPKDB4YzIyMDFhLCAwLCA2NCAqIDEwMjQsIDEwMjQsIFNQSV9OT1JfRFVBTF9SRUFE
IHwgU1BJX05PUl9RVUFEX1JFQUQgfCBTUElfTk9SXzRCX09QQ09ERVMpIH0sCiAJeyAibXg2NnU1
MTIzNWYiLCBJTkZPKDB4YzIyNTNhLCAwLCA2NCAqIDEwMjQsIDEwMjQsIFNFQ1RfNEsgfCBTUElf
Tk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgU1BJX05PUl80Ql9PUENPREVTKSB9
LAogCXsgIm14NjZsMWc0NWciLCAgSU5GTygweGMyMjAxYiwgMCwgNjQgKiAxMDI0LCAyMDQ4LCBT
RUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCkgfSwKIAl7ICJt
eDY2bDFnNTVnIiwgIElORk8oMHhjMjI2MWIsIDAsIDY0ICogMTAyNCwgMjA0OCwgU1BJX05PUl9R
VUFEX1JFQUQpIH0sCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
