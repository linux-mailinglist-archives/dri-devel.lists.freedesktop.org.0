Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 460E5AB930
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 15:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ED06E294;
	Fri,  6 Sep 2019 13:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537316E293;
 Fri,  6 Sep 2019 13:24:26 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id 82so1262177vkf.11;
 Fri, 06 Sep 2019 06:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XLpr7WvbSvimdjkJnjlD0Shk80lqTbI9nNOT/f95L7s=;
 b=FnIcExIDBJwbOOSwa+tRyp0afyhJw0uWVtxlWjaoI0HMSwEzIYrkT9I+mnN+sSJwGd
 NGyiDA8Zmq2nclQypeccVnfPZxkCLhnEOExBLC650GLWrzakVQ3ZOq2gth/c2eSNWdND
 U6CrD0Ezzvd11B8t9s3dFrQNRPqAiAk0KSX8nJz8D3hfmBzgeA/dY1yerAWrHJ4PDEMR
 6l+YSddh/1lD897x+NmT/RGwiu10yY1r6vl3ayJwuCInIC79M454S8D06jS5is3/jmDx
 /AejECeeUiPVW1t7h9MOoiyHFjjxCXpWiyNywqGPhraTCgKvuDr0Y7CACWpzTpVoXc37
 vROw==
X-Gm-Message-State: APjAAAUFkW+d1RG6fbtxrZAZsG5hn20nwy+T8eB1LnU0IeoK6cSpKGvh
 JX5ZVJtNOAfJqwA7ybWxP7l3S/UWYx/BZ/ULSG7EQw==
X-Google-Smtp-Source: APXvYqxWBON6QU8X1QmmlTNmsRiXMY9tuAH7+aGD+d5hFG+kdzamK7/dOHtoEpMTel5XshSL88ymgx7XhUyLCz7GQ+s=
X-Received: by 2002:a1f:8:: with SMTP id 8mr3866470vka.2.1567776265167; Fri,
 06 Sep 2019 06:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
 <20190903091235.32304-4-gwan-gyeong.mun@intel.com>
 <CAKb7Uvi4aO-im=cBi_xy8QoDhUXsJmuxcL8ewOrMvFbky9Je0g@mail.gmail.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F821DC31F@BGSMSX104.gar.corp.intel.com>
 <20190906114255.GS7482@intel.com>
In-Reply-To: <20190906114255.GS7482@intel.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 6 Sep 2019 09:24:12 -0400
Message-ID: <CAKb7UvjdjrVtueEDM+eij0LvCrdAbwzUyNpbPde=AZ-7Dega2A@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm: Add DisplayPort colorspace property
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Shankar,
 Uma" <uma.shankar@intel.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgNiwgMjAxOSBhdCA3OjQzIEFNIFZpbGxlIFN5cmrDpGzDpAo8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMDYsIDIwMTkgYXQg
MTE6MzE6NTVBTSArMDAwMCwgU2hhbmthciwgVW1hIHdyb3RlOgo+ID4KPiA+Cj4gPiA+LS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID5Gcm9tOiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVt
Lm1pdC5lZHU+Cj4gPiA+U2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDMsIDIwMTkgNjoxMiBQTQo+
ID4gPlRvOiBNdW4sIEd3YW4tZ3llb25nIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPgo+ID4g
PkNjOiBJbnRlbCBHcmFwaGljcyBEZXZlbG9wbWVudCA8aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz47IFNoYW5rYXIsIFVtYQo+ID4gPjx1bWEuc2hhbmthckBpbnRlbC5jb20+OyBkcmkt
ZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Cj4gPiA+U3ViamVjdDogUmU6
IFtQQVRDSCB2NCAzLzddIGRybTogQWRkIERpc3BsYXlQb3J0IGNvbG9yc3BhY2UgcHJvcGVydHkK
PiA+ID4KPiA+ID5TbyBob3cgd291bGQgdGhpcyB3b3JrIHdpdGggYSBEUCsrIGNvbm5lY3Rvcj8g
U2hvdWxkIGl0IGxpc3QgdGhlIEhETUkgb3IgRFAKPiA+ID5wcm9wZXJ0aWVzPyBPciBkbyB3ZSBu
ZWVkIGEgY3VzdG9tIHByb3BlcnR5IGNoZWNrZXIgd2hpY2ggaXMgYXdhcmUgb2Ygd2hhdCBpcwo+
ID4gPmN1cnJlbnRseSBwbHVnZ2VkIGluIHRvIHZhbGlkYXRlIHRoZSB2YWx1ZXM/Cj4gPgo+ID4g
QUZBSVUgRm9yIERQKysgY2FzZXMsIHdlIGRldGVjdCB3aGF0IGtpbmQgb2Ygc2luayBpdHMgZHJp
dmluZyBEUCBvciBIRE1JICh3aXRoIGEgcGFzc2l2ZSBkb25nbGUpLgo+ID4gQmFzZWQgb24gdGhl
IHR5cGUgb2Ygc2luayBkZXRlY3RlZCwgd2Ugc2hvdWxkIGV4cG9zZSBEUCBvciBIRE1JIGNvbG9y
c3BhY2VzIHRvIHVzZXJzcGFjZS4KPgo+IEZvciBpOTE1IERQIGNvbm5lY3RvciBhbHdheXMgZHJp
dmVzIERQIG1vZGUsIEhETUkgY29ubmVjdG9yIGFsd2F5cyBkcml2ZXMKPiBIRE1JIG1vZGUsIGV2
ZW4gd2hlbiB0aGUgcGh5c2ljYWwgY29ubmVjdG9yIGlzIERQKysuCgpSaWdodCwgaTkxNSBjcmVh
dGVzIDIgY29ubmVjdG9ycywgd2hpbGUgbm91dmVhdSwgcmFkZW9uLCBhbmQgYW1kZ3B1CmNyZWF0
ZSAxIGNvbm5lY3RvciAobm90IHN1cmUgYWJvdXQgb3RoZXIgZHJpdmVycykgZm9yIGEgc2luZ2xl
CnBoeXNpY2FsIERQKysgc29ja2V0LiBTaW5jZSB3ZSBzdXBwbHkgdGhlIGxpc3Qgb2YgdmFsaWQg
dmFsdWVzIGF0IHRoZQp0aW1lIG9mIGNyZWF0aW5nIHRoZSBjb25uZWN0b3IsIHdlIGNhbid0IGtu
b3cgYXQgdGhhdCBwb2ludCB3aGV0aGVyIGluCnRoZSBmdXR1cmUgYSBIRE1JIG9yIERQIHdpbGwg
YmUgcGx1Z2dlZCBpbnRvIGl0LgoKICAtaWxpYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
