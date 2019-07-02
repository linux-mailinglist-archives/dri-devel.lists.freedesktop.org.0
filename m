Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F95D745
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 22:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6867D89533;
	Tue,  2 Jul 2019 20:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A3789533
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 20:14:40 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id s7so40039577iob.11
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 13:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6suCIUcpnxYWLx0u7rAt8YHu7DyHRein/0Ku8MDeQrw=;
 b=OuZMO7eGSHYCMZWC5aS4DpTQiNqtG1qntlPEbfiTBsk0O+D8LTaP988DF8fWT+VqQC
 AN+Zk3f2KXZCo14YwA2hI4tq7zuGjBUBQ/CmXM7MGYaiWlsTeMnav5zpdZQhZfA58pQu
 uAgl/3SG8diB+0KeppD+11RxQYMCb7hQhWnKtJ6k1IXJyNpOZxYS3M2EqgobSuM2Fp+j
 jKQyuIl91rrCs4gHVMvWt762WTSQhI7ZZMqtPyS+A9BfmgCTgCZHAlOclite2DRTrWaJ
 ei79/PJ8fNwqdhJe9WdUzVKNuL63aK2MeWWHBn8adg9kq40td6CFgTmdP5UmNHPHPgN8
 NZgQ==
X-Gm-Message-State: APjAAAUOND4pEy9ZGZtfJ0JOqK+6xSQLgbMpMNhNImePlvoolUyHBcOw
 wZztg2UGy/WWYx1+eMVWq0GrB9xRBaw=
X-Google-Smtp-Source: APXvYqyH2CbIbM1talEMCXLtGx3jx92BtsJJOGRjiN2kjHcfwiNzhu8Ql6Hfhn26zJZYspRWx98Q7Q==
X-Received: by 2002:a5e:c74b:: with SMTP id g11mr2074019iop.196.1562098479502; 
 Tue, 02 Jul 2019 13:14:39 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id c14sm13701797ioa.22.2019.07.02.13.14.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 13:14:38 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id h6so40207709ioh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 13:14:37 -0700 (PDT)
X-Received: by 2002:a02:aa1d:: with SMTP id r29mr15652512jam.127.1562098477589; 
 Tue, 02 Jul 2019 13:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190621211346.1324-1-ezequiel@collabora.com>
 <3c68bf286d8b75ac339df0eab43d276667e073c2.camel@collabora.com>
In-Reply-To: <3c68bf286d8b75ac339df0eab43d276667e073c2.camel@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Jul 2019 13:14:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UK3bpyvvFQtsvUtWHun_bfxb25R0bLyg=WJz+yHz5kvg@mail.gmail.com>
Message-ID: <CAD=FV=UK3bpyvvFQtsvUtWHun_bfxb25R0bLyg=WJz+yHz5kvg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] RK3288 Gamma LUT
To: Ezequiel Garcia <ezequiel@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6suCIUcpnxYWLx0u7rAt8YHu7DyHRein/0Ku8MDeQrw=;
 b=MyF13COg8Z9CREi9V7uwtNZ+RQgUSogpyqwer+wxMaRNlPvmTJ3LJUiyv1bRH2HNg4
 UdgEbOWphL591zLtGdaR5I4Nw4e1exGSG3CgmWGSsfGiRRfTC+NEd9mUTlTTIUs2/NJT
 WoMG2zeqsWqlC36tyRgV6MVFaOJ16SDyDjBSU=
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
 Jacopo Mondi <jacopo@jmondi.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIEp1bCAyLCAyMDE5IGF0IDQ6MjYgQU0gRXplcXVpZWwgR2FyY2lhIDxlemVx
dWllbEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEhpIEhlaWtvLAo+Cj4gT24gRnJpLCAyMDE5
LTA2LTIxIGF0IDE4OjEzIC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6Cj4gPiBMZXQncyBz
dXBwb3J0IEdhbW1hIExVVCBjb25maWd1cmF0aW9uIG9uIFJLMzI4OCBTb0NzLgo+ID4KPiA+IElu
IG9yZGVyIHRvIGRvIHNvLCB0aGlzIHNlcmllcyBhZGRzIGEgbmV3IGFuZCBvcHRpb25hbAo+ID4g
YWRkcmVzcyByZXNvdXJjZS4KPiA+Cj4gPiBBIHNlcGFyYXRlIGFkZHJlc3MgcmVzb3VyY2UgaXMg
cmVxdWlyZWQgYmVjYXVzZSBvbiB0aGlzIFJLMzI4OCwKPiA+IHRoZSBMVVQgYWRkcmVzcyBpcyBh
ZnRlciB0aGUgTU1VIGFkZHJlc3MsIHdoaWNoIGlzIHJlcXVlc3RlZAo+ID4gYnkgdGhlIGlvbW11
IGRyaXZlci4gVGhpcyBwcmV2ZW50cyB0aGUgRFJNIGRyaXZlcgo+ID4gZnJvbSByZXF1ZXN0aW5n
IGFuIGVudGlyZSByZWdpc3RlciBzcGFjZS4KPiA+Cj4gPiBUaGUgY3VycmVudCBpbXBsZW1lbnRh
dGlvbiB3b3JrcyBmb3IgUkdCIDEwLWJpdCB0YWJsZXMsIGFzIHRoYXQKPiA+IGlzIHdoYXQgc2Vl
bXMgdG8gd29yayBvbiBSSzMyODguCj4gPgo+ID4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgb24gYSBS
b2NrMiBTcXVhcmUgYm9hcmQsIHVzaW5nCj4gPiBhIGhhY2tlZCAnbW9kZXRlc3QnIHRvb2wsIHdp
dGggbGVnYWN5IGFuZCBhdG9taWMgQVBJcy4KPiA+Cj4gPiBUaGFua3MsCj4gPiBFemUKPiA+Cj4g
PiBDaGFuZ2VzIGZyb20gdjE6Cj4gPiAqIGRyb3AgZXhwbGljaXQgbGluZWFyIExVVCBhZnRlciBm
aW5kaW5nIGEgcHJvcGVyCj4gPiAgIHdheSB0byBkaXNhYmxlIGdhbW1hIGNvcnJlY3Rpb24uCj4g
PiAqIGF2b2lkIHNldHRpbmcgZ2FtbWEgaXMgdGhlIENSVEMgaXMgbm90IGFjdGl2ZS4KPiA+ICog
cy9pbnQvdW5zaWduZWQgaW50IGFzIHN1Z2dlc3RlZCBieSBKYWNvcG8uCj4gPiAqIG9ubHkgZW5h
YmxlIGNvbG9yIG1hbmFnZW1lbnQgYW5kIHNldCBnYW1tYSBzaXplCj4gPiAgIGlmIGdhbW1hIExV
VCBpcyBzdXBwb3J0ZWQsIHN1Z2dlc3RlZCBieSBEb3VnLgo+ID4gKiBkcm9wIHRoZSByZWctbmFt
ZXMgdXNhZ2UsIGFuZCBpbnN0ZWFkIGp1c3QgdXNlIGluZGV4ZWQgcmVnCj4gPiAgIHNwZWNpZmll
cnMsIHN1Z2dlc3RlZCBieSBEb3VnLgo+ID4KPiA+IENoYW5nZXMgZnJvbSBSRkM6Cj4gPiAqIFJl
cXVlc3QgKGFuIG9wdGlvbmFsKSBhZGRyZXNzIHJlc291cmNlIGZvciB0aGUgTFVULgo+ID4gKiBB
ZGQgZGV2aWNldHJlZSBjaGFuZ2VzLgo+ID4gKiBEcm9wIHN1cHBvcnQgZm9yIFJLMzM5OSwgd2hp
Y2ggZG9lc24ndCBzZWVtIHRvIHdvcmsKPiA+ICAgb3V0IG9mIHRoZSBib3ggYW5kIG5lZWRzIG1v
cmUgcmVzZWFyY2guCj4gPiAqIFN1cHBvcnQgcGFzcy10aHJ1IHNldHRpbmcgd2hlbiBHQU1NQV9M
VVQgaXMgTlVMTC4KPiA+ICogQWRkIGEgY2hlY2sgZm9yIHRoZSBnYW1tYSBzaXplLCBhcyBzdWdn
ZXN0ZWQgYnkgSWxpYS4KPiA+ICogTW92ZSBnYW1tYSBzZXR0aW5nIHRvIGF0b21pY19jb21taXRf
dGFpbCwgYXMgcG9pbnRlZAo+ID4gICBvdXQgYnkgSmFjb3BvL0xhdXJlbnQsIGlzIHRoZSBjb3Jy
ZWN0IHdheS4KPiA+Cj4gPiBFemVxdWllbCBHYXJjaWEgKDMpOgo+ID4gICBkdC1iaW5kaW5nczog
ZGlzcGxheTogcm9ja2NoaXA6IGRvY3VtZW50IFZPUCBnYW1tYSBMVVQgYWRkcmVzcwo+ID4gICBk
cm0vcm9ja2NoaXA6IEFkZCBvcHRpb25hbCBzdXBwb3J0IGZvciBDUlRDIGdhbW1hIExVVAo+ID4g
ICBBUk06IGR0czogcm9ja2NoaXA6IEFkZCBSSzMyODggVk9QIGdhbW1hIExVVCBhZGRyZXNzCj4g
Pgo+ID4gIC4uLi9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQgICAgICAgICB8ICAg
NiArLQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpICAgICAgICAgICAgICAgICB8
ICAgNCArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyAg
ICB8ICAgMyArCj4gPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Au
YyAgIHwgMTE0ICsrKysrKysrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fdm9wLmggICB8ICAgNyArKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9yb2NrY2hpcF92b3BfcmVnLmMgICB8ICAgMiArCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAx
MzMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCkkgd2lsbCBub3RlIHRoYXQgSSBjYW4g
Y29uZmlybSB0aGF0IHRoZSAiZ2FtbWFfdGVzdCIgYXBwIHByZXNlbnQgb24KQ2hyb21lIE9TIGNh
biBiZSBzaG93biB0byB3b3JrIHdpdGggdGhpcyBzZXJpZXMsIGJvdGggb24gZURQIGFuZCBIRE1J
LgpJIHNlZSBhIG5pY2Ugc2hpbnkgUkdCIHBhdHRlcm4gb24gdGhlIHNjcmVlbi4gIFRodXM6CgpU
ZXN0ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
