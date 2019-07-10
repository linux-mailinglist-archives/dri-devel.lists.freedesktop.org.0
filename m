Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656564EBA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 00:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E3C89AF3;
	Wed, 10 Jul 2019 22:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2641A89AF3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 22:40:08 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id u19so8256299ior.9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h1QrIpFdh5rLkTKFlCHaduUWYuYcrWpgjVEeSTaTyVo=;
 b=i0Sx5TQ69OckJWK7+IxXlrWa2pqbIPMrwuFVSnGnx9DZMDdASSgkzgIY9T1DpeFrX7
 wDTKPBycRKkJyS17aZ035CTIiETs5xy8QYGYxJXvVvEwUTTlFJoPtrLzIcsWK4XLxhVN
 3l9fAXM7/Z6g7+7weta5FMXjXL8gnSagiwuRx3jNsdKmDHTmt5vj6qp9WYP3udnBtyMo
 fmFyA42fa0RMsIZU3OQ9zvqHvRUPXxWR95iax07wgMNcN4GhnpdNaFn2LRnI1YoenP9S
 Dq/SkIuAOgaL2re5nuo+FylerZKxBerNecqaWGhKEWlRd0ZzmxxuoWsy2CVmE914t0vK
 HTOg==
X-Gm-Message-State: APjAAAUjQkCqQqpB3cakjw+nBL0+AhXiEb/xN2GkpJTu3GVqgGsE7bU6
 ZhUiEuE5tbTpV1QhH0/SaFzOYIUVr78=
X-Google-Smtp-Source: APXvYqykNq/aOr9FwdrlqJL4UL5SDSHb1q+TusBSK/gPNMZugqVynWEaTnqq3ppG8bkk5VWSiYJilQ==
X-Received: by 2002:a5d:904e:: with SMTP id v14mr565497ioq.61.1562798407262;
 Wed, 10 Jul 2019 15:40:07 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50])
 by smtp.gmail.com with ESMTPSA id e84sm3676584iof.39.2019.07.10.15.40.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 15:40:05 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id j6so8312231ioa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:40:05 -0700 (PDT)
X-Received: by 2002:a02:c6a9:: with SMTP id o9mr688304jan.90.1562798405041;
 Wed, 10 Jul 2019 15:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org>
 <20190630202246.GB15102@ravnborg.org>
 <CAD=FV=V_wTD1xpkXRe-z2HsZ8QXKq7jmq8CsfhMnFxi-5XDJjw@mail.gmail.com>
 <20190708175007.GA3511@ravnborg.org>
In-Reply-To: <20190708175007.GA3511@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2019 15:39:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XnDTKkscdCwFE1137aX6pTtv=5zqXf=yqcnchpZpt5_Q@mail.gmail.com>
Message-ID: <CAD=FV=XnDTKkscdCwFE1137aX6pTtv=5zqXf=yqcnchpZpt5_Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override typical
 timing
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=h1QrIpFdh5rLkTKFlCHaduUWYuYcrWpgjVEeSTaTyVo=;
 b=i5KPrHovfkqkwkajM2OJwC/MI8IVo3lIvSf1xBkUaMHWuUyWkij1QldVl9kX/GMlE1
 DNsrFiTH/7r6LswYJlPb1030krcbMTp9icHuWypgydw+2C+kuV72UBpH6KFLdct9hP6R
 bfQOoNSN7axemJnh/3RbdCrrYZ6IDuOtjaP+w=
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Jeffy Chen <jeffy.chen@rock-chips.com>, LKML <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2FtLAoKT24gTW9uLCBKdWwgOCwgMjAxOSBhdCAxMDo1MCBBTSBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+IHdyb3RlOgo+Cj4gSGkgRG91Z2guCj4KPiBPbiBNb24sIEp1bCAwMSwgMjAx
OSBhdCAwOTozOToyNEFNIC0wNzAwLCBEb3VnIEFuZGVyc29uIHdyb3RlOgo+ID4gSGksCj4gPgo+
ID4gT24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMToyMiBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IEBAIC05MSw2ICs5Miw4IEBAIHN0cnVjdCBw
YW5lbF9zaW1wbGUgewo+ID4gPiA+ICAgICAgIHN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwo+ID4g
PiA+Cj4gPiA+ID4gICAgICAgc3RydWN0IGdwaW9fZGVzYyAqZW5hYmxlX2dwaW87Cj4gPiA+ID4g
Kwo+ID4gPiA+ICsgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG92ZXJyaWRlX21vZGU7Cj4g
PiA+IEkgZmFpbCB0byBzZWUgd2hlcmUgdGhpcyBwb2l0ZXIgaXMgYXNzaWduZWQuCj4gPgo+ID4g
SW4gcGFuZWxfc2ltcGxlX3BhcnNlX292ZXJyaWRlX21vZGUoKS4gIFNwZWNpZmljYWxseToKPiA+
Cj4gPiBkcm1fZGlzcGxheV9tb2RlX2Zyb21fdmlkZW9tb2RlKCZ2bSwgJnBhbmVsLT5vdmVycmlk
ZV9tb2RlKTsKPgo+IFRoZSBhYm92ZSBjb2RlLXNuaXBwZXQgaXMgb25seSBjYWxsZWQgaW4gdGhl
IHBhbmVsIGhhcyBzcGVjaWZpZWQgZGlzcGxheQo+IHRpbWluZ3MgdXNpbmcgZGlzcGxheV90aW1p
bmdzIC0gaXQgaXMgbm90IGNhbGxlZCB3aGVuIGRpc3BsYXlfbW9kZSBpcwo+IHVzZWQuCj4gU28g
b3ZlcnJpZGVfbW9kZSBpcyBvbmx5IGFzc2lnbmVkIGluIHNvbWUgY2FzZXMgYW5kIG5vdCBhbGwg
Y2FzZXMuCj4gVGhpcyBuZWVkcyB0byBiZSBmaXhlZCBzbyB3ZSBkbyBub3QgcmVmZXJlbmNlIG92
ZXJyaWRlX21vZGUgdW5sZXNzCj4gaXQgaXMgc2V0LgoKSSdtIGFmcmFpZCBJJ20gbm90IGZvbGxv
d2luZyB5b3UgaGVyZS4KCiogb3ZlcnJpZGVfbW9kZSBpcyBhIHN0cnVjdHVyZSB0aGF0J3MgZGly
ZWN0bHkgcGFydCBvZiAic3RydWN0IHBhbmVsX3NpbXBsZSIuCgoqIFRoZSBwYW5lbCBpcyBhbGxv
Y2F0ZWQgaW4gcGFuZWxfc2ltcGxlX3Byb2JlKCkgd2l0aCBkZXZtX2t6YWxsb2MoKS4KCiogVGhl
ICJ6IiBpbiBremFsbG9jIG1lYW5zIHRoYXQgdGhpcyBtZW1vcnkgd2lsbCBiZSB6ZXJvLWluaXRp
YWxpemVkLgoKRnJvbSB0aGUgcG9pbnRzIGFib3ZlLCAib3ZlcnJpZGVfbW9kZSIgd2lsbCBhbHdh
eXMgYmUgc2V0IHRvCnNvbWV0aGluZy4gIElmIHdlIGRpZG4ndCBydW4gImRybV9kaXNwbGF5X21v
ZGVfZnJvbV92aWRlb21vZGUoJnZtLAomcGFuZWwtPm92ZXJyaWRlX21vZGUpOyIgdGhlbiB3ZSBr
bm93IHRoZSBlbnRpcmUgb3ZlcnJpZGVfbW9kZQpzdHJ1Y3R1cmUgd2lsbCBiZSB6ZXJvLgoKV2hp
bGUgaXQgdG9vayBhIHdoaWxlIGZvciBtZSB0byBnZXQgdXNlZCB0byBpdCwgdGhlIGtlcm5lbCBj
b252ZW50aW9uCmlzIHRvIHJlbHkgb24gemVyby1pbml0aWFsaXphdGlvbiBhbmQgbm90IHRvIGV4
cGxpY2l0bHkgaW5pdCB0aGluZ3MgdG8KemVyby4gIEFzIGFuIGV4YW1wbGUgb2YgdGhpcyBiZWlu
ZyBjb2RpZmllZCBpbiB0aGUgc291cmNlLCB5b3UgY2FuIHNlZQp0aGF0ICJjaGVja3BhdGNoLnBs
IiB3aWxsIHllbGwgYXQgeW91IGZvciBhIHNpbWlsYXIgdGhpbmc6ICJkbyBub3QKaW5pdGlhbGlz
ZSBnbG9iYWxzIHRvIDAiLgoKCj4gPiA+IEBAIC0xNTIsNiArMTYyLDQ0IEBAIHN0YXRpYyBpbnQg
cGFuZWxfc2ltcGxlX2dldF9maXhlZF9tb2RlcyhzdHJ1Y3QgcGFuZWxfc2ltcGxlICpwYW5lbCkK
PiA+ID4gPiAgICAgICAgICAgICAgIG51bSsrOwo+ID4gPiA+ICAgICAgIH0KPiA+ID4gPgo+ID4g
PiA+ICsgICAgIHJldHVybiBudW07Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRp
YyBpbnQgcGFuZWxfc2ltcGxlX2dldF9ub25fZWRpZF9tb2RlcyhzdHJ1Y3QgcGFuZWxfc2ltcGxl
ICpwYW5lbCkKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IgPSBwYW5lbC0+YmFzZS5jb25uZWN0b3I7Cj4gPiA+ID4gKyAgICAgc3RydWN0IGRy
bV9kZXZpY2UgKmRybSA9IHBhbmVsLT5iYXNlLmRybTsKPiA+ID4gPiArICAgICBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfbW9kZSAqbW9kZTsKPiA+ID4gPiArICAgICBib29sIGhhc19vdmVycmlkZSA9IHBh
bmVsLT5vdmVycmlkZV9tb2RlLnR5cGU7Cj4gPiA+IFRoaXMgbG9va3Mgc3VzcGljaW91cy4KPiA+
ID4gcGFuZWwtPm92ZXJyaWRlX21vZGUudHlwZSBpcyBhbiB1bnNpZ25lZCBpbnQgdGhhdCBtYXkg
aGF2ZSBhIG51bWJlciBvZgo+ID4gPiBiaXRzIHNldC4KPiA+ID4gU28gdGhlIGFib3ZlIGNvZGUg
aW1wbGljaXRseSBjb252ZXJ0IGEgLnR5cGUgIT0gMCB0byBhIHRydWUuCj4gPiA+IFRoaXMgY2Fu
IGJlIGV4cHJlc3NlZCBpbiBhIG11Y2ggbW9yZSByZWFkZXIgZnJpZW5kbHkgd2F5Lgo+ID4KPiA+
IFlvdSB3b3VsZCBzdWdnZXN0IHRoYXQgSSBhZGQgYSBib29sZWFuIGZpZWxkIHRvIGEgc3RydWN0
dXJlIHRvCj4gPiBpbmRpY2F0ZSB3aGV0aGVyIGFuIG92ZXJyaWRlIG1vZGUgaXMgcHJlc2VudD8K
PiBBIHNpbXBsZSAgYm9vbCBoYXNfb3ZlcnJpZGUgPSBwYW5lbC0+b3ZlcnJpZGVfbW9kZS50eXBl
ICE9IDA7Cj4gd291bGQgZG8gdGhlIHRyaWNrIGhlcmUuCj4gVGhlbiB0aGVyZSBpcyBubyBoaWRk
ZW4gY29udmVyc2lvbiBmcm9tIGludCB0byBhIGJvb2wuCgpJIHdpbGwgY2hhbmdlIHRoaXMgdG8g
InBhbmVsLT5vdmVycmlkZV9tb2RlLnR5cGUgIT0gMCIgaWYgeW91J3JlCnJlYWxseSBzdXJlLCBi
dXQgdGhpcyBzZWVtcyBib3RoIGFnYWluc3QgdGhlIGdlbmVyYWwgTGludXggc3R5bGUKZmVlZGJh
Y2sgSSd2ZSByZWNlaXZlZCBvdmVyIHRoZSB5ZWFycyAodGhvdWdoIHRoZXJlIGlzIGRlZmluaXRl
bHkgbm90CjEwMCUgY29uc2lzdGVuY3kpIGFuZCBhbHNvIGFnYWluc3QgdGhlIGxvY2FsIGNvbnZl
bnRpb24gaW4gdGhpcyBmaWxlLgpFeGFtcGxlcyBpbiB0aGlzIGZpbGUgb2YgdHJlYXRpbmcgaW50
cyBhcyBib29scyB3aXRob3V0IGFuIGV4cGxpY2l0CiIhPSAwIjoKCiogcGFuZWxfc2ltcGxlX2dl
dF9maXhlZF9tb2RlcyBjaGVja3MgImlmIChwYW5lbC0+ZGVzYy0+YnVzX2Zvcm1hdCkiCiogcGFu
ZWxfc2ltcGxlX2Rpc2FibGUgY2hlY2tzICJpZiAocC0+ZGVzYy0+ZGVsYXkuZGlzYWJsZSkiCiog
cGFuZWxfc2ltcGxlX3VucHJlcGFyZSBjaGVja3MgImlmIChwLT5kZXNjLT5kZWxheS51bnByZXBh
cmUpIgoqIHBhbmVsX3NpbXBsZV9wcmVwYXJlIGNoZWNrcyAiaWYgKGRlbGF5KSIKKiBwYW5lbF9z
aW1wbGVfZW5hYmxlIGNoZWNrcyAiaWYgKHAtPmRlc2MtPmRlbGF5LmVuYWJsZSkiCgouLi5hbmQs
IGFsdGhvdWdoIHNsaWdodGx5IGRpZmZlcmVudCwgcG9pbnRlcnMgaW4gdGhpcyBmaWxlIGFyZSBj
aGVja2VkCmZvciBOVUxMIHZzLiBub24tTlVMTCB3aXRob3V0IGFuIGV4cGxpY2l0ICI9PSBOVUxM
Ii4KCk9mIGNvdXJzZSBqdXN0IGJlY2F1c2UgYWxsIHRoZSBvdGhlciBleGFtcGxlcyBpbiB0aGUg
ZmlsZSBkbyBpdCBvbmUKd2F5IGRvZXNuJ3QgbWVhbiB0aGF0IG5ldyBjb2RlIGhhcyB0byBkbyBp
dCBhbm90aGVyIHdheSwgYnV0IEkgd2FudGVkCnRvIGJlIHJlYWxseSBzdXJlIHlvdSB3YW50ZWQg
bWUgdG8gZ28gYWdhaW5zdCB0aGUgZXhpc3RpbmcgY29udmVudGlvbgpiZWZvcmUgY2hhbmdpbmcg
dGhpcy4KCgo+IEJ1dCBhcyBvdmVycmlkZV9tb2RlIGNhbiBiZSBOVUxMIHNvbWV0aGluZyBtb3Jl
IG5lZWRzIHRvIGJlIGRvbmUuCgpJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgb3Zl
cnJpZGVfbW9kZSBjYW4gYmUgTlVMTCBzaW5jZSBpdCdzCm5vdCBhIHBvaW50ZXIuICBDYW4geW91
IGNsYXJpZnk/CgoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
