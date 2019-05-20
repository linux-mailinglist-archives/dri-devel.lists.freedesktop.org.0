Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D2222FAD
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 11:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D29E891CA;
	Mon, 20 May 2019 09:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01034891CA;
 Mon, 20 May 2019 09:06:09 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id c24so8437519vsp.7;
 Mon, 20 May 2019 02:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NtXp1qUqcm3uZCNPXqEQ7xEuqH7F3Cd1oa/vGsVVX9M=;
 b=iwhxIIxla+ER70L+KSK9BBUhotd95t6GxiZJb4qQJtjUesuq9HD6VHb3YMn1k1/u2+
 4BspKmCpo3u3Q43NTBtD6uh2/sKuX5BmANSxAe49ZbKf9YmoNL6faH23XN0Hi/WpmHm0
 RcVsU+RKevzXOXoQ9Mg4DIKVtpObGIj8XlE63WcXNttrEkY3jCDo7yfSQR5Ztvtrxh+S
 TzeILAsk4a9QrizvCuRPsqK2hCpQ2F1eRm/QDb4jwODT+2vD1q6NXAdHXQvaLTNxdO/T
 e83RNz/TM09lppAEcSRYx4ecEu+H51udHAUWDuxjLVpk5+z1GG4wvBuUQRu9VkRou9IG
 XXPA==
X-Gm-Message-State: APjAAAW2wKkWYN5/H7RjRMRe6UoCYrVceeLlbhTiP46FCZ4DqXE4NHkT
 Pf9n3KlYEAtJ7Qqk19fHw81t6erMSvFshCA4ih0=
X-Google-Smtp-Source: APXvYqyUShVi/8PDt7r6nhmGOzPit4HgmJvzxn18tzzLapn32MIxpElZyBHIwWigYtyEy7flMfCjer/20VatpkU6+Bk=
X-Received: by 2002:a67:f303:: with SMTP id p3mr23011462vsf.166.1558343169054; 
 Mon, 20 May 2019 02:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
 <20190520082216.26273-21-daniel.vetter@ffwll.ch>
In-Reply-To: <20190520082216.26273-21-daniel.vetter@ffwll.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 May 2019 11:05:57 +0200
Message-ID: <CAMuHMdVuu062bkOb4sPv-m-WUF4L=K9Q5-hGPHTb8OhPbQdSEg@mail.gmail.com>
Subject: Re: [PATCH 20/33] fbdev/sh_mob: Remove fb notifier callback
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Markus Elfring <elfring@users.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTA6MjIgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gVGhpcyBzZWVtcyB0byBiZSBlbnRpcmVseSBkZWZ1bmN0
Ogo+Cj4gLSBUaGUgRkJfRVZFTl9TVVNQRU5EL1JFU1VNRSBldmVudHMgYXJlIG9ubHkgc2VudCBv
dXQgYnkKPiAgIGZiX3NldF9zdXNwZW5kLiBXaGljaCBpcyBzdXBwb3NlZCB0byBiZSBjYWxsZWQg
YnkgZHJpdmVycyBpbiB0aGVpcgo+ICAgc3VzcGVuZC9yZXN1bWUgaG9va3MsIGFuZCBub3QgaXRz
ZWxmIGNhbGwgaW50byBkcml2ZXJzLiBMdWNraWx5Cj4gICBzaF9tb2IgZG9lc24ndCBjYWxsIGZi
X3NldF9zdXNwZW5kLCBzbyB0aGlzIHNlZW1zIHRvIGRvIG5vdGhpbmcKPiAgIHVzZWZ1bC4KPgo+
IC0gVGhlIG5vdGlmeSBob29rIGNhbGxzIHNoX21vYmlsZV9mYl9yZWNvbmZpZygpIHdoaWNoIGlu
IHR1cm4gY2FuCj4gICBjYWxsIGludG8gdGhlIGZiIG5vdGlmaWVyLiBPciBhdHRlbXB0IHRvbywg
c2luY2UgdGhhdCB3b3VsZAo+ICAgZGVhZGxvY2suCj4KPiBTbyBsb29rcyBsaWtlIGxlZnRvdmVy
IGhhY2tzIGZyb20gd2hlbiB0aGlzIHdhcyBvcmlnaW5hbGx5IGludHJvZHVjZWQKPiBpbgo+Cj4g
Y29tbWl0IDYwMTFiZGVhYTYwODlkNDljMDJkZTY5ZjA1OTgwZGE3YmFkMzE0YWIKPiBBdXRob3I6
IEd1ZW5uYWRpIExpYWtob3ZldHNraSA8Zy5saWFraG92ZXRza2lAZ214LmRlPgo+IERhdGU6ICAg
V2VkIEp1bCAyMSAxMDoxMzoyMSAyMDEwICswMDAwCj4KPiAgICAgZmJkZXY6IHNoLW1vYmlsZTog
SERNSSBzdXBwb3J0IGZvciBTSC1Nb2JpbGUgU29Dcwo+Cj4gU28gbGV0J3MganVzdCByZW1vdmUg
aXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVs
LmNvbT4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPgoKRGlzcGxheSBzdGlsbCB3b3JrcyBmaW5lIG9uIEFybWFkaWxsbzgwMC1FVkEsIGJl
Zm9yZSBhbmQgYWZ0ZXIgc3lzdGVtCnN1c3BlbmQvcmVzdW1lLCBzbzoKClRlc3RlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVldGlu
Z31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
