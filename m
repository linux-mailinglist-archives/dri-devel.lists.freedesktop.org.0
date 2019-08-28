Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83817A05C7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 17:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5571389D42;
	Wed, 28 Aug 2019 15:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3BE89D42;
 Wed, 28 Aug 2019 15:11:53 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id j6so71670uae.12;
 Wed, 28 Aug 2019 08:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nmhv0LFg3EJB/5+r9LbNluJ88yl3V6Xf6qJ2ynbohhs=;
 b=KPSQ4RZijoAClWpO2g32OcpbcFvxLOLpVan1nRpVpBsrkKVWfgmN0zLEz6y8HFJXOJ
 2dV11V0xeWg0svzb1n9kDdblcmXkTf5Ra09jgKdQFZU4RPOmckSgw0xK5yF28SE+kfll
 +UbPuXKB8O8Cmt7JY5ffDimeCQY1r4LvW6mt3N8K6crhD+YAjujy3GgYpxXNbOKYFADl
 xkoLjheihi5VyPsT4MSiUs1M2C/22QwnCFGq4R3X90Qvpx3X/KcdHz0p60Oj+Xhy7pRd
 ejCVqoGehgTdZQLP8blMtBPoKLhoCuiEw5CaWZM9+Dw0M+q3Ew8nRHbPyO6X3MuVXoET
 HwFw==
X-Gm-Message-State: APjAAAWxm2XEwN/+AKOUd2XaQRGYDtCUOTqbYv9O7InW8K2u0MPU8sOB
 QZA7YBN+ms9UVWVS67mTpstnzC+aobYC5885wbE=
X-Google-Smtp-Source: APXvYqy07iU6mLAVV1VwVRgHal7nJ1os5c4GbmGAppmtSO+KqQXPuR+gFNMr9jXQdKtqMEo448HrNX8NeMlZq71d0IM=
X-Received: by 2002:ab0:1562:: with SMTP id p31mr2235339uae.15.1567005112275; 
 Wed, 28 Aug 2019 08:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
 <20190826132216.2823-6-oleg.vasilev@intel.com>
 <CAKb7UviahO6HWbxOoLyqN2X6WFw_GyucQuMs7Wj-MrKVNP1n_g@mail.gmail.com>
 <20190828143821.GD7482@intel.com>
 <CAKb7Uvg=5BrQmLsq_=Cv1D_-baQ_crWRDePbnXXKy-jCVXtvsA@mail.gmail.com>
 <20190828145404.GE7482@intel.com>
In-Reply-To: <20190828145404.GE7482@intel.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 28 Aug 2019 11:11:41 -0400
Message-ID: <CAKb7UviDZZkOAQWu+_Lqw3TbhnKq138XM5HXNRUzoc5GCCZGNA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v3 5/7] drm/nouveau: utilize subconnector
 property for DP
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Oleg Vasilev <oleg.vasilev@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTA6NTQgQU0gVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAyOCwgMjAxOSBh
dCAxMDo0NzowOEFNIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDI4
LCAyMDE5IGF0IDEwOjM4IEFNIFZpbGxlIFN5cmrDpGzDpAo+ID4gPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBBdWcgMjYsIDIwMTkgYXQg
MDk6MzY6NTBBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3JvdGU6Cj4gPiA+ID4gVGhpcyBzaG91bGQg
cHJvYmFibHkgYmUgZml4ZWQgdG8gYWNjb3VudCBmb3IgdGhlIHNjZW5hcmlvIHdoZXJlIGFuCj4g
PiA+ID4gSERNSSBjb25uZWN0b3IgaXMgcGx1Z2dlZCBkaXJlY3RseSBpbnRvIHRoZSBEUCsrIHBv
cnQuIEkgZG9uJ3QgdGhpbmsKPiA+ID4gPiB0aGUgZHAuc3ViY29ubmVjdG9yIHByb3BlcnR5IHdp
bGwgYmUgdmFsaWQgaW4gdGhhdCBjYXNlLgo+ID4gPiA+IChVbmZvcnR1bmF0ZWx5IEkgZG9uJ3Qg
cmVtZW1iZXIgaG93IG9uZSBkZXRlY3RzIHRoYXQgcGFydGljdWxhcgo+ID4gPiA+IHNpdHVhdGlv
bi4pCj4gPiA+Cj4gPiA+IE9uZSBtYXkgb3IgbWF5IG5vdCBiZSBhYmxlIHRvIGRldGVjdCBpdCB2
ZXJ5IHdlbGwuIEkndmUgc2VlbiBkb25nbGVzCj4gPiA+IHRoYXQgYXV0b21hZ2ljYWxseSBjaGFu
Z2UgdGhlIERGUCB0eXBlIGZyb20gRFArKyB0byBEUC9IRE1JIGRlcGVuZGluZwo+ID4gPiBvbiB3
aGF0J3MgcGx1Z2dlZCBpbiwgYW5kIEkndmUgYWxzbyBzZWVuIGRvbmdsZXMgdGhhdCBsZWF2ZSB0
aGUgREZQCj4gPiA+IHR5cGUgdG8gRFArKy4KPiA+Cj4gPiBXZWxsLCBvdXIgaW50ZXJuYWwgbG9n
aWMgY2VydGFpbmx5IGtub3dzIGlmIGl0J3MgZHJpdmluZyBEUCBvciBUTURTLiBJCj4gPiBqdXN0
IGRvbid0IHJlbWVtYmVyIGhvdyBpdCBrbm93cyB0aGlzLgo+Cj4gWW91J2xsIGJlIGRyaXZpbmcg
RFAgaW4gdGhpcyBjYXNlLiBUaGUgREZQIHdpbGwgYmUgdGhlIG9uZSBkcml2aW5nCj4gRFAgb3Ig
VE1EUyBkZXBlbmRpbmcgb24gd2hhdCdzIHBsdWdnZWQgaW4uCgpPSy4gVGhhdCdzIG5vdCB0aGUg
Y2FzZSBJIHdhcyB3b3JyaWVkIGFib3V0IHRob3VnaCA6KQoKSSdtIHdvcnJpZWQgYWJvdXQgdGhl
IGNhc2Ugd2hlcmUgeW91IHBsdWcgYSB0cnVlIEhETUkgdGhpbmcgaW50byB0aGUKRFAgcG9ydCwg
d2hpY2ggd2lsbCB0aGVuIGJlIGRyaXZlbiBieSBIRE1JIGFuZCBub25lIG9mIHRoZSBkcC4qIHRo
aW5ncwp3aWxsIGJlIHNldCAoSSBkb24ndCByZW1lbWJlciwgYnV0IHRoZXkgbWlnaHQgZXZlbiBi
ZSBpbiBhIHVuaW9uKS4gSQp0aGluayBJbnRlbCBtdWx0aXBsaWVzIGNvbm5lY3RvcnMgZm9yIHRo
aXMsIGJ1dCBub3V2ZWF1L2FtZCBqdXN0IGhhdmUKYSBzaW5nbGUgY29ubmVjdG9yIHRoYXQgaGFu
ZGxlcyBib3RoLgoKICAtaWxpYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
