Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26EEE52A3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 19:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424726EB19;
	Fri, 25 Oct 2019 17:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F546EB17
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 17:56:49 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id r1so1989419pgj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SvO1A1WodzP09Lr/d61c8nwX2ky0IL4uKfdfDnxUPmw=;
 b=Q+GhWBOngwU2WADkImCvfsot4VDJHOeW2UxcbbH54tn7tWJR+fhtRJTf6S6sxRs/Al
 IoXiIEIqczZ9dSNG4vmHcdkZLDN1Mr6QRqRtadwqA42SmGoDNeRu8D7286JOk3p//h25
 DEotQt1c27DPCbwfr/AYMhDXQz98ljxXz613BZWyIQehF0wJZ7YT4NibjxhXQyTUKMFh
 T9Q9ELdqmhHkP1stm24Qph5U/LrBtqfNoKMfH17ch7iazkEZWxQATVC3Kalodij3Rx0S
 97ZZnajf18AJ99hwuWsxlOdwgshwf2ctLMbM6ae7AAEwyX8IBfu1rbujHS/PgDTld4f2
 EUuw==
X-Gm-Message-State: APjAAAW63XgcnwhNPDBWHdPy+zxwy0zIvDp/ZaTjpsnFnzEPteOYs4NP
 QhLPlBLDwHdPyuK69bGzQkj1HA==
X-Google-Smtp-Source: APXvYqwtMqZQKmJ6DIKbe31ZyiLHeuFErJqjqH6z2emRh6lR+XJ+rba3bVgZ3LyEV+aTG50TN3A3Rg==
X-Received: by 2002:a17:90a:fc93:: with SMTP id
 ci19mr5849047pjb.34.1572026208821; 
 Fri, 25 Oct 2019 10:56:48 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id n15sm2926580pfq.146.2019.10.25.10.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 10:56:48 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v11 1/7] dt-bindings: sun6i-dsi: Document A64 MIPI-DSI
 controller
Date: Fri, 25 Oct 2019 23:26:19 +0530
Message-Id: <20191025175625.8011-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191025175625.8011-1-jagan@amarulasolutions.com>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SvO1A1WodzP09Lr/d61c8nwX2ky0IL4uKfdfDnxUPmw=;
 b=I4XfFKf3RnZY4BUBJ06ANjDE0z1GGx0Afz6XL/cNhEQmqi+MUhs+nXMKueeEqbcYv5
 ivOmHPAV2dOpG6pCDpgF2Vi8AXSwhVaudm6w1kFSZ4SP4AHmdQmdvPl+X9Tas0C6m3A3
 bFxqOPf/VbzeXjotxsF22smaJJ/2ZV1IjNkqM=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1JUEkgRFNJIGNvbnRyb2xsZXIgaW4gQWxsd2lubmVyIEE2NCBpcyBzaW1pbGFyIHRvIEEz
My4KCkJ1dCB1bmxpa2UgQTMzLCBBNjQgZG9lc24ndCBoYXZlIERTSV9TQ0xLIGdhdGluZyBzbyBp
dCBpcyB2YWxpZAp0byBoYXZlIHNlcGFyYXRlIGNvbXBhdGlibGUgZm9yIEE2NCBvbiB0aGUgc2Ft
ZSBkcml2ZXIuCgpEU0lfU0NMSyB1c2VzIG1vZCBjbG9jay1uYW1lcyBvbiBkdC1iaW5kaW5ncywg
c28gdGhlIHNhbWUKaXMgbm90IHJlcXVpcmVkIGZvciBBNjQuCgpPbiB0aGF0IG5vdGUKLSBBNjQg
cmVxdWlyZSBtaW5pbXVtIG9mIDEgY2xvY2sgbGlrZSB0aGUgYnVzIGNsb2NrCi0gQTMzIHJlcXVp
cmUgbWluaW11bSBvZiAyIGNsb2NrcyBsaWtlIGJvdGggYnVzLCBtb2QgY2xvY2tzCgpTbywgdXBk
YXRlIGR0LWJpbmRpbmdzIHNvLXRoYXQgaXQgY2FuIGRvY3VtZW50IGJvdGggQTMzLApBNjQgYmlu
ZGluZ3MgcmVxdWlyZW1lbnRzLgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1h
cnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogLi4uL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEzMS1t
aXBpLWRzaS55YW1sIHwgMjAgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRz
aS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lu
bmVyLHN1bjZpLWEzMS1taXBpLWRzaS55YW1sCmluZGV4IGRhZmMwOTgwYzRmYS4uMmI3MDE2Y2Ez
ODJjIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9hbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHNpLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaS55
YW1sCkBAIC0xNSw3ICsxNSw5IEBAIHByb3BlcnRpZXM6CiAgICIjc2l6ZS1jZWxscyI6IHRydWUK
IAogICBjb21wYXRpYmxlOgotICAgIGNvbnN0OiBhbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHNp
CisgICAgb25lT2Y6CisgICAgICAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHNp
CisgICAgICAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuNTBpLWE2NC1taXBpLWRzaQogCiAgIHJlZzoK
ICAgICBtYXhJdGVtczogMQpAQCAtMjQsNiArMjYsOCBAQCBwcm9wZXJ0aWVzOgogICAgIG1heEl0
ZW1zOiAxCiAKICAgY2xvY2tzOgorICAgIG1pbkl0ZW1zOiAxCisgICAgbWF4SXRlbXM6IDIKICAg
ICBpdGVtczoKICAgICAgIC0gZGVzY3JpcHRpb246IEJ1cyBDbG9jawogICAgICAgLSBkZXNjcmlw
dGlvbjogTW9kdWxlIENsb2NrCkBAIC02MywxMyArNjcsMjUgQEAgcmVxdWlyZWQ6CiAgIC0gcmVn
CiAgIC0gaW50ZXJydXB0cwogICAtIGNsb2NrcwotICAtIGNsb2NrLW5hbWVzCiAgIC0gcGh5cwog
ICAtIHBoeS1uYW1lcwogICAtIHJlc2V0cwogICAtIHZjYy1kc2ktc3VwcGx5CiAgIC0gcG9ydAog
CithbGxPZjoKKyAgLSBpZjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgICBjb21wYXRpYmxl
OgorICAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgICBjb25zdDogYWxsd2lubmVyLHN1
bjZpLWEzMS1taXBpLWRzaQorICAgICAgdGhlbjoKKyAgICAgICAgcHJvcGVydGllczoKKyAgICAg
ICAgICBjbG9ja3M6CisgICAgICAgICAgICBtaW5JdGVtczogMgorICAgICAgICByZXF1aXJlZDoK
KyAgICAgICAgICAtIGNsb2NrLW5hbWVzCisKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQog
CiBleGFtcGxlczoKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
