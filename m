Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6E7C4466
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 01:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717D16E8C9;
	Tue,  1 Oct 2019 23:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B463897B4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 23:39:47 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id b136so52606812iof.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 16:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=58jpN6kWHAdO3tEL+y4lY6rt76msdHq/bsZsGT7F90Q=;
 b=r1jyIPQvjcPZMyNuIDZbJ9OkT8zUcZN6R1e6eb750fZLe8iCs3QWVr51q6sP/sPidW
 K7InWLzHrs5FMhxdPKIHLFdTSRq06WZGyE5LKn1gZ+80xBtoMIbr59DCHe85ZFeIghqE
 6rtTBpvJprD5B9oK5mczgSDvGtkZQfX0oUZXxaJYCgKZStIFgYmCPfBxIAyGoYUdMhIP
 tXKQQd82QBLFu6aWPg07Y1Rn6LmJCvQoGkJp/Ub7kKHv1icl+zP+ucCMT0UWXXy/c/sa
 qiBx1G30ZoPrmGi16zOE8RblJRNm1+eYYowQxy6dCdZaUITX3QW6ePD136pHoEDwLHXl
 6oUg==
X-Gm-Message-State: APjAAAWutg1t7xuo6mwicZfzuZCTtBWwKrtkW4fuvaSzLSBqHdO/nmKf
 EGhY6eLq1FUEfv1uGgenqaJjYOv1WBE=
X-Google-Smtp-Source: APXvYqyd4i/jvyuu09AoKqKS7BZSL5Lx2vlwLs47lwfq1WhHNEnVsaDlccU3YOT9PlOvIEsQs+40Fw==
X-Received: by 2002:a92:451:: with SMTP id 78mr783955ile.69.1569973186352;
 Tue, 01 Oct 2019 16:39:46 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 16:39:45 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 1/3] drm/panel: simple: Add Logic PD Type 28 display support
Date: Tue,  1 Oct 2019 18:39:21 -0500
Message-Id: <20191001233923.16514-4-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001233923.16514-1-aford173@gmail.com>
References: <20191001233923.16514-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=58jpN6kWHAdO3tEL+y4lY6rt76msdHq/bsZsGT7F90Q=;
 b=njXpQi34vfhyh7iwO6rahe62QnSo0M1oAxex8bd0k/1t+S4y9tOwc3nDjlyR41jcQY
 XzCzCe/pzboMuQb2mFg8LIaxjTt1CAFPq5KOLE90T0Gh1sl8u1ZWKDMPRoF/YW/G2zgg
 HN48O/ipUd8sMGNByVAya2gQD6BUimRlQA6GS/SkfvVblhb0ZtXcJXwqJRC+eDihxl6p
 hEjXbBwUAyDUUT/tB+0w83+6pPf1wi+6BhSm0rX0rmZX4VwHUZLUFC/G+yxWOubF4tUz
 XKV2SIjUukvOW1nhyg13TZEwFIYxtJKze32lmlXDmURTXGLCA0O7+SN1GH37yk09PQMc
 SJJA==
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
