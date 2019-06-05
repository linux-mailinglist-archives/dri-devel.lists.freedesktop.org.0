Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B2335E40
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 15:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E2E8997E;
	Wed,  5 Jun 2019 13:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719308997E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 13:48:51 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id 16so9610558ljv.10
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 06:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WlFr2JfwEGW3YBAPmeCGdTYH+ig7Gf0xMbO7JvAtkS0=;
 b=JlAkDQK7mZCQT210EIhItwD+JLGRNVGqLkWYr4hv+ioS7YX8PtonVPtlZawT+xYaO3
 9bg/HiSbEJvau6FiiLnnkV6hJsycfi12e7cJpngh0NU/W7CU9yV4M/EvmGxd6ymwjlrW
 NsvzzP5VGqh/9SGRSDUvGX8VNSSPwVuAmCwP/qiOc6KOWrDsh9NGlffEk8JgePOLhfef
 D29FVAkvw8yHcLCbGC0vc45HJkEaggBZvPQ3YJ46ie76LehPeXhau5IXtt2tLceX5yrG
 L2Iiwb/ELz8BMkFvcqUdxu5ylWinKkUvpdcX2dSH9//ZEaQvm7/MBP711qhB6gCA8BlP
 u9Hw==
X-Gm-Message-State: APjAAAVUHxvVsDoh4MQFYCws82xxdB6J1M/TIqNdN0l+4ArQtc6WzB/s
 enI0dEH36uN979E1IBEIjyc=
X-Google-Smtp-Source: APXvYqwiOsuqyG/sFAp643vWuAL+fXFk7SuwIndElbUu5bK0tFQw8ocuJ8JL98R1yiuzWIh14xKwqA==
X-Received: by 2002:a2e:9a54:: with SMTP id k20mr21580357ljj.168.1559742529884; 
 Wed, 05 Jun 2019 06:48:49 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a3sm2454016ljd.51.2019.06.05.06.48.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 06:48:49 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/1] sti: drop drmP.h
Date: Wed,  5 Jun 2019 15:48:34 +0200
Message-Id: <20190605134835.25112-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WlFr2JfwEGW3YBAPmeCGdTYH+ig7Gf0xMbO7JvAtkS0=;
 b=jE3GW0PnnR7mr1pFrYfYEqM00tUPp4muI/wM9WhGLguaS4r65a3++o6TeTYI02Cc9g
 /ZPTgpZLgs0Ewxywbw4R9ELZZkkpPq7oazT9wRCZeqtYxweNwnuL4cNQdA4N8He9Ww3w
 Hfba7KeDF1PVXZ0gWmeSdcBg2xLnPLgFHn5HhrLxZ+vJozsya70IMPWgcf3O8l1OCssB
 9o3X9KkveM9J86eRdfw7/hlyS/VhcICyP0RU9t8sXGKfSb3gX/yVfwHyJaWoha1kh94F
 DwBQGYVQhOqh7jCF/3A5rlyOjRkBeLPO3OnndYfaIO2qhbB78HSURgxKwEr467cF8WA5
 HVRA==
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
Cc: David Airlie <airlied@linux.ie>, Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgZHJtUC5oIGluIHRoZSBzdGkgZHJpdmVyLgoKCVNhbQoKU2FtIFJhdm5ib3Jn
ICgxKToKICAgICAgZHJtL3N0aTogZHJvcCB1c2Ugb2YgZHJtUC5oCgogZHJpdmVycy9ncHUvZHJt
L3N0aS9zdGlfYXdnX3V0aWxzLmMgICAgICAgIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9zdGkv
c3RpX2F3Z191dGlscy5oICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9j
b21wb3NpdG9yLmMgICAgICAgfCAgNSArKysrLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfY3J0
Yy5jICAgICAgICAgICAgIHwgIDQgKysrLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfY3J0Yy5o
ICAgICAgICAgICAgIHwgIDYgKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9jdXJzb3Iu
YyAgICAgICAgICAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfY3Vyc29yLmggICAg
ICAgICAgIHwgIDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYuYyAgICAgICAgICAg
ICAgfCAxMSArKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHJ2LmggICAgICAg
ICAgICAgIHwgIDUgKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2R2by5jICAgICAgICAg
ICAgICB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZ2RwLmMgICAgICAgICAgICAg
IHwgIDQgKysrKwogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZ2RwLmggICAgICAgICAgICAgIHwg
IDUgKysrKysKIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkYS5jICAgICAgICAgICAgICB8ICA2
ICsrKysrLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jICAgICAgICAgICAgIHwgIDUg
KysrKy0KIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuaCAgICAgICAgICAgICB8ICA0ICsr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWlfdHgzZzRjMjhwaHkuYyB8ICAyICsrCiBk
cml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9ocXZkcC5jICAgICAgICAgICAgfCAgOCArKysrKysrLQog
ZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfbWl4ZXIuYyAgICAgICAgICAgIHwgIDQgKysrKwogZHJp
dmVycy9ncHUvZHJtL3N0aS9zdGlfbWl4ZXIuaCAgICAgICAgICAgIHwgIDcgKysrKysrLQogZHJp
dmVycy9ncHUvZHJtL3N0aS9zdGlfcGxhbmUuYyAgICAgICAgICAgIHwgIDQgKysrLQogZHJpdmVy
cy9ncHUvZHJtL3N0aS9zdGlfcGxhbmUuaCAgICAgICAgICAgIHwgIDEgLQogZHJpdmVycy9ncHUv
ZHJtL3N0aS9zdGlfdHZvdXQuYyAgICAgICAgICAgIHwgIDYgKysrKystCiBkcml2ZXJzL2dwdS9k
cm0vc3RpL3N0aV92aWQuYyAgICAgICAgICAgICAgfCAgNCArKystCiBkcml2ZXJzL2dwdS9kcm0v
c3RpL3N0aV92dGcuYyAgICAgICAgICAgICAgfCAgNCArKystCiBkcml2ZXJzL2dwdS9kcm0vc3Rp
L3N0aV92dGcuaCAgICAgICAgICAgICAgfCAgMSArCiAyNSBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNl
cnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
