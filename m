Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E25A114D70
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E6D6F98C;
	Fri,  6 Dec 2019 08:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0126F8A4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:45:34 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id a10so3873024qko.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 08:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBet/bIZobzEfIAUk75Ti4RAy8XooAiOYVqu+hnKHI4=;
 b=FUC8RhMaXPQMrwhOcvtNIc6FPUHCDZ/zw61dR0dd9+uGJl+xa8yt5JLXCsVLMIIo+h
 UHHnMbmpq/6AaZ80M9zTu6yF17SmfJ9OErC6tZiK5J9x7YCMExWRurAVX7rmtD+woouO
 qQ/+r+JraGCe8Rp6OgfsgSp10M74h1UXBWSjgafCfm85xlnEb8Y0RZNV0ic15uYqcW9H
 BJ/uzphu4q87yKh2rlcTlqfoJYIoaJT7HAJy5whbLSp4MXmwBzEVifLsZLfDzL30r0ua
 hWk/YhRwai72Tt/Y2RO0OviBM++INopJkqsaBcdK7VAINzEAlEfGTfzDY0z8Y0T+fv1S
 AEmQ==
X-Gm-Message-State: APjAAAX8h0Igg/7wWYmTPWFB1fQaKtIXKf4ustZh1XGLrFc8I4n3s9p9
 A2ic2kPGnLwRGwS02SmbzVRwCBWgDjo0jL+G970KNA==
X-Google-Smtp-Source: APXvYqwerl8XImN73VXaOFe2fMFNwgUDm+1VNfq91ocV1c1p8hyv/IzbQRvKMuNsJzHUygG2fax8WM/w50U/rYGR52g=
X-Received: by 2002:a37:4782:: with SMTP id u124mr9350911qka.8.1575564333504; 
 Thu, 05 Dec 2019 08:45:33 -0800 (PST)
MIME-Version: 1.0
References: <0000000000006dff110598d25a9b@google.com>
 <000000000000bcf3bc0598f5090d@google.com>
 <CAKMK7uF4AR_tRxt5wBKxzz6gTPJmub3A=xyuh1HjgvfYy7RCBg@mail.gmail.com>
In-Reply-To: <CAKMK7uF4AR_tRxt5wBKxzz6gTPJmub3A=xyuh1HjgvfYy7RCBg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 5 Dec 2019 17:45:22 +0100
Message-ID: <CACT4Y+ZjQSvpZAnLkp6w8erqtraZGkXB2O84BFmcRN_Rm6fs3Q@mail.gmail.com>
Subject: Re: INFO: task hung in fb_open
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VBet/bIZobzEfIAUk75Ti4RAy8XooAiOYVqu+hnKHI4=;
 b=A18pMSgTuR1kAVWLezvNQ+EC+Hs0uA80wcQbNijo7N4Ix/7a1tU7cm7N2rQTw4+UIh
 4iu9LwCetkxoehhPs7t16hTAq9W521UwYRXB7Oghj57ECN6X9Vm4oW/V/63y5P7TFOca
 cdCKN1/ogTkKEMpDrbuQ1kfOdnt/uuSZ8+H6wxmmDpUO4ZHIpj7/dB3e7eA5Er0Rw9i/
 Kri3ArIiSLagbh3J+2/x26uyTcnlse9wn8f2gKYoWac2Geb3AZL7OqZQIag7zXzGzLaH
 jBZY5/CBTf3qF62jLSljdr+O2kMFLf/+AQ4JBm8+zGkBKIQOYwgN538tjP+91dB3/rdY
 nHBQ==
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Dave Airlie <airlied@linux.ie>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ayan Kumar Halder <ayan.halder@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 syzbot <syzbot+a4ae1442ccc637162dc1@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgNSwgMjAxOSBhdCAzOjA1IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgNSwgMjAxOSBhdCAyOjM4IFBNIHN5
emJvdAo+IDxzeXpib3QrYTRhZTE0NDJjY2M2MzcxNjJkYzFAc3l6a2FsbGVyLmFwcHNwb3RtYWls
LmNvbT4gd3JvdGU6Cj4gPgo+ID4gc3l6Ym90IGhhcyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKPiA+
Cj4gPiBjb21taXQgOTc5YzExZWYzOWNlZTc5ZDZmNTU2MDkxYTM1Nzg5MDk2MmJlMjU4MAo+ID4g
QXV0aG9yOiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4KPiA+IERhdGU6
ICAgVHVlIEp1bCAxNyAxNzoxMzo0NiAyMDE4ICswMDAwCj4gPgo+ID4gICAgICBkcm0vc3VuNGk6
IFN1YnN0aXR1dGUgc3VuNGlfYmFja2VuZF9mb3JtYXRfaXNfeXV2KCkgd2l0aCBmb3JtYXQtPmlz
X3l1dgo+Cj4gUHJldHR5IHN1cmUgeW91ciBHQ0QgbWFjaGluZSBpcyBub3QgdXNpbmcgdGhlIHN1
bjRpIGRyaXZlci4gSXQncyBhbHNvCj4gdmVyeSBmYXIgYXdheSBmcm9tIHRoZSBjb2RlIHRoYXQn
cyBibG93aW5nIHVwLiBiaXNlY3QgZ29uZSB3cm9uZz8KPiAtRGFuaWVsCgpZZXMsIHRoaXMgZHJp
dmVyIGlzIG5vdCBldmVuIGVuYWJsZWQgaW4gdGhlIGNvbmZpZy4KSSBzZWUgMiBpc3N1ZXMgd2l0
aCBrZXJuZWwgaW4gdGhlIGJpc2VjdCBsb2c6CjEuIFVucmVsYXRlZCBtYWNoaW5lIGhhbmdzIGdl
dCBpbiB0aGUgd2F5IG9mIGJpc2VjdGlvbiBwcm9jZXNzIChvcgp0aGF0ICJubyBvdXRwdXQiIGFu
b3RoZXIgbWFuaWZlc3RhdGlvbiBvZiB0aGlzIGJ1Zz8pLgoyLiBTb21laG93IHRoaXMgY2hhbmdl
IHRvIG5vdCBjb21waWxlZCBmaWxlIGNoYW5nZWQgdm1saW51eCB0aHVzCmRldGVjdGlvbiBvZiB1
bnJlbGF0ZWQgY2hhbmdlcyBmYWlsZWQuIE5vbi1kZXRlcm1pbmlzdGljIGtlcm5lbCBidWlsZHMK
aXNzdWUgaXMgdHJhY2tlZCBoZXJlOgpodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xlL3N5emthbGxl
ci9pc3N1ZXMvMTI3MSNpc3N1ZWNvbW1lbnQtNTU5MDkzMDE4CmJ1dCBzbyBmYXIgSSBkb24ndCBo
YXZlIGFueSBnbHVlcy9pZGVhcy4KCgo+ID4gYmlzZWN0aW9uIGxvZzogIGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3gvYmlzZWN0LnR4dD94PTE1ZDJmOTdlZTAwMDAwCj4gPiBzdGFydCBj
b21taXQ6ICAgNTk2Y2Y0NWMgTWVyZ2UgYnJhbmNoICdha3BtJyAocGF0Y2hlcyBmcm9tIEFuZHJl
dykKPiA+IGdpdCB0cmVlOiAgICAgICB1cHN0cmVhbQo+ID4gY29uc29sZSBvdXRwdXQ6IGh0dHBz
Oi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTEzZDJmOTdlZTAwMDAwCj4gPiBr
ZXJuZWwgY29uZmlnOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC8uY29uZmlnP3g9
N2Q4YWIyZTBlMDljMmE4Mgo+ID4gZGFzaGJvYXJkIGxpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFw
cHNwb3QuY29tL2J1Zz9leHRpZD1hNGFlMTQ0MmNjYzYzNzE2MmRjMQo+ID4gc3l6IHJlcHJvOiAg
ICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8uc3l6P3g9MTQyNzNlZGFl
MDAwMDAKPiA+IEMgcmVwcm9kdWNlcjogICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94
L3JlcHJvLmM/eD0xNWU3Njc3YWUwMDAwMAo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBzeXpib3QrYTRh
ZTE0NDJjY2M2MzcxNjJkYzFAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+ID4gRml4ZXM6IDk3
OWMxMWVmMzljZSAoImRybS9zdW40aTogU3Vic3RpdHV0ZSBzdW40aV9iYWNrZW5kX2Zvcm1hdF9p
c195dXYoKQo+ID4gd2l0aCBmb3JtYXQtPmlzX3l1diIpCj4gPgo+ID4gRm9yIGluZm9ybWF0aW9u
IGFib3V0IGJpc2VjdGlvbiBwcm9jZXNzIHNlZTogaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI2Jpc2Vj
dGlvbgo+Cj4KPgo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgo+ICs0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKPgo+IC0tCj4gWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vi
c2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAic3l6a2FsbGVyLWJ1Z3MiIGdyb3VwLgo+IFRv
IHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZy
b20gaXQsIHNlbmQgYW4gZW1haWwgdG8gc3l6a2FsbGVyLWJ1Z3MrdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbS4KPiBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0
dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9zeXprYWxsZXItYnVncy9DQUtNSzd1RjRB
Ul90Unh0NXdCS3h6ejZnVFBKbXViM0ElM0R4eXVoMUhqZ3ZmWXk3UkNCZyU0MG1haWwuZ21haWwu
Y29tLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
