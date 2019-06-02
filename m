Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5592323A6
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 17:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA23896E9;
	Sun,  2 Jun 2019 15:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAD0893D5;
 Sun,  2 Jun 2019 12:07:43 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id z3so6633395pgp.8;
 Sun, 02 Jun 2019 05:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qX3ghjlw/x61cEZZaOOANDltXvTi7Um5dbpJ/suOwPo=;
 b=WD6bTpH5bzNgjIWK8I9w0C2dvS04XFMsKcwqc/JYXJGG6wpn55lGUh1Zjejlvt9YcK
 Bh/tFeNWZMTbMffiU9IkH13gIS9p9MSMojKj7epG9WhdFGhAlzt5UbXIIQOJiYawzDy2
 hr8A3U6YlMDMHo6ACbm3Cw3JLKxGvXa22NLGCYps/O51JOTjfWUlsbR4vCfFcS1SpB3Z
 UQLA1EF7h90ymOSLZnqEQ7UodWb+T37BSFng8LUgETxxnUiY8ubyRDGy2K1HuW3YCCwk
 8sVH+ESW3/KN8MJEmtVUcZSS81Zs/DdFYjsVb9xQHkYORjij3+0ReZ9/OJcaVfHaILiq
 Sd8w==
X-Gm-Message-State: APjAAAUZ1ZGKEFBudhGAWAI6IFn4+HT2AFgz0aOuc/AfkUoFFuBPLUi2
 TBGqiQD2HWfdUINDdY750E8=
X-Google-Smtp-Source: APXvYqzm2wJW1+YOTI30uFW4t5o4z2n5SL6LKrDTNG9aLkdwk+rTGDGuQD+/ySgk9af0E2r2tIFxaQ==
X-Received: by 2002:a65:5684:: with SMTP id v4mr21788486pgs.160.1559477262974; 
 Sun, 02 Jun 2019 05:07:42 -0700 (PDT)
Received: from localhost.localdomain
 (119-18-21-111.771215.syd.nbn.aussiebb.net. [119.18.21.111])
 by smtp.gmail.com with ESMTPSA id x28sm13668510pfo.78.2019.06.02.05.07.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 05:07:42 -0700 (PDT)
From: Rhys Kidd <rhyskidd@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nouveau/bios: downgrade absence of tmds table to info
 from an error
Date: Sun,  2 Jun 2019 22:07:27 +1000
Message-Id: <20190602120727.4001-1-rhyskidd@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 02 Jun 2019 15:00:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qX3ghjlw/x61cEZZaOOANDltXvTi7Um5dbpJ/suOwPo=;
 b=bNugs5VlHZPS4tZ2VPhAX09sWOYYGdVuKnoOLgjmuOdLsm6J2zmLxYDwlanH7ezVMX
 d2ATyFvXAdfIBBL6pukfNrxawsTimGZkOnAmr5ngT8EYiWM5dxN7k8zNSXF0Dy36kR7L
 wix5aoCXP8t/SU7WdSrKg+rh3m1faTCtS8lKiNImTIVDdYjx2H2H+zanoOTMeYX2PqTg
 anwfOhV9UyQXvaQgrAb/Tn2OvnA+h3n4TVnIeiA+KpLEp6YRiSS0Eu5EU5RAmZwG9/Zx
 DFR2lpvve+CAN+uS+nylIbCd027VJipl/LxoU9XaYMscmqttlwS/bqWpj6xTykrljg/g
 eVdg==
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
Cc: Rhys Kidd <rhyskidd@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWJzZW5jZSBvZiBhIFRNRFMgSW5mbyBUYWJsZSBpcyBjb21tb24gb24gT3B0aW11cyBzZXR1cHMg
d2hlcmUgdGhlIE5WSURJQQpncHUgaXMgbm90IGNvbm5lY3RlZCBkaXJlY3RseSB0byBhbnkgb3V0
cHV0cy4KClJlcG9ydGluZyBhbiBlcnJvciBpbiB0aGlzIHNjZW5hcmlvIGlzIHRvbyBoYXJzaC4g
QWNjb3JkaW5nbHksIGNoYW5nZSB0aGUKZXJyb3IgbWVzc2FnZSB0byBhbiBpbmZvIG1lc3NhZ2Uu
CgpCeSBkZWZhdWx0IHRoZSBlcnJvciBtZXNzYWdlIGFsc28gY2F1c2VzIGEgYm9vdCBmbGlja2Vy
IGZvciB0aGVzZSBzeXRlbXMuCgpTaWduZWQtb2ZmLWJ5OiBSaHlzIEtpZGQgPHJoeXNraWRkQGdt
YWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jpb3MuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmlvcy5jIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9iaW9zLmMKaW5kZXggNjZiZjJhZmY0YTNlLi5iZGZhZGM2
MzIwNGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmlvcy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmlvcy5jCkBAIC05MzUsNyAr
OTM1LDcgQEAgc3RhdGljIGludCBwYXJzZV9iaXRfdG1kc190YmxfZW50cnkoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgc3RydWN0IG52YmlvcyAqYmlvcywKIAogCXRtZHN0YWJsZXB0ciA9IFJPTTE2
KGJpb3MtPmRhdGFbYml0ZW50cnktPm9mZnNldF0pOwogCWlmICghdG1kc3RhYmxlcHRyKSB7Ci0J
CU5WX0VSUk9SKGRybSwgIlBvaW50ZXIgdG8gVE1EUyB0YWJsZSBpbnZhbGlkXG4iKTsKKwkJTlZf
SU5GTyhkcm0sICJQb2ludGVyIHRvIFRNRFMgdGFibGUgbm90IGZvdW5kXG4iKTsKIAkJcmV0dXJu
IC1FSU5WQUw7CiAJfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
