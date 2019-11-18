Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C464F101B15
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF026EBE2;
	Tue, 19 Nov 2019 08:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2FF6E822
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:35 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id q28so14894425lfa.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q8P9xtI8xhHcaTs4uKBwzdrpTHySQaMQUQDsdsZDaTE=;
 b=FC1XlKrp8lyeJXZVbXK2/72hIfJvtKSOyFYxyyTDxwzD26FgtXH+WMMb4tlqz9cjWS
 ur78k/bCV17Du5PTGoAQrIXTwlbCBIbVbAtsSM4jpWDBPSdRsOQlDPcpwteK13fNF3QK
 AZWTWpLpFUDRMmurd2CeTwECcAr2hdrmWTNi8EIBr0ys9kFCRA4iKUSaPRZgp3wrkPmW
 2MqThcCCccM2yQutf9z+U7adZXpQyAwSZUF1HbtmURAlW/FTmlcNeoocx7wOAI5AvQFL
 VjpVIVawhm1OQ/PsBhU31MCRtPeg3iBOFRQOAhue0T5Wbp7iee7wMTy3msyYG89GNJSG
 dScA==
X-Gm-Message-State: APjAAAVWJq+BZ6YswWp6TO1VP97TsAvEJ6SI6K1Gx4FM7ry3pBsSR0OL
 2oxU4yAX4nwEZYfhGCH4nQ8=
X-Google-Smtp-Source: APXvYqxpciZO+2bTdRPuV7Eo6xCsKKBjE1Eln4PJ66P/qZe/XlNohG1C908ZR44WD7VDsuZFLUeTUg==
X-Received: by 2002:a19:9116:: with SMTP id t22mr787720lfd.99.1574107534043;
 Mon, 18 Nov 2019 12:05:34 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:33 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 04/29] dt-bindings: memory: tegra30: emc: Document new
 interconnect property
Date: Mon, 18 Nov 2019 23:02:22 +0300
Message-Id: <20191118200247.3567-5-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q8P9xtI8xhHcaTs4uKBwzdrpTHySQaMQUQDsdsZDaTE=;
 b=iAnNWzo21tlp39Df83u3fzdnEEyFML+6bqMpCRK1IqX3vqUfNv5xFU2xniGb9oSimT
 8hZMTFpyg6s68GjgBISjQV1xoj2zXq9TeUTE6py/zyjD4imI+BJCpdJ+yYU1138p/7v7
 uXoc3GnMG4P7wh1N8prkjL5VrBo9WgFzQ2LqSvJEUYQSMYUowmeWmOmdZz6qQcxbBMi7
 TH/+4p6PigtQjTKriPId/qQdYStB7y+CfWZsjJPgimjK4JsGr9ada9my9JR/c2UZC9U2
 2ShHmUmEctqYMHDYGSOV0kP+cn36dj+ub+mEZTFf4wH+/aWJWMJfnEoLo1HBrh3cf/oo
 LeZg==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXh0ZXJuYWwgbWVtb3J5IGNvbnRyb2xsZXIgaXMgaW50ZXJjb25uZWN0ZWQgd2l0aCBtZW1vcnkg
Y29udHJvbGxlciBhbmQKd2l0aCBleHRlcm5hbCBtZW1vcnkuIERvY3VtZW50IG5ldyBpbnRlcmNv
bm5lY3QgcHJvcGVydHkgd2hpY2ggZGVzaWduYXRlcwpleHRlcm5hbCBtZW1vcnkgY29udHJvbGxl
ciBhcyBpbnRlcmNvbm5lY3QgcHJvdmlkZXIuCgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVu
a28gPGRpZ2V0eEBnbWFpbC5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVy
cy9udmlkaWEsdGVncmEzMC1lbWMueWFtbCAgICAgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMzAtZW1jLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRpYSx0
ZWdyYTMwLWVtYy55YW1sCmluZGV4IDdmZTBjYTE0ZTMyNC4uZWNkZmZiZTY5MWNlIDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJz
L252aWRpYSx0ZWdyYTMwLWVtYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMzAtZW1jLnlhbWwKQEAgLTMx
LDYgKzMxLDkgQEAgcHJvcGVydGllczoKICAgaW50ZXJydXB0czoKICAgICBtYXhJdGVtczogMQog
CisgICIjaW50ZXJjb25uZWN0LWNlbGxzIjoKKyAgICBjb25zdDogMQorCiAgIG52aWRpYSxtZW1v
cnktY29udHJvbGxlcjoKICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy9waGFuZGxlCiAgICAgZGVzY3JpcHRpb246CkBAIC0yMTQsNiArMjE3LDcgQEAgcmVxdWlyZWQ6
CiAgIC0gaW50ZXJydXB0cwogICAtIGNsb2NrcwogICAtIG52aWRpYSxtZW1vcnktY29udHJvbGxl
cgorICAtICIjaW50ZXJjb25uZWN0LWNlbGxzIgogCiBhZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UKIApAQCAtMjI3LDYgKzIzMSw4IEBAIGV4YW1wbGVzOgogCiAgICAgICAgIG52aWRpYSxtZW1v
cnktY29udHJvbGxlciA9IDwmbWM+OwogCisgICAgICAgICNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8
MT47CisKICAgICAgICAgZW1jLXRpbWluZ3MtMSB7CiAgICAgICAgICAgICBudmlkaWEscmFtLWNv
ZGUgPSA8MT47CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
