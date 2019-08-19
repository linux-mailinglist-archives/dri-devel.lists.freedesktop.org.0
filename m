Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E561920E3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321DE89949;
	Mon, 19 Aug 2019 10:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0264C89949
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 10:02:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p77so2327659wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 03:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oGByaHL3WvRAzy9wH7sBu4JfOwqcR9WgHoejdLOV3QM=;
 b=c1kVGffvc+D2ErLAj0sU7kOULqs64DHUFlVcHDgbgujcLLyQdMKkrQEfZvFEQXbJKG
 DHyzFtMkeVbCgzdX87Ekbq0XjQ2EtCyXBV6CvkE6cjoPXj8lz1hu2mn9w3Lpgc9jNuVY
 /GAv/ZrR5rxGai3noniEp8XtiUeWqXWamcF5zah+CXYS6u/WJNQLaRFmeFBNsOs8MLmK
 9lBqs4uvU7LRZ8pzeyHQ0F60prq6HtIvnYAhi044kTSIYOH3Sv0141AdQ8Hk7rb2Bj85
 612CvmDZ0lyPxiZiMHeZP0GmEkHd48psIbkzkthWLBs3UEt2Tx/MwTbB9/amG4xWNLWO
 kTxA==
X-Gm-Message-State: APjAAAXlkpBNZC6SJ499hSmhUArArXSrH4t4GFUH217ujcYC6KlL+Xz+
 NtEtkvBg71NHijUcuF7K2dQf9g==
X-Google-Smtp-Source: APXvYqzAdCZexfjrffxQ2iQVUNZ3b9uiq8WokUSyaQSwncOs/o7Tq9IHD00J90l+fZLvg9wrybUMog==
X-Received: by 2002:a1c:d108:: with SMTP id i8mr20495497wmg.28.1566208963981; 
 Mon, 19 Aug 2019 03:02:43 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o16sm17087477wrp.23.2019.08.19.03.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 03:02:43 -0700 (PDT)
Date: Mon, 19 Aug 2019 11:02:41 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190819100241.5pctjxmsq6crlale@holly.lan>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190807201528.GO250418@google.com>
 <510f6d8a-71a0-fa6e-33ea-c4a4bfa96607@linaro.org>
 <20190816175317.GU250418@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816175317.GU250418@google.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oGByaHL3WvRAzy9wH7sBu4JfOwqcR9WgHoejdLOV3QM=;
 b=Pv1iKvVjNFoT9NpBjh5AjigD0Gfi9AlI9zmHJZd0VcE2KJAzuvDqYkLHGAAXSTA0n5
 AJH9DSb/LcjmwVzKkS4Od5ciSpqSrL7YeD+XEUs9djKRPw7sH9BN07TcllUSaQopMX2B
 UIwuxiFUpgYYlLJHcJ57GFfZpcXEZmJJztHVhMMMc4gMqR2Zs2MCEgHW7sg9fNPtZm43
 kdUlo51U7YSEq1urcux3GlWC3hqbf7fxCmESHWxPanKWPpJ24Kq9YFFrq3EUT6sYgiir
 3SzF9hV23NSm0w1W/KzHY/6is/O7ID4nN+ZpPq2W2q2kttcuqGDakMjq7b3yiq+aiDgE
 xeyQ==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTA6NTM6MTdBTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDQ6NTQ6MThQTSArMDEwMCwgRGFu
aWVsIFRob21wc29uIHdyb3RlOgo+ID4gT24gMDcvMDgvMjAxOSAyMToxNSwgTWF0dGhpYXMgS2Fl
aGxja2Ugd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVsIDA5LCAyMDE5IGF0IDEyOjAwOjA1UE0gLTA3
MDAsIE1hdHRoaWFzIEthZWhsY2tlIHdyb3RlOgo+ID4gPiA+IEJhY2tsaWdodCBicmlnaHRuZXNz
IGN1cnZlcyBjYW4gaGF2ZSBkaWZmZXJlbnQgc2hhcGVzLiBUaGUgdHdvIG1haW4KPiA+ID4gPiB0
eXBlcyBhcmUgbGluZWFyIGFuZCBub24tbGluZWFyIGN1cnZlcy4gVGhlIGh1bWFuIGV5ZSBkb2Vz
bid0Cj4gPiA+ID4gcGVyY2VpdmUgbGluZWFybHkgaW5jcmVhc2luZy9kZWNyZWFzaW5nIGJyaWdo
dG5lc3MgYXMgbGluZWFyIChzZWUKPiA+ID4gPiBhbHNvIDg4YmE5NWJlZGI3OSAiYmFja2xpZ2h0
OiBwd21fYmw6IENvbXB1dGUgYnJpZ2h0bmVzcyBvZiBMRUQKPiA+ID4gPiBsaW5lYXJseSB0byBo
dW1hbiBleWUiKSwgaGVuY2UgbWFueSBiYWNrbGlnaHRzIHVzZSBub24tbGluZWFyIChvZnRlbgo+
ID4gPiA+IGxvZ2FyaXRobWljKSBicmlnaHRuZXNzIGN1cnZlcy4gVGhlIHR5cGUgb2YgY3VydmUg
Y3VycmVudGx5IGlzIG9wYXF1ZQo+ID4gPiA+IHRvIHVzZXJzcGFjZSwgc28gdXNlcnNwYWNlIG9m
dGVuIHVzZXMgbW9yZSBvciBsZXNzIHJlbGlhYmxlIGhldXJpc3RpY3MKPiA+ID4gPiAobGlrZSB0
aGUgbnVtYmVyIG9mIGJyaWdodG5lc3MgbGV2ZWxzKSB0byBkZWNpZGUgd2hldGhlciB0byB0cmVh
dCBhCj4gPiA+ID4gYmFja2xpZ2h0IGRldmljZSBhcyBsaW5lYXIgb3Igbm9uLWxpbmVhci4KPiA+
ID4gPiAKPiA+ID4gPiBFeHBvcnQgdGhlIHR5cGUgb2YgdGhlIGJyaWdodG5lc3MgY3VydmUgdmlh
IHRoZSBuZXcgc3lzZnMgYXR0cmlidXRlCj4gPiA+ID4gJ3NjYWxlJy4gVGhlIHZhbHVlIG9mIHRo
ZSBhdHRyaWJ1dGUgY2FuIGJlICdsaW5lYXInLCAnbm9uLWxpbmVhcicgb3IKPiA+ID4gPiAndW5r
bm93bicuIEZvciBkZXZpY2VzIHRoYXQgZG9uJ3QgcHJvdmlkZSBpbmZvcm1hdGlvbiBhYm91dCB0
aGUgc2NhbGUKPiA+ID4gPiBvZiB0aGVpciBicmlnaHRuZXNzIGN1cnZlIHRoZSB2YWx1ZSBvZiB0
aGUgJ3NjYWxlJyBhdHRyaWJ1dGUgaXMgJ3Vua25vd24nLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgo+ID4gPiAKPiA+
ID4gRGFuaWVsIChldCBhbCk6IGRvIHlvdSBoYXZlIGFueSBtb3JlIGNvbW1lbnRzIG9uIHRoaXMg
cGF0Y2gvc2VyaWVzIG9yCj4gPiA+IGlzIGl0IHJlYWR5IHRvIGxhbmQ/Cj4gPiAKPiA+IEkgZGVj
aWRlZCB0byBsZWF2ZSBpdCBmb3IgYSBsb25nIHdoaWxlIGZvciBvdGhlcnMgdG8gcmV2aWV3IHNp
bmNlIEknbSBzdGlsbAo+ID4gYSB0aW55IGJpdCB1bmVhc3kgYWJvdXQgdGhlIGxpbmVhci9ub24t
bGluZWFyIHRlcm1pbm9sb2d5Lgo+ID4gCj4gPiBIb3dldmVyIHRoYXQncyBteSBvbmx5IGNvbmNl
cm4sIGl0cyBmYWlybHkgbWlub3IgYW5kIEkndmUgZHJhZ2dlZCBieSBmZWV0Cj4gPiBmb3IgbW9y
ZSB0aGVuIGxvbmcgZW5vdWdoLCBzbzoKPiA+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24g
PGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IAo+IFRoYW5rcyEKPiAKPiBJZiB5b3Ugb3Ig
c29tZW9uZSBlbHNlIGhhcyBhbm90aGVyIHN1Z2dlc3Rpb24gZm9yIHRoZSB0ZXJtaW5vbG9neSB0
aGF0Cj4gd2UgY2FuIGFsbCBhZ3JlZSBvbiBJJ20gaGFwcHkgdG8gY2hhbmdlIGl0LgoKQXMgeW91
IHdpbGwgc2VlIGluIG15IHJlcGx5IHRvIFV3ZS4gVGhlIHRlcm0gSSB0ZW5kIHRvIGFkb3B0IHdo
ZW4gSSB3YW50CnRvIGJlIHByZWNpc2UgYWJvdXQgdXNlcnNwYWNlIGJlaGF2aW91ciBpcyAicGVy
Y2VwdHVhbCIgKGUuZy4gdGhhdCBhCmJhY2tsaWdodCBjYW4gYmUgbWFwcGVkIGRpcmVjdGx5IHRv
IGEgc2xpZGVyIGFuZCBpdCB3aWxsIGZlZWwgcmlnaHQpLgoKSG93ZXZlciB0aGF0IHJhaXNlcyBp
dHMgb3duIGNvbmNlcm5zOiBtb3N0bHkgYWJvdXQgd2hhdCBpcyBwZXJjZXB0dWFsCmVub3VnaC4K
CkNsZWFyIHRoZSBhdXRvbWF0aWMgYnJpZ2h0bmVzcyBjdXJ2ZSBzdXBwb3J0IGluIHRoZSBQV00g
ZHJpdmVyIGlzCnBlcmNlcHR1YWwuCgpUbyBiZSBob25lc3QgSSBzdXNwZWN0IHRoYXQgaW4gbW9z
dCBjYXNlcyBhIHRydWUgbG9nYXJpdGhtaWMgY3VydmUgKGdpdmVuIGEKc2FuZSBleHBvbmVudCkg
d291bGQgYmUgcGVyY2VwdHVhbCBlbm91Z2guIEluIG90aGVyIHdvcmRzIGl0IHdpbGwgZmVlbApj
b21mb3J0YWJsZSB3aXRoIGEgZGlyZWN0IG1hcHBlZCBzbGlkZXIgYW5kIHVzaW5nIGl0IGZvciBh
bmltYXRpb24Kd29uJ3QgYmUgdG9vIGJhZC4KCkhvd2V2ZXIgd2hlbiB3ZSBnZXQgcmlnaHQgZG93
biB0byBpdCAqdGhhdCogaXMgdGhlIGluZm9ybWF0aW9uIHRoYXQgaXMKYWN0dWFsbHkgbW9zdCB1
c2VmdWwgdG8gdXNlcnNwYWNlOiBleHBsaWNpdCBjb25maXJtYXRpb24gdGhhdCB0aGUgc2NhbGUK
Y2FuIGJlIG1hcHBlZCBkaXJlY3RseSB0byBhIHNsaWRlci4gSSB0aGluayBpdCBhbHNvIGFsaWdu
ZWQgYmV0dGVyIHdpdGgKVXdlJ3MgZmVlZGJhY2sgKGUuZy4gdG8gc3RhcnQgd29ya2luZyB0b3dh
cmRzIGhhdmluZyBhIHByZWZlcnJlZCBzY2FsZSkuCgoKRGFuaWVsLgoKCgoKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
