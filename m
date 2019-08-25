Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3149C614
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 22:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F403F6E125;
	Sun, 25 Aug 2019 20:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003076E126
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 20:24:06 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id y16so9621685vsc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 13:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tQZ/3TQP4mK8fGf9cwa7hIufD3H+7ptVXSxi7jQl7Uw=;
 b=MWfOJb+PjZnnWKx7ZCBfdRi9t8FOacqwlkpn94HrDUBzBz5QPRzxGw71/g11vqP/rX
 CHO+vDBnqZ6wz5uUgI8QVB9qC/8bMzLuXfB+IVnQTti5UqnhVEippldAa6CBnLKmX9+h
 r3eYCSWvhwAiquDYoMjvM36OcJHvkiHUuJU74SpmtNvov5JFQbTmpEquizT302U1C+9o
 kjE4uzCW5gLe0TIUtBlj/6T+6NR2XC67Oe0wTTD8Kcymo2y8+W36gsw/ihGucGEt42GO
 VSMc+SNOg4bEP99WuUkPIbQHzVpKmu4QAUu1CSYpa7d8J5pibAYAM3oAutYFICWofZuO
 IIbg==
X-Gm-Message-State: APjAAAVKkBEDbwTto8Hedze3vj5ogy12JYUnGMH3eGqUbnL7HZzmCZB4
 JEeALIDJJDqkVaONxfXalsuCrIfPzXKTSJmX5aI=
X-Google-Smtp-Source: APXvYqzOFWruPfgGsLZnzjN/VSHUQwYBh1TKA/seKEgWYOYS/7zdPDD19kuXbHMmAHSLZ77zY8ClSQ7Ec2zbXyyzlCg=
X-Received: by 2002:a67:cf05:: with SMTP id y5mr8351908vsl.18.1566764645679;
 Sun, 25 Aug 2019 13:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <7f5204a1-cc3a-d6a3-be07-b2c316761e46@ti.com>
In-Reply-To: <7f5204a1-cc3a-d6a3-be07-b2c316761e46@ti.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 25 Aug 2019 16:23:54 -0400
Message-ID: <CAKb7Uvh2Ygp2sWGk-GOUzA699fr=R0=S8ejmXKsNOj3MEkzGxA@mail.gmail.com>
Subject: Re: Display-Port HPD handling, link status, and bandwidth checks
To: Jyri Sarha <jsarha@ti.com>
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
Cc: "Valkeinen, Tomi" <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WW91J2xsIHByb2JhYmx5IGdldCBhIG1vcmUgZGV0YWlsZWQgcmVwbHkgZHVyaW5nIHRoZSB3ZWVr
LCBidXQgZm9yIG5vdwpoYXZlIGEgbG9vayBhdCB0aGUgImxpbmstc3RhdHVzIiBwcm9wZXJ0eSwg
d2hpY2ggd2FzIG1hZGUgZm9yCnByZWNpc2VseSB0aGlzIHNpdHVhdGlvbi4gSSB0aGluayBiYXNp
Y2FsbHkgdGhlIGlkZWEgaXMgdG8gaWdub3JlIGxpbmsKdHJhaW5pbmcgYXMgcGFydCBvZiB0aGUg
bW9kZXNldCwgYW5kIGp1c3QgcmV0dXJuIHRoZSBsaW5rIHN0YXR1cwpkZXBlbmRpbmcgb24gdGhl
IHN1Y2Nlc3MuIChBbmQgeW91IHNob3VsZCBmaWx0ZXIgb3V0IHRvdGFsbHkKaW5mZWFzaWJsZSBt
b2RlcywgaS5lLiBvdXRzaWRlIHRoZSBtb25pdG9yJ3MgbWF4IGxhbmVzL2JhbmR3aWR0aApjYXBh
YmlsaXRpZXMsIHdoaWNoIEkgYmVsaWV2ZSBhcmUgYXZhaWxhYmxlIHZpYSBEUENEIG9yIEVESUQu
KQoKU2VlIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2dwdS9kcm0ta21z
Lmh0bWwgZm9yIGEgYml0Cm1vcmUgaW5mbyBhcyB3ZWxsLgoKQ2hlZXJzLAoKICAtaWxpYQoKT24g
U3VuLCBBdWcgMjUsIDIwMTkgYXQgNzoxMiBBTSBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPiB3
cm90ZToKPgo+IEhpLAo+Cj4gSSBhbSB3b3JraW5nIG9uIGEgbmV3IERpc3BsYXlQb3J0IGJyaWRn
ZS1kcml2ZXIgYW5kIHRoZXJlIGlzIGEgY291cGxlIG9mCj4gdGhpbmdzIHRoYXQgSSBkbyBub3Qg
a25vdyBob3cgdG8gaGFuZGxlLgo+Cj4gMS4gV2hlbiBzaG91bGQgdGhlIGxpbmsgdHJhaW5pbmcg
aGFwcGVuPwo+ICAgIGEpIEluIGNvbm5lY3RvciBkZXRlY3QoKT8KPiAgICAgICAtIFRoaXMgd291
bGQgZW5hYmxlIHVzIHRvIGRvIG1vZGUgZmlsdGVyaW5nIChpbiBtb2RlX3ZhbGlkKCkpCj4gICAg
ICAgICBiYXNlZCBvbiB0aGUgZXN0YWJsaXNoZWQgbGluayBiYW5kLXdpZHRoICh0aGVuIGFnYWlu
Cj4gICAgICAgICBtb2RlX3ZhbGlkKCkgZG9jdW1lbnRhdGlvbiBzdWdnZXN0cyB0aGF0IG1vZGVz
IHNob3VsZCBvbmx5Cj4gICAgICAgICBiZSBmaWx0ZXJlZCBiYXNlZCBvbiAiY29uZmlndXJhdGlv
bi1pbnZhcmlhbnQgaGFyZHdhcmUKPiAgICAgICAgIGNvbnN0cmFpbnRzIikuCj4gICAgYikgSW4g
Y2hlY2sgcGhhc2UgKHRoaXMgd291bGQgY3VycmVudGx5IG1lYW4gbW9kZV9maXh1cCk/Cj4gICAg
ICAgLSBUaGlzIGlzIHRoZSBsYXN0IHBvaW50IHdoZXJlIHdlIGNhbiByZWplY3QgYSBtb2RlIHRo
YXQgY2FuIG5vdAo+ICAgICAgICAgYmUgc2VudCBvdmVyIHRoZSBEUC1saW5rCj4gICAgYykgSW4g
Y29tbWl0IHBoYXNlIChlLmcuIGJyaWRnZSBlbmFibGUoKSkKPiAgICAgICAtIFRoaXMgaXMgYmFk
IHNpbmNlIHdlIHNob3VsZCBub3QgZmFpbCBhbnkgbW9yZSBpbiB0aGUgY29tbWl0Cj4gICAgICAg
ICBwaGFzZQo+Cj4gMi4gRFAtbGluayBzb21ldGltZXMgZHJvcHMgYWZ0ZXIgYSBzdWNjZXNmdWwg
bGluayB0cmFpbmluZyBhbmQgRFAtc2luawo+ICAgIGlzIHN1cHBvc2VkIHRvIHNlbmQgc2hvcnQg
SFBEIHB1bHNlIGFib3V0IGl0LiBXaGF0IGFyZSB0aGUKPiAgICByZWNvbW1lbmRlZCB3YXlzIHRv
IGhhbmRsZSB0aGUgc2l0dWF0aW9uPwo+Cj4gICAgYSkgU2VuZCBob3RwbHVnIGV2ZW50IGFuZCBs
ZXQgdGhlIERSTSBjbGllbnQgZGVhbCB3aXRoIGl0Pwo+ICAgICAgIC0gVGhpcyBkb2VzIG5vdCB3
b3JrIHRvbyB3ZWxsIGJlY2F1c2UgZXZlbiBpZiB0aGUgY2xpZW50IHRyaWVzCj4gICAgICAgICB0
byByZXN0b3JlIHRoZSBkaXNwbGF5IGJ5IGNvbW1pdHRpbmcgdGhlIHNhbWUgc3RhdGUgYWdhaW4g
LQo+ICAgICAgICAgbGlrZSBmYmRldiBkb2VzIC0gdGhlIGJyaWRnZSBkb2VzIG5vdCBnbyB0cm91
Z2ggZGlzYWJsZS1lbmFibGUKPiAgICAgICAgIGN5Y2xlLCBzaW5jZSBkaXNwbGF5IG1vZGUgaGFz
IG5vdCBjaGFuZ2VkLgo+ICAgICAgIC0gRGVzcGl0ZSBpdCBub3Qgd29ya2luZyBzbyB3ZWxsLCB0
aGlzIGlzIHdoYXQgdGhlIG1vc3QgZHJpdmVycwo+ICAgICAgICAgYXBwZWFyIHRvIGRvLgo+Cj4g
ICAgYikgRHJpdmVyIGludGVybmFsbHkgcmUtdHJhaW5zIHRoZSBsaW5rIGJ1dCBzZW5kIGEgaG90
cGx1ZyBldmVudAo+ICAgICAgIGFsd2F5cyBhZnRlciBpdD8KPiAgICAgICAtIFRoaXMgaXMgd2hh
dCBpOTE1IGRvZXMsIGlmIEkgcmVhZCB0aGUgY29kZSByaWdodC4KPiAgICAgICAtIEhvdyB0byB0
cmVhdCBhIHRyYWluaW5nIGZhaWx1cmU/IFNlbmRpbmcgaG90cGx1ZyBldmVudCBkb2VzIG5vdAo+
ICAgICAgICAgcmVhbGx5IGhlbHAgKHNlZSBhYm92ZSkuCj4KPiAgICBjKSBTaWxlbnRseSByZS10
cmFpbiB0aGUgbGluayBpZiB3ZSB3ZXJlIGFibGUgdG8gcmVzdG9yZSB0aGUgbGluawo+ICAgICAg
IGFuZCB0aGUgZGlzcGxheSBtb2RlLCBhbmQgc2VuZCBIUEQgb25seSBpZiBzb21ldGhpbmcgd2Vu
dCB3cm9uZz8KPgo+IEJlc3QgcmVnYXJkcywKPiBKeXJpCj4KPiAtLQo+IFRleGFzIEluc3RydW1l
bnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgo+IFktdHVu
bnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtp
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
