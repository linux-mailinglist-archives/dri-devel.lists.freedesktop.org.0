Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0215EF85
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 01:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE656E1CE;
	Wed,  3 Jul 2019 23:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E092E6E1CE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 23:10:47 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id p184so1976645pfp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 16:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tF6PJXwXdA+T8gXlP/iy+yAeb6/0Jnz/ftcQAzJBllI=;
 b=rABzHtwx7T9MezW4M9uR5FAdlbx+DrtDawb4+SUUGB8okl9vmSnL3cbtLx3U9kSzlb
 aqG8WpuyUMyNsfMWTtFq2LkxTKNwFLUQIK8aciaTWmyIcAzWNNQY0Lzh5kUWPvQr+Qtf
 6TeKsgmyaSQSp96UVFrDHEEn06who7QJB0Pp/krKtzQtLBImbn+4aVNOcRIk9xX3q+nb
 OLYOiHfqXtv0G1pktfc3fMmDso9oWIzQOFga+UUcjMMssOxTY0KWy/7+Y0Lc+XvJaflF
 vctx6O+eBrCHXBDBgYai3ms0j8S0r4JseFlJvjUyJxIVLUdOH9ArhLe1+1MZXeO7ebsz
 et7A==
X-Gm-Message-State: APjAAAXWs8+h6381DhlWHi5i5//mACczZa6Q6tfUFVVEGQdlkiDi/MdA
 GSAOOTw3DHBR+DYa+IxplhscN7EO4+Q=
X-Google-Smtp-Source: APXvYqxqOiL71+JHD7kiOqPtzYaUORB/MoDxjxuRpjL8rEmqG5OYcc7dtk9le6lxOcbMQyEWAEW1UQ==
X-Received: by 2002:a63:6089:: with SMTP id
 u131mr40875087pgb.314.1562195446644; 
 Wed, 03 Jul 2019 16:10:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 d140sm3619876pfd.135.2019.07.03.16.10.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 16:10:45 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] mesa: Fix clang build error w/
 util_blitter_get_color_format_for_zs()
Date: Wed,  3 Jul 2019 23:10:37 +0000
Message-Id: <20190703231038.73097-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tF6PJXwXdA+T8gXlP/iy+yAeb6/0Jnz/ftcQAzJBllI=;
 b=WZeVy0Zkdls1P75fLBaw1TMyb4jMYb0reqkeH0tvDineL9ech8ZM5EnZI7vqJ4ydhd
 dBvPr+1NxvBrkhOJSX2ZxdIPGSLkR4dj91mFCquH8Fo3rGnufat/kTVJqcna0vDhmESR
 z2r/A2C6rF8h9jVbmwl7mXqEbOrcTIn5aVBKrscVU8e7G4bSWvSIlagXNEEElyXjP481
 xB/w3ge6bLbNRZloHosNnK35D4DrpT5dD3OofaqynM0wv8Az5HXqVJY2PyXDp6sXi/YC
 Ex5HbNjRf5i0Pe66Zo0+drQ9X2FUFUos24aIjcqKtNOugtRFO2hRE1JDSZ4cA1GaVaVA
 7IPA==
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
Cc: Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Greg Hartman <ghartman@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnVpbGRpbmcgd2l0aCBjbGFuZywgSSdtIHNlZWluZwogdV9ibGl0dGVyLmg6NjI3OjE6IGVycm9y
OiBjb250cm9sIG1heSByZWFjaCBlbmQgb2Ygbm9uLXZvaWQgZnVuY3Rpb24gWy1XZXJyb3IsLVdy
ZXR1cm4tdHlwZV0KClRoZSB1dGlsX2JsaXR0ZXJfZ2V0X2NvbG9yX2Zvcm1hdF9mb3JfenMoKSBh
c3NlcnRzIGZvciBhbnkKdW5oYW5kbGVkIHR5cGVzLCBzbyB3ZSBkbyBub3QgZXhwZWN0IHRvIHJl
YWNoIHRoZSBlbmQgb2YgdGhlCmZ1bmN0aW9uIGhlcmUuCgpCdXQgcHJvdmlkZSBhIGR1bW15IHJl
dHVybiB3aXRoIGFuIGV4cGxpY2l0IGFzc2VydCBhYm92ZQp0byBlbnN1cmUgd2UgZG9uJ3QgaGl0
IGl0IHdpdGggYW55IGZ1dHVyZSBjaGFuZ2VzIHRvIHRoZSBsb2dpYy4KCkNjOiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+CkNjOiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292
QGdtYWlsLmNvbT4KQ2M6IEFtaXQgUHVuZGlyIDxhbWl0LnB1bmRpckBsaW5hcm8ub3JnPgpDYzog
U3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IEFsaXN0YWlyIFN0cmFj
aGFuIDxhc3RyYWNoYW5AZ29vZ2xlLmNvbT4KQ2M6IEdyZWcgSGFydG1hbiA8Z2hhcnRtYW5AZ29v
Z2xlLmNvbT4KQ2M6IFRhcGFuaSBQw6RsbGkgPHRhcGFuaS5wYWxsaUBpbnRlbC5jb20+CkNjOiBN
YXJlayBPbMWhw6FrIDxtYXJlay5vbHNha0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0
dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KLS0tCiBzcmMvZ2FsbGl1bS9hdXhpbGlhcnkv
dXRpbC91X2JsaXR0ZXIuaCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvc3JjL2dhbGxpdW0vYXV4aWxpYXJ5L3V0aWwvdV9ibGl0dGVyLmggYi9z
cmMvZ2FsbGl1bS9hdXhpbGlhcnkvdXRpbC91X2JsaXR0ZXIuaAppbmRleCA5ZTNmYTU1ZTY0OC4u
N2Q2YzNkYjY0ZGEgMTAwNjQ0Ci0tLSBhL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS91dGlsL3VfYmxp
dHRlci5oCisrKyBiL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS91dGlsL3VfYmxpdHRlci5oCkBAIC02
MjQsNiArNjI0LDkgQEAgdXRpbF9ibGl0dGVyX2dldF9jb2xvcl9mb3JtYXRfZm9yX3pzKGVudW0g
cGlwZV9mb3JtYXQgZm9ybWF0KQogICAgZGVmYXVsdDoKICAgICAgIGFzc2VydCgwKTsKICAgIH0K
KyAgIGFzc2VydCgwKTsKKyAgIC8qWFhYIE5FVkVSIEdFVCBIRVJFKi8KKyAgIHJldHVybiBQSVBF
X0ZPUk1BVF9SMzJHMzJfVUlOVDsKIH0KIAogI2lmZGVmIF9fY3BsdXNwbHVzCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
