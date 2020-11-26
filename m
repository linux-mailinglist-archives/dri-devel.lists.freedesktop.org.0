Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9122C561D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D996E978;
	Thu, 26 Nov 2020 13:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A305D6E948
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:13 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 1so2456474wme.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ldaBPFUn0rO8pzl0GTJMRaUTSpPfHm0TP7NYAeN6NJM=;
 b=GcPofYX9Qv1V/2JRRf6eBMcmKMvq/1Y31zzXUpFv5WiZOV9yJh+i6XHPOojgh//o24
 KG7wZ049wcgMys0vZlZPxdX+UUR+E7ss+DRmBqf4q8VM0UmyhYYehvLzU79YMDMvLfh4
 beMPEE0h/cHkQRbNEH+m4dUgZ+FiqFn8GubSAKi1eSTWQtQTfJxpSQXt14tg5Sx92KxE
 oewKv4hUveIzavl5EUkEqL2xkXlqMmFvlo8xkY9ps7OQrqk2IhlcI+6mYMWNRcAYqo2w
 1lvd3wlv9+U1TYKUBGDlKd+SVhhuTxlUdeWrZxDiI5sno5LOEGLXlYrmRi1Lo/VZcd48
 zD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ldaBPFUn0rO8pzl0GTJMRaUTSpPfHm0TP7NYAeN6NJM=;
 b=Nw0um5i02tqQrztSVkAzpqKYBYf7n+WRU2L+NJ6QsXw3WUTLkThDSt+IDAmAmFVq9v
 lLpPxdChYKbz+Zd5y6WIdvxpYhZr2dW9zTgG8PVYI/Zyo/joMkbwEAld8Mx6BI7YEL85
 zzC9onenkvjiXzas3QJvRjseh9c4X7klSNuzzOw4lJP710p0uQmzV+zytafFLEdNUVCb
 XEoZtm5KarMmz++WqKMkhC7kXNTwzoLEOeSh3UNhufWPvocBCmlH37c77lNpxU49kYy9
 V+kjonKuLh+DHA3T5QByoBEVaoGwQDyBXqk0RA1AhInV8psvc6Ty+aTbxE+MKoR2FXwr
 JMHw==
X-Gm-Message-State: AOAM533Cw8Af0AtakQ4nibToENMC6qOOc9mH3MvvOoyt789T1cSVrW7T
 CJnD5aZqZjfblQVoxtRcgr8bUg==
X-Google-Smtp-Source: ABdhPJyWKnV2DhTA2r066q2RHLN02VvLUP5QFDe1g7IHNygODIp9z4dzgpApqqaGBMVlgJ29TUexGA==
X-Received: by 2002:a1c:1b06:: with SMTP id b6mr3459206wmb.101.1606398190290; 
 Thu, 26 Nov 2020 05:43:10 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:09 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/40] drm/amd/pm/powerplay/hwmgr/hardwaremanager: Fix
 function header related formatting issues
Date: Thu, 26 Nov 2020 13:42:17 +0000
Message-Id: <20201126134240.3214176-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFuYWdl
ci5jOjIzMjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaHdtZ3InIG5v
dCBkZXNjcmliZWQgaW4gJ3BobV9zdGFydF90aGVybWFsX2NvbnRyb2xsZXInCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvaGFyZHdhcmVtYW5hZ2VyLmM6
MzgzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdod21ncicgbm90IGRl
c2NyaWJlZCBpbiAncGhtX2dldF9jbG9ja19pbmZvJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFuYWdlci5jOjM4Mzogd2FybmluZzog
RnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnc3RhdGUnIG5vdCBkZXNjcmliZWQgaW4gJ3Bo
bV9nZXRfY2xvY2tfaW5mbycKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2Vy
cGxheS9od21nci9oYXJkd2FyZW1hbmFnZXIuYzozODM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ3BjbG9ja19pbmZvJyBub3QgZGVzY3JpYmVkIGluICdwaG1fZ2V0X2Ns
b2NrX2luZm8nCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdt
Z3IvaGFyZHdhcmVtYW5hZ2VyLmM6MzgzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Ig
bWVtYmVyICdkZXNpZ25hdGlvbicgbm90IGRlc2NyaWJlZCBpbiAncGhtX2dldF9jbG9ja19pbmZv
JwoKQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogLi4uL2FtZC9wbS9wb3dl
cnBsYXkvaHdtZ3IvaGFyZHdhcmVtYW5hZ2VyLmMgIHwgMjUgKysrKysrKysrKy0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFu
YWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvaGFyZHdhcmVt
YW5hZ2VyLmMKaW5kZXggNDVkZGUzZTc0YjU3OC4uMjViNTgzMWExNWNkMiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvaGFyZHdhcmVtYW5hZ2VyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvaGFyZHdhcmVtYW5h
Z2VyLmMKQEAgLTIyMywxMSArMjIzLDExIEBAIGludCBwaG1fcmVnaXN0ZXJfaXJxX2hhbmRsZXJz
KHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiB9CiAKIC8qKgotKiBJbml0aWFsaXplcyB0aGUgdGhl
cm1hbCBjb250cm9sbGVyIHN1YnN5c3RlbS4KLSoKLSogQHBhcmFtICAgIHBId01nciAgdGhlIGFk
ZHJlc3Mgb2YgdGhlIHBvd2VycGxheSBoYXJkd2FyZSBtYW5hZ2VyLgotKiBAZXhjZXB0aW9uIFBQ
X1Jlc3VsdF9GYWlsZWQgaWYgYW55IG9mIHRoZSBwYXJhbXRlcnMgaXMgTlVMTCwgb3RoZXJ3aXNl
IHRoZSByZXR1cm4gdmFsdWUgZnJvbSB0aGUgZGlzcGF0Y2hlci4KLSovCisgKiBwaG1fc3RhcnRf
dGhlcm1hbF9jb250cm9sbGVyIC0gSW5pdGlhbGl6ZXMgdGhlIHRoZXJtYWwgY29udHJvbGxlciBz
dWJzeXN0ZW0uCisgKgorICogQGh3bWdyOiAgIHRoZSBhZGRyZXNzIG9mIHRoZSBwb3dlcnBsYXkg
aGFyZHdhcmUgbWFuYWdlci4KKyAqIEV4Y2VwdGlvbiBQUF9SZXN1bHRfRmFpbGVkIGlmIGFueSBv
ZiB0aGUgcGFyYW10ZXJzIGlzIE5VTEwsIG90aGVyd2lzZSB0aGUgcmV0dXJuIHZhbHVlIGZyb20g
dGhlIGRpc3BhdGNoZXIuCisgKi8KIGludCBwaG1fc3RhcnRfdGhlcm1hbF9jb250cm9sbGVyKHN0
cnVjdCBwcF9od21nciAqaHdtZ3IpCiB7CiAJaW50IHJldCA9IDA7CkBAIC0zNzEsMTMgKzM3MSwx
NCBAQCBpbnQgcGhtX2dldF9wZXJmb3JtYW5jZV9sZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdy
LCBjb25zdCBzdHJ1Y3QgcHBfaHdfcG93ZXJfcwogCiAKIC8qKgotKiBHZXRzIENsb2NrIEluZm8u
Ci0qCi0qIEBwYXJhbSAgICBwSHdNZ3IgIHRoZSBhZGRyZXNzIG9mIHRoZSBwb3dlcnBsYXkgaGFy
ZHdhcmUgbWFuYWdlci4KLSogQHBhcmFtICAgIHBQb3dlclN0YXRlIHRoZSBhZGRyZXNzIG9mIHRo
ZSBQb3dlciBTdGF0ZSBzdHJ1Y3R1cmUuCi0qIEBwYXJhbSAgICBwQ2xvY2tJbmZvIHRoZSBhZGRy
ZXNzIG9mIFBQX0Nsb2NrSW5mbyBzdHJ1Y3R1cmUgd2hlcmUgdGhlIHJlc3VsdCB3aWxsIGJlIHJl
dHVybmVkLgotKiBAZXhjZXB0aW9uIFBQX1Jlc3VsdF9GYWlsZWQgaWYgYW55IG9mIHRoZSBwYXJh
bXRlcnMgaXMgTlVMTCwgb3RoZXJ3aXNlIHRoZSByZXR1cm4gdmFsdWUgZnJvbSB0aGUgYmFjay1l
bmQuCi0qLworICogcGhtX2dldF9jbG9ja19pbmZvCisgKgorICogQGh3bWdyOiAgdGhlIGFkZHJl
c3Mgb2YgdGhlIHBvd2VycGxheSBoYXJkd2FyZSBtYW5hZ2VyLgorICogQHN0YXRlOiB0aGUgYWRk
cmVzcyBvZiB0aGUgUG93ZXIgU3RhdGUgc3RydWN0dXJlLgorICogQHBjbG9ja19pbmZvOiB0aGUg
YWRkcmVzcyBvZiBQUF9DbG9ja0luZm8gc3RydWN0dXJlIHdoZXJlIHRoZSByZXN1bHQgd2lsbCBi
ZSByZXR1cm5lZC4KKyAqIEBkZXNpZ25hdGlvbjogUEhNIHBlcmZvcm1hbmNlIGxldmVsIGRlc2ln
bmF0aW9uCisgKiBFeGNlcHRpb24gUFBfUmVzdWx0X0ZhaWxlZCBpZiBhbnkgb2YgdGhlIHBhcmFt
dGVycyBpcyBOVUxMLCBvdGhlcndpc2UgdGhlIHJldHVybiB2YWx1ZSBmcm9tIHRoZSBiYWNrLWVu
ZC4KKyAqLwogaW50IHBobV9nZXRfY2xvY2tfaW5mbyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBj
b25zdCBzdHJ1Y3QgcHBfaHdfcG93ZXJfc3RhdGUgKnN0YXRlLCBzdHJ1Y3QgcHBfY2xvY2tfaW5m
byAqcGNsb2NrX2luZm8sCiAJCQlQSE1fUGVyZm9ybWFuY2VMZXZlbERlc2lnbmF0aW9uIGRlc2ln
bmF0aW9uKQogewotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
