Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0125519D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 16:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2E888EF5;
	Tue, 25 Jun 2019 14:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0707788EF5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:26:05 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6665215EA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:26:04 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id h21so18542126qtn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 07:26:04 -0700 (PDT)
X-Gm-Message-State: APjAAAWGyjX+8S8JrcJmkrIZOK0BpihbGdbg3WXb8o9TVdAjuep63uth
 Mk4lozgBvCFdNacr6yhltgga3xam9yLz+/hUKw==
X-Google-Smtp-Source: APXvYqxUTYLPlSnkrI0aZx53sOAqRFA18v5vioDTrIGFaeyy1WiJA6yC0931kiCv4v228poHZKovX+TYxFfLmkH2ync=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr63405459qve.148.1561472764055; 
 Tue, 25 Jun 2019 07:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190624215649.8939-1-robh@kernel.org>
 <20190624215649.8939-11-robh@kernel.org>
 <CACRpkdYKE=zLJhmTeTWYGRCQNt3K8+rNNqsp5UDa2d31GG6Y2g@mail.gmail.com>
 <CAL_Jsq+uCMKhUFgCCK3uUetL9OwokQPaq74GJHQS2VS=UjVH8w@mail.gmail.com>
 <CACRpkdYnSZibUyhe5D8W259fCJBm05rG0_EmX+uoi=uqbrqEYA@mail.gmail.com>
In-Reply-To: <CACRpkdYnSZibUyhe5D8W259fCJBm05rG0_EmX+uoi=uqbrqEYA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Jun 2019 08:25:51 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+45dKRMdRCjfKgEkvsk1MLyeXnY4fjZmh50WLweyJfCg@mail.gmail.com>
Message-ID: <CAL_Jsq+45dKRMdRCjfKgEkvsk1MLyeXnY4fjZmh50WLweyJfCg@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] dt-bindings: display: Convert tpo,tpg110 panel
 to DT schema
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561472764;
 bh=O6AXf/DyRDLOn9NPLCpej84UeR2WezCnkvp4XKyJzzI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N46dWBGOR2uRjqVRY4aIywOrVy2cFEE4ioLAYEfkxKeIllNEk/+dqTFt3a6DY36Iz
 x4AA6/MQFajlh58oiIdDyn8mxmN+YALaRKmdA6c1Cci7jaYm0Fig3nnPKB7ug8Jr8s
 1Fb9Oe+920usjIh/45LM5Xeo8rbIuIS0X1GAX0vU=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMjoyNiBBTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTI6NDcg
QU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBNb24sIEp1biAy
NCwgMjAxOSBhdCA0OjEzIFBNIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4gd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSnVuIDI0LCAyMDE5IGF0IDExOjU5IFBNIFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IENvbnZlcnQgdGhlIHRw
byx0cGcxMTAgcGFuZWwgYmluZGluZyB0byBEVCBzY2hlbWEuCj4gPiA+ID4KPiA+ID4gPiBDYzog
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+ID4gPiA+IENjOiBUaGll
cnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+ID4gPiA+IENjOiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiA+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPiA+ID4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+ID4gPiBDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4gPiA+Cj4gPiA+IEF3ZXNvbWUsIGZpeGVkIHVwIHRoZSBNQUlOQVRJTkVS
UyBlbnRyeSBhbmQgYXBwbGllZCBhbmQKPiA+ID4gcHVzaGVkIGZvciBEUk0gbmV4dCB3aXRoIG15
IFJldmlld2VkLWJ5Lgo+ID4KPiA+IFlvdSBzaG91bGRuJ3QgaGF2ZSBiZWNhdXNlIHRoaXMgaXMg
ZGVwZW5kZW50IG9uIHBhdGNoIDIgYW5kCj4gPiBwYW5lbC1jb21tb24ueWFtbC4gU28gbm93ICdt
YWtlIGR0X2JpbmRpbmdfY2hlY2snIGlzIGJyb2tlbi4KPgo+IE9vb3BzIGVhc2lseSBoYXBwZW5z
IHdoZW4gSSBhbSBvbmx5IGFkcmVzc2VlIG9uIHRoaXMgcGF0Y2ggYW5kCj4gdGhlcmUgaXMgbm8g
bWVudGlvbiBvZiBhbnkgZGVwZW5kZW5jaWVzLgoKSXQncyBhIHNlcmllcy4gSSB3b3VsZCBhc3N1
bWUgdGhlIGRlZmF1bHQgaXMgMSBwZXJzb24gYXBwbGllcyBhIHNlcmllcwp1bmxlc3MgZXhwbGlj
aXRseSBzdGF0ZWQgb3RoZXJ3aXNlLgoKPiBDYW4gSSBzaW1wbHkganVzdCBtZXJnZSB0aGUgcGFu
ZWwtY29tbW9uIHBhdGNoIGFzIHdlbGwgYW5kIHdlCj4gYXJlIGFsbCBoYXBweT8KCkkgaGF2ZSBk
cm0tbWlzYyBjb21taXQgcmlnaHRzIHRvbywgc28gSSdsbCBhcHBseSB0aGUgd2hvbGUgbG90IHdo
ZW4gaXQncyByZWFkeS4KCj4gSSBjYW4gYWxzbyBwaWNrIHVwIG1vcmUgcGFuZWwgYmluZGluZyBw
YXRjaGVzLCBJTU8gdGhlIHlhbWwKPiBjb252ZXJzaW9ucyBhcmUgZXNwZWNpYWxseSB1bmNvbnRy
b3ZlcnNpYWwgYW5kIHNob3VsZCBoYXZlIGxvdwo+IHRocmVzaG9sZCBmb3IgbWVyZ2luZy4KClll
cywgYnV0IHRoZSB0aHJlc2hvbGQgaXMgYXQgbGVhc3QgJ21ha2UgZHRfYmluZGluZ19jaGVjaycg
c2hvdWxkIG5vdApicmVhay4gQnV0IGRvbid0IHdvcnJ5LCB0aGVyZSBhcmUgMiBvdGhlciBicmVh
a2FnZXMgaW4gbGludXgtbmV4dApjdXJyZW50bHkuCgpSb2IKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
