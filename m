Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C823EE529E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 19:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083F06EB18;
	Fri, 25 Oct 2019 17:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BBA6EB18
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 17:56:43 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 3so2047869pfb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CZu1y7RFPTmm+e4tCk9sCPOaUomZD2b+NU7YQ9E83qM=;
 b=VNMV5WighBSUNj2DOtRKFYo+pUNmbHN6D4Q4FgLoRFCkH8HCW7Eh3xm8N/kl2el/og
 ApP2TyDNZcdhiK7hRsKpVGmCUSyyunyho60/WCZ06ohbOVAh7pDHxCxCOVAM3Oe7tlFT
 4Ft3hclxg/Ci4i9ZpEJ33Ki5Nner+AkKkIW0coXz33ZHQVzaVXhy3S4kTJVFVZwze9Fn
 pSxObKsc4RiII/pGwd1xb6myWT6PoheUwpGfn9kkhLoOK5a63vGbfacvbHxT2VzSRVql
 fl4cIwxzuIwbJtAeCauS/TMD1lAba3atlEYzA+2NVvaITif9V9FNQt60WdvsNEXnP1at
 M3YA==
X-Gm-Message-State: APjAAAUDfUqTQVNZ3wbhjpl5bMH8Z3WsAdEe+r4JCh9pl3PzkzqhFHZ3
 ibEAR1YLrp6linzuEMSLa0LtRw==
X-Google-Smtp-Source: APXvYqyQeMNwRRfVdYbplZky4DnGyeCS16N1lkW3Qf6FFBlut0tyb3bO5QFkhxBsvIR+NOqRTEQOdg==
X-Received: by 2002:a17:90a:ad95:: with SMTP id
 s21mr5737486pjq.11.1572026202818; 
 Fri, 25 Oct 2019 10:56:42 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id n15sm2926580pfq.146.2019.10.25.10.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 10:56:42 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v11 0/7] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Fri, 25 Oct 2019 23:26:18 +0530
Message-Id: <20191025175625.8011-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CZu1y7RFPTmm+e4tCk9sCPOaUomZD2b+NU7YQ9E83qM=;
 b=YhjRITCeN91gMx3yOBIKu1C/Pio+m/xXybbzZLCU25mrLAjzyrOYfNs1bhqX/uwVzD
 xrMOinaz6vv7qJY1vx/NwIHKq3EqmHOgy/jU9Dl2pHGXYkEWrTAJQki2NH27JXd6tcQz
 QqlAaNV8+/GmvrmeZx1FFtPzeMWx9l3huboSQ=
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
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB2MTEgdmVyc2lvbiBmb3IgQWxsd2lubmVyIEE2NCBNSVBJLURTSSBzdXBwb3J0CmFu
ZCBoZXJlIGlzIHRoZSBwcmV2aW91cyB2ZXJzaW9uIHNldFsxXQoKQ2hhbmdlcyBmb3IgdjExOgot
IGZpeCBkdC1iaW5kaW5ncyBmb3IgZHBoeQotIGZpeCBkdC1iaW5kaW5ncyBmb3IgZHNpIGNvbnRy
b2xsZXIKLSBhZGQgYnVzIGNsb2NrIGhhbmRsaW5nIGNvZGUKLSB0ZXN0ZWQgb24gQTY0LCBBMzMg
Ym9hcmRzLgpDaGFuZ2VzIGZvciB2MTA6Ci0gdXBkYXRlZCBkdC1iaW5kaW5ncyBhcyBwZXIgLnlh
bWwgZm9ybWF0Ci0gcmViYXNlZCBvbiBkcm0tbWlzYy9mb3ItbGludXgtbmV4dApDaGFuZ2VzIGZv
ciB2OToKLSBtb3ZlZCBkc2kgZml4ZXMgaW4gc2VwYXJhdGUgc2VyaWVzIG9uIHRvcCBvZiBBMzMK
LSByZWJhc2Ugb24gbGludXgtbmV4dApDaGFuZ2VzIGZvciB2ODoKLSByZWJhc2VkIG9uIGRybS1t
aXNjIGNoYW5nZSBhbG9uZyB3aXRoIGxpbnV4LW5leHQKLSByZXdvcmtlZCB2aWRlbyBzdGFydCBk
ZWxheSBwYXRjaAotIHRlc3RlZCBvbiA0IGRpZmZlcmVudCBkc2kgcGFuZWxzCi0gcmV3b3JrZWQg
Y29tbWl0IG1lc3NhZ2VzCkNoYW5nZXMgZm9yIHY3OgotIG1vdmVkIHZjYy1kc2kgYmluZGluZyB0
byByZXF1aXJlZCBmaWxlZC4KLSBkcm9wIHF1b3RlcyBvbiBmYWxsYmFjayBkcGh5IGJpbmRpbmdz
LgotIGRyb3AgbWluX3JhdGUgY2xvY2sgcGxsLW1pcGkgcGF0Y2hlcy4KLSBpbnRyb2R1Y2UgZGNs
ayBkaXZpZGVyIGNvbXB1dGF0aW9uIGFzIGxpa2UgQTY0IEJTUC4KLSBhZGQgQTY0IERTSSBxdWFy
ayBwYXRjaGVzLgotIGZpeGVkIEE2NCBEU0kgcGlwZWxpbmUuCi0gYWRkIHByb3BlciBjb21taXQg
bWVzc2FnZXMuCi0gY29sbGVjdCBNZXJsaWpuIFdhamVyIFRlc3RlZC1ieSBjcmVkaXRzLgpDaGFu
Z2VzIGZvciB2NjoKLSBkcm9wcGVkIHVubmVlZGVkIGNoYW5nZXMsIHBhdGNoZXMKLSBmaXhlZCBh
bGwgYnVyc3QgbW9kZSBwYXRjaGVzIGFzIHBlciBwcmV2aW91cyB2ZXJzaW9uIGNvbW1lbnRzCi0g
cmViYXNlIG9uIG1hc3RlcgotIHVwZGF0ZSBwcm9wZXIgY29tbWl0IG1lc3NhZ2UKLSBkcm9wcGVk
IHVubmVlZGVkIGNvbW1lbnRzCi0gb3JkZXIgdGhlIHBhdGNoZXMgdGhhdCBtYWtlIHJldmlldyBl
YXN5CkNoYW5nZXMgZm9yIHY1OgotIGNvbGxlY3QgUm9iLCBBY2tlZC1ieQotIGRyb3BlZCAiRml4
IFZCUCBzaXplIGNhbGN1bGF0aW9uIiBwYXRjaAotIHVwZGF0ZWQgdmJsayB0aW1pbmcgY2FsY3Vs
YXRpb24uCi0gZHJvcGVkIHRlY2hzdGFyLCBiYW5hbmFwaSBkc2kgcGFuZWwgZHJpdmVycyB3aGlj
aCBtYXkgcmVxdWlyZQogIGJyaWRnZSBvciBvdGhlciBzZXR1cC4gaXQncyB1bmRlciBkaXNjdXNz
aW9uLgpDaGFuZ2VzIGZvciB2NDoKLSBkcm9wcG9lZCB1bnRlc3RlZCBDQ1VfRkVBVFVSRV9GSVhF
RF9QT1NURElWIGNoZWNrIGNvZGUgaW4KICBua20gbWluLCBtYXggcmF0ZSBwYXRjaGVzCi0gY3Jl
YXRlIHR3byBwYXRjaGVzIGZvciAiQWRkIEFsbHdpbm5lciBBNjQgTUlQSSBEU0kgc3VwcG9ydCIK
ICBvbmUgZm9yIGhhc19tb2RfY2xrIHF1aXJrIGFuZCBvdGhlciBvbmUgZm9yIEE2NCBzdXBwb3J0
Ci0gdXNlIGV4aXN0aW5nIGRyaXZlciBjb2RlIGNvbnN0cnVjdCBmb3IgaGJsayBjb21wdXRhdGlv
bgotIGRyb3BwZWQgIkluY3JlYXNlIGhmcCBwYWNrZXQgb3ZlcmhlYWQiIHBhdGNoIFsyXSwgdGhv
dWdoIEJTUCBhZGRlZAogIHRoaXMgYnV0IHdlIGhhdmUgbm8gaXNzdWVzIGFzIG9mIG5vdy4KICAo
bm8gaXNzdWVzIG9uIHBhbmVsIHNpZGUgdy9vIHRoaXMgY2hhbmdlKQotIGNyZWF0ZSBzZXBhcmF0
ZSBmdW5jdGlvbiBmb3IgdmJsayBjb21wdXRhdGlvbiAKLSBlbmFibGUgdmNjLWRzaSByZWd1bGF0
b3IgaW4gZHNpX3J1bnRpbWVfcmVzdW1lCi0gY29sbGVjdCBSb2IsIEFja2VkLWJ5Ci0gdXBkYXRl
IE1BSU5UQUlORVJTIGZpbGUgZm9yIHBhbmVsIGRyaXZlcnMKLSBjbGVhbnVwIGNvbW1pdCBtZXNz
YWdlcwotIGZpeGVkIGNoZWNrcGF0Y2ggd2FybmluZ3MvZXJyb3JzCgpbMV0gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NzYzMi8KCkFueSBpbnB1dHM/CkphZ2FuLgoK
SmFnYW4gVGVraSAoNyk6CiAgZHQtYmluZGluZ3M6IHN1bjZpLWRzaTogRG9jdW1lbnQgQTY0IE1J
UEktRFNJIGNvbnRyb2xsZXIKICBkdC1iaW5kaW5nczogc3VuNmktZHNpOiBBZGQgQTY0IERQSFkg
Y29tcGF0aWJsZSAody8gQTMxIGZhbGxiYWNrKQogIGRybS9zdW40aTogZHNpOiBBZGQgaGFzX21v
ZF9jbGsgcXVpcmsKICBkcm0vc3VuNGk6IGRzaTogSGFuZGxlIGJ1cyBjbG9jayBleHBsaWNpdGx5
wqAKICBkcm0vc3VuNGk6IGRzaTogQWRkIEFsbHdpbm5lciBBNjQgTUlQSSBEU0kgc3VwcG9ydAog
IGFybTY0OiBkdHM6IGFsbHdpbm5lcjogYTY0OiBBZGQgTUlQSSBEU0kgcGlwZWxpbmUKICBbRE8g
Tk9UIE1FUkdFXSBhcm02NDogZHRzOiBhbGx3aW5uZXI6IGJhbmFuYXBpLW02NDogRW5hYmxlIEJh
bmFuYXBpIFMwNzBXVjIwLUNUMTYgRFNJIHBhbmVsCgogLi4uL2Rpc3BsYXkvYWxsd2lubmVyLHN1
bjZpLWEzMS1taXBpLWRzaS55YW1sIHwgMjAgKysrKysrLQogLi4uL3BoeS9hbGx3aW5uZXIsc3Vu
NmktYTMxLW1pcGktZHBoeS55YW1sICAgIHwgIDYgKy0KIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUw
aS1hNjQtYmFuYW5hcGktbTY0LmR0cyB8IDMxICsrKysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kgfCAzNyArKysrKysrKysrKysrCiBkcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyAgICAgICAgfCA1NSArKysrKysrKysrKysr
KystLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuaCAgICAgICAgfCAg
NSArKwogNiBmaWxlcyBjaGFuZ2VkLCAxMzkgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0p
CgotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
