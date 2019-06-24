Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E851823
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 18:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2232E89CB9;
	Mon, 24 Jun 2019 16:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B8D89CB9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:13:11 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y17so10509156lfe.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 09:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/GZPxaE4LPUF9+J5HPzKoEU19i8mw9pm9OwqCmXFx/U=;
 b=XihzQsGfEhdQgfD/bRi9dyurhl2g480TjLiV8R26rXY7huLGQHwAwUeWU93pC7Vd8U
 S5ZVU3yyZK2DIVqb5Uwop+0GwACYck25skTBlMj1SQ1AFbg9HRy7jOccIaHNlMWnU9Rg
 2DZfEKDIleTREjMxIfQ20RedfUK5xRb2hu3FJWTzOSJkELKiDxcEcsWbAjQHW7Uy0yTe
 5ypARX3ScY0ZKiLXMVWy9Z4DPqwQJNpWIYTvMJuuIQu6Sl9SKZIvO22C9clgAMAK2LT1
 36yB1bJ/ROEUqH/2GKTM86NthFKdVzgBRVdKytBeDsclR7gBKF0COYcHzvHkZITbvbpd
 i0Gw==
X-Gm-Message-State: APjAAAXpo9YNXTClAEaW7gH3gSk3Mo2NZb+QV7WmebupFfhtbGK2HfZU
 tOm9dymr32TqjJeuc2VkwpXXUHBbRehNS1kpFm4=
X-Google-Smtp-Source: APXvYqxdP+JVlW5k+mSxUHwcly0JYp6JIPTVU2yVYp4LrSzBHV3NclYDyyL6oWgS9snh6oT01HXaRzoS5AtTl62eGn0=
X-Received: by 2002:a19:5046:: with SMTP id z6mr28946753lfj.185.1561392789879; 
 Mon, 24 Jun 2019 09:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
 <1561037428-13855-3-git-send-email-robert.chiras@nxp.com>
 <CAOMZO5DS2v15h9E=qKg2vKuFkBSQQwdBHA5Th5mZ+ca6DWgQsw@mail.gmail.com>
 <1561362278.9328.83.camel@nxp.com>
In-Reply-To: <1561362278.9328.83.camel@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Jun 2019 13:12:58 -0300
Message-ID: <CAOMZO5CVPJqE0dR2PZvKem4WHztvTF=FT9K1x-b7TduH-yYb7A@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v3 2/2] drm/panel: Add support for Raydium
 RM67191 panel driver
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/GZPxaE4LPUF9+J5HPzKoEU19i8mw9pm9OwqCmXFx/U=;
 b=Lq5xNcua1mi5U4qn9dT42BftsIszZlSpZZBUj17GZ1uG6Fe0nW/3v1hVO9AHREiul6
 hLc7Z3BVLRPgBZ7oyFnDtYNipFqViKYVjlJB7hnP6oJStr+tm3yUCMkE12D6nZWkvQ5s
 siA+nTZtbq8EEvEIUt/hGxcIYFgvNRlUXQjaMfCDAeQpCpqdI6OburRt3HmHKr/AYgNB
 MepAdaWUnXGI7od7JnYyNbq0kmjXHDzwMomFt+0CnqGFMCjawuJDYg5V3gs9j0m9eu/I
 tYM4XNa0/RsOVKntoQNGKqoOikRgaMiCt+RkoW/DkC9xO/BySbqATIYr6D/quf3e4e3W
 /cOA==
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNDo0NCBBTSBSb2JlcnQgQ2hpcmFz
IDxyb2JlcnQuY2hpcmFzQG54cC5jb20+IHdyb3RlOgoKPiA+IFlvdSBkaWQgbm90IGhhbmRsZSB0
aGUgInBvd2VyIiByZWd1bGF0b3IuCj4gVGhlcmUgaXMgbm8gbmVlZCBmb3IgYSBwb3dlciByZWd1
bGF0b3IuCgpJIGFtIHN1cmUgdGhlIHBhbmVsIHJlcXVpcmVzIHBvd2VyIHRvIGJlIGFwcGxpZWQg
c28gdGhhdCBpdCBjYW4gd29yayA6LSkKCj4gPiBDYW4ndCB5b3Ugc2ltcGx5IHJlbW92ZSB0aGVt
Pwo+IFRoZSByZXNldCBncGlvIHBpbiBpcyBzaGFyZWQgYmV0d2VlbiB0aGUgRFNJIGRpc3BsYXkg
Y29udHJvbGxlciBhbmQKCkxvb2tpbmcgYXQgdGhlIGlteDhtcS1ldmsgc2NoZW1hdGljcyBpdCBp
cyBub3QgY2xlYXIgZm9yIG1lIHdoYXQgcGluCmluIHNoYXJlZCBiZXR3ZWVuIHRoZSBPTEVEIGRp
c3BsYXkgYW5kIHRvdWNoIHNjcmVlbi4KCkNvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSB3aGljaCBw
aW4geW91IGFyZSByZWZlcnJpbmcgdG8/Cgo+IHRvdWNoIGNvbnRyb2xsZXIsIGJvdGggZm91bmQg
b24gdGhlIHNhbWUgcGFuZWwuIFNpbmNlLCB0aGUgdG91Y2ggZHJpdmVyCj4gYWxzbyBhY2Nlc2Vz
IHRoaXMgZ3BpbyBwaW4sIGluIHNvbWUgY2FzZXMgdGhlIGRpc3BsYXkgY2FuIGJlIHB1dCB0bwo+
IHNsZWVwLCBidXQgdGhlIHRvdWNoIGlzIHN0aWxsIGFjdGl2ZS4gVGhpcyBpcyB3aHksIGR1cmlu
ZyBzdXNwZW5kIEkKPiByZWxlYXNlIHRoZSBncGlvIHJlc291cmNlLCBhbmQgSSBoYXZlIHRvIHRh
a2UgaXQgYmFjayBpbiByZXN1bWUuCj4gV2l0aG91dCB0aGlzIHJlbGVhc2UvYWNxdWlyZSBtZWNo
YW5pc20gZHVyaW5nIHN1c3BlbmQvcmVzdW1lLCBzdHJlc3MtCj4gdGVzdHMgc2hvd2VkIHNvbWUg
ZmFpbHVyZXM6IHRoZSByZXN1bWUgZnJlZXplcyBjb21wbGV0bHkuCgpMb29raW5nIGF0IHRoZSBp
bXg4bXEtZXZrIGR0cyBmcm9tIHRoZSB2ZW5kb3IgdHJlZSBJIHNlZSB0aGF0IHRoZQp0b3VjaHNj
cmVlbiBpcyBub3Qgc3VwcG9ydGVkIGluIG1haW5saW5lIHlldC4KCk1heWJlIHRoZXJlIGlzIGEg
YmV0dGVyIHdheSB0byBzb2x2ZSB0aGlzLCBzbyB3aGF0IGlmIHlvdSBkb24ndAppbnRyb2R1Y2Ug
dGhlIHN1c3BlbmQvcmVzdW1lIGhvb2tzIGZvciBub3cgYW5kIHRoZW4gd2UgcmV2aXNpdCB0aGlz
CmFmdGVyIHRoZSB0b3VjaHNjcmVlbiBkcml2ZXIgaXMgYWRkZWQ/Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
