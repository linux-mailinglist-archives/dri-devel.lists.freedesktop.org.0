Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DFAFB5CD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F276EDA8;
	Wed, 13 Nov 2019 16:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frontdoor.pr.hu (frontdoor.pr.hu
 [IPv6:2a02:808:1:101:250:56ff:fe8e:136b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88AF6E043;
 Wed, 13 Nov 2019 16:58:59 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
 by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iUvys-0001IR-0i; Wed, 13 Nov 2019 17:58:58 +0100
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
 helo=[192.168.1.2])
 by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iUvyn-0000cY-Oz; Wed, 13 Nov 2019 17:58:55 +0100
Subject: Re: UDL device cannot get its own screen
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <536af56f-924d-f089-a2d8-180f4dee1613@pr.hu>
 <CAKb7UvhZ9VR_X5Nqv01EDvnWF2RXXt5fCdYEa5KUy8owKh4CwQ@mail.gmail.com>
 <35cdaafe-461e-56ec-d3d3-47fdd6468251@pr.hu>
 <CAKb7Uvh2L0oHMwNss-h1BFXGYeEXOUDLHB9TnaNEm4-oNhjMRw@mail.gmail.com>
 <6af6c1c5-0b99-e034-8a9c-83d4e1171115@pr.hu>
 <d2788b17-3179-ef9d-419a-635e784c6297@pr.hu>
 <CAKb7UvikHeUOj06oqBYnq2==KJ-CGDyZjHsbtbZtA+3r9jK68A@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <dc03de55-d6df-5804-675f-48f93dc2dfd9@pr.hu>
Date: Wed, 13 Nov 2019 17:58:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAKb7UvikHeUOj06oqBYnq2==KJ-CGDyZjHsbtbZtA+3r9jK68A@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -1.9 (-)
X-Scan-Signature: bac636d383641ecc82643dbc9c1f3bb5
X-Spam-Tracer: backend.mail.pr.hu -1.9 20191113165855Z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=pr.hu; 
 s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eO3jYNiw6qr2uQ4VHE8YsZDK5nNFOA2N03ksyTw/O0M=; b=PZqYOCx4GMznEbjGOlNw/c+/ZK
 CmTE8L+jScV+jNAQ43pjmKxcbifpcV6MfchmmKyrSB/JWYObsYhUqZmuat23Kl3aLYsKUXj2/NMIy
 SqHf7hPQ2yEO3Was4mZH/6WDOqI7RJOeUz651UYBf++flHrk+w3nGO3AyxkJHHvk3bLos6j9PQRAm
 LzMbPnbymnMOQAj5ihGX/Rg2bMeDtJDb5VdCKipmzUvCXmGiSdL+WbPlBecc4dD/ykiY2vCxuLhBX
 9JmzXGHDu2GIR0AOyBzlM2waJRiY+7fSXrT8X9Bg5wjRKUYT/Vwm9YFGu7IKFdJ7QrEm5xT0y4g3h
 Ql00Y8JA==;
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
Cc: xorg@lists.x.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAxOS4gMTEuIDEyLiAxNzo0MSBrZWx0ZXrDqXNzZWwsIElsaWEgTWlya2luIMOtcnRhOgo+IE9u
IFR1ZSwgTm92IDEyLCAyMDE5IGF0IDk6MjMgQU0gQsO2c3rDtnJtw6lueWkgWm9sdMOhbiA8emJv
c3pvckBwci5odT4gd3JvdGU6Cj4+IEJ1dCBubywgYWxsIEdQVSBkZXZpY2VzIChub3cgb25seSBv
bmUsIHRoZSBVREwgZGV2aWNlKSBoYXZlIHNjcmVlbiAwCj4+IChhLmsuYS4gRElTUExBWT06MC4w
KSBzZXQgd2hlbiBBdXRvQmluZEdQVSBpcyB0cnVlOgo+Pgo+PiBbICAyNDQ0LjU3Nl0geGY4NkF1
dG9Db25maWdPdXRwdXREZXZpY2VzOiB4Zjg2TnVtU2NyZWVucyAyIHhmODZOdW1HUFVTY3JlZW5z
IDEKPj4gWyAgMjQ0NC41NzZdIHhmODZBdXRvQ29uZmlnT3V0cHV0RGV2aWNlczogR1BVICMwIGRy
aXZlciAnbW9kZXNldHRpbmcnICdtb2Rlc2V0JyBzY3JuSW5kZXgKPj4gMjU2IG9yaWdJbmRleCAy
NTcgcFNjcmVlbi0+bXlOdW0gMjU2IGNvbmZTY3JlZW4tPnNjcmVlbm51bSAwCj4+IGNvbmZTY3Jl
ZW4tPmRldmljZS0+aWRlbnRpZmllciAnSW50ZWwwJwo+PiAgICBjb25mU2NyZWVuLT5kZXZpY2Ut
PnNjcmVlbiAwIGNvbmZTY3JlZW4tPmRldmljZS0+bXlTY3JlZW5TZWN0aW9uLT5zY3JlZW5udW0g
MAo+PiBjb25mU2NyZWVuLT5kZXZpY2UtPm15U2NyZWVuU2VjdGlvbi0+ZGV2aWNlLT5zY3JlZW4g
MAo+Pgo+PiBTb21laG93LCBPcHRpb24gIkRldmljZSIgc2hvdWxkIGVuc3VyZSB0aGF0IHRoZSBV
REwgZGV2aWNlIGlzIGFjdHVhbGx5Cj4+IHRyZWF0ZWQgYXMgYSBmcmFtZWJ1ZmZlciB0aGF0IGNh
biBiZSByZW5kZXJlZCBpbnRvIChpLmUuIHRvIGJlIG1vZGVzZXQoMikKPj4gaW5zdGVhZCBvZiBt
b2Rlc2V0KEduKSkgYW5kIGl0IHNob3VsZCBiZSB3b2tlbiB1cCBhdXRvbWF0aWNhbGx5Lgo+Pgo+
PiBUaGlzIGlzIHdoYXQgQXV0b0JpbmRHUFUgaXMgc3VwcG9zZWQgdG8gZG8sIGlzbid0IGl0Pwo+
Pgo+PiBCdXQgaW5zdGVhZCBvZiBhc3NpZ25pbmcgdG8gc2NyZWVuIDAsIGl0IHNob3VsZCBiZSBh
c3NpZ25lZCB0byB3aGF0ZXZlcgo+PiBzY3JlZW4gbnVtYmVyIGl0IGlzIGNvbmZpZ3VyZWQgYXMu
Cj4+Cj4+IEkga25vdyBpdCdzIG5vdCBhIGNvbW1vbiB1c2UgY2FzZSBub3dhZGF5cywgYnV0IEkg
cmVhbGx5IHdhbnQgc2VwYXJhdGUKPj4gZnVsbHNjcmVlbiBhcHBzIG9uIHRoZWlyIGluZGVwZW5k
ZW50IHNjcmVlbnMsIGluY2x1ZGluZyBhIHN0YW5kYWxvbmUgVURMCj4+IGRldmljZSwgaW5zdGVh
ZCBvZiBoYXZpbmcgdGhlIGxhdHRlcnMgYXMgYSBYaW5lcmFtYSBleHRlbnNpb24gdG8gc29tZQo+
PiBvdGhlciBkZXZpY2UuCj4gCj4gSWYgeW91IHNlZSBhICJHIiwgdGhhdCBtZWFucyBpdCdzIGJl
aW5nIHRyZWF0ZWQgYXMgYSBHUFUgZGV2aWNlLCB3aGljaAo+IGlzICpub3QqIHdoYXQgeW91IHdh
bnQgaWYgeW91IHdhbnQgc2VwYXJhdGUgc2NyZWVucy4gWW91IG5lZWQgdG8gdHJ5Cj4gdG8gY29u
dmluY2UgdGhpbmdzIHRvICpub3QqIHNldCB0aGUgZGV2aWNlcyB1cCBhcyBHUFUgZGV2aWNlcywg
YnV0Cj4gaW5zdGVhZCBwdXQgZWFjaCBkZXZpY2UgKGFuZCBlYWNoIG9uZSBvZiBpdHMgaGVhZHMs
IHZpYSBaYXBob2RIZWFkcykKPiBubyBhIHNlcGFyYXRlIGRldmljZSwgd2hpY2ggaW4gdHVybiB3
aWxsIGhhdmUgYSBzZXBhcmF0ZSBzY3JlZW4uCgpJIGNyZWF0ZWQgYSBtZXJnZSByZXF1ZXN0IHRo
YXQgZmluYWxseSBtYWRlIGl0IHBvc3NpYmxlIHdoYXQgSSB3YW50ZWQuCgpodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcveG9yZy94c2VydmVyL21lcmdlX3JlcXVlc3RzLzMzNAoKTm93LCBu
byBtYXR0ZXIgaWYgSSB1c2UgdGhlIGludGVsIG9yIG1vZGVzZXR0aW5nIGRyaXZlcnMgZm9yIHRo
ZQpEZXZpY2Ugc2VjdGlvbnMgdXNpbmcgdGhlIEludGVsIGhlYWRzLCBvciBBdXRvQmluZEdQVSBz
ZXQgdG8gdHJ1ZSBvcgpmYWxzZSwgdGhlIFVETCBkZXZpY2UgaXMgY29ycmVjdGx5IG1hdGNoZWQg
d2l0aCBpdHMgT3B0aW9uICJrbXNkZXYiCnNldHRpbmcgdG8gdGhlIHBsYWZvcm0gZGV2aWNlJ3Mg
ZGV2aWNlIHBhdGguCgpUaGlzIHBhdGNoIHNlZW1zIHRvIGJlIGEgc2xpZ2h0IGxheWVyaW5nIHZp
b2xhdGlvbiwgYnV0IHNpbmNlIHRoZQptb2Rlc2V0dGluZyBkcml2ZXIgaXMgYnVpbHQgaW50byB0
aGUgWG9yZyBzZXJ2ZXIgc291cmNlcywgdGhlIHBhdGNoCm1heSBnZXQgYXdheSB3aXRoIGl0LgoK
QmVzdCByZWdhcmRzLApab2x0w6FuIELDtnN6w7ZybcOpbnlpCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
