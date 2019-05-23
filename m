Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EEC27EDF
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 15:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F43D89E5B;
	Thu, 23 May 2019 13:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7B989E5B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 13:55:07 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z5so444352qtb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 06:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RoLH+1OrHmh/LP5/MP38zvovli5jsWEZsxOs+ayZS9U=;
 b=KEFYBJp1Tl0NBjwSjbIM03OkJ7ZbX1DT4B5WZMvVZoCKwfIPFVjJWuKCe/Ry9jjRF7
 1njPqjOuDh8IHOXDNHt32MAKTnC9aUS1++Gr2fHWF9KBsiLIz3N1fqTnmV5JiRR4mTMA
 LDBSnCCjY8yZsxfiyRBpfG7/NmF2gEVBigE63CYSE5IvhYndC4+S0docoW2d8YhVtBNE
 JhFbQvoGj3iJRIFFE1zbdDCdKJZhV6FL1qV5IF4HxHo42gqkZR0uAxX8pGtp+gEATCgc
 CsakRk0zfxAZu48PyDC6EgSMq0XR1AQmMpXItU6pZ9PrWhPGnMsHDxd925UCIaNr1MHf
 ymyA==
X-Gm-Message-State: APjAAAU55U3i6cT3mrHEXRus/9p6PnueSLsyhZAuJK/MeysV51IlvCOL
 PeQaLWYEPbn0Z4q4J3u16Bm84QZL+pE=
X-Google-Smtp-Source: APXvYqy5IvdM4mKrSHbVmmDEPXFfC06X0nVwwJxjzFVDCmtxjWMsGKE3cQuk2yliwbN+kqQp0HtVTw==
X-Received: by 2002:ac8:2c33:: with SMTP id d48mr8900292qta.40.1558619706337; 
 Thu, 23 May 2019 06:55:06 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id o13sm14808383qtk.74.2019.05.23.06.55.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 06:55:05 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Fix docbook in drm_hdmi_infoframe_set_hdr_metadata()
Date: Thu, 23 May 2019 09:54:58 -0400
Message-Id: <20190523135504.184354-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RoLH+1OrHmh/LP5/MP38zvovli5jsWEZsxOs+ayZS9U=;
 b=N/9Y/Xl8Tt5h0I9hzt2GvLliViKn9QgrucYHB55S9E5I5mrVdLd79mPly8nQy/17PS
 mi3RbmlM1m2zrywCX4XafL5t8O7yyUxldtCNctLSB3y0dVWf6GbEtiLlL7kB9qIkL+aO
 RMMDASITpGDnAXFjLShvmgj4faIA/z0ZlQMkIz6sx0R351pGILRksMo3TrgV+j9MwCvz
 Jc1onpQnoAPx5orodpyk5wEaOBP6Hapw9p+cGxIqjghJ1ZAoJu/3s5uD+v/Tg5f4QEOJ
 /0++jL6GbsR5+csAGuIxpvivpykkcJmAqgwTR75YntjvHF5T5xR57Tr0fWzQEEsHHcPh
 AyoA==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Hans Verkuil <hansverk@cisco.com>,
 David Airlie <airlied@linux.ie>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpGaXhlcyB0aGUgZm9sbG93
aW5nIHdhcm5pbmdzOgouLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYzo0OTI1OiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdjb25uX3N0YXRlJyBub3QgZGVzY3JpYmVk
IGluICdkcm1faGRtaV9pbmZvZnJhbWVfc2V0X2hkcl9tZXRhZGF0YScKLi4vZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmM6NDkyNTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAn
aGRyX21ldGFkYXRhJyBkZXNjcmlwdGlvbiBpbiAnZHJtX2hkbWlfaW5mb2ZyYW1lX3NldF9oZHJf
bWV0YWRhdGEnCgpGaXhlczogMmNkYmZkNjZhODI5ICgiZHJtOiBFbmFibGUgSERSIGluZm9mcmFt
ZSBzdXBwb3J0IikKQ2M6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+CkNjOiBT
aGFzaGFuayBTaGFybWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmll
cmtpZUBzYW1zdW5nLmNvbT4KQ2M6ICJWaWxsZSBTeXJqw6Rsw6QiIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KQ2M6IEhhbnMgVmVya3VpbCA8aGFuc3ZlcmtAY2lzY28uY29tPgpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJu
ZWwub3JnClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwppbmRleCAyNjI1MTBjMmE2
NzAuLmQ4N2Y1NzRmZWVjYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKQEAgLTQ5MTQsNyArNDkxNCw3IEBAIHN0
YXRpYyBpbmxpbmUgYm9vbCBpc19lb3RmX3N1cHBvcnRlZCh1OCBvdXRwdXRfZW90ZiwgdTggc2lu
a19lb3RmKQogICogZHJtX2hkbWlfaW5mb2ZyYW1lX3NldF9oZHJfbWV0YWRhdGEoKSAtIGZpbGwg
YW4gSERNSSBEUk0gaW5mb2ZyYW1lIHdpdGgKICAqICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBIRFIgbWV0YWRhdGEgZnJvbSB1c2Vyc3BhY2UKICAqIEBmcmFtZTogSERN
SSBEUk0gaW5mb2ZyYW1lCi0gKiBAaGRyX21ldGFkYXRhOiBoZHJfc291cmNlX21ldGFkYXRhIGlu
Zm8gZnJvbSB1c2Vyc3BhY2UKKyAqIEBjb25uX3N0YXRlOiBDb25uZWN0b3Igc3RhdGUgY29udGFp
bmluZyBIRFIgbWV0YWRhdGEKICAqCiAgKiBSZXR1cm46IDAgb24gc3VjY2VzcyBvciBhIG5lZ2F0
aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KICAqLwotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBF
bmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
