Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B0C9876
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 08:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF536E229;
	Thu,  3 Oct 2019 06:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B2B6E229
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 06:46:16 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id e1so1129460pgj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 23:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m2Ja4VwqADsNhG9MiI8QtGGRH5rBEepqA9PGguqW6g4=;
 b=oCcCPxjcwtHLIDejn+uwANw4pTg1+dKoWHLhedfuBApSH0ZShgySWMNFmWCWyrf+vl
 21INz+jYLzvjSCB/rn5+uZqagFnfZD6/w29jm2VaMoTPbrhT6AHQrcCWiS+0nPlj19kf
 idWsoIgKRTz4S6pRfScfyGd8BhdF6oJrG2Lmfj7uFZ6YnOORJID3LwMhwXJ54oMyr0n+
 W3MxLlLJ6gPHJUhsQFdQ3XR4RDZQ9HTTwwD46Y3Y1flG0iNOUc16/aL2T9spwR1hVovo
 u+Psu+ZpVYr+CRpPfRda6g/shcvOgrxeZMQ1qJFFrL7w9HKXLt8knhmuk/Ih21qYv5XU
 +gRA==
X-Gm-Message-State: APjAAAXr44N35XUQnc94FLsKo2SBLq1h4JlFTYczbcfNc5Eq9jbXJ07P
 3idCT4UkopLQQ3geERGrcWZanw==
X-Google-Smtp-Source: APXvYqxMytEbu1ysTV0gKAoMi1aynyZ8FC5X9e0oC1J/4KWj6EoCWYIBl53obU0Q0lCbqInhurgfxw==
X-Received: by 2002:a17:90a:a6f:: with SMTP id
 o102mr8682523pjo.103.1570085175903; 
 Wed, 02 Oct 2019 23:46:15 -0700 (PDT)
Received: from localhost.localdomain ([49.206.203.121])
 by smtp.gmail.com with ESMTPSA id b18sm1423294pfi.157.2019.10.02.23.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 23:46:15 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v11 4/7] dt-bindings: sun6i-dsi: Add VCC-DSI supply property
Date: Thu,  3 Oct 2019 12:15:24 +0530
Message-Id: <20191003064527.15128-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191003064527.15128-1-jagan@amarulasolutions.com>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m2Ja4VwqADsNhG9MiI8QtGGRH5rBEepqA9PGguqW6g4=;
 b=FqRrQeBDI6qP7YisP5RPpa0YmsWFSjcm5FPhgn4pS9P0YW16mHp84zg7AXHhoqp6Cm
 gDgUpDzbc+PLtvk3hT6omYQpKhCPiie8zC0n6gkOM1ltXtIsdAuhYYixftzVoDlPeH2Q
 azkOMETcbN9z4/zdxXaLLTMbP8Eogw7NEGpo0=
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
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsd2lubmVyIE1JUEkgRFNJIGNvbnRyb2xsZXJzIGFyZSBzdXBwbGllZCB3aXRoIFNvQyBEU0kK
cG93ZXIgcmFpbHMgdmlhIFZDQy1EU0kgcGluLgoKU29tZSBib2FyZCBzdGlsbCB3b3JrIHdpdGhv
dXQgc3VwcGx5aW5nIHRoaXMgYnV0IGdpdmUgbW9yZQpmYWl0aCBvbiBkYXRhc2hlZXQgYW5kIGhh
cmR3YXJlIHNjaGVtYXRpY3MgYW5kIGRvY3VtZW50IHRoaXMKc3VwcGx5IHByb3BlcnR5IGluIHJl
cXVpcmVkIHByb3BlcnR5IGxpc3QuCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KVGVzdGVkLWJ5OiBNZXJsaWpuIFdhamVyIDxtZXJsaWpuQHdpenp1cC5vcmc+ClNp
Z25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgotLS0K
IC4uLi9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kueWFtbCAg
ICAgICAgIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbGx3aW5uZXIs
c3VuNmktYTMxLW1pcGktZHNpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9hbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHNpLnlhbWwKaW5kZXggNDc5NTBm
Y2VkMjhkLi45ZDRjMjViMTA0ZjYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kueWFtbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbGx3aW5uZXIsc3Vu
NmktYTMxLW1pcGktZHNpLnlhbWwKQEAgLTM2LDYgKzM2LDkgQEAgcHJvcGVydGllczoKICAgcmVz
ZXRzOgogICAgIG1heEl0ZW1zOiAxCiAKKyAgdmNjLWRzaS1zdXBwbHk6CisgICAgZGVzY3JpcHRp
b246IFZDQy1EU0kgcG93ZXIgc3VwcGx5IG9mIHRoZSBEU0kgZW5jb2RlcgorCiAgIHBoeXM6CiAg
ICAgbWF4SXRlbXM6IDEKIAotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
