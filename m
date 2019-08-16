Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8176990740
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 19:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA846E357;
	Fri, 16 Aug 2019 17:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FE66E357
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 17:52:06 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n9so3306546pgc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 10:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xjxlB0B/JZnHNwu9yzdxZFE3he1ESE8+7aIO3e2RkyQ=;
 b=ROVKxdt6SToJ+4NBM8qIRlWrz7KVxRXgyI4Vl7dKrfVb5/jhyVqsOpxC4uAMDxlr0A
 7Gkv57fVNoACpzy4Eckxul5wEjX6XTT7hzG2gkSP7IRxp7UvzJUPwU+vU7mIuW5v6vZV
 3zJ1gpnszRts5mtIt/NkMOt55OqvPgbK0xs9B3BY5+oHE6e0OERyILp8m1TL9BzTlX9r
 hG6QJ57oYNW0EuF6gRMut7VKdBLlZIZUvjSnQIANTcNmhLSpqrZD8CqrcLs2tBKFQi5K
 Z4cehEBwpRc9Oh7qBCU6lbpeZfa3bjrst4ckqWabVPSD+KeYeP3Q2Uh6hLF2IuKMDtIy
 YVzw==
X-Gm-Message-State: APjAAAVhg1yJZMrKqbdIT8PLRvSlAXjBfJjUhiRdzZNUaKHy5MBbHyOt
 XkoWc6XK5OxPZBZA6RsmUHUCAA==
X-Google-Smtp-Source: APXvYqwQomJ4VDkW8Ugkil0/0Fx0afChPTSA24OHMr8FpMJsdU6v6T3IhgWzwQyyDkhwbqMSnFaCYg==
X-Received: by 2002:aa7:8102:: with SMTP id b2mr12049391pfi.105.1565977925626; 
 Fri, 16 Aug 2019 10:52:05 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id 16sm10735880pfc.66.2019.08.16.10.52.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 10:52:05 -0700 (PDT)
Date: Fri, 16 Aug 2019 10:51:57 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190816175157.GT250418@google.com>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190816165148.7keg45fmlndr22fl@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816165148.7keg45fmlndr22fl@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=xjxlB0B/JZnHNwu9yzdxZFE3he1ESE8+7aIO3e2RkyQ=;
 b=NWmOxTmlwuqvYepW/pFP8VjWfNcBSeaFJiXDcL0o6v7Rvz8TLVtdKnwCd8I/2FMoMs
 78S4FIuhOe1aIEuZ/RxhcqKOfVuhGptQBHAw3i/dj3GvfGe2XVrRPMoi1FV9rxsP40Gi
 aOcF7Niwzy0kmnSzlnHcurkXlpMbOhRfTDSyQ=
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

SGkgVXdlLAoKT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDY6NTE6NDhQTSArMDIwMCwgVXdlIEts
ZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMTI6MDA6MDVQTSAt
MDcwMCwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cj4gPiBCYWNrbGlnaHQgYnJpZ2h0bmVzcyBj
dXJ2ZXMgY2FuIGhhdmUgZGlmZmVyZW50IHNoYXBlcy4gVGhlIHR3byBtYWluCj4gPiB0eXBlcyBh
cmUgbGluZWFyIGFuZCBub24tbGluZWFyIGN1cnZlcy4gVGhlIGh1bWFuIGV5ZSBkb2Vzbid0Cj4g
PiBwZXJjZWl2ZSBsaW5lYXJseSBpbmNyZWFzaW5nL2RlY3JlYXNpbmcgYnJpZ2h0bmVzcyBhcyBs
aW5lYXIgKHNlZQo+ID4gYWxzbyA4OGJhOTViZWRiNzkgImJhY2tsaWdodDogcHdtX2JsOiBDb21w
dXRlIGJyaWdodG5lc3Mgb2YgTEVECj4gPiBsaW5lYXJseSB0byBodW1hbiBleWUiKSwgaGVuY2Ug
bWFueSBiYWNrbGlnaHRzIHVzZSBub24tbGluZWFyIChvZnRlbgo+ID4gbG9nYXJpdGhtaWMpIGJy
aWdodG5lc3MgY3VydmVzLiBUaGUgdHlwZSBvZiBjdXJ2ZSBjdXJyZW50bHkgaXMgb3BhcXVlCj4g
PiB0byB1c2Vyc3BhY2UsIHNvIHVzZXJzcGFjZSBvZnRlbiB1c2VzIG1vcmUgb3IgbGVzcyByZWxp
YWJsZSBoZXVyaXN0aWNzCj4gPiAobGlrZSB0aGUgbnVtYmVyIG9mIGJyaWdodG5lc3MgbGV2ZWxz
KSB0byBkZWNpZGUgd2hldGhlciB0byB0cmVhdCBhCj4gPiBiYWNrbGlnaHQgZGV2aWNlIGFzIGxp
bmVhciBvciBub24tbGluZWFyLgo+ID4gCj4gPiBFeHBvcnQgdGhlIHR5cGUgb2YgdGhlIGJyaWdo
dG5lc3MgY3VydmUgdmlhIHRoZSBuZXcgc3lzZnMgYXR0cmlidXRlCj4gPiAnc2NhbGUnLiBUaGUg
dmFsdWUgb2YgdGhlIGF0dHJpYnV0ZSBjYW4gYmUgJ2xpbmVhcicsICdub24tbGluZWFyJyBvcgo+
ID4gJ3Vua25vd24nLiBGb3IgZGV2aWNlcyB0aGF0IGRvbid0IHByb3ZpZGUgaW5mb3JtYXRpb24g
YWJvdXQgdGhlIHNjYWxlCj4gPiBvZiB0aGVpciBicmlnaHRuZXNzIGN1cnZlIHRoZSB2YWx1ZSBv
ZiB0aGUgJ3NjYWxlJyBhdHRyaWJ1dGUgaXMgJ3Vua25vd24nLgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KPiAKPiBJIHdvbmRlciB3
aGF0IGtpbmQgb2YgcHJvYmxlbSB5b3UgYXJlIHNvbHZpbmcgaGVyZS4gQ2FuIHlvdSBkZXNjcmli
ZQo+IHRoYXQgaW4gYSBmZXcgd29yZHM/CgpUaGUgaHVtYW4gZXllIHBlcmNlaXZlcyBicmlnaHRu
ZXNzIGluIGEgbG9nYXJpdGhtaWMgbWFubmVyLiBGb3IKYmFja2xpZ2h0cyB3aXRoIGEgbGluZWFy
IGJyaWdodG5lc3MgY3VydmUgYnJpZ2h0bmVzcyBjb250cm9scyBsaWtlCnNsaWRlcnMgbmVlZCB0
byB1c2UgYSBtYXBwaW5nIHRvIGFjaGlldmUgYSBiZWhhdmlvciB0aGF0IGlzIHBlcmNlaXZlZAph
cyBsaW5lYXItaXNoIChtb3JlIGRldGFpbHM6IGh0dHA6Ly93d3cucGF0aHdheWxpZ2h0aW5nLmNv
bS9wcm9kdWN0cy9kb3dubG9hZHMvYnJvY2h1cmUvdGVjaG5pY2FsX21hdGVyaWFsc18xNDY2Nzk3
MDQ0X0xpbmVhcit2cytMb2dhcml0aG1pYytEaW1taW5nK1doaXRlK1BhcGVyLnBkZikKCkFzIG9m
IG5vdyB1c2Vyc3BhY2UgZG9lc24ndCBoYXZlIGluZm9ybWF0aW9uIGFib3V0IHRoZSB0eXBlIG9m
IHRoZQpicmlnaHRuZXNzIGN1cnZlLCBhbmQgb2Z0ZW4gdXNlcyBoZXVyaXN0aWNzIHRvIG1ha2Ug
YSBndWVzcywgd2hpY2ggbWF5CmJlIHJpZ2h0IG1vc3Qgb2YgdGhlIHRpbWUsIGJ1dCBub3QgYWx3
YXlzLiBUaGUgbmV3IGF0dHJpYnV0ZSBlbGltaW5hdGVzCnRoZSBuZWVkIHRvIGd1ZXNzLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
