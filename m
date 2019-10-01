Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3200C446A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 01:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8E36E8CC;
	Tue,  1 Oct 2019 23:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B776E8C5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 23:39:49 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id b136so52606941iof.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 16:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RRxLLSLdYwPdwhaO14RiyNJQD0CnUxdvg/CobR3GW5Q=;
 b=LiWPKNLXSOqB5k6J9NPQ7plK+vTLqDe0zjz2iOpLcvz/X/LxHrxm4G3dMI9DaPHezx
 hzFivKQU8VhXPNl9YQ89ZxqgPAyTieCBoz5hdxs36jIdlJmYwbT+zs0cKJMb5MuHLsi9
 sTDj4Tg1BoArZCzq60/CS7tQTFsxRKy+2Vcef6eRp6KHUP1j2LzZuhv8yRBf/zQNweNK
 0OZIcjLlBLLynmTSM6esUvIINErw7LTb/8nfsO7ZNnUe4u5GrT30JiXuvyBDEmzTuKnv
 i3oStiz020Xrp21fd0J0lHMbuCaX1TjLh3dgRX7FuJGtl6Q1BXxRSc7kxKPQUo/4FTgm
 c+Bw==
X-Gm-Message-State: APjAAAWtVnyGCVTk7a18std+44HyXjReK8CgPgnTVSQvDX8EPb7mJSG5
 qYqst2Mop5VD4bGMyrj4HfwsoK7xsPo=
X-Google-Smtp-Source: APXvYqw/0RbXnF1zpAYBmsTItdefmNQwLFLdY/TiQ+O49LmKTlWPdXKhCB6f8Yd31d8q+MoClv92Bw==
X-Received: by 2002:a92:502:: with SMTP id q2mr750564ile.141.1569973187916;
 Tue, 01 Oct 2019 16:39:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 16:39:47 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date: Tue,  1 Oct 2019 18:39:22 -0500
Message-Id: <20191001233923.16514-5-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001233923.16514-1-aford173@gmail.com>
References: <20191001233923.16514-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RRxLLSLdYwPdwhaO14RiyNJQD0CnUxdvg/CobR3GW5Q=;
 b=d5sf5a4QPval49H/yPG+oZ218/LNFsYS2BqSXjPtJQZVXLxwOE9eFp/e1Itrk/nsMN
 6xHr7klTiWaAx5ZwbkIYHMMhDJ1zq7JlFCsf81h+mhmCcKKAbOdGj3Pika8UsnR5O7dq
 ryOg5PveRi69RaDQogmV3+UoaAyq5ii++GhDdQcyXrQADLH/3kOIGk5P0/6TgjxoHQo+
 XIdRmIgV6R8l+Gnf7ntm5ffCrTiBcajCjsuKXcwTQC1pl7Er6sjXvMJ7iNaP9nZc3XTi
 cIFFv06rhM1wQB8sozAiNHN1ssw+inHRC4J4fieg4fzJOwVRY+Ze1FD7rk5cy0h5zzII
 w3Mg==
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

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24gb2YgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9y
IHRoZSBXVkdBIHBhbmVsCkxvZ2ljIFBEIFR5cGUgMjggZGlzcGxheS4KClNpZ25lZC1vZmYtYnk6
IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgotLS0KVjQ6ICBVcGRhdGUgcGVyIFJvYiBI
J3Mgc3VnZ2VzdGlvbnMgYW5kIGNvcHkgb3RoZXIgcGFuZWwgeWFtbCBleGFtcGxlIGZyb20gNS40
LXJjMQpWMzogIENvcnJlY3QgYnVpbGQgZXJyb3JzIGZyb20gJ21ha2UgZHRfYmluZGluZ19jaGVj
aycKVjI6ICBVc2UgWUFNTCBpbnN0ZWFkIG9mIFRYVCBmb3IgYmluZGluZwoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQs
dHlwZTI4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9sb2dpY3BkLHR5cGUyOC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uZTJjNjJlOGYxZGI0Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbG9naWNwZCx0eXBlMjgueWFtbApAQCAt
MCwwICsxLDQyIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCislWUFNTCAx
LjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVs
L2xvZ2ljcGQsdHlwZTI4LnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IExvZ2ljIFBEIFR5cGUgMjggNC4zIiBXUVZH
QSBURlQgTENEIHBhbmVsCisKK21haW50YWluZXJzOgorICAtIEFkYW0gRm9yZCA8YWZvcmQxNzNA
Z21haWwuY29tPgorCithbGxPZjoKKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKKworcHJv
cGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogbG9naWNwZCx0eXBlMjgKKworICBw
b3dlci1zdXBwbHk6IHRydWUKKyAgZW5hYmxlLWdwaW9zOiB0cnVlCisgIGJhY2tsaWdodDogdHJ1
ZQorICBwb3J0OiB0cnVlCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKworYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBsY2QwOiBkaXNwbGF5
IHsKKyAgICAgIGNvbXBhdGlibGUgPSAibG9naWNwZCx0eXBlMjgiOworICAgICAgZW5hYmxlLWdw
aW9zID0gPCZncGlvNSAyNyBHUElPX0FDVElWRV9ISUdIPjsKKyAgICAgIGJhY2tsaWdodCA9IDwm
YmFja2xpZ2h0PjsKKyAgICAgIHBvcnQgeworICAgICAgICBsY2RfaW46IGVuZHBvaW50IHsKKyAg
ICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRwaV9vdXQ+OworICAgICAgICB9OworICAgICAg
fTsKKyAgICB9OworCisuLi4KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
