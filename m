Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB9AC1978
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 22:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200F26E339;
	Sun, 29 Sep 2019 20:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50CB6E339
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 20:30:50 +0000 (UTC)
Date: Sun, 29 Sep 2019 20:30:44 +0000
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [v4] drm: two planes with the same zpos have undefined ordering
Message-ID: <3q-AW_DkhdIpH9Ip7_2kdcVNHwdKnhIH4k2PjfN-80KlJ0Qe3jIVH6CxMSQc-niJGdLyzzKsUcXjUyu1z9fTjHwg5-eWvOWbhnblUurueKo=@emersion.fr>
In-Reply-To: <20190929061549.GA28809@jamwan02-TSP300>
References: <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
 <20190929061549.GA28809@jamwan02-TSP300>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1569789048;
 bh=Zoxx8zuzIPrZMnJHBFGHF1JBy1iH6B59X+W0CV8LVRU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=R9VT2baT1Y8AsFhXqsJmd2BUfHL3N9Wi3BwiK36D4tWpNGT7GFiyIRe0zzayAo3ng
 SRBA4J7ILGqj9qR61o/Dex+S0dwmrkHJwQ3fmsuyInQ/LQVhdHJ+DcJYdwJQ2x06TM
 LLMdIZTKc63wsNxmBOxjrpkgLw1JsrfNopT436Vw=
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, nd <nd@arm.com>,
 Marius Vlad <marius.vlad@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgo+IE9uIE1vbiwgU2VwIDIzLCAyMDE5IGF0IDEyOjM5OjIwUE0gKzAwMDAsIFNpbW9uIFNl
ciB3cm90ZToKPiA+IEN1cnJlbnRseSB0aGUgcHJvcGVydHkgZG9jcyBkb24ndCBzcGVjaWZ5IHdo
ZXRoZXIgaXQncyBva2F5IGZvciB0d28gcGxhbmVzIHRvCj4gPiBoYXZlIHRoZSBzYW1lIHpwb3Mg
dmFsdWUgYW5kIHdoYXQgdXNlci1zcGFjZSBzaG91bGQgZXhwZWN0IGluIHRoaXMgY2FzZS4KPiA+
Cj4gPiBUaGUgcnVsZSBtZW50aW9ubmVkIGluIHRoZSBwYXN0IHdhcyB0byBkaXNhbWJpZ3VhdGUg
d2l0aCBvYmplY3QgSURzLiBIb3dldmVyCj4gPiBzb21lIGRyaXZlcnMgYnJlYWsgdGhpcyBydWxl
ICh0aGF0J3Mgd2h5IHRoZSBvcmRlcmluZyBpcyBkb2N1bWVudGVkIGFzCj4gPiB1bnNwZWNpZmll
ZCBpbiBjYXNlIHRoZSB6cG9zIHByb3BlcnR5IGlzIG1pc3NpbmcpLiBBZGRpdGlvbmFsbHkgaXQg
ZG9lc24ndAo+ID4gcmVhbGx5IG1ha2Ugc2Vuc2UgZm9yIGEgZHJpdmVyIHRvIHVzZXIgaWRlbnRp
Y2FsIHpwb3MgdmFsdWVzIGlmIGl0IGtub3dzIHRoZWlyCj4gPiByZWxhdGl2ZSBwb3NpdGlvbjog
dGhlIGRyaXZlciBjYW4ganVzdCBwaWNrIGRpZmZlcmVudCB2YWx1ZXMgaW5zdGVhZC4KPiA+Cj4g
PiBTbyB0d28gc29sdXRpb25zIHdvdWxkIG1ha2Ugc2Vuc2U6IGVpdGhlciBkaXNhbGxvdyBjb21w
bGV0ZWx5IGlkZW50aWNhbCB6cG9zCj4gPiB2YWx1ZXMgZm9yIHR3byBkaWZmZXJlbnQgcGxhbmVz
LCBlaXRoZXIgbWFrZSB0aGUgb3JkZXJpbmcgdW5zcGVjaWZpZWQuIFRvIGFsbG93Cj4gPiBkcml2
ZXJzIHRoYXQgZG9uJ3Qga25vdyB0aGUgcmVsYXRpdmUgb3JkZXJpbmcgYmV0d2VlbiB0d28gcGxh
bmVzIHRvIHN0aWxsCj4gPiBleHBvc2UgdGhlIHpwb3MgcHJvcGVydHksIGNob29zZSB0aGUgbGF0
dGVyIHNvbHV0aW9uLgo+Cj4gU29tZSBBcm0ncyB1c2FnZSBjYXNlcyBhYm91dCB0d28gcGxhbmVz
IHdpdGggc2FtZSB6cG9zLgo+Cj4gLSAiU21hcnQgbGF5ZXIiCj4gd2hpY2ggY2FuIGFjY2VwdHMg
NCBkaWZmZXJlbnQgZmJzIHdpdGggZGlmZmVyZW50IHNyYy9kaXNwbGF5IHJlY3QsCj4gYnV0IHRo
aXMgc21hcnQgbGF5ZXIgaGFzIG9uZSByZXN0cmljdGlvbjoKPgo+IDQgZGlzcGxheSByZWN0cyBt
dXN0IGhhdmUgbm8gb3ZlcmxhcHMgaW4gViBkaXJlY3Rpb24KPiAoQSBvcHRpbWl6YXRpb24gZm9y
IGFuZHJvaWQgd2luZG93IGxpa2UgVG9vbGJhci9OYXZpZ2F0aW9uIGJhcikKPgo+IFNvIHdoZW4g
bWFwIHRoaXMgU21hcnQtbGF5ZXIgdG8gZHJtIHdvcmxkLCBpdCBtaWdodCBiZSA0IGRpZmZlcmVu
dAo+IGRybS1wbGFuZXMsIGJ1dCB3aXRoIHNhbWUgem9yZGVyIHRvIGluZGljYXRlIHRoYXQgdGhl
c2UgNCBwbGFuZXMgYXJlCj4gc21hcnQtbGF5ZSBwbGFuZXMuCj4KPiAtICJWUi1MYXllciIKPiBP
bmUgVlItbGF5ZXIgY29tcHJpc2VzIHR3byBkaWZmZXJlbnQgdmlld3BvcnRzIHdoaWNoIGNhbiBi
ZSBjb25maWd1cmVkCj4gd2l0aCB0b3RvYWxseSBkaWZmZXJlbnQgZmJzLCBzcmMvZGlzcGxheSBy
ZWN0Lgo+IHdlIHVzZSB0d28gZGlmZmVyZXJudCBkcm0tcGxhbmVzIHRvIGRyaXZlIG9uIEhXICJW
Ui1MYXllciIsIGFuZCB0aGVzZQo+IHR3byBkcm0tcGxhbmVzIG11c3QgYmUgY29uZmlndXJlZCB3
aXRoIHNhbWUgenBvcy4KClRoYW5rcyBhIGxvdCBmb3IgeW91ciBmZWVkYmFjayBKYW1lcywgdGhh
dCdzIGV4YWN0bHkgd2hhdCBJIHdhcyBsb29raW5nIGZvci4KQm90aCBvZiB0aGVzZSB1c2UtY2Fz
ZXMgbWFrZSBzZW5zZSB0byBtZS4KCkkgdGhpbmsgdXNlci1zcGFjZSBzaG91bGQgYmUgcHJlcGFy
ZWQgdG8gaGFuZGxlIGlkZW50aWNhbCBpbW11dGFibGUgenBvcyB2YWx1ZXMuClBla2thIGFuZCBE
YW5pZWwsIHRob3VnaHRzPwoKSW4gYW55IGNhc2UsIHRoaXMgZG9lc24ndCBjaGFuZ2UgdGhlIHBh
dGNoIGl0c2VsZi4gUHJvYmFibHkgc29tZXRoaW5nIHdvcnRoCm1lbnRpb25uaW5nIGluIHRoZSBj
b21taXQgbWVzc2FnZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
