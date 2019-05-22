Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F87270C7
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 22:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA05E899DB;
	Wed, 22 May 2019 20:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4EE899DB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 20:22:10 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id p18so2398752qkk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 13:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zmy7j+V2kfqtYYz1WddkagE0DXlderr4yqX5VeQ0jxE=;
 b=R5I5lCZgoKwQecwNo0xaq5zvIAK7uZOUSrbA8CY2FVocc5ONhMXbQHDE6kzHNvuCrv
 i3O4xRtUqqzt7PicpjyGVuf0co4rqx4VDWf7gmyLSEkTQDhEcNpn2spRXHGBdgyqO5Td
 4PI5FHpH2pidLZJn2TTRmuVF0FPQRnr7nhmE8lSlbh3ykrkCB4pQY8yPRCd03rE4Z3ff
 8on9EiCn0gE+v3w3uStLd0pfWmJZer+ARJnR0L7HX+DR4ZSntUAC2nUZ3/yu9tE/w2I+
 ZRasbRvAMsH/wZSLYFpipfN/iLLpfhm8J1iyO8w5FyJ56lSbebKBcLdkCND5SzAbHXdx
 4a2w==
X-Gm-Message-State: APjAAAWzBxqcKhIrceoamzuOfgC4+YTC25sZqKanNzdP3yDFKEaocM0z
 cjYNgPnrNAPwOMZNCERqya/wgFr7w5g=
X-Google-Smtp-Source: APXvYqyr5JtWJBxoh41hbTAkOsXHCvEtb3C3/m7M5P7Ry9zlF0gq04xYFw3DvF+dqaIxFQ/JKexWLA==
X-Received: by 2002:a05:620a:141c:: with SMTP id
 d28mr40026915qkj.18.1558556529503; 
 Wed, 22 May 2019 13:22:09 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id t187sm4546863qkh.10.2019.05.22.13.22.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 13:22:09 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Fix warning about unhandled enum value
Date: Wed, 22 May 2019 16:21:54 -0400
Message-Id: <20190522202207.223110-1-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zmy7j+V2kfqtYYz1WddkagE0DXlderr4yqX5VeQ0jxE=;
 b=Wv7fYjcBuPUYR9MTgyDgURjkjHlUrU+vf2Rjh5kikh+aeZcuBsA45dQS0W772uQXyR
 wJy78nYNEK2ip1KWnGM2LE22p5ty2akRWDyauopLTLGmMOimVzjTRVfFCtf1un/wRAhF
 H39a8cuaCC555EA90d9ghjrpvYjUMsCiJYkUByOaPQzw83C2xylldr98kJUHCtnGmcLy
 ZKCvmW1B9b0npeIxz4U15fKa2mrqGczcA47ac45qCszR0woi68ptU/PdMxnm5xrBbvIY
 jqHC27QIKbDoyUxjHvLVb6+EEAh2qcJtkbObfDMEZWzFgOk5einIXqDBdrI/NOjAONzY
 Br6Q==
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
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Hans Verkuil <hansverk@cisco.com>,
 David Airlie <airlied@linux.ie>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpGaXhlcyB0aGUgZm9sbG93
aW5nIGJ1aWxkIHdhcm5pbmc6CmRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jOjMy
NzoyOiB3YXJuaW5nOiBlbnVtZXJhdGlvbiB2YWx1ZSDigJhIRE1JX0lORk9GUkFNRV9UWVBFX0RS
TeKAmSBub3QgaGFuZGxlZCBpbiBzd2l0Y2ggWy1Xc3dpdGNoXQoKSW50cm9kdWNlZCB3aXRoIHRo
ZSBhZGRpdGlvbiBvZiBIRE1JX0lORk9GUkFNRV9UWVBFX0RSTSBpbiB0aGUgY29tbWl0CmJlbG93
LCBidXQgdGhlIGNvZGUgcmVhbGx5IHNob3VsZCBoYXZlIGJlZW4gZnV0dXJlLXByb29mZWQgZnJv
bSB0aGUKc3RhcnQuCgpGaXhlczogMmNkYmZkNjZhODI5ICgiZHJtOiBFbmFibGUgSERSIGluZm9m
cmFtZSBzdXBwb3J0IikKQ2M6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+CkNj
OiBTaGFzaGFuayBTaGFybWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+CkNjOiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogTWFhcnRlbiBMYW5r
aG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBh
cmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5
LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9s
bmllcmtpZUBzYW1zdW5nLmNvbT4KQ2M6ICJWaWxsZSBTeXJqw6Rsw6QiIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhbnMgVmVya3VpbCA8aGFuc3ZlcmtAY2lzY28uY29tPgpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5r
ZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMyArKysKIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5j
CmluZGV4IGUwNGU2YzI5M2QzOS4uMTBjYzk5MTBmMTY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWkuYwpAQCAtMzQxLDYgKzM0MSw5IEBAIHN0YXRpYyB2b2lkIG10a19oZG1pX2h3X3Nl
bmRfaW5mb19mcmFtZShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksIHU4ICpidWZmZXIsCiAJCWN0cmxf
ZnJhbWVfZW4gPSBWU19FTjsKIAkJY3RybF9yZWcgPSBHUkxfQUNQX0lTUkNfQ1RSTDsKIAkJYnJl
YWs7CisJZGVmYXVsdDoKKwkJZGV2X2VycihoZG1pLT5kZXYsICJVbmtub3duIGluZm9mcmFtZSB0
eXBlICVkXG4iLCBmcmFtZV90eXBlKTsKKwkJcmV0dXJuOwogCX0KIAltdGtfaGRtaV9jbGVhcl9i
aXRzKGhkbWksIGN0cmxfcmVnLCBjdHJsX2ZyYW1lX2VuKTsKIAltdGtfaGRtaV93cml0ZShoZG1p
LCBHUkxfSU5GT0ZSTV9UWVBFLCBmcmFtZV90eXBlKTsKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUg
RW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
