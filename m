Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A141757
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 23:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE4789110;
	Tue, 11 Jun 2019 21:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDD389110
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 21:55:58 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c11so8688438qkk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sPtz3BqdiTBkbWwtR0/UrKDxgV+sZMQrD6twsVTFc4U=;
 b=P8Q43NTR0GXkmU/Ppg1xFLG91SGBl8O+Vgc0k3tujUBZ+VQ/Dxp8AjmHgIKo3HyBGm
 /FhiaDH0Ph9qpdL27WZUqTOQbkLaWFz6tXFFfFrMR+cUG3OuJE6+gUWoRO09auTsMF5M
 /f+tIx2zA6Lk363ThzV71nfRpero+15cMTMmUAy+BOCGFnsuPADGTB4zOjseVAHaNlrg
 1WfOcP26dPrciICJfB0UlISghJJGfTtSn7UhJnM2HwJNHUcBFwjgDxsI18BbV+eG77eG
 0u1HQa7xf0if0vON3MH815Nb4kzkMNTlkRgHCWiX+wji3DgAErniYW3/vUf5SIjCB9Pf
 MKRA==
X-Gm-Message-State: APjAAAW+ws4lEzRYQzcmxwQksb01ldS4nx5nC+sFpQrqF7NCaI9QbfB4
 iy8UFZ2dfz2M/KzfyysAPA==
X-Google-Smtp-Source: APXvYqxzcnLdJ4B7Arm6EZke3/gqxzSlYdTwCd01UFloU9lha7IwBhMaG2twe1MNISi/vJK4eDe/aw==
X-Received: by 2002:a37:e402:: with SMTP id y2mr42991762qkf.200.1560290157124; 
 Tue, 11 Jun 2019 14:55:57 -0700 (PDT)
Received: from localhost ([64.188.179.199])
 by smtp.gmail.com with ESMTPSA id i30sm5956849qtb.18.2019.06.11.14.55.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 14:55:56 -0700 (PDT)
Date: Tue, 11 Jun 2019 15:55:54 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add doc for the Ingenic JZ47xx LCD
 controller driver
Message-ID: <20190611215554.GA23791@bogus>
References: <20190603152331.23160-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603152331.23160-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Artur Rojek <contact@artur-rojek.eu>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAgMyBKdW4gMjAxOSAxNzoyMzozMCArMDIwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToK
PiBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGRldmljZXRyZWUgYmluZGluZ3Mgb2YgdGhlIExD
RCBjb250cm9sbGVyIHByZXNlbnQgaW4KPiB0aGUgSlo0N3h4IGZhbWlseSBvZiBTb0NzIGZyb20g
SW5nZW5pYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWls
bG91Lm5ldD4KPiBUZXN0ZWQtYnk6IEFydHVyIFJvamVrIDxjb250YWN0QGFydHVyLXJvamVrLmV1
Pgo+IC0tLQo+IAo+IE5vdGVzOgo+ICAgICB2MjogUmVtb3ZlIGluZ2VuaWMscGFuZWwgcHJvcGVy
dHkuCj4gICAgIAo+ICAgICB2MzogLSBSZW5hbWUgY29tcGF0aWJsZSBzdHJpbmdzIGZyb20gaW5n
ZW5pYyxqejQ3WFgtZHJtIHRvIGluZ2VuaWMsano0N1hYLWxjZAo+ICAgICAgICAgLSBUaGUgaW5n
ZW5pYyxsY2QtbW9kZSBwcm9wZXJ0eSBpcyBub3cgcmVhZCBmcm9tIHRoZSBwYW5lbCBub2RlIGlu
c3RlYWQKPiAgICAgCSAgb2YgZnJvbSB0aGUgZHJpdmVyIG5vZGUKPiAgICAgCj4gICAgIHY0OiBS
ZW1vdmUgaW5nZW5pYyxsY2QtbW9kZSBwcm9wZXJ0eSBjb21wbGV0ZWx5Lgo+ICAgICAKPiAgICAg
djU6IE5vIGNoYW5nZQo+IAo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9pbmdlbmljLGxjZC50eHQg
ICAgICAgICAgfCA0NCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9pbmdlbmljLGxjZC50eHQKPiAKClBsZWFzZSBhZGQgQWNrZWQt
YnkvUmV2aWV3ZWQtYnkgdGFncyB3aGVuIHBvc3RpbmcgbmV3IHZlcnNpb25zLiBIb3dldmVyLAp0
aGVyZSdzIG5vIG5lZWQgdG8gcmVwb3N0IHBhdGNoZXMgKm9ubHkqIHRvIGFkZCB0aGUgdGFncy4g
VGhlIHVwc3RyZWFtCm1haW50YWluZXIgd2lsbCBkbyB0aGF0IGZvciBhY2tzIHJlY2VpdmVkIG9u
IHRoZSB2ZXJzaW9uIHRoZXkgYXBwbHkuCgpJZiBhIHRhZyB3YXMgbm90IGFkZGVkIG9uIHB1cnBv
c2UsIHBsZWFzZSBzdGF0ZSB3aHkgYW5kIHdoYXQgY2hhbmdlZC4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
