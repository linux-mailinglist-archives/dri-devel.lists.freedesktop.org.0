Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 023642864C7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221BD6E965;
	Wed,  7 Oct 2020 16:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82B26E917
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 16:44:22 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t10so3005792wrv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 09:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1mE5Gwn7xDIbM4htDyTfJFvStSh1Kg9XYcxXUrf4KUg=;
 b=qIM+Yh3y1tTEMLEhGgZdsvlJJLqbxVhsnJEIVoxm1EkKMcNXPsUH55jARR3ezgWKDx
 9DBnk7oaNMu1GJOG7a7oTNnS9Hu4/W0MpHuo8a5rgSgM5MeIEPUrmXEpy4hy3Vu4aT4j
 QkWouP/erWGYyvTE5hHKbdxlGcsla3Ne/q2GCp5u7MQ8DQWFn4PxZDxffFXIWaFc+ECE
 dy8nO2lF/XFRfNJoDknZW5CKKKGvBwwf8bsgVftP/ALcXwfGWj3CG6hS8RMrcpbDkMIJ
 dcj/vTtBzXmFC+52hmFHX4tS76Zum9doFKeHuICoAifeljMVT5FNF7iEnFHU5UJS+dI1
 aIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1mE5Gwn7xDIbM4htDyTfJFvStSh1Kg9XYcxXUrf4KUg=;
 b=UyCBU8sbNFaPAEuzLZLTeYr8WnJk/LWhndi1P4hRGX0mLY+QGIpgu/ytcFaDfcMxYs
 MyPMw6NayIUkEn7wVwFAcDXIU6uo7WZMGfWofuK3MewIMM+8ZvlLKRQ+1/UT90jaCiHX
 DRkc40mgHNl8hz0prBp4kRCbv53QWoyN5RCPTXfrTCdDgN+RJcT1DlgUWRz8RkWyiYTp
 92MAkEUoj0yn6VOYedTvr2vB0UKw2SdPAiqVf8aTvdPYxwWwdKAzHaxsSKYi0Bvj7F9x
 ODQDAtjDHFYRtV6lrXQJCUnXqglaYxPjPse0SLdL9iSCixFv1nnuZrFWko4qVVyCPSsc
 VAYQ==
X-Gm-Message-State: AOAM530oPN2j6XBR4uvf6istSc9KoUQnjWRwcTMDRpWf6dPMzZ8Sleu3
 DnMzDIR2dC/F92W1OdiZAuQkXKxL9VHVQituGbA=
X-Google-Smtp-Source: ABdhPJz5HXnIE07xhxeYYE0PvUFLfABD/NJndXH7Tzk3cKxWEGnk9LZL0h8rgo1bVNUoAUGvaOwZEIX4OPrvF4gLutw=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr4568520wrg.83.1602089061296; 
 Wed, 07 Oct 2020 09:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
 <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
 <20201002105256.GA6112@intel.com> <20201002110544.GB6112@intel.com>
 <CAF6AEGv+UnZJoBj_ELRVr4sQeMs52vAgyw2g+wtabLPBrYDKvw@mail.gmail.com>
 <20201005121524.GI6112@intel.com>
In-Reply-To: <20201005121524.GI6112@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 7 Oct 2020 09:44:09 -0700
Message-ID: <CAF6AEGtgTb-1YQpL4CV2A=CQxkSxjn-FxDybrzSitTDSmCY_GA@mail.gmail.com>
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

T24gTW9uLCBPY3QgNSwgMjAyMCBhdCA1OjE1IEFNIFZpbGxlIFN5cmrDpGzDpAo8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMDIsIDIwMjAgYXQg
MTA6NTU6NTJBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gT24gRnJpLCBPY3QgMiwgMjAy
MCBhdCA0OjA1IEFNIFZpbGxlIFN5cmrDpGzDpAo+ID4gPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBPY3QgMDIsIDIwMjAgYXQgMDE6NTI6
NTZQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgT2N0IDAx
LCAyMDIwIGF0IDA1OjI1OjU1UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4g
PiBPbiBUaHUsIE9jdCAxLCAyMDIwIGF0IDU6MTUgUE0gUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21h
aWwuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSdtIGxlYW5pbmcgdG93YXJk
cyBjb252ZXJ0aW5nIHRoZSBvdGhlciBkcml2ZXJzIG92ZXIgdG8gdXNlIHRoZQo+ID4gPiA+ID4g
PiBwZXItY3J0YyBrd29yaywgYW5kIHRoZW4gZHJvcHBpbmcgdGhlICdjb21taXRfd29ya2AgZnJv
bSBhdG9taWMgc3RhdGUuCj4gPiA+ID4gPiA+IEkgY2FuIGFkZCBhIHBhdGNoIHRvIHRoYXQsIGJ1
dCBmaWd1cmVkIEkgY291bGQgcG9zdHBvbmUgdGhhdCBjaHVybgo+ID4gPiA+ID4gPiB1bnRpbCB0
aGVyZSBpcyBzb21lIGJ5LWluIG9uIHRoaXMgd2hvbGUgaWRlYS4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBpOTE1IGhhcyBpdHMgb3duIGNvbW1pdCBjb2RlLCBpdCdzIG5vdCBldmVuIHVzaW5nIHRoZSBj
dXJyZW50IGNvbW1pdAo+ID4gPiA+ID4gaGVscGVycyAobm9yIHRoZSBjb21taXRfd29yaykuIE5v
dCBzdXJlIGhvdyBtdWNoIG90aGVyIGZ1biB0aGVyZSBpcy4KPiA+ID4gPgo+ID4gPiA+IEkgZG9u
J3QgdGhpbmsgd2Ugd2FudCBwZXItY3J0YyB0aHJlYWRzIGZvciB0aGlzIGluIGk5MTUuIFNlZW1z
Cj4gPiA+ID4gdG8gbWUgZWFzaWVyIHRvIGd1YXJhbnRlZSBhdG9taWNpdHkgYWNyb3NzIG11bHRp
cGxlIGNydGNzIGlmCj4gPiA+ID4gd2UganVzdCBjb21taXQgdGhlbSBmcm9tIHRoZSBzYW1lIHRo
cmVhZC4KPiA+ID4KPiA+ID4gT2gsIGFuZCB3ZSBtYXkgaGF2ZSB0byBjb21taXQgdGhpbmdzIGlu
IGEgdmVyeSBzcGVjaWZpYyBvcmRlcgo+ID4gPiB0byBndWFyYW50ZWUgdGhlIGh3IGRvZXNuJ3Qg
ZmFsbCBvdmVyLCBzbyB5ZWFoIGRlZmluaXRlbHkgcGVyLWNydGMKPiA+ID4gdGhyZWFkIGlzIGEg
bm8gZ28uCj4gPgo+ID4gSWYgSSdtIHVuZGVyc3RhbmRpbmcgdGhlIGk5MTUgY29kZSwgdGhpcyBp
cyBvbmx5IHRoZSBjYXNlIGZvciBtb2Rlc2V0Cj4gPiBjb21taXRzPyAgSSBzdXBwb3NlIHdlIGNv
dWxkIGFjaGlldmUgdGhlIHNhbWUgcmVzdWx0IGJ5IGp1c3QgZGVjaWRpbmcKPiA+IHRvIHBpY2sg
dGhlIGt0aHJlYWQgb2YgdGhlIGZpcnN0IENSVEMgZm9yIG1vZGVzZXQgY29tbWl0cy4gIEknbSBu
b3QKPiA+IHJlYWxseSBzbyBtdWNoIGNvbmNlcm5lZCBhYm91dCBwYXJhbGxlbGlzbSBmb3IgbW9k
ZXNldC4KPgo+IEknbSBub3QgZW50aXJlbHkgaGFwcHkgYWJvdXQgdGhlIHJhbmRvbSBkaWZmZXJl
bmNlcyBiZXR3ZWVuIG1vZGVzZXRzCj4gYW5kIG90aGVyIGNvbW1pdHMuIElkZWFsbHkgd2Ugd291
bGRuJ3QgbmVlZCBhbnkuCj4KPiBBbnl3YXlzLCBldmVuIGlmIHdlIGlnbm9yZSBtb2Rlc2V0cyB3
ZSBzdGlsbCBoYXZlIHRoZSBpc3N1ZSB3aXRoCj4gYXRvbWljaXR5IGd1YXJhbnRlZXMgYWNyb3Nz
IG11bHRpcGxlIGNydGNzLiBTbyBJIHRoaW5rIHdlIHN0aWxsCj4gZG9uJ3Qgd2FudCBwZXItY3J0
YyB0aHJlYWRzLCByYXRoZXIgaXQgc2hvdWxkIGJlIHRocmVhZCBmb3IgZWFjaAo+IGNvbW1pdC4K
CkkgZG9uJ3QgcmVhbGx5IHNlZSBhbnkgb3RoZXIgd2F5IHRvIHNvbHZlIHRoZSBwcmlvcml0eSBp
bnZlcnNpb24gb3RoZXIKdGhhbiBwZXItQ1JUQyBrdGhyZWFkcy4gIEkndmUgYmVlbiB0aGlua2lu
ZyBhYm91dCBpdCBhIGJpdCBtb3JlLCBhbmQKbXkgY29uY2x1c2lvbiBpczoKCigxKSBUaGVyZSBp
c24ndCByZWFsbHkgYW55IHVzZSBmb3IgdGhlIE4rMSd0aCBjb21taXQgdG8gc3RhcnQgcnVubmlu
ZwpiZWZvcmUgdGhlIGt0aHJlYWRfd29yayBmb3IgdGhlIE4ndGggY29tbWl0IGNvbXBsZXRlcywg
c28gSSBkb24ndCBtaW5kCmxvc2luZyB0aGUgdW5ib3VuZCBhc3BlY3Qgb2YgdGhlIHdvcmtxdWV1
ZSBhcHByb2FjaAooMikgRm9yIGNhc2VzIHdoZXJlIHRoZXJlIGRvZXMgbmVlZCB0byBiZSBzZXJp
YWxpemF0aW9uIGJldHdlZW4KY29tbWl0cyBvbiBkaWZmZXJlbnQgQ1JUQ3MsIHNpbmNlIHRoZXJl
IGlzIGEgcGVyLUNSVEMga3RocmVhZCwgeW91CmNvdWxkIGFjaGlldmUgdGhpcyB3aXRoIGxvY2tp
bmcKClNpbmNlIGk5MTUgaXNuJ3QgdXNpbmcgdGhlIGF0b21pYyBoZWxwZXJzIGhlcmUsIEkgc3Vw
cG9zZSBpdCBpcyBhbgpvcHRpb24gZm9yIGk5MTUgdG8ganVzdCBjb250aW51ZSBkb2luZyB3aGF0
IGl0IGlzIGRvaW5nLgoKQW5kIEkgY291bGQgb2ZjIGp1c3Qgc3RvcCB1c2luZyB0aGUgYXRvbWlj
IGNvbW1pdCBoZWxwZXIgYW5kIGRvIHRoZQprdGhyZWFkcyB0aGluZyBpbiBtc20uIEJ1dCBteSBm
aXJzdCBwcmVmZXJlbmNlIHdvdWxkIGJlIHRoYXQgdGhlCmNvbW1pdCBoZWxwZXIgZG9lcyBnZW5l
cmFsbHkgdGhlIHJpZ2h0IHRoaW5nLgoKQlIsCi1SCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
