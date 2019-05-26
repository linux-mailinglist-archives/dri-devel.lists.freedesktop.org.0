Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC2B2AB6B
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 19:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05779893A4;
	Sun, 26 May 2019 17:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3555D893A4;
 Sun, 26 May 2019 17:35:49 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m15so9814800lfh.4;
 Sun, 26 May 2019 10:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e7AnEl+sTa5CZ3787NmnwKOXoYZg2C++bC2zllDWaWE=;
 b=hYWiQB+JKiHWhnW9/q06tjtnXasNEucfCZTONPceDSdzMw7khADGDLjuECg2oVhqkx
 RGUcjgopHy9jwzjseccUNByD3ySdjuXIcW50HOV5KYLOfGH7lgHRQ26CZr/Mmb0DsDU8
 c0Dx3p2XTYwwnTs/N2ktj0YHAdjglPSpy9F84f2bUAO1ofvy3JOA+kHeODOKJTe4Acmu
 1rI+Y5skpbu4Yn6cl1dgEYUkLJ6zyCcstUeidPFFG5CJ3qDTYhqd20EbULq6gn3NCZgk
 /AgpENi7g5lpAykzWvMY+13eTxArZbeks6A11GDM9PevdYY8rToOEz7E95bb4pPTZpzx
 0s2A==
X-Gm-Message-State: APjAAAUAzpTRdsUahIDIEKJtKSUmyNBgJsT5P+uCn8RMc3dioc/uf78T
 dWTdZJmdd0ylw0XGsYgyrZv6oQap
X-Google-Smtp-Source: APXvYqwRaO9mwsg0aL874OOUMrvTC3ELaefs5+lR1CdnyksoQ5yV6+YLPpttNY0VABPy75N4juH6jA==
X-Received: by 2002:ac2:5606:: with SMTP id v6mr19145555lfd.129.1558892147342; 
 Sun, 26 May 2019 10:35:47 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n9sm1774489ljj.10.2019.05.26.10.35.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 10:35:46 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm: make drm_internal.h self-contained
Date: Sun, 26 May 2019 19:35:32 +0200
Message-Id: <20190526173535.32701-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526173535.32701-1-sam@ravnborg.org>
References: <20190526173535.32701-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e7AnEl+sTa5CZ3787NmnwKOXoYZg2C++bC2zllDWaWE=;
 b=cUZJ1mDES5jaAgspt5pTquhLlZbBiCqloFIbyK6dElinotcVpV08lTeT7BZetd+paD
 cZSLT8iz2ExC1IVvWVvARggqxZc/UHFSVnZl1RpyFvXz0Hg0yQODkHhdHWfbtUhfolEU
 YfopjnCYnhM+/bnpOBl8rs3cl9a0p36NvcFGB3+l9N1z00IMtFKvt6v9nJ2TkuSCgRFd
 +pCRBR1gbrduLJy3Wpyumz9Jx0LbWcNzfYmqqtapuw3gbjvHAwlmkUsu8gC02lLz7BP5
 VeRW5tFT0TJD3U9ekQr5q/LnkyOP0poWXOyk57HhUj6hNr0bd5On+7/WgtjqaKih/bZp
 zIiA==
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

RG8gbm90IHJlcXVpcmUgdXNlcnMgb2YgZHJtX2ludGVybmFsLmggdG8gaW5jbHVkZSBvdGhlcgpm
aWxlcyBqdXN0IHRvIGxldCBpdCBidWlsZAoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxp
bi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmggfCAxMCArKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5oIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pbnRlcm5h
bC5oCmluZGV4IGU2MjgxZDlmOWM4Ny4uNzZiZDRiODFjNWIxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ludGVybmFsLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pbnRlcm5h
bC5oCkBAIC0yOCw4ICsyOCwxNiBAQAogCiAjZGVmaW5lIERSTV9JRl9WRVJTSU9OKG1haiwgbWlu
KSAobWFqIDw8IDE2IHwgbWluKQogCi1zdHJ1Y3QgZHJtX3ByaW1lX2ZpbGVfcHJpdmF0ZTsKK3N0
cnVjdCBkZW50cnk7CiBzdHJ1Y3QgZG1hX2J1ZjsKK3N0cnVjdCBkcm1fY29ubmVjdG9yOworc3Ry
dWN0IGRybV9jcnRjOworc3RydWN0IGRybV9mcmFtZWJ1ZmZlcjsKK3N0cnVjdCBkcm1fZ2VtX29i
amVjdDsKK3N0cnVjdCBkcm1fbWFzdGVyOworc3RydWN0IGRybV9taW5vcjsKK3N0cnVjdCBkcm1f
cHJpbWVfZmlsZV9wcml2YXRlOworc3RydWN0IGRybV9wcmludGVyOwogCiAvKiBkcm1fZmlsZS5j
ICovCiBleHRlcm4gc3RydWN0IG11dGV4IGRybV9nbG9iYWxfbXV0ZXg7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
