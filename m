Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F02464A6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A6E89B45;
	Fri, 14 Jun 2019 16:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71B789B30
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:44:11 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t7so1232926plr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Non2BoMSGZisQGcDqDX68GAJtDt89o/Y1pHahHZtkpw=;
 b=k1fpcypZaEDnLsBIC9C7iqNEOHsZhrOWX8GUZA5M352v/yp/HWR0y6JY1GY7IvZmSi
 ninrd2w2tCEWhJDZucq9Bs9Qlq+SADRP9BF7oMdT6dJOA/z6aZdnx0+ow7PbhLcnO8+y
 lPGor70FdzxyzobNRkEbkWnKbjY34307BYfPvaksjrB6f0QZ7sHTj7DlxAGXfPhwBvbZ
 iwC+qi3czIN6VZhrUkAm3CEpxuGfFbd5kY+yAl9r7FN7jHeMU6nPD0lEowaEiH9Srzw4
 Xgc5y4MLOJ1a8xWk/PhEHfmY4IWa+aG541NnaZgLsX070mEs9VziYCm1kqi39P0LGGaF
 2hbw==
X-Gm-Message-State: APjAAAW8xCrlL1KI7LxXcVP+bPs4ZcHbVnXHhf+o07XPMOh4kGCh0Kvk
 omcY469SfmP8Uxr3wX1Dbk8vlg==
X-Google-Smtp-Source: APXvYqw1QUf2Sqj4sT+KEQY5pTkiZm664fbyXbkXHmgQeP2NDpkJ5pMLTivt3XLzm0hRDnHdWl7B9g==
X-Received: by 2002:a17:902:7086:: with SMTP id
 z6mr11655193plk.196.1560530649787; 
 Fri, 14 Jun 2019 09:44:09 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id 85sm1639583pfv.130.2019.06.14.09.44.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:44:08 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 7/9] dt-bindings: sun6i-dsi: Add R40 DPHY compatible (w/
 A31 fallback)
Date: Fri, 14 Jun 2019 22:13:22 +0530
Message-Id: <20190614164324.9427-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190614164324.9427-1-jagan@amarulasolutions.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Non2BoMSGZisQGcDqDX68GAJtDt89o/Y1pHahHZtkpw=;
 b=rlf58sMSEWIwoOxw02uP0n9MWyrboVK4lgcIbkTGWCNuEqHmEw5+ENdEnc8yUBy6YL
 xa/7xTOfw1ZONqMy2w3bDcUqg1fLro2oBI55f6/OjyxCUGqfHeNcHerAQ18EUyWzTARQ
 ssBd0pQ5ionYtuuJrkkeGT/Sqks/rUU0lQpEI=
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

VGhlIE1JUEkgRFNJIFBIWSBjb250cm9sbGVyIG9uIEFsbHdpbm5lciBSNDAgaXMgc2ltaWxhcgpv
biB0aGUgb25lIG9uIEEzMS4KCkFkZCBSNDAgY29tcGF0aWJsZSBhbmQgYXBwZW5kIEEzMSBjb21w
YXRpYmxlIGFzIGZhbGxiYWNrLgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1h
cnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQKaW5kZXggNDM4ZjFmOTk5YWViLi5i
N2FkMWJlMzMwMDggMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dApAQCAtNDAsNiArNDAsNyBA
QCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAtIGNvbXBhdGlibGU6IHZhbHVlIG11c3QgYmUgb25l
IG9mOgogICAgICogYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRwaHkKICAgICAqIGFsbHdpbm5l
cixzdW41MGktYTY0LW1pcGktZHBoeSwgYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRwaHkKKyAg
ICAqIGFsbHdpbm5lcixzdW44aS1yNDAtbWlwaS1kcGh5LCBhbGx3aW5uZXIsc3VuNmktYTMxLW1p
cGktZHBoeQogICAtIHJlZzogYmFzZSBhZGRyZXNzIGFuZCBzaXplIG9mIG1lbW9yeS1tYXBwZWQg
cmVnaW9uCiAgIC0gY2xvY2tzOiBwaGFuZGxlcyB0byB0aGUgY2xvY2tzIGZlZWRpbmcgdGhlIERT
SSBlbmNvZGVyCiAgICAgKiBidXM6IHRoZSBEU0kgaW50ZXJmYWNlIGNsb2NrCi0tIAoyLjE4LjAu
MzIxLmdmZmM2ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
