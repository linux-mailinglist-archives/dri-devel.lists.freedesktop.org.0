Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924E1D7BDC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4296289F06;
	Tue, 15 Oct 2019 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F308958E;
 Tue, 15 Oct 2019 10:11:02 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p14so23092774wro.4;
 Tue, 15 Oct 2019 03:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5U0JO1qP/ANKXzSYDdvZ5hB/uH8vrGg9s4VuaxGlI8k=;
 b=QO9liF0G9/7MkZUyk821kKcL4//ywQyWnfnSZzU3K5bqQBJKZKL1rhP2GLa1RSMLiZ
 vyfATXa941u0u+f+cYzFLfIzFj772oL/0fvnBpn+Xe89DEkVLxDHlbvjRIijtb/bLv42
 J/66UX/g1YjlI7DLbHWaEd94L1OlZspzm7OjtRD7YhG7ihEvlPeVfHmq4bMajo5b/FlI
 Girk92zIugmKA9VasYCEiNCD33VQEsMvkt485ErFjp2AwdaLd1FR54OvoLmHAP6any9t
 BEzWe7NwkDLtZz9MFPatPETaeWr5ZbiXL4Tmlf1pj/QpIsGgzHTzwqeIbP2+EAPqPjZb
 aa9g==
X-Gm-Message-State: APjAAAUlJqw+A93MFvl6MyrcF5s9v1VNEvkzxs1IiUSCL1KJKmUIdPTi
 ldvmsb3U8IimQv1kTZmCokw=
X-Google-Smtp-Source: APXvYqwoU/NjIKAsBl9oD8Z2eI4Ypcw6Xl16JsD8B8p/Akav2sj23LCnVElzs5mwgCmM6+B5IercTQ==
X-Received: by 2002:adf:92a5:: with SMTP id 34mr28303440wrn.337.1571134261006; 
 Tue, 15 Oct 2019 03:11:01 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.10.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 03:11:00 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/7] DRM/MSM: Add support for MSM8956 and Adreno 510
Date: Tue, 15 Oct 2019 12:10:51 +0200
Message-Id: <20191015101058.37157-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5U0JO1qP/ANKXzSYDdvZ5hB/uH8vrGg9s4VuaxGlI8k=;
 b=px0zE08txAWOoOV+ackPKOW7lap1BgS+1XdkMGExn/FcoVQ9YJFDL2jBorPsud5b7l
 eQCwx5RB887uPk1kYtZbOohaqxB1yDnW9VQZeFGXkJmoSTKr1PkTOIJ5leJnT7XyOTkr
 tWm0L1lXCxIR9fLGZD1SW/IAs0F5/XraPW8cE2ODrvgAoINj/yk1lGYPKPuxzcLCwDeu
 WNJY7ENM+4k/+m8IIahEkqEdvt07hDRMGCuYUSGXOoQbPU6/QNqM3d4q9Cgt9lxUipB5
 m0qN/USJUnKOzbHmaZk4Zj+JG71sxLTWBUoAAEsIbQt1S1nZkhHuiqzyUBfJ0+tHvZex
 5wGw==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, tglx@linutronix.de, kholk11@gmail.com, sean@poorly.run,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgoKVGhp
cyBwYXRjaCBzZXJpZXMgZW5hYmxlcyBzdXBwb3J0IGZvciBNU004OTU2Lzc2IGFuZCBpdHMgQWRy
ZW5vIDUxMApHUFUgb24gdGhlIGN1cnJlbnQgRFJNIGRyaXZlci4KClRoZSBwZXJzb25hbCBhaW0g
aXMgdG8gdXBzdHJlYW0gTVNNODk1NiBhcyBtdWNoIGFzIHBvc3NpYmxlLgoKVGhpcyBjb2RlIGhh
cyBiZWVuIHRlc3RlZCBvbiB0d28gU29ueSBwaG9uZXMgZmVhdHVyaW5nIHRoZSBRdWFsY29tbQpN
U004OTU2IFNvQy4KCkNoYW5nZXMgaW4gdjI6Ci0gTURQNTogRG9jdW1lbnRlZCB0YnUgYW5kIHRi
dV9ydCBjbG9ja3MgKEplZmZyZXkpCi0gQWRyZW5vNTEwOgogIC0gTG93ZXIgY2FzZSBoZXggd2hl
cmUgcmVxdWlyZWQgKEpvcmRhbikKICAtIERpcmVjdCByZWdpc3RlciB3cml0ZXMgKEpvcmRhbikK
ICAtIFVzZWQgZ3B1X3JtdygpIHdoZXJlIHJlcXVpcmVkIChKb3JkYW4pCiAgLSBObyBtZW50aW9u
aW5nIG9mIHVuc3VwcG9ydGVkIEE1eHggKEpvcmRhbikKICAtIFpBUCBmaXJtd2FyZSBleGNsdXNp
b25zIG5vdCBwZXItbW9kZWwgKFJvYikKCkNoYW5nZXMgaW4gdjM6Ci0gUmViYXNlZCBvbnRvIGxp
bnV4LW5leHQgMjAxOTEwMTUKLSBSZW5hbWVkIE1TTTh4NTYgcmVmZXJlbmNlcyB0byBNU004eDc2
ICh0aGUgcmVhc29uIGlzIHRoYXQgSSBhbQogIHVzaW5nIHRoZSA4OTc2Lzh4NzYgbmFtZSBmb3Ig
YWxsIHRoZSBvdGhlciBkcml2ZXJzLiBBbHNvLCB0aGUKICA4OTc2IGFuZCA4OTU2IGNoaXBzIGFy
ZSBlcXVhbCBhbmQgdGhlIG9ubHkgY2hhbmdpbmcgcGFydCBpcwogIHRoZSBDUFUgYmlnIGNvcmVz
IGNvdW50KQotIFNwbGl0dGVkIGR0LWJpbmRpbmdzIG1vZGlmaWNhdGlvbnMgYXMgcGVyIHJlcXVl
c3QgKFNlYW4pCgpBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyAoNCk6CiAgZHJtL21zbS9tZHA1
OiBBZGQgb3B0aW9uYWwgVEJVIGFuZCBUQlVfUlQgY2xvY2tzCiAgZHQtYmluZGluZ3M6IG1zbS9t
ZHA1OiBEb2N1bWVudCBvcHRpb25hbCBUQlUgYW5kIFRCVV9SVCBjbG9ja3MKICBkcm0vbXNtL21k
cDU6IEFkZCBjb25maWd1cmF0aW9uIGZvciBtc204eDc2CiAgZHJtL21zbS9kc2k6IEFkZCBjb25m
aWd1cmF0aW9uIGZvciAyOG5tIFBMTCBvbiBmYW1pbHkgQgogIGR0LWJpbmRpbmdzOiBtc20vZHNp
OiBBZGQgMjhubSBQTEwgZm9yIGZhbWlseSBCIGNvbXBhdGlibGUKICBkcm0vbXNtL2RzaTogQWRk
IGNvbmZpZ3VyYXRpb24gZm9yIDh4NzYKICBkcm0vbXNtL2FkcmVubzogQWRkIHN1cHBvcnQgZm9y
IEFkcmVubyA1MTAgR1BVCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNp
LnR4dCAgIHwgIDEgKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vbWRwNS50
eHQgIHwgIDIgKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYyAgICAgICAg
IHwgNzMgKysrKysrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfcG93
ZXIuYyAgICAgICB8ICA3ICsrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2
aWNlLmMgICAgfCAxNSArKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUu
aCAgICAgICB8ICA1ICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY2ZnLmMg
ICAgICB8IDk4ICsrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9t
ZHA1L21kcDVfa21zLmMgICAgICB8IDEwICsrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRw
NS9tZHA1X2ttcy5oICAgICAgfCAgMiArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2Zn
LmMgICAgICAgICAgICAgfCAyMiArKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2Nm
Zy5oICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9w
aHkuYyAgICAgICAgIHwgIDIgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHku
aCAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMjhu
bS5jICAgIHwgMTggKysrKwogMTQgZmlsZXMgY2hhbmdlZCwgMjQzIGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
