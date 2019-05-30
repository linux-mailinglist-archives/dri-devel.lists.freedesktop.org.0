Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E71AC30053
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 18:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDE96E3B5;
	Thu, 30 May 2019 16:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8655A6E39E;
 Thu, 30 May 2019 15:59:17 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id h17so2287707pgv.0;
 Thu, 30 May 2019 08:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Y8nAAbKBo+GsjR2wR8X+b6EMGLV2z628Qb4JzCYHIQ4=;
 b=SRd4JDrCiN4n03nysXBfcp4Hr4WtTUs3kWb7TksiuHkKEywKUNCIl1qrVkrVqTPWiQ
 7jurqwdmOXrQ1XKNYWjzGYooyFLd4u0NCFPPvqf0i/CXLQLADP9xD6nyLpAkJ8idJ3B1
 7sBMr+HLyZ4ByGUVaSqW0K4Lb5c9nBQGZxk2Z5UXLoTZxccqDgR81JNeKZLi6kD2OkHq
 BhD6Lpz7pzPb1kbyvKfRhhLKxbieetYS67L+vWdc6zMC5VnjtmPX+u2OsOS+X+kuoIZF
 Oj9TTmXkmvqmc3a0FauSULlJNsNpscBz0Q3crrbk0uE7qIqUeUNM3R//p47iB/PLxVIA
 fasQ==
X-Gm-Message-State: APjAAAUbg5ZFCDn0Cpq5s7DLnx5H+HcFGF36OREE7eZdLRbpMWfcD7Ys
 58M8MRmslprWOZboFqDFBWo=
X-Google-Smtp-Source: APXvYqwr8GMJVp3pLyVMxK1wV0ENCJ3tZpw/SGabGJp9Pyp7Pfnzkhra0qVRagJdDgUjO9dbrjeSig==
X-Received: by 2002:a63:c20c:: with SMTP id b12mr4155982pgd.3.1559231957162;
 Thu, 30 May 2019 08:59:17 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id e184sm4213045pfa.169.2019.05.30.08.59.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 08:59:16 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: 
Subject: [PATCH 0/4] MSM8998 DSI support
Date: Thu, 30 May 2019 08:59:09 -0700
Message-Id: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 30 May 2019 16:46:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Y8nAAbKBo+GsjR2wR8X+b6EMGLV2z628Qb4JzCYHIQ4=;
 b=XLLCbKfwDGtQAZawpyoKQffPiR9Xf8Q7jYF7Uvvmr/cWUh74ThmPXC6oZCk7/PEAyF
 YzSquNHpQc7JGFV+Zp/4c/pAJWiRbSJdJU0n9zOTE8zsei+hjeIKCMEJcKyz+rShlXV7
 eZd0TKAe2c/GRvS6wBM/gDKpUDkY4bCUygPCwMrebyFAS1StIUXwGMvAkZ1rlWZv3eLM
 xp3FZbOLNED3XSOgQp1xOFe6THUw3PwQDIk4DSriRXwadZDES0iwTFnTPLJwhvaIJrjI
 FVpE3afKn+WFYW4Fyg1/STsHGL20fYxsSWuc126MZOyrruTOiQxsI0iIoGNmk7vWFAdd
 8wpg==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, marc.w.gonzalez@free.fr, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 sibis@codeaurora.org, sean@poorly.run, chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxpbmcgRFNJIHN1cHBvcnQgZm9yIHRoZSBNU004OTk4IFNvQyBpcyBhbm90aGVyIHN0ZXAg
dG8gZ2V0dGluZyBlbmQKdG8gZW5kIGRpc3BsYXkgZ29pbmcuICBUaGlzIHdpbGwgYWxsb3cgdGhl
IFNvQyB0byBkcml2ZSBwYW5lbHMgdGhhdCBhcmUKaW50ZWdyYWRlZCBvbiB0aGUgZGV2aWNlIChp
ZSBub3QgYSBIRE1JIHBvcnQpLCBidXQgd29uJ3QgZG8gbXVjaCB1bnRpbAp3ZSBoYXZlIHRoZSBk
aXNwbGF5IHByb2Nlc3NvciBmZWVkaW5nIHRoZSBEU0kgYmxvY2tzIHdpdGggbGluZXMgdG8Kc2Nh
bm91dC4KCkplZmZyZXkgSHVnbyAoNCk6CiAgZHQtYmluZGluZ3M6IG1zbS9kc2k6IEFkZCAxMG5t
IHBoeSBmb3IgbXNtODk5OCBjb21wYXRpYmxlCiAgZHJtL21zbS9kc2k6IEFkZCBzdXBwb3J0IGZv
ciBNU004OTk4IDEwbm0gZHNpIHBoeQogIGRybS9tc20vZHNpOiBBZGQgb2xkIHRpbWluZ3MgcXVp
cmsgZm9yIDEwbm0gcGh5CiAgZHJtL21zbS9kc2k6IEFkZCBzdXBwb3J0IGZvciBNU004OTk4IERT
SSBjb250cm9sbGVyCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4
dCAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jICAgICAgICAgICAg
IHwgMjEgKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oICAg
ICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYyAg
ICAgICAgIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmggICAg
ICAgICB8ICA1ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0u
YyAgICB8IDMwICsrKysrKysrKysrKysrKysrLS0KIDYgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
