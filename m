Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0035DCD3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 05:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BFC6E0C9;
	Wed,  3 Jul 2019 03:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6406E0C9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 03:20:28 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so929069qtn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 20:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7uVNIuX8TZXF1pUQf2mXIeFwzdD8EjOAncb++sJiJNU=;
 b=K+Nt8sV7vhb0HCnKIu/kcla15avutaepxbV+xEm3ex46aBUrggdDwe4rSRPh1Dbc8p
 1yKiaHTbsozXtbULkW1tWz2a85oOOWFrmMlcUMoUzwUk1pDyvr1CEPAkAULVXc4pDrJz
 5oIIw29ff8rMq4nxNwGpcW3EBOxQ2e9lMAIWUeWQUUb8iEWksBOUeRnEyZTfrphPV/yV
 IVXn6s/30Mg2qVVSgYgPVYavVGPfnoUj1JSCRYGC34Ygr2sKlvf/ZVDRkTGzu7RwKLlq
 MUaJrRaZ/4xowm873lveazVI0DPZ6kd6wZdFWg0OxBPHf07Kqc1ZtFmFYhf3j3z2Y2bS
 gpDQ==
X-Gm-Message-State: APjAAAVu3d4I6q5Qc7WjgXxMEv5n8HBI5iuENx8YK6i8+wM3qE8DiZX5
 Ix488Oph3bvulXTcbTOhjafpy8L3
X-Google-Smtp-Source: APXvYqyGGJMehi8oviI/S+Y4JLLN/jdSLYbUUQ2L3Cx4qSjijeLtMbueurEXmXVyUztLVrZRdsXq2g==
X-Received: by 2002:aed:2961:: with SMTP id s88mr28140095qtd.120.1562124027065; 
 Tue, 02 Jul 2019 20:20:27 -0700 (PDT)
Received: from athos.hellosponsor.com
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id f132sm360426qke.88.2019.07.02.20.20.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 20:20:26 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] tests/util: fix incorrect memset argument order
Date: Tue,  2 Jul 2019 23:20:23 -0400
Message-Id: <20190703032023.22232-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7uVNIuX8TZXF1pUQf2mXIeFwzdD8EjOAncb++sJiJNU=;
 b=MDv1ihxjLPkQpJJZe+umH6SlTNbPN0wc8xXT2mtVVP5qiSq3K2bY83S6FhppomN2yd
 Bt8yWMzt4PC+69CJCTCHFIg1TCaPzHyMHcZR94QhRiJMooIKirDh9C+2QGOCW/ohcTrx
 UPSOaiTVCy4lpDIbvH2Tu6ia4+/0gxZMqUrAZBlvZZA6CuQ2YfTj3+weYk8EgtQgwLVB
 jqmFUuHh1apO0bFn4ZbzLIjatV4i9NGTJYM2aCCq7NASXfr+dMeyIpyojqQGFOH5471J
 7KwS/h8ZdlSMG0XXB8HdpQRD/Dmpo1i2oPMxjdy7DF7CS6D0g1q45swSFe+ji8Bq7saV
 Spqw==
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
Cc: Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZSBpdCBhY3R1YWxseSBjbGVhciB0aGUgTFVULgoKUmVwb3J0ZWQtYnk6IERhdmUgQWlybGll
IDxhaXJsaWVkQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IElsaWEgTWlya2luIDxpbWlya2lu
QGFsdW0ubWl0LmVkdT4KLS0tCiB0ZXN0cy91dGlsL3BhdHRlcm4uYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L3V0aWwvcGF0dGVybi5jIGIvdGVzdHMvdXRpbC9wYXR0ZXJuLmMKaW5kZXggNDJhMGU1YzcuLmJm
MTc5N2Q0IDEwMDY0NAotLS0gYS90ZXN0cy91dGlsL3BhdHRlcm4uYworKysgYi90ZXN0cy91dGls
L3BhdHRlcm4uYwpAQCAtNjQzLDcgKzY0Myw3IEBAIHZvaWQgdXRpbF9zbXB0ZV9jOF9nYW1tYSh1
bnNpZ25lZCBzaXplLCBzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqbHV0KQogCQlwcmludGYoIkVycm9y
OiBnYW1tYSB0b28gc21hbGw6ICVkIDwgJWRcbiIsIHNpemUsIDcgKyA3ICsgOCk7CiAJCXJldHVy
bjsKIAl9Ci0JbWVtc2V0KGx1dCwgc2l6ZSAqIHNpemVvZihzdHJ1Y3QgZHJtX2NvbG9yX2x1dCks
IDApOworCW1lbXNldChsdXQsIDAsIHNpemUgKiBzaXplb2Yoc3RydWN0IGRybV9jb2xvcl9sdXQp
KTsKIAogI2RlZmluZSBGSUxMX0NPTE9SKGlkeCwgciwgZywgYikgXAogCWx1dFtpZHhdLnJlZCA9
IChyKSA8PCA4OyBcCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
