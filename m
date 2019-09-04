Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04076A9B65
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1887789DFC;
	Thu,  5 Sep 2019 07:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13C289B9F;
 Wed,  4 Sep 2019 21:15:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q19so304811wmc.3;
 Wed, 04 Sep 2019 14:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Dxs4Xmn14Ti3jSgpkVxzxzwg3rZgGyhdBRyDXWQ1X6k=;
 b=I2tfDaw+xWuhKcAFur/UNBetpCD6P7iGpXTIyNSNhTXhBVqNPHxYDzqJYmF3D/1gHX
 SuOJ8gWICS53+eyTmaqfRpEMGAdJge5p/WxnhsA/n3nPjiYNpO+di3eJJwJP5i3LNRN8
 HXOjXoJCFA9yS4qQCDwyCRtcqc3/ekBix4phvBdwUt7ENjFl0ImXWWPSpAtq8mbN3OXs
 sl3OlJ3bSZ2A6GcNJpw0uzJM0z0SYAcJJ7NNVomEXSvxK3aGMDpkqsPG7Z9Mv+j2GiYq
 raMfCa86MaUd3dLMhR3dzzthKrE11CbOD/L+UvjiBWHWtDX3pnGBe5YyEP4Y9HWaWR9W
 O/Dg==
X-Gm-Message-State: APjAAAXYeKShtNdYqTt6Mx+9vyjuCLN7BhVeeHgQ7Q13jON4TSeBWY4R
 xr07efNIFA4m3n7GjXOSngo=
X-Google-Smtp-Source: APXvYqzrb9vggbAwpQr2Dks5C0st9n10mD88uNXH+VICsMg+OfF85dbySpily4o4x8blq3AEb63FBA==
X-Received: by 2002:a05:600c:214:: with SMTP id
 20mr234250wmi.112.1567631754197; 
 Wed, 04 Sep 2019 14:15:54 -0700 (PDT)
Received: from localhost.localdomain (ip5b4096c3.dynamic.kabel-deutschland.de.
 [91.64.150.195])
 by smtp.gmail.com with ESMTPSA id u83sm5822743wme.0.2019.09.04.14.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 14:15:53 -0700 (PDT)
From: Krzysztof Wilczynski <kw@linux.com>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm/dsi: Move static keyword to the front of declarations
Date: Wed,  4 Sep 2019 23:15:51 +0200
Message-Id: <20190904211551.10381-1-kw@linux.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dxs4Xmn14Ti3jSgpkVxzxzwg3rZgGyhdBRyDXWQ1X6k=;
 b=LjvjwT5oZwcFzZGrEpF0CjtQsd3HtOKG/33/xQR71ZQPwHOoTe774LhAF84EkQS4m0
 tpC8rlsKBJKRELBRH//hru/A6+MI1oS4uxB+0Hzl2NvpWLL5ff8rfnw60mjY+8NRbUVW
 wyMUQS3Yfy6EQn4YQFaa6iV3NK2cxGYd2V61dkWUdMcKy/gb2HdmcLrzoZxqYhb8DZ15
 fKnEm2OcVI6vpGIqE6aEcB/WVQ5Jr+uEM7jiDaDzVdZGzEXLevuBBsqFV1Dq6jMElZ5u
 JRrQsjHB0ps1F874d62Mf14JCYIvL5LMH1TGRmgouegKZdEW5AU6YlmVyC/lgVpsjCuK
 JyBw==
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
Cc: freedreno@lists.freedesktop.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alexios Zavras <alexios.zavras@intel.com>,
 linux-arm-msm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW92ZSB0aGUgc3RhdGljIGtleXdvcmQgdG8gdGhlIGZyb250IG9mIGRlY2xhcmF0aW9ucwpvZiBt
c21fZHNpX3YyX2hvc3Rfb3BzLCBtc21fZHNpXzZnX2hvc3Rfb3BzIGFuZAptc21fZHNpXzZnX3Yy
X2hvc3Rfb3BzLCBhbmQgcmVzb2x2ZSB0aGUgZm9sbG93aW5nCmNvbXBpbGVyIHdhcm5pbmdzIHRo
YXQgY2FuIGJlIHNlZW4gd2hlbiBidWlsZGluZwp3aXRoIHdhcm5pbmdzIGVuYWJsZWQgKFc9MSk6
Cgpkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmM6MTUwOjE6IHdhcm5pbmc6CiAg4oCY
c3RhdGlj4oCZIGlzIG5vdCBhdCBiZWdpbm5pbmcgb2YgZGVjbGFyYXRpb24gWy1Xb2xkLXN0eWxl
LWRlY2xhcmF0aW9uXQoKZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jOjE2MToxOiB3
YXJuaW5nOgogIOKAmHN0YXRpY+KAmSBpcyBub3QgYXQgYmVnaW5uaW5nIG9mIGRlY2xhcmF0aW9u
IFstV29sZC1zdHlsZS1kZWNsYXJhdGlvbl0KCmRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9j
ZmcuYzoxNzI6MTogd2FybmluZzoKICDigJhzdGF0aWPigJkgaXMgbm90IGF0IGJlZ2lubmluZyBv
ZiBkZWNsYXJhdGlvbiBbLVdvbGQtc3R5bGUtZGVjbGFyYXRpb25dCgpTaWduZWQtb2ZmLWJ5OiBL
cnp5c3p0b2YgV2lsY3p5bnNraSA8a3dAbGludXguY29tPgotLS0KUmVsYXRlZDogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDE5MDgyNzIzMzAxNy5HSzk5ODdAZ29vZ2xlLmNvbQoKIGRyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZHNpL2RzaV9jZmcuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcu
YwppbmRleCBiN2I3YzFhOTE2NGEuLmU3NGRjOGNjOTA0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2Rz
aV9jZmcuYwpAQCAtMTQ3LDcgKzE0Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9j
b25maWcgc2RtODQ1X2RzaV9jZmcgPSB7CiAJLm51bV9kc2kgPSAyLAogfTsKIAotY29uc3Qgc3Rh
dGljIHN0cnVjdCBtc21fZHNpX2hvc3RfY2ZnX29wcyBtc21fZHNpX3YyX2hvc3Rfb3BzID0gewor
c3RhdGljIGNvbnN0IHN0cnVjdCBtc21fZHNpX2hvc3RfY2ZnX29wcyBtc21fZHNpX3YyX2hvc3Rf
b3BzID0gewogCS5saW5rX2Nsa19lbmFibGUgPSBkc2lfbGlua19jbGtfZW5hYmxlX3YyLAogCS5s
aW5rX2Nsa19kaXNhYmxlID0gZHNpX2xpbmtfY2xrX2Rpc2FibGVfdjIsCiAJLmNsa19pbml0X3Zl
ciA9IGRzaV9jbGtfaW5pdF92MiwKQEAgLTE1OCw3ICsxNTgsNyBAQCBjb25zdCBzdGF0aWMgc3Ry
dWN0IG1zbV9kc2lfaG9zdF9jZmdfb3BzIG1zbV9kc2lfdjJfaG9zdF9vcHMgPSB7CiAJLmNhbGNf
Y2xrX3JhdGUgPSBkc2lfY2FsY19jbGtfcmF0ZV92MiwKIH07CiAKLWNvbnN0IHN0YXRpYyBzdHJ1
Y3QgbXNtX2RzaV9ob3N0X2NmZ19vcHMgbXNtX2RzaV82Z19ob3N0X29wcyA9IHsKK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgbXNtX2RzaV9ob3N0X2NmZ19vcHMgbXNtX2RzaV82Z19ob3N0X29wcyA9IHsK
IAkubGlua19jbGtfZW5hYmxlID0gZHNpX2xpbmtfY2xrX2VuYWJsZV82ZywKIAkubGlua19jbGtf
ZGlzYWJsZSA9IGRzaV9saW5rX2Nsa19kaXNhYmxlXzZnLAogCS5jbGtfaW5pdF92ZXIgPSBOVUxM
LApAQCAtMTY5LDcgKzE2OSw3IEBAIGNvbnN0IHN0YXRpYyBzdHJ1Y3QgbXNtX2RzaV9ob3N0X2Nm
Z19vcHMgbXNtX2RzaV82Z19ob3N0X29wcyA9IHsKIAkuY2FsY19jbGtfcmF0ZSA9IGRzaV9jYWxj
X2Nsa19yYXRlXzZnLAogfTsKIAotY29uc3Qgc3RhdGljIHN0cnVjdCBtc21fZHNpX2hvc3RfY2Zn
X29wcyBtc21fZHNpXzZnX3YyX2hvc3Rfb3BzID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBtc21f
ZHNpX2hvc3RfY2ZnX29wcyBtc21fZHNpXzZnX3YyX2hvc3Rfb3BzID0gewogCS5saW5rX2Nsa19l
bmFibGUgPSBkc2lfbGlua19jbGtfZW5hYmxlXzZnLAogCS5saW5rX2Nsa19kaXNhYmxlID0gZHNp
X2xpbmtfY2xrX2Rpc2FibGVfNmcsCiAJLmNsa19pbml0X3ZlciA9IGRzaV9jbGtfaW5pdF82Z192
MiwKLS0gCjIuMjIuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
