Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEE34F5A1
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 14:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E436E976;
	Sat, 22 Jun 2019 12:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0546E976;
 Sat, 22 Jun 2019 12:12:07 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z15so6825761lfh.13;
 Sat, 22 Jun 2019 05:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hy/RCcVn7OgplBAaYGm9nMY04TO7rRA6fuPGx0/scCg=;
 b=Gx7k60ODEgr+5C+rLqjR4fGpuBz2JoFhYyRe3dJhi6fhJtDHREn13KdCb3AVoIcc6h
 ktW1MmouRVtH9wdOo+Z9kM5TOJsTjsnB5G1KltgWx/7wQGdE419j1rd7OW5nahs273p/
 TzxHh98CRXZesTBKWM3zUGhjq6aTi/Kb8L+WKn5HC4EEPc9EIExocYsQVBhU6OmBKh1I
 aV1XPqcHXwmi4lqRjaiQ+nvUnuTAqI3rl0t6lDmTJaZuZtr19zbvNDifSpd7ITmtiufv
 SVRSUDhmJkXNb1urXZV+R3b9joEQh9v99eACQ1TMRuJlwyatYXa9SX3dAqKYt0EOu0Rp
 6lTQ==
X-Gm-Message-State: APjAAAU1jAjHj4V/HM5csLgoTJO0KIq8YtMe/Wz/yPRzuVU1ZWXq0Ktk
 CZiT8z3Jy+kbrWatguSXOyKDt9+zklkj1w==
X-Google-Smtp-Source: APXvYqz0fBG9cKgzCcJG79syFZuVUcncD6uksSp8UUxQ+aRE27eaKLGDL2c+4vKSpfg5LJVKS6QxPw==
X-Received: by 2002:a19:e619:: with SMTP id d25mr27486449lfh.34.1561205525468; 
 Sat, 22 Jun 2019 05:12:05 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 k4sm816910ljg.59.2019.06.22.05.12.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 05:12:05 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/2] drm: drop uapi dependency from drm_vblank.h
Date: Sat, 22 Jun 2019 14:11:56 +0200
Message-Id: <20190622121156.17217-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622121156.17217-1-sam@ravnborg.org>
References: <20190622121156.17217-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hy/RCcVn7OgplBAaYGm9nMY04TO7rRA6fuPGx0/scCg=;
 b=bs+iXcruPckX3t0jwk61NZlQD29C2b91SoeXECBmS+byO31nkBVuS3/X+t3dh2jVj+
 EuPzYMuRKM+mCutVI4PtCa1Arg0+QDOpgujDJGcbD/b+n7RoZGYwTBtAwkcadTpDIffV
 GrUcGStCv0pg6n9ZsKEuE+sitdSIKS/P9ySwwX96ay6o1AJ9bYny+4OlTLf+avAIrKAT
 4k1pwxpIodVgtnRm/+z7sTWK/4yCeyzYr/a3DsRSXZX4g7jOlfItoT79mytTDlH19OQ1
 zIiKObLjBLC+/XHw4fDkBbK9uBR/fv1wWX4A43iG5PMP64H2OGo9tKPhzEtGFoqeKn/Q
 aSyw==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX3ZibGFuay5oIGluY2x1ZGVkIHVhcGkvZHJtL2RybS5oLgpJdCB0dXJucyBvdXQgdGhpcyBp
bmNsdWRlIHdhcyBub3QgcmVxdWlyZWQgLSBkZWxldGUgaXQuCgpOb3RlOiB1YXBpL2RybS9kcm0u
aCBpcyBpbmNsdWRlZCBpbmRpcmVjdCB2aWEgZHJtX2ZpbGUuaCwKYnV0IHRoZXJlIGFyZSBubyBk
ZXBlbmRlbmNpZXMgaW4gZHJtX3ZibGFuay5oIHNvIHRoZSByZW1vdmFsCmlzIGxlZ2l0LgoKU2ln
bmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9v
cmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBpbmNsdWRlL2RybS9kcm1fdmJsYW5rLmggfCAx
IC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX3ZibGFuay5oIGIvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCmluZGV4IGU1MjhiYjJm
NjU5ZC4uOWZlNGJhOGJjNjIyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fdmJsYW5rLmgK
KysrIGIvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCkBAIC0zMCw3ICszMCw2IEBACiAKICNpbmNs
dWRlIDxkcm0vZHJtX2ZpbGUuaD4KICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzLmg+Ci0jaW5jbHVk
ZSA8dWFwaS9kcm0vZHJtLmg+CiAKIHN0cnVjdCBkcm1fZGV2aWNlOwogc3RydWN0IGRybV9jcnRj
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
