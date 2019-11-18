Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FF4101AD7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9111A6EBB3;
	Tue, 19 Nov 2019 08:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A856E822
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:37 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l14so8211658lfh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jCdUNbrdRJjqVla5VJjyVdTCmGe/PoyPIjNb52FlJnk=;
 b=R+HrQngayYQfiqM7EX6uWvGKXEnu7v1i7zqR1tbR45rzwCsOCTv9d6msi3Nxubw0gE
 nvQwAnoLIRAZvmkNbihpIHNwPh4fj78riDsGIMzqpLPZ+h7xv354XyuECNtvLx8PHvtC
 Lk8nE7G0MH+WUKzzYTnU8PLC6W1z55Zj+BRX5ucOLFVpjUp6+Wut2rH7ZgW2oWRgPKSL
 xzkHheQj8/Km74wt0+lp6cymN7ki3ZGNd9Kae7sqWWVE8MKI/pv7ad/WcFhJ1f2HB4/J
 Ij0HI+XdEZoutmPFOg09ONV9kCmu+n8J44RSOKVf6PXkkh44UEeCBXCP8ll3CED1jufH
 mqbg==
X-Gm-Message-State: APjAAAVxS9CqFzJ9wwo3eGkUMBIbeKX8kjn56pZkYtnqErUNXFYaeLAy
 0dQKZ05C1n2/BujODFu6dRXRtpxS
X-Google-Smtp-Source: APXvYqzD+qc9/bHBgWnn6IDSjtu+yoi+QPOguZvwpPZLJh+aN5o5KBjsxeq8NRupazScBaAsGiI2VA==
X-Received: by 2002:a19:ee17:: with SMTP id g23mr833981lfb.121.1574107535994; 
 Mon, 18 Nov 2019 12:05:35 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:35 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 06/29] dt-bindings: memory: tegra124: emc: Document new
 interconnect property
Date: Mon, 18 Nov 2019 23:02:24 +0300
Message-Id: <20191118200247.3567-7-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jCdUNbrdRJjqVla5VJjyVdTCmGe/PoyPIjNb52FlJnk=;
 b=VO9OtD2ST829EMBXrnBhCLymPMvO5eLmi1XuG9Kq0emJTuz3Pp5e0NvrJYc1SUPoka
 AF1PGZKQfjTbYAZhoFZ50zoB2xacpcdGFEGpgyFNdDphIvJGIK8J56WpsXeLS3CNwp8m
 IsVhTcLaQi+wgi111Ed/fVQ0xvvkWpqS9s+5RFXCd6UxW50mWzgDkMN7ZiOIxDZtFU3t
 +C2WWbFXX5BiZZC06BSR0j+xZvzb0oPnhZjHf4RVUdHwzpCQIcWwyti++QR53AW9vSeb
 GDm6ETNP3AEQjrYFVIAyg0DFnYQ1Ce3axJLg3miALUOElX0Pm08YDk4ZowZiYbXy/wi6
 J9ng==
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
cy9udmlkaWEsdGVncmExMjQtZW1jLnR4dCAgICAgICAgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMTI0LWVtYy50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRpYSx0
ZWdyYTEyNC1lbWMudHh0CmluZGV4IGJhMGJjM2YxMjQxOS4uZmY0OGI0NjYwNGU2IDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJz
L252aWRpYSx0ZWdyYTEyNC1lbWMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMTI0LWVtYy50eHQKQEAgLTUs
NiArNSw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgOgogLSBjb21wYXRpYmxlIDogU2hvdWxkIGJl
ICJudmlkaWEsdGVncmExMjQtZW1jIi4KIC0gcmVnIDogcGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFu
ZCBsZW5ndGggb2YgdGhlIGNvbnRyb2xsZXIncyByZWdpc3RlcnMuCiAtIG52aWRpYSxtZW1vcnkt
Y29udHJvbGxlciA6IHBoYW5kbGUgb2YgdGhlIE1DIGRyaXZlci4KKy0gI2ludGVyY29ubmVjdC1j
ZWxscyA6IFNob3VsZCBiZSAxLgogCiBUaGUgbm9kZSBzaG91bGQgY29udGFpbiBhICJlbWMtdGlt
aW5ncyIgc3Vibm9kZSBmb3IgZWFjaCBzdXBwb3J0ZWQgUkFNIHR5cGUKIChzZWUgZmllbGQgUkFN
X0NPREUgaW4gcmVnaXN0ZXIgUE1DX1NUUkFQUElOR19PUFRfQSksIHdpdGggaXRzIHVuaXQgYWRk
cmVzcwpAQCAtMTk1LDYgKzE5Niw4IEBAIEV4YW1wbGUgU29DIGluY2x1ZGUgZmlsZToKIAkJcmVn
ID0gPDB4MCAweDcwMDFiMDAwIDB4MCAweDEwMDA+OwogCiAJCW52aWRpYSxtZW1vcnktY29udHJv
bGxlciA9IDwmbWM+OworCisJCSNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MT47CiAJfTsKIH07CiAK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
