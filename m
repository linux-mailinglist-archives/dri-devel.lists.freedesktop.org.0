Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4148F44B34
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B751989854;
	Thu, 13 Jun 2019 18:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602F489854
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:53:52 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id f21so39743pgi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T43YpeB6KPwzAeP2AJF/MUSVY3ntDzP4uFwV6vk6NQg=;
 b=SLo00f/qUl5yvgL4TAoTLMjgpxlUavF20BUw7ogmUDaw+AOdXtZZ7fJfIsQEbMMSiQ
 +FdiDwCn9bNZUkuWaTsXH+zahMS4cVJNwE2tezKtLT/cKI3nOg2G57fF719zJ21wyTr5
 YJc+04HCq1Ae/lW3pjpi9A5204qq7PWdgVLEVqiMWeOhszDHaJ786M7+2UQpkBI3wdxV
 eNK9DhSxD9zgHno7QY4zsGKdOM68iJVVkdzEWbBfP5AAdvl00p+GvNjpV3hLTi4juPoS
 P4Opxd+b3nvWFQBSzeDl7lxdGHKaA/uScaYpXRB6UQoybQSqKtkvmHU3GAjb0PLyFRyc
 f5/w==
X-Gm-Message-State: APjAAAVOg2rGK+gZp6jX0Yn7PpY9poqPaaHIOjMzMWcXDXnfzer3Chyt
 ArSfMvyE9i+DZ+1Gr9JaAZrdLQ==
X-Google-Smtp-Source: APXvYqyVfFXF+RWaOpNVOg11XNoCvv+xPHrf1CT9JUGH0iqGtinHj2ErGGLnXkVZWEBC2hZlm3HTDg==
X-Received: by 2002:a63:d008:: with SMTP id z8mr32305004pgf.335.1560452031872; 
 Thu, 13 Jun 2019 11:53:51 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id p43sm946314pjp.4.2019.06.13.11.53.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:53:51 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 1/9] dt-bindings: display: Add TCON LCD compatible for R40
Date: Fri, 14 Jun 2019 00:22:33 +0530
Message-Id: <20190613185241.22800-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190613185241.22800-1-jagan@amarulasolutions.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T43YpeB6KPwzAeP2AJF/MUSVY3ntDzP4uFwV6vk6NQg=;
 b=j9mr7D0Q6WW70PaeAtZuQL8G13f13pQs9IWPwKl+tPlMpbbUYNHSA7/2znZNRp4i6f
 xuPGM5N8BaXMZD4k9kcCOJvheE6bxtkD9vhqrtzOQlUR2aj++rY26vh/QPKy1Nx4sSA1
 k6tcIi7x5mhhp3NQyTlU98pZFu5OqX4r0AHls=
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

TGlrZSBUQ09OIFRWMCwgVFYxIGFsbHdpbm5lciBSNDAgaGFzIFRDT04gTENEMCwgTENEMSB3aGlj
aAphcmUgbWFuYWdlZCB2aWEgVENPTiBUT1AuCgpBZGQgdGNvbiBsY2QgY29tcGF0aWJsZSBSNDAs
IHRoZSBzYW1lIGNvbXBhdGlibGUgY2FuIGhhbmRsZQpUQ09OIExDRDAsIExDRDEuCgpDYzogUm9i
IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KQ2M6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRs
YW5kQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3N1bnhpL3N1bjRpLWRybS50eHQgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3N1bnhpL3N1bjRpLWRybS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9zdW54aS9zdW40aS1kcm0udHh0CmluZGV4IDMxYWI3MmNiYTNkNC4uOWU5YzdmOTM0
MjAyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9zdW54aS9zdW40aS1kcm0udHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3N1bnhpL3N1bjRpLWRybS50eHQKQEAgLTE2MCw2ICsxNjAsNyBAQCBSZXF1
aXJlZCBwcm9wZXJ0aWVzOgogICAgKiBhbGx3aW5uZXIsc3VuOGktYTMzLXRjb24KICAgICogYWxs
d2lubmVyLHN1bjhpLWE4M3QtdGNvbi1sY2QKICAgICogYWxsd2lubmVyLHN1bjhpLWE4M3QtdGNv
bi10dgorICAgKiBhbGx3aW5uZXIsc3VuOGktcjQwLXRjb24tbGNkCiAgICAqIGFsbHdpbm5lcixz
dW44aS1yNDAtdGNvbi10dgogICAgKiBhbGx3aW5uZXIsc3VuOGktdjNzLXRjb24KICAgICogYWxs
d2lubmVyLHN1bjlpLWE4MC10Y29uLWxjZAotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
