Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61005180EA9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 04:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A213A89F97;
	Wed, 11 Mar 2020 03:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F89F89F97
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 03:43:35 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id n18so1113555edw.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 20:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CCpVdCL5A6Oia90+I5IH75I8Yb81GbOHYhkCg0SoRo4=;
 b=nJ8/+eXQLL14Bq3hAfEKaNkcuE0LJoTv4/4MeEEXgzMp4KLSx9aY7HnJZ9UhVp3W9Y
 fXxkd5cNxriEVWhu7CxUFZ/Wk0e50qIqXnTH6Ri9UJZf9mPscvZif0BVieasPbLbv5kb
 GQmVIMXbKASfnhROqiBIDAe48wIKVspe9m4dDZnvUuNZ9UaPD8GcRDiL3X0ldOcZ+pnI
 k2gVgpXexZUSH7fKQ3eFnG3kD3wsPIhFOiRjGQo1kylrAqUGMYwz1s6/jMMNH/ytSVv8
 KQeML8Q5Nqh30BBdkcpyaonvrG4g9J2RN2B//RrG0wjhlVWCt5pZSIHQzypaJKqJS2g5
 rV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CCpVdCL5A6Oia90+I5IH75I8Yb81GbOHYhkCg0SoRo4=;
 b=gOmsziiMl3JPG/1gGlhGWM2ElMks4quo8axI7LU4kMTDP2WNKKep2E2l6DTL7GOATO
 JFRl7Np3W64Pdb0YYUpQxuhuKgSEonWvK8rMFFVhtwB5/kRmuQ2XHCJs9zMhSa7pUKld
 GNBvUPnTkTgv7bbmMPgcDbDA12hfsBhVSH2Mz9NDqSdwiIsGbAibT4CxpGu4eZPKNgFM
 s+IPBk1jFi8JuKlj5gUfcKLGuePtvCAGaFNLrQtk+6Xfdfyqs5J5x1xNlDBWZCDVitp8
 y8qdk+T6zvvTcH3l1NVEi/VDf2oGxb06sDt0TkkRXIium7DXdHUwggRzknxiKFN10VrX
 M8aw==
X-Gm-Message-State: ANhLgQ3jEGK4Oz4sRyXZRty7hnFSPIgpqQPIHQEP5og/vR7296LtkY+4
 9DBFWQc6iXhgwjOZf4Hce3QsIHpOtAfEaEWluwdeGA==
X-Google-Smtp-Source: ADFU+vvpVyJEYOHSvxTt0jv9faPw/cY00LFVDFiLuvXyfzEgv30x/D/c6hrhc0XXqk7qHc23+OeLh0RzP5ZxEyP2RYI=
X-Received: by 2002:a50:f38e:: with SMTP id g14mr958779edm.168.1583898213971; 
 Tue, 10 Mar 2020 20:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200225235856.975366-1-jason@jlekstrand.net>
 <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
 <20200226100523.GQ2363188@phenom.ffwll.local>
 <CAOFGe94O66HL212aXqhi9tdYqw---Xm-fwNSV4pxHyPmpSGpbg@mail.gmail.com>
 <CAP+8YyEUz29fXDW5kO_0ZG6c849=TuFWCK8ynT3LuM+Tn+rMzw@mail.gmail.com>
 <810a26e7-4294-a615-b7ee-18148ac70641@amd.com>
 <CAOFGe96namyeQXTvdrduM+=wkJuoWWx34CxcsJHS3fcCaKDadw@mail.gmail.com>
 <21aeacc0-f3ae-c5dd-66df-4d2f3d73f73e@amd.com>
 <CAOFGe95Gx=kX=sxwhx1FYmXQuPtGAKwt2V5YodQBwJXujE3WwA@mail.gmail.com>
 <CAOFGe97XSxgzCViOH=2+B2_d5P3vGifKmvAw-JrzRQbbRMRbcg@mail.gmail.com>
 <6fb8becf-9e6b-f59e-9c22-2b20069241a7@amd.com>
 <CAOFGe94gv9N+6n6oEC2aRtsmy7kBfx1D_R6WLQSGq7-8yUM_OQ@mail.gmail.com>
 <203505dc-7b75-1135-587e-cc6e88ade8cd@amd.com>
In-Reply-To: <203505dc-7b75-1135-587e-cc6e88ade8cd@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 10 Mar 2020 22:43:22 -0500
Message-ID: <CAOFGe94DnZcTb51TE3kFYxMgLkEWdNg2Yz3f4BEWNXz4GTOs7Q@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync
 files
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Chenbo Feng <fengc@google.com>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@google.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Jesse Hall <jessehall@google.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgOSwgMjAyMCBhdCAxMToyMSBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDUuMDMuMjAgdW0gMTY6NTQgc2Nocmll
YiBKYXNvbiBFa3N0cmFuZDoKPiA+IE9uIFRodSwgTWFyIDUsIDIwMjAgYXQgNzowNiBBTSBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4+IFtTTklQ
XQo+ID4+IFdlbGwgYXMgZmFyIGFzIEkgY2FuIHNlZSB0aGlzIHdvbid0IHdvcmsgYmVjYXVzZSBp
dCB3b3VsZCBicmVhayB0aGUKPiA+PiBzZW1hbnRpY3Mgb2YgdGhlIHRpbWVsaW5lIHN5bmMuCj4g
PiBJJ20gbm90IDEwMCUgY29udmluY2VkIGl0IGhhcyB0by4gIFdlIGFscmVhZHkgaGF2ZSBzdXBw
b3J0IGZvciB0aGUKPiA+IHNlcW5vIHJlZ3Jlc3NpbmcgYW5kIHdlIGVuc3VyZSB0aGF0IHdlIHN0
aWxsIHdhaXQgZm9yIGFsbCB0aGUgZmVuY2VzLgo+ID4gSSB0aG91Z2h0IG1heWJlIHdlIGNvdWxk
IHVzZSB0aGF0IGJ1dCBJIGhhdmVuJ3Qgc3BlbnQgZW5vdWdoIHRpbWUKPiA+IGxvb2tpbmcgYXQg
dGhlIGRldGFpbHMgdG8gYmUgc3VyZS4gIEkgbWF5IGJlIG1pc3Npbmcgc29tZXRoaW5nLgo+Cj4g
VGhhdCB3b24ndCB3b3JrLiBUaGUgc2Vxbm8gcmVncmVzc2lvbiB3b3JrcyBieSBwdW5pc2hpbmcg
dXNlcnNwYWNlIGZvcgo+IGRvaW5nIHNvbWV0aGluZyBzdHVwaWQgYW5kIHVuZGVmaW5lZC4KPgo+
IEJlIHdlIGNhbid0IGRvIHRoYXQgdW5kZXIgbm9ybWFsIGNpcmN1bXN0YW5jZXMuCj4KPiA+PiBJ
IGNhbiBwcm90b3R5cGUgdGhhdCBpZiB5b3Ugd2FudCwgc2hvdWxkbid0IGJlIG1vcmUgdGhhbiBh
IGZldyBob3VycyBvZgo+ID4+IGhhY2tpbmcgYW55d2F5Lgo+ID4gSWYgeW91J2QgbGlrZSB0bywg
Z28gZm9yIGl0LiAgSSdkIGJlIGhhcHB5IHRvIGdpdmUgaXQgYSBnbyBhcyB3ZWxsIGJ1dAo+ID4g
aWYgeW91IGFscmVhZHkga25vdyB3aGF0IHlvdSB3YW50LCBpdCBtYXkgYmUgZWFzaWVyIGZvciB5
b3UgdG8ganVzdAo+ID4gd3JpdGUgdGhlIHBhdGNoIGZvciB0aGUgY3Vyc29yLgo+Cj4gU2VuZCB5
b3UgdHdvIHBhdGNoZXMgZm9yIHRoYXQgYSBmZXcgbWludXRlcyBhZ28uIEJ1dCBrZWVwIGluIG1p
bmQgdGhhdAo+IHRob3NlIGFyZSBjb21wbGV0ZWx5IHVudGVzdGVkLgoKTm8gd29ycmllcy4gIFRo
ZXkgd2VyZSBmdWxsIG9mIGJ1Z3MgYnV0IEkgdGhpbmsgSSd2ZSBnb3QgdGhlbSBzb3J0ZWQKb3V0
IG5vdy4gIFRoZSB2MidzIEknbSBhYm91dCB0byBzZW5kIHNlZW0gdG8gd29yay4gIEknbSBnb2lu
ZyB0byBsZWF2ZQphIFZ1bGthbiBkZW1vIHJ1bm5pbmcgYWxsIG5pZ2h0IGxvbmcganVzdCB0byBt
YWtlIHN1cmUgSSdtIG5vdCBsZWFraW5nCm1lbW9yeSBsaWtlIG1hZC4KCi0tSmFzb24KCj4gPiBU
d28gbW9yZSBxdWVzdGlvbnM6Cj4gPgo+ID4gICAxLiBEbyB5b3Ugd2FudCB0aGlzIGNvbGxhcHNp
bmcgdG8gaGFwcGVuIGV2ZXJ5IHRpbWUgd2UgY3JlYXRlIGEKPiA+IGRtYV9mZW5jZV9hcnJheSBv
ciBzaG91bGQgaXQgYmUgYSBzcGVjaWFsIGVudHJ5cG9pbnQ/ICBDb2xsYXBzaW5nIGFsbAo+ID4g
dGhlIHRpbWUgbGlrZWx5IG1lYW5zIGRvaW5nIGV4dHJhIGFycmF5IGNhbGN1bGF0aW9ucyBpbnN0
ZWFkIG9mIHRoZQo+ID4gZG1hX2ZlbmNlX2FycmF5IHRha2luZyBvd25lcnNoaXAgb2YgdGhlIGFy
cmF5IHRoYXQncyBwYXNzZWQgaW4uICBNeQo+ID4gZ3V0IHNheXMgdGhhdCBjb3N0IGlzIG9rOyBi
dXQgbXkgZ3V0IGRvZXNuJ3Qgc3BlbmQgbXVjaCB0aW1lIGluIGtlcm5lbAo+ID4gc3BhY2UuCj4K
PiBJbiBteSBwcm90b3R5cGUgaW1wbGVtZW50YXRpb24gdGhhdCBpcyBhIGRtYV9yZXN2IGZ1bmN0
aW9uIHlvdSBjYWxsIGFuZAo+IGdldCBlaXRoZXIgYSBzaW5nbGUgZmVuY2Ugb3IgYSBkbWFfZmVu
Y2VfYXJyYXkgd2l0aCB0aGUgY29sbGFwc2VkIGZlbmNlcwo+IGluIHJldHVybi4KPgo+IEJ1dCBJ
IHdvdWxkbid0IGFkZCB0aGF0IHRvIHRoZSBnZW5lcmFsIGRtYV9mZW5jZV9hcnJheV9pbml0IGZ1
bmN0aW9uCj4gc2luY2UgdGhpcyBpcyBzdGlsbCBhIHJhdGhlciBzcGVjaWFsIGNhc2UuIFdlbGwg
c2VlIHRoZSBwYXRjaGVzLCB0aGV5Cj4gc2hvdWxkIGJlIHByZXR0eSBzZWxmIGV4cGxhaW5pbmcu
Cj4KPiA+ICAgMi4gV2hlbiB3ZSBkbyB0aGUgY29sbGFwc2luZywgc2hvdWxkIHdlIGNhbGwgZG1h
X2ZlbmNlX2lzX3NpZ25hbGVkKCkKPiA+IHRvIGF2b2lkIGFkZGluZyBzaWduYWxlZCBmZW5jZXMg
dG8gdGhlIGFycmF5PyAgSXQgc2VlbXMgbGlrZSBhdm9pZGluZwo+ID4gYWRkaW5nIHJlZmVyZW5j
ZXMgdG8gZmVuY2VzIHRoYXQgYXJlIGFscmVhZHkgc2lnbmFsZWQgd291bGQgbGV0IHRoZQo+ID4g
a2VybmVsIGNsZWFuIHRoZW0gdXAgZmFzdGVyIGFuZCByZWR1Y2UgdGhlIGxpa2VsaWhvb2QgdGhh
dCBhIGZlbmNlCj4gPiB3aWxsIGhhbmcgYXJvdW5kIGZvcmV2ZXIgYmVjYXVzZSBpdCBrZWVwcyBn
ZXR0aW5nIGFkZGVkIHRvIGFycmF5cyB3aXRoCj4gPiBvdGhlciB1bnNpZ25hbGVkIGZlbmNlcy4K
Pgo+IEkgdGhpbmsgc28uIENhbid0IHRoaW5rIG9mIGEgZ29vZCByZWFzb24gd2h5IHdlIHdvdWxk
IHdhbnQgdG8gYWRkCj4gYWxyZWFkeSBzaWduYWxlZCBmZW5jZXMgdG8gdGhlIGFycmF5Lgo+Cj4g
Q2hyaXN0aWFuLgo+Cj4gPgo+ID4gLS1KYXNvbgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
