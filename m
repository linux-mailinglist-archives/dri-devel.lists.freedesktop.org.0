Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284E890A07
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 23:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961706E397;
	Fri, 16 Aug 2019 21:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF9E6E397
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 21:10:55 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 196so3722417pfz.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 14:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=omJ8IItzAJQAPO3tmBsIeieU2u668VutyYMbYeYnfXY=;
 b=qOK2S0fegyImsG9/QhGbpuJGx1A6a68LwlkB1SJ1vrtjXQM+Cm3VZp7Ytce+SRxcID
 Wnco30zrW+iVs4JVJJxzuKK/Epk6zXMZUpJSs8SwHlDAM8EefyM81w6xK1AUFGe8wiA6
 EBrp/39VikcK0FM4lGf67v+ewCQG5gi9vqaZnQGLQLWOJkmIFokVOR/JHiB0Udu6R2TK
 oNsqktTop+64BHo2ELZWrxB4PfpgBVu9rNtC1ri607j0zcqcnYtrFFmRIQv7eS6KwkGh
 ncLUuaOcVLRQFQ1XrUuAX1dT5kRBJCQCQwAiSl2YnxBpBtmEqaL2b0pOCEZJtqoGCgI5
 tW0Q==
X-Gm-Message-State: APjAAAXtFuV2dvlMlgTRJvJeSuHyV/PBfYirYOezucdIgxoA+PaI0dKt
 CWmuvfkoMqMClV6K/VrKBqbzfA==
X-Google-Smtp-Source: APXvYqx/9biztZysWMeW6sR50lVpQxokVJNMUldAOC4JXEFv4e9JNEnzqyrf//WtPwGuqvJWoi3P2A==
X-Received: by 2002:aa7:9293:: with SMTP id j19mr13113379pfa.90.1565989854997; 
 Fri, 16 Aug 2019 14:10:54 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id c71sm7437581pfc.106.2019.08.16.14.10.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 14:10:54 -0700 (PDT)
Date: Fri, 16 Aug 2019 14:10:51 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190816211051.GV250418@google.com>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190816165148.7keg45fmlndr22fl@pengutronix.de>
 <20190816175157.GT250418@google.com>
 <20190816194754.ldzjqy2yjonfvaat@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816194754.ldzjqy2yjonfvaat@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=omJ8IItzAJQAPO3tmBsIeieU2u668VutyYMbYeYnfXY=;
 b=njDzsoq5Y3wMuR1vIA+MGdo+BzO+B/f9SdopkAr0xFHgrStJXA7Ik/UCP8qP6cVwv4
 lzcubXnyj8uqy6qltZibMeg3xHuVhU5Jzu2yjdBrpex1+Y5E/vNWNcIBdyff7zVFbDPv
 S7ia2p8XxRtlv61pL9/W76ViOPP2pTn+6Amts=
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDk6NDc6NTRQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTA6NTE6NTdBTSAtMDcwMCwgTWF0
dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cj4gPiBIaSBVd2UsCj4gPiAKPiA+IE9uIEZyaSwgQXVnIDE2
LCAyMDE5IGF0IDA2OjUxOjQ4UE0gKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4g
PiBPbiBUdWUsIEp1bCAwOSwgMjAxOSBhdCAxMjowMDowNVBNIC0wNzAwLCBNYXR0aGlhcyBLYWVo
bGNrZSB3cm90ZToKPiA+ID4gPiBCYWNrbGlnaHQgYnJpZ2h0bmVzcyBjdXJ2ZXMgY2FuIGhhdmUg
ZGlmZmVyZW50IHNoYXBlcy4gVGhlIHR3byBtYWluCj4gPiA+ID4gdHlwZXMgYXJlIGxpbmVhciBh
bmQgbm9uLWxpbmVhciBjdXJ2ZXMuIFRoZSBodW1hbiBleWUgZG9lc24ndAo+ID4gPiA+IHBlcmNl
aXZlIGxpbmVhcmx5IGluY3JlYXNpbmcvZGVjcmVhc2luZyBicmlnaHRuZXNzIGFzIGxpbmVhciAo
c2VlCj4gPiA+ID4gYWxzbyA4OGJhOTViZWRiNzkgImJhY2tsaWdodDogcHdtX2JsOiBDb21wdXRl
IGJyaWdodG5lc3Mgb2YgTEVECj4gPiA+ID4gbGluZWFybHkgdG8gaHVtYW4gZXllIiksIGhlbmNl
IG1hbnkgYmFja2xpZ2h0cyB1c2Ugbm9uLWxpbmVhciAob2Z0ZW4KPiA+ID4gPiBsb2dhcml0aG1p
YykgYnJpZ2h0bmVzcyBjdXJ2ZXMuIFRoZSB0eXBlIG9mIGN1cnZlIGN1cnJlbnRseSBpcyBvcGFx
dWUKPiA+ID4gPiB0byB1c2Vyc3BhY2UsIHNvIHVzZXJzcGFjZSBvZnRlbiB1c2VzIG1vcmUgb3Ig
bGVzcyByZWxpYWJsZSBoZXVyaXN0aWNzCj4gPiA+ID4gKGxpa2UgdGhlIG51bWJlciBvZiBicmln
aHRuZXNzIGxldmVscykgdG8gZGVjaWRlIHdoZXRoZXIgdG8gdHJlYXQgYQo+ID4gPiA+IGJhY2ts
aWdodCBkZXZpY2UgYXMgbGluZWFyIG9yIG5vbi1saW5lYXIuCj4gPiA+ID4gCj4gPiA+ID4gRXhw
b3J0IHRoZSB0eXBlIG9mIHRoZSBicmlnaHRuZXNzIGN1cnZlIHZpYSB0aGUgbmV3IHN5c2ZzIGF0
dHJpYnV0ZQo+ID4gPiA+ICdzY2FsZScuIFRoZSB2YWx1ZSBvZiB0aGUgYXR0cmlidXRlIGNhbiBi
ZSAnbGluZWFyJywgJ25vbi1saW5lYXInIG9yCj4gPiA+ID4gJ3Vua25vd24nLiBGb3IgZGV2aWNl
cyB0aGF0IGRvbid0IHByb3ZpZGUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNjYWxlCj4gPiA+ID4g
b2YgdGhlaXIgYnJpZ2h0bmVzcyBjdXJ2ZSB0aGUgdmFsdWUgb2YgdGhlICdzY2FsZScgYXR0cmli
dXRlIGlzICd1bmtub3duJy4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlh
cyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KPiA+ID4gCj4gPiA+IEkgd29uZGVyIHdoYXQg
a2luZCBvZiBwcm9ibGVtIHlvdSBhcmUgc29sdmluZyBoZXJlLiBDYW4geW91IGRlc2NyaWJlCj4g
PiA+IHRoYXQgaW4gYSBmZXcgd29yZHM/Cj4gPiAKPiA+IFRoZSBodW1hbiBleWUgcGVyY2VpdmVz
IGJyaWdodG5lc3MgaW4gYSBsb2dhcml0aG1pYyBtYW5uZXIuIEZvcgo+ID4gYmFja2xpZ2h0cyB3
aXRoIGEgbGluZWFyIGJyaWdodG5lc3MgY3VydmUgYnJpZ2h0bmVzcyBjb250cm9scyBsaWtlCj4g
PiBzbGlkZXJzIG5lZWQgdG8gdXNlIGEgbWFwcGluZyB0byBhY2hpZXZlIGEgYmVoYXZpb3IgdGhh
dCBpcyBwZXJjZWl2ZWQKPiA+IGFzIGxpbmVhci1pc2ggKG1vcmUgZGV0YWlsczogaHR0cDovL3d3
dy5wYXRod2F5bGlnaHRpbmcuY29tL3Byb2R1Y3RzL2Rvd25sb2Fkcy9icm9jaHVyZS90ZWNobmlj
YWxfbWF0ZXJpYWxzXzE0NjY3OTcwNDRfTGluZWFyK3ZzK0xvZ2FyaXRobWljK0RpbW1pbmcrV2hp
dGUrUGFwZXIucGRmKQo+ID4gCj4gPiBBcyBvZiBub3cgdXNlcnNwYWNlIGRvZXNuJ3QgaGF2ZSBp
bmZvcm1hdGlvbiBhYm91dCB0aGUgdHlwZSBvZiB0aGUKPiA+IGJyaWdodG5lc3MgY3VydmUsIGFu
ZCBvZnRlbiB1c2VzIGhldXJpc3RpY3MgdG8gbWFrZSBhIGd1ZXNzLCB3aGljaCBtYXkKPiA+IGJl
IHJpZ2h0IG1vc3Qgb2YgdGhlIHRpbWUsIGJ1dCBub3QgYWx3YXlzLiBUaGUgbmV3IGF0dHJpYnV0
ZSBlbGltaW5hdGVzCj4gPiB0aGUgbmVlZCB0byBndWVzcy4KPiAKPiBUaGlzIGlzIGFib3V0IGJh
Y2tsaWdodHMgcmlnaHQ/IFNvIHRoZSBrZXJuZWwgcHJvdmlkZXMgdG8gdXNlcnNwYWNlIGFuCj4g
aW50ZXJ2YWwgWzAsIHhdIGZvciBzb21lIHggYW5kIGRlcGVuZGluZyBvbiB0aGUgcGh5c2ljcyBv
ZiB0aGUgdGhlCj4gYmFja2xpZ2h0IGNvbmZpZ3VyaW5nIHgvMiAocHJvYmFibHk/KSBlaXRoZXIg
bWVhbnMgNTAlIG1lYXN1cmVkIGxpZ2h0IG9yCj4gNTAlIHBlcmNlaXZlZCBsaWdodCwgcmlnaHQ/
Cgpjb3JyZWN0Cgo+IEkgd29uZGVyIGlmIGl0IHdvdWxkIGJlIHBvc3NpYmxlIGluc3RlYWQgb2Yg
Z2l2aW5nIGRpZmZlcmVudCBiYWNrbGlnaHQKPiBpbXBsZW1lbnRhdGlvbnMgdGhlIGZyZWVkb20g
dG8gdXNlIGVpdGhlciBsaW5lYXIgb3IgbG9nYXJpdGhtaWMgKG9yCj4gcXVhZHJhdGljPykgc2Nh
bGluZyBhbmQgdGVsbCB1c2Vyc3BhY2Ugd2hpY2ggb2YgdGhlIG9wdGlvbnMgd2VyZSBwaWNrZWQK
PiByZXF1aXJlIHRoZSBkcml2ZXJzIHRvIHByb3ZpZGUgYSAoc2F5KSBsaW5lYXIgc2NhbGluZyBh
bmQgdGhlbiB1c2Vyc3BhY2UKPiB3b3VsZG4ndCBuZWVkIHRvIGNhcmUgYWJvdXQgdGhlIGV4YWN0
IHBoeXNpY3MuCgpJbiBhbiBpZGVhbCB3b3JsZCB0aGUgYmFja2xpZ2h0IGludGVyZmFjZSB3b3Vs
ZCBiZSBjb25zaXN0ZW50IGFzIHlvdQpzdWdnZXN0LCBob3dldmVyIHRoZXJlIGFyZSBwbGVudHkg
b2YgZXhpc3RpbmcgZGV2aWNlcyB3aGljaCB1c2UgdGhlCidvdGhlcicgc2NhbGluZyAocmVnYXJk
bGVzcyBvZiB3aGljaCBpcyBjaG9zZW4gYXMgdGhlICdjb3JyZWN0JwpvbmUpLiBVc2Vyc3BhY2Ug
c3RpbGwgaGFzIHRvIGRlYWwgd2l0aCB0aGVzZS4gQW5kIGNoYW5naW5nIHByZXZpb3VzbHkKJ2xv
Z2FyaXRobWljJyBkcml2ZXJzIHRvIGxpbmVhciAob3IgdmljZXZlcnNhKSBtYXkgJ2JyZWFrJyB1
c2Vyc3BhY2UsCndoZW4gaXQga2VlcHMgdXNpbmcgaXRzICdvbGQnIHNjYWxpbmcsIHdoaWNoIG5v
dyBpc24ndCBjb3JyZWN0IGFueW1vcmUuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
