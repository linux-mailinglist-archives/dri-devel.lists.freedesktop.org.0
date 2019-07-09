Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F17A8642BA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B613589C61;
	Wed, 10 Jul 2019 07:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6093D89D84
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 11:59:24 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id 2so10442799vso.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 04:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RiTv9D9r+HWewv08+uDjzds8jJ160NpsMW3nG+2KdoY=;
 b=L82E1kCjxLvPjqCdw3fJO4kY7r5q+0yLBQrWJQNefuGJgLuj/DnUklmoLGVdGcjeFd
 pirPzKj54hP677mWxqIH8ouaCVsLYimcQm9bIxPt1lPaBJMgF2d69o0zTcfNf9/v9OlC
 z2xYkloEZLP730RKJJ5HXQv19VhhBuApziXec5n+ZS4CvMYfjUxOkMrylmZjtNf8RiXg
 7SA903XORI662eYlBrWjFi3/NuC3ZGUGHZaJE5F4E5HEwbtAWgWAYZxr5ILxddXKGDWD
 SK38DJ6cSCkVwIIWDKwod07lFn3ppuvzFqNbJ2ZUPXXrUVj9ymOdJvHoZwHK7d2F/O2l
 mpeA==
X-Gm-Message-State: APjAAAXGOCBAaBxySm57H0LjDsURX6iu03/HvfX6RKENxy4HrloB2ztE
 rJP3p1X18ecM7Cc1aRTloNZF+qjlqTlEx7emsB6Dkw==
X-Google-Smtp-Source: APXvYqyNbkbPQt5s+GfBLT3QI7iGlZiQWtRzOE3HxXG0lIDjqNAi3SYslwEYCGrQlbUmVYhU38as6OOl9n5yJb/dYW4=
X-Received: by 2002:a67:d386:: with SMTP id b6mr14020005vsj.170.1562673563188; 
 Tue, 09 Jul 2019 04:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
 <CA+Px+wXtmf9dQQP7ywPLp7Qbbvqau=WnO3qhZ8+qmbJD1gjx+A@mail.gmail.com>
 <20190705121240.GA20625@sirena.org.uk>
 <CAFv8NwLP-hUBW8FZW5kooaggeNRG7LAEd2pd_-70YBrVMY-+CQ@mail.gmail.com>
In-Reply-To: <CAFv8NwLP-hUBW8FZW5kooaggeNRG7LAEd2pd_-70YBrVMY-+CQ@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 9 Jul 2019 19:58:56 +0800
Message-ID: <CAFv8NwJHpY+ptc+WbeRhsKB8wGnt08r38GG7WUYTrt=wZaGqqA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: hdmi-codec: Add an op to set callback function
 for plug event
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RiTv9D9r+HWewv08+uDjzds8jJ160NpsMW3nG+2KdoY=;
 b=b6eUu3HOZ32VMVxihS1TEiZDDJGMWpTKkUmCzgDy0Wn1UIqQ2Hg/sRGYSq7RTss8Dt
 EUsDIbda6QYf9S42qsjMSo76RaQmk/AXAegCp/GvMR+GeNmoH1GewBpHbDxaucdsY43j
 Ic831T+DuHkmI1k4SYW5LLWcFpi0VyYWE6dxU=
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, Jaroslav Kysela <perex@perex.cz>,
 Hans Verkuil <hverkuil@xs4all.nl>, Tzung-Bi Shih <tzungbi@google.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCAxOjAzIFBNIENoZW5nLXlpIENoaWFuZyA8Y3ljaGlhbmdA
Y2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVsIDUsIDIwMTkgYXQgODoxMiBQTSBN
YXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgSnVs
IDA1LCAyMDE5IGF0IDAzOjA4OjM3UE0gKzA4MDAsIFR6dW5nLUJpIFNoaWggd3JvdGU6Cj4gPiA+
IE9uIEZyaSwgSnVsIDUsIDIwMTkgYXQgMTI6MjYgUE0gQ2hlbmctWWkgQ2hpYW5nIDxjeWNoaWFu
Z0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+ID4gPiArdHlwZWRlZiB2b2lkICgqaGRtaV9j
b2RlY19wbHVnZ2VkX2NiKShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYsCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHBsdWdnZWQpOwo+ID4gPiA+
ICsKPiA+Cj4gPiA+IFRoZSBjYWxsYmFjayBwcm90b3R5cGUgaXMgIndlaXJkIiBieSBzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlLiAgSXMgaXQKPiA+ID4gcG9zc2libGUgdG8gaGF2aW5nIHNuZF9zb2Nf
Y29tcG9uZW50IGluc3RlYWQgb2YgcGxhdGZvcm1fZGV2aWNlPwo+ID4KPiA+IE9yIGlmIGl0J3Mg
Z290IHRvIGJlIGEgZGV2aWNlIHdoeSBub3QganVzdCBhIGdlbmVyaWMgZGV2aWNlIHNvCj4gPiB3
ZSdyZSBub3QgdGllZCB0byBhIHBhcnRpY3VsYXIgYnVzIGhlcmU/Cj4KPiBNeSBpbnRlbnRpb24g
d2FzIHRvIGludm9rZSB0aGUgY2FsbCBpbiBkdy1oZG1pLmMgbGlrZSB0aGlzOgo+Cj4gICAgIGhk
bWktPnBsdWdnZWRfY2IoaGRtaS0+YXVkaW8sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZXN1bHQgPT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQpOwo+Cj4gSGVyZSBo
ZG1pLT5hdWRpbyBpcyBhIHBsYXRmb3JtX2RldmljZS4KPiBJIHRoaW5rIGR3LWhkbWkgY2FuIG5v
dCBnZXQgIHNuZF9zb2NfY29tcG9uZW50IGVhc2lseS4KPiBJIGNhbiB1c2UgYSBnZW5lcmljIGRl
dmljZSBoZXJlIHNvIHRoZSBvcHMgaXMgbW9yZSBnZW5lcmFsLgo+IFRoZSBjYWxsaW5nIHdpbGwg
YmUgbGlrZQo+ICAgICBoZG1pLT5wbHVnZ2VkX2NiKCZoZG1pLT5hdWRpby0+ZGV2LAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVzdWx0ID09IGNvbm5lY3Rvcl9zdGF0dXNf
Y29ubmVjdGVkKTsKPiBJIHdpbGwgdXBkYXRlIHRoaXMgaW4gdjIuCj4gVGhhbmtzIQoKSSBoYXZl
IHRob3VnaHQgYWJvdXQgdGhpcyBhIGJpdCBtb3JlLiBBbmQgSSB0aGluayB0aGUgbW9yZSBwcm9w
ZXIKaW50ZXJmYWNlIGlzIHRvIHBhc3MgaW4gYSBnZW5lcmljIHN0cnVjdCBkZXZpY2UqIGZvciBj
b2RlYy4KVGhpcyB3YXksIHRoZSB1c2VyIG9mIGhkbWktY29kZWMgZHJpdmVyIG9uIHRoZSBEUk0g
c2lkZSBpcyBub3QgbGltaXRlZAp0byB0aGUgcmVsYXRpb24gY2hhaW4gb2YKYXVkaW8gcGxhdGZv
cm0gZGV2aWNlIC0+IGNvZGVjIHBsYXRmb3JtIGRldmljZSwgd2hpY2ggaXMganVzdCBhCnNwZWNp
YWwgY2FzZSBpbiBkdy1oZG1pIGRyaXZlci4KQXMgbG9uZyBhcyBEUk0gc2lkZSBjYW4gZ2V0IGhk
bWktY29kZWMgZGV2aWNlIHBvaW50ZXIgdGhyb3VnaApkcnZfZGF0YSwgaXQgY2FuIHVzZSB0aGlz
IGNhbGxiYWNrLgpIb3BlIHRoaXMgbWFrZXMgdGhlIGludGVyZmFjZSBtb3JlIGdlbmVyaWMuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
