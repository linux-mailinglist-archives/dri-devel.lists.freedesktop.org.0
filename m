Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E833F1EA02A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 10:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBB06E1CE;
	Mon,  1 Jun 2020 08:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F17989FA5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 08:33:22 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e4so7086066ljn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 01:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+oFQSuYqfFPB7zIFX+5U9cF5ft8QrZdDEwK+mQD33PY=;
 b=DuZo+MfXyHC9GlzR/2yFM+WN4fjb/p/JJgHRkGSxIXF2//7KcZ0KxMGSCBpQSdmouq
 wt/sLOvdPpfjh/O7oqRNkABPei59VkkP819v0HYI4XfXZBF2ZaYOpSukqH+N/iu3Zkl4
 HLzygHv2ySEJLU6DEYh7bqKbMnWr7Y9+JsOC/tJDuVvTJHZH26X97Aa7aXIyBSap/xa4
 orXT5/AJZ+kIapVS5cZTLONUb7LOo49ykVsbOvsm2LvkVTfvxV1hG5y4bWUd2caO0v8s
 TYCucqG2cq1Pu/3xP1STUqNP8PkVv9oA35E+iN19WG6i1w+FOwRpqmGJVRR4Irm7xSn4
 Bnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+oFQSuYqfFPB7zIFX+5U9cF5ft8QrZdDEwK+mQD33PY=;
 b=TAfbK6wQv36lVRniKPg0GJEAt/cGhBnbRqFB4rkCd9iqj8axkOBqzMFJyfx63ZSHsy
 CIJGvfvlZgjB2J5K3Wexpo/dtEFmHFFSZP2XnuT66qgadr5ecf3cL4OClz9LelKkha8z
 OpgyHllU81RzwYtPxFfwjIn/6kLii6RRDrkb8mF3LnWHzoSSyZf4B0mRGu5lS0YZvHKG
 x4z6MhOyc1tUxKpJvzjrmeJ0/gJpif1NLiYS3ipW+OyaH5qDdnDJMIPb+AybCdolFr9L
 lTZxyQ7NdAiB96BlhQhqgwBs9xrSZORG6Maz7Y0wpGu2M1sxPSXxUTQWGe3C+m/ZsR6Y
 y7QA==
X-Gm-Message-State: AOAM533imgnb9xFwNmLj46l+T4IQxvzGAZkPXxe3xBtMNwGyk5iU/Sxu
 wo4FyxLmAwU5qHYaP72FtIquM3LnLz0=
X-Google-Smtp-Source: ABdhPJySVAKpBlLW/smaV5zLyUIVQ4gmwmnleI9Ks/S59fIsYMXrMMpJcniENECe+9KE/vbPdiu6XQ==
X-Received: by 2002:a2e:81d1:: with SMTP id s17mr10542649ljg.91.1591000400787; 
 Mon, 01 Jun 2020 01:33:20 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 01:33:20 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 6/6] drm: panel-simple: add LOGIC Technologies panels
Date: Mon,  1 Jun 2020 10:33:09 +0200
Message-Id: <20200601083309.712606-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601083309.712606-1-sam@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIHRoZSBmb2xsb3dpbmcgcGFuZWxzIGZyb20gTE9HSUMgVGVjaG5vbG9n
aWVzLCBJbmM6Ci0gTFRURDgwMDQ4MDA3MC1MMlJUCi0gTFRURDgwMDQ4MDA3MC1MNldILVJUCgpU
aGUgTFRURDgwMDQ4MCBMMlJUIGlzIGRpc2NvbnRpbnVlZCwgYnV0IGl0IG1heSBiZSB1c2VkCmJ5
IGV4aXN0aW5nIHByb2R1Y3RzLgoKU2lnbmVkLW9mZi1ieTogU8O4cmVuIEFuZGVyc2VuIDxzYW5A
c2tvdi5kaz4KU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpD
YzogU8O4cmVuIEFuZGVyc2VuIDxzYW5Ac2tvdi5kaz4KQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGll
cnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwgNzAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggMjVjOTY2Mzk2MzFmLi43MGQ1NDE2
NGIxYWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAgLTI0MjgsNiArMjQy
OCw3MCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgbG9naWN0ZWNobm9fbHQxNzA0
MTBfMndoYyA9IHsKIAkuY29ubmVjdG9yX3R5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfTFZEUywK
IH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBsb2dpY3RlY2hub19s
dHRkODAwNDgwMDcwX2wycnRfbW9kZSA9IHsKKwkuY2xvY2sgPSAzMzAwMCwKKwkuaGRpc3BsYXkg
PSA4MDAsCisJLmhzeW5jX3N0YXJ0ID0gODAwICsgMTEyLAorCS5oc3luY19lbmQgPSA4MDAgKyAx
MTIgKyAzLAorCS5odG90YWwgPSA4MDAgKyAxMTIgKyAzICsgODUsCisJLnZkaXNwbGF5ID0gNDgw
LAorCS52c3luY19zdGFydCA9IDQ4MCArIDM4LAorCS52c3luY19lbmQgPSA0ODAgKyAzOCArIDMs
CisJLnZ0b3RhbCA9IDQ4MCArIDM4ICsgMyArIDI5LAorCS5mbGFncyA9IERSTV9NT0RFX0ZMQUdf
TlZTWU5DIHwgRFJNX01PREVfRkxBR19OSFNZTkMsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0
IHBhbmVsX2Rlc2MgbG9naWN0ZWNobm9fbHR0ZDgwMDQ4MDA3MF9sMnJ0ID0geworCS5tb2RlcyA9
ICZsb2dpY3RlY2hub19sdHRkODAwNDgwMDcwX2wycnRfbW9kZSwKKwkubnVtX21vZGVzID0gMSwK
KwkuYnBjID0gOCwKKwkuc2l6ZSA9IHsKKwkJLndpZHRoID0gMTU0LAorCQkuaGVpZ2h0ID0gODYs
CisJfSwKKwkuZGVsYXkgPSB7CisJCS5wcmVwYXJlID0gNDUsCisJCS5lbmFibGUgPSAxMDAsCisJ
CS5kaXNhYmxlID0gMTAwLAorCQkudW5wcmVwYXJlID0gNDUKKwl9LAorCS5idXNfZm9ybWF0ID0g
TUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwKKwkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX1BJ
WERBVEFfUE9TRURHRSwKKwkuY29ubmVjdG9yX3R5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRFBJ
LAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGxvZ2ljdGVjaG5v
X2x0dGQ4MDA0ODAwNzBfbDZ3aF9ydF9tb2RlID0geworCS5jbG9jayA9IDMzMDAwLAorCS5oZGlz
cGxheSA9IDgwMCwKKwkuaHN5bmNfc3RhcnQgPSA4MDAgKyAxNTQsCisJLmhzeW5jX2VuZCA9IDgw
MCArIDE1NCArIDMsCisJLmh0b3RhbCA9IDgwMCArIDE1NCArIDMgKyA0MywKKwkudmRpc3BsYXkg
PSA0ODAsCisJLnZzeW5jX3N0YXJ0ID0gNDgwICsgNDcsCisJLnZzeW5jX2VuZCA9IDQ4MCArIDQ3
ICsgMywKKwkudnRvdGFsID0gNDgwICsgNDcgKyAzICsgMjAsCisJLmZsYWdzID0gRFJNX01PREVf
RkxBR19OVlNZTkMgfCBEUk1fTU9ERV9GTEFHX05IU1lOQywKK307CisKK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgcGFuZWxfZGVzYyBsb2dpY3RlY2hub19sdHRkODAwNDgwMDcwX2w2d2hfcnQgPSB7CisJ
Lm1vZGVzID0gJmxvZ2ljdGVjaG5vX2x0dGQ4MDA0ODAwNzBfbDZ3aF9ydF9tb2RlLAorCS5udW1f
bW9kZXMgPSAxLAorCS5icGMgPSA4LAorCS5zaXplID0geworCQkud2lkdGggPSAxNTQsCisJCS5o
ZWlnaHQgPSA4NiwKKwl9LAorCS5kZWxheSA9IHsKKwkJLnByZXBhcmUgPSA0NSwKKwkJLmVuYWJs
ZSA9IDEwMCwKKwkJLmRpc2FibGUgPSAxMDAsCisJCS51bnByZXBhcmUgPSA0NQorCX0sCisJLmJ1
c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0LAorCS5idXNfZmxhZ3MgPSBEUk1f
QlVTX0ZMQUdfUElYREFUQV9QT1NFREdFLAorCS5jb25uZWN0b3JfdHlwZSA9IERSTV9NT0RFX0NP
Tk5FQ1RPUl9EUEksCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
bWl0c3ViaXNoaV9hYTA3MG1jMDFfbW9kZSA9IHsKIAkuY2xvY2sgPSAzMDQwMCwKIAkuaGRpc3Bs
YXkgPSA4MDAsCkBAIC0zODQxLDYgKzM5MDUsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgcGxhdGZvcm1fb2ZfbWF0Y2hbXSA9IHsKIAl9LCB7CiAJCS5jb21wYXRpYmxlID0g
ImxvZ2ljdGVjaG5vLGx0MTcwNDEwLTJ3aGMiLAogCQkuZGF0YSA9ICZsb2dpY3RlY2hub19sdDE3
MDQxMF8yd2hjLAorCX0sIHsKKwkJLmNvbXBhdGlibGUgPSAibG9naWN0ZWNobm8sbHR0ZDgwMDQ4
MDA3MC1sMnJ0IiwKKwkJLmRhdGEgPSAmbG9naWN0ZWNobm9fbHR0ZDgwMDQ4MDA3MF9sMnJ0LAor
CX0sIHsKKwkJLmNvbXBhdGlibGUgPSAibG9naWN0ZWNobm8sbHR0ZDgwMDQ4MDA3MC1sNndoLXJ0
IiwKKwkJLmRhdGEgPSAmbG9naWN0ZWNobm9fbHR0ZDgwMDQ4MDA3MF9sNndoX3J0LAogCX0sIHsK
IAkJLmNvbXBhdGlibGUgPSAibWl0c3ViaXNoaSxhYTA3MG1jMDEtY2ExIiwKIAkJLmRhdGEgPSAm
bWl0c3ViaXNoaV9hYTA3MG1jMDEsCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
