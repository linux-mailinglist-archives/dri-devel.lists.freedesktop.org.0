Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B991F1B0B6
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 09:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0349689580;
	Mon, 13 May 2019 07:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A139899D5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 17:46:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m20so9712325wmg.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 10:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1WIGTjZh4mIwUZpoXVfzkYofixlglZX9sKei53EYiYk=;
 b=dQM0DoAgpUnlvnYXQswYwnUU1TMAIODQY9bZVlCLtNciIgcL5f+ahvAxd3T/jGDHFC
 vt27jHPWOaEpiFbzBQnWIprApqh9NK3/DZDQbEHe9BN2BKBQ9sqQtp6Vpw+wjsevusTi
 XM57hvHoDGNVmERsz5pyHVxBYetpvOnYquRy/1s64wRs/HXj+C1DKgRgWAfktwld8G0u
 S1MavE4DHaNkstCJbN7oyQGCn2yV6g5XKfkCqNuIhIg1AGg/Rgp8w+mdSW19fCSNufIY
 2g/SlUAke10RYDgtKURJXOrdRdBRciBq9p8Bf4ZP0hptV0rxLYYIAlEHXYM9a3ve5+9b
 vdlg==
X-Gm-Message-State: APjAAAVnL8zjrWoPnzPKDrWxSTsRrqZ/zbV9vsTMK3xqdrYS0NgU42Ag
 wEqf5Rg0gHA1yFymIFNzm2b8ZAuz/NTf1w==
X-Google-Smtp-Source: APXvYqx2EWKBm+GH/a0JjB7RxHj0gE/6taBHkxJHevcGOh44GOKAT3CUGk1nxZQ0yStWTZtn7JbA/w==
X-Received: by 2002:a1c:a684:: with SMTP id p126mr8448133wme.101.1557683176596; 
 Sun, 12 May 2019 10:46:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id d14sm9090558wre.78.2019.05.12.10.46.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 10:46:15 -0700 (PDT)
From: peron.clem@gmail.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 1/8] dt-bindings: gpu: mali-midgard: Add resets property
Date: Sun, 12 May 2019 19:46:01 +0200
Message-Id: <20190512174608.10083-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190512174608.10083-1-peron.clem@gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com>
X-Mailman-Approved-At: Mon, 13 May 2019 07:04:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1WIGTjZh4mIwUZpoXVfzkYofixlglZX9sKei53EYiYk=;
 b=FNPLCR8Sd13vMzZbJg8ptcgHXtjdN1eS0ZvAd0uRFvifNg+n8JpiAcG8DD3rDOsdu3
 xiheRxeCsEA5ATtOgkuuqVXHPzZJGNRMRUdPHZ1jIQu/yLNphwgNpLNI3gBGMVHQDVZv
 P2ULCWwuKNIltsEqQWfvKPwwloxjdzfVnyekrJRLrh2wmTakO94vwauG5Os4o1iPEvHj
 Q3cMxNcOEmPQWVeqM8CxPFspXuvki4g0PULvuebwMYm8rmtBFRCGGjHrEzuHtLdGv2Fb
 5rhSafvgxQVouj4xJmdbx7IWn9lKFcY132hkVU6fW8iQcEfdAcTkpYXh5GP01eC4SQtu
 Uzig==
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgoKVGhlIEFtbG9n
aWMgQVJNIE1hbGkgTWlkZ2FyZCByZXF1aXJlcyByZXNldCBjb250cm9scyB0byBwb3dlciBvbiBh
bmQKc29mdHdhcmUgcmVzZXQgdGhlIEdQVSwgYWRkcyB0aGVzZSBhcyBvcHRpb25hbCBpbiB0aGUg
YmluZGluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgotLS0KIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dCAgIHwgMTQgKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2Fy
ZC50eHQKaW5kZXggMThhMmNkZTJlNWYzLi4xYjFhNzQxMjkxNDEgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50eHQKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJk
LnR4dApAQCAtMzcsNiArMzcsMjAgQEAgT3B0aW9uYWwgcHJvcGVydGllczoKIC0gb3BlcmF0aW5n
LXBvaW50cy12MiA6IFJlZmVyIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9v
cHAvb3BwLnR4dAogICBmb3IgZGV0YWlscy4KIAorLSByZXNldHMgOiBQaGFuZGxlIG9mIHRoZSBH
UFUgcmVzZXQgbGluZS4KKworVmVuZG9yLXNwZWNpZmljIGJpbmRpbmdzCistLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KKworVGhlIE1hbGkgR1BVIGlzIGludGVncmF0ZWQgdmVyeSBkaWZmZXJlbnRs
eSBmcm9tIG9uZSBTb0MgdG8KK2Fub3RoZXIuIEluIG9yZGVyIHRvIGFjY29tb2RhdGUgdGhvc2Ug
ZGlmZmVyZW5jZXMsIHlvdSBoYXZlIHRoZSBvcHRpb24KK3RvIHNwZWNpZnkgb25lIG1vcmUgdmVu
ZG9yLXNwZWNpZmljIGNvbXBhdGlibGUsIGFtb25nOgorCistICJhbWxvZ2ljLG1lc29uLWd4bS1t
YWxpIgorICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgorICAtIHJlc2V0cyA6IFNob3VsZCBjb250YWlu
IHBoYW5kbGVzIG9mIDoKKyAgICArIEdQVSByZXNldCBsaW5lCisgICAgKyBHUFUgQVBCIGdsdWUg
cmVzZXQgbGluZQogCiBFeGFtcGxlIGZvciBhIE1hbGktVDc2MDoKIAotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
