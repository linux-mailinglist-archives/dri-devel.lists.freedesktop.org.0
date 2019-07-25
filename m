Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC87507D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10076E77A;
	Thu, 25 Jul 2019 14:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A6B6E77A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:02:28 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id j11so27477349otp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 07:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NenKHDo5B/W1OyWyTiHNDLoU7vH3G/zkdxqV3DFAuZI=;
 b=Ru0g6oQ5/b1DSdLLpy62sQB22E1WdTTPxnGDI3QN9FTQkEVno7I3w4dXAydxWrDUoF
 F+F3VeuO5eBDIBJwElp1Wn92XNZkaOpZPXwnjRjn5C9Q5Xjgp3T4H64X6+2yF1pKlHMa
 MGtXxCp1XAoszScX9asO0NFfd0/AREs2MQ9hZQreCWkRflD0DSGgLGUZrXVnsaWV8dHi
 kd0J8I5KoPYK2EEUVPa85pb2gR0v5jKTSN9oWnklFHXkbRNp5mKLDLONkIrbiBvBVQ26
 F4LkMP0gPKGby2a0qOv7sGz+w1vlNmNuHTF88I7MjnoyjX/1WAfSjEYpjkUxC3+RAp4C
 UD4g==
X-Gm-Message-State: APjAAAVxRK3p3yI+E8tyigILgRwzy846eU9sG862sfuG5lLo57jhMV8c
 SAvwV5oItBPo4yxn88s9DM1HQZiXiJMGwR2v82k=
X-Google-Smtp-Source: APXvYqw6SpadMrBo6jrNywYhuQeAckTcEOKoJ68H9r5jSAgy36KDJ/ESjlCn898Na4BZ0F/QUyB5qq7/+lrdQJJJvTU=
X-Received: by 2002:a9d:6e8d:: with SMTP id a13mr15636525otr.303.1564063347400; 
 Thu, 25 Jul 2019 07:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
 <20190724114851.GY15868@phenom.ffwll.local>
 <30f693a33f5a45ce84673fd8d7cecc7a@AUSX13MPC105.AMER.DELL.COM>
 <42946AB1-3732-467D-ABC9-C7ED3C9C4D06@canonical.com>
 <20190725115909.GA15868@phenom.ffwll.local>
 <20190725131239.GA8684@ravnborg.org>
In-Reply-To: <20190725131239.GA8684@ravnborg.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Jul 2019 16:02:16 +0200
Message-ID: <CAKMK7uHfR8vP65gWb=RjHAQwKTAtiAfzVeDt2Zff5baqKY3TVw@mail.gmail.com>
Subject: Re: OLED panel brightness support
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NenKHDo5B/W1OyWyTiHNDLoU7vH3G/zkdxqV3DFAuZI=;
 b=AYnypBCM3BhItw0W+yUtCiN++SnlPIUKX4BEm9boeDDPquoc0E43AxMlTQytGuajz+
 IQaNosu8974UxgXTclWCgtSH7d/hebRreAfsiPnd7IabC82RsYWOe4PqrUbGEACpjC9K
 XZoUwSUU7/8ZzFE5kZi7QY2jgZhZab7uQwQfU=
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
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Anthony Wong <anthony.wong@canonical.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMzoxMiBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgRGFuaWVsLgo+Cj4gPgo+ID4gPiBUaGUgbmV4dCBxdWVzdGlv
biBpcywgaG93IGRvIHdlIGNoYW5nZSB0aGUgYnJpZ2h0bmVzcyBsZXZlbCBmb3IgT0xFRAo+ID4g
PiBkaXNwbGF5cz8gSXMgY2hhbmdpbmcgZ2FtbWEgdmFsdWUgYSBnb29kIHdheSB0byBkbyBpdD8K
PiA+Cj4gPiBUaGVyZSdzIG5vIG92ZXJhbGwgYW1wbGlmaWVyIGtub2IgdG8gc2V0IGdlbmVyYWwg
YnJpZ2h0bmVzcyBvbiB0aGVzZT8KPgo+IEkganVzdCBsb29rZWQgdXAgdHdvIHJhbmRvbSBPTEVE
IGNvbnRyb2xsZXJzLgo+IFRoZXkgaGF2ZSBhICJDb250cmFzdCIgLSB3aGljaCBpcyB3aXJlZCB0
byBzZXRfZ2FtbWEuCj4gU2VlIGZvciBleGFtcGxlOgo+Cj4gZmJfc2gxMTA2LmM6Cj4gLyogR2Ft
bWEgaXMgdXNlZCB0byBjb250cm9sIENvbnRyYXN0ICovCj4gc3RhdGljIGludCBzZXRfZ2FtbWEo
c3RydWN0IGZidGZ0X3BhciAqcGFyLCB1MzIgKmN1cnZlcykKPiB7Cj4gICAgICAgICAvKiBhcHBs
eSBtYXNrICovCj4gICAgICAgICBjdXJ2ZXNbMF0gJj0gMHhGRjsKPgo+ICAgICAgICAgLyogU2V0
IENvbnRyYXN0IENvbnRyb2wgZm9yIEJBTkswICovCj4gICAgICAgICB3cml0ZV9yZWcocGFyLCAw
eDgxLCBjdXJ2ZXNbMF0pOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiB9Cj4KPgo+IEFuZCBmYl9z
c2QxMzA2LmM6Cj4gLyogR2FtbWEgaXMgdXNlZCB0byBjb250cm9sIENvbnRyYXN0ICovCj4gc3Rh
dGljIGludCBzZXRfZ2FtbWEoc3RydWN0IGZidGZ0X3BhciAqcGFyLCB1MzIgKmN1cnZlcykKPiB7
Cj4gICAgICAgICAvKiBhcHBseSBtYXNrICovCj4gICAgICAgICBjdXJ2ZXNbMF0gJj0gMHhGRjsK
Pgo+ICAgICAgICAgLyogU2V0IENvbnRyYXN0IENvbnRyb2wgZm9yIEJBTkswICovCj4gICAgICAg
ICB3cml0ZV9yZWcocGFyLCAweDgxKTsKPiAgICAgICAgIHdyaXRlX3JlZyhwYXIsIGN1cnZlc1sw
XSk7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+IH0KPgo+IEkgaGF2ZSBhIGZldyBzc2QxMzA2IHBh
bmVscyBpbiB0aGUgbWFpbCwgc28gd2hlbiBJIGdldCBzb21lIHNwYXJlIHRpbWUgSQo+IHdpbGwg
dHJ5IHRvIG1ha2UgYSB0aW55IERSTSBkcml2ZXIgZm9yIHRoZW0uCj4gQnV0IHN0YXJ0aW5nIG9u
IHRoZSBiYWNrbGlnaHQgc3R1ZmYgc2VlbXMgdG8gYSBiaXQgbW9yZSBjb21wbGljYXRlZC4KPgo+
IEhtbS4uLiBicm93c2luZyBiYWNrbGlnaHQgY29kZSBJIHNlZSB0aGF0IEZCX0VBUkxZX0VWRU5U
X0JMQU5LIGFuZCBGQl9SX0VBUkxZX0VWRU5UX0JMQU5LCj4gYXJlIG5vdCB1c2VkIC0gdGltZSB0
byBkZWxldGUgc29tZSBjb2RlLi4uCgo1LjMtcmMxIGhhcyBwYXRjaGVzIGZyb20gbWUgdG8gZml4
IHRoYXQsIGl0J3MgZ29uZSBhbHJlYWR5LiBUaGVzZSB0d28KZXZlbnRzIGFyZSBnb25lIGZyb20g
dGhlIGJhY2tsaWdodCBjb2RlLiBUaGV5J3JlIHN0aWxsIHVzZWQgYnkgdGhlIGxjZApkcml2ZXIg
c3R1ZmYgaW4gYmFja2xpZ2h0L2xjZC5jLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
