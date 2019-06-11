Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A053C680
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 10:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E55890BE;
	Tue, 11 Jun 2019 08:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2827890BE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:51:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so4218731eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 01:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=omJ/gQVCRHiP1mzn5vFGNqzD3Ej8FBhph57vNj7+2+U=;
 b=o7uFGW1oNi1gc1AM889aj0r/tPmMSqsx5GF4mFy7Zjg3Bxswe+5Tg+TvTwMPzg7OhH
 i+1ixTZhyaMuln/SAX6Rj4vjglR4XT2qiU4LjxjIfqPk8o1SXEdqyt16OdGg5rGzRyOt
 /II/zdX1kCtIWt0FBQ+jPnaMbsJCpmwUcXM/qKPlnSW/yjye0lw/Ewg2ZMksIrqR36eZ
 g+00X89FgFQb6NYTvBzzOkSwZn01P9qHa1acfTVrHyufOujM4ZUXGcqEPmoPf7OPQwEY
 VO7erIiIzNzb0w0dLACiwefFAlzHCgDuxobHjia1Pz3mkuDjAeiZ9i2gHoAOmVYYw6bF
 6t+w==
X-Gm-Message-State: APjAAAVMjXgMUTOwM261UYm/xiYDDNLTPfJK/QpH8i6/cu31H1Hrhb80
 oP4CO0VvWjAKCFJcTEFePNZOOg==
X-Google-Smtp-Source: APXvYqw3/aAUmVHCu0mGixW6kqJWcVN5+tdHtfvax9kpwDGm5hXz6VB7nLZ5jD0lSOSvFoX71EN+7w==
X-Received: by 2002:a17:906:9410:: with SMTP id
 q16mr28289475ejx.90.1560243086366; 
 Tue, 11 Jun 2019 01:51:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q11sm3583175edd.51.2019.06.11.01.51.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 01:51:25 -0700 (PDT)
Date: Tue, 11 Jun 2019 10:51:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: WARNING in bpf_jit_free
Message-ID: <20190611085123.GU21222@phenom.ffwll.local>
Mail-Followup-To: Dmitry Vyukov <dvyukov@google.com>,
 syzbot <syzbot+2ff1e7cb738fd3c41113@syzkaller.appspotmail.com>,
 David Airlie <airlied@linux.ie>,
 Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 David Miller <davem@davemloft.net>,
 DRI <dri-devel@lists.freedesktop.org>, hawk@kernel.org,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, maxime.ripard@bootlin.com,
 netdev <netdev@vger.kernel.org>, paul.kocialkowski@bootlin.com,
 Song Liu <songliubraving@fb.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, wens@csie.org,
 xdp-newbies@vger.kernel.org, Yonghong Song <yhs@fb.com>
References: <000000000000e92d1805711f5552@google.com>
 <000000000000381684058ace28e5@google.com>
 <20190611080431.GP21222@phenom.ffwll.local>
 <CACT4Y+YMFKe1cq_XpP0o5fd+XLD_8qMVjqnVX5rx1UCWyCR5eg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+YMFKe1cq_XpP0o5fd+XLD_8qMVjqnVX5rx1UCWyCR5eg@mail.gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=omJ/gQVCRHiP1mzn5vFGNqzD3Ej8FBhph57vNj7+2+U=;
 b=kUJTjpQuyMbXk93njpHM3k6QoX8RPZogTfl+8U8433P85C0qtQkomi2N3Ta3NwYpK8
 d3jnprLPROJiR7CcBOpw1oEakKM+siBt3nrXieW7Qy9wvruNhWOrjOC3JYbnqtOFXcUK
 s0BiQJn8siLUOn65av3Tjt06i6k0QCRN4LLPU=
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
Cc: Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, David Airlie <airlied@linux.ie>,
 Alexei Starovoitov <ast@kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 hawk@kernel.org, xdp-newbies@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, maxime.ripard@bootlin.com,
 wens@csie.org, Yonghong Song <yhs@fb.com>,
 syzbot <syzbot+2ff1e7cb738fd3c41113@syzkaller.appspotmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 David Miller <davem@davemloft.net>, paul.kocialkowski@bootlin.com,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTA6MzM6MjFBTSArMDIwMCwgRG1pdHJ5IFZ5dWtvdiB3
cm90ZToKPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAxMDowNCBBTSBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwgSnVuIDA4LCAyMDE5IGF0IDA0
OjIyOjA2QU0gLTA3MDAsIHN5emJvdCB3cm90ZToKPiA+ID4gc3l6Ym90IGhhcyBmb3VuZCBhIHJl
cHJvZHVjZXIgZm9yIHRoZSBmb2xsb3dpbmcgY3Jhc2ggb246Cj4gPiA+Cj4gPiA+IEhFQUQgY29t
bWl0OiAgICA3OWMzYmEzMiBNZXJnZSB0YWcgJ2RybS1maXhlcy0yMDE5LTA2LTA3LTEnIG9mIGdp
dDovL2Fub25nLi4KPiA+ID4gZ2l0IHRyZWU6ICAgICAgIHVwc3RyZWFtCj4gPiA+IGNvbnNvbGUg
b3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xMjAxYjk3
MWEwMDAwMAo+ID4gPiBrZXJuZWwgY29uZmlnOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5j
b20veC8uY29uZmlnP3g9NjA1NjRjYjUyYWIyOWQ1Ygo+ID4gPiBkYXNoYm9hcmQgbGluazogaHR0
cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPTJmZjFlN2NiNzM4ZmQzYzQxMTEz
Cj4gPiA+IGNvbXBpbGVyOiAgICAgICBnY2MgKEdDQykgOS4wLjAgMjAxODEyMzEgKGV4cGVyaW1l
bnRhbCkKPiA+ID4gc3l6IHJlcHJvOiAgICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L3gvcmVwcm8uc3l6P3g9MTRhM2JmNTFhMDAwMDAKPiA+ID4gQyByZXByb2R1Y2VyOiAgIGh0dHBz
Oi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8uYz94PTEyMGQxOWYyYTAwMDAwCj4gPgo+
ID4gTG9va2luZyBhdCB0aGUgcmVwcm9kdWNlciBJIGRvbid0IHNlZSBhbnkgY2FsbHMgdG8gaW9j
dGwgd2hpY2ggY291bGQgZW5kCj4gPiB1cCBhbnl3aGVyZSBpbiBkcm0uCj4gPiA+Cj4gPiA+IFRo
ZSBidWcgd2FzIGJpc2VjdGVkIHRvOgo+ID4gPgo+ID4gPiBjb21taXQgMGZmZjcyNGEzMzkxN2Fj
NTgxYjU4MjUzNzVkMGI1N2FmZmVkZWU3Ngo+ID4gPiBBdXRob3I6IFBhdWwgS29jaWFsa293c2tp
IDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KPiA+ID4gRGF0ZTogICBGcmkgSmFuIDE4
IDE0OjUxOjEzIDIwMTkgKzAwMDAKPiA+ID4KPiA+ID4gICAgIGRybS9zdW40aTogYmFja2VuZDog
VXNlIGV4cGxpY2l0IGZvdXJjYyBoZWxwZXJzIGZvciBwYWNrZWQgWVVWNDIyIGNoZWNrCj4gPgo+
ID4gQW5kIG1vc3QgZGVmaW5pdGVseSBub3QgaW4gZHJtL3N1bjRpLiBZb3UgY2FuIG9ubHkgaGl0
IHRoaXMgaWYgeW91IGhhdmUKPiA+IHN1bjRpIGFuZCBydW4gb24gYXJtLCB3aGljaCBwZXIgeW91
ciBjb25maWcgaXNuJ3QgdGhlIGNhc2UuCj4gPgo+ID4gdGxkcjsgc21lbGxzIGxpa2UgYmlzZWN0
IGdvbmUgd3JvbmcuCj4gPiAtRGFuaWVsCj4gCj4gRnJvbSB0aGUgYmlzZWN0aW9uIGxvZyBpdCBs
b29rcyBsaWtlIHRoZSBidWcgaXMgdG9vIGhhcmQgdG8gdHJpZ2dlcgo+IGZvciByZWxpYWJsZSBi
aXNlY3Rpb24uIFNvIGl0IHByb2JhYmx5IGNsYXNzaWZpZWQgb25lIGJhZCBjb21taXQgYXMKPiBn
b29kLiBCdXQgaXQgc2hvdWxkIGdvdCBxdWl0ZSBjbG9zZSB0byB0aGUgcmlnaHQgb25lLgoKV2Vs
bCBzdGF0aXN0aWNhbGx5IGl0J2xsIGdldCBjbG9zZSwgc2luY2UgdGhlcmUncyBhIGZhaXIgY2hh
bmNlIHRoYXQgaXQncwpvbmUgb2YgdGhlIGxhdGVyIGJpc2VjdCByZXN1bHRzIHRoYXQgZ290IG1p
c2NoYXJhY3Rlcml6ZWQuCgpCdXQgeW91IGNhbiBiZSBlcXVhbGx5IHVubHVja3ksIGFuZCBpZiBp
dCdzIG9uZSBvZiB0aGUgZWFybGllcnMsIHRoZW4gaXQKY2FuIGVhc2lseSBiZSBhIGZldyB0aG91
c2FuZCBjb21taXRzIG9mLiBMb29raW5nIGF0IHRoZSBsb2cgaXQncyBtb3N0bHkKYmFkLCB3aXRo
IGEgZmV3IGdvb2Qgc3ByaW5rbGVkIGluLCB3aGljaCBjb3VsZCBqdXN0IGJlIHJlcHJvZHVjdGlv
bgpmYWlsdXJlcy4gU28gbWlnaHQgdmVyeSB3ZWxsIGJlIHRoYXQgdGhlIHZlcnkgZmlyc3QgImdv
b2QiIHJlc3VsdCBpcwp3cm9uZy4gQW5kIHRoYXQgdmVyeSBmaXJzdCAiZ29vZCIgZGVjaXNpb24g
Y3V0cyBhd2F5IGEgYmlnIHBpbGUgb2YgYnBmCnJlbGF0ZWQgY29tbWl0cy4gVGhlIG5leHQgImdv
b2QiIGRlY2lzaW9uIHRoZW4gb25seSBjdXRzIGF3YXkgYSBwaWxlIG9mCmRybSBjb21taXRzLCBi
dXQgYXQgdGhhdCBwb2ludCB5b3UncmUgYWxyZWFkeSBvZmYgdGhlIHJhaWxzIG1vc3QgbGlrZWx5
LgoKSSdkIHNheSByZS10ZXN0IG9uIGY5MGQ2NDQ4M2ViZDM5NDk1ODg0MWY2N2Y4Nzk0YWIyMDNi
MzE5YTcgYSBmZXcgdGltZXMsCkknbSB3aWxsaW5nIHRvIGJldCB0aGF0IG9uZSBpcyBhY3R1YWxs
eSBiYWQuCgpDaGVlcnMsIERhbmllbAoKPiAKPiA+ID4gYmlzZWN0aW9uIGxvZzogIGh0dHBzOi8v
c3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvYmlzZWN0LnR4dD94PTE0Njc1NTBmMjAwMDAwCj4gPiA+
IGZpbmFsIGNyYXNoOiAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcG9ydC50
eHQ/eD0xNjY3NTUwZjIwMDAwMAo+ID4gPiBjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9zeXprYWxs
ZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9MTI2NzU1MGYyMDAwMDAKPiA+ID4KPiA+ID4gSU1Q
T1JUQU5UOiBpZiB5b3UgZml4IHRoZSBidWcsIHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0YWcg
dG8gdGhlIGNvbW1pdDoKPiA+ID4gUmVwb3J0ZWQtYnk6IHN5emJvdCsyZmYxZTdjYjczOGZkM2M0
MTExM0BzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gPiA+IEZpeGVzOiAwZmZmNzI0YTMzOTEg
KCJkcm0vc3VuNGk6IGJhY2tlbmQ6IFVzZSBleHBsaWNpdCBmb3VyY2MgaGVscGVycyBmb3IKPiA+
ID4gcGFja2VkIFlVVjQyMiBjaGVjayIpCj4gPiA+Cj4gPiA+IFdBUk5JTkc6IENQVTogMCBQSUQ6
IDg5NTEgYXQga2VybmVsL2JwZi9jb3JlLmM6ODUxIGJwZl9qaXRfZnJlZSsweDE1Ny8weDFiMAo+
ID4gPiBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogcGFuaWNfb25fd2FybiBzZXQgLi4uCj4g
PiA+IENQVTogMCBQSUQ6IDg5NTEgQ29tbToga3dvcmtlci8wOjAgTm90IHRhaW50ZWQgNS4yLjAt
cmMzKyAjMjMKPiA+ID4gSGFyZHdhcmUgbmFtZTogR29vZ2xlIEdvb2dsZSBDb21wdXRlIEVuZ2lu
ZS9Hb29nbGUgQ29tcHV0ZSBFbmdpbmUsIEJJT1MKPiA+ID4gR29vZ2xlIDAxLzAxLzIwMTEKPiA+
ID4gV29ya3F1ZXVlOiBldmVudHMgYnBmX3Byb2dfZnJlZV9kZWZlcnJlZAo+ID4gPiBDYWxsIFRy
YWNlOgo+ID4gPiAgX19kdW1wX3N0YWNrIGxpYi9kdW1wX3N0YWNrLmM6NzcgW2lubGluZV0KPiA+
ID4gIGR1bXBfc3RhY2srMHgxNzIvMHgxZjAgbGliL2R1bXBfc3RhY2suYzoxMTMKPiA+ID4gIHBh
bmljKzB4MmNiLzB4NzQ0IGtlcm5lbC9wYW5pYy5jOjIxOQo+ID4gPiAgX193YXJuLmNvbGQrMHgy
MC8weDRkIGtlcm5lbC9wYW5pYy5jOjU3Ngo+ID4gPiAgcmVwb3J0X2J1ZysweDI2My8weDJiMCBs
aWIvYnVnLmM6MTg2Cj4gPiA+ICBmaXh1cF9idWcgYXJjaC94ODYva2VybmVsL3RyYXBzLmM6MTc5
IFtpbmxpbmVdCj4gPiA+ICBmaXh1cF9idWcgYXJjaC94ODYva2VybmVsL3RyYXBzLmM6MTc0IFtp
bmxpbmVdCj4gPiA+ICBkb19lcnJvcl90cmFwKzB4MTFiLzB4MjAwIGFyY2gveDg2L2tlcm5lbC90
cmFwcy5jOjI3Mgo+ID4gPiAgZG9faW52YWxpZF9vcCsweDM3LzB4NTAgYXJjaC94ODYva2VybmVs
L3RyYXBzLmM6MjkxCj4gPiA+ICBpbnZhbGlkX29wKzB4MTQvMHgyMCBhcmNoL3g4Ni9lbnRyeS9l
bnRyeV82NC5TOjk4Ngo+ID4gPiBSSVA6IDAwMTA6YnBmX2ppdF9mcmVlKzB4MTU3LzB4MWIwCj4g
PiA+IENvZGU6IDAwIGZjIGZmIGRmIDQ4IDg5IGZhIDQ4IGMxIGVhIDAzIDgwIDNjIDAyIDAwIDc1
IDVkIDQ4IGI4IDAwIDAyIDAwIDAwCj4gPiA+IDAwIDAwIGFkIGRlIDQ4IDM5IDQzIDcwIDBmIDg0
IDA1IGZmIGZmIGZmIGU4IGY5IGI1IGY0IGZmIDwwZj4gMGIgZTkgZjkgZmUgZmYKPiA+ID4gZmYg
ZTggYmQgNTMgMmQgMDAgZTkgZDkgZmUgZmYgZmYgNDggODkgN2QgZTAgZTgKPiA+ID4gUlNQOiAw
MDE4OmZmZmY4ODgwODg4NmZjYjAgRUZMQUdTOiAwMDAxMDI5Mwo+ID4gPiBSQVg6IGZmZmY4ODgw
OGNiNmM0ODAgUkJYOiBmZmZmODg4MDkwNTFkMjgwIFJDWDogZmZmZmZmZmY4MTdhZTY4ZAo+ID4g
PiBSRFg6IDAwMDAwMDAwPiA+Cj4gPgo+ID4gLS0KPiA+IERhbmllbCBWZXR0ZXIKPiA+IFNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
PiA+Cj4gPiAtLQo+ID4gWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUg
c3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAic3l6a2FsbGVyLWJ1Z3MiIGdyb3VwLgo+
ID4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFp
bHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBzeXprYWxsZXItYnVncyt1bnN1YnNjcmliZUBn
b29nbGVncm91cHMuY29tLgo+ID4gVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhlIHdlYiB2
aXNpdCBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvc3l6a2FsbGVyLWJ1Z3MvMjAx
OTA2MTEwODA0MzEuR1AyMTIyMiU0MHBoZW5vbS5mZndsbC5sb2NhbC4KPiA+IEZvciBtb3JlIG9w
dGlvbnMsIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9vcHRvdXQuMDAwMDAwMDAg
UlNJOiBmZmZmZmZmZjgxN2JmMGY3IFJESTogZmZmZjg4ODA5MDUxZDJmMAo+ID4gPiBSQlA6IGZm
ZmY4ODgwODg4NmZjZDAgUjA4OiAxZmZmZmZmZmYxNGNjYWE4IFIwOTogZmZmZmZiZmZmMTRjY2Fh
OQo+ID4gPiBSMTA6IGZmZmZmYmZmZjE0Y2NhYTggUjExOiBmZmZmZmZmZjhhNjY1NTQ3IFIxMjog
ZmZmZmM5MDAwMTkyNTAwMAo+ID4gPiBSMTM6IGZmZmY4ODgwOTA1MWQyZTggUjE0OiBmZmZmODg4
MGEwZTQzOTAwIFIxNTogZmZmZjg4ODBhZTgzNDg0MAo+ID4gPiAgYnBmX3Byb2dfZnJlZV9kZWZl
cnJlZCsweDI3YS8weDM1MCBrZXJuZWwvYnBmL2NvcmUuYzoxOTg0Cj4gPiA+ICBwcm9jZXNzX29u
ZV93b3JrKzB4OTg5LzB4MTc5MCBrZXJuZWwvd29ya3F1ZXVlLmM6MjI2OQo+ID4gPiAgd29ya2Vy
X3RocmVhZCsweDk4LzB4ZTQwIGtlcm5lbC93b3JrcXVldWUuYzoyNDE1Cj4gPiA+ICBrdGhyZWFk
KzB4MzU0LzB4NDIwIGtlcm5lbC9rdGhyZWFkLmM6MjU1Cj4gPiA+ICByZXRfZnJvbV9mb3JrKzB4
MjQvMHgzMCBhcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TOjM1Mgo+ID4gPiBLZXJuZWwgT2Zmc2V0
OiBkaXNhYmxlZAo+ID4gPiBSZWJvb3RpbmcgaW4gODY0MDAgc2Vjb25kcy4uCgotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
