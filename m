Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D5DD92FD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 15:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621016E0B7;
	Wed, 16 Oct 2019 13:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B236E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 13:52:14 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id n26so53809914ioj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 06:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=utCDVgVbZ5WjSdZrf9lDYLAzWEhwnZ24Zw+SLge2X/Q=;
 b=b8g4G7ASx9xOukfcRxiSTU90gnuvQjYniP4XZ1brzIxWA2Nmtg8LFP4dYJNTJLYVO2
 KPsXMJBytLk/hrdichGOfiERA32iaaXSWG5fLHRBVhb3rZdWdGfDh2htSWX9pt2zMgpZ
 slFTzYbt2jBUH7Cco7+WhMiGSa9AZX1s8u1kK6rG+ug03JYpDuVu+dEIbZHi1rjTCOCC
 hfWyU0LERK2ihPHGL/NSV74QHVWe6NNcI30Ulw8r5iMasqNqk7usIJYCqSnfaf2NWj8P
 1TQvrB7ZoatrOzyXKeT7NuJ837oPYuF/uUZWwJuM9ZeDK4S2NBmpN4vT18tJrWbhAA6h
 5D+A==
X-Gm-Message-State: APjAAAWfpX/Bp/pjEoP/cKT7hX3BByRz9Uv8NanDR0CTHcr842kLcsrn
 F8GBLAWDSN2wdi6BmgCOD7l8aIqF
X-Google-Smtp-Source: APXvYqxKHHiKucNI0gkNKLs3b54iLE/Y1m78a8dY5DI5Q5i+Vkenqm2lDHbWmnE7zIvO4FHH3PtqIQ==
X-Received: by 2002:a5d:9c4b:: with SMTP id 11mr7571501iof.240.1571233933273; 
 Wed, 16 Oct 2019 06:52:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id e139sm17227545iof.60.2019.10.16.06.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 06:52:12 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 1/3] drm/panel: simple: Add Logic PD Type 28 display support
Date: Wed, 16 Oct 2019 08:51:45 -0500
Message-Id: <20191016135147.7743-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=utCDVgVbZ5WjSdZrf9lDYLAzWEhwnZ24Zw+SLge2X/Q=;
 b=NTm6zlZ32eSZNxQ5TRo6LYWQC7jJJNF3MjYWWedy26p/7IPFYjdWNNasmcSOJho1Na
 YKmafUu8hzR21aTYGewjdH9rMvGXw5r0JNn5IjYFdDAnbJTjtnd9dIcF1Mde0aaFI69h
 g9CppfLaqK77qmlX7dQCL6yLpwD/ALftKjB8Y/r+qW9yt9rAiwDtWNPEiQPuPIUsUe+J
 uwE3NMuUIWY6Th0Qjwz21Ox6PIBy77jxAYJzwtRMGFI/vB+gOFeFnxrSk/cz4kjrjZ7P
 y8UWu+9w90IRhrPyTplF+jZQxB6c4pWNHyxu+vGMvcpUsFVlZVMop3/UPkphYRI49TOu
 Rltg==
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
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
NTogIE5vIENoYW5nZQpWNDogIE5vIENoYW5nZQpWMzogIE5vIENoYW5nZQpWMjogIE5vIENoYW5n
ZQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwppbmRleCA1ZDQ4NzY4NmQyNWMuLjcy
ZjY5NzA5ZjM0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBs
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwpAQCAtMjA2MSw2
ICsyMDYxLDQwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtaXRzdWJp
c2hpX2FhMDcwbWMwMV9tb2RlID0gewogCS5mbGFncyA9IERSTV9NT0RFX0ZMQUdfTkhTWU5DIHwg
RFJNX01PREVfRkxBR19OVlNZTkMsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgbG9naWNwZF90eXBlXzI4X21vZGUgPSB7CisJLmNsb2NrID0gOTAwMCwKKwkuaGRp
c3BsYXkgPSA0ODAsCisJLmhzeW5jX3N0YXJ0ID0gNDgwICsgMywKKwkuaHN5bmNfZW5kID0gNDgw
ICsgMyArIDQyLAorCS5odG90YWwgPSA0ODAgKyAzICsgNDIgKyAyLAorCisJLnZkaXNwbGF5ID0g
MjcyLAorCS52c3luY19zdGFydCA9IDI3MiArIDIsCisJLnZzeW5jX2VuZCA9IDI3MiArIDIgKyAx
MSwKKwkudnRvdGFsID0gMjcyICsgMiArIDExICsgMywKKwkudnJlZnJlc2ggPSA2MCwKKwkuZmxh
Z3MgPSBEUk1fTU9ERV9GTEFHX1BIU1lOQyB8IERSTV9NT0RFX0ZMQUdfUFZTWU5DLAorfTsKKwor
c3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGxvZ2ljcGRfdHlwZV8yOCA9IHsKKwkubW9k
ZXMgPSAmbG9naWNwZF90eXBlXzI4X21vZGUsCisJLm51bV9tb2RlcyA9IDEsCisJLmJwYyA9IDgs
CisJLnNpemUgPSB7CisJCS53aWR0aCA9IDEwNSwKKwkJLmhlaWdodCA9IDY3LAorCX0sCisJLmRl
bGF5ID0geworCQkucHJlcGFyZSA9IDIwMCwKKwkJLmVuYWJsZSA9IDIwMCwKKwkJLnVucHJlcGFy
ZSA9IDIwMCwKKwkJLmRpc2FibGUgPSAyMDAsCisJfSwKKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JV
U19GTVRfUkdCODg4XzFYMjQsCisJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwg
RFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVfUE9TRURHRSB8CisJCSAgICAgRFJNX0JVU19GTEFH
X1NZTkNfRFJJVkVfTkVHRURHRSwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVz
YyBtaXRzdWJpc2hpX2FhMDcwbWMwMSA9IHsKIAkubW9kZXMgPSAmbWl0c3ViaXNoaV9hYTA3MG1j
MDFfbW9kZSwKIAkubnVtX21vZGVzID0gMSwKQEAgLTMyODcsNiArMzMyMSw5IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHBsYXRmb3JtX29mX21hdGNoW10gPSB7CiAJfSwgewog
CQkuY29tcGF0aWJsZSA9ICJsZyxscDEyOXFlIiwKIAkJLmRhdGEgPSAmbGdfbHAxMjlxZSwKKwl9
LCB7CisJCS5jb21wYXRpYmxlID0gImxvZ2ljcGQsdHlwZTI4IiwKKwkJLmRhdGEgPSAmbG9naWNw
ZF90eXBlXzI4LAogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAibWl0c3ViaXNoaSxhYTA3MG1jMDEt
Y2ExIiwKIAkJLmRhdGEgPSAmbWl0c3ViaXNoaV9hYTA3MG1jMDEsCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
