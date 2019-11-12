Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E5F90D0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 14:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7F56E33C;
	Tue, 12 Nov 2019 13:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D2A6E248
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 13:39:20 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-4nnwgqtIPKmdEY4GYFLXoQ-1; Tue, 12 Nov 2019 08:39:18 -0500
Received: by mail-wm1-f70.google.com with SMTP id f14so1177981wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 05:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eHFDci9ChvAm0abpnWdrfknvQVZuDMCQc5DF55441xc=;
 b=DyrRAoDJKEIAswPCbYnvyL9cicwQjketWT80QXvHIoLxBaExh8UtSEYU7F6yFgEmSl
 0M8GMM7CsajS/NZYRnQWHbgSUltvKSUKhafV2ih2kpqME2sdKJh/2V2pvKGgUv6JGzx5
 K5TxiKVJWzS0+XWzz0nhdTznV8Yxd1XGgroU8waqIxQ0/iixMzGXPT8zBBBDyiDOoFCF
 mOYv9pqOxYpiv1xxN381RlWdG67J7MdzvhpdgurOJTI7JSSsR7Fbv3UQAM/seGc3aRGx
 WaEwD0whVbZ++1Slu+7N1Ouoi+mfqY6wlzYnV/OEW78WVgFGjjEWA4Kv81j9P3swAEkO
 cUTA==
X-Gm-Message-State: APjAAAUUbMTr4C9hapc7ePgnH7136rXlhrRHUFSrv++dD2rV2r/Mavl7
 AjxJR32OqvHzswj858G5l8a2/l/2ACker8hmd6arMODTkWVtEBR6xJir7KCeGoqDGPSA/Ef4Uwx
 X3KeuzKKaOec048Vh86GaqPmnIiNA
X-Received: by 2002:a05:600c:506:: with SMTP id
 i6mr4133753wmc.153.1573565956893; 
 Tue, 12 Nov 2019 05:39:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqyM9gQHDkxZJuR/s5upnUGw2QfGDhvM9BpjtnIzoZMhTC1HI5l4uKumIrBDa5gALWGLZugd1Q==
X-Received: by 2002:a05:600c:506:: with SMTP id
 i6mr4133725wmc.153.1573565956622; 
 Tue, 12 Nov 2019 05:39:16 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id l4sm2863894wml.33.2019.11.12.05.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2019 05:39:16 -0800 (PST)
Subject: Re: [PATCH 12/12] drm/connector: Hookup the new drm_cmdline_mode
 panel_orientation member
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191110154101.26486-1-hdegoede@redhat.com>
 <20191110154101.26486-13-hdegoede@redhat.com>
 <20191112094712.GH23790@phenom.ffwll.local>
 <13ce5629-045a-7d70-ecfa-7acdfada9d1f@redhat.com>
 <CAKMK7uHHNz6TZViHEk9ycNp752jSQoqV=WHBoTnUh_e10a-_EQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <82a1ef3f-6c13-1a3e-e8d8-827f5fad9e46@redhat.com>
Date: Tue, 12 Nov 2019 14:39:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHHNz6TZViHEk9ycNp752jSQoqV=WHBoTnUh_e10a-_EQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: 4nnwgqtIPKmdEY4GYFLXoQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573565959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jPbjuPlxKc5Fjfd2GSOsof3Ag7xgM5Xk4nwaJMpzqPI=;
 b=Hs3WgIND2G+EKiG/GUGL8hPU7C1P0N57tt5mplE6KFwvnYEbEVGBtesoUiHZQncuqV7H77
 DuoQgqMeT1tt5W9TWqmzQX803Q5xqjh7S/B5crMgbLJhBcSqKo8J+Pmyne05aXcrgv229e
 QNmH04GTO1W/qYxXfd56piO64h7h0Vc=
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Mathieu_Alexandre-T=c3=a9treault?= <alexandretm@amotus.ca>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMi0xMS0yMDE5IDE0OjMyLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFR1ZSwg
Tm92IDEyLCAyMDE5IGF0IDExOjQzIEFNIEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5j
b20+IHdyb3RlOgo+Pgo+PiBIaSwKPj4KPj4gT24gMTItMTEtMjAxOSAxMDo0NywgRGFuaWVsIFZl
dHRlciB3cm90ZToKPj4+IE9uIFN1biwgTm92IDEwLCAyMDE5IGF0IDA0OjQxOjAxUE0gKzAxMDAs
IEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+Pj4gSWYgdGhlIG5ldyB2aWRlbz0uLi4gcGFuZWxfb3Jp
ZW50YXRpb24gb3B0aW9uIGlzIHNldCBmb3IgYSBjb25uZWN0b3IsIGhvbm9yCj4+Pj4gaXQgYW5k
IHNldHVwIGEgbWF0Y2hpbmcgInBhbmVsIG9yaWVudGF0aW9uIiBwcm9wZXJ0eSBvbiB0aGUgY29u
bmVjdG9yLgo+Pj4+Cj4+Pj4gQnVnTGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3BseW1vdXRoL3BseW1vdXRoL21lcmdlX3JlcXVlc3RzLzgzCj4+Pj4gU2lnbmVkLW9mZi1ieTog
SGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPj4+Cj4+PiBEb24ndCB3ZSBuZWVk
IG9uZSBtb3JlIHBhdGNoIGhlcmUgdG8gY3JlYXRlIHRoZSBwYW5lbCBvcmllbnRhdGlvbiBwcm9w
ZXJ0eQo+Pj4gaWYgdGhlIGRyaXZlciBkb2Vzbid0IGRvIGl0PyBPdGhlcndpc2UgdGhpcyB3b24n
dCBoYXBwZW4sIGFuZCB1c2Vyc3BhY2UKPj4+IGNhbid0IGxvb2sgYXQgaXQgKG9ubHkgdGhlIGlu
dGVybmFsIGZiZGV2IHN0dWZmLCB3aGljaCBoYXMgaXQncyBvd24KPj4+IGxpbWl0YXRpb25zIHdy
dCByb3RhdGlvbikuCj4+Cj4+IFRoYXQgaXMgd2hhdCBwYXRjaCAxMS8xMiBpcyBmb3IsIHRoYXQg
cGF0Y2ggcmVuYW1lcyBkcm1fY29ubmVjdG9yX2luaXRfcGFuZWxfb3JpZW50YXRpb24KPj4gdG8g
ZHJtX3NldF9wYW5lbF9vcmllbnRhdGlvbiBhbmQgbWFrZXMgaXQgYm90aCBzZXQsIGluaXQgYW5k
IGF0dGFjaCB0aGUgcHJvcGVydHkKPj4gKHVubGVzcyBjYWxsZWQgd2l0aCBEUk1fTU9ERV9QQU5F
TF9PUklFTlRBVElPTl9VTktOT1dOIGluIHdoaWNoIGNhc2UgaXQgaXMgYSBuby1vcCkuCj4+Cj4+
IFBhdGNoIDExLzEyIGFsc28gbWFrZXMgZHJtX3NldF9wYW5lbF9vcmllbnRhdGlvbiBkbyB0aGUg
c2V0IG9ubHkgb25jZSwgd2hpY2ggaXMgd2h5Cj4+IHRoZSBvcmllbnRhdGlvbiB0byBzZXQgaXMg
bm93IHBhc3NlZCBpbnN0ZWFkIG9mIHN0b3JlZCBkaXJlY3RseSBpbiB0aGUgY29ubmVjdG9yLAo+
PiBzbyB0aGF0IGEgc2Vjb25kIHNldCBjYWxsIChwYW5lbF9vcmllbnRhdGlvbiBvZiB0aGUgY29u
bmVjdG9yIGFscmVhZHkgIT0KPj4gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fVU5LTk9XTikg
Y2FuIGJlIHNraXBwZWQsIHNvIHRoYXQgdGhlIGNtZGxpbmUgb3ZlcnJpZGVzCj4+IGRyaXZlciBk
ZXRlY2lvbiBjb2RlIGZvciB0aGlzLgo+IAo+IE9oLCB0aGF0J3Mgd2hhdCBJIGdldCBmb3Igbm90
IHJlYWRpbmcgdGhlIGVudGlyZSBzZXJpZXMgLi4uIE9ubHkgcmlzawo+IHdpdGggdGhhdCBpcyB0
aGF0IGRyaXZlcnMgc2V0IHRoaXMgcHJvcGVydHkgYWZ0ZXIgZHJpdmVyIGxvYWRpbmcgaXMKPiBk
b25lIC0gd2UgY2FuJ3QgYXR0YWNoL2NyZWF0ZSBwcm9wZXJ0aWVzIGFmdGVyIGRybV9kZXZfcmVn
aXN0ZXIuIEJ1dAo+IEkndmUgYWRkZWQgdGhlIGNvcnJlc3BvbmRpbmcgV0FSTl9PTiB0byB0aGVz
ZSwgc28gd2Ugc2hvdWxkIGJlIGFsbAo+IGZpbmUgSSB0aGluay4gU28gbG9va3MgYWxsIGdvb2Qg
dG8gbWUuCgpDYW4gSSB0YWtlIHRoYXQgYXMgeW91ciBBY2tlZC1ieSBmb3IgdGhpcyBwYXRjaCBh
bmQgcGVyaGFwcyBhbHNvIGZvciAxMS8xMiA/CgpBbHNvIHdoYXQgYWJvdXQgeW91ciByZW1hcmtz
IHRvIDEwLzEyPyAgSSdtIGhhcHB5IHRvIGRvIGEgdjIgd2l0aCBhIG1lbXNldCwKYXMgc2FpZCBt
eSBtYWluIHJlYXNvbiBmb3IgZHJvcHBpbmcgdGhlIHNwZWNpZmllZD1mYWxzZSBpbiB0aGUgZWFy
bHkgcGF0aAppcyB0aGF0IHdlIG5ldmVyIGluaXQgYnBwX3NwZWNpZmllZCBvciByZWZyZXNoX3Nw
ZWNpZmllZCBleHBsaWNpdGx5IHRvIGZhbHNlCkknbSBhbGwgZm9yIGJlaW5nIGV4cGxpY2l0IGFi
b3V0IHRoYXQsIGJ1dCB0aGVuIGxldHMganVzdCB6ZXJvIG91dCB0aGUgZW50aXJlCnBhc3NlZCBp
biBkcm1fY21kbGluZV9tb2RlIHN0cnVjdC4KClJlZ2FyZHMsCgpIYW5zCgoKCj4+Pj4gLS0tCj4+
Pj4gICAgZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyB8IDcgKysrKysrKwo+Pj4+ICAg
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25u
ZWN0b3IuYwo+Pj4+IGluZGV4IDQwYTk4NWM0MTFhNi4uNTkxOTE0ZjAxY2Q0IDEwMDY0NAo+Pj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4+Pj4gQEAgLTE0MCw2ICsxNDAsMTMgQEAgc3RhdGlj
IHZvaWQgZHJtX2Nvbm5lY3Rvcl9nZXRfY21kbGluZV9tb2RlKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpCj4+Pj4gICAgICAgICAgICAgICBjb25uZWN0b3ItPmZvcmNlID0gbW9kZS0+
Zm9yY2U7Cj4+Pj4gICAgICAgfQo+Pj4+Cj4+Pj4gKyAgICBpZiAobW9kZS0+cGFuZWxfb3JpZW50
YXRpb24gIT0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fVU5LTk9XTikgewo+Pj4+ICsgICAg
ICAgICAgICBEUk1fSU5GTygic2V0dGluZyBjb25uZWN0b3IgJXMgcGFuZWxfb3JpZW50YXRpb24g
dG8gJWRcbiIsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGNvbm5lY3Rvci0+bmFtZSwgbW9k
ZS0+cGFuZWxfb3JpZW50YXRpb24pOwo+Pj4+ICsgICAgICAgICAgICBkcm1fY29ubmVjdG9yX3Nl
dF9wYW5lbF9vcmllbnRhdGlvbihjb25uZWN0b3IsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1vZGUtPnBhbmVsX29yaWVudGF0aW9uKTsKPj4+
PiArICAgIH0KPj4+PiArCj4+Pj4gICAgICAgRFJNX0RFQlVHX0tNUygiY21kbGluZSBtb2RlIGZv
ciBjb25uZWN0b3IgJXMgJXMgJWR4JWRAJWRIeiVzJXMlc1xuIiwKPj4+PiAgICAgICAgICAgICAg
ICAgICAgIGNvbm5lY3Rvci0+bmFtZSwgbW9kZS0+bmFtZSwKPj4+PiAgICAgICAgICAgICAgICAg
ICAgIG1vZGUtPnhyZXMsIG1vZGUtPnlyZXMsCj4+Pj4gLS0KPj4+PiAyLjIzLjAKPj4+Pgo+Pj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Pj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo+Pj4KPj4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
