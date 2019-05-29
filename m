Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C5C2DB20
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5636E0DC;
	Wed, 29 May 2019 10:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FA16E0DC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:56:51 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id a186so692074pfa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/HOJUJPmu0DEDj06ebaN852o3ZXmTIE5qbyIrE/4RCQ=;
 b=e6zet3Z90uloVFY2dZHrrnLlbKfyz/8U2dUEFVpiiyieJnpEsm6T5cN6Lh9I1k8r5U
 ofIPC89wq76QRf51DcybwGmCDP47zF0arQkk4SZK6mijXrNnTTkF08XCCcOTog33k21q
 MhcEVd3vfS6ZdaSqqQ18Jjq8MXdxYYAFkSyd6qV4qZlzuFBTLjj4diGCW3HrGXJ25kJ+
 zcDEaEBPLOicKOD8xuhywBhdq+6cGBMoozLTR+yWGRQLg237l1twGeoIfNPvJf9jn3Xq
 FmVB9MwKgOlfWN1dxcjAya+Z/4FiEch0YDo5pJm/0D2q8EpQCSg6ge/Jhuq9s0Nn4JYQ
 vDTA==
X-Gm-Message-State: APjAAAU9e8Nb9azWvb+N/6dAv/S1F89Qdb+qhWApmKdbeq+BwueqTonC
 8z4/anztfjEzyTcAW10pEAdzmQ==
X-Google-Smtp-Source: APXvYqwkDEN5ViwUhtjeUodU3pfOZQ1pY/mLl+5Nf3Rvnz+8uPjdcVebnc1VS0CfP684+zNGbbjsZw==
X-Received: by 2002:a63:ff0c:: with SMTP id k12mr31032943pgi.32.1559127410770; 
 Wed, 29 May 2019 03:56:50 -0700 (PDT)
Received: from localhost.localdomain ([49.206.202.218])
 by smtp.gmail.com with ESMTPSA id 184sm18974479pfa.48.2019.05.29.03.56.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 03:56:50 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/9] dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/
 A31 fallback)
Date: Wed, 29 May 2019 16:26:08 +0530
Message-Id: <20190529105615.14027-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190529105615.14027-1-jagan@amarulasolutions.com>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/HOJUJPmu0DEDj06ebaN852o3ZXmTIE5qbyIrE/4RCQ=;
 b=grc4vc5ccDjj9vGZrQtKPLDitASXNBkw5h02ZiZKrmHLtsjSNj70fuqjGVRCQ14aRU
 7XJhUM2Pw9Boghtdessngp/2nRsKNIwLs0YzadVFrG2srOi5gqGysUxZ1iEocuhjGiUs
 G1BHkYB+bvxir0JgGl83waMzduEA5pjUWIGn4=
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
Cc: devicetree@vger.kernel.org, Ryan Pannell <ryan@osukl.com>,
 bshah@mykolab.com, linux-sunxi@googlegroups.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Sergey Suloev <ssuloev@orpaltech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1JUEkgRFNJIFBIWSBjb250cm9sbGVyIG9uIEFsbHdpbm5lciBBNjQgaXMgc2ltaWxhcgpv
biB0aGUgb25lIG9uIEEzMS4KCkFkZCBBNjQgY29tcGF0aWJsZSBhbmQgYXBwZW5kIEEzMSBjb21w
YXRpYmxlIGFzIGZhbGxiYWNrLgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1h
cnVsYXNvbHV0aW9ucy5jb20+ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhp
L3N1bjZpLWRzaS50eHQgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhp
L3N1bjZpLWRzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9zdW54aS9zdW42aS1kc2kudHh0CmluZGV4IDk4NzczOThiZTY5YS4uZDBjZTUxZmVhMTAzIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54
aS9zdW42aS1kc2kudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQKQEAgLTM4LDYgKzM4LDcgQEAgRC1QSFkKIFJlcXVp
cmVkIHByb3BlcnRpZXM6CiAgIC0gY29tcGF0aWJsZTogdmFsdWUgbXVzdCBiZSBvbmUgb2Y6CiAg
ICAgKiBhbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHBoeQorICAgICogYWxsd2lubmVyLHN1bjUw
aS1hNjQtbWlwaS1kcGh5LCBhbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHBoeQogICAtIHJlZzog
YmFzZSBhZGRyZXNzIGFuZCBzaXplIG9mIG1lbW9yeS1tYXBwZWQgcmVnaW9uCiAgIC0gY2xvY2tz
OiBwaGFuZGxlcyB0byB0aGUgY2xvY2tzIGZlZWRpbmcgdGhlIERTSSBlbmNvZGVyCiAgICAgKiBi
dXM6IHRoZSBEU0kgaW50ZXJmYWNlIGNsb2NrCi0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
