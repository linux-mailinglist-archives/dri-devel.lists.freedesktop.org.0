Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BCD95144
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8826E445;
	Mon, 19 Aug 2019 23:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4D06E445
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:03:29 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id w16so2077277pfn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rFkDVdxMKmvjHBJyGmUApN9b++k2zTF9quw3rYo2m6Q=;
 b=BMFvFnm31BL1tS4zQbcXN5v7E+cyLFAzSwStE1q06867fwJHGgyl8PE7ZQhGCCseGf
 yt6ypscCmfWsYtDZPFUfhQecaKLPdwd3hwnT28UHvU/YaFX/kkZJKnSG4kYut2pLhMjz
 0j5cpE5Mm5SvHj7t3H8Y78Gc23tAjKd8LzQcWM4hBFi8/beI9fZulvrXM9KaAj72VL5K
 rnU+I9THp9JckftwciLBqsOrFM8Npkt1knM0o4M3I5wMcfVey1SeLUFESFqvCDq+GbwP
 nipkcjWhI1/RKo84pV59s6vtteaIFlA1whbK1mVxCdcQ0YpzOiI+elAARmKajcuJdqlz
 /m1w==
X-Gm-Message-State: APjAAAXr2vy+z2DrGnEk10GjifJL9SMPQrl8JOKbAthUUoaTCSdYwTEB
 i+G9CMyYKWQXWwBcgwlxsYu01g==
X-Google-Smtp-Source: APXvYqzTHLA7lx1VrFQUleoFllBiaEBYpVMyojNmAKc5BgBc6sj6Wpv2qDv54wM2tzLv9aWlq/ZHjQ==
X-Received: by 2002:aa7:946d:: with SMTP id t13mr27405973pfq.121.1566255808902; 
 Mon, 19 Aug 2019 16:03:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 j15sm17256509pfr.146.2019.08.19.16.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:03:28 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 02/25] drm: kirin: Remove HISI_KIRIN_DW_DSI config option
Date: Mon, 19 Aug 2019 23:02:58 +0000
Message-Id: <20190819230321.56480-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819230321.56480-1-john.stultz@linaro.org>
References: <20190819230321.56480-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rFkDVdxMKmvjHBJyGmUApN9b++k2zTF9quw3rYo2m6Q=;
 b=ssMY1vMBnfYeQHZ6nmDqVi7HELDW9OJq5zbSs5hi/zO5WohansKLHoLyT6vZCgdmS5
 y+MUgWtI7G5QQk354TwljfgSKN81Oh5F3pCuFAqUag8woabn0i2BKkxVwoGOKtonZ5v8
 DuvmOf07K8pwmeF7yM3CuTrM5rFeK1D/5oVG+MseohPlAXVE+1zF/Ryh8cz0sQwV5ggH
 QWEZKhBNYi2hDaXgnsH6zoSfdgCcxe5DxE9Dqp44qcSr2qxJrZvyCAalA1aEKUV6hyu2
 fCz8qdMyhY1r94feRwEO0f57ma5gBoDkxaxsja/NG8U1UQOUpWjHCVxqTW2acvn9RrTf
 aMQw==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIENPTkZJR19ISVNJX0tJUklOX0RXX0RTSSBvcHRpb24gaXMgb25seSB1c2VkIHcvIGtpcmlu
CmRyaXZlciwgc28gY3V0IG91dCB0aGUgbWlkZGxlbWFuIGFuZCBjb25kZW5zZSB0aGUgY29uZmln
CmxvZ2ljIGRvd24uCgpDYzogUm9uZ3JvbmcgWm91IDx6b3Vyb25ncm9uZ0BnbWFpbC5jb20+CkNj
OiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29uLmNvbT4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KQ2M6IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQWNrZWQtYnk6IFhpbmxpYW5nIExpdSA8ei5s
aXV4aW5saWFuZ0BoaXNpbGljb24uY29tPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL0tjb25maWcgIHwg
MTAgKy0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9NYWtlZmlsZSB8
ICA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL0tjb25maWcg
Yi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL0tjb25maWcKaW5kZXggMGZhMjlhZjA4
YWQwLi4yOTA1NTNlMmY2YjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24v
a2lyaW4vS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL0tjb25m
aWcKQEAgLTUsMTYgKzUsOCBAQCBjb25maWcgRFJNX0hJU0lfS0lSSU4KIAlzZWxlY3QgRFJNX0tN
U19IRUxQRVIKIAlzZWxlY3QgRFJNX0dFTV9DTUFfSEVMUEVSCiAJc2VsZWN0IERSTV9LTVNfQ01B
X0hFTFBFUgotCXNlbGVjdCBISVNJX0tJUklOX0RXX0RTSQorCXNlbGVjdCBEUk1fTUlQSV9EU0kK
IAloZWxwCiAJICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IGhhdmUgYSBoaXNpbGljb24gS2ly
aW4gY2hpcHNldHMoaGk2MjIwKS4KIAkgIElmIE0gaXMgc2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxs
IGJlIGNhbGxlZCBraXJpbi1kcm0uCiAKLWNvbmZpZyBISVNJX0tJUklOX0RXX0RTSQotCXRyaXN0
YXRlICJIaVNpbGljb24gS2lyaW4gc3BlY2lmaWMgZXh0ZW5zaW9ucyBmb3IgU3lub3BzeXMgRFcg
TUlQSSBEU0kiCi0JZGVwZW5kcyBvbiBEUk1fSElTSV9LSVJJTgotCXNlbGVjdCBEUk1fTUlQSV9E
U0kKLQloZWxwCi0JIFRoaXMgc2VsZWN0cyBzdXBwb3J0IGZvciBIaVNpbGljb24gS2lyaW4gU29D
IHNwZWNpZmljIGV4dGVuc2lvbnMgZm9yCi0JIHRoZSBTeW5vcHN5cyBEZXNpZ25XYXJlIERTSSBk
cml2ZXIuIElmIHlvdSB3YW50IHRvIGVuYWJsZSBNSVBJIERTSSBvbgotCSBoaTYyMjAgYmFzZWQg
U29DLCB5b3Ugc2hvdWxkIHNlbGV0IHRoaXMgb3B0aW9uLgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2hpc2lsaWNvbi9raXJpbi9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24va2lyaW4vTWFrZWZpbGUKaW5kZXggYzA1MDFmYTNmZTUzLi5jNTA2MDZjZmJiZGIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4vTWFrZWZpbGUKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9NYWtlZmlsZQpAQCAtMSw3ICsxLDcgQEAKICMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQoga2lyaW4tZHJtLXkgOj0ga2ly
aW5fZHJtX2Rydi5vIFwKLQkgICAgICAga2lyaW5fZHJtX2FkZS5vCisJICAgICAgIGtpcmluX2Ry
bV9hZGUubyBcCisJICAgICAgIGR3X2RybV9kc2kubwogCiBvYmotJChDT05GSUdfRFJNX0hJU0lf
S0lSSU4pICs9IGtpcmluLWRybS5vCiAKLW9iai0kKENPTkZJR19ISVNJX0tJUklOX0RXX0RTSSkg
Kz0gZHdfZHJtX2RzaS5vCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
