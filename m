Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB7C64F02
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 00:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267BD89BFC;
	Wed, 10 Jul 2019 22:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F073489BFE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 22:56:53 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id q22so8388297iog.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wvZvVibciLuoN0XPHn1GQTPO0jZSmghihu4pRgb43gE=;
 b=VgH+Zz6v9V+9PwGaZu8FPv4tuXHqep6ZqeAFfarU/OAQygy8Xl99mLU1L7YdCnbh+h
 6uP1PR2BBMK6J9GG52rO3mQ+O7Pv0b2sGklhm++YwnZbmc4axaTQcUmDDCFJ4/hXcxD3
 3ypaBsZsFljBjxxgNdgXXqSa80k501TJ2RMjwdYWyo7PiV8EhuCxJ3fExXefsV7BU+Ui
 CWTsk3f3Jg5HZKtyRAIcOzH14gBuwTaBEp9Shmg3KZ6DLBM8JlLSuNjyhx8X170GDp3T
 14mxSbH90UKoXZK2qlZTjLvmrS8vO3h2tEEh7dL6YLkm+xfsC6X4gZCECCd9ps4Zo+9S
 XNig==
X-Gm-Message-State: APjAAAVUPx4MBs9yMkPSmK95CIqHeV5hoeAQyfPQVVIK57CEuvfs8w3+
 jUp0DRt7bVhSYgluKOxo0jmSAOHisiY=
X-Google-Smtp-Source: APXvYqwLsksCUQZRZL0BYH2n5CHgwjUGfOjaJJusUuOPkuJRDBZ4n5hyS5A0VWZWZrmv8M5FlsVhwA==
X-Received: by 2002:a5e:8e4a:: with SMTP id r10mr721646ioo.100.1562799412964; 
 Wed, 10 Jul 2019 15:56:52 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id l11sm2637971ioj.32.2019.07.10.15.56.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 15:56:51 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id i10so8305082iol.13
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:56:51 -0700 (PDT)
X-Received: by 2002:a5e:c241:: with SMTP id w1mr670314iop.58.1562799411159;
 Wed, 10 Jul 2019 15:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org>
 <20190630202246.GB15102@ravnborg.org>
 <20190630205514.GA17046@ravnborg.org>
 <CAD=FV=WH4kmhQA0kbKcAUx=oOeqTZiQOFCXYpVWwq+mG7Y7ofA@mail.gmail.com>
 <20190708175606.GB3511@ravnborg.org>
In-Reply-To: <20190708175606.GB3511@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2019 15:56:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VdkPLwyGhSnrHCcduQAPwby35Mqhk_r=O595bMoMT=6w@mail.gmail.com>
Message-ID: <CAD=FV=VdkPLwyGhSnrHCcduQAPwby35Mqhk_r=O595bMoMT=6w@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override typical
 timing
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wvZvVibciLuoN0XPHn1GQTPO0jZSmghihu4pRgb43gE=;
 b=Hqkoo2XXLEooMC5VZ+gOGg3gxQkocTVvzTmDsnDANF3OvZLlo/WQja4ye0rFzpf83e
 shsMhGUJvVUA4YU0xi/vv+i+XuO2LxUMqoRYnyGtJibDxbKwyeL16AR1P0KokEbKVpus
 TtaPbc8kH0P9xgP/1HkX6qrifSz9Mm/YfZAik=
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBNb24sIEp1bCA4LCAyMDE5IGF0IDEwOjU2IEFNIFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAwMSwgMjAxOSBhdCAwOTozOTowNkFN
IC0wNzAwLCBEb3VnIEFuZGVyc29uIHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gT24gU3VuLCBKdW4g
MzAsIDIwMTkgYXQgMTo1NSBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBIaSBEb3VnbGFzLgo+ID4gPgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAg
IC8qIE9ubHkgYWRkIHRpbWluZ3MgaWYgb3ZlcnJpZGUgd2FzIG5vdCB0aGVyZSBvciBmYWlsZWQg
dG8gdmFsaWRhdGUgKi8KPiA+ID4gPiA+ICsgICBpZiAobnVtID09IDAgJiYgcGFuZWwtPmRlc2Mt
Pm51bV90aW1pbmdzKQo+ID4gPiA+ID4gKyAgICAgICAgICAgbnVtID0gcGFuZWxfc2ltcGxlX2dl
dF90aW1pbmdzX21vZGVzKHBhbmVsKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAvKgo+ID4g
PiA+ID4gKyAgICAqIE9ubHkgYWRkIGZpeGVkIG1vZGVzIGlmIHRpbWluZ3Mvb3ZlcnJpZGUgYWRk
ZWQgbm8gbW9kZS4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgcGFydCBJIGZhaWwgdG8gdW5kZXJzdGFu
ZC4KPiA+ID4gPiBJZiB3ZSBoYXZlIGEgcGFuZWwgd2hlcmUgd2UgaW4gcGFuZWwtc2ltcGxlIGhh
dmUgc3BlY2lmaWVkIHRoZSB0aW1pbmdzLAo+ID4gPiA+IGFuZCBkb25lIHNvIHVzaW5nIGRpc3Bs
YXlfdGltaW5nIHNvIHdpdGggcHJvcGVyIHttaW4sIHR5cCwgbWF4fSB0aGVuIGl0Cj4gPiA+ID4g
c2hvdWxkIGJlIHBlcmZlY3RseSBsZWdhbCB0byBzcGVjaWZ5IGEgbW9yZSBwcmVjaXNlIHZhcmlh
bnQgaW4gdGhlIERUCj4gPiA+ID4gZmlsZS4KPiA+ID4gPiBPciB3aGF0IGRpZCBJIG1pc3MgaGVy
ZT8KPiA+ID4KPiA+ID4gR290IGl0IG5vdy4KPiA+ID4gSWYgZGlzcGxheV9tb2RlIGlzIHVzZWQg
Zm9yIHRpbWluZ3MgdGhpcyBpcyB3aGF0IHlvdSBjYWxsICJmaXhlZCBtb2RlIi4KPiA+ID4gSG1t
LCBpZiBJIGdvdCBjb25mdXNlZCBzb21lb25lIGVsc2UgbWF5IGFsc28gYmUgY29uZnVzZWQgYnkg
dGhpcyBuYW1pbmcuCj4gPgo+ID4gVGhlIG5hbWUgImZpeGVkIG1vZGUiIGNvbWVzIGZyb20gdGhl
IG9sZCBjb2RlLCB0aG91Z2ggSSBndWVzcyBpbiB0aGUKPiA+IG9sZCBjb2RlIGl0IHVzZWQgdG8g
cmVmZXIgdG8gYSBtb2RlIHRoYXQgY2FtZSBmcm9tIGVpdGhlciB0aGUKPiA+IGRpc3BsYXlfdGlt
aW5nIG9yIHRoZSBkaXNwbGF5X21vZGUuCj4gPgo+ID4gSG93IGFib3V0IGlmIEkgY2FsbCBpdCAi
cGFuZWxfc2ltcGxlX2dldF9mcm9tX2ZpeGVkX2Rpc3BsYXlfbW9kZSI/Cj4gPiAuLi5vciBpZiB5
b3UgaGF2ZSBhbm90aGVyIHN1Z2dlc3Rpb24gZmVlbCBmcmVlIHRvIGNoaW1lIGluLgo+IFdoYXQg
d2UgcmVhbGx5IHdhbnQgdG8gZGlzdGluZ3VzaCBoZXJlIGlzIHRoZSB1c2Ugb2YgZGlzcGxheV9t
b2RlCj4gYW5kIGRpc3BsYXlfdGltaW5ncyAoaWYgSSBnb3QgdGhlIG5hbWVzIHJpZ2h0KS4KPiBU
aGF0IGRpc3BsYXlfbW9kZSBzcGVjaWZ5IGEgZml4ZWQgdGltaW5nIGFuZCBkaXNwbGF5X3RpbWlu
ZyBzcGVjaWZ5Cj4gYSB2YWxpZCByYW5nZSBpcyBzb21ldGhpbmcgaW4gdGhlIHNlbWFudGljcyBv
ZiB0aGUgdHdvIHR5cGVzLgo+IFNvIG5hbWluZyB0aGF0IHJlZmVyIHRvIGRpc3BsYXlfbW9kZSB2
ZXJzdXMgZGlzcGxheV90aW1pbmcgd2lsbCBtYWtlIHRoZQo+IGNvZGUgc2ltcGxlciB0byB1bmRl
cnN0YW5kLiBhbmQgdGhlbiBhIG5pY2UgY29tbWVudCB0aGF0IHdoZW4KPiBkaXNwbGF5X21vZGUK
PiBpcyB1c2VkIG9uZSBsb29zZXMgdGhlIHBvc3NpYmlsaXR5IHRvIHVzZSBvdmVycmlkZV9tb2Rl
Lgo+IFRoYXQgd291bGQgYmUgZmluZSB0byBoYXZlIGluIHRoZSBzdHJ1Y3QgaW4gdGhlIGRyaXZl
ci4KCk9LLCBJIGNhbiBjaGFuZ2UgdGhlIG5hbWVzIGhlcmUgYW5kIHRyeSB0byBmaW5kIGEgZ29v
ZCBwbGFjZSB0byBhZGQgYSBjb21tZW50LgoKCj4gPiBOT1RFOiBTaW5jZSB0aGlzIGZlZWRiYWNr
IGlzIG1pbm9yIGFuZCB0aGlzIHBhdGNoIGhhcyBiZWVuIG91dHN0YW5kaW5nCj4gPiBmb3IgYSB3
aGlsZSAoYW5kIGlzIGJsb2NraW5nIG90aGVyIHdvcmspLCBJIGFtIGFzc3VtaW5nIHRoYXQgdGhl
IGJlc3QKPiA+IHBhdGggZm9yd2FyZCBpcyBmb3IgSGVpa28gdG8gbGFuZCB0aGlzIHBhdGNoIHdp
dGggVGhpZXJyeSdzIEFjayBhbmQKPiA+IEknbGwgc2VuZCBhIGZvbGxvdy11cC4gIFBsZWFzZSB5
ZWxsIGlmIHlvdSBkaXNhZ3JlZS4KPiBMZXQncyBnaXZlIHRoZSBwYXRjaGVzIGEgc3BpbiBtb3Jl
IGFzIHdlIGhhdmUgcGFzc2VkIHRoZSBwb3NzaWJpbGl0eSBmb3IKPiB0aGUgY3VycmVudCBtZXJn
ZSB3aW5kb3cuCgpBbnkgd2F5IEkgY2FuIGNvbnZpbmNlIHlvdSB0byBjaGFuZ2UgeW91ciBtaW5k
IGhlcmU/ICBUaGVyZSBhcmUgbm8KZnVuY3Rpb25hbCBjaGFuZ2VzIHJlcXVlc3RlZCBzbyBmYXIg
aW4geW91ciBmZWVkYmFjayBhbmQgbm8gYnVncy0taXQncwpqdXN0IGEgZmV3IHZhcmlhYmxlIG5h
bWVzIGFuZCBjb21tZW50cy4gIEJ5IGxhbmRpbmcgdGhlIGV4aXN0aW5nCnBhdGNoZXMgYXMtaXM6
CgoxLiBXZSBzdG9wIHNwYW1taW5nIGFsbCB0aGUgcGVvcGxlIENDZWQgb24gdGhpcyB3aG9sZSBz
ZXJpZXMgKHdoaWNoCmluY2x1ZGVzIGRldmljZSB0cmVlIHBhdGNoZXMpIHRoYXQgbWlnaHQgYmUg
aW50ZXJlc3RlZCBpbiB0aGUgc2VyaWVzCmFzIGEgd2hvbGUgYnV0IGFyZW4ndCBpbnRlcmVzdGVk
IGluIGRldGFpbHMuCgoyLiBXZSBjYW4gZGViYXRlIHRoZSBiaWtlc2hlZC10eXBlIGlzc3VlcyBv
biB0aGVpciBvd24gbWVyaXQgYW5kIEkKZG9uJ3QgaGF2ZSB0byBkZWJhdGUgcmVtb3ZpbmcgZXhp
c3RpbmcgQWNrcyAvIFJldmlld2VkLWJ5IC8gVGVzdGVkLWJ5CnRhZ3MgYXMgSSBtYWtlIGNoYW5n
ZXMuCgozLiBFdmVuIGlmIGl0J3Mgbm90IGEgZ29vZCB0aW1lIHRvIGxhbmQgdGhlIHBhdGNoZXMg
cmlnaHQgbm93IHdlIGtub3cKdGhhdCB0aGVzZSBwYXRjaGVzIHdpbGwgYmUgcmVhZHkgdG8gbGFu
ZCBhcyBzb29uIGFzIHRoZSB3aW5kb3cgb3BlbnMuCkFzIEkgbWVudGlvbmVkIGVhcmxpZXIgdGhl
c2UgcGF0Y2hlcyBhcmUgYmxvY2tpbmcgb3RoZXIgd29yayBbMV0gYW5kCmxhbmRpbmcgdGhhdCBw
YXRjaCBpcyBhY3R1YWxseSBwcmV2ZW50aW5nIE1hdHRoaWFzIGZyb20gc3VibWl0dGluZwphbm90
aGVyIHNlcmllcyBvZiBwYXRjaGVzIHRvIGFkZCBzdXBwb3J0IGZvciByazMyODgtdmV5cm9uLXRp
Z2VyIGFuZApyazMyODgtdmV5cm9uLWZpZXZlbC4gIENlcnRhaW5seSBJIGtub3cgdGhhdCB1cHN0
cmVhbSBkb2Vzbid0IG1ha2UgYQpwb2xpY3kgb2YgbGFuZGluZyB0aGluZ3MganVzdCB0byBzdWl0
IHRoZSB0aW1lbGluZXMgb2YgYSBkb3duc3RyZWFtCnByb2plY3QsIGJ1dCBpbiB0aGlzIGNhc2Ug
dGhlcmUgc2VlbXMgdmVyeSBsaXR0bGUgZG93bnNpZGVzIHRvIGxhbmRpbmcKdGhlIGV4aXN0aW5n
IHBhdGNoZXMgYW5kIHRha2luZyBhIGxhdGVyIGNsZWFudXAgcGF0Y2guCgoKPiBJIGFtIG9uIHZh
Y2F0aW9uIGF0IHRoZSBtb21lbnQgYW5kIHRodXMgc2xvdyBpbiByZXNwb25zZXMsIGJ1dCB3aWxs
IGJlIGJhY2sKPiBhdCB0aGUgaG9tZSBvZmZpY2UgbmV4dCB3ZWVrIGFuZCB3aWxsIGJlIG1vcmUg
cmVzcG9uc2l2ZSBhZ2Fpbi4KPgo+ICAgICAgICAgU2FtIC0gd2hvIGlzIGVuam95aW5nIHRoZSBh
bHBzIGluIEF1c3RyaWEKCkhvcGUgeW91IGhhdmUgaGFkIGEgZ3JlYXQgdmFjYXRpb24hCgpbMV0g
aHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDE5MDYyNTIyMjYyOS4xNTQ2MTktMS1ta2FAY2hy
b21pdW0ub3JnCgotRG91ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
