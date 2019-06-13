Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BAA44B42
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094EA898AA;
	Thu, 13 Jun 2019 18:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9130898AA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:54:20 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id s24so8506503plr.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sk+uYjhqJHAw964SCFGOxu5y7oNB40UpzgVh7GqXmwg=;
 b=r0a/4JeOYx5ILL/acZnvr307r2aBnm2hidfuQElAIh0ab/BnGgj3s7tSjyfxomsJII
 v0iNsxVjioNDGaZpghqjJNkPiCJjwmFGm2xxVpHSX3eA9K/9CQ6l3DSNiAcO2hE5wFkO
 XoEFiiATaaiPOJCj1LsqJyVfiuAkIJSzvbuUi8S7gIuR2zHVscA38OJKAHpKAshzpeVD
 Hw2oPEqpLJbJt69f3Z2lBhX0Lye0pGM7Ndb4IwF1zOe8lo+uPN+WCvQd/+j/CnZQlFq+
 ZnlKsQLmVB31sHkcpqmEH7l9AdjdQaqjeyM8bVC0K5LiOH5Zofg2cbA0kDM6FY/6I7e0
 Jlew==
X-Gm-Message-State: APjAAAWyJZx5skZqwNtlxQqL2ZOGCERGGB6i/lsbg/+mbqhqd0TkEQPl
 WbCP77jGZHuJmTJ8wb3kmA7HKA==
X-Google-Smtp-Source: APXvYqxdCbhYLN1KvxrQ0Bk6AS/+DAcgn/aZPji8xl3m3SbFHzYoliwV48IHU6lpqn7tNm9669WzBA==
X-Received: by 2002:a17:902:6acc:: with SMTP id
 i12mr12248821plt.214.1560452060308; 
 Thu, 13 Jun 2019 11:54:20 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id p43sm946314pjp.4.2019.06.13.11.54.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:54:19 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 7/9] dt-bindings: sun6i-dsi: Add R40 DPHY compatible (w/ A31
 fallback)
Date: Fri, 14 Jun 2019 00:22:39 +0530
Message-Id: <20190613185241.22800-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190613185241.22800-1-jagan@amarulasolutions.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sk+uYjhqJHAw964SCFGOxu5y7oNB40UpzgVh7GqXmwg=;
 b=fBsDzS4JeqKEhAEeQoe57Gg6zI4DRJe+6X0Jpla0pRzUX5dwOlDJ0aTXE9tGmj1KTb
 dThn0C4kaitvtTYciol0iT8B+ePfWv7AlL58S8oQHnLqu4EhB33n+WSObLFlu9V+XrDX
 nx2ai8wBzG3Q7T7EGeD5ShFcX+LnCdLUk1rMs=
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sunxi@googlegroups.com,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1JUEkgRFNJIFBIWSBjb250cm9sbGVyIG9uIEFsbHdpbm5lciBSNDAgaXMgc2ltaWxhcgpv
biB0aGUgb25lIG9uIEEzMS4KCkFkZCBSNDAgY29tcGF0aWJsZSBhbmQgYXBwZW5kIEEzMSBjb21w
YXRpYmxlIGFzIGZhbGxiYWNrLgoKQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+
CkNjOiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBK
YWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW42aS1kc2kudHh0IHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW42aS1kc2kudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dApp
bmRleCA0MzhmMWY5OTlhZWIuLmI3YWQxYmUzMzAwOCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNmktZHNpLnR4dAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW42aS1kc2ku
dHh0CkBAIC00MCw2ICs0MCw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAgIC0gY29tcGF0aWJs
ZTogdmFsdWUgbXVzdCBiZSBvbmUgb2Y6CiAgICAgKiBhbGx3aW5uZXIsc3VuNmktYTMxLW1pcGkt
ZHBoeQogICAgICogYWxsd2lubmVyLHN1bjUwaS1hNjQtbWlwaS1kcGh5LCBhbGx3aW5uZXIsc3Vu
NmktYTMxLW1pcGktZHBoeQorICAgICogYWxsd2lubmVyLHN1bjhpLXI0MC1taXBpLWRwaHksIGFs
bHdpbm5lcixzdW42aS1hMzEtbWlwaS1kcGh5CiAgIC0gcmVnOiBiYXNlIGFkZHJlc3MgYW5kIHNp
emUgb2YgbWVtb3J5LW1hcHBlZCByZWdpb24KICAgLSBjbG9ja3M6IHBoYW5kbGVzIHRvIHRoZSBj
bG9ja3MgZmVlZGluZyB0aGUgRFNJIGVuY29kZXIKICAgICAqIGJ1czogdGhlIERTSSBpbnRlcmZh
Y2UgY2xvY2sKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
