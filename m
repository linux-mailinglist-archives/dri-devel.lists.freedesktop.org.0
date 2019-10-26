Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECCBE5E29
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 19:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3AC6E0C8;
	Sat, 26 Oct 2019 17:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2496E0B9
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2019 17:19:07 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id p13so3126012pll.4
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2019 10:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XJ2OTe+YJhZKDPOKv2vH6Q6K0N8s/caGH/kB608TKt8=;
 b=A40gkNbh0UvghgZMJyf6yfT2QGYYNdNPdpqZ2ipNJGqzgvcUNfDVwl6WOG0Ii7VHRr
 EhgYYSmdK/771b7iwHMchr0SQzrtqdJCV7gwKqDZhVLqbz35ZbNrSKmJK8qjt1WVQuPI
 Yt2x/aCfScKuhyVpCNRFT5HND+VQU0Pn6NLemAVuo7pIxSKzJPYno/W1DqYh3DdDsz4j
 GLiN8ARXOf5L0zywmH071b8QPPeG3xcifRxmB8SIivsrG2p12Y8LYXDv/Dc2r2Fxv9Oq
 ySbbyVI+XWZzQZHzEBRUtuhP6+T6MDi9HwoXSpZhBCitAw1lfKvOKpJBJtpEIez30eCy
 sFcA==
X-Gm-Message-State: APjAAAUe7VOVDNxd9RDDt3MUtBewLDvmdBMwJ4bVZs3JK2D0yKvNLmU/
 1gD9O7+8tx+HmnY/9n+8pwIeiRdzmyp1WPwy08291Q==
X-Google-Smtp-Source: APXvYqxVqfwJ/ddt02LfEd8cvon5v+MggvIiTlWYGWcVUPPJDQOWOIQhls1waYXlhWsELgoeWEiG1pcJ8N4muKqlxnU=
X-Received: by 2002:a17:902:864a:: with SMTP id
 y10mr10096482plt.162.1572110347046; 
 Sat, 26 Oct 2019 10:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191023001206.15741-1-rajatja@google.com>
 <20191024112040.GE2825247@ulmo>
 <CAA93t1ozojwgVoLCZ=AWx72yddQoiaZCMFG35gQg3mQL9n9Z2w@mail.gmail.com>
 <20191025113609.GB928835@ulmo>
 <CAPj87rNe20nFcFNcijFwOZLQU_E+C2HyzEjtigJ-ehiLCq42iA@mail.gmail.com>
In-Reply-To: <CAPj87rNe20nFcFNcijFwOZLQU_E+C2HyzEjtigJ-ehiLCq42iA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 26 Oct 2019 19:18:54 +0200
Message-ID: <CAKMK7uGjd1CJ+XDWPQShV_fADC5ndxdf_ecO61K4VDi6EZyMEQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm: Add support for integrated privacy
 screens
To: Daniel Stone <daniel@fooishbar.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XJ2OTe+YJhZKDPOKv2vH6Q6K0N8s/caGH/kB608TKt8=;
 b=eyLk4QNAvuzO/V4qc5beDIpydWz0nT1Z7PbayMVwyIxnU48/j0WH6rDiGC60Rm/K98
 aCDKNmnmTd9UDDrUpdqZ2cdo1AvA/F07bWJgiN9HOD9eALRWv85Zi/NQCdabmHFxOnT7
 AKzgjCtSK9D8lWUKV3je5GJoddOmxB4dhlIdY=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Duncan Laurie <dlaurie@google.com>, Rajat Jain <rajatxjain@gmail.com>,
 Sean Paul <seanpaul@google.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Mat King <mathewk@google.com>,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@denx.de>,
 Rajat Jain <rajatja@google.com>, Jesse Barnes <jsbarnes@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMjYsIDIwMTkgYXQgMTowNyBQTSBEYW5pZWwgU3RvbmUgPGRhbmllbEBmb29p
c2hiYXIub3JnPiB3cm90ZToKPgo+IEhpIFRoaWVycnksCj4KPiBPbiBGcmksIDI1IE9jdCAyMDE5
IGF0IDEyOjM2LCBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPiB3cm90
ZToKPiA+IE9uIFRodSwgT2N0IDI0LCAyMDE5IGF0IDAxOjQ1OjE2UE0gLTA3MDAsIFJhamF0IEph
aW4gd3JvdGU6Cj4gPiA+IEkgZGlkIHRoaW5rIGFib3V0IGhhdmluZyBhIHN0YXRlIHZhcmlhYmxl
IGluIHNvZnR3YXJlIHRvIGdldCBhbmQgc2V0Cj4gPiA+IHRoaXMuIEhvd2V2ZXIsIEkgdGhpbmsg
aXQgaXMgbm90IHZlcnkgZmFyIGZldGNoZWQgdGhhdCBzb21lIHBsYXRmb3Jtcwo+ID4gPiBtYXkg
aGF2ZSAiaGFyZHdhcmUga2lsbCIgc3dpdGNoZXMgdGhhdCBhbGxvdyBoYXJkd2FyZSB0byBzd2l0
Y2gKPiA+ID4gcHJpdmFjeS1zY3JlZW4gb24gYW5kIG9mZiBkaXJlY3RseSwgaW4gYWRkaXRpb24g
dG8gdGhlIHNvZnR3YXJlCj4gPiA+IGNvbnRyb2wgdGhhdCB3ZSBhcmUgaW1wbGVtZW50aW5nLiBQ
cml2YWN5IGlzIGEgdG91Y2h5IHN1YmplY3QgaW4KPiA+ID4gZW50ZXJwcmlzZSwgYW5kIGFueXRo
aW5nIHRoYXQgcmVkdWNlcyB0aGUgcG9zc2liaWxpdHkgb2YgaGF2aW5nIGFueQo+ID4gPiBpbmNv
bnNpc3RlbmN5IGJldHdlZW4gc29mdHdhcmUgc3RhdGUgYW5kIGhhcmR3YXJlIHN0YXRlIGlzIGRl
c2lyYWJsZS4KPiA+ID4gU28gaW4gdGhpcyBjYXNlLCBJIGNob3NlIHRvIG5vdCBoYXZlIGEgc3Rh
dGUgaW4gc29mdHdhcmUgYWJvdXQgdGhpcyAtCj4gPiA+IHdlIGp1c3QgcmVwb3J0IHRoZSBoYXJk
d2FyZSBzdGF0ZSBldmVyeXRpbWUgd2UgYXJlIGFza2VkIGZvciBpdC4KPiA+Cj4gPiBTbyB0aGlz
IGRvZXNuJ3QgcmVhbGx5IHdvcmsgd2l0aCBhdG9taWMgS01TLCB0aGVuLiBUaGUgbWFpbiBpZGVh
IGJlaGluZAo+ID4gYXRvbWljIEtNUyBpcyB0aGF0IHlvdSBhcHBseSBhIGNvbmZpZ3VyYXRpb24g
ZWl0aGVyIGNvbXBsZXRlbHkgb3Igbm90IGF0Cj4gPiBhbGwuIFNvIGF0IGxlYXN0IGZvciBzZXR0
aW5nIHRoaXMgcHJvcGVydHkgeW91J2QgaGF2ZSB0byBnbyB0aHJvdWdoIHRoZQo+ID4gc3RhdGUg
b2JqZWN0Lgo+ID4KPiA+IE5vdywgZm9yIHJlYWRpbmcgb3V0IHRoZSBwcm9wZXJ0eSB5b3UgbWln
aHQgYmUgYWJsZSB0byBnZXQgYXdheSB3aXRoIHRoZQo+ID4gYWJvdmUuIEknbSBub3Qgc3VyZSBp
ZiB0aGF0J3MgZW5vdWdoIHRvIGtlZXAgdGhlIHN0YXRlIHVwLXRvLWRhdGUsCj4gPiB0aG91Z2gu
IElzIHRoZXJlIHNvbWUgd2F5IGZvciBhIGtpbGwgc3dpdGNoIHRvIHRyaWdnZXIgYW4gaW50ZXJy
dXB0IG9yCj4gPiBvdGhlciBldmVudCBvZiBzb21lIHNvcnQgc28gdGhhdCB0aGUgc3RhdGUgY291
bGQgYmUga2VwdCB1cC10by1kYXRlPwo+ID4KPiA+IERhbmllbCAob3IgYW55b25lIGVsc2UpLCBk
byB5b3Uga25vdyBvZiBhbnkgcHJlY2VkZW50IGZvciBzdGF0ZSB0aGF0Cj4gPiBtaWdodCBnZXQg
bW9kaWZpZWQgYmVoaW5kIHRoZSBhdG9taWMgaGVscGVycycgYmFjaz8gU2VlbXMgdG8gbWUgbGlr
ZSB3ZQo+ID4gbmVlZCB0byBmaW5kIHNvbWUgcG9pbnQgd2hlcmUgd2UgY2FuIGFjdHVhbGx5IHJl
YWQgYmFjayB0aGUgY3VycmVudAo+ID4gImhhcmR3YXJlIHZhbHVlIiBvZiB0aGlzIHByaXZhY3kg
c2NyZWVuIHByb3BlcnR5IGFuZCBzdG9yZSB0aGF0IGJhY2sKPiA+IGludG8gdGhlIHN0YXRlLgo+
Cj4gV2VsbCwgYXBhcnQgZnJvbSBjb25uZWN0b3Igc3RhdGUsIHRob3VnaCB0aGF0IGlzbid0IHJl
YWxseSBhIHByb3BlcnR5Cj4gYXMgc3VjaCwgdGhlcmUncyB0aGUgbGlua19zdGF0ZSBwcm9wZXJ0
eSwgd2hpY2ggaXMgZXhwbGljaXRseSBkZXNpZ25lZAo+IHRvIGRvIGp1c3QgdGhhdC4gVGhhdCBo
YXMgYmVlbiBxdWl0ZSBjYXJlZnVsbHkgZGVzaWduZWQgZm9yIHRoZQo+IGJhY2stYW5kLWZvcnRo
IHRob3VnaC4KCmNvbm5lY3RvciBzdGF0ZSBpcyBhbiBpbW11dGFibGUgcHJvcGVydHksIHdoaWNo
IGlzIGEgaGlsYXJpb3VzIHdheSB0bwpzYXkgdGhhdCAib25seSB0aGUgZHJpdmVyIGNhbiB1cGRh
dGUgaXQsIHVzZXJzcGFjZSBvbmx5IHJlYWRzIGl0Ii4gU28Kbm90IGEgZ29vZCB0ZW1wbGF0ZSBo
ZXJlLiBCdXQgeWVhaCBsaW5rX3N0YXRlIGlzIGEgZ29vZCBleGFtcGxlIG9mCndoYXQgd2UgbmVl
ZCBoZXJlLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
