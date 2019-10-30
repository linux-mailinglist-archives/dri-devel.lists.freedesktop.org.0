Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FDCEA4BD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 21:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032436EAB7;
	Wed, 30 Oct 2019 20:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8066EAB7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 20:30:06 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id p187so1327825ywg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 13:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qgwg5LDP64ovBKpaUpYHBaNKrVFLg2eRXMbTF9OaCQY=;
 b=fezUGEijsjWO11Jdj4U6b2at5JXyPbdTXs5Grd+SVeQMAdcoIVFAv7Julpi2Zywh1q
 SWzOuKyFf7YIVm2UCMGz+QdGiMpoD/MTmMiPURCv63U+R1pcRCXsXxIM0egL0sZTaobL
 glzM3IZZW7s+jdJfJthWHsLWsPvonVHYVurtURtnpHRRxCam/MQjg0esalbfEKgHZ4wA
 ZOsJN47ZB030btuLfBD7ZOp9HUnkgFObtlyHlw62oftda0RLIoS5Hio9VPxKTvAAyqbc
 kMZLgUXG1einrBdjoBIWWTEFlAuHaS/9g55BsKOoNS/uaA2aUZGWr1uc+gs1Q/2vQYAv
 5Yjw==
X-Gm-Message-State: APjAAAWlCD8iiB1d0PD/2NEq6MBX11y3oPlkb1+GN40RXQKY23dIDQnB
 y3qf6IzVSNH5GlQ1u5GWZoh3OXmKQlw=
X-Google-Smtp-Source: APXvYqxDyQnVi/1jScPQTTEDq6vuuew/QAHdSqmEJSARFj0XnDcvlpVcc2v+iRB6gt2dL9HxYyFx+Q==
X-Received: by 2002:a81:3c92:: with SMTP id j140mr1180065ywa.227.1572467405430; 
 Wed, 30 Oct 2019 13:30:05 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id h35sm416432ywk.63.2019.10.30.13.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 13:30:04 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] Revert "DMA-BUF Heaps (destaging ION)"
Date: Wed, 30 Oct 2019 16:29:49 -0400
Message-Id: <20191030203003.101156-1-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qgwg5LDP64ovBKpaUpYHBaNKrVFLg2eRXMbTF9OaCQY=;
 b=PBik32k3hIs2XJMh5T5qnovllcuYvCxsCjMlz6pRoq57xPoHep7l4tFxOgFR0u+Ab1
 TK8SmRUtCaVX6D+F5Pz4buJecZPV4aq4qnrACPe+a/S3wkAEe07AaGWoGbAD7SuNFpRh
 tXplDeCwDMXYOQ6yDLy3nw9LyhK0/TtKPLeZ9am2mmEqotkysS+Ra/5kzjcjAEiXoQoZ
 ABqOQNrsdXshbnZFstfI2eVXPub1XWSDld2hL80fg6A0Brdr38v1x7fQMOrhuojzY4jQ
 eUG8oVqItNdLhwHmH3WLgpssUBeoK5kmO15X3UkrVj6EVJsgooWxQodKhDigutR7sao1
 sN5g==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpXaGlsZSB0aGUga2VybmVs
IHNldCBoYXMgYSBzb2xpZCBudW1iZXIgb2Ygci1iJ3MgYW5kIGFja3MsIHRoZQp1c2Vyc3BhY2Ug
Y29tcG9uZW50IGRvZXMgbm90IG1lZXQgdGhlIGRybSByZXF1aXJlbWVudHMgb2YgYmVpbmcKInJl
dmlld2VkIGFuZCByZWFkeSBmb3IgbWVyZ2luZyBpbnRvIGEgc3VpdGFibGUgYW5kIGNhbm9uaWNh
bCB1cHN0cmVhbQpwcm9qZWN0Ii4KCk9uY2UgdGhlIHVzZXJzcGFjZSBwb3J0aW9uIGhhcyBiZWVu
IHJldmlld2VkLCBsZXQncyB0cnkgYWdhaW4uCgpTZWFuCgpbMV0gaHR0cHM6Ly8wMS5vcmcvbGlu
dXhncmFwaGljcy9nZngtZG9jcy9kcm0vZ3B1L2RybS11YXBpLmh0bWwjb3Blbi1zb3VyY2UtdXNl
cnNwYWNlLXJlcXVpcmVtZW50cwoKU2VhbiBQYXVsICg1KToKICBSZXZlcnQgImtzZWxmdGVzdHM6
IEFkZCBkbWEtaGVhcCB0ZXN0IgogIFJldmVydCAiZG1hLWJ1ZjogaGVhcHM6IEFkZCBDTUEgaGVh
cCB0byBkbWFidWYgaGVhcHMiCiAgUmV2ZXJ0ICJkbWEtYnVmOiBoZWFwczogQWRkIHN5c3RlbSBo
ZWFwIHRvIGRtYWJ1ZiBoZWFwcyIKICBSZXZlcnQgImRtYS1idWY6IGhlYXBzOiBBZGQgaGVhcCBo
ZWxwZXJzIgogIFJldmVydCAiZG1hLWJ1ZjogQWRkIGRtYS1idWYgaGVhcHMgZnJhbWV3b3JrIgoK
IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxOCAtLQog
ZHJpdmVycy9kbWEtYnVmL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDExIC0KIGRy
aXZlcnMvZG1hLWJ1Zi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAtCiBkcml2
ZXJzL2RtYS1idWYvZG1hLWhlYXAuYyAgICAgICAgICAgICAgICAgICAgfCAyNjkgLS0tLS0tLS0t
LS0tLS0tLS0tCiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZyAgICAgICAgICAgICAgICAg
fCAgMTQgLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL01ha2VmaWxlICAgICAgICAgICAgICAgIHwg
ICA0IC0KIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jICAgICAgICAgICAgICB8IDE3
OCAtLS0tLS0tLS0tLS0KIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYyAgICAg
ICAgICB8IDI2OCAtLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAt
aGVscGVycy5oICAgICAgICAgIHwgIDU1IC0tLS0KIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0
ZW1faGVhcC5jICAgICAgICAgICB8IDEyNCAtLS0tLS0tLQogaW5jbHVkZS9saW51eC9kbWEtaGVh
cC5oICAgICAgICAgICAgICAgICAgICAgIHwgIDU5IC0tLS0KIGluY2x1ZGUvdWFwaS9saW51eC9k
bWEtaGVhcC5oICAgICAgICAgICAgICAgICB8ICA1NSAtLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9kbWFidWYtaGVhcHMvTWFrZWZpbGUgfCAgIDkgLQogLi4uL3NlbGZ0ZXN0cy9kbWFidWYt
aGVhcHMvZG1hYnVmLWhlYXAuYyAgICAgIHwgMjM4IC0tLS0tLS0tLS0tLS0tLS0KIDE0IGZpbGVz
IGNoYW5nZWQsIDEzMDQgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9k
bWEtYnVmL2RtYS1oZWFwLmMKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2RtYS1idWYvaGVh
cHMvS2NvbmZpZwogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9NYWtl
ZmlsZQogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5j
CiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5j
CiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5o
CiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmgKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL3VhcGkvbGludXgvZG1hLWhlYXAuaAogZGVsZXRlIG1vZGUgMTAwNjQ0
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9NYWtlZmlsZQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RtYWJ1Zi1oZWFwcy9kbWFidWYtaGVh
cC5jCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0g
T1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
