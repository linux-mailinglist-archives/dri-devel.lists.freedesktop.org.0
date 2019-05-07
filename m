Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B69F16186
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 11:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F50A89FAD;
	Tue,  7 May 2019 09:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A4C89FAD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 09:53:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h4so2122538wre.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 02:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=tcxS/2hWpXskjofGSRtseVQHc72BiZ0p45vo0Vdka28=;
 b=H3uISRUY68YFSUd7FrcOvas5UcupFbaki41xfYoazpWf+hfl0DW6yBMVgg6By3Vcxh
 3XEADF4dRJ0q4TiDnlQDJyTgsNqBDAaL+Kmra/sMxGRkoGZRXHkMCs3OCpPoO1T3LlEP
 Djly+5Vu8E5BTnJ1LCesOidcYLclairfEwEsVm2L42NhFfzqBjq3JqyPmesfhkBGqYIf
 aOjtaLVaw2iCS8Sgq6nH2pziOAaHWs+tSkyPbGoagE2WsCilPu65RdCRYyL2eZPCMi/2
 flqkX+ZIMrvNsLUT3so4Yp4/oc9+Qwwj6EJixSwaBLYRISebGd0Dhc9yvwxCfK1QiX8K
 LbIg==
X-Gm-Message-State: APjAAAWBcqhtf+J2zm5vFSRsYIvy4jhzK48NdFcpUpmMmIgFb8qHZcUT
 /Jq/d/nqkFWRiXd15QiVkyb3vw==
X-Google-Smtp-Source: APXvYqwo3mM58fkGHxIdzaZEGdBCoVtchbx0EHRZjuaTTSmrlX26j60GrA4koYEVJwZOeYXfzyNWBg==
X-Received: by 2002:adf:f7d0:: with SMTP id a16mr21241175wrq.211.1557222789633; 
 Tue, 07 May 2019 02:53:09 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id p67sm11911297wmp.22.2019.05.07.02.53.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 02:53:09 -0700 (PDT)
Date: Tue, 7 May 2019 10:53:07 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v6 1/3] backlight: lm3630a: return 0 on success in
 update_status functions
Message-ID: <20190507095307.GE4529@dell>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-2-masneyb@onstation.org>
 <864c1ddc-1008-0041-1559-e491ca0186ef@linaro.org>
 <20190502104239.GA24563@basecamp>
 <20190502104644.e3eth2cdebuz2mpk@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502104644.e3eth2cdebuz2mpk@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=tcxS/2hWpXskjofGSRtseVQHc72BiZ0p45vo0Vdka28=;
 b=jQqWVK1unu7T2kZOE+gg87wq3FaLBBLlf79ijlqE53cIvYRlBTOVpLHtKmzgG75Uaz
 qUGpykrKD76+xOMdprElOVqPIa03BD97ytwIq+mwM+TGIkPSdwAwZ1uahhv//mR+X23W
 Kn5toaEsASuWW9khg23mJ3aXmivkbYcSxPH49QsSeNjur0i3t72nwda3GHlL2N+/9Yyo
 A/dxuHpJ/VAh9F5sxGxlLyMKoFOpfJTgnYenmbAw4NQeGwteCCBUiLdJSt2WeDZMeT+7
 sI35QOEHso5oe2aQHXF/3m9iCI4corsq29MMd0hNv4SHtAUwaNo9TFi4uSNjOd5xdvG+
 qj9A==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, jonathan@marek.ca, dmurphy@ti.com,
 b.zolnierkie@samsung.com, jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz,
 Daniel Thompson <daniel@redfelineninja.org.uk>, linux-leds@vger.kernel.org,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwMiBNYXkgMjAxOSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBUaHUsIE1h
eSAwMiwgMjAxOSBhdCAwNjo0MjozOUFNIC0wNDAwLCBCcmlhbiBNYXNuZXkgd3JvdGU6Cj4gPiBP
biBUaHUsIE1heSAwMiwgMjAxOSBhdCAxMTowNzo1MUFNICswMTAwLCBEYW5pZWwgVGhvbXBzb24g
d3JvdGU6Cj4gPiA+IE9uIDI0LzA0LzIwMTkgMTA6MjUsIEJyaWFuIE1hc25leSB3cm90ZToKPiA+
ID4gPiBsbTM2MzBhX2JhbmtfYV91cGRhdGVfc3RhdHVzKCkgYW5kIGxtMzYzMGFfYmFua19iX3Vw
ZGF0ZV9zdGF0dXMoKQo+ID4gPiA+IGJvdGggcmV0dXJuIHRoZSBicmlnaHRuZXNzIHZhbHVlIGlm
IHRoZSBicmlnaHRuZXNzIHdhcyBzdWNjZXNzZnVsbHkKPiA+ID4gPiB1cGRhdGVkLiBXcml0aW5n
IHRvIHRoZXNlIGF0dHJpYnV0ZXMgdmlhIHN5c2ZzIHdvdWxkIGNhdXNlIGEgJ0JhZAo+ID4gPiA+
IGFkZHJlc3MnIGVycm9yIHRvIGJlIHJldHVybmVkLiBUaGVzZSBmdW5jdGlvbnMgc2hvdWxkIHJl
dHVybiAwIG9uCj4gPiA+ID4gc3VjY2Vzcywgc28gbGV0J3MgY2hhbmdlIGl0IHRvIGNvcnJlY3Qg
dGhhdCBlcnJvci4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkg
PG1hc25leWJAb25zdGF0aW9uLm9yZz4KPiA+ID4gPiBGaXhlczogMjhlNjRhNjhhMmVmICgiYmFj
a2xpZ2h0OiBsbTM2MzA6IGFwcGx5IGNoaXAgcmV2aXNpb24iKQo+ID4gPiA+IEFja2VkLWJ5OiBQ
YXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KPiA+ID4gCj4gPiA+IEhpIEJyaWFuLCBzb3JyeSBm
b3IgdGhlIGRlbGF5LiBGb3Igc29tZSByZWFzb24geW91ciBtYWlscyBhcmUgYmVpbmcgZHVtcGVk
Cj4gPiA+IGJlZm9yZSB0aGV5IHJlYWNoIG1lIHNvIEkgb25seSBkaXNjb3ZlcmVkIHRoZXNlIHBh
dGNoZXMgd2hlbiBJIHBhaWQgcHJvcGVyCj4gPiA+IGF0dGVudGlvbiB0byB0aGUgcmVwbGllcyBh
bmQgZmV0Y2hlZCB0aGVtIGZyb20gcGF0Y2h3b3JrLgo+ID4gPiAKPiA+ID4gSGkgTGVlLCBpcyB0
aGUgc2FtZSB0aGluZyBoYXBwZW5pbmcgZm9yIHlvdT8gOy0pCj4gPiAKPiA+IEh1aCwgdGhhdCdz
IG9kZC4gSSBoYXZlbid0IHJhbiBpbnRvIHRoYXQgaXNzdWUgd2hlbiB3b3JraW5nIHdpdGggcGVv
cGxlCj4gPiBmcm9tIExpbmFybyBpbiBvdGhlciBzdWJzeXN0ZW1zLgo+ID4gCj4gPiBBcyBhIHNh
bml0eSBjaGVjaywgSSB1c2VkICdnaXQgc2VuZC1lbWFpbCcgdG8gc2VuZCB0aGlzIHBhdGNoIHRv
Cj4gPiBjaGVjay1hdXRoQHZlcmlmaWVyLnBvcnQyNS5jb20gYW5kIGl0IHZlcmlmaWVkIHRoYXQg
SSBzdGlsbCBoYXZlIFNQRiwKPiA+IERLSU0sIHJldmVyc2UgRE5TLCBldGMuIGFsbCBzZXR1cCBw
cm9wZXJseSBvbiB0aGlzIGRvbWFpbi4KPiA+IAo+ID4gaG90bWFpbC5jb20gYWRkcmVzc2VzIGFy
ZSB0aGUgb25seSBvbmVzIEkndmUgaGFkIGlzc3VlcyB3aXRoIGluIHRoZQo+ID4gcGFzdCwgYnV0
IEkgZG91YnQgeW91J3JlIGZvcndhcmRpbmcgeW91ciBlbWFpbCB0aGVyZS4gOikKPiAKPiBOby4u
LiBhbmQgc3RyYW5nZWx5IGVub3VnaCB5b3VyIHJlY2VudCBlLW1haWwgc2FpbGVkIHRocm91Z2gg
anVzdCBmaW5lLgo+IExldCdzIHdhaXQgYW5kIHNlZSB3aGF0IGlzIGhhcHBlbmluZyBmb3IgTGVl
ICh3aGljaCBJIHN1c3BlY3QgbWF5IG5vdCBiZQo+IHVudGlsIHdlbGwgaW50byBuZXh0IHdlZWsp
LgoKSnVzdCBjYXRjaGluZyB1cCBub3cuICBPbiBmaXJzdCBwYXNzIC0gb25seSB+ODAwIG1haWxz
IHRvIGdvIQoKTG9va3MgbGlrZSBJIGRvIGhhdmUgQnJpYW4ncyBtYWlscyB0aG91Z2guCgotLSAK
TGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFy
bzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
