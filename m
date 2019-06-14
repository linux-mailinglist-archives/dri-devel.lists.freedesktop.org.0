Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9204648C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0E4897BB;
	Fri, 14 Jun 2019 16:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5BC897BB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:43:40 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f25so1847895pgv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YB8tvQ/A4LBfMdy9uXKQQ4D0KlkqxcG44woQEGvz30s=;
 b=YZyhRfXIgpUSWPnpGuippzMon//LNLzi6tdSINZzxRuNgj7/aASme9E8+06qZtbSeI
 AG5NPo+QyiAZ6Z2rAy+xLC/Q0vH45pjyY0cx0scYmNDhsiLMQg0Gi2z3mh4iv7V8cvHG
 NKewAswapW0akAg8/06zr6LOwI0FEz8BSafPTYRB9eKa/iu6sMuE4gYEa69PdGoWkcI9
 cvtUsPsTYE/SzBWqtcHSTew0Me3Cvew6oGQgbbf1CnXDFylYjEpZ1+1X0mFLtFv6Fyd9
 zmNHTS58TXNIF3Bcg72QCPx1Wf1iOZ4QTJaw3SJS7iYoU6lR+AmMExwKAa82roGoh8CT
 e0Ng==
X-Gm-Message-State: APjAAAUbCQBBzoMJKhO73vaKH+9N6QKZUPiI91HDA0nF/ILKVsKBf1dY
 Nzs59Iu3tlIvcLThCjIhEl9+GQ==
X-Google-Smtp-Source: APXvYqwYXdTXpfDhGmQt8us4MjMKgpbr+c5sCD+q4V7paAN4sFr9nfOElG4ad8gQmXlIHo+aNGcOGQ==
X-Received: by 2002:aa7:8c0f:: with SMTP id c15mr73672184pfd.113.1560530619784; 
 Fri, 14 Jun 2019 09:43:39 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id 85sm1639583pfv.130.2019.06.14.09.43.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:43:38 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 0/9] drm/sun4i: Allwinner R40 MIPI-DSI support
Date: Fri, 14 Jun 2019 22:13:15 +0530
Message-Id: <20190614164324.9427-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YB8tvQ/A4LBfMdy9uXKQQ4D0KlkqxcG44woQEGvz30s=;
 b=qYxsx+A6S9zLLNTdR52vMXSYNC4esdZSFUMNrOleaGkevIAAzDbqGuI9GvOfXHTW0t
 K6MWIOyfG3XEJvM8gDFnZbOcCzjNuRKhwawvyODHKOUMtD9GlufynwBgS84+Dr6eR6EN
 zVUtAhESJK8BH/wZD1lA5elxAzgdFRasq3A6U=
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
Cc: linux-sunxi@googlegroups.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB2MiB2ZXJzaW9uIGZvciBzdXBwb3J0aW5nIE1JUEktRFNJIG9uIEFsbHdpbm5lciBS
NDAgZnJvbQppbml0aWFsIHZlcnNpb25bNF0uCgpUaGUgY29udHJvbGxlciBsb29rIHNpbWlsYXIg
bGlrZSwgQWxsd2lubndlIEE2NCBzbyBpdCBoYXMKZGVwZW5kZW5jaWVzIHdpdGggQTY0IE1JUEkg
RFNJIGNoYW5nZXMsIERTSSBmaXhlcyBhbmQgUjQwIHB3bSAKZHJpdmVyIFsxXSBbMl0gWzNdLiAK
ClBMTC1NSVBJLCBkY2xrIGRpdmRlcnMgbG9naWMgYnBwL2xhbmVzIGFyZSBwcm9wZXJseSB3b3Jr
IGZvciBSNDAsCmxpa2UgQTMxLCBBNjQuCgpDaGFuZ2VzIGZvciB2MjoKLSBkcm9wIHRjb24gdG9w
IGxjZCBjbG9jayBwYXRjaAotIGFkZCBUT0RPIHRleHQgd2hpbGUgYWRkaW5nIHRjb24gbGNkIHN1
cHBvcnQKLSBhZGQgcGF0Y2ggZm9yIHJlZ2lzdGVyaW5nIHRjb24gdG9wIGNsb2NrIGdhdGVzIGlu
IHByb2JlCi0gY2hhbmdlIHRjb24tY2gwIGluIHRjb25fbGNkMCB0byBDTEtfVENPTl9MQ0QwCi0g
Y2hhbmdlIG1vZCBjbG9jayBpbiBkcGh5IHRvIHRjb25fdG9wIHdpdGggaW5kZXggMyAKClsxXSBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYxMzEwLwpbMl0gaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MDg0Ny8gClszXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9wYXRjaHdvcmsvY292ZXIvODYyNzY2LyAKWzRdIGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjIwNjIvCgpBbnkgaW5wdXRzPwpKYWdhbi4KCkph
Z2FuIFRla2kgKDkpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBBZGQgVENPTiBMQ0QgY29tcGF0
aWJsZSBmb3IgUjQwCiAgZHJtL3N1bjRpOiB0Y29uOiBBZGQgVENPTiBMQ0Qgc3VwcG9ydCBmb3Ig
UjQwCiAgQVJNOiBkdHM6IHN1bjhpOiByNDA6IFVzZSB0Y29uIHRvcCBjbG9jayBpbmRleCBtYWNy
b3MKICBkcm0vc3VuNGk6IHRjb25fdG9wOiBVc2UgY2xvY2sgbmFtZSBpbmRleCBtYWNyb3MKICBk
cm0vc3VuNGk6IHRjb25fdG9wOiBSZWdpc3RlciBjbG9jayBnYXRlcyBpbiBwcm9iZQogIGR0LWJp
bmRpbmdzOiBzdW42aS1kc2k6IEFkZCBSNDAgTUlQSS1EU0kgY29tcGF0aWJsZSAody8gQTY0IGZh
bGxiYWNrKQogIGR0LWJpbmRpbmdzOiBzdW42aS1kc2k6IEFkZCBSNDAgRFBIWSBjb21wYXRpYmxl
ICh3LyBBMzEgZmFsbGJhY2spCiAgQVJNOiBkdHM6IHN1bjhpOiByNDA6IEFkZCBNSVBJIERTSSBw
aXBlbGluZQogIFtETyBOT1QgTUVSR0VdIEFSTTogZHRzOiBzdW44aS1yNDA6IGJhbmFuYXBpLW0y
LXVsdHJhOiBFbmFibGUgQmFuYW5hcGkgUzA3MFdWMjAtQ1QxNiBEU0kgcGFuZWwKCiAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9zdW54aS9zdW40aS1kcm0udHh0ICAgICAgfCAgIDEgKwogLi4uL2JpbmRp
bmdzL2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dCAgICAgIHwgICAyICsKIC4uLi9ib290L2R0
cy9zdW44aS1yNDAtYmFuYW5hcGktbTItdWx0cmEuZHRzICB8ICAzNiArKysrKysKIGFyY2gvYXJt
L2Jvb3QvZHRzL3N1bjhpLXI0MC5kdHNpICAgICAgICAgICAgICB8ICA3OCArKysrKysrKysrKyst
CiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jICAgICAgICAgICAgfCAgIDggKysK
IGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV90Y29uX3RvcC5jICAgICAgICB8IDEwMyArKysr
KysrKysrLS0tLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgMTc4IGluc2VydGlvbnMoKyksIDUwIGRl
bGV0aW9ucygtKQoKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
