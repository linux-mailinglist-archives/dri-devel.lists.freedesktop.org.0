Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8455E236D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 21:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985066E114;
	Wed, 23 Oct 2019 19:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258816E114
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 19:51:32 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id r134so7862553ywg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 12:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JKxzTkPUnLBEMDTwoJW4PDaivqT9rS13Dxxf3jk+VxQ=;
 b=NR2lFJErtJxMDKgGSaywAPLyU6M4k0ELactZltEt5mbv+dyfQAhyg2lPheDOVJx7L6
 FUFIIBkDVRByQM5Pq+2RAFVfj6zMQ19P9QXEIR2OBLxjTI3SeRZTIOKdKsiCuYUmpACR
 CJBxBfrJ38bkvosm2QMpXWg4Xtmr9sUUgtML6JxqFacCIzd/1wi92U3JQqZzRT+3QGzH
 lrjTWdXPVh3j24wnL5yNJWwKqzCOu4Cabx908AH+yl5aY1ZjV6SIHLoQ+EgeJjac5McC
 eXKd//72xFtBmH5gS7CI8AsnFow2pOjBQ7UpCbMe7fW3QgQMI1Vsq4HlCozJH1nPi7xn
 mRxA==
X-Gm-Message-State: APjAAAVF1nEM4lC99h9Dfb9BpYymSC9Grqb7Ivd6Dw/uK/9D1sxw/4kU
 guuw4iTfIPexc+YKDKg8XVeNCYPSMt0=
X-Google-Smtp-Source: APXvYqxMQsj3ijgyrWt7i52xtn9PuwOHnFfUuiHehIa12RuB5Pietb4A88Y+G276WQTvDzHNA0Sbfg==
X-Received: by 2002:a81:a042:: with SMTP id x63mr4309899ywg.301.1571860290828; 
 Wed, 23 Oct 2019 12:51:30 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id i190sm3863706ywg.1.2019.10.23.12.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 12:51:30 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Add RGB[A] variants to published plane formats
Date: Wed, 23 Oct 2019 15:51:17 -0400
Message-Id: <20191023195129.165775-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JKxzTkPUnLBEMDTwoJW4PDaivqT9rS13Dxxf3jk+VxQ=;
 b=akx8r6jT3I/V5VK3DFavJjpWCKXwwJ54pN/CwmMI0RlJyZXFn/JghN8q9eMkILt3Bj
 oti1pmNbQckNpl/EOB+0rvU43Jkp64k2lwFauXbNzIFglRxrjixYWv+/9vFbz4FSx7xt
 aCMFM4zSJU68ra8kLEV0pq7q1NvvpRqI6rsXzt5dWB2ohv+oXhO9pJPUPI1oF1oem2Sw
 rq6JfMoGgw5JXRYPA0jreainYMEzVFOeuSrMGwoUZa7igdExt3DSBSdtEL+p6xVDcD5S
 WXwlEWUgilxeHrI8+MHumVZ3Yo5yQmHsNzu+kRSyX06v+n31hCwfQH3eiyoGwvdDwwGE
 cHtg==
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniele Castagna <dcastagna@chromium.org>, David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>, Miguel Casas <mcasas@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGVzZSBmb3JtYXRzIGFy
ZSBoYW5kbGVkIGluIHRoZSByZG1hIGNvZGUsIGJ1dCBmb3Igc29tZSByZWFzb24gdGhleSdyZQpu
b3QgcHVibGlzaGVkIGFzIHN1cHBvcnRlZCBmb3JtYXRzIGZvciB0aGUgcGxhbmVzLiBTbyBhZGQg
dGhlbSB0byB0aGUKbGlzdC4KCkNjOiBOaWNvbGFzIEJvaWNoYXQgPGRyaW5rY2F0QGNocm9taXVt
Lm9yZz4KQ2M6IERhbmllbGUgQ2FzdGFnbmEgPGRjYXN0YWduYUBjaHJvbWl1bS5vcmc+CkNjOiBN
aWd1ZWwgQ2FzYXMgPG1jYXNhc0BjaHJvbWl1bS5vcmc+ClRlc3RlZC1ieTogTWlndWVsIENhc2Fz
IDxtY2FzYXNAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVs
QGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFu
ZS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYwppbmRleCA1ODRhOWVjYWRjZTYuLjQ5ZDU5
NDcwY2MxMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxh
bmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jCkBAIC0y
MCw2ICsyMCwxMiBAQAogc3RhdGljIGNvbnN0IHUzMiBmb3JtYXRzW10gPSB7CiAJRFJNX0ZPUk1B
VF9YUkdCODg4OCwKIAlEUk1fRk9STUFUX0FSR0I4ODg4LAorCURSTV9GT1JNQVRfQkdSWDg4ODgs
CisJRFJNX0ZPUk1BVF9CR1JBODg4OCwKKwlEUk1fRk9STUFUX0FCR1I4ODg4LAorCURSTV9GT1JN
QVRfWEJHUjg4ODgsCisJRFJNX0ZPUk1BVF9SR0I4ODgsCisJRFJNX0ZPUk1BVF9CR1I4ODgsCiAJ
RFJNX0ZPUk1BVF9SR0I1NjUsCiAJRFJNX0ZPUk1BVF9VWVZZLAogCURSTV9GT1JNQVRfWVVZViwK
LS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
