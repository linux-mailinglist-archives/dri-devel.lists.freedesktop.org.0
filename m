Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE386E75B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 16:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD3F6E842;
	Fri, 19 Jul 2019 14:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29E76E842
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 14:30:00 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x22so26244225qtp.12
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 07:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VgGzgACxbuAr1WfrZf7Di5N8bvGrichlRILKSX90qEA=;
 b=U/OhO5Tjfqwe4E7+j/GjZyb1hqP5eKd0BPWJ476IUbeUP5kqz4+W77GgFBTHA8K2HC
 /ebcF8m1r6cgibhqgC8Kxt4Wj15ojI34wODl9q4b7cUTTPPKUcFL7RLo4ND3JSO9t6tK
 EYn9nvluvpTAqRT18tHCoiuMbToqkJ0anB2y6DuBzmToARIRn+PxHqAIDgwljW4nIcPc
 VpUQZecCM9UyW15lsWXw+YMqnMzrYIAPLE2UYXlfIw4+5RPyCl5eecKoc/4mUtPLoCYx
 3LBSX6ANZcflesr5mH8DzWSxFm3IaXT/BX4PmyInS528e6xOk4oSigBwm/IqiWqwNunb
 jPSg==
X-Gm-Message-State: APjAAAVwU/qDYxUjGA6FMHnnOgUroeoN5AWIwbzrFcRLDXx0HnXa7qPx
 EBFWuKu8Ls/JvQYSDs1eGNH6FQ==
X-Google-Smtp-Source: APXvYqyiV6BEK6L7QlUrxkx0Q/3IuMSb5JrAJ6Lu4nQ8M2EcGMFjw566l6GMctEIO7Y6xBwCbplpXA==
X-Received: by 2002:ac8:34c5:: with SMTP id x5mr35858737qtb.91.1563546600009; 
 Fri, 19 Jul 2019 07:30:00 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id t2sm18236556qth.33.2019.07.19.07.29.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 07:29:59 -0700 (PDT)
Date: Fri, 19 Jul 2019 10:29:59 -0400
From: Sean Paul <sean@poorly.run>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [RFC] Expanding drm_mode_modeinfo flags
Message-ID: <20190719142959.GD104440@art_vandelay>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
 <20190716090712.GY15868@phenom.ffwll.local>
 <16fee2b42fa03d2cf104452223dcf5af@codeaurora.org>
 <20190719090553.GF15868@phenom.ffwll.local>
 <20190719135558.GC104440@art_vandelay>
 <20190719141528.GN5942@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719141528.GN5942@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=VgGzgACxbuAr1WfrZf7Di5N8bvGrichlRILKSX90qEA=;
 b=OG+zoI/Gr3rCL4n3YLQz/VzBvTqAcQH2YGj4dOvWfEIPDhs6/xqsc/wbZNDjV+42XI
 CvALdJiuZkiC4K5IW4SxW6yJ3NWBJI2YTVcPgAOFejWvbIym9nVhEsTUnq2qmN92AnJm
 S1z81DvDRbK/H6xHveDVeOoxQlYESyCNRcEkGhuBdJY7Scj6voS+YgJj5o5pyR3Y1vtX
 q6WBn9EIaOGSt5QUN7wRyQ5F52t//XrhaE6pvNqRVZAa5qipoC2sL8UtJsGXls8ECv24
 DBdKOwyd38wa3jkkZ7HOXyiZYgdO1Eta3vmYTP7+19BvH9ezBA02ZXrO9Fry2sMbBXv6
 gYpQ==
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pdhaval@codeaurora.org, seanpaul@chromium.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDU6MTU6MjhQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIEZyaSwgSnVsIDE5LCAyMDE5IGF0IDA5OjU1OjU4QU0gLTA0MDAsIFNlYW4g
UGF1bCB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDE5LCAyMDE5IGF0IDExOjA1OjUzQU0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDExOjE4
OjQyQU0gLTA3MDAsIEpleWt1bWFyIFNhbmthcmFuIHdyb3RlOgo+ID4gPiA+IE9uIDIwMTktMDct
MTYgMDI6MDcsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUsIEp1bCAxMSwg
MjAxOSBhdCAxMTo0Njo0NEFNIC0wNzAwLCBKZXlrdW1hciBTYW5rYXJhbiB3cm90ZToKCi9zbmlw
Cgo+ID4gPiA+ID4gPiAgIGRybTogYWRkIG1vZGUgZmxhZ3MgaW4gdWFwaSBmb3Igc2VhbWxlc3Mg
bW9kZSBzd2l0Y2gKPiA+ID4gPiA+IAo+ID4gPiA+ID4gSSB0aGluayB0aGUgdWFwaSBpcyB0aGUg
dHJpdmlhbCBwYXJ0IGhlcmUsIHRoZSByZWFsIGRlYWwgaXMgaG93Cj4gPiA+ID4gPiB1c2Vyc3Bh
Y2UKPiA+ID4gPiA+IHVzZXMgdGhpcy4gQ2FuIHlvdSBwbHMgcG9zdCB0aGUgcGF0Y2hlcyBmb3Ig
eW91ciBjb21wb3NpdG9yPwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBBbHNvIG5vdGUgdGhhdCB3ZSBh
bHJlYWR5IGFsbG93IHVzZXJzcGFjZSB0byB0ZWxsIHRoZSBrZXJuZWwgd2hldGhlcgo+ID4gPiA+
ID4gZmxpY2tlcmluZyBpcyBvayBvciBub3QgZm9yIGEgbW9kZXNldC4gbXNtIGRyaXZlciBjb3Vs
ZCB1c2UgdGhhdCB0byBhdAo+ID4gPiA+ID4gbGVhc3QgdGVsbCB1c2Vyc3BhY2Ugd2hldGhlciBh
IG1vZGVzZXQgY2hhbmdlIGlzIHBvc3NpYmxlLiBTbyB5b3UgY2FuCj4gPiA+ID4gPiBhbHJlYWR5
IGltcGxlbWVudCBnbGl0Y2gtZnJlZSBtb2Rlc2V0IGNoYW5nZXMgZm9yIGF0IGxlYXN0IHZpZGVv
IG1vZGUuCj4gPiA+ID4gPiAtRGFuaWVsCj4gPiA+ID4gCj4gPiA+ID4gSSBiZWxpZXZlIHlvdSBh
cmUgcmVmZXJyaW5nIHRvIHRoZSBiZWxvdyB0diBwcm9wZXJ0eSBvZiB0aGUgY29ubmVjdG9yLgo+
ID4gPiA+IAo+ID4gPiA+IC8qKgo+ID4gPiA+ICAqIEB0dl9mbGlja2VyX3JlZHVjdGlvbl9wcm9w
ZXJ0eTogT3B0aW9uYWwgVFYgcHJvcGVydHkgdG8gY29udHJvbCB0aGUKPiA+ID4gPiAgKiBmbGlj
a2VyIHJlZHVjdGlvbiBtb2RlLgo+ID4gPiA+ICAqLwo+ID4gPiA+IHN0cnVjdCBkcm1fcHJvcGVy
dHkgKnR2X2ZsaWNrZXJfcmVkdWN0aW9uX3Byb3BlcnR5Owo+ID4gPiAKPiA+ID4gTm90IGV2ZW4g
Y2xvc2UgOi0pCj4gPiA+IAo+ID4gPiBJIG1lYW4gdGhlIERSTV9NT0RFX0FUT01JQ19BTExPV19N
T0RFU0VUIGZsYWcgZm9yIHRoZSBhdG9taWMgaW9jdGwuIFRoaXMKPiA+ID4gaXMgbm90IGEgcHJv
cGVydHkgb2YgYSBtb2RlLCB0aGlzIGlzIGEgcHJvcGVydHkgb2YgYSBfdHJhbnNpdGlvbl8gYmV0
d2Vlbgo+ID4gPiBjb25maWd1cmF0aW9ucy4gU29tZSB0cmFuc2l0aW9ucyBjYW4gYmUgZG9uZSBm
bGlja2VyIGZyZWUsIG90aGVycyBjYW4ndC4KPiA+IAo+ID4gQWdyZWUgdGhhdCBhbiBhdG9taWMg
ZmxhZyBvbiBhIGNvbW1pdCBpcyB0aGUgd2F5IHRvIGFjY29tcGxpc2ggdGhpcy4gSXQncyBwcmV0
dHkKPiA+IHNpbWlsYXIgdG8gdGhlIHBzciB0cmFuc2l0aW9ucywgd2hlcmUgd2Ugd2FudCB0byBy
ZXVzZSBtb3N0IG9mIHRoZSBhdG9taWMKPiA+IGNpcmN1aXRyeSwgYnV0IGluIGEgc3BlY2lhbGl6
ZWQgd2F5LiBXZSdkIGFsc28gaGF2ZSB0byBiZSBjYXJlZnVsIHRvIG9ubHkKPiA+IGludm9sdmUg
dGhlIGRybSBvYmplY3RzIHdoaWNoIGFyZSBzZWFtbGVzcyBtb2Rlc2V0IGF3YXJlICh5b3UgY291
bGQgaW1hZ2luZQo+ID4gYSBicmlkZ2UgY2hhaW4gd2hlcmUgdGhlIGJyaWRnZXMgZG93bnN0cmVh
bSBvZiB0aGUgZmlyc3QgYnJpZGdlIGRvbid0IGNhcmUpLgo+ID4gCj4gPiA+IAo+ID4gPiBUaGVy
ZSdzIHRoZW4gc3RpbGwgdGhlIHF1ZXN0aW9uIG9mIGhvdyB0byBwaWNrIHZpZGVvIHZzIGNvbW1h
bmQgbW9kZSwgYnV0Cj4gPiA+IGltbyBiZXR0ZXIgdG8gc3RhcnQgd2l0aCBpbXBsZW1lbnRpbmcg
dGhlIHRyYW5zaXRpb24gYmVoYXZpb3VyIGNvcnJlY3RseQo+ID4gPiBmaXJzdC4KPiA+IAo+ID4g
Q29ubmVjdG9yIHByb3BlcnR5PyBQb3NzaWJseSBhIHRlcnJpYmxlIGlkZWEsIGJ1dCBJIHdvbmRl
ciBpZiB3ZSBjb3VsZCBbcmVddXNlCj4gPiB0aGUgdnJyIHByb3BlcnRpZXMgZm9yIGNvbW1hbmQg
bW9kZS4gVGhlIGRvY3Mgc3RhdGUgdGhhdCB0aGUgZHJpdmVyIGhhcyB0aGUKPiA+IG9wdGlvbiBv
ZiBwdXR0aW5nIHVwcGVyIGFuZCBsb3dlciBib3VuZHMgb24gdGhlIHJlZnJlc2ggcmF0ZS4KPiAK
PiBOb3QgcmVhbGx5IHN1cmUgd2h5IHRoaXMgbmVlZHMgbmV3IHByb3BzIGFuZCB3aGF0bm90LiBU
aGlzIGlzIGtpbmRhIHdoYXQKPiB0aGUgaTkxNSAiZmFzdHNldCIgc3R1ZmYgYWxyZWFkeSBkb2Vz
Ogo+IDEuIHVzZXJzcGFjZSBhc2tzIGZvciBzb21ldGhpbmcgdG8gYmUgY2hhbmdlZCB2aWEgYXRv
bWljCj4gMi4gZHJpdmVyIGNhbGN1bGF0ZXMgd2hldGhlciBhIG1vZGVzZXQgaXMgYWN0dWFsbHkg
cmVxdWlyZWQKPiAzLiBhdG9taWMgdmFsaWRhdGVzIG5lZWRfbW9kZXNldCgpIHZzLiBEUk1fTU9E
RV9BVE9NSUNfQUxMT1dfTU9ERVNFVAo+IDQuIGlmIChuZWVkX21vZGVzZXQpIGhlYXZ5d2VpZ2h0
X2NvbW1pdCgpIGVsc2UgbGlnaHR3ZWlnaHRfY29tbWl0KCkKPiAKPiBJZS4gd2h5IHNob3VsZCB1
c2Vyc3BhY2UgcmVhbGx5IGNhcmUgYWJvdXQgYW55dGhpbmcgZXhjZXB0IHRoZQo+ICJmbGlja2Vy
cyBhcmUgT0siIHZzLiAiZmxpY2tlcnMgbm90IHdhbnRlZCIgdGhpbmc/CgpBZ3JlZSwgSSBkb24n
dCB0aGluayB0aGUgc2VhbWxlc3MgbW9kZXNldCAoaWU6IGNoYW5naW5nIHJlc29sdXRpb24gd2l0
aG91dApmbGlja2VyKSBuZWVkcyBhIHByb3BlcnR5LiBKdXN0IG5lZWQgdG8gdGVzdCB0aGUgY29t
bWl0IHdpdGhvdXQgQUxMT1dfTU9ERVNFVAphbmQgY29tbWl0IGl0IGlmIHRoZSB0ZXN0IHBhc3Nl
cy4KCj4gCj4gQWxzbyB3aGF0J3MgdGhlIGJlbmVmaXQgb2YgdXNpbmcgdmlkZW8gbW9kZSBpZiB5
b3VyIHBhbmVsIHN1cHBvcnRlcwo+IGNvbW1hbmQgbW9kZT8gQ2FuIHlvdSB0dXJuIG9mZiB0aGUg
bWVtb3J5IGluIHRoZSBwYW5lbCBhbmQgYWN0dWFsbHkKPiBzYXZlIHBvd2VyIHRoYXQgd2F5PyBB
bmQgaWYgdGhlcmUgaXMgYSBiZW5lZml0IGNhbid0IHRoZSBkcml2ZXIganVzdAo+IGF1dG9tYWdp
Y2FsbHkgc3dpdGNoIGJldHdlZW4gdGhlIHR3byBiYXNlZCBvbiBob3cgb2Z0ZW4gdGhpbmdzIGFy
ZQo+IGdldHRpbmcgdXBkYXRlZD8gVGhhdCB3b3VsZCBtYXRjaCBob3cgZURQIFBTUiBhbHJlYWR5
IHdvcmtzLgoKSSdtIGd1ZXNzaW5nIHZpZGVvIG1vZGUgbWlnaHQgaGF2ZSBzb21lIGxhdGVuY3kg
YmVuZWZpdHMgb3ZlciBjb21tYW5kIG1vZGU/CgpTZWFuCgo+IAo+IC0tIAo+IFZpbGxlIFN5cmrD
pGzDpAo+IEludGVsCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8g
Q2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
