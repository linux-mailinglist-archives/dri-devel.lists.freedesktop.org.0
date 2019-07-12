Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A367370
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 18:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED076E352;
	Fri, 12 Jul 2019 16:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE166E352
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 16:37:48 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id s7so21582760iob.11
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 09:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1uamx4VkpAz7OTzGeRs+kr2OaHae670D3WH4tTrkzLk=;
 b=YVPSv+mLJxfvLKp000EyXosGn6Ke4vFilx4ICf2c5mVHo0kb+hGMHMoPNDCGzfcLcH
 iHo9oLku4+g04v6mvaAq6DubFO+VUG0KjTbNnyVIw2p4zlA0L7tx7cmCjG9w4F93W3Gf
 FcvwLdd++yj6AKXHw/iZtEwuc67/CybRsTJ4jDlDavJZxeZ5VjhYsK/4V6p1XkRgyoVR
 fBzhWpoXEM+H7YAQDVJ07ISUfVCI0DAQD9SDRJoyxnWThnU78e9QbM3US7xak+EW/gZt
 fntGdvlwFQ2QjBnTJwZSilC6ydpCqI9iowWkR6VpFIzIUXX+aCe3OeYCYlvnU79+2B02
 BjBw==
X-Gm-Message-State: APjAAAV17MrSHezkrMcWMeQtwkDDCaZZ9rDCyjkZmQ5/OkpNbEx+uM4H
 Ua1p4Vof8F7k5ySCZepnvdsH1quYz60=
X-Google-Smtp-Source: APXvYqzsMmIK9BAwLzSCCkdlRYsiJZlwFGF1hzcHKdYQ8lA1Rjh+Idap3i3ivsvOtlp8F+udxMmH+w==
X-Received: by 2002:a02:6a22:: with SMTP id l34mr12756508jac.126.1562949467434; 
 Fri, 12 Jul 2019 09:37:47 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id n17sm7928973iog.63.2019.07.12.09.37.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 09:37:46 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id u19so21595043ior.9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 09:37:46 -0700 (PDT)
X-Received: by 2002:a5d:96d8:: with SMTP id r24mr11787238iol.269.1562949466057; 
 Fri, 12 Jul 2019 09:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190711203455.125667-1-dianders@chromium.org>
 <20190712060737.GA9569@ravnborg.org>
In-Reply-To: <20190712060737.GA9569@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 12 Jul 2019 09:37:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WG7SbdFu+-Kpr9JDQpNhQW+nA6tbfT2inwgTYF0mgdpQ@mail.gmail.com>
Message-ID: <CAD=FV=WG7SbdFu+-Kpr9JDQpNhQW+nA6tbfT2inwgTYF0mgdpQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] drm/panel: simple: Add mode support to devicetree
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1uamx4VkpAz7OTzGeRs+kr2OaHae670D3WH4tTrkzLk=;
 b=Ung3RKmkytToVTSIaF1K1EPHzaSzlQCF3R2XbQcAJRyz7bl1mtx5b1PJhTJ9UiIz+u
 nuYp5Vid428d8OLD/ZRfdS8NudBt+rNJ6fSN+7yt3pimr+f/ITICt1z3eTLFIAnaH+jm
 f7weMJmRsYu3sNIeBe88h9k5/qQOslWZNh+IU=
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUaHUsIEp1bCAxMSwgMjAxOSBhdCAxMTowNyBQTSBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+IHdyb3RlOgo+Cj4gSGkgRG91Zy4KPgo+IE9uIFRodSwgSnVsIDExLCAyMDE5
IGF0IDAxOjM0OjUyUE0gLTA3MDAsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBJJ20gcmV2
aXZpbmcgU2VhbiBQYXVsJ3Mgb2xkIHBhdGNoc2V0IHRvIGdldCBtb2RlIHN1cHBvcnQgaW4gZGV2
aWNlCj4gPiB0cmVlLiAgVGhlIGNvdmVyIGxldHRlciBmb3IgaGlzIHYzIGlzIGF0Ogo+ID4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTgtRmVicnVh
cnkvMTY1MTYyLmh0bWwKPiA+Cj4gPiB2NiBvZiB0aGlzIHBhdGNoIGlzIGp1c3QgYSByZXBvc3Qg
b2YgdGhlIDMgRFJNIHBhdGNoZXMgaW4gdjUgcmViYXNlZAo+ID4gYXRvcCBkcm0tbWlzYy4gIEEg
ZmV3IG5vdGVzOgo+ID4gLSBJJ3ZlIGRyb3BwZWQgdGhlIGJpbmRpbmdzIHBhdGNoLiAgQ29tbWl0
IDgyMWExZjcxNzFhZSAoImR0LWJpbmRpbmdzOgo+ID4gICBkaXNwbGF5OiBDb252ZXJ0IGNvbW1v
biBwYW5lbCBiaW5kaW5ncyB0byBEVCBzY2hlbWEiKSBoYXMgbGFuZGVkIGFuZAo+ID4gICBSb2Ig
SCBzYWlkIFsxXSB0aGF0IHdoZW4gdGhhdCBsYW5kZWQgdGhlIGJpbmRpbmdzIHdlcmUgaW1wbGlj
aXRseQo+ID4gICBzdXBwb3J0ZWQuCj4gPiAtIFNpbmNlIHRoZSBiaW5kaW5ncyBwYXRjaCB3YXMg
ZHJvcHBlZCBJIGFtIGFzc3VtaW5nIHRoYXQgSGVpa28KPiA+ICAgY2FuIGp1c3QgcGljayB1cCB0
aGUgLmR0cyBwYXRjaGVzIGZyb20gdGhlIHY1IHNlcmllcy4gIEkKPiA+ICAgZG91YmxlLWNoZWNr
ZWQgd2l0aCBoaW0gYW5kIGhlIGNvbmZpcm1lZCB0aGlzIGlzIGZpbmUuICBUaHVzIEkKPiA+ICAg
aGF2ZSBsZWZ0IHRoZSBkZXZpY2UgdHJlZSBwYXRjaGVzIG91dCBvZiB0aGlzIHZlcnNpb24uCj4g
Pgo+ID4gVGhlcmUgd2VyZSBzb21lIGNvZGluZyBzdHlsZSBkaXNjdXNzaW9ucyBvbiB2NSBvZiB0
aGUgcGF0aCBidXQgaXQncwo+ID4gYmVlbiBhZ3JlZWQgdGhhdCB3ZSBjYW4gbGFuZCB0aGlzIHNl
cmllcyBhcy1pcyBhbmQgYWZ0ZXIgaXQgbGFuZHMgd2UKPiA+IGNhbiBhZGRyZXNzIHRoZSBtaW5v
ciBzdHlsZSBpc3N1ZXMuCj4gPgo+ID4gWzFdIGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvQ0FM
X0pzcUpHdFVUcEpMK1NERUtpMDlhRFQ0eUR6WTR4OUt3WW16MDhOYVpjbj1uSGZBQG1haWwuZ21h
aWwuY29tCj4gPgo+ID4gQ2hhbmdlcyBpbiB2NjoKPiA+IC0gUmViYXNlZCB0byBkcm0tbWlzYyBu
ZXh0Cj4gPiAtIEFkZGVkIHRhZ3MKPiAuLi4KPgo+IFRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZSB3
aXRoIHRoaXMuCj4gQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0IGFuZCBwdXNoZWQgb3V0LgoKQXMg
cHJvbWlzZWQsIHBvc3RlZCB0aGUgZm9sbG93LXVwIHBhdGNoIGFkZHJlc3NpbmcgdGhlIHN0eWxl
IGNvbmNlcm5zCi8gc3VnZ2VzdGlvbnMuICBJIGRpZG4ndCBDQyBldmVyeSBsYXN0IHBlcnNvbiBo
ZXJlLCBidXQgaXQncyBvbiBMS01MCmFuZCBJJ20gaGFwcHkgZm9yIGFueW9uZSB0byByZXZpZXcg
aXQgdGhhdCBpcyBpbnRlcmVzdGVkOgoKaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDE5MDcx
MjE2MzMzMy4yMzE4ODQtMS1kaWFuZGVyc0BjaHJvbWl1bS5vcmcKCi1Eb3VnCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
