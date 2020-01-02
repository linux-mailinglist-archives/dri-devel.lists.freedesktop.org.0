Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1493D1301F9
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FFD6E3F2;
	Sat,  4 Jan 2020 11:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36726E0EC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 16:32:20 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c26so39536146eds.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 08:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2Tko8occFlhTAmLh+pmq5km+IinxZOdXNCIFDK4BrgI=;
 b=Yxb2DtgByNnm2fvJC5grlaYIWQcduaEV1xN7bE+1BWv/5kIsEJGJzn9NPu60o6gEGk
 glSFoj0DxpmRKQ3KN+2OW667MMbrcOpFVILpvUMgzz25kWv5AmCq76nosJLB38Qy5t9/
 BaeF0w5f11a83pMJHTlEO8TUuLJSgrOKMAb2L6HMcgquZoDgGnW8O9Q2vMtV8OJrHB/X
 cRHSKwZKg1BAaOmUbpunrXdAFZOL17dgxP4hYHB95aM1oBz9s9BVJFfNU4Zjjy5JDmJ5
 n5917hecOxtC2Ntp4XqcebffaigCfGTiha5Qu2ErrHP+ZeTx+RWp8D4YFOJu7BpcnsGg
 ILFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2Tko8occFlhTAmLh+pmq5km+IinxZOdXNCIFDK4BrgI=;
 b=DSvzMXJnYqr05WH8LPe8853aAmetEY7CtS369r3pYeWH2i/2EBVuVKDxGsIiCLrIQN
 08i9SApLp6RX3bIGqF2tAJzWOd2J/uoIgCjl69h+AEYcg21cRf7DCWEk33Xq//v6Czyk
 L24JVvFvxNe6PrxGqqauAfhCxJVVLa5BgdjQra14cNxYrkkZvNQIkp4HrwzSiLu96unK
 rCfFYsCuKZygF5H13f3m2rmy8gUc4N+lekadoIgUpJH/uWvbpVw2cxtHl7SmQnkOOiIc
 +8dVezv9Hl0TI9QxreTVz+bHCRvi6016EcKYGCniYXHDmE5D2131PbdhXk+DNDOfkYcO
 rsFg==
X-Gm-Message-State: APjAAAXWa/L+Wpnm+Ivtb84jOhYQ0zzHIEH3wG3Ibtw1T0JnzAlcoSsq
 i5F2q06whKqjRBWpcNXw3Rsn+Ep6EoNkITR9VgTg8g==
X-Google-Smtp-Source: APXvYqwOVsilnsl9v7DZx9xZbGwuN9vKn2FxzE+O5mvOq1IVT7wX95EXQ3BZUT6bjQZc4po8c435XGCjM9jRP1YMO2s=
X-Received: by 2002:a50:9f65:: with SMTP id b92mr87854876edf.275.1577982739378; 
 Thu, 02 Jan 2020 08:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20200101204750.50541-1-roman.stratiienko@globallogic.com>
 <20200101204750.50541-2-roman.stratiienko@globallogic.com>
 <20200102100832.c5fc4imjdmr7otam@gilmour.lan>
In-Reply-To: <20200102100832.c5fc4imjdmr7otam@gilmour.lan>
From: Roman Stratiienko <roman.stratiienko@globallogic.com>
Date: Thu, 2 Jan 2020 18:32:07 +0200
Message-ID: <CAODwZ7uqf4v8XjOLCn=SoUQchst_b96VCNdaunzn9Q21zPcQ7w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/sun4i: Use CRTC size instead of PRIMARY plane
 size as mixer frame.
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

0YfRgiwgMiDRj9C90LIuIDIwMjAg0LMuLCAxMjowOCBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtl
cm5lbC5vcmc+Ogo+Cj4gSGksCj4KPiBPbiBXZWQsIEphbiAwMSwgMjAyMCBhdCAxMDo0Nzo1MFBN
ICswMjAwLCByb21hbi5zdHJhdGlpZW5rb0BnbG9iYWxsb2dpYy5jb20gd3JvdGU6Cj4gPiBGcm9t
OiBSb21hbiBTdHJhdGlpZW5rbyA8cm9tYW4uc3RyYXRpaWVua29AZ2xvYmFsbG9naWMuY29tPgo+
ID4KPiA+IEFjY29yZGluZyB0byBEUk0gZG9jdW1lbnRhdGlvbiB0aGUgb25seSBkaWZmZXJlbmNl
IGJldHdlZW4gUFJJTUFSWQo+ID4gYW5kIE9WRVJMQVkgcGxhbmUgaXMgdGhhdCBlYWNoIENSVEMg
bXVzdCBoYXZlIFBSSU1BUlkgcGxhbmUgYW5kCj4gPiBPVkVSTEFZIGFyZSBvcHRpb25hbC4KPiA+
Cj4gPiBBbGxvdyBQUklNQVJZIHBsYW5lIHRvIGhhdmUgZGltZW5zaW9uIGRpZmZlcmVudCBmcm9t
IGZ1bGwtc2NyZWVuLgo+ID4KPiA+IEZpeGVzOiA1YmI1ZjVkYWZhMWEgKCJkcm0vc3VuNGk6IFJl
b3JnYW5pemUgVUkgbGF5ZXIgY29kZSBpbiBERTIiKQo+ID4gU2lnbmVkLW9mZi1ieTogUm9tYW4g
U3RyYXRpaWVua28gPHJvbWFuLnN0cmF0aWllbmtvQGdsb2JhbGxvZ2ljLmNvbT4KPgo+IFNvIGl0
IGFwcGxpZXMgdG8gYWxsIHRoZSA0IHBhdGNoZXMgeW91J3ZlIHNlbnQsIGJ1dCB0aGlzIGxhY2tz
IHNvbWUKPiBjb250ZXh0Lgo+Cj4gVGhlcmUncyBhIGZldyBxdWVzdGlvbnMgdGhhdCBzaG91bGQg
YmUgYW5zd2VyZWQgaGVyZToKPiAgIC0gV2hpY2ggc2l0dWF0aW9uIGlzIGl0IGZpeGluZz8KClNl
dHRpbmcgcHJpbWFyeSBwbGFuZSBzaXplIGxlc3MgdGhhbiBjcnRjIGJyZWFrcyBjb21wb3NpdGlv
bi4gQWxzbwpzaGlmdGluZyB0b3AgbGVmdCBjb3JuZXIgYWxzbyBicmVha3MgaXQuCgo+ICAgLSBX
aGF0IHRvb2wgLyB1c2Vyc3BhY2Ugc3RhY2sgaXMgaXQgZml4aW5nPwoKSSBhbSB1c2luZyBBbmRy
b2lkIHVzZXJzcGFjZSBhbmQgZHJtX2h3Y29tcG9zZXIgSEFMLgoKQEplcm5laiwgeW91J3ZlIHNh
aWQgdGhhdCB5b3Ugb2JzZXJ2ZWQgc2ltaWxhciBpc3N1ZS4gQ291bGQgeW91IHNoYXJlCndoYXQg
dXNlcnNwYWNlIGhhdmUgeW91IHVzZWQ/Cgo+ICAgLSBXaGF0IGhhcHBlbnMgd2l0aCB5b3VyIGZp
eD8gRG8geW91IHNldCB0aGUgcGxhbmUgYXQgY29vcmRpbmF0ZXMKPiAgICAgMCwwIChtZWFuaW5n
IHlvdSdsbCBjcm9wIHRoZSB0b3AtbGVmIGNvcm5lciksIGRvIHlvdSBjZW50ZXIgaXQ/IElmCj4g
ICAgIHRoZSBwbGFuZSBpcyBzbWFsbGVyIHRoYW4gdGhlIENUUkMgc2l6ZSwgd2hhdCBpcyBzZXQg
b24gdGhlIGVkZ2VzPwoKWW91IGNhbiBwdXQgcHJpbWFyeSBwbGFuZSB0byBhbnkgcGFydCBvZiB0
aGUgc2NyZWVuIGFuZCBtYWtlIGl0IGFzCnNtYWxsIGFzIDh4OCAoYWNjb3JkaW5nIHRvIHRoZSBk
YXRhc2hlZXQpIC4gQmFja2dyb3VuZCB3b3VsZCBiZSBmaWxsZWQKd2l0aCBibGFjayBjb2xvciwg
dGhhdCBpcyBkZWZhdWx0LCBidXQgaXQgYWxzbyBjb3VsZCBiZSBvdmVycmlkZGVuIGJ5CnNldHRp
bmcgY29ycmVzcG9uZGluZyByZWdpc3RlcnMuCgo+Cj4KPiBUaGFua3MhCj4gTWF4aW1lCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
