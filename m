Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22167D9304
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 15:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6BD6E984;
	Wed, 16 Oct 2019 13:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008786E983
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 13:52:15 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id j9so2672222ilr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 06:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ctwff17X5J9r4AVcc5YjcP9yOcK6+mtooPGCu9/hHIw=;
 b=Q9sN6NJ7yXjVyPjRYmv9/r8c83zXiOaLDYonU9DSidTis0lj9oAH6G0iFdixwHXPha
 Zqkc/tnOwQ0MCgdC/Cv2Y7XTtOhpTnWGvb7/YkhEgfEfzMcpq3L/++fZAStZ6Cr61eZU
 45ypKWACn6OAo5A6aFC5RWgbxtF/qwu+3fBsAYxwprvhj3nrfsBwLV4WwyJ3O5ZBbpcx
 bbOnV/qmJFmFLLxoj3vRWl/tNcGZ7UgvcIg0ib/ZVbYox2yRkWjW+zmFUAo8KfaB6m6L
 ovu41oJAtYVX24l7kw5fRpjQTIlTAD8rQOjDxBXgl9QbHvAwNJb91wBS7NYMV1TosVt5
 6DCQ==
X-Gm-Message-State: APjAAAUYm/R1DBlIfPCMpBDMp9D2HWQKvCa8kGOyWJc8RdYSYMBBo6Gj
 VCOkOf1jVRk3nxTaBj1JUmH5b0YB
X-Google-Smtp-Source: APXvYqygyXkntWbd91r/7evKoDfONJS0uRI50cjxLBBfT2mFkyvh6ytGWEsQbsOzZE9Ya9NTMgEkDQ==
X-Received: by 2002:a92:40d9:: with SMTP id d86mr11885733ill.303.1571233934752; 
 Wed, 16 Oct 2019 06:52:14 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id e139sm17227545iof.60.2019.10.16.06.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 06:52:14 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date: Wed, 16 Oct 2019 08:51:46 -0500
Message-Id: <20191016135147.7743-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016135147.7743-1-aford173@gmail.com>
References: <20191016135147.7743-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ctwff17X5J9r4AVcc5YjcP9yOcK6+mtooPGCu9/hHIw=;
 b=A/hzu12BKfaEW8nHGrJjJcG3ppjyfUqRobpjVd8JCm4qVUwN0QQO9FUmdSJauYUm/g
 EBenXGD+2DQyS2Fa17RvoESrYm3vDQWFKzTBDMeJ5vt7KRFqWN/+u6EA4n4oWbjLTzEv
 SyTrTpE9IrmSuroF0F8bRo+ODWxSsJY00QTxE3Kv5Kno97QXGIp7J6gG/u8wBvlyoDdw
 gocqu+ktkP6oCLfBW8Nk0wWiUdmYpvKaVctzmOtORafXKQfFh4Qe4yYu92d1/oRjo6kk
 CHWGce68PvJOL/6KRi6u4894gx4NXRiBgByudZ1CYl5BsTKGm2TESBJuAkHgO6KIdgqk
 VviA==
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

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24gb2YgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9y
IHRoZSBXVkdBIHBhbmVsCkxvZ2ljIFBEIFR5cGUgMjggZGlzcGxheS4KClNpZ25lZC1vZmYtYnk6
IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgotLS0KVjU6ICBSZXBsYWNlIEdQSU9fQUNU
SVZFX0hJR0ggd2l0aCAwIHRvIGZpeCBtYWtlIGR0X2JpbmRpbmdfY2hlY2sgLWsKVjQ6ICBVcGRh
dGUgcGVyIFJvYiBIJ3Mgc3VnZ2VzdGlvbnMgYW5kIGNvcHkgb3RoZXIgcGFuZWwgeWFtbCBleGFt
cGxlIGZyb20gNS40LXJjMQpWMzogIENvcnJlY3QgYnVpbGQgZXJyb3JzIGZyb20gJ21ha2UgZHRf
YmluZGluZ19jaGVjaycKVjI6ICBVc2UgWUFNTCBpbnN0ZWFkIG9mIFRYVCBmb3IgYmluZGluZwoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL2xvZ2ljcGQsdHlwZTI4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9sb2dpY3BkLHR5cGUyOC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAwMC4uMjgzNDI4N2I4ZDg4Ci0tLSAvZGV2L251bGwKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbG9naWNwZCx0eXBl
MjgueWFtbApAQCAtMCwwICsxLDQyIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9k
aXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IExvZ2ljIFBEIFR5cGUg
MjggNC4zIiBXUVZHQSBURlQgTENEIHBhbmVsCisKK21haW50YWluZXJzOgorICAtIEFkYW0gRm9y
ZCA8YWZvcmQxNzNAZ21haWwuY29tPgorCithbGxPZjoKKyAgLSAkcmVmOiBwYW5lbC1jb21tb24u
eWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogbG9naWNwZCx0
eXBlMjgKKworICBwb3dlci1zdXBwbHk6IHRydWUKKyAgZW5hYmxlLWdwaW9zOiB0cnVlCisgIGJh
Y2tsaWdodDogdHJ1ZQorICBwb3J0OiB0cnVlCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUK
KworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBs
Y2QwOiBkaXNwbGF5IHsKKyAgICAgIGNvbXBhdGlibGUgPSAibG9naWNwZCx0eXBlMjgiOworICAg
ICAgZW5hYmxlLWdwaW9zID0gPCZncGlvNSAyNyAwPjsKKyAgICAgIGJhY2tsaWdodCA9IDwmYmFj
a2xpZ2h0PjsKKyAgICAgIHBvcnQgeworICAgICAgICBsY2RfaW46IGVuZHBvaW50IHsKKyAgICAg
ICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRwaV9vdXQ+OworICAgICAgICB9OworICAgICAgfTsK
KyAgICB9OworCisuLi4KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
