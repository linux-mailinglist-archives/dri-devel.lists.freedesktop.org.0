Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA12218A34
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 16:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB796E149;
	Wed,  8 Jul 2020 14:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2C36E149
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 14:34:12 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q15so3467064wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 07:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QIeEl2eUxfszxmiPFIuGD5Z7T/8od5TwILRWsxV6oDw=;
 b=D3k2+ayC8VxqEYL1HrSW40E1N+qNuiMUY6cpnLe0dF0FZC2dy2C/oAoOyhu0IY8U/M
 7lT+G0XEhuHiB7+yMt3IuTxIavaZgEV0NRz3XoUmlg11LMwpAXm9shRkGbFuynrw2LqV
 KOZYPabA5hbk1kCFCyFbX5nas9F6ggOoS2BGR/ppoJr/8aT1u9hl9d87bYzW4WJ61F6l
 9sf7jNqqoki3HIj/Gj/J3KVgv0m6QdQZsE3lRRM0qn5fDoECPh0lpF9gUAOMHe/0v2kW
 FGZQYoaXFPhdjFvG08OhpH6ohs+AI6iHO+Lw1mUPsnKuCTVG7rcwXMXAGFI6t3p2C3IN
 /jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QIeEl2eUxfszxmiPFIuGD5Z7T/8od5TwILRWsxV6oDw=;
 b=g326uip3MTxCwsMkGUCCWPsHOLjIGozmAPKdybvlZ596NX8+gBk0TOZBWyUdOe8JPF
 PEA3/HR1V6pA4IkPmxsXVjXuoDnQsIBDAH5Sl6gbwhWr83IxGAVj7ELXNStrxo8rxcpP
 55/+FMnRq52JZKhADHPdYerSnHiTNU3QPPQPcZYJjstskw6dk4ohI9Zn/MkepDC55uZO
 lBowNyv/GIqBY3Nx5vuzq0RpqKP0Xp3F7VjJ1Q75U1bwC2HFGN7rZOl5oHgTKTvNgvsJ
 MvLsN2AvoSIRJZwtzzrY4anboeV+6jp9m4qslgq4ov5n/XoKq2ys9HJZkpMhlXORoAzy
 eWxg==
X-Gm-Message-State: AOAM533UkiW3WpTuVIIjGSxa2o5O1ZT5lm7U5h8PmL++MrhADuoTnW8Z
 t6BHnqtVb3/L5nZg3zO36oKHOkRnKdWEb1xvkQk=
X-Google-Smtp-Source: ABdhPJySvtmMxy3zK1ibJGzz7ZbxiOXP6zO/iVxoJvHu/4CXPn/v5Lt4tYYHr63RNiUnCIGV8rRvhlDYyODHpr9jfbc=
X-Received: by 2002:a1c:de07:: with SMTP id v7mr9743311wmg.56.1594218850894;
 Wed, 08 Jul 2020 07:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200702131000.GW3278063@phenom.ffwll.local>
 <20200702132953.GS25301@ziepe.ca>
 <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
 <20200702181540.GC3278063@phenom.ffwll.local>
 <20200703120335.GT25301@ziepe.ca>
 <CAKMK7uGqABchpPLTm=vmabkwK3JJSzWTFWhfU+ywbwjw-HgSzw@mail.gmail.com>
 <20200703131445.GU25301@ziepe.ca>
 <f2ec5c61-a553-39b5-29e1-568dae9ca2cd@amd.com>
 <MW3PR11MB45553DB31AD67C8B870A345FE5660@MW3PR11MB4555.namprd11.prod.outlook.com>
 <d28286c7-b1c1-a4a8-1d38-264ed1761cdd@amd.com>
 <20200708094934.GI3278063@phenom.ffwll.local>
 <14659513-8164-dcae-e4f9-f0a199aee542@amd.com>
In-Reply-To: <14659513-8164-dcae-e4f9-f0a199aee542@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Jul 2020 10:33:58 -0400
Message-ID: <CADnq5_PGszgU=h2UdL1nRFnyLaBEk7pgxQkNS8otwK-SF22Qrw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "Xiong, Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgOCwgMjAyMCBhdCAxMDoyMCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDguMDcuMjAgdW0gMTE6NDkgc2Nocmll
YiBEYW5pZWwgVmV0dGVyOgo+ID4gT24gV2VkLCBKdWwgMDgsIDIwMjAgYXQgMTE6Mzg6MzFBTSAr
MDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+PiBBbSAwNy4wNy4yMCB1bSAyMzo1OCBz
Y2hyaWViIFhpb25nLCBKaWFueGluOgo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0K
PiA+Pj4+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PiA+Pj4+IEFtIDAzLjA3LjIwIHVtIDE1OjE0IHNjaHJpZWIgSmFzb24gR3VudGhvcnBlOgo+ID4+
Pj4+IE9uIEZyaSwgSnVsIDAzLCAyMDIwIGF0IDAyOjUyOjAzUE0gKzAyMDAsIERhbmllbCBWZXR0
ZXIgd3JvdGU6Cj4gPj4+Pj4KPiA+Pj4+Pj4gU28gbWF5YmUgSSdtIGp1c3QgdG90YWxseSBjb25m
dXNlZCBhYm91dCB0aGUgcmRtYSBtb2RlbC4gSSB0aG91Z2h0Ogo+ID4+Pj4+PiAtIHlvdSBiaW5k
IGEgcGlsZSBvZiBtZW1vcnkgZm9yIHZhcmlvdXMgdHJhbnNhY3Rpb25zLCB0aGF0IG1pZ2h0Cj4g
Pj4+Pj4+IGhhcHBlbiB3aGVuZXZlci4gS2VybmVsIGRyaXZlciBkb2Vzbid0IGhhdmUgbXVjaCBp
ZiBhbnkgaW5zaWdodCBpbnRvCj4gPj4+Pj4+IHdoZW4gbWVtb3J5IGlzbid0IG5lZWRlZCBhbnlt
b3JlLiBJIHRoaW5rIGluIHRoZSByZG1hIHdvcmxkIHRoYXQncwo+ID4+Pj4+PiBjYWxsZWQgcmVn
aXN0ZXJpbmcgbWVtb3J5LCBidXQgbm90IHN1cmUuCj4gPj4+Pj4gU3VyZSwgYnV0IG9uY2UgcmVn
aXN0ZXJlZCB0aGUgbWVtb3J5IGlzIGFibGUgdG8gYmUgdXNlZCBhdCBhbnkgbW9tZW50Cj4gPj4+
Pj4gd2l0aCBubyB2aXNpYmlsdHkgZnJvbSB0aGUga2VybmVsLgo+ID4+Pj4+Cj4gPj4+Pj4gVW5s
aWtlIEdQVSB0aGUgdHJhbnNhY3Rpb25zIHRoYXQgdHJpZ2dlciBtZW1vcnkgYWNjZXNzIGRvIG5v
dCBnbwo+ID4+Pj4+IHRocm91Z2ggdGhlIGtlcm5lbCAtIHNvIHRoZXJlIGlzIG5vIGFiaWxpdHkg
dG8gaW50ZXJydXB0IGEgY29tbWFuZAo+ID4+Pj4+IGZsb3cgYW5kIGZpZGRsZSB3aXRoIG1hcHBp
bmdzLgo+ID4+Pj4gVGhpcyBpcyB0aGUgc2FtZSBmb3IgR1BVcyB3aXRoIHVzZXIgc3BhY2UgcXVl
dWVzIGFzIHdlbGwuCj4gPj4+Pgo+ID4+Pj4gQnV0IHdlIGNhbiBzdGlsbCBzYXkgZm9yIGEgcHJv
Y2VzcyBpZiB0aGF0IHRoaXMgcHJvY2VzcyBpcyB1c2luZyBhIERNQS1idWYgd2hpY2ggaXMgbW92
ZWQgb3V0IGFuZCBzbyBjYW4ndCBydW4gYW55IG1vcmUgdW5sZXNzIHRoZSBETUEtYnVmIGlzCj4g
Pj4+PiBhY2Nlc3NpYmxlIGFnYWluLgo+ID4+Pj4KPiA+Pj4+IEluIG90aGVyIHdvcmRzIHlvdSBz
b21laG93IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGhhcmR3YXJlIGlzIG5vdCBhY2Nlc3Np
bmcgYSBwaWVjZSBvZiBtZW1vcnkgYW55IG1vcmUgd2hlbiB5b3Ugd2FudCB0byBtb3ZlIGl0Lgo+
ID4+Pj4KPiA+Pj4gV2hpbGUgYSBwcm9jZXNzIGNhbiBiZSBlYXNpbHkgc3VzcGVuZGVkLCB0aGVy
ZSBpcyBubyB3YXkgdG8gdGVsbCB0aGUgUkRNQSBOSUMgbm90IHRvIHByb2Nlc3MgcG9zdGVkIHdv
cmsgcmVxdWVzdHMgdGhhdCB1c2Ugc3BlY2lmaWMgbWVtb3J5IHJlZ2lvbnMgKG9yIHdpdGggYW55
IG90aGVyIGNvbmRpdGlvbnMpLgo+ID4+Pgo+ID4+PiBTbyBmYXIgaXQgYXBwZWFycyB0byBtZSB0
aGF0IERNQS1idWYgZHluYW1pYyBtYXBwaW5nIGZvciBSRE1BIGlzIG9ubHkgdmlhYmxlIHdpdGgg
T0RQIHN1cHBvcnQuIEZvciBOSUNzIHdpdGhvdXQgT0RQLCBhIHdheSB0byBhbGxvdyBwaW5uaW5n
IHRoZSBkZXZpY2UgbWVtb3J5IGlzIHN0aWxsIG5lZWRlZC4KPiA+PiBBbmQgdGhhdCdzIGV4YWN0
bHkgdGhlIHJlYXNvbiB3aHkgSSBpbnRyb2R1Y2VkIGV4cGxpY2l0IHBpbigpL3VucGluKCkKPiA+
PiBmdW5jdGlvbnMgaW50byB0aGUgRE1BLWJ1ZiBBUEk6Cj4gPj4gaHR0cHM6Ly9uYW0xMS5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZWxpeGlyLmJv
b3RsaW4uY29tJTJGbGludXglMkZsYXRlc3QlMkZzb3VyY2UlMkZkcml2ZXJzJTJGZG1hLWJ1ZiUy
RmRtYS1idWYuYyUyM0w4MTEmYW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBh
bWQuY29tJTdDNmQ3ODU4NjFhY2M1NDJhMmY1MzYwOGQ4MjMyNDNhN2MlN0MzZGQ4OTYxZmU0ODg0
ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3Mjk3OTg1NzkyMTM1MzExJmFtcDtzZGF0
YT1iQnJrRHlubEFDRTlEQUlsR250eFhoRTF1bnIlMkZCeHc1SVJUbTZBdFY2V1ElM0QmYW1wO3Jl
c2VydmVkPTAKPiA+Pgo+ID4+IEl0J3MganVzdCB0aGF0IGF0IGxlYXN0IG91ciBkZXZpY2VzIGRy
aXZlcnMgY3VycmVudGx5IHByZXZlbnQgUDJQIHdpdGgKPiA+PiBwaW5uZWQgRE1BLWJ1ZidzIGZv
ciB0d28gbWFpbiByZWFzb25zOgo+ID4+Cj4gPj4gYSkgVG8gcHJldmVudCBkZW55IG9mIHNlcnZp
Y2UgYXR0YWNrcyBiZWNhdXNlIFAyUCBCQVJzIGFyZSBhIHJhdGhlciByYXJlCj4gPj4gcmVzb3Vy
Y2UuCj4gPj4KPiA+PiBiKSBUbyBwcmV2ZW50IGZhaWx1cmVzIGluIGNvbmZpZ3VyYXRpb24gd2hl
cmUgUDJQIGlzIG5vdCBhbHdheXMgcG9zc2libGUKPiA+PiBiZXR3ZWVuIGFsbCBkZXZpY2VzIHdo
aWNoIHdhbnQgdG8gYWNjZXNzIGEgYnVmZmVyLgo+ID4gU28gdGhlIGFib3ZlIGlzIG1vcmUgb3Ig
bGVzcyB0aGUgcXVlc3Rpb24gaW4gdGhlIGNvdmVyIGxldHRlciAod2hpY2gKPiA+IGRpZG4ndCBt
YWtlIGl0IHRvIGRyaS1kZXZlbCkuIENhbiB3ZSBzb21laG93IHRocm93IHRoYXQgbGltaXRhdGlv
biBvdXQsIG9yCj4gPiBpcyB0aGF0IHNpbXBseSBub3QgYSBnb29kIGlkZWE/Cj4KPiBBdCBsZWFz
dCBmb3IgdGhlIEFNRCBncmFwaGljcyBkcml2ZXJzIHRoYXQncyBtb3N0IGNlcnRhaW4gbm90IGEg
Z29vZCBpZGVhLgo+Cj4gV2UgZG8gaGF2ZSBhbiB1c2UgY2FzZSB3aGVyZSBidWZmZXJzIG5lZWQg
dG8gYmUgaW4gc3lzdGVtIG1lbW9yeSBiZWNhdXNlCj4gUDJQIGRvZXNuJ3Qgd29yay4KPgo+IEFu
ZCBieSBwaW5uaW5nIHRoZW0gdG8gVlJBTSB5b3UgY2FuIGNyZWF0ZSBhIHJlYWxseSBuaWNlIGRl
bnkgb2Ygc2VydmljZQo+IGF0dGFjayBhZ2FpbnN0IHRoZSBYIHN5c3RlbS4KPgoKT24gdGhlIG90
aGVyIGhhbmQsIG9uIG1vZGVybiBwbGF0Zm9ybXMgd2l0aCBsYXJnZSBvciByZXNpemFibGUgQkFS
cywKeW91IG1heSBlbmQgdXAgd2l0aCBzeXN0ZW1zIHdpdGggbW9yZSB2cmFtIHRoYW4gc3lzdGVt
IHJhbS4KCkFsZXgKCgo+ID4gU2ltcGx5IG1vdmluZyBidWZmZXJzIHRvIHN5c3RlbSBtZW1vcnkg
d2hlbiB0aGV5J3JlIHBpbm5lZCBkb2VzIHNpbXBsaWZ5IGEKPiA+IGxvdCBvZiBoZWFkYWNoZXMu
IEZvciBhIHNwZWNpZmljIGN1c3RvbSBidWlsdCBzeXN0ZW0gd2UgY2FuIGF2b2lkIHRoYXQKPiA+
IG1heWJlLCBidXQgSSB0aGluayB1cHN0cmVhbSBpcyBraW5kYSBhIGRpZmZlcmVudCB0aGluZy4K
Pgo+IFllcywgYWdyZWUgY29tcGxldGVseSBvbiB0aGF0LiBDdXN0b21lcnMgd2hpY2ggYXJlIHdp
bGxpbmcgdG8gdGFrZSB0aGUKPiByaXNrIGNhbiBlYXNpbHkgZG8gdGhpcyB0aGVtc2VsdmVzLgo+
Cj4gQnV0IHRoYXQgaXMgbm90IHNvbWV0aGluZyB3ZSBzaG91bGQgcHJvYmFibHkgZG8gZm9yIHVw
c3RyZWFtLgo+Cj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4KPiA+Cj4gPiBDaGVlcnMsIERhbmll
bAo+ID4KPiA+PiBSZWdhcmRzLAo+ID4+IENocmlzdGlhbi4KPiA+Pgo+ID4+PiBKaWFueGluCj4g
Pj4+Cj4gPj4+PiBDaHJpc3RpYW4uCj4gPj4+Pgo+ID4+Pj4+IEphc29uCj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
