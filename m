Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D9121E903
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305FC6E937;
	Tue, 14 Jul 2020 07:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCDA6EBC4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:26:07 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id g75so5352669wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vGrB4C2EapNRMSvNvzwinnqh7atFRSmJOU/XyLZhEhE=;
 b=O1bK2s+zy853RT/ldbRQeQA6LdWuBhgSywFH2AM+GjDWIiL9877PrIij4rkSKT+nIS
 TtvHoE9PJw/P6Od0Y2hYvgOMFfsf2im2F/hugBuMcV6/r+D8wQ99PN2euw6FJyf3eThP
 nW73K55Q18h7nP3S3TrBJEUdMivbz+G9BRZpRBo3o5JckFoDwE72nNB8tmXWVHkAXqDq
 la4tKeE+XCIXvMVA39vB+V3u9XFJoJz+DBpehzv2UT0xd6pEaILDDDvI0iIBfahkmtSS
 iNq1SxNPQB343OMffoHxNUZpx8IpcXPohLPY2TJovuxSop4UtCcVQYJlDDVhlykiLoOo
 h3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vGrB4C2EapNRMSvNvzwinnqh7atFRSmJOU/XyLZhEhE=;
 b=IYg6/TZf0/btNQeXv0kEj2OCGwZzh+9VZXrTXSb2aP7BJaSXYzTA4/dvnM5pYnCSNM
 kdwMfR/24qZRkZOIyK2yLfcuPtCs3RDgDgwB6+uvw6X16bTJnVkB6OfWHXrNDsrWe7cy
 J07MK36U2pzBEzQsV1DB7njDnK4h+coj7uXsjE26w1qF/xaUo88qZeOIQtp7SfHeSZ9R
 lcu9rvp//R9jdQeMy4Mr+JcVT35N1frWtfgMhb7npXnqpU3CizNVj/tWXzqdRZGAyAMR
 uOWGxctFUjH2vU2SsZH0+nrcQV8gJ/S7u8o47jxa1EBYy4Qf6h8cuCad8RZlrTkjLdVt
 sujw==
X-Gm-Message-State: AOAM5307LgWSnsxKaQ3Q4fIupI6qDuf1I9rz1isosExnEx2Jh2Y2NQp+
 dJs6lc7PFQ2piVR1lpcm/SU=
X-Google-Smtp-Source: ABdhPJzggwLJmzAeo25TWwoScYbm5Sywfa4ImakZ7GZScH3ClsljY2PBANXZhZNdablTFl1UBIiFXQ==
X-Received: by 2002:a1c:23d0:: with SMTP id j199mr4521494wmj.12.1594373165681; 
 Fri, 10 Jul 2020 02:26:05 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id h23sm8179559wmb.3.2020.07.10.02.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:26:04 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 11/14] arm64: defconfig: Enable devfreq cooling device
Date: Fri, 10 Jul 2020 11:25:45 +0200
Message-Id: <20200710092548.316054-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710092548.316054-1-peron.clem@gmail.com>
References: <20200710092548.316054-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGV2ZnJlcSBjb29saW5nIGRldmljZSBmcmFtZXdvcmsgaXMgdXNlZCBpbiBQYW5mcm9zdAp0byB0
aHJvdHRsZSBHUFUgaW4gb3JkZXIgdG8gcmVndWxhdGUgaXRzIHRlbXBlcmF0dXJlLgoKRW5hYmxl
IHRoaXMgZHJpdmVyIGZvciBBUk02NCBTb0MuCgpSZXZpZXdlZC1ieTogQWx5c3NhIFJvc2Vuendl
aWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogYXJjaC9hcm02NC9jb25maWdz
L2RlZmNvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyBiL2FyY2gvYXJtNjQvY29uZmlncy9k
ZWZjb25maWcKaW5kZXggODk1MzhkOWUzOWU1Li44YTI5NWJjYjRkZDMgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKKysrIGIvYXJjaC9hcm02NC9jb25maWdzL2RlZmNv
bmZpZwpAQCAtNTA0LDYgKzUwNCw3IEBAIENPTkZJR19TRU5TT1JTX0lOQTJYWD1tCiBDT05GSUdf
U0VOU09SU19JTkEzMjIxPW0KIENPTkZJR19USEVSTUFMX0dPVl9QT1dFUl9BTExPQ0FUT1I9eQog
Q09ORklHX0NQVV9USEVSTUFMPXkKK0NPTkZJR19ERVZGUkVRX1RIRVJNQUw9eQogQ09ORklHX1RI
RVJNQUxfRU1VTEFUSU9OPXkKIENPTkZJR19RT1JJUV9USEVSTUFMPW0KIENPTkZJR19TVU44SV9U
SEVSTUFMPXkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
