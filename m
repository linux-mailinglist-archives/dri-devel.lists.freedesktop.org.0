Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8DA75391
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 18:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AE36E78F;
	Thu, 25 Jul 2019 16:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237AF6E78A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 16:09:11 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id f195so18668739ybg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 09:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=HUx8lU4T5ViTXPoFsx/d4wDW5Gp6q93Ex1yqRITW1yI=;
 b=H5Ah6evW16k8BtMbvBXqPrRqcHde4EFNWrRUN8eL1f2FSKK1Zift/jdzVWFgLMBQs+
 uV4E4PfsajeZXiHf3Ag3uhoVTAgWiVuHvHHUSV6aQj7hxzro9zcGFJMeZnsYpacc6IXn
 M4tC1a2854XB06aOhNWByVowOsBfMlv43tfQwjOs+FaO0K4zKKmy2BZT3mMOI1U+mLHk
 VTrbn80tRsuorV98Zy2S5D9WeHnVBlMRgr3yuXHIKIoxVj/FZzvJLIRHPiXww+h2kuJG
 YKVKn6chJcpWCW9pevo1ZybTqmelu9FMpTjslXVUAIHmXH97a0k5QDyGjGPuBHcS4Aw3
 Yxjg==
X-Gm-Message-State: APjAAAXDw3LHB6jTwy9zGkVZQoDBycVxesS9IRKiUJ/qn2zXks2KKLfz
 9P3B27EeOWFh1gQSpJ5ZRrEsEy2g5lSOmg==
X-Google-Smtp-Source: APXvYqxsLU8bUE/XvGFE+jzO+8m+SMvUDoemEgO3MFCvxogT7ssygNU2PbS+nMkuBE+Aihv8fyaiPg==
X-Received: by 2002:a25:2cd1:: with SMTP id
 s200mr51443276ybs.453.1564070950148; 
 Thu, 25 Jul 2019 09:09:10 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id z9sm11725278ywj.84.2019.07.25.09.09.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:09:09 -0700 (PDT)
Date: Thu, 25 Jul 2019 12:09:09 -0400
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20190725160909.GA106249@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=HUx8lU4T5ViTXPoFsx/d4wDW5Gp6q93Ex1yqRITW1yI=;
 b=UVL572FOIhK4PA+pnTHJQsiyJpbGwRMr61kzKwy+82ejcEkuHej+gWKj4fSZposTs7
 cX2cdpGwCHgNT243ZFWojYNk9x0P0GN0yhX7SORC2nS1yCHyqHLaenqonO7v6p/+oBbf
 NHt6p+jZDXXT7AqhNd9qjiXpYO84SZmN0Uo2HWJ1Oq7y05mQ3I0SMgR5SHGspe9P2ha2
 9aMvd1I/ZL5YUEbouR2wJWqCyz1O9zIQcjawOHlSPGnXjTzA7Z5TKGcJvSbo0RG0Qsnr
 GdTimCI2EbqncgrNtm1LWSRKyr3hdoowB60hDXyczhVjRtCGLPmZbQl6ajy7xasLWA7d
 FKdw==
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
Cc: dim-tools@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx@lists.freedesktop.org, Qian Cai <cai@lca.pw>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dmitry Osipenko <digetx@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIGFsbCwKU3Vic3RpdHV0ZS1NYWFydGVuIGhlcmUgZm9yIGFub3RoZXIgcHVsbCByZXF1ZXN0
LiBUaGlzIHdlZWsgaXMgcHJldHR5IGxpZ2h0LCBhcwp5b3Ugd291bGQgZXhwZWN0LiBJIG1lcmdl
ZCBhIGxlZnRvdmVyIG51Z2dldCBmcm9tIGRybS1taXNjLW5leHQgdGhhdCBkaWRuJ3QgbWFrZQot
cmMxIGFuZCBhbSBhYnVzaW5nIGNvdmVyaW5nIGZvciBNYWFydGVuIGJ5IHNuZWFraW5nIGluIGEg
aGFuZGZ1bCBvZiBtc20KY2hhbmdlcyB0byBhdm9pZCBoYXZpbmcgdG8gc2VuZCAyIHB1bGxzLgoK
CmRybS1taXNjLWZpeGVzLTIwMTktMDctMjU6Ci0gcGljayB1cCB0aGUgY21kbGluZSBmaXggd2hp
Y2ggbWlzc2VkIHRoZSBtZXJnZSB3aW5kb3cgKERtaXRyeSkKLSBhIGhhbmRmdWwgb2YgbXNtIGZp
eGVzIHNvIGkgZG9uJ3QgaGF2ZSB0byBzcGluIHVwIG1zbS1maXhlcyAoVmFyaW91cykKLSBmaXgg
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZSB3YXJuaW5nIGluIGRybV9mcmFtZWJ1ZmZlciAoUWlh
bikKCkNjOiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+CkNjOiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BnbWFpbC5jb20+CkNjOiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4KCkNoZWVycywg
U2VhbgoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNWY5ZTgzMmMxMzcwNzUw
NDVkMTVjZDY4OTlhYjA1MDVjZmIyY2E0YjoKCiAgTGludXMgNS4zLXJjMSAoMjAxOS0wNy0yMSAx
NDowNTozOCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgdGFncy9kcm0tbWlz
Yy1maXhlcy0yMDE5LTA3LTI1Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYmJiNmZj
NDNmMTMxZjc3ZmNiN2FlODA4MWY2ZDdjNTEzOTZhMjEyMDoKCiAgZHJtOiBzaWxlbmNlIHZhcmlh
YmxlICdjb25uJyBzZXQgYnV0IG5vdCB1c2VkICgyMDE5LTA3LTIyIDE2OjA0OjUzIC0wNDAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQotIHBpY2sgdXAgdGhlIGNtZGxpbmUgZml4IHdoaWNoIG1pc3NlZCB0aGUgbWVyZ2Ug
d2luZG93IChEbWl0cnkpCi0gYSBoYW5kZnVsIG9mIG1zbSBmaXhlcyBzbyBpIGRvbid0IGhhdmUg
dG8gc3BpbiB1cCBtc20tZml4ZXMgKFZhcmlvdXMpCi0gZml4IC1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGUgd2FybmluZyBpbiBkcm1fZnJhbWVidWZmZXIgKFFpYW4pCgpDYzogRG1pdHJ5IE9zaXBl
bmtvIDxkaWdldHhAZ21haWwuY29tPgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29t
PgpDYzogUWlhbiBDYWkgPGNhaUBsY2EucHc+CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkJyaWFuIE1hc25leSAoMSk6CiAg
ICAgIGRybS9tc206IGNvcnJlY3QgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIGNvbnRleHRf
aW5pdAoKRG1pdHJ5IE9zaXBlbmtvICgxKToKICAgICAgZHJtL21vZGVzOiBEb24ndCBhcHBseSBj
bWRsaW5lJ3Mgcm90YXRpb24gaWYgaXQgd2Fzbid0IHNwZWNpZmllZAoKUWlhbiBDYWkgKDEpOgog
ICAgICBkcm06IHNpbGVuY2UgdmFyaWFibGUgJ2Nvbm4nIHNldCBidXQgbm90IHVzZWQKClJvYiBD
bGFyayAoMSk6CiAgICAgIGRybS9tc206IHN0b3AgYWJ1c2luZyBkbWFfbWFwL3VubWFwIGZvciBj
YWNoZQoKU2VhbiBQYXVsICgxKToKICAgICAgTWVyZ2UgZHJtLW1pc2MtbmV4dC1maXhlcy0yMDE5
LTA3LTE4IGludG8gZHJtLW1pc2MtZml4ZXMKClNodWJoYXNocmVlIERoYXIgKDEpOgogICAgICBk
cm0vbXNtL2RwdTogQ29ycmVjdCBkcHUgZW5jb2RlciBzcGlubG9jayBpbml0aWFsaXphdGlvbgoK
IGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyAgICAgICAgfCAyICstCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyB8IDMgKy0tCiBkcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9kcnYuYyAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL21z
bS9tc21fZ2VtLmMgICAgICAgICAgICAgICB8IDQgKystLQogNSBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdp
bmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
