Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23146C4463
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 01:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83436E8C3;
	Tue,  1 Oct 2019 23:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE8B8913B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 23:39:44 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id a1so52662172ioc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 16:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RRxLLSLdYwPdwhaO14RiyNJQD0CnUxdvg/CobR3GW5Q=;
 b=hkspZTpk3WClf6XVwpZNIOAAZC6rLb02R4JaFw64jmHaF2E+sy8GqCzXDqPg3CV4KU
 Cnioh5SzV4dUtsTLhtG64QDUx0l5O4SMM9Qzb9eb7YuPxIlBnt1Tc24y+W68llGw+DOO
 +kxnQLrYkiP6ajhIDm/PdeeLDaaJ51K9MGSKMtxFxINiJITw/H3nMkJgWNU/f3CsmclG
 XXh3hnhJIjPhznHa3XmT1K7QMRejaWpHq3E6hCWRTA/vAREGvs6ty0XiUapBxra/aPMy
 kYqhNRPmmzYSAt19tBGKH5eBUbRfG1/TRZTauJcDPEdEDNwibrNsJovL3FqaV56zAMqd
 7OlA==
X-Gm-Message-State: APjAAAWJAvM7xCmsKQnm/ZzovV8lDTcuKO+SNuCkBn2JNwoEbsTq+g5P
 8k5L3ziGMGl3KSpSNpyF1RQpS3bPV6s=
X-Google-Smtp-Source: APXvYqwk7qlO0PNhrZR3WgJgT8SF3Byi9/aFmXFt4aobfTcW2u9plJ0vscAA877Q6XRqnQwTtZy8Tg==
X-Received: by 2002:a5d:88d1:: with SMTP id i17mr771093iol.235.1569973183086; 
 Tue, 01 Oct 2019 16:39:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 16:39:42 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date: Tue,  1 Oct 2019 18:39:19 -0500
Message-Id: <20191001233923.16514-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001233923.16514-1-aford173@gmail.com>
References: <20191001233923.16514-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RRxLLSLdYwPdwhaO14RiyNJQD0CnUxdvg/CobR3GW5Q=;
 b=YWLeJfkzMxoxnKC9S2IDx/ImKJyQgItw4ogl4KTAYntuzKeBUpp1ELZC+jHlp/V/Ab
 +hEnKJf55bl4VmxnOu51FJ1WJZlxtwBf8BDeKtndV3efHggQYfppqdsn9erursI+yECl
 Isb/zG9H9P7dHHKcdri6UFxJ+teXY2Jiijg15W3KC+7XZXqkpQ5FFtkSNFhS7Kk4YO9V
 I+bAYC31vJL5q3vAtBmq+2G3fyQYNUNmNQBM+oeCd2JzVYy6oNS2HOeK7sk/W2irWE9z
 9t4PpGKvHvXDdZgDptLb+VDyeO+LArU35DFD2i5Tz3zkwuiDazMSC8MmG26ZKTeOplPg
 dGnQ==
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
