Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3929F2960C
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D5789F5B;
	Fri, 24 May 2019 10:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB50989F5B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:41:34 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id d30so4853621pgm.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 03:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0MxRnTCE9BXc+WmYpS8NriHcx2Lj8b3YSmcOc81bkk=;
 b=MvbrQBwsKU49ARNFiXVCHRh516RLDDAcDzBgiAO5CSx1qN29aWCk9nA6fm39xr8uxU
 zweA0NEePt5qTMGYAMXcnl5dPdRDa9MU/KPVc/y7uWpz7X+OzpBAQeQJ7JJ12KtxniZV
 gWxtgfrVRBLxFK/0b8Pf6mcXN/c7CvEaHyOZuXMIC3oX+7lwJnob07LK6vgD9daqMBqa
 d48w8z05p/HbcEw6jTY3/aiFNPuIpJ4Ylj7FpfA3I54YavTRvCGErSBobqliF9iYP/94
 ns8YFniFMiOikoyl/4SmHN1ao36eHKKztnbRX0qw8Ew7OboZxM065q2VtGGp4svRRoML
 Gqkg==
X-Gm-Message-State: APjAAAXlqkQMXdOxaRLxmautYtsGL02UDzg867Vq+1aKQYrrFXyl3TeP
 iTLHNQxFU2vBHFd64dVmC22Kgga9X/E=
X-Google-Smtp-Source: APXvYqz44Tfpkk+GdZoxymyVgoEhAr6weX4O6ILp2GFIiVeKdz6RAp1tuYQbqrGK2N425gP+pUQjVw==
X-Received: by 2002:a63:4a4f:: with SMTP id j15mr8692927pgl.338.1558694493926; 
 Fri, 24 May 2019 03:41:33 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.60])
 by smtp.gmail.com with ESMTPSA id m72sm6550113pjb.7.2019.05.24.03.41.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 03:41:33 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 0/6] drm/bridge: Add ICN6211 MIPI-DSI/RGB bridge
Date: Fri, 24 May 2019 16:11:09 +0530
Message-Id: <20190524104115.20161-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0MxRnTCE9BXc+WmYpS8NriHcx2Lj8b3YSmcOc81bkk=;
 b=KhdkuwhLGFTGUIzjnoSXCcjRF1xudF+4rTPCNkNPO+riBV5qj6+YN/XmRVEm/HCRG5
 3Jn3cbkMmq2gMiGJaV6ndJJmu2lKue5pniic1qpViALZjk/6h4ANhWXPElMRyGyMwj0I
 jC9ZZh4aHfKNKmJ4whJ1tmXgtD1aztJzyF9N4=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtL2JyaWRnZTogQWRkIElDTjYyMTEgTUlQSS1EU0kvUkdCIGJyaWRnZQoKVGhpcyBpcyB2MiBz
ZXJpZXMgZm9yIHN1cHBvcnRpbmcgQ2hpcG9uZSBJQ042MjExIERTSS9SR0IgYnJpZGdlLApoZXJl
IGlzIHRoZSBwcmV2aW91cyB2ZXJzaW9uIHNldFsxXQoKVGhlIG92ZXJsYXkgcGF0Y2gsIGhhcyBC
YW5hbmFwaSBwYW5lbCB3aGljaCB3b3VsZCBkZXBlbmRzIG9uLApwcmV2aW91cyBNSVBJIERTSSBm
aXhlcyBzZXJpZXNbMl0gdG8gbWFrZSB0aGUgcGFuZWwgd29ya3MuCgpDaGFuZ2VzIGZvciB2MjoK
LSB1c2UgcGFuZWxfb3JfYnJpZGdlIGZvciBmaW5kaW5nIHBhbmVsIGFuZCBicmlkZ2UKLSBhZGQg
cGFuZWwgb3ZlcmxheSBkdHMgcGF0Y2ggZm9yIHBvcnQgYmFzZWQgcGFuZWwgZW5hYmxlbWVudAot
IHVwZGF0ZSB0aGUgYnJpZGdlIHNlcXVlbmNlIGR5bmFtaWNhbGx5LCBieSBnZXR0aW5nIG1vZGUK
ICB0aW1pbmdzIGZyb20gcGFuZWwtc2ltcGxlCi0gY29ycmVjdCB0aGUgYnJpbmRpbmcgY29tcGF0
aWJsZQotIGFkZCBtb3JlIGluZm9ybWF0aW9uIGluIGJpbmRpbmcgZXhhbXBsZQotIHJlcGxhY2Ug
dGhlIGJyaWRnZSBkZXRhY2ggd2l0aCBwcm9wZXIgb3BzCi0gYWRkIGJyaWRnZSBvdmVybGF5IGR0
cyBwYXRjaCBmb3IgcG9ydCBiYXNlZCBwYW5lbCBlbmFibGVtZW50CgpbMl0gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MDg0Ny8KWzFdIGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTgwNjAvCgpBbnkgaW5wdXRzPwpKYWdhbi4KCkphZ2Fu
IFRla2kgKDYpOgogIGRybS9zdW40aTogZHNpOiBVc2UgZHJtIHBhbmVsX29yX2JyaWRnZSBjYWxs
CiAgW0RPIE5PVCBNRVJHRV0gQVJNOiBkdHM6IHN1bjhpOiBiYW5hbmFwaS1tMm06IEVuYWJsZSBC
YW5hbmFwaSBTMDcwV1YyMC1DVDE2IERTSSBwYW5lbAogIGRybS9zdW40aTogZHNpOiBBZGQgYnJp
ZGdlIHN1cHBvcnQKICBkdC1iaW5kaW5nczogZGlzcGxheTogYnJpZGdlOiBBZGQgSUNONjIxMSBN
SVBJLURTSSB0byBSR0IgY29udmVydGVyIGJyaWRnZQogIGRybS9icmlkZ2U6IEFkZCBDaGlwb25l
IElDTjYyMTEgTUlQSS1EU0kvUkdCIGNvbnZlcnRlciBicmlkZ2UKICBbRE8gTk9UIE1FUkdFXSBB
Uk06IGR0czogc3VuOGk6IGJhbmFuYXBpLW0ybTogRW5hYmxlIEJhbmFuYXBpIFMwNzBXVjIwLUNU
MTYgRFNJIHBhbmVsCgogLi4uL2Rpc3BsYXkvYnJpZGdlL2NoaXBvbmUsaWNuNjIxMS50eHQgICAg
ICAgIHwgIDc4ICsrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgNiArCiBhcmNoL2FybS9ib290L2R0cy9zdW44aS1yMTYtYmFuYW5hcGktbTJtLmR0
cyAgfCAgODYgKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyAgICAgICAgICAg
ICAgICB8ICAxMCArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlICAgICAgICAgICAg
ICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jaGlwb25lLWljbjYyMTEuYyAgICAg
IHwgMzQ0ICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21p
cGlfZHNpLmMgICAgICAgIHwgIDY3ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9t
aXBpX2RzaS5oICAgICAgICB8ICAgMSArCiA4IGZpbGVzIGNoYW5nZWQsIDU3NSBpbnNlcnRpb25z
KCspLCAxOCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvY2hpcG9uZSxpY242MjExLnR4dAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2hpcG9uZS1pY242MjExLmMK
Ci0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
