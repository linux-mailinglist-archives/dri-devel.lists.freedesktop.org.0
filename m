Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B756521B0B2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35CF6EBB4;
	Fri, 10 Jul 2020 07:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594ED6EA7D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b6so2487108wrs.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dcu4SndGV5Tss4rBZKTNWEr/Y8nrFq0nn6EDq7ivZDo=;
 b=JeUNWsNgXbbHWdzNwV8DR/fxWrHOaJhAiPJovG4vKr8ythoAoJ08L4/HJE3vSZoGyg
 miP1i8jMb3TBa58bPs9dzrAL9BNc6hdx6URpUvU0/V1NZ2L/Oe513SIgicQydG031DpV
 CpZ/mSDZmlpHwRlXHzfAjVcVivLZVX5XZupXuQvFwXbR8jYz39D/si/Vl6GhLR5NVJ8G
 9y7GrslfmI9yzpEXDIYyQWBcqlGPkHBHT28bFXixZuEA4fuUeYFvJgOqoPP6DvC6ylhG
 FW9SymR3OTCJ69ldpO8It/zlgwY1BnZlDZS8IQzxxEmfWM7qVnjiJlTOUzOhugB1jhO6
 BFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dcu4SndGV5Tss4rBZKTNWEr/Y8nrFq0nn6EDq7ivZDo=;
 b=PjsdLx3hmdbF+QrUAhpD0Jn52mlRZaOjIldyWEE3dYXnYBD2fx6xOMEtFC31Am4InU
 r4G1dFgYhDqIBTwWvtqyXnA/hwJ3ZSzy90aq0v0DZg6Fj/EoiChV7kj215sM95MLV5pw
 cgKeM7IdQfhnp2Af7Pec8UdThANAcOmyM/tUIGauVd9/1EZw8Srk8XYkn/XX4tR6Tnr7
 GcBncHRw/urUoOKWVnv7iJD+eS1clRRsa3ous5PBn8qbKEXP2K9wE1PvTCn9i3Z3yc88
 CEZaT8WXtxCfOtb/lYoiYyIgZ9TjOcf2jW0KcVI5aU0PUPcof3C+7woAjzerrZVb0QfW
 5SKw==
X-Gm-Message-State: AOAM53027vw21NWTK8LK5zfvaCffHtZ/2Tp0UvzgyF2v2CeQwMOf9iRR
 VzMYPYCawmgQ+X7nqUnhuwE=
X-Google-Smtp-Source: ABdhPJzpkoGDkREmIoP1jIdxUD7tsYkEzzBcGj/mODktAXM4oPSJ2LpVO3mDm+oHE19inD4vm1bLzg==
X-Received: by 2002:a5d:66ca:: with SMTP id k10mr52588436wrw.244.1594303419826; 
 Thu, 09 Jul 2020 07:03:39 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:39 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 11/14] arm64: defconfig: Enable devfreq cooling device
Date: Thu,  9 Jul 2020 16:03:19 +0200
Message-Id: <20200709140322.131320-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709140322.131320-1-peron.clem@gmail.com>
References: <20200709140322.131320-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
ZWZjb25maWcKaW5kZXggODgzZThiYWNlM2VkLi4xYjdmOWZmZGMzMTQgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKKysrIGIvYXJjaC9hcm02NC9jb25maWdzL2RlZmNv
bmZpZwpAQCAtNTAxLDYgKzUwMSw3IEBAIENPTkZJR19TRU5TT1JTX0lOQTJYWD1tCiBDT05GSUdf
U0VOU09SU19JTkEzMjIxPW0KIENPTkZJR19USEVSTUFMX0dPVl9QT1dFUl9BTExPQ0FUT1I9eQog
Q09ORklHX0NQVV9USEVSTUFMPXkKK0NPTkZJR19ERVZGUkVRX1RIRVJNQUw9eQogQ09ORklHX1RI
RVJNQUxfRU1VTEFUSU9OPXkKIENPTkZJR19RT1JJUV9USEVSTUFMPW0KIENPTkZJR19TVU44SV9U
SEVSTUFMPXkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
