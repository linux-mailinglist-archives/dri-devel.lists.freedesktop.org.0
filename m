Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B8FD931E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 15:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EF66E3A2;
	Wed, 16 Oct 2019 13:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A966E3A2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 13:56:00 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id v2so2667296ilm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 06:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9evKAakxTzcQ7kdnAG8O0duW0PQfeoTSmI1HDrhmXzs=;
 b=s+j+FgN5a/iaG2zV7agHoT8s2JqNY5bviwyNVpxQvAc+WNCvP70w/uMzkCl5RjsPdF
 1cmEPsQCCGEcnJiaFGoVij8e501RVWHpD/XOlCmsER+8ox3CgCrIn/JxTVfmtVlPHoDA
 yrTZcPh8xE67eyA1HNrxsObUKrUtKlYfhPsUUgApTxbh8GshoTzPXqjHm2eOJKlvimMI
 bBWxlOXKmESJxGGafZS2QExPQJ4PWfpdKi4K7x1yjmciN+V++C6fgT0ohlSBSDmmMIDC
 5vIfu1W4mU6kpNzyZ5LgObGwVBQBmVQBtBf2QwKoR2OMGVNXWbQu7NhZuKGE39yqMy+A
 iNGQ==
X-Gm-Message-State: APjAAAVdZDeYNCvqc4C4Uh4+Ps5L9Pm8KX2pNEqaaVPwulq4nZq48GDu
 nOf1a/zDBWJPhOtVMeHBqKxyiB+2fQ7hGuiEcEM=
X-Google-Smtp-Source: APXvYqz6T1Cj2dTtiLoaoLYVvqyfZ7Zqfc1a9CSHlOX32P7IvKsXtPYe1zmRiq06cQd+YD+kYrow42edQZqwlqMfuCQ=
X-Received: by 2002:a92:8384:: with SMTP id p4mr11801473ilk.276.1571234159767; 
 Wed, 16 Oct 2019 06:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191001233923.16514-1-aford173@gmail.com>
 <20191001233923.16514-5-aford173@gmail.com>
 <20191009233130.GA1002@bogus>
 <CAHCN7xLCvN1v00H10KUX625awz+nea6rhA_LYnftspjaZ+od-g@mail.gmail.com>
 <CAL_JsqJoPda6Oj14WTdm737Mydn+pzvdqkyCPry+zU7drheq=g@mail.gmail.com>
In-Reply-To: <CAL_JsqJoPda6Oj14WTdm737Mydn+pzvdqkyCPry+zU7drheq=g@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 16 Oct 2019 08:55:48 -0500
Message-ID: <CAHCN7xLN99HyZRBr-CkxvkZntx3LfBd5ELcdLPjPRH7kLKr2uw@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: Add Logic PD Type 28 display panel
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9evKAakxTzcQ7kdnAG8O0duW0PQfeoTSmI1HDrhmXzs=;
 b=Husn15unpBnUiUApRTjryg0iOFD/ZK/bLuqbpAPz1y8/BIXb3io3FkV5CUojUXZ6qH
 uVvs4/pOdYWTADJVc5t8EFH8a8FQc6wf/WFnunoJ+N+Dz0F2zyPUuIe8IfEojjAghKUD
 iKroHh+kGvUwsxahclwyS0d/8QrbQWzSpx8fkFwDVFuzMrdaJAafYPpfO7WYaGRDhqYB
 iY/VS4F2aOH++PsfXp2d9npik0xMU8ghyZa2D440LmTLKXYH1piRBkP30RpnT9O9j2DE
 vwISrPEn4qbcfa0Lf263v6DODZ8U0mEUOQcX//5oOpq+YZfX+7U3Bml0ddWlzKdIyNfk
 ejyA==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Adam Ford <adam.ford@logicpd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgODoxNSBBTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDE1LCAyMDE5IGF0IDY6MDQgUE0gQWRhbSBGb3Jk
IDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgT2N0IDksIDIwMTkg
YXQgNjozMSBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDY6Mzk6MjJQTSAtMDUwMCwgQWRhbSBGb3JkIHdy
b3RlOgo+ID4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudGF0aW9uIG9mIGRldmljZSB0cmVl
IGJpbmRpbmdzIGZvciB0aGUgV1ZHQSBwYW5lbAo+ID4gPiA+IExvZ2ljIFBEIFR5cGUgMjggZGlz
cGxheS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFkYW0gRm9yZCA8YWZvcmQxNzNA
Z21haWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+IFY0OiAgVXBkYXRlIHBlciBSb2IgSCdzIHN1
Z2dlc3Rpb25zIGFuZCBjb3B5IG90aGVyIHBhbmVsIHlhbWwgZXhhbXBsZSBmcm9tIDUuNC1yYzEK
PiA+ID4gPiBWMzogIENvcnJlY3QgYnVpbGQgZXJyb3JzIGZyb20gJ21ha2UgZHRfYmluZGluZ19j
aGVjaycKPiA+ID4KPiA+ID4gVGhlIGV4YW1wbGUgc3RpbGwgZmFpbHMgdG8gYnVpbGQgaGVyZS4K
PiA+Cj4gPiBJIGNhbm5vdCByZXBsaWNhdGUgdGhlIGJ1aWxkIGVycm9yIG9uIDUuNC1SQzMgYXQg
bGVhc3QgZm9yIHRoaXMKPiA+IGJpbmRpbmcgb24gVjQgb2YgdGhlIHBhdGNoLiAgSSBnZXQgYnVp
bGQgZXJyb3Igb24gb3RoZXIgYmluZGluZ3MuCj4gPgo+ID4gJCBtYWtlIGR0X2JpbmRpbmdfY2hl
Y2sgQVJDSD1hcm0KPiA+IHNjcmlwdHMva2NvbmZpZy9jb25mICAtLXN5bmNjb25maWcgS2NvbmZp
Zwo+ID4gICBTQ0hFTUEgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wcm9jZXNz
ZWQtc2NoZW1hLnlhbWwKPiA+IC9ob21lL2Fmb3JkL3NyYy9saW51eC9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbmV0L2FkaSxhZGluLnlhbWw6Cj4gPiBpZ25vcmluZywgZXJyb3Ig
aW4gc2NoZW1hICdhZGkscngtaW50ZXJuYWwtZGVsYXktcHMnCj4gPiB3YXJuaW5nOiBubyBzY2hl
bWEgZm91bmQgaW4gZmlsZToKPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvYWRpLGFkaW4ueWFtbAo+ID4gL2hvbWUvYWZvcmQvc3JjL2xpbnV4L0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3IvZml4ZWQtcmVndWxhdG9yLnlhbWw6Cj4gPiBp
Z25vcmluZywgZXJyb3IgaW4gc2NoZW1hICcwJwo+ID4gd2FybmluZzogbm8gc2NoZW1hIGZvdW5k
IGluIGZpbGU6Cj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9y
L2ZpeGVkLXJlZ3VsYXRvci55YW1sCj4gPiAgIENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljL2FtbG9naWMsbWVzb24tZ3gtYW8tc2VjdXJlLnlhbWwK
PiA+ICAgLi4uLgo+ID4gICBDSEtEVCAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3Rwbyx0cGcxMTAueWFtbAo+ID4gICBDSEtEVCAgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FtcGlyZSxhbS00ODAyNzJoM3Rt
cXctdDAxaC55YW1sCj4gPiAgIENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvbG9naWNwZCx0eXBlMjgueWFtbAo+ID4gICBDSEtEVCAgIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvbmJvLHJiMDcwZDMw
LnlhbWwKPiA+ICAuLi4KPiA+ICBDSEtEVCAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9hbGx3aW5uZXIsc3VuNGktYTEwLWlyLnlhbWwKPiA+ICAgQ0hLRFQgICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYWxsd2lubmVyLHN1bjRpLWExMC1j
c2kueWFtbAo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FsbHdp
bm5lcixzdW40aS1hMTAtY3NpLnlhbWw6Cj4gPiAkaWQ6IHBhdGgvZmlsZW5hbWUgJ2FybS9hbGx3
aW5uZXIsc3VuNGktYTEwLWNzaS55YW1sJyBkb2Vzbid0IG1hdGNoCj4gPiBhY3R1YWwgZmlsZW5h
bWUKPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9NYWtlZmlsZToxMjogcmVj
aXBlIGZvciB0YXJnZXQKPiA+ICdEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvYWxsd2lubmVyLHN1bjRpLWExMC1jc2kuZXhhbXBsZS5kdHMnCj4gPiBmYWlsZWQKPiA+IG1h
a2VbMV06ICoqKiBbRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FsbHdp
bm5lcixzdW40aS1hMTAtY3NpLmV4YW1wbGUuZHRzXQo+ID4gRXJyb3IgMQo+ID4gTWFrZWZpbGU6
MTI2MzogcmVjaXBlIGZvciB0YXJnZXQgJ2R0X2JpbmRpbmdfY2hlY2snIGZhaWxlZAo+ID4gbWFr
ZTogKioqIFtkdF9iaW5kaW5nX2NoZWNrXSBFcnJvciAyCj4gPgo+ID4KPiA+IEkgdG9vayBvdXQg
c29tZSBvZiB0aGUgbG9ncyB0byBtYWtlIGl0IGxlc3MgY2hhdHR5LiAgSSBkb24ndCBrbm93Cj4g
PiBhbnl0aGluZyBhYm91dCB5YW1sIG9yIHdoYXQgdGhlIGV4cGVjdGF0aW9ucyBhcmUsIHNvIGlm
IHRoZXJlIGlzIGEKPiA+IHRlc3QgYmV5b25kICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIHBsZWFz
ZSBsZXQgbWUga25vdy4KPgo+IFBlcmhhcHMgJ21ha2UgLWsnIGlzIG5lZWRlZCBiZWNhdXNlIG9m
IHRoZSBvdGhlciBmYWlsdXJlcy4gT3IgdHJ5IG9uCj4gdG9wIG9mIGxpbnV4LW5leHQgd2hpY2gg
c2hvdWxkIGFsbCBiZSBmaXhlZC4KClRoYW5rcy4gIEkgZGlkbid0IGtub3cgYWJvdXQgdGhlICct
aycgIEkgcmVwbGFjZWQgR1BJT19BQ1RJVkVfSElHSAp3aXRoIDAgYW5kIGl0IHNlZW1zIHRvIGhh
dmUgZml4ZWQgdGhlIGVycm9yLgpTb3JyeSBhYm91dCBhbGwgdGhlIG5vaXNlLiAgSG9wZWZ1bGx5
IEkgZGlkIGl0IHJpZ2h0LiAgVGhlcmUgaXMgYSBWNQpwYXRjaCB3YWl0aW5nIG5vdyBzdGFydGlu
ZyBhdCBbMV0KClsxXSAtIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExOTMz
OTkvCgphZGFtCgoKCgo+Cj4gUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
