Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F55C1444CC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 20:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A218A6E23B;
	Tue, 21 Jan 2020 19:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2506E233;
 Tue, 21 Jan 2020 19:05:46 +0000 (UTC)
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MFbeI-1iqAy63Efm-00H6sJ; Tue, 21 Jan 2020 20:05:44 +0100
Received: by mail-qk1-f175.google.com with SMTP id a203so3877264qkc.3;
 Tue, 21 Jan 2020 11:05:44 -0800 (PST)
X-Gm-Message-State: APjAAAWEw2/0d15Nq6cTQaDk65wdWBkOpIsx7vBNjX+hN9d9JhBJbiXp
 ixm6WXm4wfpO6MALDpV2bQ73oOuFi18XeAMR17I=
X-Google-Smtp-Source: APXvYqyaU3sy6AGbEoXLdnq29+FzpVOuAwUblCu5Mbol7hW7VGm2ZUaPtrW+mhS1VdIaACj0BnK5vyn61lQKFxY8lNk=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr6089006qka.286.1579633543424; 
 Tue, 21 Jan 2020 11:05:43 -0800 (PST)
MIME-Version: 1.0
References: <20200121114553.2667556-1-arnd@arndb.de>
 <20200121125546.GA71415@bogon.m.sigxcpu.org>
 <1971902c68ff805ee0b4a66f558afe06e6edf0c5.camel@pengutronix.de>
In-Reply-To: <1971902c68ff805ee0b4a66f558afe06e6edf0c5.camel@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Jan 2020 20:05:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2E__zHPPEL37JwK=uHb_v-=C+-+zGaL3XoW5PZ+BUN5g@mail.gmail.com>
Message-ID: <CAK8P3a2E__zHPPEL37JwK=uHb_v-=C+-+zGaL3XoW5PZ+BUN5g@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: only reject timeouts with tv_nsec >= 2
 seconds
To: Lucas Stach <l.stach@pengutronix.de>
X-Provags-ID: V03:K1:duvJN4iDNxtF/gZzSkoV27+pPD6ywwLUzaCOCKuDGGalNe7L1rB
 ClEavxghKrfVB6nhrgfbnDJz4+Av8t/qfYK1RiVVDKRxqtI9n0Fd4pY18VeAfMpZCYrlD8Q
 slbYxzQpJDBGRjV8uf8G/HoJ6/1Ryn8QjbptrZdI6J8833q3e3IFPtQTJxPBYXYRNG7NoaO
 +TjZC/nPVFs696cUZI8Bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k3IQ2qB73Yg=:tSh0pokkRn6v4+6e3+1htU
 sVUrDWAmH21TdA1mhqgv9o16wGQ190cUXo6rmktBhQ43h2sKlxdtkCxpGKvD57V2u5Dcfn3gO
 Yq7913X8+qMpg8CFtOLt1T7JGmxGmyodYt6Hxr9b8eNlV15VxaRzPrrAwRh88/fTDwTs4YQmR
 x+lNS+d1gmXM573stottTWOW7yvF6kQK9b1U64LUKz26gTqZbi4lb6WyoKxunmuLCdQ20Yzvd
 AAvQmgv/5KVgKI7qBO9dls78cOk4g+Hh6LKpLpLneeY0/y0YlrabIUI4GXSPWy0EsiBR3OG9p
 dVLWpCdu9Y6MllNLMbnOp3aBu8NuL2bYvDQb4Yc2TqGy4+6znBr+Uyq70tMutpxLg3GvP/f8W
 c1cw/a/DbdOM7k/vuqE8jQkQmKFEx0ZgDhbopMMhsGjZTO6H/ZrfppM7nn6zwurXce3Ljvz+c
 /TywMyHz7qsbJoLnf3VIa2xdsgTvJOZD1rdCRsC1iFxVQKRXAeNt6WX3VaBPYBexvIgWplvB0
 f04VVSWRrI+h3jKvUm/kBUlPMH5jS9HzzZlPJ/Z5nYqjmWbSFGehttHpwoDpnuN6KDNN3ReLE
 B2nCfowGv4lhO0R/AiK7YQk7fczvqlS6hW+DrXL6NFtcJskE6id0RE84Bk344CtUftImMvvlS
 glgPI/8VRFhDpnVAkCSzAGre/WigZQJHiPZTgR0HtH3ARy78knJvJDuHEkTT8tiDas6PIkCnk
 HEeP+5cfbMY/qPyOevHZOKU6oiRVll0ApdFtE8Xx7W1IvDjjdGnrlm+Ptqx1rbcLE5ub480kA
 OVAnh3tV3qWRBCCCMgsIAxsl4QFd9rcB2p1oJtcXqMzIjUFNP0Kl1whFPCzZAyVGlbDAn75Oi
 MoDmdQl275JGrhNo/4hQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgNToxMCBQTSBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5n
dXRyb25peC5kZT4gd3JvdGU6Cj4KPiBIaSBHdWlkbywKPgo+IE9uIERpLCAyMDIwLTAxLTIxIGF0
IDEzOjU1ICswMTAwLCBHdWlkbyBHw7xudGhlciB3cm90ZToKPiA+IEhpLAo+ID4gT24gVHVlLCBK
YW4gMjEsIDIwMjAgYXQgMTI6NDU6MjVQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+
ID4gQXMgR3VpZG8gR8O8bnRoZXIgcmVwb3J0ZWQsIGdldF9hYnNfdGltZW91dCgpIGluIHRoZSBl
dG5hdml2IHVzZXIgc3BhY2UKPiA+ID4gc29tZXRpbWVzIHBhc3NlcyB0aW1lb3V0cyB3aXRoIG5h
bm9zZWNvbmQgdmFsdWVzIGxhcmdlciB0aGFuIDEwMDAwMDAwMDAsCj4gPiA+IHdoaWNoIGdldHMg
cmVqZWN0ZWQgYWZ0ZXIgbXkgZmlyc3QgcGF0Y2guCj4gPiA+Cj4gPiA+IFRvIGF2b2lkIGJyZWFr
aW5nIHRoaXMsIHdoaWxlIGFsc28gbm90IGFsbG93aW5nIGNvbXBsZXRlbHkgYXJiaXRyYXJ5Cj4g
PiA+IHZhbHVlcywgc2V0IHRoZSBsaW1pdCB0byAxOTk5OTk5OTk5IGFuZCB1c2Ugc2V0X25vcm1h
bGl6ZWRfdGltZXNwZWM2NCgpCj4gPiA+IHRvIGdldCB0aGUgY29ycmVjdCBmb3JtYXQgYmVmb3Jl
IGNvbXBhcmluZyBpdC4KPiA+Cj4gPiBJJ20gc2VlaW5nIHZhbHVlcyB1cCB0byA1IHNlY29uZHMg
c28gSSBuZWVkCj4gPgo+ID4gICAgICBpZiAoYXJncy0+dGltZW91dC50dl9uc2VjID4gKDUgKiBO
U0VDX1BFUl9TRUMpKQo+ID4KPiA+IHRvIHVuYnJlYWsgcmVuZGVyaW5nLiBXaGljaCBzZWVtcyB0
byBtYXRjaCB3aGF0IG1lc2EncyBnZXRfYWJzX3RpbWVvdXQoKQo+ID4gZG9lcyBhbmQgaG93IGl0
J3MgaW52b2tlZC4KPgo+IEkgaGF2ZSBub3QgdGVzdGVkIHRoaXMgbXlzZWxmIHlldCwgb25seSBs
b29rZWQgYXQgdGhlIGNvZGUuIEZyb20gdGhlCj4gY29kZSBJIHF1b3RlZCBlYXJsaWVyLCBJIGRv
bid0IHNlZSBob3cgd2UgZW5kIHVwIHdpdGggNSAqIE5TRUNfUEVSX1NFQwo+IGluIHRoZSB0dl9u
c2VjIG1lbWJlciwgZXZlbiBpZiB0aGUgdGltZW91dCBwYXNzZWQgdG8gZ2V0X2Fic190aW1lb3V0
KCkKPiBpcyA1IHNlY29uZHMuCgpJIGNhbiB0aGluayBvZiB0d28gZGlmZmVyZW50IHdheXMgeW91
J2QgZW5kIHVwIHdpdGggYXJvdW5kIGZpdmUgc2Vjb25kcyBoZXJlOgoKYSkgeW91IGhhdmUgYSBj
b21wbGV0ZWx5IGFyYml0cmFyeSAzMi1iaXQgbnVtYmVyIHRocm91Z2ggdHJ1bmNhdGlvbiwKICAg
IHdoaWNoIGlzIHVwIHRvIDQuMiBzZWNvbmRzCmIpIHlvdSBoYXZlIHRoZSBzYW1lIGtpbmQgb2Yg
MzItYml0IG51bWJlciwgYnV0IGFkZCB1cCB0byBhbm90aGVyIDk5OTk5OTk5OQogICAgbmFub3Nl
Y29uZHMsIHNvIHlvdSBnZXQgdXAgdG8gNS4yIHNlY29uZHMgaW4gdGhlIDY0LWJpdCBmaWVsZC4K
Ckl0IGNvdWxkIG9mIGNvdXJzZSBiZSBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQuIElm
IHRoaXMgd29ya3MgY29ycmVjdGx5CnRvZGF5LCB3ZSBtYXkgbmVlZCB0byBhbGxvdyBhbnkgNjQt
Yml0IGlucHV0IGZvciB0aGUgbmFub3NlY29uZHMgYW5kIGRvCmFuIGV4cGVuc2l2ZSA2NC1iaXQg
ZGl2L21vZCBpbiB0aGUga2VybmVsIGZvciBub3JtYWxpemF0aW9uIHJhdGhlciB0aGFuIHRoZQpj
aGVhcGVyIHNldF9ub3JtYWxpemVkX3RpbWVzcGVjNjQoKSBmcm9tIG15IHBhdGNoLgoKICAgICAg
ICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
