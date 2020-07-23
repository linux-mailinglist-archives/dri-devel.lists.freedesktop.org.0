Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8928922A6A5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 06:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB39489B38;
	Thu, 23 Jul 2020 04:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20D089B38
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 04:28:35 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id l4so4866224ejd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 21:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hzR51WHdaEye7Mg7wN0FN/gGF0uo6jCkNQjZwM8K2H0=;
 b=a7j8PosfQqMImZW6IkjcQDDJn1dZqHuFLyWsqwXBzQs6FWyfwdWECsiy2FS/kreLMz
 kKtuxKVSFL5H5Yk5XR4RoDR0adX38LPMP/VMcnBKwFrm7HVj9Wb53KLFH8N5yiitJenY
 67AWZEOg3ij3RafJcR7GmtYdyGt7lB3lZxAGq4SwIyRI9J8GgLegtUyJet6MWLv0unXO
 AsLc+WLRdt4D+ZrAlVEgHPyNh0n9f6bYznDOus6dtx8XkqlqP6Gbc3rLaNN188VOZv2q
 rxnxNTZbNNFWk/+xzsnSiF1xrf1qnk/qXgBUNOjLSX8RvPkOINjTviofF6LFA/z1Qpc5
 6ddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hzR51WHdaEye7Mg7wN0FN/gGF0uo6jCkNQjZwM8K2H0=;
 b=GY6Lr9+LpXtvUl6JgMC4LKpZbbdKkg4P1a8GL/KzdPyDwSPKDWVLooBlU9TvMDZUN1
 CZBk4/nuwmFqe2h3eKusSllWoIqTN6EVYMZjTFzT3Vvx33XGBy3OhC7i44Sf8MueUKN6
 lWff26Xiew/H70o2l5Qkg/2vSOSAMu+6oUSV55sguEFH67ZmK9heGMGEwzAR2MWJVqRn
 LMfkqQCbWseSq1UKxf1kCb+8UzXBRKevqwWGcafg3NpNUewU8j7TmpvsqmYYqTdX2FeQ
 +aJssWb6vygWds76+mxyVgx0JYSq4xDJdQhM5zRIsGWrgW4OISaFOCXIPii+Ez2lcnQG
 FPPA==
X-Gm-Message-State: AOAM530IfbVwWxeYaoLv9u5BOk02d9c/hTACji67pE7UPBq9N+gXP1Gd
 01+pfx4w0nspj+xMFAw3z/rnRqu8rMGQ1VZf8v0=
X-Google-Smtp-Source: ABdhPJzgfej5FazvSGe34bk/iYQT3TPaaDMArMIRMJ5AoNPauWb57p3n4/FHMuCvJuvS6t5aykANP3cZ/QiT6LTi7oE=
X-Received: by 2002:a17:906:40cb:: with SMTP id
 a11mr2538034ejk.340.1595478514263; 
 Wed, 22 Jul 2020 21:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tz7E5rmRdqWwGQCsS+q+UcPU7XTxsGgkCggQXA8ktn0pw@mail.gmail.com>
 <20200630141505.GE6112@intel.com>
 <CADnq5_PdqNjD2OnWGWJxv-Q-YUN4ymLUxTdT9km_ESS2cwm68A@mail.gmail.com>
 <20200630143902.GG6112@intel.com>
 <20200630144132.GH5850@pendragon.ideasonboard.com>
 <20200630150757.GH6112@intel.com>
In-Reply-To: <20200630150757.GH6112@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 23 Jul 2020 14:28:22 +1000
Message-ID: <CAPM=9twEeFjzLHsweUz5be_Sc7TRVp0Foh_Os+RypeSW9SAH1g@mail.gmail.com>
Subject: Re: warning in omap_connector
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSB0aGluayBJJ20gc3RpbGwgc2VlaW5nIHRoaXMuCgpEYXZlLgoKT24gV2VkLCAxIEp1bCAyMDIw
IGF0IDAxOjA4LCBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDA1OjQxOjMyUE0gKzAzMDAsIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBIaSBWaWxsZSwKPiA+Cj4gPiBPbiBUdWUsIEp1biAz
MCwgMjAyMCBhdCAwNTozOTowMlBNICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPiA+
IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDEwOjE5OjIzQU0gLTA0MDAsIEFsZXggRGV1Y2hlciB3
cm90ZToKPiA+ID4gPiBPbiBUdWUsIEp1biAzMCwgMjAyMCBhdCAxMDoxNSBBTSBWaWxsZSBTeXJq
w6Rsw6Qgd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVHVlLCBKdW4gMzAsIDIwMjAgYXQg
MDQ6MzM6MzdQTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gPiA+ID4gPiA+IEhleSBMYXVy
ZW50LAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIG1lcmdlZCBkcm0tbWlzYy1uZXh0IGFuZCBu
b3RpY2VkIHRoaXMsIEknbSBub3Qgc3VyZSBpZiBpdCdzCj4gPiA+ID4gPiA+IGNvbGxhdGVyYWwg
ZGFtYWdlIGZyb20gc29tZXRoaW5nIGVsc2UgY2hhbmdpbmcgb3IgSSd2ZSBqdXN0IG1pc3NlZCBp
dAo+ID4gPiA+ID4gPiBwcmV2aW91c2x5LiAzMi1iaXQgYXJtIGJ1aWxkLgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAvaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3Jj
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmM6Cj4gPiA+ID4gPiA+IElu
IGZ1bmN0aW9uIOKAmG9tYXBfY29ubmVjdG9yX21vZGVfdmFsaWTigJk6Cj4gPiA+ID4gPiA+IC9o
b21lL2FpcmxpZWQvZGV2ZWwva2VybmVsL2RpbS9zcmMvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
b21hcF9jb25uZWN0b3IuYzo5Mjo5Ogo+ID4gPiA+ID4gPiB3YXJuaW5nOiBicmFjZXMgYXJvdW5k
IHNjYWxhciBpbml0aWFsaXplcgo+ID4gPiA+ID4gPiAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
IG5ld19tb2RlID0geyB7IDAgfSB9Owo+ID4gPiA+ID4KPiA+ID4gPiA+IFByb2JhYmx5IGZhbGxv
dXQgZnJvbSBteSBkcm1fZGlzcGxheV9tb2RlIHNocmlua2FnZS4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBHb2luZyB0byByZXBlYXQgbXkgdXN1YWwgImp1c3QgdXNlIHt9IHdoZW4gemVybyBpbml0aWFs
aXppbmcKPiA+ID4gPiA+IHN0cnVjdHMiIHJlY29tbWVuZGF0aW9uLiBBdm9pZHMgdGhlc2Ugc3R1
cGlkIHdhcm5pbmdzLCBhbmQgSU1PCj4gPiA+ID4gPiBhbHNvIGNvbnZleXMgdGhlIG1lYW5pbmcg
YmV0dGVyIHNpbmNlIHRoZXJlJ3Mgbm8gYW1iaWd1aXR5Cj4gPiA+ID4gPiBiZXR3ZWVuIHplcm8g
aW5pdGlhbGl6aW5nIHRoZSB3aG9sZSBzdHJ1Y3QgdnMuIHplcm8gaW5pdGlhbGl6aW5nCj4gPiA+
ID4gPiBqdXN0IHRoZSBmaXJzdCBtZW1iZXIuCj4gPiA+ID4KPiA+ID4gPiBJSVJDLCBMTFZNIGFu
ZCBHQ0MgdHJlYXQgdGhlc2Ugc2xpZ2h0bHkgZGlmZmVyZW50bHkuICBXZSd2ZSBnZW5lcmFsbHkK
PiA+ID4gPiBqdXN0IG1vdmVkIHRvIHVzaW5nIG1lbXNldCB0byBhdm9pZCBkaWZmZXJlbnQgY29t
cGlsZXIgY29tcGxhaW50cyB3aGVuCj4gPiA+ID4gdXNpbmcgdGhlc2UuCj4gPiA+Cj4gPiA+IEkg
ZG9uJ3QgcGFydGljdWxhcmx5IGxpa2UgbWVtc2V0KCkgc2luY2UgdGhlIHJlcXVpcmVtZW50IHRv
Cj4gPiA+IHBhc3MgdGhlIHNpemUganVzdCBhZGRzIGFub3RoZXIgd2F5IHRvIHNjcmV3IHRoaW5n
cyB1cC4gVGhlCj4gPiA+IHVzdWFsICdzaXplb2YoKnRoaW5nKScgbWFrZXMgdGhhdCBzbGlnaHRs
eSBsZXNzIG9mIGFuIGlzc3VlLAo+ID4gPiBidXQgSSd2ZSBub3RpY2VkIHRoYXQgcGVvcGxlIG9m
dGVuIGRvbid0IHVzZSB0aGF0Lgo+ID4gPgo+ID4gPiBBbm90aGVyIGlzc3VlIHdpdGggbWVtc2V0
KCkgaXMgdGhhdCB5b3UgdGhlbiBjYW4gZW5kIHVwIHdpdGgKPiA+ID4gYSBibG9jayBvZiBzZWVt
aW5nbHkgcmFuZG9tIGNvbGxlY3Rpb24gb2YgbWVtc2V0cygpcyBiZXR3ZWVuCj4gPiA+IHRoZSB2
YXJpYWJsZSBkZWNsYXJhdGlvbnMgYW5kIHRoZSByZXN0IG9mIHRoZSBjb2RlLiBJIHN1cHBvc2UK
PiA+ID4gaWYgd2UgY291bGQgZGVjbGFyZSB2YXJpYWJsZXMgYW55d2hlcmUgd2UgY291bGQgYWx3
YXlzIGtlZXAKPiA+ID4gdGhlIHR3byB0b2dldGhlciBzbyBpdCB3b3VsZG4ndCBsb29rIHNvIHdl
aXJkLCBidXQgY2FuJ3QgZG8KPiA+ID4gdGhhdCBmb3IgdGhlIHRpbWUgYmVpbmcuIEFuZCBldmVu
IHdpdGggdGhhdCBpdCB3b3VsZCBzdGlsbAo+ID4gPiBsZWFkIHRvIGxlc3Mgc3VjY2luY3QgY29k
ZSwgd2hpY2ggSSBnZW5lcmFsbHkgZGlzbGlrZS4KPiA+Cj4gPiBJJ2QgcHJlZmVyIHsgfSBvdmVy
IG1lbXNldCwgYXNzdW1pbmcgY2xhbmcgYW5kIGdjYyB3b3VsZCB0cmVhdCBpdAo+ID4gY29ycmVj
dGx5LiBWaWxsZSwgSSBjYW4gc3VibWl0IGEgcGF0Y2gsIHVubGVzcyB5b3Ugd2FudCB0byBkbyBp
dAo+ID4geW91cnNlbGYgYXMgaXQncyBhIGZhbGxvdXQgZnJvbSBkcm1fZGlzcGxheV9tb2RlIHNo
cmlua2FnZSA7LSkKPiA+IChzZXJpb3VzbHkgc3BlYWtpbmcsIG5vdCBwdXNoaW5nIHlvdSwgSSBq
dXN0IHdhbnQgdG8gYXZvaWQgZHVwbGljYXRpbmcKPiA+IHdvcmspLgo+Cj4gR28gYWhlYWQgaWYg
eW91IHdhbnQgdG8uIEknbSBpbiBtaWRkbGUgb2YgYSBiaWdnZXIgcmViYXNlIGF0bQo+IHNvIGNh
bid0IGRvIGl0IHJpZ2h0IHRoaXMgbWludXRlIG15c2VsZi4KPgo+IC0tCj4gVmlsbGUgU3lyasOk
bMOkCj4gSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
