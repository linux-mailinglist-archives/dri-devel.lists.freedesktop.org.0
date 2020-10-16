Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F02909A9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 18:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7896EE3C;
	Fri, 16 Oct 2020 16:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190F36EE3C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 16:27:57 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l15so1911085wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bqJ6cpltxwTnwsq73+OiYN2xGD/f9B9jRfFp1KGt6UI=;
 b=Y2tNPKnZr9fQO44h1cf+zQwHseoJrlW7gutss3ya6S9zTcZVNFe1A3jBJz0DL/NKAW
 IwQ/eYvhMEpG+HN6JSwQPt2h6OQbl1EhwXtDcevEfWPXt1S9yqoyYZqbAOmUL5XS0YqN
 c9nvOb6gNCercA4CplsvjKjbB9DKR/Qud70ykPYWNYBj4ElvrSMDDDeP6EG9ODUB5g7Q
 tIvSGn82DN2eBAuV/W0YhWTB0x8N7hiasPDprZyMqtHK6Rk++3NFq77R5uRNQ5xnlap4
 YNvOMxXP+f3xISx4GGrrvTn4wFnRDeFL+NnO/StBmcnd/WVPxLNIYQ8PPKfzWlBn2qEx
 Md7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bqJ6cpltxwTnwsq73+OiYN2xGD/f9B9jRfFp1KGt6UI=;
 b=BcHqSNPNLEKQ2f75emTBKTBCirZ0l4aXfn7q/4p4M3VsvtVyrT2dbF3rf9DcH5O/Ls
 BY5Lfh3/8xpMp7A6Ly31K6swbmNYlDoE5lArKO3J6iYa43Xivn0yjyofeFeURHcAXRLh
 Gh8XBaOGqA+VjtmIlK5XN4Z4MYNIsm+N/S7n2kuSIWpy1DHSOL26XSZx3wv8ZrLYBRF2
 D0KnJ/f+tY+1k2OPKJDaCqllK/g1nt9WsWFAnJM0cXPSd/VJ25dwgyNLnk8roSPlufeO
 WdMEmekalmuByoDZHvX4um727P08oKofN6xVA423SCQ+SDd/L26gjFkVOK9GBTvKW4oo
 Wkig==
X-Gm-Message-State: AOAM530O0Yz2Yxr1uW5jF8/89Dwv/kkes2gyMXoKBJUxrg5uCzkCzZhv
 gjHfEuPntIOm+UAg6tK1qfJ58HRFG7QndgO3w/I=
X-Google-Smtp-Source: ABdhPJzJkPFecDBFsY79AfS2LNDY9p2gH7e8Xe9V7Yf7RlJcRPY0jEwBFQKXrWPTceBBoRFfTmHrlcNLIvxb4Fo1X5Y=
X-Received: by 2002:a1c:6488:: with SMTP id y130mr4493560wmb.94.1602865672712; 
 Fri, 16 Oct 2020 09:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
 <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
 <20201002105256.GA6112@intel.com> <20201002110544.GB6112@intel.com>
 <CAF6AEGv+UnZJoBj_ELRVr4sQeMs52vAgyw2g+wtabLPBrYDKvw@mail.gmail.com>
 <20201005121524.GI6112@intel.com>
 <CAF6AEGtgTb-1YQpL4CV2A=CQxkSxjn-FxDybrzSitTDSmCY_GA@mail.gmail.com>
 <20201008082411.GE6112@intel.com>
In-Reply-To: <20201008082411.GE6112@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 16 Oct 2020 09:27:39 -0700
Message-ID: <CAF6AEGvC+t8RvFRrpWaZGNMNMyz8oY0Y3LzGANHJ-SeDYoXw7Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Tim Murray <timmurray@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>,
 Qais Yousef <qais.yousef@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgOCwgMjAyMCBhdCAxOjI0IEFNIFZpbGxlIFN5cmrDpGzDpAo8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBPY3QgMDcsIDIwMjAgYXQg
MDk6NDQ6MDlBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gT24gTW9uLCBPY3QgNSwgMjAy
MCBhdCA1OjE1IEFNIFZpbGxlIFN5cmrDpGzDpAo+ID4gPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBPY3QgMDIsIDIwMjAgYXQgMTA6NTU6
NTJBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgT2N0IDIsIDIwMjAg
YXQgNDowNSBBTSBWaWxsZSBTeXJqw6Rsw6QKPiA+ID4gPiA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIEZyaSwgT2N0IDAyLCAyMDIw
IGF0IDAxOjUyOjU2UE0gKzAzMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+ID4gPiA+ID4g
T24gVGh1LCBPY3QgMDEsIDIwMjAgYXQgMDU6MjU6NTVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBUaHUsIE9jdCAxLCAyMDIwIGF0IDU6MTUgUE0gUm9iIENs
YXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiBJJ20gbGVhbmluZyB0b3dhcmRzIGNvbnZlcnRpbmcgdGhlIG90aGVyIGRyaXZlcnMg
b3ZlciB0byB1c2UgdGhlCj4gPiA+ID4gPiA+ID4gPiBwZXItY3J0YyBrd29yaywgYW5kIHRoZW4g
ZHJvcHBpbmcgdGhlICdjb21taXRfd29ya2AgZnJvbSBhdG9taWMgc3RhdGUuCj4gPiA+ID4gPiA+
ID4gPiBJIGNhbiBhZGQgYSBwYXRjaCB0byB0aGF0LCBidXQgZmlndXJlZCBJIGNvdWxkIHBvc3Rw
b25lIHRoYXQgY2h1cm4KPiA+ID4gPiA+ID4gPiA+IHVudGlsIHRoZXJlIGlzIHNvbWUgYnktaW4g
b24gdGhpcyB3aG9sZSBpZGVhLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gaTkxNSBoYXMg
aXRzIG93biBjb21taXQgY29kZSwgaXQncyBub3QgZXZlbiB1c2luZyB0aGUgY3VycmVudCBjb21t
aXQKPiA+ID4gPiA+ID4gPiBoZWxwZXJzIChub3IgdGhlIGNvbW1pdF93b3JrKS4gTm90IHN1cmUg
aG93IG11Y2ggb3RoZXIgZnVuIHRoZXJlIGlzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIGRv
bid0IHRoaW5rIHdlIHdhbnQgcGVyLWNydGMgdGhyZWFkcyBmb3IgdGhpcyBpbiBpOTE1LiBTZWVt
cwo+ID4gPiA+ID4gPiB0byBtZSBlYXNpZXIgdG8gZ3VhcmFudGVlIGF0b21pY2l0eSBhY3Jvc3Mg
bXVsdGlwbGUgY3J0Y3MgaWYKPiA+ID4gPiA+ID4gd2UganVzdCBjb21taXQgdGhlbSBmcm9tIHRo
ZSBzYW1lIHRocmVhZC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBPaCwgYW5kIHdlIG1heSBoYXZlIHRv
IGNvbW1pdCB0aGluZ3MgaW4gYSB2ZXJ5IHNwZWNpZmljIG9yZGVyCj4gPiA+ID4gPiB0byBndWFy
YW50ZWUgdGhlIGh3IGRvZXNuJ3QgZmFsbCBvdmVyLCBzbyB5ZWFoIGRlZmluaXRlbHkgcGVyLWNy
dGMKPiA+ID4gPiA+IHRocmVhZCBpcyBhIG5vIGdvLgo+ID4gPiA+Cj4gPiA+ID4gSWYgSSdtIHVu
ZGVyc3RhbmRpbmcgdGhlIGk5MTUgY29kZSwgdGhpcyBpcyBvbmx5IHRoZSBjYXNlIGZvciBtb2Rl
c2V0Cj4gPiA+ID4gY29tbWl0cz8gIEkgc3VwcG9zZSB3ZSBjb3VsZCBhY2hpZXZlIHRoZSBzYW1l
IHJlc3VsdCBieSBqdXN0IGRlY2lkaW5nCj4gPiA+ID4gdG8gcGljayB0aGUga3RocmVhZCBvZiB0
aGUgZmlyc3QgQ1JUQyBmb3IgbW9kZXNldCBjb21taXRzLiAgSSdtIG5vdAo+ID4gPiA+IHJlYWxs
eSBzbyBtdWNoIGNvbmNlcm5lZCBhYm91dCBwYXJhbGxlbGlzbSBmb3IgbW9kZXNldC4KPiA+ID4K
PiA+ID4gSSdtIG5vdCBlbnRpcmVseSBoYXBweSBhYm91dCB0aGUgcmFuZG9tIGRpZmZlcmVuY2Vz
IGJldHdlZW4gbW9kZXNldHMKPiA+ID4gYW5kIG90aGVyIGNvbW1pdHMuIElkZWFsbHkgd2Ugd291
bGRuJ3QgbmVlZCBhbnkuCj4gPiA+Cj4gPiA+IEFueXdheXMsIGV2ZW4gaWYgd2UgaWdub3JlIG1v
ZGVzZXRzIHdlIHN0aWxsIGhhdmUgdGhlIGlzc3VlIHdpdGgKPiA+ID4gYXRvbWljaXR5IGd1YXJh
bnRlZXMgYWNyb3NzIG11bHRpcGxlIGNydGNzLiBTbyBJIHRoaW5rIHdlIHN0aWxsCj4gPiA+IGRv
bid0IHdhbnQgcGVyLWNydGMgdGhyZWFkcywgcmF0aGVyIGl0IHNob3VsZCBiZSB0aHJlYWQgZm9y
IGVhY2gKPiA+ID4gY29tbWl0Lgo+ID4KPiA+IEkgZG9uJ3QgcmVhbGx5IHNlZSBhbnkgb3RoZXIg
d2F5IHRvIHNvbHZlIHRoZSBwcmlvcml0eSBpbnZlcnNpb24gb3RoZXIKPiA+IHRoYW4gcGVyLUNS
VEMga3RocmVhZHMuCj4KPiBXaGF0J3MgdGhlIHByb2JsZW0gd2l0aCBqdXN0IHNvbWV0aGluZyBs
aWtlIGEgZGVkaWNhdGVkIGNvbW1pdAo+IHRocmVhZCBwb29sPwoKcGFydGx5LCBJIHdhcyB0cnlp
bmcgdG8gYXZvaWQgcmUtaW1wbGVtZW50aW5nIHdvcmtxdWV1ZS4gIEFuZCBwYXJ0bHkKdGhlIHRo
cmVhZC1wb29sIGFwcHJvYWNoIHNlZW1zIGxpa2UgaXQgd291bGQgYmUgaGFyZGVyIGZvciB1c2Vy
c3BhY2UKdG8gZmluZCB0aGUgdGFza3Mgd2hpY2ggbmVlZCBwcmlvcml0eSBhZGp1c3RtZW50LgoK
QnV0IGVhY2ggQ1JUQyBpcyBlc3NlbnRpYWxseSBhIEZJRk8sIHBhZ2VmbGlwIE4rMSBvbiBhIGdp
dmVuIENSVEMgd2lsbApoYXBwZW4gYWZ0ZXIgcGFnZWZsaXAgTi4KCkJSLAotUgoKPiA+IEkndmUg
YmVlbiB0aGlua2luZyBhYm91dCBpdCBhIGJpdCBtb3JlLCBhbmQKPiA+IG15IGNvbmNsdXNpb24g
aXM6Cj4gPgo+ID4gKDEpIFRoZXJlIGlzbid0IHJlYWxseSBhbnkgdXNlIGZvciB0aGUgTisxJ3Ro
IGNvbW1pdCB0byBzdGFydCBydW5uaW5nCj4gPiBiZWZvcmUgdGhlIGt0aHJlYWRfd29yayBmb3Ig
dGhlIE4ndGggY29tbWl0IGNvbXBsZXRlcywgc28gSSBkb24ndCBtaW5kCj4gPiBsb3NpbmcgdGhl
IHVuYm91bmQgYXNwZWN0IG9mIHRoZSB3b3JrcXVldWUgYXBwcm9hY2gKPiA+ICgyKSBGb3IgY2Fz
ZXMgd2hlcmUgdGhlcmUgZG9lcyBuZWVkIHRvIGJlIHNlcmlhbGl6YXRpb24gYmV0d2Vlbgo+ID4g
Y29tbWl0cyBvbiBkaWZmZXJlbnQgQ1JUQ3MsIHNpbmNlIHRoZXJlIGlzIGEgcGVyLUNSVEMga3Ro
cmVhZCwgeW91Cj4gPiBjb3VsZCBhY2hpZXZlIHRoaXMgd2l0aCBsb2NraW5nCj4gPgo+ID4gU2lu
Y2UgaTkxNSBpc24ndCB1c2luZyB0aGUgYXRvbWljIGhlbHBlcnMgaGVyZSwgSSBzdXBwb3NlIGl0
IGlzIGFuCj4gPiBvcHRpb24gZm9yIGk5MTUgdG8ganVzdCBjb250aW51ZSBkb2luZyB3aGF0IGl0
IGlzIGRvaW5nLgo+ID4KPiA+IEFuZCBJIGNvdWxkIG9mYyBqdXN0IHN0b3AgdXNpbmcgdGhlIGF0
b21pYyBjb21taXQgaGVscGVyIGFuZCBkbyB0aGUKPiA+IGt0aHJlYWRzIHRoaW5nIGluIG1zbS4g
QnV0IG15IGZpcnN0IHByZWZlcmVuY2Ugd291bGQgYmUgdGhhdCB0aGUKPiA+IGNvbW1pdCBoZWxw
ZXIgZG9lcyBnZW5lcmFsbHkgdGhlIHJpZ2h0IHRoaW5nLgo+ID4KPiA+IEJSLAo+ID4gLVIKPgo+
IC0tCj4gVmlsbGUgU3lyasOkbMOkCj4gSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
