Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8361F20A86
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 16:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8728912A;
	Thu, 16 May 2019 14:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92DE8912A;
 Thu, 16 May 2019 14:58:29 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id s19so3710148otq.5;
 Thu, 16 May 2019 07:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TAXmI7ViLmDBzBy7WEsJO+IrrN0Omh7qQ2SpFzX3/qs=;
 b=X9OX+A5t5odreZKWrSTPwZEXDRIPFSxwk/7BTq0vgek8tPz1OaPSwclK96BavCTYIF
 aG0VGxmp+9w6KJnNnQlpKR/wieMPwktDOseA/ChPXRevU3i0gYS3wRjrgo86ket0oR4m
 MTYQ5oQPf8Mot1iN0AkxHzhL+CURKlmJEKu7XKmJrqSPpAHjusuT92MBxDki4j6SnS/o
 tAUGxENJAJQuxNaz0BkDd1liyD4iWiKfvpGYB3MXqpHIVBLJfborf96bL6K/v1FIXnK7
 IQc2OddWus2LMk6RT71DtbIH4UHUXBJokqThGSx+sYsRUhnEYRGNM9oEZQc4bQgZYU8H
 IqQw==
X-Gm-Message-State: APjAAAU0WJHF1u+3py4v6jfktsQQIVaV4rf4xzs4dJYxSxKj1RtdmuUN
 C5Hlf1zf0eXDabOS6HufDrY1y1efnCj8qGDwtmg=
X-Google-Smtp-Source: APXvYqznfGfE9F/rQ0XB6eKk1l3lCo+w+8PyryMdB3vQAgGRL1rSuYWgMuTu3eRCvNetuh1xbsXNohyC/nD7XFRpiLg=
X-Received: by 2002:a9d:754c:: with SMTP id b12mr22534otl.237.1558018709075;
 Thu, 16 May 2019 07:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <d81e8f55-9602-818e-0f9c-1d9d150133b1@intel.com>
 <CAOWid-ftUrVVWPu9KuS8xpWKNQT6_FtxB8gEyEAn9nLD6qxb5Q@mail.gmail.com>
 <20190516141015.GC374014@devbig004.ftw2.facebook.com>
In-Reply-To: <20190516141015.GC374014@devbig004.ftw2.facebook.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Thu, 16 May 2019 10:58:17 -0400
Message-ID: <CAOWid-fU7ScF7-+Ox-y2RHLeXVZmDOno=nLDf6HtToAPFwNNrQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm,
 cgroup: Add total GEM buffer allocation limit
To: Tejun Heo <tj@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TAXmI7ViLmDBzBy7WEsJO+IrrN0Omh7qQ2SpFzX3/qs=;
 b=piJeisUUwhQRZ4+x66kX29/b7KYSDS/xiEOhSVsuGfA88FR0gy17SWN8ZvKyzH/5OM
 W5NrghFtsMJjX+KJK8MbT7k/sKBwXA1Q86xf/hmuSistn2gp9iYvM+eFcv5Wv38A0V4o
 fQFOLhF6Z3J42Qw1knKNFsvMfWVeVbKVnXljL2RKu5QBVB8LjQNjNKJrCT5d7DfIcdqN
 Kpxv4r0XcOQX88YqCR5YckcRZmAX5wFWS0gZfybmpZBBK5xdYSUZXfruKByEolBgHy3w
 yT2tNvJNktVvuL3/j4/zLXDwBe+uXf0jYtuhE/5lC2qu7zhaDw33EN1uO6wVFNFDUUQc
 lUZw==
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
Cc: sunnanyong@huawei.com, Kenny Ho <Kenny.Ho@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTA6MTAgQU0gVGVqdW4gSGVvIDx0akBrZXJuZWwub3Jn
PiB3cm90ZToKPiBJIGhhdmVuJ3QgZ29uZSB0aHJvdWdoIHRoZSBwYXRjaHNldCB5ZXQgYnV0IHNv
bWUgcXVpY2sgY29tbWVudHMuCj4KPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAxMDoyOToyMVBN
IC0wNDAwLCBLZW5ueSBIbyB3cm90ZToKPiA+IEdpdmVuIHRoaXMgY29udHJvbGxlciBpcyBzcGVj
aWZpYyB0byB0aGUgZHJtIGtlcm5lbCBzdWJzeXN0ZW0gd2hpY2gKPiA+IHVzZXMgbWlub3IgdG8g
aWRlbnRpZnkgZHJtIGRldmljZSwgSSBkb24ndCBzZWUgYSBuZWVkIHRvIGNvbXBsaWNhdGUKPiA+
IHRoZSBpbnRlcmZhY2VzIG1vcmUgYnkgaGF2aW5nIG1ham9yIGFuZCBhIGtleS4gIEFzIHlvdSBj
YW4gc2VlIGluIHRoZQo+ID4gZXhhbXBsZXMgYmVsb3csIHRoZSBkcm0gZGV2aWNlIG1pbm9yIGNv
cnJlc3BvbmRzIHRvIHRoZSBsaW5lIG51bWJlci4KPiA+IEkgYW0gbm90IHN1cmUgaG93IHN0cmlj
dCBjZ3JvdXAgdXBzdHJlYW0gaXMgYWJvdXQgdGhlIGNvbnZlbnRpb24gYnV0IEkKPgo+IFdlJ3Jl
IHByZXR0eSBzdHJpY3QuCj4KPiA+IGFtIGhvcGluZyB0aGVyZSBhcmUgZmxleGliaWxpdHkgaGVy
ZSB0byBhbGxvdyBmb3Igd2hhdCBJIGhhdmUKPiA+IGltcGxlbWVudGVkLiAgVGhlcmUgYXJlIGEg
Y291cGxlIG9mIG90aGVyIHRoaW5ncyBJIGhhdmUgZG9uZSB0aGF0IGlzCj4KPiBTbywgcGxlYXNl
IGZvbGxvdyB0aGUgaW50ZXJmYWNlIGNvbnZlbnRpb25zLiAgV2UgY2FuIGRlZmluaXRlbHkgYWRk
Cj4gbmV3IG9uZXMgYnV0IHRoYXQgd291bGQgbmVlZCBmdW5jdGlvbmFsIHJlYXNvbnMuCj4KPiA+
IG5vdCBkZXNjcmliZWQgaW4gdGhlIGNvbnZlbnRpb246IDEpIGluY2x1c2lvbiBvZiByZWFkLW9u
bHkgKi5oZWxwIGZpbGUKPiA+IGF0IHRoZSByb290IGNncm91cCwgMikgdXNlIHJlYWQtb25seSAo
d2hpY2ggSSBjYW4gcG90ZW50aWFsbHkgbWFrZSBydykKPiA+ICouZGVmYXVsdCBmaWxlIGluc3Rl
YWQgb2YgaGF2aW5nIGEgZGVmYXVsdCBlbnRyaWVzIChzaW5jZSB0aGUgZGVmYXVsdAo+ID4gY2Fu
IGJlIGRpZmZlcmVudCBmb3IgZGlmZmVyZW50IGRldmljZXMpIGluc2lkZSB0aGUgY29udHJvbCBm
aWxlcyAodGhpcwo+ID4gd2F5LCB0aGUgcmVzZXR0aW5nIG9mIGNncm91cCB2YWx1ZXMgZm9yIGFs
bCB0aGUgZHJtIGRldmljZXMsIGNhbiBiZQo+ID4gZG9uZSBieSBhIHNpbXBsZSAnY3AnLikKPgo+
IEFnYWluLCBwbGVhc2UgZm9sbG93IHRoZSBleGlzdGluZyBjb252ZW50aW9ucy4gIFRoZXJlJ3Mg
YSBsb3QgbW9yZQo+IGhhcm0gdGhhbiBnb29kIGluIGV2ZXJ5IGNvbnRyb2xsZXIgYmVpbmcgY3Jl
YXRpdmUgaW4gdGhlaXIgb3duIHdheS4KPiBJdCdzIHRyaXZpYWwgdG8gYnVpbGQgY29udmVuaWVu
Y2UgZmVhdHVyZXMgaW4gdXNlcnNwYWNlLiAgUGxlYXNlIGRvIGl0Cj4gdGhlcmUuCkkgY2FuIGNl
cnRhaW5seSByZW1vdmUgdGhlIHJvICouaGVscCBmaWxlIGFuZCBsZWF2ZSB0aGUgZG9jdW1lbnRh
dGlvbgp0byBEb2N1bWVudGF0aW9uLywgYnV0IGZvciB0aGUgKi5kZWZhdWx0IEkgZG8gaGF2ZSBh
IGZ1bmN0aW9uYWwgcmVhc29uCnRvIGl0LiAgQXMgZmFyIGFzIEkgY2FuIHRlbGwgZnJvbSB0aGUg
Y29udmVudGlvbiwgdGhlIGRlZmF1bHQgaXMgcGVyCmNncm91cCBhbmQgdGhlcmUgaXMgbm8gd2F5
IHRvIGRlc2NyaWJlIHBlciBkZXZpY2UgZGVmYXVsdC4gIEFsdGhvdWdoLApwZXJoYXBzIHdlIGFy
ZSB0YWxraW5nIGFib3V0IHR3byBkaWZmZXJlbnQga2luZHMgb2YgZGVmYXVsdHMuICBBbnl3YXks
CkkgY2FuIGxlYXZlIHRoZSBkaXNjdXNzaW9uIHRvIGEgbW9yZSBkZXRhaWxlZCByZXZpZXcuCgpS
ZWdhcmRzLApLZW5ueQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
