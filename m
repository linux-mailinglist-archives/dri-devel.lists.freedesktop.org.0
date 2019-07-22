Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE7B7086E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45E389DC1;
	Mon, 22 Jul 2019 18:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A43989DC1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:26:48 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id o9so76173013iom.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xd8+bke3yG/y3dYsucasUXPsB26BxcN6ADe6/HW5ETc=;
 b=Wn77IP/YOWupSkOe/6prElHAp9ST2Xxn6Uz21PMtZIYcicTW4wMqvLg/0tEgGZH/r9
 69qpV5Lh5JoaPUK01PX3b51I93ehJ8eyor7pRwjxQ99VPXJoKdHC/jlgCpyg9md++Zga
 oQFh959R3nhAYuJCOYd9CTJQjcx2O4Xs62GIe/VcH2e1jMTVuX1DSx3uBzVj0l21j5BD
 xqmEmHokmNZy/Qtrev6zoUktDDnUsC8XYp+rNOuiiZ/ATEsA6XraF6cTnb4uoiRLxz/+
 eyyf+JktesYHgXk0kH4l0ci57HuGYnCx67lr8YIvYIiaQuj8nTZjgxwK1iMtrfV0Q0Y/
 JwaQ==
X-Gm-Message-State: APjAAAUf4wapaZDDGl0Gs/oKUuNHe/OoMsrokhkeEkxGP4E+dcTS9dAS
 U6zxl7EbHpOIa8VIAK8aOmfwJ4QVsw0=
X-Google-Smtp-Source: APXvYqw4KJpd/vCDeagbLofMDbbVUei77/+KELPYwPIpB1XP7EPVeqbp46ih0aagkYui2lTSZbZojg==
X-Received: by 2002:a02:a703:: with SMTP id k3mr6951793jam.12.1563820007455;
 Mon, 22 Jul 2019 11:26:47 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id l2sm28799052ioh.20.2019.07.22.11.26.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 11:26:46 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id h6so76068772iom.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:26:46 -0700 (PDT)
X-Received: by 2002:a5e:db0a:: with SMTP id q10mr50198497iop.168.1563820006498; 
 Mon, 22 Jul 2019 11:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190712163333.231884-1-dianders@chromium.org>
 <20190717173317.GA4862@ravnborg.org> <20190721093815.GA4375@ravnborg.org>
In-Reply-To: <20190721093815.GA4375@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2019 11:26:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+JR1r1+w1QRpOTu4jjr6AKy_DV_cetqRONO+dGgnFJw@mail.gmail.com>
Message-ID: <CAD=FV=X+JR1r1+w1QRpOTu4jjr6AKy_DV_cetqRONO+dGgnFJw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Doxygenize 'struct panel_desc'; rename
 a few functions
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Xd8+bke3yG/y3dYsucasUXPsB26BxcN6ADe6/HW5ETc=;
 b=Ge0uFG/2wqPxirgpCGl6xtgNoTIUW/0V8GH3t6EBdA4MT1xJr201XDTOPkxjai9n3b
 0yFoJhBVZPr8eyCdj/JzM3tbg1v30b+8GOuw71B7wiUoaGEz/c2Qs2fC68TjR70vEGEp
 AQxg/IxGsAVXB9moRs7/lxX+IFyhUw45JXbI0=
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
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBTdW4sIEp1bCAyMSwgMjAxOSBhdCAyOjM4IEFNIFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4gd3JvdGU6Cj4KPiBIaSBEb3VnLgo+Cj4gT24gV2VkLCBKdWwgMTcsIDIwMTkg
YXQgMDc6MzM6MTdQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gSGkgRG91Zy4KPiA+
Cj4gPiBPbiBGcmksIEp1bCAxMiwgMjAxOSBhdCAwOTozMzozM0FNIC0wNzAwLCBEb3VnbGFzIEFu
ZGVyc29uIHdyb3RlOgo+ID4gPiBUaGlzIGF0dGVtcHRzIHRvIGFkZHJlc3Mgb3V0c3RhbmRpbmcg
cmV2aWV3IGZlZWRiYWNrIGZyb20gY29tbWl0Cj4gPiA+IGI4YTI5NDhmYTJiMyAoImRybS9wYW5l
bDogc2ltcGxlOiBBZGQgYWJpbGl0eSB0byBvdmVycmlkZSB0eXBpY2FsCj4gPiA+IHRpbWluZyIp
LiAgU3BlY2lmaWNhbGx5Ogo+ID4gPgo+ID4gPiAqIEl0IHdhcyByZXF1ZXN0ZWQgdGhhdCBJIGRv
Y3VtZW50IChpbiB0aGUgc3RydWN0dXJlIGRlZmluaXRpb24pIHRoYXQKPiA+ID4gICB0aGUgZGV2
aWNlIHRyZWUgb3ZlcnJpZGUgaGFkIG5vIGVmZmVjdCBpZiAnc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUnCj4gPiA+ICAgd2FzIHVzZWQgaW4gdGhlIHBhbmVsIGRlc2NyaXB0aW9uLiAgSSBoYXZlIHBy
b3ZpZGVkIGZ1bGwgRG94eWdlbgo+ID4gPiAgIGNvbW1lbnRzIGZvciAnc3RydWN0IHBhbmVsX2Rl
c2MnIHRvIGFjY29tcGxpc2ggdGhhdC4KPiA+ID4gKiBwYW5lbF9zaW1wbGVfZ2V0X2ZpeGVkX21v
ZGVzKCkgd2FzIHRob3VnaHQgdG8gYmUgYSBjb25mdXNpbmcgbmFtZSwKPiA+ID4gICBzbyBpdCBo
YXMgYmVlbiByZW5hbWVkIHRvIHBhbmVsX3NpbXBsZV9nZXRfZGlzcGxheV9tb2RlcygpLgo+ID4g
PiAqIHBhbmVsX3NpbXBsZV9wYXJzZV9vdmVycmlkZV9tb2RlKCkgd2FzIHRob3VnaHQgdG8gYmUg
YmV0dGVyIG5hbWVkIGFzCj4gPiA+ICAgcGFuZWxfc2ltcGxlX3BhcnNlX3BhbmVsX3RpbWluZ19u
b2RlKCkuCj4gPiA+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0Bj
aHJvbWl1bS5vcmc+Cj4gPgo+ID4gVGhhbmtzLgo+ID4KPiA+IEkgdXBkYXRlZCB0aGUgJHN1Ympl
Y3QgdG86Cj4gPiAgICAgZHJtL3BhbmVsOiBzaW1wbGU6IGRvY3VtZW50IHBhbmVsX2Rlc2M7IHJl
bmFtZSBhIGZldyBmdW5jdGlvbnMKPiA+Cj4gPiBBbmQgcHVzaGVkIG91dCB0byBkcm0tbWlzYy1u
ZXh0Lgo+Cj4gSSBzZWUgdGhlIGZvbGxvd2luZyBlcnJvciBwcmludGVkIGF0IGVhY2ggYm9vdDoK
Pgo+ICAgICAvcGFuZWw6IGNvdWxkIG5vdCBmaW5kIG5vZGUgJ3BhbmVsLXRpbWluZycKPgo+IFRo
ZSBlcnJvciBvcmlnaW5hdGVzIGZyb20gdGhpcyBzbmlwIChmcm9tIHBhbmVsLXNpbXBsZS5jKToK
Pgo+ICAgICAgICBpZiAoIW9mX2dldF9kaXNwbGF5X3RpbWluZyhkZXYtPm9mX25vZGUsICJwYW5l
bC10aW1pbmciLCAmZHQpKQo+ICAgICAgICAgICAgICAgICBwYW5lbF9zaW1wbGVfcGFyc2VfcGFu
ZWxfdGltaW5nX25vZGUoZGV2LCBwYW5lbCwgJmR0KTsKPgo+IG9mX2dldF9kaXNwbGF5X3RpbWlu
ZygpIHJldHVybnMgLTIgKC1FTk9FTlQpLgo+Cj4gSW4gdGhlIHNldHVwIEkgdXNlIHRoZXJlIGlz
IG5vIHBhbmVsLXRpbWluZyBub2RlIGFzIHRoZSB0aW1pbmcgc3BlY2lmaWVkCj4gaW4gcGFuZWwt
c2ltcGxlLmMgaXMgZmluZS4KPiBUaGlzIGlzIHRoZSB0eXBpY2FsIHNldHVwIC0gYW5kIHRoZXJl
IHNob3VsZCBub3QgaW4gdGhlIG5vcm1hbCBjYXNlCj4gYmUgcHJpbnRlZCBlcnJvciBtZXNzYWdl
cyBsaWtlIHRoaXMgZHVyaW5nIGJvb3QuCj4KPiBXaWxsIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sg
YXQgdGhpcy4KCkJyZWFkY3J1bWJzOiBzZXJpZXMgaGFzIGJlZW4gcG9zdGVkIHRvIGFkZHJlc3Mg
dGhpcy4gIFBUQUwuCgpodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMTkwNzIyMTgyNDM5LjQ0
ODQ0LTEtZGlhbmRlcnNAY2hyb21pdW0ub3JnCgoKLURvdWcKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
