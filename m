Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6DBACA3E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 03:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB3689CBE;
	Sun,  8 Sep 2019 01:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847F589CBE;
 Sun,  8 Sep 2019 01:44:09 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id v10so3310148vsc.7;
 Sat, 07 Sep 2019 18:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aVxyqXDv/RHgKybLlcG1tnZvfpUGXCQXYgdWIvel5FY=;
 b=l8804MoajAPmW7WsOuYd08fikDKW9whyCMydHA93I21Dgi3HqNBBZcUpQpJFrhaknA
 Mi56ebVUvqDpv54RRtjQvtvF9w3E6bAJuSmYJDQDOJajy6PRU9YB/67pPv5FNKjV6ozr
 Lkb/XN1YLN723uvkO4PgLGpTMCeZNSr0e/Q8rULogdBaUPXdv2jHX9WS5jffaa5/W8yN
 v7EsPwbR7CMyDHxLwTCsOREeAveItX53M0bd63s5tNX6qOUnzRKQ9hm5usRDpB/BGuzE
 NoUNtYAyPOh6iS4Klh+KwiJClUK6NBJcfqWko0ks4409ZSXCcqCG3UAsYnCGIXS4rgsq
 7axw==
X-Gm-Message-State: APjAAAWG29DdQS6V4HkA2568RD0eU8zDxDaEFq86Nz/q49oks/B8w8e/
 vH2RCqExmzkMCTdenCqt86neLOVDhSdNfNziG1A=
X-Google-Smtp-Source: APXvYqzHsYqLdTbw5fYR4M70fSwB7QCBa7GknvV4mYAK5CWh//ewKVzxLvfkH7wabUowW9A+yrnCenYSrBVKO7AswSk=
X-Received: by 2002:a67:fd97:: with SMTP id k23mr2356465vsq.220.1567907048380; 
 Sat, 07 Sep 2019 18:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
 <20190903091235.32304-4-gwan-gyeong.mun@intel.com>
 <CAKb7Uvi4aO-im=cBi_xy8QoDhUXsJmuxcL8ewOrMvFbky9Je0g@mail.gmail.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F821DC31F@BGSMSX104.gar.corp.intel.com>
 <20190906114255.GS7482@intel.com>
 <CAKb7UvjdjrVtueEDM+eij0LvCrdAbwzUyNpbPde=AZ-7Dega2A@mail.gmail.com>
 <23376377793be0aecd14e08f6cbda7f699a5c761.camel@intel.com>
In-Reply-To: <23376377793be0aecd14e08f6cbda7f699a5c761.camel@intel.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 7 Sep 2019 21:43:57 -0400
Message-ID: <CAKb7UviqX5G2s-YJeXULe1Cg0oO1+auQZpONUbbm0JsQccfwHQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm: Add DisplayPort colorspace property
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBTZXAgNywgMjAxOSBhdCA3OjIwIFBNIE11biwgR3dhbi1neWVvbmcKPGd3YW4tZ3ll
b25nLm11bkBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCAyMDE5LTA5LTA2IGF0IDA5OjI0
IC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+IE9uIEZyaSwgU2VwIDYsIDIwMTkgYXQgNzo0
MyBBTSBWaWxsZSBTeXJqw6Rsw6QKPiA+IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4g
d3JvdGU6Cj4gPiA+IE9uIEZyaSwgU2VwIDA2LCAyMDE5IGF0IDExOjMxOjU1QU0gKzAwMDAsIFNo
YW5rYXIsIFVtYSB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0KPiA+ID4gPiA+IEZyb206IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4K
PiA+ID4gPiA+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAzLCAyMDE5IDY6MTIgUE0KPiA+ID4g
PiA+IFRvOiBNdW4sIEd3YW4tZ3llb25nIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPgo+ID4g
PiA+ID4gQ2M6IEludGVsIEdyYXBoaWNzIERldmVsb3BtZW50IDxpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gPiA+ID4gPiA+OyBTaGFua2FyLCBVbWEKPiA+ID4gPiA+IDx1bWEuc2hh
bmthckBpbnRlbC5jb20+OyBkcmktZGV2ZWwgPAo+ID4gPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4KPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMy83XSBkcm06
IEFkZCBEaXNwbGF5UG9ydCBjb2xvcnNwYWNlCj4gPiA+ID4gPiBwcm9wZXJ0eQo+ID4gPiA+ID4K
PiA+ID4gPiA+IFNvIGhvdyB3b3VsZCB0aGlzIHdvcmsgd2l0aCBhIERQKysgY29ubmVjdG9yPyBT
aG91bGQgaXQgbGlzdAo+ID4gPiA+ID4gdGhlIEhETUkgb3IgRFAKPiA+ID4gPiA+IHByb3BlcnRp
ZXM/IE9yIGRvIHdlIG5lZWQgYSBjdXN0b20gcHJvcGVydHkgY2hlY2tlciB3aGljaCBpcwo+ID4g
PiA+ID4gYXdhcmUgb2Ygd2hhdCBpcwo+ID4gPiA+ID4gY3VycmVudGx5IHBsdWdnZWQgaW4gdG8g
dmFsaWRhdGUgdGhlIHZhbHVlcz8KPiA+ID4gPgo+ID4gPiA+IEFGQUlVIEZvciBEUCsrIGNhc2Vz
LCB3ZSBkZXRlY3Qgd2hhdCBraW5kIG9mIHNpbmsgaXRzIGRyaXZpbmcgRFAKPiA+ID4gPiBvciBI
RE1JICh3aXRoIGEgcGFzc2l2ZSBkb25nbGUpLgo+ID4gPiA+IEJhc2VkIG9uIHRoZSB0eXBlIG9m
IHNpbmsgZGV0ZWN0ZWQsIHdlIHNob3VsZCBleHBvc2UgRFAgb3IgSERNSQo+ID4gPiA+IGNvbG9y
c3BhY2VzIHRvIHVzZXJzcGFjZS4KPiA+ID4KPiA+ID4gRm9yIGk5MTUgRFAgY29ubmVjdG9yIGFs
d2F5cyBkcml2ZXMgRFAgbW9kZSwgSERNSSBjb25uZWN0b3IgYWx3YXlzCj4gPiA+IGRyaXZlcwo+
ID4gPiBIRE1JIG1vZGUsIGV2ZW4gd2hlbiB0aGUgcGh5c2ljYWwgY29ubmVjdG9yIGlzIERQKysu
Cj4gPgo+ID4gUmlnaHQsIGk5MTUgY3JlYXRlcyAyIGNvbm5lY3RvcnMsIHdoaWxlIG5vdXZlYXUs
IHJhZGVvbiwgYW5kIGFtZGdwdQo+ID4gY3JlYXRlIDEgY29ubmVjdG9yIChub3Qgc3VyZSBhYm91
dCBvdGhlciBkcml2ZXJzKSBmb3IgYSBzaW5nbGUKPiA+IHBoeXNpY2FsIERQKysgc29ja2V0LiBT
aW5jZSB3ZSBzdXBwbHkgdGhlIGxpc3Qgb2YgdmFsaWQgdmFsdWVzIGF0IHRoZQo+ID4gdGltZSBv
ZiBjcmVhdGluZyB0aGUgY29ubmVjdG9yLCB3ZSBjYW4ndCBrbm93IGF0IHRoYXQgcG9pbnQgd2hl
dGhlcgo+ID4gaW4KPiA+IHRoZSBmdXR1cmUgYSBIRE1JIG9yIERQIHdpbGwgYmUgcGx1Z2dlZCBp
bnRvIGl0Lgo+ID4KPiA+ICAgLWlsaWEKPiBJbGlhLCBkb2VzIGl0IG1lYW4gdGhhdCB0aGUgZHJt
X2Nvbm5lY3RvciB0eXBlIGlzCj4gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0IGFuZCBw
cm90b2NvbCBpcyBEUCsrIG1vZGU/CgpUaGF0IGlzIGNvcnJlY3QuIFRoZSBjb25uZWN0b3IgdHlw
ZSBpcyAiRGlzcGxheVBvcnQiIGluIHN1Y2ggYSBjYXNlLgoKQ2hlZXJzLAoKICAtaWxpYQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
