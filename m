Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB4BE4C9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 20:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A926EEED;
	Wed, 25 Sep 2019 18:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6DA6EEF2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 18:42:51 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id j4so1356422iog.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 11:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TlBz3qIS+SsSa9e31MzD37WA3jnWQII7/YaRfP4QoxA=;
 b=Q1Eyc3gb5pMTla9XPRQcEP1ineATI77dOhvRew+VUaHOF8evxd9rORtiUjnt9Sea0f
 UYaa4n1aJgcoN0JFlIgKDKyYafTUuK98N6CtPcp4/Bm1o7unkqWFb8C/5XVJL61Y52wA
 jG1qfE2sXiMKSD2gWjwG//DKhtuo/p0c4ByZo9Mg0SZMFqFdTiwQo7jFxJVk07nF0eQF
 pTC3O0XIoaoS2RfawxzONHsI+g576A8FecUqHLBCDJHF3rligdV0iNoZMjm+yaTAVVBl
 vz6oXQwxRpVLUkMMlYQGzUvSRRH7JTaTBaCptGqlPRGk2id9uT2JVIUMRlH8sIZ8Dmnd
 Lxvg==
X-Gm-Message-State: APjAAAViJtmxN//2Fl6gyr1JqnhpjS06dFPLT/Yd/IXxPFQ0QtGtj3g8
 3DIYKMuKqEShNn37HcqKLEC6Gau2EdM=
X-Google-Smtp-Source: APXvYqyWcbpkHZhyO2HSgyh99GMG9XDCNmg1b/77oJptfWakBsJXv7WLdgEZwob3RcTKaT6HbwJRhQ==
X-Received: by 2002:a05:6602:1ce:: with SMTP id
 w14mr915623iot.137.1569436970815; 
 Wed, 25 Sep 2019 11:42:50 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id q17sm337511ile.5.2019.09.25.11.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 11:42:49 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 1/3] drm/panel: simple: Add Logic PD Type 28 display support
Date: Wed, 25 Sep 2019 13:42:36 -0500
Message-Id: <20190925184239.22330-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TlBz3qIS+SsSa9e31MzD37WA3jnWQII7/YaRfP4QoxA=;
 b=kZ+Ybj30bvqckN6rb/SACnDIb4xG59DbEkq3eHDObPzpjFkXjVVFMUQBwYc1kAbkeE
 Kgh0+IxBjigbjgM6B7AbBXRE6oy7WhHs36DHJYR99VCaHljp3LGe5eFyAi7GTLRQPdvd
 L0u0XMSneeu6M3IU9vQQbLcwTh/ZL/gPTpUtVn+XY+OPZixePvJ0aGgYWiN3iIKWeU8o
 jwytacPXg2gu7mC2rzxiY/QieHd4BPakPmpRhNy+KAb4ufMWSjcUj+ujEBPA/MfepyFV
 hcPG4+pjU2nc1aJBZI31/DaoIo2WbWC1zOOQH0SiQA5100AhuJ8QaLpAYhz11rvYZ0dO
 x2ug==
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
 Adam Ford <aford173@gmail.com>
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
MzogIE5vIGNoYW5nZQpWMjogIE5vIGNoYW5nZQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1w
bGUuYwppbmRleCAyOGZhNmJhN2I3NjcuLjhhYmIzMWY4M2ZmYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1zaW1wbGUuYwpAQCAtMjA0OCw2ICsyMDQ4LDQwIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtaXRzdWJpc2hpX2FhMDcwbWMwMV9tb2RlID0gewogCS5mbGFn
cyA9IERSTV9NT0RFX0ZMQUdfTkhTWU5DIHwgRFJNX01PREVfRkxBR19OVlNZTkMsCiB9OwogCitz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgbG9naWNwZF90eXBlXzI4X21vZGUg
PSB7CisJLmNsb2NrID0gOTAwMCwKKwkuaGRpc3BsYXkgPSA0ODAsCisJLmhzeW5jX3N0YXJ0ID0g
NDgwICsgMywKKwkuaHN5bmNfZW5kID0gNDgwICsgMyArIDQyLAorCS5odG90YWwgPSA0ODAgKyAz
ICsgNDIgKyAyLAorCisJLnZkaXNwbGF5ID0gMjcyLAorCS52c3luY19zdGFydCA9IDI3MiArIDIs
CisJLnZzeW5jX2VuZCA9IDI3MiArIDIgKyAxMSwKKwkudnRvdGFsID0gMjcyICsgMiArIDExICsg
MywKKwkudnJlZnJlc2ggPSA2MCwKKwkuZmxhZ3MgPSBEUk1fTU9ERV9GTEFHX1BIU1lOQyB8IERS
TV9NT0RFX0ZMQUdfUFZTWU5DLAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNj
IGxvZ2ljcGRfdHlwZV8yOCA9IHsKKwkubW9kZXMgPSAmbG9naWNwZF90eXBlXzI4X21vZGUsCisJ
Lm51bV9tb2RlcyA9IDEsCisJLmJwYyA9IDgsCisJLnNpemUgPSB7CisJCS53aWR0aCA9IDEwNSwK
KwkJLmhlaWdodCA9IDY3LAorCX0sCisJLmRlbGF5ID0geworCQkucHJlcGFyZSA9IDIwMCwKKwkJ
LmVuYWJsZSA9IDIwMCwKKwkJLnVucHJlcGFyZSA9IDIwMCwKKwkJLmRpc2FibGUgPSAyMDAsCisJ
fSwKKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQsCisJLmJ1c19mbGFn
cyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwgRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVfUE9T
RURHRSB8CisJCSAgICAgRFJNX0JVU19GTEFHX1NZTkNfRFJJVkVfTkVHRURHRSwKK307CisKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBtaXRzdWJpc2hpX2FhMDcwbWMwMSA9IHsKIAku
bW9kZXMgPSAmbWl0c3ViaXNoaV9hYTA3MG1jMDFfbW9kZSwKIAkubnVtX21vZGVzID0gMSwKQEAg
LTMyNjQsNiArMzI5OCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHBsYXRm
b3JtX29mX21hdGNoW10gPSB7CiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJsZyxscDEyOXFlIiwK
IAkJLmRhdGEgPSAmbGdfbHAxMjlxZSwKKwl9LCB7CisJCS5jb21wYXRpYmxlID0gImxvZ2ljcGQs
dHlwZTI4IiwKKwkJLmRhdGEgPSAmbG9naWNwZF90eXBlXzI4LAogCX0sIHsKIAkJLmNvbXBhdGli
bGUgPSAibWl0c3ViaXNoaSxhYTA3MG1jMDEtY2ExIiwKIAkJLmRhdGEgPSAmbWl0c3ViaXNoaV9h
YTA3MG1jMDEsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
