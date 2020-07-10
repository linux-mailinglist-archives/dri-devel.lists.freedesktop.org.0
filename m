Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1865F21E8D9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1356E8ED;
	Tue, 14 Jul 2020 07:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3A96E082
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:25:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l2so5175287wmf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SkCUMnau7wnh370CWTBdQrZya4Pn73aX8uOog7kVa2E=;
 b=UYk1cfsifyvuGjnTw8dAHN4r78tIvcbD3PqzKIc+DeXtTlhlCvLN5VRA8MRoYzGoHR
 IK4lmrCyR3uRX/nbRMvBM7/uMwKF8qtAjOov7YcLERv8zHxk6ng+1NxInm92+SJ6Akqa
 ojkE2EFETlJl+LwwP3FefzD/qTWHp7MxtBmG2TQeIPzfSy/FyygYlSdGYJgnkuYPYad/
 yIYysbpCmV3rG3OHifCECL4mG6YWxczbVNA00WW8NZIiHlBXSxmyuwxh4ac9ZKfTzXTb
 bkZjHGkP27D9ywFcOR/pcp7dr+5NOm9QgJ5qN/alyfRvjN8mB0aY2UqbrY8dQ2sOGld1
 IONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SkCUMnau7wnh370CWTBdQrZya4Pn73aX8uOog7kVa2E=;
 b=j5veh4sYzW3vaJA907niNcJnYDEpoNNgTviwoAIczav2r/JDBKqVGgfJSqAVEipt88
 k6/PWo0BCMBxAiRZl2qZpHaVu2eRbFwhZoZaWqJkeN+WEShEnujZFIRLZCIm2I+DGbPn
 w65tMcWMPFeENeEoQAhWoNcWw/HXBLxtaxcXyZoS0Wz4SvG3Vg/sWL4YJRBJTKlFCWCn
 Ocmfuj3D1M79fBXRyEtZiOhWAJPNVgGvSQfzPt3Qi3sYKf64T4KqXOr60Lf/qZx7YD/C
 /kHdtCja5WAyqjOe5Q4O0rA8oDRJ8vx7CGgoTuovIdnbLSq9Ir9/o4C+HQYOt+jgrGSP
 xnig==
X-Gm-Message-State: AOAM530GRFltuo7RBkEDJ+kz9k8bMWieJPvYQ7U4JyWBgIUZgONu9aa8
 tHyPfKe6lUfRxmyA/Q425Ss=
X-Google-Smtp-Source: ABdhPJykwFKqd3Ulm4muDnruAlm7cK5WE0WlSGnkadjFhkFQp/pGh88FXxmcyBKPb7h52m9nMhehww==
X-Received: by 2002:a1c:23d0:: with SMTP id j199mr4520599wmj.12.1594373152253; 
 Fri, 10 Jul 2020 02:25:52 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id h23sm8179559wmb.3.2020.07.10.02.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:25:51 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 00/14] Add regulator devfreq support to Panfrost
Date: Fri, 10 Jul 2020 11:25:34 +0200
Message-Id: <20200710092548.316054-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
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

SGksCgpUaGlzIHNlcmllIGNsZWFucyBhbmQgYWRkcyByZWd1bGF0b3Igc3VwcG9ydCB0byBQYW5m
cm9zdCBkZXZmcmVxLgpUaGlzIGlzIG1vc3RseSBiYXNlZCBvbiBjb21tZW50IGZvciB0aGUgZnJl
c2hseSBpbnRyb2R1Y2VkIGxpbWEKZGV2ZnJlcS4KCldlIG5lZWQgdG8gYWRkIHJlZ3VsYXRvciBz
dXBwb3J0IGJlY2F1c2Ugb24gQWxsd2lubmVyIHRoZSBHUFUgT1BQCnRhYmxlIGRlZmluZXMgYm90
aCBmcmVxdWVuY2llcyBhbmQgdm9sdGFnZXMuCgpGaXJzdCBwYXRjaGVzIFswMS0wN10gc2hvdWxk
IG5vdCBjaGFuZ2UgdGhlIGFjdHVhbCBiZWhhdmlvcgphbmQgaW50cm9kdWNlIGEgcHJvcGVyIHBh
bmZyb3N0X2RldmZyZXEgc3RydWN0LgoKUmVnYXJkcywKQ2zDqW1lbnQKCkNoYW5nZXMgc2luY2Ug
djM6CiAtIENvbGxlY3QgU3RldmVuIFByaWNlIHJldmlld2VkLWJ5IHRhZ3MKIC0gUmViYXNlIG9u
IG5leHQvbWFzdGVyIChuZXh0LTIwMjAwNzA5KQoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0gQ29sbGVj
dCBBbHlzc2EgUm9zZW56d2VpZyByZXZpZXdlZC1ieSB0YWdzCiAtIEZpeCBvcHBfc2V0X3JlZ3Vs
YXRvciBiZWZvcmUgYWRkaW5nIG9wcF90YWJsZSAoaW50cm9kdWNlIGluIHYyKQogLSBDYWxsIGVy
cl9maW5pIGluIGNhc2Ugb3BwX2FkZF90YWJsZSBmYWlsZWQKCkNoYW5nZXMgc2luY2UgdjE6CiAt
IENvbGxlY3QgU3RldmVuIFByaWNlIHJldmlld2VkLWJ5IHRhZ3MKIC0gRml4IHNwaW5sb2NrIGNv
bW1lbnQKIC0gRHJvcCBPUFAgY2xvY2stbmFtZSBwYXRjaAogLSBEcm9wIGRldmljZV9wcm9wZXJ0
eV90ZXN0IHBhdGNoCiAtIEFkZCByZW5hbWUgZXJyb3IgbGFiZWxzIHBhdGNoCgpDbMOpbWVudCBQ
w6lyb24gKDE0KToKICBkcm0vcGFuZnJvc3Q6IGF2b2lkIHN0YXRpYyBkZWNsYXJhdGlvbgogIGRy
bS9wYW5mcm9zdDogY2xlYW4gaGVhZGVycyBpbiBkZXZmcmVxCiAgZHJtL3BhbmZyb3N0OiBkb24n
dCB1c2UgcGZkZXZmcmVxLmJ1c3lfY291bnQgdG8ga25vdyBpZiBodyBpcyBpZGxlCiAgZHJtL3Bh
bmZyb3N0OiBpbnRyb2R1Y2UgcGFuZnJvc3RfZGV2ZnJlcSBzdHJ1Y3QKICBkcm0vcGFuZnJvc3Q6
IHVzZSBzcGlubG9jayBpbnN0ZWFkIG9mIGF0b21pYwogIGRybS9wYW5mcm9zdDogcHJvcGVybHkg
aGFuZGxlIGVycm9yIGluIHByb2JlCiAgZHJtL3BhbmZyb3N0OiByZW5hbWUgZXJyb3IgbGFiZWxz
IGluIGRldmljZV9pbml0CiAgZHJtL3BhbmZyb3N0OiBtb3ZlIGRldmZyZXFfaW5pdCgpL2Zpbmko
KSBpbiBkZXZpY2UKICBkcm0vcGFuZnJvc3Q6IGR5bmFtaWNhbGx5IGFsbG9jIHJlZ3VsYXRvcnMK
ICBkcm0vcGFuZnJvc3Q6IGFkZCByZWd1bGF0b3JzIHRvIGRldmZyZXEKICBhcm02NDogZGVmY29u
ZmlnOiBFbmFibGUgZGV2ZnJlcSBjb29saW5nIGRldmljZQogIGFybTY0OiBkdHM6IGFsbHdpbm5l
cjogaDY6IEFkZCBjb29saW5nIG1hcCBmb3IgR1BVCiAgW0RPIE5PVCBNRVJHRV0gYXJtNjQ6IGR0
czogYWxsd2lubmVyOiBoNjogQWRkIEdQVSBPUFAgdGFibGUKICBbRE8gTk9UIE1FUkdFXSBhcm02
NDogZHRzOiBhbGx3aW5uZXI6IGZvcmNlIEdQVSByZWd1bGF0b3IgdG8gYmUgYWx3YXlzCgogLi4u
L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LWJlZWxpbmstZ3MxLmR0cyAgIHwgICAxICsKIGFyY2gv
YXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpICB8IDEwMiArKysrKysrKysr
CiBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDEgKwog
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyAgIHwgMTc1ICsrKysr
KysrKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEu
aCAgIHwgIDMwICsrLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5j
ICAgIHwgIDYxICsrKy0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rldmlj
ZS5oICAgIHwgIDE0ICstCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMg
ICAgICAgfCAgMTUgKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyAg
ICAgICB8ICAgOCArLQogOSBmaWxlcyBjaGFuZ2VkLCAyOTUgaW5zZXJ0aW9ucygrKSwgMTEyIGRl
bGV0aW9ucygtKQoKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
