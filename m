Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888A9439D9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 17:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEEC89B33;
	Thu, 13 Jun 2019 15:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2460E89B33
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:17:30 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id 33so14820363qtr.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 08:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bGNK1d0Xv7GxXmH2bfhCnv3hSiuIxOQH6M80YrpAFbg=;
 b=LLmgf97DQ43Um5UQdxOyrMLitKdLhuSv1S+Ykqw8Z5KBhA31WCdAjDUjcU44lAmTb6
 jVZnEGx0309dvzfxNQMwtsxwCizrNuwid8PrC5rCl302xoByA1TuIJgriybHXeVFzMz9
 8pcq5VmZXEQ8EWkm199BAkW2bPCzXLqy79YcFL5fcTQV4ykVDOaR+5uiS3yEJ+EX6p55
 zFtXlDJS5k/ut82JKF1XrbM08WAAdrQcDpPPG+MXPj9AWWrc4ie1QTxL8B1Dfbvw/Bfj
 TF5GWcuFC2txJTGPCCJTZDiGZPiMTK5dFWruuBuUMDczdgRex0RpGzUv5yQL+8q430mP
 yChg==
X-Gm-Message-State: APjAAAXANkfr1zDV/PyDclPimqOihvotpmqsw7Ccu18DDayj2iaM/VyV
 2LhiXG5gplT+/1OQ3gyYkMsE9eVb/xA=
X-Google-Smtp-Source: APXvYqzccEYb3lN3E8mI+ddJiTi8WFUyrc0/SlwYQBbc+d8kJiOZ9Eaf6pD5QdwwSLK8oIKtzIbx9g==
X-Received: by 2002:ac8:2b10:: with SMTP id 16mr57217884qtu.351.1560439049086; 
 Thu, 13 Jun 2019 08:17:29 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v186sm1688779qkc.36.2019.06.13.08.17.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 08:17:28 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/connector: Fix kerneldoc warning in HDR_OUTPUT_METADATA
 description
Date: Thu, 13 Jun 2019 11:17:23 -0400
Message-Id: <20190613151727.133696-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bGNK1d0Xv7GxXmH2bfhCnv3hSiuIxOQH6M80YrpAFbg=;
 b=gfgLShrOdv+5kNqWdz8F30pzoMJbuuG3vdPsovlgP+y+yxT/DYd4jTFhAXjOCnSUFv
 /gHuVdby5VwMdO70Q5obBp2iABib6ipvIY4nk5FhobueWFsmGq00n3hNcOuR7+SjTmtC
 Nvtlu8phwW8zeXXQK40f27sncCYzxcbiO8moKR7pne7LUSydLtnfOU+5GSRysChCgdAL
 6z5gt1XYC4RvqmUGxgDmNgtP0s1BQBPozVKcwYwUo8zCndZ9nqZt6ShUcPCE0NLpHkkg
 LutIvq/su8KGiXD4ColOKvf96sNaUHLC7NFboOq0wvqMR/r1ZdT43GS5iTTIRxhsTs5l
 4p/Q==
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hans Verkuil <hansverk@cisco.com>,
 David Airlie <airlied@linux.ie>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpGaXhlcyB0aGUgZm9sbG93
aW5nIHdhcm5pbmc6Ci4uL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmM6OTgxOiBXQVJO
SU5HOiBEZWZpbml0aW9uIGxpc3QgZW5kcyB3aXRob3V0IGEgYmxhbmsgbGluZTsgdW5leHBlY3Rl
ZCB1bmluZGVudC4KCkZpeGVzOiBhMDlkYjg4M2U1ZDkgKCJkcm06IEZpeCBkb2Nib29rIHdhcm5p
bmdzIGluIGhkciBtZXRhZGF0YSBoZWxwZXIgc3RydWN0dXJlcyIpCkNjOiBTaGFzaGFuayBTaGFy
bWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRA
Ym9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNv
bT4KQ2M6ICJWaWxsZSBTeXJqw6QiIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6
IEhhbnMgVmVya3VpbCA8aGFuc3ZlcmtAY2lzY28uY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCkNjOiBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4gKHYxKQpDYzogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGlu
dGVsLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiAi
VmlsbGUgU3lyasOkbMOkIiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fY29ubmVjdG9yLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCmluZGV4IGE1OThhNWViNDhkMjEuLjNjY2RjZjNkZmNk
ZTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwpAQCAtOTc4LDYgKzk3OCw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX3Byb3BfZW51bV9saXN0IGhkbWlfY29sb3JzcGFjZXNbXSA9IHsKICAq
CVVzZXJzcGFjZSB3aWxsIGJlIHJlc3BvbnNpYmxlIHRvIGRvIFRvbmUgbWFwcGluZyBvcGVyYXRp
b24gaW4gY2FzZToKICAqCQktIFNvbWUgbGF5ZXJzIGFyZSBIRFIgYW5kIG90aGVycyBhcmUgU0RS
CiAgKgkJLSBIRFIgbGF5ZXJzIGx1bWluYW5jZSBpcyBub3Qgc2FtZSBhcyBzaW5rCisgKgogICoJ
SXQgd2lsbCBldmVuIG5lZWQgdG8gZG8gY29sb3JzcGFjZSBjb252ZXJzaW9uIGFuZCBnZXQgYWxs
IGxheWVycwogICoJdG8gb25lIGNvbW1vbiBjb2xvcnNwYWNlIGZvciBibGVuZGluZy4gSXQgY2Fu
IHVzZSBlaXRoZXIgR0wsIE1lZGlhCiAgKglvciBkaXNwbGF5IGVuZ2luZSB0byBnZXQgdGhpcyBk
b25lIGJhc2VkIG9uIHRoZSBjYXBhYmlsdGllcyBvZiB0aGUKLS0gClNlYW4gUGF1bCwgU29mdHdh
cmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
