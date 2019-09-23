Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286CBB5A8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9877B6E90F;
	Mon, 23 Sep 2019 13:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E726E90F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:45:07 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id r26so33441587ioh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 06:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8gJJO39rFvRPC27Eg6HXHKJTgns+bBIO2jkPaH1hgc4=;
 b=eYOXyXktDWdG/uD0RETrKTfOCGaZQ2iA3ifR3FLIeSJsaWfQJ2Q085vYouVONYdGXK
 eUHRQnQBzegJe/lK1Y/8uVgllD1FNJwb5CdEfg90UogW81iz9rMt+YBeGiPiKrwlJx/f
 zSq6Xq6PJCvuXV6wM/yvXUy8nsyoxe6nBA0wSsKQGxffXOJErRaGYxTEWR/23apfyt3c
 SkUqpfRn9Bu8DlqR9cC7wcq3F5JWnHdcwt8Zeroqf1EvHazVuB1V+b5xHAo/lfwjQL7/
 vbjwsGLfpTj22f1h1tJlh8kq+27ani34uG7iyDongccUPO7wHAo1vHaKcpebfOOHsdpm
 kL1Q==
X-Gm-Message-State: APjAAAWGS9EszUsom7mfrMPWZOwgbjKb7XiNbDFbxOzIV6XXdKiX8czj
 jqKeaoVO3FIRu2Uda63rZKr81Su2jek=
X-Google-Smtp-Source: APXvYqzJ5o3V+xw8Vo6YavSbpE/G0mrA+1QvHonDZaHomPezsl9Rg4ZVusHEe89mStO7TrQUS+BgXA==
X-Received: by 2002:a6b:c895:: with SMTP id
 y143mr14632059iof.271.1569246305617; 
 Mon, 23 Sep 2019 06:45:05 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
 by smtp.gmail.com with ESMTPSA id x2sm8844474iob.74.2019.09.23.06.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 06:44:59 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 1/3] drm/panel: simple: Add Logic PD Type 28 display support
Date: Mon, 23 Sep 2019 08:44:47 -0500
Message-Id: <20190923134449.22326-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8gJJO39rFvRPC27Eg6HXHKJTgns+bBIO2jkPaH1hgc4=;
 b=gYnxWxDzYUW5wn60fhXJrrdD/bHxTVKwpKATR5CRZEQcYGvXyNPjvq4hzHLvfaf5Qn
 HLcQUGjw/5+RhsF9F2VVpXwAiTSkvIWCGnJo+3s8xZjyaV9ZfeUxBFlwP7KzOZAiIPTC
 T6j7b4NdQ//XRSTLKNKUQrQtMi5hhBgDwKp0tt0msVN9MHViDBJTcaUFdlXxZR90ujcH
 4PYYFitroKR3Jc9v8E9sNobSwr3+LrMmKvS3jUjbM2Tt3xXNwVsdeb7M+QmK+83NBXfS
 LzBnzOTk9WrX+w3N0JyHc/MPaPt0Ej4YzZq5CAGpOPoSrTgEdQwTidx0M4upHPwcTPxH
 3IJA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 adam.ford@logicpd.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJldmlvdXNseSwgdGhlcmUgd2FzIGFuIG9tYXAgcGFuZWwtZHBpIGRyaXZlciB0aGF0IHdvdWxk
CnJlYWQgZ2VuZXJpYyB0aW1pbmdzIGZyb20gdGhlIGRldmljZSB0cmVlIGFuZCBzZXQgdGhlIGRp
c3BsYXkKdGltaW5nIGFjY29yZGluZ2x5LiAgVGhpcyBkcml2ZXIgd2FzIHJlbW92ZWQgc28gdGhl
IHNjcmVlbgpubyBsb25nZXIgZnVuY3Rpb25zLiAgVGhpcyBwYXRjaCBtb2RpZmllcyB0aGUgcGFu
ZWwtc2ltcGxlCmZpbGUgdG8gc2V0dXAgdGhlIHRpbWluZ3MgdG8gdGhlIHNhbWUgdmFsdWVzIHBy
ZXZpb3VzbHkgdXNlZC4KCkZpeGVzOiA4YmY0YjE2MjExNzggKCJkcm0vb21hcDogUmVtb3ZlIHBh
bmVsLWRwaSBkcml2ZXIiKQoKU2lnbmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFp
bC5jb20+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQpW
MjogIE5vIGNoYW5nZQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1z
aW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwppbmRleCA1YTkz
YzRlZGYxZTQuLmM4NmMzMGYzYThhMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUu
YwpAQCAtMTkwMCw2ICsxOTAwLDQwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSBtaXRzdWJpc2hpX2FhMDcwbWMwMV9tb2RlID0gewogCS5mbGFncyA9IERSTV9NT0RFX0ZM
QUdfTkhTWU5DIHwgRFJNX01PREVfRkxBR19OVlNZTkMsCiB9OwogCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgbG9naWNwZF90eXBlXzI4X21vZGUgPSB7CisJLmNsb2NrID0g
OTAwMCwKKwkuaGRpc3BsYXkgPSA0ODAsCisJLmhzeW5jX3N0YXJ0ID0gNDgwICsgMywKKwkuaHN5
bmNfZW5kID0gNDgwICsgMyArIDQyLAorCS5odG90YWwgPSA0ODAgKyAzICsgNDIgKyAyLAorCisJ
LnZkaXNwbGF5ID0gMjcyLAorCS52c3luY19zdGFydCA9IDI3MiArIDIsCisJLnZzeW5jX2VuZCA9
IDI3MiArIDIgKyAxMSwKKwkudnRvdGFsID0gMjcyICsgMiArIDExICsgMywKKwkudnJlZnJlc2gg
PSA2MCwKKwkuZmxhZ3MgPSBEUk1fTU9ERV9GTEFHX1BIU1lOQyB8IERSTV9NT0RFX0ZMQUdfUFZT
WU5DLAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGxvZ2ljcGRfdHlwZV8y
OCA9IHsKKwkubW9kZXMgPSAmbG9naWNwZF90eXBlXzI4X21vZGUsCisJLm51bV9tb2RlcyA9IDEs
CisJLmJwYyA9IDgsCisJLnNpemUgPSB7CisJCS53aWR0aCA9IDEwNSwKKwkJLmhlaWdodCA9IDY3
LAorCX0sCisJLmRlbGF5ID0geworCQkucHJlcGFyZSA9IDIwMCwKKwkJLmVuYWJsZSA9IDIwMCwK
KwkJLnVucHJlcGFyZSA9IDIwMCwKKwkJLmRpc2FibGUgPSAyMDAsCisJfSwKKwkuYnVzX2Zvcm1h
dCA9IE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQsCisJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxB
R19ERV9ISUdIIHwgRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVfUE9TRURHRSB8CisJCSAgICAg
RFJNX0JVU19GTEFHX1NZTkNfRFJJVkVfTkVHRURHRSwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcGFuZWxfZGVzYyBtaXRzdWJpc2hpX2FhMDcwbWMwMSA9IHsKIAkubW9kZXMgPSAmbWl0c3Vi
aXNoaV9hYTA3MG1jMDFfbW9kZSwKIAkubnVtX21vZGVzID0gMSwKQEAgLTI5NDgsNiArMjk4Miw5
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHBsYXRmb3JtX29mX21hdGNoW10g
PSB7CiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJsZyxscDEyOXFlIiwKIAkJLmRhdGEgPSAmbGdf
bHAxMjlxZSwKKwl9LCB7CisJCS5jb21wYXRpYmxlID0gImxvZ2ljcGQsdHlwZTI4IiwKKwkJLmRh
dGEgPSAmbG9naWNwZF90eXBlXzI4LAogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAibWl0c3ViaXNo
aSxhYTA3MG1jMDEtY2ExIiwKIAkJLmRhdGEgPSAmbWl0c3ViaXNoaV9hYTA3MG1jMDEsCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
