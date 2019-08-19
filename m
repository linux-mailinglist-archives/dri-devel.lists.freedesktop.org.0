Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C679F951A1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD706E46F;
	Mon, 19 Aug 2019 23:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738656E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:25:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e8so1079735wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RI2i+ZmVIneVzAnzEN5HZB0xPiD2U6L93Cbq2/BjWMc=;
 b=byFaGHxVtF+Knj6KX/VbupHc7maqCcPjQcBi8554XdhB1WOBrN95ajDxDHf63JBSUN
 P8d50SYO/CriVeF++9Mw5xIJtsXm+MFRft53V9vo/5/CSyoRe7Si1FDa46qxupQsMaq0
 ckrfkO+YBiMk7ysMNUL3wgj5zCZWGYEUqvuH/zA86S+3tipdyInlZmmgkrnebPuqhy7o
 xUZ8jqQ5ww7FX4iIoEC7NDpA087UqJ5f8ETn3EDovEB/EfRhjLfz1Myfk0cUrXn/h12q
 bp0grS+9lqUjeeWyFHqgXvtqYwFnUNzOjfBZ2nnZehRZk/FE3PbCM9SZqVNx+ReQ9OIB
 FnkA==
X-Gm-Message-State: APjAAAXBaB51Px8kMddY3gd1F6xhP/6jo/SiO5xls371NiIr/LKuEyLK
 6D+dPrAGBicWDJxsImn3y0V5N5F/CJpbuSNV6eBAlA==
X-Google-Smtp-Source: APXvYqx3edDM9AlFjypdPYMEunUXS9sBqznDgRPvSCwQ6lY8zlb/2fEuWVBPNLSfZecPHsiNgEz7TCCGJi/jriJlfkg=
X-Received: by 2002:a1c:f910:: with SMTP id x16mr5413369wmh.173.1566257132989; 
 Mon, 19 Aug 2019 16:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190814184702.54275-1-john.stultz@linaro.org>
 <20190814194508.GA26866@ravnborg.org> <5D5A045C.5020707@hisilicon.com>
 <20190819044054.GA8554@ravnborg.org>
In-Reply-To: <20190819044054.GA8554@ravnborg.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 19 Aug 2019 16:25:21 -0700
Message-ID: <CALAqxLUzmScmAHErR6jLxR1ZnaezanhyA8SgB9LLU60x87N4Pg@mail.gmail.com>
Subject: Re: [RESEND][PATCH v3 00/26] drm: Kirin driver cleanups to prep for
 Kirin960 support
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RI2i+ZmVIneVzAnzEN5HZB0xPiD2U6L93Cbq2/BjWMc=;
 b=B8RSZqq6HMnH/WHrtR2nEisw9Iz4dvSDHQRtWAnkMNAKL2FKAjaehkv/oy3fER8wBu
 sizh9XNs6XIrrWr8V7wm24KAUg3htcBWBfulCRfqq9xHEnE7kpwM943I88zC3GQMf+pD
 jSv0BR4MVKgQO4PqDpAufxcq3d39qCEpGEe7lEVdpwYCY1rp94vrpG74Ck3LPgXcyVWo
 jq1E1BhJ7kye6J51x2g7U/QHgZ9jB8Hbd4qxls9Q6j00+JDD0ofNHgXzCV96GtGl1Wfj
 qIYR7TxuTGDC2IriNr7coqLv5GFdgQtv9eNKije+Ibxs0R1ffrXYdxy4D1OnJqnUQyE0
 GFcA==
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
Cc: YiPing Xu <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 Chen Feng <puck.chen@hisilicon.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 xinliang <z.liuxinliang@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMTgsIDIwMTkgYXQgOTo0MCBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+ID4gPiBBcyBNYWludGFpbmVycyBjYW4gd2UgcGxlYXNlIGdldCBzb21l
IGZlZWRiYWNrIGZyb20gb25lIG9mIHlvdS4KPiA+ID4gSnVzdCBhbiAiT0sgdG8gY29tbWl0IiB3
b3VsZCBkbyBpdC4KPiA+ID4gQnV0IHByZWZlcmFibHkgYW4gYWNrIG9yIGEgcmV2aWV3IG9uIHRo
ZSBpbmRpdmlkdWFsIHBhdGNoZXMuCj4gPgo+ID4gQXMgSSBoYXZlIGRvbmUgYSBwcmUtcmV2aWV3
IGFuZCB0YWxrZWQgd2l0aCB0aGUgIGF1dGhvciBiZWZvcmUgc2VuZGluZyBvdXQKPiA+IHRoZSBw
YXRjaGVzLgo+ID4gU28sIGZvciB0aGlzIHNlcmlhbCBwYXRjaGVzLAo+ID4gQWNrZWQtYnk6IFhp
bmxpYW5nIExpdSA8ei5saXV4aW5saWFuZ0BoaXNpbGljb24uY29tPgo+Cj4gVGhhbmtzIQo+IFdl
IGFsbCBrbm93IGhvdyBpdCBpcyB0byBiZSBidXN5LCBlc3BlY2lhbGx5IHdoZW4gdHJ5aW5nIHRv
IGtlZXAgdXAKPiBhZnRlciByb2xlIGNoYW5nZXMuCj4gVW5sZXNzIHNvbWVvbmUgYmVhdHMgbWUs
IHRoZW4gSSB3aWxsIGFwcGx5IHRvbmlnaHQgb3IgdG9tb3Jyb3cuCj4KPiA+ID4gSWYgdGhlIHJl
YWxpdHkgaXMgdGhhdCBKb2huIGlzIHRoZSBNYWludGFpbmVyIHRvZGF5LAo+ID4gPiB0aGVuIHdl
IHNob3VsZCB1cGRhdGUgTUFJTlRBSU5FUlMgdG8gcmVmbGVjdCB0aGlzLgo+ID4KPiA+IEkgYW0g
YXNzdW1pbmcgeW91IGFyZSB0YWxraW5nIGFib3V0IHRoZSBraXJpblsxXSBkcm0gZHJpdmVyIG5v
dCB0aGUgaGlibWNbMl0KPiA+IG9uZSwgcmlnaHQ/Cj4gPiBJIHJlYWxseSBhcHByZWNpYXRlIEpv
aG4ncyBhd2Vzb21lIHdvcmsgYXQga2lyaW4gZHJtIGRyaXZlciBhbGwgdGhlIHdheS4KPiA+IEhv
bmVzdGx5LCBhZnRlciBteSB3b3JrIGNoYW5nZSBmcm9tIG1vYmlsZSB0byBzZXJ2ZXIgeWVhcnMg
YWdvLCBJIGFtIGFsd2F5cwo+ID4gd2FpdGluZyBmb3Igc29tZSBndXkgd2hvIGlzIHN0YWJseSB3
b3JraW5nIGF0IGtpcmluIGRybSBkcml2ZXIgdG8gdGFrZSB0aGUKPiA+IG1haW50ZW5hbmNlIHdv
cmsuCj4gPiBKb2huLCBzdXJlbHkgaXMgYSBzdWNoIGd1eS4gIFBsZWFzZSBhZGQgdXAgYSBwYXRj
aCB0byB1cGRhdGUgdGhlIG1haW50YWluZXIKPiA+IGFzIEpvaG4sIGlmIEpvaG4gYWdyZWUgc28u
ICBUaGVuIEpvaG4gY2FuIHB1c2ggdGhlIHBhdGNoIHNldCB0byBkcm0KPiA+IG1haW50YWluZXIg
aGltc2VsZi4KPiA+ICpOb3RlKiB0aGF0IHRoZSBtYWludGFpbmVyIHBhdGNoIHNob3VsZCBicmVh
ayBoaXNpbGljb24gZHJpdmVycyBpbnRvIGtpcmluCj4gPiBhbmQgaGlibWMgdHdvIHBhcnRzLCBs
aWtlIGJlbGxvdzoKPiA+Cj4gPiBEUk0gRFJJVkVSUyBGT1IgSElTSUxJQ09OIEhJQk1DCj4gPiBN
OiAgWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+Cj4gPiAuLi4KPiA+
IEY6ICBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jCj4gPiAuLi4KPiA+Cj4gPiBEUk0g
RFJJVkVSUyBGT1IgSElTSUxJQ09OIEtJUklOCj4gPiBNOiAgSm9obiBTdHVsdHogPGpvaG4uc3R1
bHR6QGxpbmFyby5vcmc+Cj4gPiAuLi4KPiA+IEY6ICBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2tpcmluCj4gPiAuLi4KPiA+Cj4gPiBbMV0gZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJp
biAjIGZvciBraXJpbiBtb2JpbGUgZGlzcGxheSBkcml2ZXIKPiA+IFsyXSBkcml2ZXJzL2dwdS9k
cm0vaGlzaWxpY29uL2hpYm1jICMgZm9yIHNlcnZlciBWR0EgZHJpdmVyCj4KPiBIaSBKb2huCj4K
PiBVcCB0byB0aGUgY2hhbGxlbmdlPwoKSSBndWVzcyBpZiBuZWNlc3NhcnksIHRob3VnaCBJIGRv
bid0IGJlbGlldmUgbXlzZWxmIHRvIGJlIGEgZ3JlYXQgbWFpbnRhaW5lci4KClRob3VnaCBJIGRv
IGhhdmUgdGhlIGhhcmR3YXJlLCBhbSByZWd1bGFybHkgYXJlIHRlc3Rpbmcgb24gaXQsIGFuZApt
YWludGFpbiBhIHRyZWUgb2YgcGF0Y2hlcyB0byBrZWVwIGl0IHdvcmtpbmcsIHNvIEkgY2FuIHZh
bGlkYXRlIGJhc2ljCmNvcnJlY3RuZXNzIGFuZCBoYW5kbGUgcGF0Y2ggd3JhbmdsaW5nLgoKPiBJ
ZiB5ZXMgdGhlbiBwbGVhc2UgY29uc2lkZXIgdG8gYXBwbHkgZm9yIGNvbW1pdCByaWdodHMgdG8g
ZHJtLW1pc2MtbmV4dC4KPgo+IEFuZCByZWFkOgo+IGh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNr
dG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL2luZGV4Lmh0bWwKPgo+IFNlZSB0aGlzIHRvIGdldCBh
biBhY2NvdW50Ogo+IGh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy93aWtpL0FjY291bnRSZXF1
ZXN0cy8KPgo+IFlvdSB3aWxsIG5lZWQgYW4gc3NoIGFjY291bnQgZm9yIGRybS1taXNjLW5leHQg
YXMgaXQgaXMgbm90ICh5ZXQ/KQo+IGdpdGxhYiBlbmFibGVkLgoKSSdsbCB0cnkgdG8gZmluZCBz
b21lIHRpbWUgdG8gcmVhZCB0aHJvdWdoIHRoZSBhYm92ZSBhbmQgYXBwbHkuCgp0aGFua3MKLWpv
aG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
