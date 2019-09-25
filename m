Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 676F5BE23F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 18:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAB16E07D;
	Wed, 25 Sep 2019 16:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F916E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 16:17:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 3so5635548wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 09:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M1f7SIZ1zdLjIX6N/2ZkHUApNSXro2f5v3j0s4jRGoU=;
 b=iqeAO38AvUVGg6Icx6pomWNKyYiWqgmgVEtE+OpYJqo1+YKA6WtJxpXhNzMPNXfzbV
 kz5L4KqC7x/NtPz+79q+Zmy1SdEuB4LGFbUDFS1PLjwjFZI8Q2UwDFhdOfpxxM5FVQiu
 EsZDAYwynPqCwntVhbFanzScoqv/uV78a9gLJWA4x4jrf+zUDJgEXlWCMZsRC9/du//O
 NC2V2dNiGADeujrWYXI+BIARs87RKHXch+dRfAvCemTTKs4KqhL19oNXxofobY7RFCBA
 B2yXmUymn63EBgO2+Pm4vP/67iQCXyGVtCDn3s4DlRqFk152PGxTqi+oR4cHYv+1OsEm
 V23g==
X-Gm-Message-State: APjAAAXZY9zHh7bm8RUowRRxhA7efNnq4hUw1ZQL1msQxdyeqtUpzmgk
 CFoET94paKO1aNQKDNDgoOgnovR0fmlAoEGnj90s4g==
X-Google-Smtp-Source: APXvYqxQyvWfx7dqga46yAHcXVInOJcyL3RE0I64BgP8/eSD+SR8CKB3a+RuTLB5mgcm5CdeNJykJLWXQiTt4cYguXU=
X-Received: by 2002:a1c:4485:: with SMTP id r127mr8281844wma.59.1569428264759; 
 Wed, 25 Sep 2019 09:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190924212920.76103-1-john.stultz@linaro.org>
 <CAL_JsqLR212Et5Z82Gr=DJfB5WY-4o8bN_s5peu07EnaEVEOYQ@mail.gmail.com>
 <CALAqxLUR5ML3gmBs3SM2GvfXB+JxiO7gTUrtpVJqVzuh+hugxg@mail.gmail.com>
 <CALAqxLWHrCKogRqe2ZQZT3dK57+8AmxKfZjKXxztvw6CFobdkg@mail.gmail.com>
 <20190925103909.6yjozclnukkladbo@intel.com>
In-Reply-To: <20190925103909.6yjozclnukkladbo@intel.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 25 Sep 2019 09:17:32 -0700
Message-ID: <CALAqxLXyTT8rzR4eQFGNWyz3heuvLTQ9B19e_2XA85qzCGnaHA@mail.gmail.com>
Subject: Re: [PATCH] libdrm: Convert to Android.mk to Android.bp
To: Eric Engestrom <eric.engestrom@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=M1f7SIZ1zdLjIX6N/2ZkHUApNSXro2f5v3j0s4jRGoU=;
 b=wQRKW/14ZzpEeYMKGQqduLKtVT054fMeuc6I3SEJzK99W4lkD3fgztGzjw+2zd198c
 x52Tk8BX8/IGdFek3uVrNQim34o+xt0MHL9TrUwVmoriUv3q/NnJ00hHRuAhAZiP+7zb
 j+Pyel02Rpr9/5+TGYaBmvZhKW+EJ+vKEfbAOAj+wmn27OuHLNCgY4OpwGHNRftSbSax
 AF4H24D6Bt5bYvcXUTUY1XglB9gDVkmEqQ4viSOiIH74lo0zDo6OqH+kstJpRKKxw5n1
 fSrk8VmF0rpDo5dxbh1BbTR8QPnWFeU1bEO/i811q2/uV2/gwGG0BONJ9eHQjt7E3c2Y
 vB9g==
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
Cc: Rob Clark <robdclark@chromium.org>, Jiyong Park <jiyong@google.com>,
 Robert Foss <robert.foss@collabora.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Eric Anholt <anholt@google.com>,
 Sean Paul <seanpaul@chromium.org>, Dan Willemsen <dwillemsen@google.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMzozOSBBTSBFcmljIEVuZ2VzdHJvbSA8ZXJpYy5lbmdl
c3Ryb21AaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZXNkYXksIDIwMTktMDktMjQgMjM6MDk6
MDggLTA3MDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gT24gVHVlLCBTZXAgMjQsIDIwMTkgYXQg
NDozMCBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+
IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDM6MjQgUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+ID4gVHJ5aW5nIHRvIG1haW50YWluIHNvbWV0aGluZyB0aGF0IHdv
cmtzIGFjcm9zcyBtb3JlIHRoYW4gMyByZWxlYXNlcyBvcgo+ID4gPiA+IHNvIGlzIHBhaW5mdWwu
IEkgZG9uJ3QgdGhpbmsgYW5kcm9pZC14ODYgZm9sa3MgaGF2ZSB0aGUgYmFuZHdpZHRoIHRvCj4g
PiA+ID4gbWFpbnRhaW4gdGhpbmdzIG9sZGVyIHRoYW4gdGhhdCAqYW5kKiB1cGRhdGUgdG8gbmV3
ZXIgdmVyc2lvbnMuIFNvIEkKPiA+ID4gPiB0aGluayBvbmx5IHN1cHBvcnRpbmcgdGhlIG4gbGF0
ZXN0IHJlbGVhc2VzIGlzIGdvb2QuCj4gPiA+ID4KPiA+ID4gPiBBcmUgLmJwIGZpbGVzIGZvciBt
YXN0ZXIvUSBjb21wYXRpYmxlIGJhY2sgdG8gTiAob3IgTyk/IElJUkMsIGF0IGxlYXN0Cj4gPiA+
ID4gZm9yIHRoZSBmaXJzdCBjb3VwbGUgb2YgcmVsZWFzZXMgd2l0aCAuYnAgZmlsZXMsIHRoZXkg
c2VlbWVkIHRvIGhhdmUKPiA+ID4gPiBpbmNvbXBhdGlibGUgY2hhbmdlcy4KPiA+ID4KPiA+ID4g
SSB0aGluayB0aGVyZSBoYXZlIHBvc3NpYmx5IGJlZW4gc29tZSBpbmNvbXBhdGlibGUgY2hhbmdl
cywgYXMgSSBrbm93Cj4gPiA+IGVhcmx5IHcvIGJwIGZpbGVzIHRoaW5ncyB3ZXJlIG1vcmUgaW4g
Zmx1eC4gVGhhdCBzYWlkLCB0aGVyZSBoYXZlbid0Cj4gPiA+IGJlZW4gbWFueSBjaGFuZ2VzIHRv
IHRoZSBsaWJkcm0gYnAgZmlsZXMgc2luY2UgdGhlIGNvbnZlcnNpb24gd2FzCj4gPiA+IGZpcnN0
IGRvbmUgaW4gMjAxNyAoc28gQW5kcm9pZCBPKS4gSSdsbCBjaGVja291dCBOIGFuZCB2YWxpZGF0
ZSBzbyBJCj4gPiA+IGNhbiBwcm92aWRlIGEgbW9yZSBjb25jcmV0ZSBhc3N1cmFuY2UuCj4gPgo+
ID4gQWguIENydWQuIFlvdSdyZSByaWdodC4gVGhlIGJwIHN5bnRheCBoYXMgc2hpZnRlZCBlbm91
Z2ggb3ZlciB0aW1lIHRvCj4gPiBjYXVzZSBwcm9ibGVtcyB3LyB0aGUgY3VycmVudCBmaWxlIHdo
ZW4gYnVpbGRpbmcgYWdhaW5zdCBvbGRlciBBbmRyb2lkCj4gPiByZWxlYXNlcy4gICBOIGZhbGxz
IG92ZXIgcHJldHR5IGhhcmQsIGFuZCBPIGFuZCBldmVuIFAgaGF2ZSBpc3N1ZXMgdy8KPiA+ICJy
ZWNvdmVyeV9hdmFpbGFibGU6ICIsIGFuZCAicHJlYnVpbHRfZXRjIiBzeW50YXguICBTbyBteSBw
cm9wb3NlZAo+ID4gY29tbWl0IG1lc3NhZ2UgbWlzY2hhcmFjdGVyaXplcyB0aGUgc3RhdGUgb2Yg
b2xkZXIgYnVpbGRzLiBBcG9sb2dpZXMhCj4gPgo+ID4gSSdsbCB0cnkgdG8gcmVhY2ggb3V0IHRv
IHRoZSBhbmRyb2lkIGRldnMgdG8gc2VlIGlmIHRoZXJlJ3MgYW55IHNvcnQKPiA+IG9mIGNvbXBh
dCBtYWdpYyB0aGF0IGNhbiBiZSBkb25lIHRvIGtlZXAgdGhpbmdzIHdvcmtpbmcgb24gb2xkZXIK
PiA+IHZlcnNpb25zLiBUaGF0IHNhaWQsIEknbSBzdGlsbCB0b3JuLCBhcyB3aXRob3V0IHRoaXMg
dGhlIGN1cnJlbnQKPiA+IGxpYmRybS9tYXN0ZXIgY29kZSBpcyBicm9rZW4gd2l0aCBBT1NQL21h
c3RlciBhbmQgUS4gIEl0cyBmcnVzdHJhdGluZwo+ID4gd2UgaGF2ZSB0byBoYXZlIHRoaXMgc2Vl
bWluZ2x5IGV4Y2x1c2l2ZSB0cmFkZSBvZmYuCj4gPgo+ID4gSSdtIGN1cmlvdXMgaWYgZm9sa3Mg
bWlnaHQgYmUgd2lsbGluZyB0byBjb25zaWRlciBzb21ldGhpbmcgbGlrZSBhbgo+ID4gdXBzdHJl
YW0gYnJhbmNoIHRvIHByZXNlcnZlIHRoZSBidWlsZCBiaXRzIHRoYXQgd29yayB3aXRoIHByaW9y
Cj4gPiBBbmRyb2lkIHJlbGVhc2VzPyBPciBhbnkgb3RoZXIgaWRlYXM/Cj4KPiBJcyBfbm90XyBk
ZWxldGluZyBBbmRyb2lkLm1rIGFuIG9wdGlvbj8KClllYSwgdGhlIHRyb3VibGUgaXMgTyBhbmQg
UCB3aWxsIHBpY2sgdXAgdGhlIEFuZHJvaWQuYnAgZmlsZXMgYnkKZGVmYXVsdCwgc28geW91J2Qg
c3RpbGwgc2VlIHRoZSBpc3N1ZXMgb3IgeW91J2QgcnVuIGludG8gZHVwbGljYXRlCnRhcmdldHMu
IEknbSBob3BpbmcgSSBjYW4gc3RpbGwgZmluZCBzb21lIGNvbmRpdGlvbmFsIG1hZ2ljIHRyaWNr
cyBmb3IKQW5kcm9pZC5icC4gIEkgbmVlZCB0byBsb29rIGF0IE1hdXJvJ3MgcGF0Y2hlcyB0aG91
Z2guCgo+IFRoYXQgd291bGQgaGF2ZSB0aGUgb2J2aW91cyBjb3N0IG9mIGR1cGxpY2F0aW5nIHRo
ZSBidWlsZCBzeXN0ZW0KPiBtYWludGVuYW5jZSBlZmZvcnQsIGJ1dCBpZiB0aGF0J3MgdGhlIG9u
bHkgd2F5IHRvIG5vdCBkcm9wIHN1cHBvcnQgZm9yCj4gZXZlcnl0aGluZyBiZWZvcmUgUS4uLgoK
WWVhLCBJJ20gbm90IGVhZ2VyIHRvIGhhdmUgdHdvIGFuZHJvaWQgYnVpbGQgc3lzdGVtcyBpbiB0
aGUgdHJlZS4KSGF2aW5nIGp1c3Qgb25lIGlzIGR1cGxpY2F0aXZlIGVub3VnaC4KCj4gKGZ3aXcs
IG15IGFjayBvbmx5IGFwcGxpZXMgd2l0aCAicmVhc29uYWJsZSIgc3VwcG9ydCBvZiBwcmV2aW91
cwo+IHZlcnNpb25zIDpdICkKCk9mIGNvdXJzZSwgSSdtIG5vdCBwbGFubmluZyBvbiBzdWJtaXR0
aW5nIHRoaXMgY2hhbmdlIGZ1cnRoZXIgdW50aWwgSQpjYW4gZmluZCBzb21ldGhpbmcgYmV0dGVy
LiAgQXBvbG9naWVzIGFnYWluIGZvciBteSBhc3N1bXB0aW9ucyB0aGF0IGl0CndvdWxkIHdvcmsg
d2l0aCBvbGRlciBicCBpbXBsZW1lbnRhdGlvbnMuICBNeSBvbmx5IGRlZmVuY2UgaXMsIGluCnRy
eWluZyB0byB2YWxpZGF0ZSB3LyBvbGRlciByZWxlYXNlcyB5ZXN0ZXJkYXksIG15IGJ1aWxkIHN5
c3RlbSBwdWxsZWQKZG93biAxMzVHIG9mIGRhdGEgYW5kIG5vdyBteSByZXBvIGlzIHNvbWVob3cg
dW5zaGFsbG93ZWQgYW5kIHRha2luZyA0CnRpbWVzIHRoZSBhbW91bnQgb2YgZGlzayBzcGFjZSBp
dCB3YXMgdXNpbmcgdy8ganVzdCBBT1NQL21hc3Rlci4gOlAgU28KdmFsaWRhdGluZyBhY3Jvc3Mg
QU9TUCB2ZXJzaW9ucyBpcyBubyB0cml2aWFsIHRoaW5nLgoKdGhhbmtzCi1qb2huCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
