Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A3058A1E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 20:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD6C6E3FE;
	Thu, 27 Jun 2019 18:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641A16E3FE;
 Thu, 27 Jun 2019 18:42:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z23so6643417wma.4;
 Thu, 27 Jun 2019 11:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zJpPVll8AeA53RzbA9bthek/cTS84PNHogBiBCIRPms=;
 b=CGxRWOGv3LM69FjD/w5DznPloLSbA8pqYSK608AOcbfA0WghXM5uFwWy+8pIODUaJj
 AlUlr/za5C+1MGojCE7EuSyr1qEZ8R9rUqSAUAqKRQH8R9V6iakP98dXletHzwQqW7L9
 jOW52Zb+O9flvpUNZjfufUUN6VVM2ZEGufPmejGVywjytBeSJ4GwVZOhNtbX+oLPsOTd
 WgPGgepJX6TMSSqaAnF6aXHtdw/3ctwmhucTO4ZqZbQQueueun/BSlVfI5CB5dWbStfk
 AY+pGsAxeKL5+ncd/wN0DMsFiHB7/nTfxZfLz0ebBH83qhABzh0ZLJGAf/ecb/8Nsh0S
 6V1Q==
X-Gm-Message-State: APjAAAUs5R1LzERHILg4j6HSuk+Itq3RgbVmqgC/EYis8eGJRq2040TN
 smRp/7zS1YAroI4mwoFaCV+GC3XXRobRELeXHPM=
X-Google-Smtp-Source: APXvYqxgdheUrE2X+cNTl4Kxcd54xMoZiWuD3Gq3vM05teW0J5JiLNdb7Gu0G439xUVtbFCWSfKw8fSucM2Q7f3z/eQ=
X-Received: by 2002:a7b:c356:: with SMTP id l22mr4183486wmj.97.1561660974801; 
 Thu, 27 Jun 2019 11:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-5-Kenny.Ho@amd.com>
 <20190626160553.GR12905@phenom.ffwll.local>
 <CAOWid-eurCMx1F7ciUwx0e+p=s=NP8=UxQUhhF-hdK-iAna+fA@mail.gmail.com>
 <20190626214113.GA12905@phenom.ffwll.local>
 <CAOWid-egYGijS0a6uuG4mPUmOWaPwF-EKokR=LFNJ=5M+akVZw@mail.gmail.com>
 <20190627054320.GB12905@phenom.ffwll.local>
In-Reply-To: <20190627054320.GB12905@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Thu, 27 Jun 2019 14:42:43 -0400
Message-ID: <CAOWid-cT4TQ7HGzcSWjmLGjAW_D1hRrkNguEiV8N+baNiKQm_A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 04/11] drm,
 cgroup: Add total GEM buffer allocation limit
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zJpPVll8AeA53RzbA9bthek/cTS84PNHogBiBCIRPms=;
 b=jiPD44QWifbSTAoFhvoO7EEvQqyxTHlknQO97q8/HR9uCLC7fEifhfdXVermJbY4A5
 JzT7urvC+mZbb5Fe5Z7gBuOMttYKl/E6PaN+nzpy6zJSFdpd0tHN6Qno/QbiWxh+/8mh
 axSsAPMjtP23H8W9st/uvDglGavW99bf0ZipXALDTEZXazUvs++gJo2F6ZEhi/KmiQNi
 A/ZQ6VMyXl9mYeaeL/HXJlrVSd0hDeuV+un/lT+K6E3H18WdLj0Vau/jU5DY+KE7L+MM
 k4FY7izYcpcduX7SHzmQAx07GG1RFFxm2uMDCCvI1ctYa4g6EaPH66zylH/J3Cx9nM7Y
 nwbw==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, joseph.greathouse@amd.com,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTo0MyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDY6NDE6MzJQTSAtMDQw
MCwgS2VubnkgSG8gd3JvdGU6Cj4gPiBTbyB3aXRob3V0IHRoZSBzaGFyaW5nIHJlc3RyaWN0aW9u
IGFuZCBzb21lIGtpbmQgb2Ygb3duZXJzaGlwCj4gPiBzdHJ1Y3R1cmUsIHdlIHdpbGwgaGF2ZSB0
byBtaWdyYXRlL2NoYW5nZSB0aGUgb3duZXIgb2YgdGhlIGJ1ZmZlciB3aGVuCj4gPiB0aGUgY2dy
b3VwIHRoYXQgY3JlYXRlZCB0aGUgYnVmZmVyIGRpZSBiZWZvcmUgdGhlIHJlY2VpdmluZyBjZ3Jv
dXAocykKPiA+IGFuZCBJIGFtIG5vdCBzdXJlIGhvdyB0byBkbyB0aGF0IHByb3Blcmx5IGF0IHRo
ZSBtb21lbnQuICAxKSBTaG91bGQKPiA+IGVhY2ggY2dyb3VwIGtlZXAgdHJhY2sgb2YgYWxsIHRo
ZSBidWZmZXJzIHRoYXQgYmVsb25ncyB0byBpdCBhbmQKPiA+IG1pZ3JhdGU/ICAoSXMgdGhhdCBl
ZmZpY2llbnQ/KSAgMikgd2hpY2ggY2dyb3VwIHNob3VsZCBiZSB0aGUgbmV3Cj4gPiBvd25lciAo
YW5kIHRoZXJlZm9yZSBoYXZlIHRoZSBsaW1pdCBhcHBsaWVkPykgIEhhdmluZyB0aGUgY3JlYXRv
cgo+ID4gYmVpbmcgdGhlIG93bmVyIGlzIGtpbmQgb2YgbmF0dXJhbCwgYnV0IGxldCBzYXkgdGhl
IGJ1ZmZlciBpcyBzaGFyZWQKPiA+IHdpdGggNSBvdGhlciBjZ3JvdXBzLCB3aGljaCBvZiB0aGVz
ZSA1IGNncm91cHMgc2hvdWxkIGJlIHRoZSBuZXcgb3duZXIKPiA+IG9mIHRoZSBidWZmZXI/Cj4K
PiBEaWZmZXJlbnQgYW5zd2VyczoKPgo+IC0gRG8gd2UgY2FyZSBpZiB3ZSBsZWFrIGJvcyBsaWtl
IHRoaXMgaW4gYSBjZ3JvdXAsIGlmIHRoZSBjZ3JvdXAKPiAgIGRpc2FwcGVhcnMgYmVmb3JlIGFs
bCB0aGUgYm8gYXJlIGNsZWFuZWQgdXA/Cj4KPiAtIEp1c3QgY2hhcmdlIHRoZSBibyB0byBlYWNo
IGNncm91cCBpdCdzIGluPyBXaWxsIGJlIHF1aXRlIGEgYml0IG1vcmUKPiAgIHRyYWNraW5nIG5l
ZWRlZCB0byBnZXQgdGhhdCBkb25lIC4uLgpUaGF0IHNlZW1zIHRvIGJlIHRoZSBhcHByb2FjaCBt
ZW1jZyB0YWtlcywgYnV0IGFzIHNob3duIGJ5IHRoZSBsd24KbGluayB5b3Ugc2VudCBtZSBmcm9t
IHRoZSBsYXN0IHJmYyAodGFsayBmcm9tIFJvbWFuIEd1c2hjaGluKSwgdGhhdAphcHByb2FjaCBp
cyBub3QgcHJvYmxlbSBmcmVlIGVpdGhlci4gIEFuZCB3b3VsZG4ndCB0aGlzIGFwcHJvYWNoCmRp
c2Nvbm5lY3QgcmVzb3VyY2UgbWFuYWdlbWVudCBmcm9tIHRoZSB1bmRlcmx5aW5nIHJlc291cmNl
IG9uZSB3b3VsZApsaWtlIHRvIGNvbnRyb2w/ICBGb3IgZXhhbXBsZSwgaWYgeW91IGhhdmUgNSBN
QiBvZiBtZW1vcnksIHlvdSBjYW4KaGF2ZSA1IHVzZXJzIHVzaW5nIDEgTUIgZWFjaC4gIEJ1dCBp
biB0aGUgY2hhcmdlLWV2ZXJ5Ym9keSBhcHByb2FjaCwgYQoxIE1CIHVzYWdlIHNoYXJlZCA0IHRp
bWVzIHdpbGwgbWFrZSBpdCBsb29rcyBsaWtlIDVNQiBpcyB1c2VkLiAgU28gdGhlCnJlc291cmNl
IGJlaW5nIGNvbnRyb2wgaXMgbm8gbG9uZ2VyICdyZWFsJyBzaW5jZSB0aGUgYW1vdW50IG9mCnJl
c291cmNlIHlvdSBoYXZlIGlzIG5vdyBkeW5hbWljIGFuZCBkZXBlbmRzIG9uIHRoZSBhbW91bnQg
b2Ygc2hhcmluZwpvbmUgZG9lcy4KCj4gLSBBbHNvLCB0aGVyZSdzIHRoZSBsZWdhY3kgd2F5IG9m
IHNoYXJpbmcgYSBibywgd2l0aCB0aGUgRkxJTksgYW5kCj4gICBHRU1fT1BFTiBpb2N0bHMuIFdl
IG5lZWQgdG8gcGx1ZyB0aGVzZSBob2xlcyB0b28uCj4KPiBKdXN0IGZlZWxzIGxpa2UgeW91ciBj
dXJyZW50IHNvbHV0aW9uIGlzIHRlY2huaWNhbGx5IHdlbGwtanVzdGlmaWVkLCBidXQKPiBpdCBj
b21wbGV0ZWx5IGRlZmVhdHMgdGhlIHBvaW50IG9mIGNncm91cHMvY29udGFpbmVycyBhbmQgYnVm
ZmVyIHNoYXJpbmcKPiAuLi4KVW0uLi4gSSBhbSBnb2luZyB0byBnZXQgYSBiaXQgcGhpbG9zb3Bo
aWNhbCBoZXJlIGFuZCBzdWdnZXN0IHRoYXQgdGhlCmlkZWEgb2Ygc2hhcmluZyAoZXNwZWNpYWxs
eSB1bmNvbnRyb2xsZWQgc2hhcmluZykgaXMgaW5oZXJlbnRseSBhdCBvZGQKd2l0aCBjb250YWlu
bWVudC4gIEl0J3MgbGlrZSwgaWYgZXZlcnlib2R5IGlzIHNwZWNpYWwsIG5vIG9uZSBpcwpzcGVj
aWFsLiAgUGVyaGFwcyBhbiBhbHRlcm5hdGl2ZSBpcyB0byBtYWtlIHRoaXMgY29uZmlndXJhYmxl
IHNvIHRoYXQKcGVvcGxlIGNhbiBhbGxvdyBzaGFyaW5nIGtub3dpbmcgdGhlIGNhdmVhdD8gIEFu
ZCBqdXN0IHRvIGJlIGNsZWFyLAp0aGUgY3VycmVudCBzb2x1dGlvbiBhbGxvd3MgZm9yIHNoYXJp
bmcsIGV2ZW4gYmV0d2VlbiBjZ3JvdXAuCgpSZWdhcmRzLApLZW5ueQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
