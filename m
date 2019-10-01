Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 048C8C4467
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 01:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677A26E8C8;
	Tue,  1 Oct 2019 23:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C898B88FA0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 23:39:42 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q1so52682653ion.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 16:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=58jpN6kWHAdO3tEL+y4lY6rt76msdHq/bsZsGT7F90Q=;
 b=QKpMa1vJY9kEv3LGC2J8ZmLYM0lXu/zT0Za2/9vXVPLFAGmyw6dLGACzriexnVNQXu
 SaEUhz7HLtUL8dLSBPJC/JPJCwVofyh49lDYV/h0wn7Svno90Bb7vZZQK6R724Te6zVn
 n7YZeqWk6u/OfcTIRHIgizsefWirf09Gdiv/o5hr3INoPyQHAxAjA4fDkRpPFby6aDhW
 xQ1eMDWWmENuKF+KeKvQFoPzyFuOVYy8iDVVPODAQRPehmkB3Xr7uhD2o+p8P5z/e4kq
 USchXtlG3Eh6JAoHYgZ8Fy8FWEzpOx2y16ZvCCSbFauvT7MAyRlKlKJPFr2nY8NFbb1V
 CL0g==
X-Gm-Message-State: APjAAAVnZvy6Jd0zQffjSKjykqtxLYWSj4nnz9lk/GRvFMoH78SnP7L+
 K//okSldXvybLitNGsTiwBXdWqFhP6U=
X-Google-Smtp-Source: APXvYqx/Io8WkCb0T45Vregl4/lp6Yar6RAnWh52hAyGEGPoMLqPDMbZySdWTSgeeIhBx7SWJOXZug==
X-Received: by 2002:a6b:b4c7:: with SMTP id d190mr774996iof.209.1569973181556; 
 Tue, 01 Oct 2019 16:39:41 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 16:39:40 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 1/3] drm/panel: simple: Add Logic PD Type 28 display support
Date: Tue,  1 Oct 2019 18:39:18 -0500
Message-Id: <20191001233923.16514-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=58jpN6kWHAdO3tEL+y4lY6rt76msdHq/bsZsGT7F90Q=;
 b=SvSuvufv+gb1Em1YZE/meNqsikAT0bmsrAYxIog97pFs618p0gqm7/afZrcd9pUc33
 5fxADY0uoB818dziQyLsbJ0PoaWJdBqXD007LX4kpdBh+rlYQpKTSkecUrFbmOuchmab
 YJfxmzd2FdhuDAzkRHimZ9xvpg9y/bY74MIQgq5d3uXDPtXfaIbb1QL9wQCz6n6hf6IT
 J9Ng1E8Cf8UWM2bxh8OQUP6yHpZXT9lIy1vdOts7yc52qHM8XB60aSg2jDoFvT+GfSdJ
 X2yJZWJoGLotuCHq0W8w0fAR4ORaz67fnzyRyEKKAfCVhnD4cyJ8TzuceQXvAqNbrj66
 xC6w==
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
NDogIE5vIENoYW5nZQpWMzogIE5vIENoYW5nZQpWMjogIE5vIENoYW5nZQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYwppbmRleCAyOGZhNmJhN2I3NjcuLjhhYmIzMWY4M2ZmYyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwpAQCAtMjA0OCw2ICsyMDQ4LDQwIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtaXRzdWJpc2hpX2FhMDcwbWMwMV9t
b2RlID0gewogCS5mbGFncyA9IERSTV9NT0RFX0ZMQUdfTkhTWU5DIHwgRFJNX01PREVfRkxBR19O
VlNZTkMsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgbG9naWNw
ZF90eXBlXzI4X21vZGUgPSB7CisJLmNsb2NrID0gOTAwMCwKKwkuaGRpc3BsYXkgPSA0ODAsCisJ
LmhzeW5jX3N0YXJ0ID0gNDgwICsgMywKKwkuaHN5bmNfZW5kID0gNDgwICsgMyArIDQyLAorCS5o
dG90YWwgPSA0ODAgKyAzICsgNDIgKyAyLAorCisJLnZkaXNwbGF5ID0gMjcyLAorCS52c3luY19z
dGFydCA9IDI3MiArIDIsCisJLnZzeW5jX2VuZCA9IDI3MiArIDIgKyAxMSwKKwkudnRvdGFsID0g
MjcyICsgMiArIDExICsgMywKKwkudnJlZnJlc2ggPSA2MCwKKwkuZmxhZ3MgPSBEUk1fTU9ERV9G
TEFHX1BIU1lOQyB8IERSTV9NT0RFX0ZMQUdfUFZTWU5DLAorfTsKKworc3RhdGljIGNvbnN0IHN0
cnVjdCBwYW5lbF9kZXNjIGxvZ2ljcGRfdHlwZV8yOCA9IHsKKwkubW9kZXMgPSAmbG9naWNwZF90
eXBlXzI4X21vZGUsCisJLm51bV9tb2RlcyA9IDEsCisJLmJwYyA9IDgsCisJLnNpemUgPSB7CisJ
CS53aWR0aCA9IDEwNSwKKwkJLmhlaWdodCA9IDY3LAorCX0sCisJLmRlbGF5ID0geworCQkucHJl
cGFyZSA9IDIwMCwKKwkJLmVuYWJsZSA9IDIwMCwKKwkJLnVucHJlcGFyZSA9IDIwMCwKKwkJLmRp
c2FibGUgPSAyMDAsCisJfSwKKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdCODg4XzFY
MjQsCisJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwgRFJNX0JVU19GTEFHX1BJ
WERBVEFfRFJJVkVfUE9TRURHRSB8CisJCSAgICAgRFJNX0JVU19GTEFHX1NZTkNfRFJJVkVfTkVH
RURHRSwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBtaXRzdWJpc2hpX2Fh
MDcwbWMwMSA9IHsKIAkubW9kZXMgPSAmbWl0c3ViaXNoaV9hYTA3MG1jMDFfbW9kZSwKIAkubnVt
X21vZGVzID0gMSwKQEAgLTMyNjQsNiArMzI5OCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIHBsYXRmb3JtX29mX21hdGNoW10gPSB7CiAJfSwgewogCQkuY29tcGF0aWJsZSA9
ICJsZyxscDEyOXFlIiwKIAkJLmRhdGEgPSAmbGdfbHAxMjlxZSwKKwl9LCB7CisJCS5jb21wYXRp
YmxlID0gImxvZ2ljcGQsdHlwZTI4IiwKKwkJLmRhdGEgPSAmbG9naWNwZF90eXBlXzI4LAogCX0s
IHsKIAkJLmNvbXBhdGlibGUgPSAibWl0c3ViaXNoaSxhYTA3MG1jMDEtY2ExIiwKIAkJLmRhdGEg
PSAmbWl0c3ViaXNoaV9hYTA3MG1jMDEsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
