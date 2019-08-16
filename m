Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D6A9031F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 15:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C0D6E406;
	Fri, 16 Aug 2019 13:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02D16E406
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 13:35:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D9312AF;
 Fri, 16 Aug 2019 15:35:04 +0200 (CEST)
Date: Fri, 16 Aug 2019 16:35:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v5.4] R-Car DU fix & misc. DRM cleanups
Message-ID: <20190816133500.GJ5020@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565962504;
 bh=VSVjygRGI+vRv/Mblcca6YkuEPYxZvkgqiUQ2QMBcG4=;
 h=Date:From:To:Cc:Subject:From;
 b=RFj3rAUPpFpnGC1kxhbE6fc7X1ntJs6nznoCPOt5tLqs2kK1MiXKP22GQL3emRP4h
 GLoZAikVzgEhYD+y8z3DYjbQkD31RE2p2EVo/0izp+XBCTyboyaqk4NVgs3aS5lF4G
 RSbGCwsqQXaEY0NwXWYpMLS1a5KIkZW/DvWDKunw=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODEyMGVkNWViZDJh
YWFkMWZlZTFhNzc3ZWZmYTE1OGU1Mjg0YjgxNjoKCiAgTWVyZ2UgYnJhbmNoICd2bXdnZngtbmV4
dCcgb2YgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+dGhvbWFzaC9saW51eCBpbnRvIGRy
bS1uZXh0ICgyMDE5LTA4LTE2IDEyOjQzOjIxICsxMDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUg
R2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2xpbnV4dHYub3JnL3BpbmNoYXJ0bC9tZWRpYS5n
aXQgdGFncy9kdS1uZXh0LTIwMTkwODE2Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8g
MGI5MzZlNjEyMjczOGY0Y2Y0NzRkMWYzZmY2MzZjYmEwZWRjOGI5NDoKCiAgZHJtOiByY2FyLWR1
OiBsdmRzOiBGaXggYnJpZGdlX3RvX3JjYXJfbHZkcyAoMjAxOS0wOC0xNiAxNTo1MDoyNyArMDMw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KLSBSLUNhciBEVSBmaXhlcwotIE1pc2MuIERSTSBjbGVhbnVwcwoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpGYWJyaXppbyBDYXN0cm8gKDEpOgogICAgICBkcm06IHJjYXItZHU6IGx2ZHM6IEZpeCBicmlk
Z2VfdG9fcmNhcl9sdmRzCgpMYXVyZW50IFBpbmNoYXJ0ICgyKToKICAgICAgZHJtOiBEb24ndCBp
bmNsdWRlIGRybS9kcm1fZW5jb2Rlcl9zbGF2ZS5oIHdoZW4gbm90IG5lZWRlZAogICAgICBkcm06
IFJlbW92ZSBicmlkZ2Ugc3VwcG9ydCBmcm9tIGxlZ2FjeSBoZWxwZXJzCgogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2NydGNfaGVscGVyLmMgICAgICAgICB8IDMyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvZHdfaGRtaS1pbXguYyAgICAgICAgIHwgIDIgKy0KIGRy
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jICAgICAgIHwgIDggKysrKy0tLS0KIDQg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKCi0tIApSZWdh
cmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
