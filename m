Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F9E660CA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 22:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A3B6E270;
	Thu, 11 Jul 2019 20:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78ABD6E270
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 20:45:00 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id i2so3641561plt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 13:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PiSze+b8RyOCrdrl4z9soZ+cov9nAQWtcb1gx4qZEko=;
 b=d6hmQYoeyWraMk9R71nxTZHyy8mF6ZE3Bfk8mEarYWmmRUoEPQQLGL/x9L3CemVRXu
 3mr0KDQp8+yu1Cgh8eGU7MznaXAaS0RxSoBn3GoGCCa47DNZxvL8GCwJ+OBbb6/fQzLp
 xZjssvC3708IhAtYJWnTPfxdISIapVeWcWEbXp+E64WtXzcA08iUJR1ZMpo3YOUUOQs9
 OJ0LnMmvAKGUJD76T9n1zPWZlSvkB6TRtNzVQHL0RojBU97LY5OFIengOPgnNvfjL80v
 q3nYobBlbJiFsTP+wY2+1YWRoKHlvBCWx+EzbvxbRDvXZNqNrHn1j7XIupCLb8rGvM8T
 GZ6g==
X-Gm-Message-State: APjAAAWguqKEYbcJsKtR4S/IDjPMGy+85HROz4qAGmhFOX3+WfbGVoYV
 UtwNSZgHFNdioEmbN9aHeMdXewA1IP8=
X-Google-Smtp-Source: APXvYqx5OMVKLfuzSjyyKQdK5nWwU4ixzYuYMZrGSFfkXAOPPnXjXzBfWibAgOkF0K9yIsJfpGBE9Q==
X-Received: by 2002:a17:902:9898:: with SMTP id
 s24mr6688486plp.226.1562877899981; 
 Thu, 11 Jul 2019 13:44:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id f17sm5320110pgv.16.2019.07.11.13.44.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 13:44:59 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v6 0/3] drm/panel: simple: Add mode support to devicetree
Date: Thu, 11 Jul 2019 13:34:52 -0700
Message-Id: <20190711203455.125667-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PiSze+b8RyOCrdrl4z9soZ+cov9nAQWtcb1gx4qZEko=;
 b=FKtfQs2vO8puHfi8u5Itf2xIOrp80ctPquUf87JLqr/dE/UjPpoKuPH3lPJMtzczUv
 qmsjAe/JpyaR86mjQ3YQ6oLOQzCVzw9LlXoWOuuN3PkzIRWDV2tgKRefTsRzAfV8Rb2/
 p+p1+DcWIo7mGUqiAZNYCbJwDivBgkEvwYPJw=
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
Cc: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, mka@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSdtIHJldml2aW5nIFNlYW4gUGF1bCdzIG9sZCBwYXRjaHNldCB0byBnZXQgbW9kZSBzdXBwb3J0
IGluIGRldmljZQp0cmVlLiAgVGhlIGNvdmVyIGxldHRlciBmb3IgaGlzIHYzIGlzIGF0OgpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOC1GZWJydWFy
eS8xNjUxNjIuaHRtbAoKdjYgb2YgdGhpcyBwYXRjaCBpcyBqdXN0IGEgcmVwb3N0IG9mIHRoZSAz
IERSTSBwYXRjaGVzIGluIHY1IHJlYmFzZWQKYXRvcCBkcm0tbWlzYy4gIEEgZmV3IG5vdGVzOgot
IEkndmUgZHJvcHBlZCB0aGUgYmluZGluZ3MgcGF0Y2guICBDb21taXQgODIxYTFmNzE3MWFlICgi
ZHQtYmluZGluZ3M6CiAgZGlzcGxheTogQ29udmVydCBjb21tb24gcGFuZWwgYmluZGluZ3MgdG8g
RFQgc2NoZW1hIikgaGFzIGxhbmRlZCBhbmQKICBSb2IgSCBzYWlkIFsxXSB0aGF0IHdoZW4gdGhh
dCBsYW5kZWQgdGhlIGJpbmRpbmdzIHdlcmUgaW1wbGljaXRseQogIHN1cHBvcnRlZC4KLSBTaW5j
ZSB0aGUgYmluZGluZ3MgcGF0Y2ggd2FzIGRyb3BwZWQgSSBhbSBhc3N1bWluZyB0aGF0IEhlaWtv
CiAgY2FuIGp1c3QgcGljayB1cCB0aGUgLmR0cyBwYXRjaGVzIGZyb20gdGhlIHY1IHNlcmllcy4g
IEkKICBkb3VibGUtY2hlY2tlZCB3aXRoIGhpbSBhbmQgaGUgY29uZmlybWVkIHRoaXMgaXMgZmlu
ZS4gIFRodXMgSQogIGhhdmUgbGVmdCB0aGUgZGV2aWNlIHRyZWUgcGF0Y2hlcyBvdXQgb2YgdGhp
cyB2ZXJzaW9uLgoKVGhlcmUgd2VyZSBzb21lIGNvZGluZyBzdHlsZSBkaXNjdXNzaW9ucyBvbiB2
NSBvZiB0aGUgcGF0aCBidXQgaXQncwpiZWVuIGFncmVlZCB0aGF0IHdlIGNhbiBsYW5kIHRoaXMg
c2VyaWVzIGFzLWlzIGFuZCBhZnRlciBpdCBsYW5kcyB3ZQpjYW4gYWRkcmVzcyB0aGUgbWlub3Ig
c3R5bGUgaXNzdWVzLgoKWzFdIGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvQ0FMX0pzcUpHdFVU
cEpMK1NERUtpMDlhRFQ0eUR6WTR4OUt3WW16MDhOYVpjbj1uSGZBQG1haWwuZ21haWwuY29tCgpD
aGFuZ2VzIGluIHY2OgotIFJlYmFzZWQgdG8gZHJtLW1pc2MgbmV4dAotIEFkZGVkIHRhZ3MKCkNo
YW5nZXMgaW4gdjU6Ci0gQWRkZWQgSGVpa28ncyBUZXN0ZWQtYnkKCkNoYW5nZXMgaW4gdjQ6Ci0g
RG9uJ3QgYWRkIG1vZGUgZnJvbSB0aW1pbmcgaWYgb3ZlcnJpZGUgd2FzIHNwZWNpZmllZCAoVGhp
ZXJyeSkKLSBBZGQgd2FybmluZyBpZiB0aW1pbmcgYW5kIGZpeGVkIG1vZGUgd2FzIHNwZWNpZmll
ZCAoVGhpZXJyeSkKLSBEb24ndCBhZGQgZml4ZWQgbW9kZSBpZiB0aW1pbmcgd2FzIHNwZWNpZmll
ZCAoVGhpZXJyeSkKLSBSZWZhY3Rvci9yZW5hbWUgYSBiaXQgdG8gYXZvaWQgZXh0cmEgaW5kZW50
YXRpb24gZnJvbSAiaWYiIHRlc3RzCi0gaSBzaG91bGQgYmUgdW5zaWduZWQgKFRoaWVycnkpCi0g
QWRkIGFubm95aW5nIFdBUk5fT05zIGZvciBzb21lIGNhc2VzIChUaGllcnJ5KQotIFNpbXBsaWZ5
ICdObyBkaXNwbGF5X3RpbWluZyBmb3VuZCcgaGFuZGxpbmcgKFRoaWVycnkpCi0gUmVuYW1lIHRv
IHBhbmVsX3NpbXBsZV9wYXJzZV9vdmVycmlkZV9tb2RlKCkgKFRoaWVycnkpCi0gZGlzcGxheV90
aW1pbmcgZm9yIElubm9sdXggbjExNmJnZSBuZXcgZm9yIHY0LgotIGRpc3BsYXlfdGltaW5nIGZv
ciBBVU8gYjEwMWVhbjAxIG5ldyBmb3IgdjQuCgpDaGFuZ2VzIGluIHYzOgotIE5vIGxvbmdlciBw
YXJzZSBkaXNwbGF5LXRpbWluZ3Mgc3Vibm9kZSwgdXNlIHBhbmVsLXRpbWluZyAoUm9iKQoKQ2hh
bmdlcyBpbiB2MjoKLSBQYXJzZSB0aGUgZnVsbCBkaXNwbGF5LXRpbWluZ3Mgbm9kZSAodXNpbmcg
dGhlIG5hdGl2ZS1tb2RlKSAoUm9iKQoKRG91Z2xhcyBBbmRlcnNvbiAoMik6CiAgZHJtL3BhbmVs
OiBzaW1wbGU6IFVzZSBkaXNwbGF5X3RpbWluZyBmb3IgSW5ub2x1eCBuMTE2YmdlCiAgZHJtL3Bh
bmVsOiBzaW1wbGU6IFVzZSBkaXNwbGF5X3RpbWluZyBmb3IgQVVPIGIxMDFlYW4wMQoKU2VhbiBQ
YXVsICgxKToKICBkcm0vcGFuZWw6IHNpbXBsZTogQWRkIGFiaWxpdHkgdG8gb3ZlcnJpZGUgdHlw
aWNhbCB0aW1pbmcKCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAxNzEg
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTM5IGluc2VydGlv
bnMoKyksIDMyIGRlbGV0aW9ucygtKQoKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
