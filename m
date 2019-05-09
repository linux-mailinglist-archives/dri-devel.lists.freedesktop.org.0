Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF65186BA
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 10:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3F989AB7;
	Thu,  9 May 2019 08:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C96389AB7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 08:23:34 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c14so949667qke.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2019 01:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EFT1vB8Ia4opzNsYEQvDePR21FiapilD338d0lHR4o8=;
 b=dZT3fCT5Tt7JrBOo3v3im2nev7IsyuZrVOfsrAwLc6nLkx1PnwZR9LUT61Eh4xzOrS
 iAo2UwFzfmSaqnbVLLCl8ZCcKEOk5U3htKLUakm+iyYhk5bynetTtf4SGRrsJ5x/IFzJ
 AOYyba7rpz1wGrcdRcXaeuZlnIlakDJ2Z2S5+kK/EZMooj3luKPhDfIWOxqFR928gRCp
 hOl0145NTnbN8HPERFM0ZNoQUWCy7qoHtC+l3kGIFw2O5cvn471M2PPkvpU9QK27+SSg
 Auy2ZI6V74g+4D6IgwCOJ/Wdj8XPbhyU9rmviumcJP+ku2VB+TfxOG612+1whfO+coR5
 Pf1g==
X-Gm-Message-State: APjAAAXpwVc0XfKP9nyXnFz1N1hTAqeEC+H4qS5dPJsr5ESF2LHbCbKj
 y+Bo5GXvTzDDJba8S57NgREkThZAg9Y+VqzaxC4=
X-Google-Smtp-Source: APXvYqzNATcpB6ItFy0KqLc9ZTufcZjj7iqnPu0NOYCIEA6Aip7FwxseECZ8wFA4+19//wNpWZE/IFr5+O0/Euiz8zU=
X-Received: by 2002:a37:620d:: with SMTP id w13mr2119251qkb.131.1557390213283; 
 Thu, 09 May 2019 01:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyFp5LZ6QO1TaDK5jSb5+2SCe3Rjmk0_juVfr-zfspBLg@mail.gmail.com>
 <CAHk-=wg6imuGGw_4d6ywhu=0Kxr+H2S=hHavoDXYjN6o7SqMUg@mail.gmail.com>
In-Reply-To: <CAHk-=wg6imuGGw_4d6ywhu=0Kxr+H2S=hHavoDXYjN6o7SqMUg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 9 May 2019 18:23:21 +1000
Message-ID: <CAPM=9twww4shPTifuQKOaUMtkKOZWFN1LY=FTLGmXkH-SxFJnw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.2-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EFT1vB8Ia4opzNsYEQvDePR21FiapilD338d0lHR4o8=;
 b=tPxMF5TIZibttUB0Mg1eZeguPLY+u7Mz5SEb03beeEiPZ9+fkuVNtb5Pn4kjqRKK5f
 VWotKrLzvjMfdZrChopRkeTBMjTvUud7waprpWWL8KcE07AaM5ZV2vZC1Je/yYSybBZp
 UvWxt8coxeXlIR2ZDwSZFCqXLaFhMNR1anjHx4j6HjJWDZEpFmfjvbXiYsPVDi23INa+
 P6v2Htfv3CiLdok1uzZVynGnnejvaiUNE+xUZSr1UYalirC0Biq72ZpGdx51KmluOtvT
 3ToBxW8gJPGjUxCbxhfrY2cQGrQ4c4bhXsKBqt+qK3VycHKRMGOM7Ic4h6zZnjS1kqGN
 6IQQ==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA5IE1heSAyMDE5IGF0IDE0OjQ1LCBMaW51cyBUb3J2YWxkcwo8dG9ydmFsZHNAbGlu
dXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gRGF2ZSwKPgo+IE9uIFdlZCwgTWF5IDgsIDIw
MTkgYXQgODoyOCBQTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IHdyb3RlOgo+ID4K
PiA+IFRoaXMgaXMgdGhlIG1haW4gZHJtIHB1bGwgcmVxdWVzdCBmb3IgNS4yLgo+Cj4gVGhhbmtz
LiBJJ3ZlIG1lcmdlZCBpdCwgYnV0IEkgZ290IGEgY291cGxlIG9mIGNvbmZsaWN0cyB3aXRoIGZp
eGVzCj4gKHJldmVydHMpIHRvIG1haW5saW5lIGluIHRoZSBtZWFudGltZS4KPgo+IFRoZSBvbmUg
dG8gdGhlIGk5MTUgZHJpdmVyIHlvdSBzZWVtIHRvIGhhdmUgYXBwbGllZCBhZ2FpbiAoYWZ0ZXIg
dGhlCj4gZnVuY3Rpb24gd2FzIG1vdmVkIGFuZCByZW5hbWVkKS4KPgo+IFRoZSBvbmUgdG8gdGhl
IHZpcnRncHUgZHJpdmVyLCBJIHJlYWxseSBkb24ndCBrbm93IGlmIGlzIG5lZWRlZCBhbnkKPiBt
b3JlLiBJIHN1c3BlY3QgSSBjb21wbGV0ZWx5IHVubmVjZXNzYXJpbHkgbWVyZ2VkIHRoYXQKPiB2
aXJ0Z3B1X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoKSBmdW5jdGlvbiB0aGF0IGNhbWUgaW4g
YmVjYXVzZSBJCj4gZGVjaWRlZCB0byBkbyB0aGUgbWVyZ2Ugb2YgdGhlIHJldmVydC4KPgo+IEl0
J3MgYSB0cml2aWFsIGZ1bmN0aW9uIHRoYXQganVzdCByZXR1cm5zIGFuIGVycm9yLCBhbmQgeW91
ciB0cmVlIGp1c3QKPiBsZWF2ZXMgaXQgYXMgTlVMTCwgYW5kIEkgc3VzcGVjdCBteSBtZXJnZSBk
b2Vzbid0IGh1cnQsIGJ1dCBpdCBhbHNvCj4gcHJvYmFibHkgZG9lc24ndCBtYXR0ZXIuCj4KPiBT
byB5b3Ugc2hvdWxkIGNoZWNrIG15IG1lcmdlLgoKVGhhbmtzLAoKVGhhdCBleHBsYWlucyB0aGUg
Ikkga25vdyBJIGhhZCBzb21ldGhpbmcgZWxzZSB0byBzYXkiIGZlZWxpbmcuIEkgZGlkCmEgdGVz
dCBtZXJnZSB5ZXN0ZXJkYXkgYW5kIHRoZW4gZm9yZ290IHRvIHdyaXRlIHRoZSBkZXRhaWxzIGRv
d24uCgpJIGhhZCBhIGxvb2sgYW5kIGl0IHNlZW1zIGZpbmUsIGFuZCBpdCdzIEdlcmQncyBjb2Rl
IHNvIGlmIGhlJ3MgaGFwcHkKd2l0aCB0aGUgcmVzdWx0LgoKRGF2ZS4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
