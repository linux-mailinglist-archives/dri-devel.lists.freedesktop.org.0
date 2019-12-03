Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C1110202
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292FF6E847;
	Tue,  3 Dec 2019 16:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8786E844
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:19:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so4407337wrh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qux6awnp95L6xNm3T6+oYkp3AFsi3QUxGHXoIt7wf6k=;
 b=QTRd8T2abcROz65BYuoFDUtt+sMx+yCWOYrhMk31w1H8KF5uU1ija8YoJxS6tkDyRY
 XsLVhSWX+1Em4PZqPP54Ksa00+Tv/bvumjGqsmQSlSfUD6T164O/VS1YaXzClugthF36
 7/rh9zECUkKW7hz5u7rQaxIeXoVXgFIH2QsVyfe8WpdiLAAqV/5XPy48KExgI9aY/iZg
 HxM3GoJBkBtu4i9feNqiy9qhtcPQCWR47er2pLHiixS59Mq7AiQLSntUcnCSSFfps5O5
 LYndhGAs5C14R4kJ3JzAAFYnqap6Vfycf9c8/K/Ym0yTFn6wxGThaJNMyCFqR+3WLGHZ
 BVvQ==
X-Gm-Message-State: APjAAAUaH+OmQeysMaWW3H/1J6AGMURtM360nPdEICWNLb73l+wXdwwH
 WkIOLzc3qfF+OwTWN5GhBHOHER7vBPw=
X-Google-Smtp-Source: APXvYqwaplyrvpWZla0pN+4IoaFpU0BdHYNiurx7esWjyDLcNYfr98Ii/Vaq3gdyCmy8OwMNXYlJAA==
X-Received: by 2002:adf:d848:: with SMTP id k8mr5905794wrl.328.1575389968528; 
 Tue, 03 Dec 2019 08:19:28 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id l7sm4141691wrq.61.2019.12.03.08.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:19:27 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 6/9] drm/tegra: vic: Export module device table
Date: Tue,  3 Dec 2019 17:19:11 +0100
Message-Id: <20191203161914.1312555-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qux6awnp95L6xNm3T6+oYkp3AFsi3QUxGHXoIt7wf6k=;
 b=UqCeb9VgVsi5yo+3k3wpc86dDAXTjZtAMQHpnCQwMLRJRXbjR/WSS4//0jL9gWcZaI
 i80WwGIoVyhi+MG1ezE5sWd9+NiUgjqlhT8OUOTh8HGdHTe7r+4b6pK185xGAqcae9nA
 5+bD13qEOOJlkB5OKOnD++hQPX6poKgLFef1xobqD2y3vKpfj9mW/pdDxy1bbq08CbeP
 IsepQaNIAOl5M4I1GuQhNiOKPQiI1Zzk969+JbcRTObhGM2KJV5PtRdoeBoWk5OIz1dc
 zI3bFc/YBkF5DKOc8NWsPmecYbJcRRo47HmMqhEQQ5MjIrnLyAKE9bgsXKDrI1lNONQH
 PQeg==
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkV4cG9ydCB0aGUgbW9k
dWxlIGRldmljZSB0YWJsZSB0byBlbnN1cmUgdGhlIFZJQyBjb21wYXRpYmxlIHN0cmluZ3MgYXJl
Cmxpc3RlZCBpbiB0aGUgbW9kdWxlJ3MgYWxpYXNlcyB0YWJsZS4gVGhpcyBpbiB0dXJuIGNhdXNl
cyB0aGUgZHJpdmVyIHRvCmJlIGF1dG9tYXRpY2FsbHkgbG9hZGVkIG9uIGJvb3QgaWYgVklDIGlz
IHRoZSBvbmx5IGVuYWJsZWQgc3ViZGV2aWNlIG9mCnRoZSBsb2dpY2FsIGhvc3QxeCBEUk0gZGV2
aWNlLgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvdmljLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMKaW5kZXggOTQ0NGJh
MTgzOTkwLi5jNGQ4MmI4YjMwNjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92
aWMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMKQEAgLTM4NiwxMyArMzg2LDE0
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmljX2NvbmZpZyB2aWNfdDE5NF9jb25maWcgPSB7CiAJ
LnN1cHBvcnRzX3NpZCA9IHRydWUsCiB9OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCB2aWNfbWF0Y2hbXSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHRl
Z3JhX3ZpY19vZl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAibnZpZGlhLHRlZ3JhMTI0
LXZpYyIsIC5kYXRhID0gJnZpY190MTI0X2NvbmZpZyB9LAogCXsgLmNvbXBhdGlibGUgPSAibnZp
ZGlhLHRlZ3JhMjEwLXZpYyIsIC5kYXRhID0gJnZpY190MjEwX2NvbmZpZyB9LAogCXsgLmNvbXBh
dGlibGUgPSAibnZpZGlhLHRlZ3JhMTg2LXZpYyIsIC5kYXRhID0gJnZpY190MTg2X2NvbmZpZyB9
LAogCXsgLmNvbXBhdGlibGUgPSAibnZpZGlhLHRlZ3JhMTk0LXZpYyIsIC5kYXRhID0gJnZpY190
MTk0X2NvbmZpZyB9LAogCXsgfSwKIH07CitNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCB0ZWdyYV92
aWNfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgaW50IHZpY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogewpAQCAtNTE2LDcgKzUxNyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2
X3BtX29wcyB2aWNfcG1fb3BzID0gewogc3RydWN0IHBsYXRmb3JtX2RyaXZlciB0ZWdyYV92aWNf
ZHJpdmVyID0gewogCS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gInRlZ3JhLXZpYyIsCi0JCS5vZl9t
YXRjaF90YWJsZSA9IHZpY19tYXRjaCwKKwkJLm9mX21hdGNoX3RhYmxlID0gdGVncmFfdmljX29m
X21hdGNoLAogCQkucG0gPSAmdmljX3BtX29wcwogCX0sCiAJLnByb2JlID0gdmljX3Byb2JlLAot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
