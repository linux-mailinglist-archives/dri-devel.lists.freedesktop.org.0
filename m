Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2273CF90B3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 14:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9446E448;
	Tue, 12 Nov 2019 13:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61ED26E448
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 13:32:42 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id n14so14718219oie.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 05:32:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6sESLXdiNjTavsS1FeYmO4SoKaiVXa9XD2s4kf8u8xk=;
 b=GgHKsFG1x87LXE6SNAu+mLZKozNAkMUvmHoC7HCiZPR6yIMaDRUpeM5J9DBE7GoCmW
 19EydzZdBFx/COalm1R7Jhj58W0bzDHfxBdQXSm4CA+BA69Y72OEgrFA2JnH3wH/emai
 MYrjRh1J2v+YkrTx/JzX07StAMPL6XTgLTvWNxzTRbaAwxpFZNHNp38INCwrSVtyPUtu
 Ge+h2ScUdK5cb/7YKppMBnlrjB8Xm+73CQK1LtkiPYOysFVTGAnLOEVKhRR44oEwDqKU
 zcVo5SXF2Cgezv6Ndsu37hYr+iFywJQ2dqSfuyOXvRUoosDsGlRW0PTfjt0a3QjdpCCb
 gjeQ==
X-Gm-Message-State: APjAAAWS3yOvrfxWQ+f8p75YD4RmV+z3dJfhzDluS8RCyXG33xwaoDaN
 xo2157Sx4lIv4OC5U80uplBrpWKxY1KRtecv9+hI+Q==
X-Google-Smtp-Source: APXvYqxpVGa0HW1pAiYf5Q1P5q5PrI6ngrYwz/dpEVHoKnqL+fVOF/rz8kBW58LWMNmcy7lR7X+dR2bHFpNHBqIkWU4=
X-Received: by 2002:aca:3889:: with SMTP id f131mr4120383oia.14.1573565561613; 
 Tue, 12 Nov 2019 05:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20191110154101.26486-1-hdegoede@redhat.com>
 <20191110154101.26486-13-hdegoede@redhat.com>
 <20191112094712.GH23790@phenom.ffwll.local>
 <13ce5629-045a-7d70-ecfa-7acdfada9d1f@redhat.com>
In-Reply-To: <13ce5629-045a-7d70-ecfa-7acdfada9d1f@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 12 Nov 2019 14:32:30 +0100
Message-ID: <CAKMK7uHHNz6TZViHEk9ycNp752jSQoqV=WHBoTnUh_e10a-_EQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] drm/connector: Hookup the new drm_cmdline_mode
 panel_orientation member
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6sESLXdiNjTavsS1FeYmO4SoKaiVXa9XD2s4kf8u8xk=;
 b=Qi5DWFrwo7PWl09acaXZIiWPsZRPPx/odkXsQAlAEgqbsf2M0aC7enTLjzh625wEXU
 GxISjc0bIE1dhJzt5VmKPhu7cpInvAaR3aMwtN/iRDd1cXmIDyD0MUL8e/ExfU5kUiug
 UtX+jQ/2sa8ckMM8mAzaB85CJeK05HCj/5hm0=
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
 =?UTF-8?Q?Mathieu_Alexandre=2DT=C3=A9treault?= <alexandretm@amotus.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTE6NDMgQU0gSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIDEyLTExLTIwMTkgMTA6NDcsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBTdW4sIE5vdiAxMCwgMjAxOSBhdCAwNDo0MTowMVBNICsw
MTAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+ID4+IElmIHRoZSBuZXcgdmlkZW89Li4uIHBhbmVs
X29yaWVudGF0aW9uIG9wdGlvbiBpcyBzZXQgZm9yIGEgY29ubmVjdG9yLCBob25vcgo+ID4+IGl0
IGFuZCBzZXR1cCBhIG1hdGNoaW5nICJwYW5lbCBvcmllbnRhdGlvbiIgcHJvcGVydHkgb24gdGhl
IGNvbm5lY3Rvci4KPiA+Pgo+ID4+IEJ1Z0xpbms6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9wbHltb3V0aC9wbHltb3V0aC9tZXJnZV9yZXF1ZXN0cy84Mwo+ID4+IFNpZ25lZC1vZmYt
Ynk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gPgo+ID4gRG9uJ3Qgd2Ug
bmVlZCBvbmUgbW9yZSBwYXRjaCBoZXJlIHRvIGNyZWF0ZSB0aGUgcGFuZWwgb3JpZW50YXRpb24g
cHJvcGVydHkKPiA+IGlmIHRoZSBkcml2ZXIgZG9lc24ndCBkbyBpdD8gT3RoZXJ3aXNlIHRoaXMg
d29uJ3QgaGFwcGVuLCBhbmQgdXNlcnNwYWNlCj4gPiBjYW4ndCBsb29rIGF0IGl0IChvbmx5IHRo
ZSBpbnRlcm5hbCBmYmRldiBzdHVmZiwgd2hpY2ggaGFzIGl0J3Mgb3duCj4gPiBsaW1pdGF0aW9u
cyB3cnQgcm90YXRpb24pLgo+Cj4gVGhhdCBpcyB3aGF0IHBhdGNoIDExLzEyIGlzIGZvciwgdGhh
dCBwYXRjaCByZW5hbWVzIGRybV9jb25uZWN0b3JfaW5pdF9wYW5lbF9vcmllbnRhdGlvbgo+IHRv
IGRybV9zZXRfcGFuZWxfb3JpZW50YXRpb24gYW5kIG1ha2VzIGl0IGJvdGggc2V0LCBpbml0IGFu
ZCBhdHRhY2ggdGhlIHByb3BlcnR5Cj4gKHVubGVzcyBjYWxsZWQgd2l0aCBEUk1fTU9ERV9QQU5F
TF9PUklFTlRBVElPTl9VTktOT1dOIGluIHdoaWNoIGNhc2UgaXQgaXMgYSBuby1vcCkuCj4KPiBQ
YXRjaCAxMS8xMiBhbHNvIG1ha2VzIGRybV9zZXRfcGFuZWxfb3JpZW50YXRpb24gZG8gdGhlIHNl
dCBvbmx5IG9uY2UsIHdoaWNoIGlzIHdoeQo+IHRoZSBvcmllbnRhdGlvbiB0byBzZXQgaXMgbm93
IHBhc3NlZCBpbnN0ZWFkIG9mIHN0b3JlZCBkaXJlY3RseSBpbiB0aGUgY29ubmVjdG9yLAo+IHNv
IHRoYXQgYSBzZWNvbmQgc2V0IGNhbGwgKHBhbmVsX29yaWVudGF0aW9uIG9mIHRoZSBjb25uZWN0
b3IgYWxyZWFkeSAhPQo+IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV04pIGNhbiBi
ZSBza2lwcGVkLCBzbyB0aGF0IHRoZSBjbWRsaW5lIG92ZXJyaWRlcwo+IGRyaXZlciBkZXRlY2lv
biBjb2RlIGZvciB0aGlzLgoKT2gsIHRoYXQncyB3aGF0IEkgZ2V0IGZvciBub3QgcmVhZGluZyB0
aGUgZW50aXJlIHNlcmllcyAuLi4gT25seSByaXNrCndpdGggdGhhdCBpcyB0aGF0IGRyaXZlcnMg
c2V0IHRoaXMgcHJvcGVydHkgYWZ0ZXIgZHJpdmVyIGxvYWRpbmcgaXMKZG9uZSAtIHdlIGNhbid0
IGF0dGFjaC9jcmVhdGUgcHJvcGVydGllcyBhZnRlciBkcm1fZGV2X3JlZ2lzdGVyLiBCdXQKSSd2
ZSBhZGRlZCB0aGUgY29ycmVzcG9uZGluZyBXQVJOX09OIHRvIHRoZXNlLCBzbyB3ZSBzaG91bGQg
YmUgYWxsCmZpbmUgSSB0aGluay4gU28gbG9va3MgYWxsIGdvb2QgdG8gbWUuCi1EYW5pZWwKCj4K
PiBSZWdhcmRzLAo+Cj4gSGFucwo+Cj4KPgo+ID4gLURhbmllbAo+ID4KPiA+PiAtLS0KPiA+PiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCA3ICsrKysrKysKPiA+PiAgIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3Iu
Ywo+ID4+IGluZGV4IDQwYTk4NWM0MTFhNi4uNTkxOTE0ZjAxY2Q0IDEwMDY0NAo+ID4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2Nvbm5lY3Rvci5jCj4gPj4gQEAgLTE0MCw2ICsxNDAsMTMgQEAgc3RhdGljIHZvaWQg
ZHJtX2Nvbm5lY3Rvcl9nZXRfY21kbGluZV9tb2RlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCj4gPj4gICAgICAgICAgICAgIGNvbm5lY3Rvci0+Zm9yY2UgPSBtb2RlLT5mb3JjZTsK
PiA+PiAgICAgIH0KPiA+Pgo+ID4+ICsgICAgaWYgKG1vZGUtPnBhbmVsX29yaWVudGF0aW9uICE9
IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV04pIHsKPiA+PiArICAgICAgICAgICAg
RFJNX0lORk8oInNldHRpbmcgY29ubmVjdG9yICVzIHBhbmVsX29yaWVudGF0aW9uIHRvICVkXG4i
LAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICBjb25uZWN0b3ItPm5hbWUsIG1vZGUtPnBhbmVs
X29yaWVudGF0aW9uKTsKPiA+PiArICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9zZXRfcGFuZWxf
b3JpZW50YXRpb24oY29ubmVjdG9yLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtb2RlLT5wYW5lbF9vcmllbnRhdGlvbik7Cj4gPj4gKyAgICB9
Cj4gPj4gKwo+ID4+ICAgICAgRFJNX0RFQlVHX0tNUygiY21kbGluZSBtb2RlIGZvciBjb25uZWN0
b3IgJXMgJXMgJWR4JWRAJWRIeiVzJXMlc1xuIiwKPiA+PiAgICAgICAgICAgICAgICAgICAgY29u
bmVjdG9yLT5uYW1lLCBtb2RlLT5uYW1lLAo+ID4+ICAgICAgICAgICAgICAgICAgICBtb2RlLT54
cmVzLCBtb2RlLT55cmVzLAo+ID4+IC0tCj4gPj4gMi4yMy4wCj4gPj4KPiA+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiA+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+Cj4K
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
KzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
