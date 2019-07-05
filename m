Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A1761B02
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B1D89A5C;
	Mon,  8 Jul 2019 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92776E2E1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:57:58 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id i2so4871124plt.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EMo2sIUAdM2t9ksGkmQROdMoH8vxWbe9ivlhPSrt+vI=;
 b=FUPbSvbK9uhvJGutQJjpK2JGDKG4KIEcKPHFQeaAMNU1E5ISTVJGyqDra1C6sGL/jM
 uigu9GW5J3OUgwPv2vvOE4T3FlNEp5zPq7NaDlal7mU1tsFi9f3dSinsK5Xj00x+Xp7t
 3OAEPOSASg75cANueawKW6K/oThJdZKNvfondN0r00VRjQeo6IL7fJgl2GYzPnC/+yWt
 SDs1xN9l5g7BWOcN3alJR9WpY95cwKu5d2trDxkKuXs4qeS5nYDsxIvnWEqQ2B1U1mOZ
 NMvqX6P7fxS5/92502L05KNs8IMGAoOxnrKlITMsMDY0pYDgI7ALlcd9yJ7rrgYOMii2
 4Bqg==
X-Gm-Message-State: APjAAAXyurfcHmtSx6QnNL1OxCSrygUPrLuD9AyPaEvvDuQ2XIpW08s/
 2lwDvCXyGY7pjgX8bDiNvvk=
X-Google-Smtp-Source: APXvYqy9E9YbthMyh/f84RHQz3Zq3bHJdWGugD0F0kOJ1Anu5XKQEHANzKBajC0m2agogW1KYP4lMg==
X-Received: by 2002:a17:902:f301:: with SMTP id
 gb1mr6663381plb.292.1562345878574; 
 Fri, 05 Jul 2019 09:57:58 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id 125sm11573309pfg.23.2019.07.05.09.57.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 09:57:58 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH 2/2] drm/panel: simple: Add support for Sharp LD-D5116Z01B
 panel
Date: Fri,  5 Jul 2019 09:57:55 -0700
Message-Id: <20190705165755.515-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EMo2sIUAdM2t9ksGkmQROdMoH8vxWbe9ivlhPSrt+vI=;
 b=Aw4Wd9tthSW64a6ZKiLJjfEyAgaABmJFwgwEaEPTYJ1oi5N5NDzZA4uN1W7SDD/90V
 EduPRk2IxoI5sh+fxq3m4w5W6VNLwk2Ac9sIzFMqjSq0dZJ+fiyiZ4+IB/rRD1zQxDfu
 CBReQV8eos0//ZG67acEWFCt0CUKcJ95wH5rbZ0vhdjR5Nu01kLxGyIA6fPcW2s46GIO
 zpBfoM/vzT9/PL/9pcyPwd6RxWZpvRqFBEpqICQ3rf1ju9IUBV2YQBzQBIZUlQlmwHrv
 qbM1X09V/v9auDId/vPRk/jadLEnpCvpEJDXLhTQq0sLx3H7Hxt9OP+D6siiEiKCVNlB
 OsJA==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFNoYXJwIExELUQ1MTE2WjAxQiBpcyBhIDEyLjMiIGVEUCBwYW5lbCB3aXRoIGEgMTkyMFgx
MjgwIHJlc29sdXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5o
dWdvQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMg
fCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggNWE5M2M0ZWRm
MWU0Li5lNmY1Nzg2NjczMjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAg
LTIzNTQsNiArMjM1NCwyOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgc2Ftc3Vu
Z19sdG4xNDBhdDI5XzMwMSA9IHsKIAl9LAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlIHNoYXJwX2xkX2Q1MTE2ejAxYl9tb2RlID0geworCS5jbG9jayA9IDE2ODQ4
MCwKKwkuaGRpc3BsYXkgPSAxOTIwLAorCS5oc3luY19zdGFydCA9IDE5MjAgKyA0OCwKKwkuaHN5
bmNfZW5kID0gMTkyMCArIDQ4ICsgMzIsCisJLmh0b3RhbCA9IDE5MjAgKyA0OCArIDMyICsgODAs
CisJLnZkaXNwbGF5ID0gMTI4MCwKKwkudnN5bmNfc3RhcnQgPSAxMjgwICsgMywKKwkudnN5bmNf
ZW5kID0gMTI4MCArIDMgKyAxMCwKKwkudnRvdGFsID0gMTI4MCArIDMgKyAxMCArIDU3LAorCS52
cmVmcmVzaCA9IDYwLAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHNoYXJw
X2xkX2Q1MTE2ejAxYiA9IHsKKwkubW9kZXMgPSAmc2hhcnBfbGRfZDUxMTZ6MDFiX21vZGUsCisJ
Lm51bV9tb2RlcyA9IDEsCisJLmJwYyA9IDgsCisJLnNpemUgPSB7CisJCS53aWR0aCA9IDI2MCwK
KwkJLmhlaWdodCA9IDEyMCwKKwl9LAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlIHNoYXJwX2xxMDM1cTdkYjAzX21vZGUgPSB7CiAJLmNsb2NrID0gNTUwMCwKIAku
aGRpc3BsYXkgPSAyNDAsCkBAIC0zMDAyLDYgKzMwMjUsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewogCX0sIHsKIAkJLmNvbXBhdGli
bGUgPSAic2Ftc3VuZyxsdG4xNDBhdDI5LTMwMSIsCiAJCS5kYXRhID0gJnNhbXN1bmdfbHRuMTQw
YXQyOV8zMDEsCisJfSwgeworCQkuY29tcGF0aWJsZSA9ICJzaGFycCxsZC1kNTExNnowMWIiLAor
CQkuZGF0YSA9ICZzaGFycF9sZF9kNTExNnowMWIsCiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJz
aGFycCxscTAzNXE3ZGIwMyIsCiAJCS5kYXRhID0gJnNoYXJwX2xxMDM1cTdkYjAzLAotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
