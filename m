Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F60D26A4EA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 14:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AEC6E25C;
	Tue, 15 Sep 2020 12:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E95A89F4F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 12:19:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e11so10982481wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 05:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7j+GFEPl0J4mVX0J38jo856GeX7L/pIGsyfYoimqNU=;
 b=d5I5Am+iX/ZTlLBaMLVhIOLDVSNJtj0O2dwF8Ftj0bg09cKrSTyi9V8g45XOxGznvn
 vAwfpzCkmcX+e1qI3igNUjzoFxbWxUYP7C4mcWoPmPepGPyX3vZDdWrB3x6LIKL1NZyP
 Z4tS+WrUE+6Don7+EdPT8qRc+DL5uaYKhCpYyJ8BBeJSJTC4GhNop2Ca4EhuXoLw+Mkt
 H6L5xg53j4yjOdnP4iS1uQi/yt/yG7gfuHgM1wWAW3JqNrGcuKzy0vZEihmq4HTfTI8g
 qqpataXcDG82Cb05rb1emLdp8ao1EYm7pWbgIGGdC4AT8MEEXW4c4hjEnEO7u9ZsVQ1M
 DtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7j+GFEPl0J4mVX0J38jo856GeX7L/pIGsyfYoimqNU=;
 b=EXUb+Aq+Wo0tqM9FVz6j2XZ2fdTEp2ZVf6VsbY3D+ze/K4UW0cXtWc3RsMzWk1xGD0
 4+kRq8FZ0GEthvxoSVUUJAPMz1VeZx6Mgrc5awVobnc5gSwYaatUzbLhy/ZWgVQX57r2
 PN1DZTZhQNeRQ7GHJdtwXoSZgdwPPXUS1Xdbs65l69/bBJkC5xWfUg4FxMegbheqSaUC
 elLVMSg2evB/yt4pkdqycyjLBMQ0Ed6DuoEcumBOIYMQdLgY7aLD/wcZr+i8/81gXMcn
 cDqi2iVXlx2UPUB6ORLEuuagetCVpjbtDnqOKKoUICCthy4W98EeOL2sVspHziw/UxpM
 Qsxw==
X-Gm-Message-State: AOAM532H+dB74LwfPmChrW2mLUuIOi3x9vaeLVxm0ao5EsaKrZ8ZFbIu
 Ely2pj8HIX4xCdnSBnOewQhNbw==
X-Google-Smtp-Source: ABdhPJx+fzoFxjgYAof+zD34bBVjkkA+EoKo8hnXGiQSj5VtzW/TKrSu3SuFbMpSSfocHxWxCJTiHg==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr4330660wmj.17.1600172356440; 
 Tue, 15 Sep 2020 05:19:16 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 2sm18271411wmf.25.2020.09.15.05.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:19:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org
Subject: [PATCH v4 0/4] drm: panel: add support for TDO tl070wsh30 panel
Date: Tue, 15 Sep 2020 14:19:08 +0200
Message-Id: <20200915121912.4347-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHN1cHBvcnQgYmluZGluZ3MgYW5kIHN1cHBvcnQgZm9yIHRoZSBURE8gVEwwNzBX
U0gzMCBURlQtTENEIHBhbmVsCm1vZHVsZSBzaGlwcGVkIHdpdGggdGhlIEFtbG9naWMgUzQwMCBE
ZXZlbG9wbWVudCBLaXQuClRoZSBwYW5lbCBoYXMgYSAxMDI0w5c2MDAgcmVzb2x1dGlvbiBhbmQg
dXNlcyAyNCBiaXQgUkdCIHBlciBwaXhlbC4KSXQgcHJvdmlkZXMgYSBNSVBJIERTSSBpbnRlcmZh
Y2UgdG8gdGhlIGhvc3QsIGEgYnVpbHQtaW4gTEVEIGJhY2tsaWdodAphbmQgdG91Y2ggY29udHJv
bGxlci4KCkNoYW5nZXMgc2luY2UgdjMgYXQgWzNdOgotIHJlb3JkZXJlZCB0ZG8gdmVuZG9yIHBy
ZWZpeAoKQ2hhbmdlcyBzaW5jZSB2MiBhdCBbMl06Ci0gYWRkZWQgcmVzZXQgZ3BpbyB0byBwYW5l
bC1zaW1wbGUtZHNpIGJpbmRpbmdzCi0gbW92ZWQgYmluZGluZ3MgdG8gcGFuZWwtc2ltcGxlCi0g
cmUtb3JkZXJlZCBwcmVwYXJlL3VucHJlcGFyZQotIGFkZGVkIGJhY2sgcmVmcmVzaCBwcmludAot
IG1vdmVkIHJlZ3VsYXRvci9yZXNldCBoYW5kbGluZyBpbiBwcmVwYXJlL3VucHJlcGFyZQotIGFs
aWduZWQgcmVtb3ZlL3NodXRkb3duIHdpdGggcGFuZWwtc2ltcGxlCi0gYWRkZWQgc2VudGluZWwg
Y29tbWVudCBpbnRvIGR0IG1hdGNoIHRhYmxlCgpDaGFuZ2VzIHNpbmNlIHYxIGF0IFsxXToKLSBh
ZGRlZCBtaXNzaW5nIHZlbmRvci1wcmVmaXhlcyBwYXRjaAotIHJlbW92ZWQgdnJlZnJlc2gKLSBm
aXhlZCB3YXJuaW5nIG9uIGFkZF9wYW5lbCByZXR1cm4KLSByZW1vdmVkIERSTSBsb2dnaW5nCgpb
MV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy84MTM3Ni8jcmV2MQpb
Ml0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy84MTM3Ni8jcmV2Mgpb
M10gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy84MTM3Ni8jcmV2MwoK
TmVpbCBBcm1zdHJvbmcgKDQpOgogIGR0LWJpbmRpbmdzOiB2ZW5kb3ItcHJlZml4ZXM6IEFkZCBT
aGFuZ2hhaSBUb3AgRGlzcGxheQogICAgT3B0b2xlbGVjdHJvbmljcyB2ZW5kb3IgcHJlZml4CiAg
ZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBhbmVsLXNpbXBsZS1kc2k6IGFkZCBvcHRpb25hbCByZXNl
dCBncGlvCiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBhbmVsLXNpbXBsZS1kc2k6IGFkZCBURE8g
VEwwNzBXU0gzMCBEU0kgcGFuZWwKICAgIGJpbmRpbmdzCiAgZHJtOiBwYW5lbDogYWRkIFRETyB0
bDA3MHdzaDMwIHBhbmVsIGRyaXZlcgoKIC4uLi9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS1k
c2kueWFtbCAgICAgICB8ICAgMyArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJl
Zml4ZXMueWFtbCAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL0tjb25maWcgICAgICAg
ICAgICAgICAgIHwgIDExICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdGRvLXRsMDcwd3No
MzAuYyAgfCAyNTAgKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDI2NyBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXRkby10bDA3MHdzaDMwLmMKCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
