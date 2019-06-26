Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F7056C8B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 16:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AF56E452;
	Wed, 26 Jun 2019 14:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42346E451
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:47:33 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id u64so476686vku.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P11jkfRqDuhKzXDJPlReY/FsBjqk1gDZ7bG7Kf9YmVg=;
 b=sVf9pqa4XXg3/YCutRLvoPtf+R4nm+u4DF5G33Htb9FLwg+hze7nbw7kiZajTCp69T
 Ab61HriFJzm1PUlSyAax5plMw+Pf1UoiL7P+d8iE1znFWHQMzuz+q1v7oHP3fM//lg4H
 Cyu1M6QkeXGeLbre3JBA1O7WkzUO95TSdOmHFbXLmCS4Vq/LQA+c4SjMCgcXIWiW6rwT
 EDGHzlxv9YQMt3pBrFSxy6i72+IWkkDbyK/0U9bx8D4XDSuYWciFKtid3trCPmmzh4Tt
 r7UFzVSYzOVn0hyRjT9R+wEmEg41ZWez7cMVRRP6CuA45t/AIIr+ePC6udwPwLRXHdt3
 nkag==
X-Gm-Message-State: APjAAAUzNyxrfLQdxfVnnD0eUgpR5drJpumv9F1TkCRfaL1xH/H33Bfc
 RR0P3jjOQua/2Z5I5zBAa+8Npw6W5wmZligJnmk=
X-Google-Smtp-Source: APXvYqwXQEbJGQbkEjdW9Xvxrx+GVHunb8WkBhwm+N7DVkgra2gSCSxfmdHxyvgu1a2V+1Yfc2bj8KIPz7x16mAxCM0=
X-Received: by 2002:a1f:2909:: with SMTP id p9mr1359693vkp.23.1561560452953;
 Wed, 26 Jun 2019 07:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190425031842.17202-1-jerry.han.hq@gmail.com>
 <20190626125507.GC23428@ravnborg.org>
 <CACvgo50Rm_OLXDMjw32p=yxm24Xu+TG6YYK78PczrHWRqGkVLg@mail.gmail.com>
 <20190626142930.GA12268@ravnborg.org>
In-Reply-To: <20190626142930.GA12268@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 26 Jun 2019 15:47:56 +0100
Message-ID: <CACvgo53TEzeoCC1x_zVsvxQoB3xMhEaMb1_EC1jFKmHHLBAjcA@mail.gmail.com>
Subject: Re: [PATCH] [v8, 1/2] dt-bindings: panel: Add Boe Himax8279d is
 1200x1920, 4-lane MIPI-DSI LCD panel
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=P11jkfRqDuhKzXDJPlReY/FsBjqk1gDZ7bG7Kf9YmVg=;
 b=TRQ3uLJdB440q9gADMIJDZg18L4XZ2nyJgxwaJv6UeYm9iy6McafNINB9PW923zPwL
 FcQ65TM+15kI9GZGwEkkg+CDHDiv9hvBVFBHeeBW3biZvyEVrSCq853dFuNbhMseuJZG
 dD6YjCt8357i92Jq6TDt2z43t5tGSM/acSUQKbTMJmDoB6ELxWtfub+OHDfUXXACdX8E
 Rd8otpHEeSI6qc8qdLovOrM+0kCPhw8J0ATj93kwpfYj8n3ZsugdSHOpvgVyr0KcsPH/
 LuhMayQoBR652vBObBNJL2Xr5wezOSwn/5Zqmp2dp9Isq1/MNMozZzQgFgqFnoKfITfP
 9vcQ==
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Rock wang <rock_wang@himax.com.cn>, Jerry Han <jerry.han.hq@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNiBKdW4gMjAxOSBhdCAxNToyOSwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPiB3cm90ZToKPgo+IEhpIEVtaWwuCj4KPiA+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPiBwYXRj
aCBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQgYW5kIHdpbGwgYmUgcHVzaGVkIG91dCBzb29uLgo+
ID4gPgo+ID4gSXNuJ3QgYW4gYWNrL3JiIGZyb20gYSBEVCBtYWludGFpbmVyIGEgcmVxdWlyZW1l
bnQgYmVmb3JlIGJlaW5nIHBpY2tlZAo+ID4gdmlhIHRoZSBEUk0gdHJlZXM/Cj4gPiBJdCB1c2Vk
IHRvIGJlIGEgdGhpbmcsIGFsdGhvdWdoIGl0IGNvdWxkIGhhdmUgY2hhbmdlZCByZWNlbnRseS4K
PiBJIGdvdCBPSyB2aWEgaXJjIHRvIHRha2Ugc29tZSBzaW1wbGUgcGFuZWwgYmluZGluZ3MgcGF0
Y2hlcy4KPiBXaGljaCBleHBsYWlucyB0aGUgbGFjayBvZiBhLWIgb3Igci1iIG9uIHRoaXMgcGF0
Y2ggZnJvbSBhbnkgRFQgZm9sa3MuCj4KPiBTbyBJIHByb2Nlc3NlZCB3aGF0IHdhcyBpbiBxdWV1
ZS4KPiBNYXliZSB0aGUgT0sgd2FzIG9ubHkgZm9yIGEgc21hbGxlciBzZXQgb2YgcGF0Y2hlcyBi
dXQgSSBkaWQgcHJvY2Vzcwo+IG9ubHkgcGFuZWwtYmluZGluZ3MgdGhhdCBJIHdhcyByZWFkeSB0
byBhZGQgbXkgci1iIG9uLgo+CkZhaXIgZW5vdWdoLiBJJ3ZlIHNlZW4gcGVvcGxlIGFkZCB0aGUg
Im9rIiBpbiB0aGUgY29tbWl0IGl0c2VsZiBhbmQKdGhlIGxpbmUgZW5kaW5nIHdpdGggIiMgb3Zl
ciBJUkMiIG9yIGFsaWtlLgoKPiA+Cj4gPiBBRkFJQ1QgdGhlcmUgYXJlIG5vIHVzZXJzIGZvciB0
aGlzIGJpbmRpbmcsIHlldCBJJ20gbm90IHN1cmUgaWYgdGhhdAo+ID4gaXMgYSByZXF1aXJlbWVu
dC4KPiBUbyBteSBiZXN0IGtub3dsZWRnZSBhIGtlcm5lbCB1c2VyIGlzIG5vdCBhIHJlcXVpcmVt
ZW50Lgo+IEluIHRoaXMgY2FzZSB0aGVyZSBpcyBhIHBhdGNoIGluLXRoZS13b3JrcyBhbmQgSSBj
b25zaWRlcmVkIHRvCj4gd2FpdCB1bnRpbCB0aGUgcGF0Y2ggd2FzIHJlYWR5LiBCdXQgZGVjaWRl
ZCB0byBwcm9jZXNzIHRoZSBEVC1iaW5kaW5nCj4gYXMgdGhlIGJpbmRpbmcgaXMgYSBwcmVyZXF1
aXNpdGUgZm9yIHRoZSBwYW5lbCBkcml2ZXIsCj4gYnV0IG5vdCB0aGUgb3RoZXIgd2F5IGFyb3Vu
ZC4gQWdhaW4gdG8gbXkgdW5kZXJzdGFuZGluZy4KPgo+IFNvIGV2ZXJ5dGhpbmcgd2FzIGRvbmUg
dG8gYXZvaWQgaGF2aW5nIHBhbmVsIHBhdGNoZXMgaGFuZ2luZyBpbgo+IGRyaS1kZXZlbCBmb3Ig
ZXhjZXNzaXZlIGFtb3VudCBvZiB0aW1lLgo+IE9uZSBjb3VsZCBzYXkgdGhhdCB0aGlzIHdhcyBh
bHJlYWR5IHRoZSBjYXNlIHRoYXQgdGhleSBoYWQgd2FpdGVkIGZvcgo+IHRvbyBsb25nLgo+Cj4g
QW5vdGhlciAtIG5vdCBzbyBvYnZpb3VzIHRoaW5nIC4gd2FzIHRoYXQgaGF2aW5nIGFsbCBwYXRj
aGVzIGluCj4gZHJtLW1pc2MtbmV4dCBhbGxvd3MgdXMgdG8gaGF2ZSBhbiBlYXNpZXIgdGltZSBt
aWdyYXRpbmcgYWxsIHBhbmVsCj4gcGF0Y2hlcyB0byB5YW1sIHdoaWNoIEkgaG9wZSB3aWxsIHRh
a2UgcGxhY2UgaW4gdGhlIG5leHQgbW9udGggb3IgdHdvLgo+IEkgYW0gd2FpdGluZyBmb3IgdGhl
IGluaXRhbCBwYXRjaC1zZXQgYnkgUm9iIHRvIGxhbmQsIGFuZCB0aGVuIHRoZXJlCj4gaXMgc29t
ZSBqYW5pdG9yaWFsIGpvYiB0byBtaWdyYXRlIHJlbWFpbmlnbiBwYW5lbCBiaW5kaW5ncyB0byB5
YW1sLgo+IFRoaXMgaXMgZWFzaWVyIHRvIGRvIHdpdGggZXZlcnl0aW5nIGluIGRybS1taXNjLW5l
eHQgcmF0aGVyIHRoYW4gYXNraW5nCj4gc2V2ZXJhbCBkaWZmZXJlbnQgcGVyc29ucyB0byBkbyBp
dC4KPiBPbmNlIGRvbmUgdGhlcmUgd2lsbCBiZSBsb3Qgb2YgZXhhbXBsZXMgdG8gd29yayBmcm9t
LCBzbyBmb3IgbmV3IHBhbmVsCj4gYmluZGluZ3MgaXQgc2hvdWxkIGJlIGVhc2llci4KPgpPb2gg
c2hpbnkuIFRoYW5rcyBTYW0uCgotRW1pbApQLlMuIEZyb20gYSBub24tbmF0aXZlIHNwZWFrZXIg
dG8gYW5vdGhlciwgc3BlbGwgY2hlY2sgRlRXLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
