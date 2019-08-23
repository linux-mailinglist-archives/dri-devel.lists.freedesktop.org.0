Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3319B60F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 20:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031236ED10;
	Fri, 23 Aug 2019 18:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368276ED10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 18:07:25 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E70F821874
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 18:07:24 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id g17so8912536qkk.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:07:24 -0700 (PDT)
X-Gm-Message-State: APjAAAV7+tlcl1IkU1VCkVwx8W7f/FODopxtCApbjrlE+cQvpjXRchJO
 ACadvjwRHNdmBt7HCbbCEn4h7qclE6XlWuwZnA==
X-Google-Smtp-Source: APXvYqwnY6RxYi7Db2muad+KPBs7eQtaLvyDWRJvgsn65AvmQ2O2n3NujGfMwVAhSDAoLkIuany/gsMCbo33UGxz9UU=
X-Received: by 2002:a37:a48e:: with SMTP id n136mr5429461qke.223.1566583644132; 
 Fri, 23 Aug 2019 11:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190823155149.7272-1-alyssa.rosenzweig@collabora.com>
In-Reply-To: <20190823155149.7272-1-alyssa.rosenzweig@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Aug 2019 13:07:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLtYRj+_BaZNsWW8otjK_288JRneHeeFUOuBT6zLEWFwQ@mail.gmail.com>
Message-ID: <CAL_JsqLtYRj+_BaZNsWW8otjK_288JRneHeeFUOuBT6zLEWFwQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panfrost: Add errata descriptions from kbase
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566583645;
 bh=UqVfOWLmuG1BM8ljKAfd/WbqaKWQVby77PPqONn+uUs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hoynbqu49I0k4PE1XbnHQNWrZucOWQYxK7jtlPvmhooRQ6xpEtefw0WUCl02j4a+p
 zYWv7uyHIQU1XNVSWrPtxn7m00waIQyyTbWnHVOVFTntxaNwXdHi4+1psds6/ox+rA
 f+vnqmEp2NgmSF0UnkB9JSCWet28OC0142fEZZAM=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6NTIgQU0gQWx5c3NhIFJvc2VuendlaWcKPGFseXNz
YS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gV2hpbGUgbmV3ZXIga2Jhc2Ug
aW5jbHVkZSBvbmx5IHRoZSBudW1iZXJzIG9mIGVycmF0YSwgb2xkZXIga2Jhc2UKPiByZWxlYXNl
cyBpbmNsdWRlZCBvbmUtbGluZSBkZXNjcmlwdGlvbnMgZm9yIGVhY2ggZXJyYXRhLCB3aGljaCBp
cyB1c2VmdWwKPiBmb3IgdGhvc2Ugd29ya2luZyBvbiB0aGUgZHJpdmVyLiBJbXBvcnQgdGhlc2Ug
ZGVzY3JpcHRpb25zLiBNb3N0IGFyZQo+IGZyb20ga2Jhc2UgdmVyYmF0aW07IGEgZmV3IEkgZWRp
dGVkIGZvciBjbGFyaXR5Lgo+Cj4gdjI6IFdyb3RlIGEgZGVzY3JpcHRpb24gZm9yIHRoZSB3b3Jr
YXJvdW5kIG9mIGFuIGlzc3VlIHdob3NlIGNhdXNlIGlzCj4gc3RpbGwgdW5rbm93biAoU3RlcGhl
bikuIEVycmF0YSB3aGljaCBwZXJ0YWluIHRvIG5ld2VyIG1vZGVscwo+IHVuc3VwcG9ydGVkIGJ5
IHRoZSBtYWlubGluZSBkcml2ZXIsIGZvciB3aGljaCBBcm0gaGFzIG5vdCB5ZXQgcmVsZWFzZWQK
PiBlcnJhdGEgaW5mb3JtYXRpb24sIGhhdmUgYmVlbiByZW1vdmVkIGZyb20gdGhlIGlzc3VlIGxp
c3QgYXMgdGhlIGtlcm5lbAo+IG5lZWQgbm90IGNvbmNlcm4gaXRzZWxmIHdpdGggdGhlc2UuCj4K
PiB2MzogUmVhZGRlZCBlcnJhdGEgbm90IHlldCBoYW5kbGVkLCBhZGRpbmcgZGVzY3JpcHRpb25z
IGJhc2VkIG9uIHRoZQo+IHdvcmthcm91bmRzIGluIHRoZSBsYXRlc3Qga2Jhc2UgcmVsZWFzZS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bj
b2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
aXNzdWVzLmggfCA4MSArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4
MSBpbnNlcnRpb25zKCspCgpBcHBsaWVkLCB0aGFua3MuCgpPbmUgbW9yZSBzdGVwIHRvIG1ha2lu
ZyB5b3UgYSBrZXJuZWwgZGV2ZWxvcGVyLi4uIDopCgpSb2IKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
