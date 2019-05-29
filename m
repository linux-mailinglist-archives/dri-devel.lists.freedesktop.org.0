Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2132DB99
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E066E2DA;
	Wed, 29 May 2019 11:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885756E05F;
 Wed, 29 May 2019 01:32:25 +0000 (UTC)
Received: by mail-it1-x144.google.com with SMTP id m3so994895itl.1;
 Tue, 28 May 2019 18:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIfvpAwcUL5aEcXjuJeQ2M0pAhR/Zr/nyVu2Et28hv0=;
 b=rwh2eYU0F0cdUtHA1x+ybkNL3u2HECDf0j+sCU6Vd4SXD6GZqhsiER7CRhDWuXYiqv
 dCwU83nAa0knDEWreFYaprsUK8IujV9QkHA1YT9FkYgfJxBY546ZHdRSo+5d2vxx2n6C
 DXZxXL4fdTxtLQXpTVOl40JLDHjMNZqiY4oImNN0HQQsReWeTwJa2OR0im1VzHfIcQ+Y
 6xmBm5QbV7/HjjL0046fEmBXgB0tA1MSoeayU8s6nCC+KtSgaXqCrkYajG0FAr/quyf/
 mYrC4itx5uQU2+Urmb5uHlobr3L9p1phD1pnUlmMEUzvzSznmQIZEoC5yAoxqXfLp9sS
 xX9A==
X-Gm-Message-State: APjAAAXtw8Rpy01KNeLHgJKf53w1ZFdnKFyJnxoGwf6TG7BDBRqRAjVB
 UBG4edVvszaCoFhgeo0xp1e6ngu5Me+fthD+gLg=
X-Google-Smtp-Source: APXvYqyviJ1M9Qn4lMTmVfNca0S4nsXUtbXTlNjutUOnT584whK0rl7+oPDULSNBLe94uMh6uSFlFMrgzR416XD0phM=
X-Received: by 2002:a24:7289:: with SMTP id x131mr1588107itc.62.1559093544804; 
 Tue, 28 May 2019 18:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
In-Reply-To: <20190529011705.GA12977@basecamp>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 28 May 2019 19:32:14 -0600
Message-ID: <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display
 support
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pIfvpAwcUL5aEcXjuJeQ2M0pAhR/Zr/nyVu2Et28hv0=;
 b=C7CgTaK82YvBIf4VqQZ1gYpGRtU608zv44voHBNeDAcYIU7bv1Mgb7g30FYTu40lwO
 zhdd9h0dxduIt62RQVCc8h1fzpgFKcPqXxV4MRWqjWckPxc8X29Gjh5k/HC6CWbzRc47
 vofESGt2DjeRHO1PWS2uIyLDUqI+hLaMOVQiPNifJtnvc5zmxut2xvuJVwaPccNM0jkb
 Z4SPYUoKO8G8T2TvIaFoHZoeF+E9SL2pI8XS3ISFzJLkSJ4osCyn1ZWU/rwDvESjn/UD
 Pb9wYesQCGZHQGPnLpy37hVAyeDR+pohWh9gsBc+oZhrHKJYSBBPt5SGMFhyQWsTzaOb
 kE3g==
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
Cc: Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNzoxNyBQTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwMzo0NjoxNFBN
ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgOSwgMjAxOSBhdCA0
OjA0IEFNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPiB3cm90ZToKPiA+Cj4g
PiA+IEhlcmUgaXMgYSBwYXRjaCBzZXJpZXMgdGhhdCBhZGRzIGluaXRpYWwgZGlzcGxheSBzdXBw
b3J0IGZvciB0aGUgTEcKPiA+ID4gTmV4dXMgNSAoaGFtbWVyaGVhZCkgcGhvbmUuIEl0J3Mgbm90
IGZ1bGx5IHdvcmtpbmcgc28gdGhhdCdzIHdoeSBzb21lCj4gPiA+IG9mIHRoZXNlIHBhdGNoZXMg
YXJlIFJGQyB1bnRpbCB3ZSBjYW4gZ2V0IGl0IGZ1bGx5IHdvcmtpbmcuCj4gPiA+Cj4gPiA+IFRo
ZSBwaG9uZXMgYm9vdHMgaW50byB0ZXJtaW5hbCBtb2RlLCBob3dldmVyIHRoZXJlIGlzIGEgc2V2
ZXJhbCBzZWNvbmQKPiA+ID4gKG9yIG1vcmUpIGRlbGF5IHdoZW4gd3JpdGluZyB0byB0dHkxIGNv
bXBhcmVkIHRvIHdoZW4gdGhlIGNoYW5nZXMgYXJlCj4gPiA+IGFjdHVhbGx5IHNob3duIG9uIHRo
ZSBzY3JlZW4uIFRoZSBmb2xsb3dpbmcgZXJyb3JzIGFyZSBpbiBkbWVzZzoKPiA+Cj4gPiBJIHRl
c3RlZCB0byBhcHBseSBwYXRjaGVzIDItNiBhbmQgZ290IHRoZSBjb25zb2xlIHVwIG9uIHRoZSBw
aG9uZSBhcyB3ZWxsLgo+ID4gSSBzZWUgdGhlIHNhbWUgdGltb3V0cywgYW5kIEkgYWxzbyBub3Rp
Y2UgdGhlIHVwZGF0ZSBpcyBzbG93IGluIHRoZQo+ID4gZGlzcGxheSwgYXMgaWYgdGhlIERTSSBw
YW5lbCB3YXMgcnVubmluZyBpbiBsb3cgcG93ZXIgKExQKSBtb2RlLgo+ID4KPiA+IFdhcyBib290
aW5nIHRoaXMgdG8gZG8gc29tZSBvdGhlciB3b3JrLCBidXQgaGFwcHkgdG8gc2VlIHRoZSBwcm9n
cmVzcyEKPgo+IFRoYW5rcyEKPgo+IEkndmUgaGFkIHRocmVlIHBlb3BsZSBlbWFpbCBtZSBvZmYg
bGlzdCByZWdhcmRpbmcgdGhlIGRpc3BsYXkgd29ya2luZyBvbgo+IDQuMTcgYmVmb3JlIHRoZSBt
c20ga21zL2RybSBkcml2ZXIgd2FzIGNvbnZlcnRlZCB0byB0aGUgRFJNIGF0b21pYyBBUEkgc28K
PiB0aGlzIGVtYWlsIGlzIHRvIGdldCBzb21lIG1vcmUgaW5mb3JtYXRpb24gb3V0IHB1YmxpY2x5
Lgo+Cj4gSSBwdXNoZWQgdXAgYSBicmFuY2ggdG8gbXkgZ2l0aHViIHdpdGggMTUgcGF0Y2hlcyBh
cHBsaWVkIGFnYWluc3QgNC4xNwo+IHRoYXQgaGFzIGEgd29ya2luZyBkaXNwbGF5Ogo+Cj4gaHR0
cHM6Ly9naXRodWIuY29tL21hc25leWIvbGludXgvY29tbWl0cy9kaXNwbGF5LXdvcmtzLTQuMTcK
Pgo+IEl0J3MgaW4gbG93IHNwZWVkIG1vZGUgYnV0IGl0cyB1c2FibGUuIFRoZSBmaXJzdCAxMCBw
YXRjaGVzIGFyZSBpbgo+IG1haW5saW5lIG5vdyBhbmQgdGhlIGxhc3QgNSBhcmUgaW4gZXNzZW5j
ZSB0aGlzIHBhdGNoIHNlcmllcyB3aXRoIHRoZQo+IGV4Y2VwdGlvbiBvZiAnZHJtL2F0b21pYytt
c206IGFkZCBoZWxwZXIgdG8gaW1wbGVtZW50IGxlZ2FjeSBkaXJ0eWZiJy4KPiBUaGVyZSdzIGEg
c2xpZ2h0bHkgZGlmZmVyZW50IHZlcnNpb24gb2YgdGhhdCBwYXRjaCBpbiBtYWlubGluZSBub3cu
Cj4KPiBJJ20gcGxhbm5pbmcgdG8gd29yayBvbiB0aGUgbXNtODk3NCBpbnRlcmNvbm5lY3Qgc3Vw
cG9ydCBvbmNlIHNvbWUgb2YKPiB0aGUgb3V0c3RhbmRpbmcgaW50ZXJjb25uZWN0IHBhdGNoZXMg
Zm9yIHRoZSBtc20ga21zL2RybSBkcml2ZXIgYXJyaXZlCj4gaW4gbWFpbmxpbmUuIEknZCByZWFs
bHkgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSB0aGUgZGlzcGxheSB3b3JrcyBvbgo+IDQuMTcgd2l0
aCB0aG9zZSBwYXRjaGVzIHRob3VnaC4gSSBhc3N1bWUgdGhhdCBpdCdzIHJlbGF0ZWQgdG8gdGhl
Cj4gdmJsYW5rIGV2ZW50cyBub3Qgd29ya2luZyBwcm9wZXJseT8gTGV0IG1lIHByZWZhY2UgdGhp
cyB3aXRoIEknbSBhCj4gdG90YWwgRFJNIG5ld2JpZSwgYnV0IGl0IGxvb2tlZCBsaWtlIHRoZSBw
cmUtRFJNLWF0b21pYyBkcml2ZXIgd2Fzbid0Cj4gbG9va2luZyBmb3IgdGhlc2UgZXZlbnRzIGlu
IHRoZSBhdG9taWMgY29tbWl0cyBiZWZvcmUgdGhlIG1pZ3JhdGlvbj8KPiBTZWUgY29tbWl0IDcw
ZGIxOGRjYTRlMCAoImRybS9tc206IFJlbW92ZSBtc21fY29tbWl0L3dvcmtlciwgdXNlIGF0b21p
Ywo+IGhlbHBlciBjb21taXQiKSwgc3BlY2lmaWNhbGx5IHRoZSBkcm1fYXRvbWljX2hlbHBlcl93
YWl0X2Zvcl92YmxhbmtzKCkKPiBjYWxsIHRoYXQgd2FzIGFkZGVkLgoKRG8geW91IGtub3cgaWYg
dGhlIG5leHVzIDUgaGFzIGEgdmlkZW8gb3IgY29tbWFuZCBtb2RlIHBhbmVsPyAgVGhlcmUKaXMg
c29tZSBnbGl0Y2h5bmVzcyB3aXRoIHZibGFua3MgYW5kIGNvbW1hbmQgbW9kZSBwYW5lbHMuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
