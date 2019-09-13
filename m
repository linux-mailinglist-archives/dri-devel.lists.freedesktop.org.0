Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2CCB248F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 19:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C81A6F422;
	Fri, 13 Sep 2019 17:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7166F422
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 17:19:36 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id z6so3252499oix.9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 10:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OKzQ7wwphOjxmY/K1EtxnOsTdv2PWzuGJ4C8ws0Egy0=;
 b=GNlQVi1567CoWhFg2NUDB2ty63bj/5AZh9YQvpJTYtDc8XTdZ4ohVPHFWcMzLQX5Qg
 uRyFHUcJiBeExr5k/6lUYOFji1H/Jr0WhIKLDEUX8welx2prMJirus27X5ciWVEFqcFK
 bNI9waEqvSTsNLBR+XsFHcbWwyJOolr8ksvRB99HTYADFJWkYzvuMpZLIlpKPWubWuPT
 dqH18OKnqsb2/rltg8dd+VZnX810w9QMeH7KSbZeUXROfv/f/tJAC9kWbj+URNWDKwpu
 E+rImzrlF6ue5lcW3GBPLIgmyXZ1v+1vQca6QrhrIujoNUkBdUAkexBzB6M0dvm2CTxD
 WGig==
X-Gm-Message-State: APjAAAVkC7Rp6tV9sdSKJVz3YIu6c270AQYJIRdOaaawnpjsWDXlSkO6
 3p7sJ/TsyA/nduH3pMnqKttVqJPQ2JC4NUKfhPK3oA==
X-Google-Smtp-Source: APXvYqwuw9ZYZrUqJW3S1meWYkCAvipklH3NTP77DVgNvFseKQvu1WlDTpRX3RPGZCmD4dIwv3Hxd1PSyIy8xnCxSnk=
X-Received: by 2002:aca:5697:: with SMTP id k145mr4124856oib.101.1568395175833; 
 Fri, 13 Sep 2019 10:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190907090534.GB1712@pc-sasha.localdomain>
 <CAKMK7uHYdXwruQxxBM12Q5MVeH9fjFpZvxZz06BSo7YrCQbM2w@mail.gmail.com>
 <20190908141307.GA7115@pc-sasha.localdomain>
 <20190909201159.778590a0@canb.auug.org.au>
 <20190909202128.0c420ddd@canb.auug.org.au>
 <CAJ1xhMXKNRfOm1Xj3B_cgLByBfDP03P+DBEbRpWc+tU6kdxtBw@mail.gmail.com>
In-Reply-To: <CAJ1xhMXKNRfOm1Xj3B_cgLByBfDP03P+DBEbRpWc+tU6kdxtBw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 13 Sep 2019 19:19:24 +0200
Message-ID: <CAKMK7uEnECWMC-EhEhNYiMH4+om6vLTmNw3jTwx0MY5m-Ksc8A@mail.gmail.com>
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
To: Alexander Kapshuk <alexander.kapshuk@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OKzQ7wwphOjxmY/K1EtxnOsTdv2PWzuGJ4C8ws0Egy0=;
 b=gqL0EETYmHL8v3NKExxXcCfswUCCiPVZzxeoC79eVpYprEt+jozMPa6wAWDltcNb3x
 VmYaF6bcrZLJnKz9xIIEwoEwF8/jbmki9ju1dVDY7Krqll1tKgk871TOS2FTkEv5VjJL
 RRtibs3gERfUlHMwswxQ0mabI7O5m4cz9vovI=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Linux-Next <linux-next@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgOSwgMjAxOSBhdCAxMjoyNSBQTSBBbGV4YW5kZXIgS2Fwc2h1awo8YWxleGFu
ZGVyLmthcHNodWtAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDksIDIwMTkgYXQg
MToyMSBQTSBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4gd3JvdGU6Cj4g
Pgo+ID4gSGksCj4gPgo+ID4gT24gTW9uLCA5IFNlcCAyMDE5IDIwOjExOjU5ICsxMDAwIFN0ZXBo
ZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PiB3cm90ZToKPiA+ID4KPiA+ID4gSWYg
eW91IGFyZSBiaXNlY3RpbmcgbGludXgtbmV4dCwgSSB3aWxsIHN1Z2dlc3QgYmlzZWN0aW5nIGJl
dHdlZW4gdGhlCj4gPiA+IHN0YWJsZSBicmFuY2ggb24gbGludXgtbmV4dCAod2hpY2ggaXMganVz
dCBMaW51cycgdHJlZSB3aGVuIEkgc3RhcnRlZAo+ID4gPiB0aGF0IGRheSkgYW5kIHRoZSB0b3Ag
b2YgdGhlIGZpcnN0IGxpbnV4LW5leHQgdGhhdCBmYWlscy4gIChBc3N1bWluZwo+ID4gPiB0aGF0
IHRoZSBzdGFibGUgYnJhbmNoIGlzIGdvb2QpLgo+ID4KPiA+IEFjdHVhbGx5IChzaW5jZSB5b3Ug
d29uJ3QgYmUgYmlzZWN0aW5nIHRoZSBsYXRlc3QgbGludXgtbmV4dCksIHlvdQo+ID4gcHJvYmFi
bHkgd2FudCB0byB1c2UKPiA+Cj4gPiBnaXQgbWVyZ2UtYmFzZSBzdGFibGUgbmV4dC0yMDE5MDkw
Mwo+ID4gICAgICAgICAob3Igd2hhdGV2ZXIgbGludXgtbmV4dCB5b3UgYXJlIGJpc2VjdGluZykK
PiA+Cj4gPiBhcyB5b3VyIGZpcnN0IGdvb2QgY29tbWl0IChhc3N1bWluZyBpdCBpZCBnb29kIDot
KSkuCj4gPgo+ID4gLS0KPiA+IENoZWVycywKPiA+IFN0ZXBoZW4gUm90aHdlbGwKPgo+IEhpIFN0
ZXBoZW4sCj4KPiBUaGFua3MgdmVyeSBtdWNoIGZvciB0aGUgdGlwcy4KPiBJJ2xsIGdvIGFoZWFk
IGFuZCBnaXZlIHRob3NlIGEgdHJ5LgoKWWVhaCB0aGlzIHNob3VsZCBoZWxwLCBidXQgaW4gZ2Vu
ZXJhbCwgZHVlIHRvIG91ciBub24tbGluZWFyIGhpc3RvcnksCmdpdCBiaXNlY3QgY2FuIGp1bXAg
YXJvdW5kIHF1aXRlIGEgYml0LiBFc3BlY2lhbGx5IGlmIHlvdSBvbmx5IGxvb2sgYXQKZGF0ZXMu
IEFsc28gZHVlIHRvIG91ciBub24tbGluZWFyIGhpc3RvcnksIGl0IHNvbWV0aW1lcyBuZWVkcyB0
byB0ZXN0CnlvdSBhIG1lcmdlLWJhc2UsIHRvIGZpZ3VyZSBvdXQgd2hpY2ggcGFydCBvZiB0aGUg
aGlzdG9yeSBpdCBuZWVkcyB0bwpjaGFzZSBmb3IgdGhlIGJhZCBjb21taXQuIFNvIGFsbCBub3Jt
YWwsIGJ1dCB0aGUgaGludCBhYm92ZSBzaG91bGQKaGVscC4KCkFsc28sIHlvdSBkb24ndCBuZWVk
IHRvIHJlc3RhcnQgZ2l0IGJpc2VjdCwgeW91IGNhbiBqdXN0IHRlbGwgaXQgYWJvdXQKYW55IGdv
b2QvYmFkIGNvbW1pdCB5b3UgdGVzdGVkIHdpdGgKCiQgZ2l0IGJpc2VjdCBnb29kfGJhZCAkc2hh
MQoKVGhlIG1vcmUgZ2l0IGtub3dzLCB0aGUgcXVpY2tlciBpdCBzaG91bGQgZmluZCB0aGUgYmFk
IGNvbW1pdC4KCkNoZWVycywgRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2lu
ZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
