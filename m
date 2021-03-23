Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ECC345EEB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C80B6E8E8;
	Tue, 23 Mar 2021 13:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764296E8E7;
 Tue, 23 Mar 2021 13:06:29 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id kt15so17486293ejb.12;
 Tue, 23 Mar 2021 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=e6FkST9t2ZwpU9tBoGwmlJ/8krgDpq4Z1yoPeMffQAs=;
 b=JL9OLr5bDQalWKZUrxo9qn1wSQaO/JngJ0lPvSKQHewn1QW4fy5DOUla5h3IcYwDVB
 qph2EnAwiQnfto2zfX1xXNV+8htZV+Nf5iEZiQAc9H5e787bJj8BcMAywKm5x6/WpOYr
 rzjO9c3pYKFPf5ce07ZO8VsPO3nPq/+OPI2GsahzrhQSS8qZcO5gE8gFusY0WSBCIjR1
 5SwDFATrNAQKYal93ya+zzErrHASFcjuomGLDpfWKyR2R07HY7jWxad9QFd5MhwXgVV4
 clp0y4WdpkJaEh9RxQNgEO6mUqLzNNdmokJI5obKVacGAGJTcEXGor9spBfr+nUooAY/
 6d3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e6FkST9t2ZwpU9tBoGwmlJ/8krgDpq4Z1yoPeMffQAs=;
 b=TdO/lrAqFp7uBd3in+6e2XNRJMoGMHJj27p9RKKAMKhEk4N0O6mzm/6gHOMpXAzW/U
 cqk6XFfaxIK1VdZJHi64zlZ0yRMP/h+vKD1gAv9Hvbxmiw35Ay3+XR5ioTWBNJMnQ1Kf
 SfPUlKtcQBQVPk1FbYi9+f7pk5DISgWAzDIQEClX1jMNodurt2R0+FJTMrL2VYFCRiLg
 ycFamU7gpeDKMP9RL9xtJZ+s8Aic6ii/LA0xdKsvJAdjAnLNeXqiEi7f8bWbqMk+u4sp
 Beblkm+DHkmGy27aqKIDNjGN45naRPNW0hZF2WCH0w2KEjN2wkO3xpr4ueiULJTBJ3MU
 cJWg==
X-Gm-Message-State: AOAM530UB4tTXsTQ8l9nhiOo6bm59bhX70leFlVKv5WBFaZJZMM2/C+x
 F/Yvi8OiP6Ksekbp5qzYcrM=
X-Google-Smtp-Source: ABdhPJyd4BvrBuru1/OFtDtS9Lx0wcR+CT3lNk6Rtk/k81vnYY04OLJgnIZ0sLUdHJ+Noiq4GteXbw==
X-Received: by 2002:a17:906:1d4e:: with SMTP id
 o14mr4731609ejh.549.1616504788155; 
 Tue, 23 Mar 2021 06:06:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:fdcd:4dd1:a1af:a7ec?
 ([2a02:908:1252:fb60:fdcd:4dd1:a1af:a7ec])
 by smtp.gmail.com with ESMTPSA id i2sm12687682edy.72.2021.03.23.06.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 06:06:27 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
To: Michal Hocko <mhocko@suse.com>
References: <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
 <YFi+UROYbQERYEEr@dhcp22.suse.cz>
 <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
 <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
 <YFma+ZxncvfBd++o@dhcp22.suse.cz> <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
 <cd17d2ca-140e-1e69-37ac-c2726cc1ef9f@gmail.com>
 <YFnZMzs2wYGWqowi@dhcp22.suse.cz>
 <75ff80c5-a054-d13d-85c1-0040addb45d2@gmail.com>
 <YFng9qXM3NdrGHTx@dhcp22.suse.cz>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <20808d08-b66c-13c3-f672-ebce216b2fa2@gmail.com>
Date: Tue, 23 Mar 2021 14:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFng9qXM3NdrGHTx@dhcp22.suse.cz>
Content-Language: en-US
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
Cc: Matthew Wilcox <willy@infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDMuMjEgdW0gMTM6Mzcgc2NocmllYiBNaWNoYWwgSG9ja286Cj4gT24gVHVlIDIzLTAz
LTIxIDEzOjIxOjMyLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBbSAyMy4wMy4yMSB1bSAx
MzowNCBzY2hyaWViIE1pY2hhbCBIb2NrbzoKPj4+IE9uIFR1ZSAyMy0wMy0yMSAxMjo0ODo1OCwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBBbSAyMy4wMy4yMSB1bSAxMjoyOCBzY2hyaWVi
IERhbmllbCBWZXR0ZXI6Cj4+Pj4+IE9uIFR1ZSwgTWFyIDIzLCAyMDIxIGF0IDA4OjM4OjMzQU0g
KzAxMDAsIE1pY2hhbCBIb2NrbyB3cm90ZToKPj4+Pj4+IE9uIE1vbiAyMi0wMy0yMSAyMDozNDoy
NSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IFsuLi5dCj4+Pj4+Pj4gTXkgb25seSBjb25j
ZXJuIGlzIHRoYXQgaWYgSSBjb3VsZCByZWx5IG9uIG1lbWFsbG9jX25vKiBiZWluZyB1c2VkIHdl
IGNvdWxkCj4+Pj4+Pj4gb3B0aW1pemUgdGhpcyBxdWl0ZSBhIGJpdCBmdXJ0aGVyLgo+Pj4+Pj4g
WWVzIHlvdSBjYW4gdXNlIHRoZSBzY29wZSBBUEkgYW5kIHlvdSB3aWxsIGJlIGd1YXJhbnRlZWQg
dGhhdCBfYW55Xwo+Pj4+Pj4gYWxsb2NhdGlvbiBmcm9tIHRoZSBlbmNsb3NlZCBjb250ZXh0IHdp
bGwgaW5oZXJpdCBHRlBfTk8qIHNlbWFudGljLgo+Pj4+IFRoZSBxdWVzdGlvbiBpcyBpZiB0aGlz
IGlzIGFsc28gZ3VhcmFudGVlZCB0aGUgb3RoZXIgd2F5IGFyb3VuZD8KPj4+Pgo+Pj4+IEluIG90
aGVyIHdvcmRzIGlmIHNvbWVib2R5IGNhbGxzIGdldF9mcmVlX3BhZ2UoR0ZQX05PRlMpIGFyZSB0
aGUgY29udGV4dAo+Pj4+IGZsYWdzIHNldCBhcyB3ZWxsPwo+Pj4gZ2ZwIG1hc2sgaXMgYWx3YXlz
IHJlc3RyaWN0ZWQgaW4gdGhlIHBhZ2UgYWxsb2NhdG9yLiBTbyBzYXkgeW91IGhhdmUKPj4+IG5v
aW8gc2NvcGUgY29udGV4dCBhbmQgY2FsbCBnZXRfZnJlZV9wYWdlL2ttYWxsb2MoR0ZQX05PRlMp
IHRoZW4gdGhlCj4+PiBzY29wZSB3b3VsZCByZXN0cmljdCB0aGUgYWxsb2NhdGlvbiBmbGFncyB0
byBHRlBfTk9JTyAoYWthIGRyb3AKPj4+IF9fR0ZQX0lPKS4gRm9yIGZ1cnRoZXIgZGV0YWlscywg
aGF2ZSBhIGxvb2sgYXQgY3VycmVudF9nZnBfY29udGV4dAo+Pj4gYW5kIGl0cyBjYWxsZXJzLgo+
Pj4KPj4+IERvZXMgdGhpcyBhbnN3ZXIgeW91ciBxdWVzdGlvbj8KPj4gQnV0IHdoYXQgaGFwcGVu
cyBpZiB5b3UgZG9uJ3QgaGF2ZSBub2lvIHNjb3BlIGFuZCBzb21lYm9keSBjYWxscwo+PiBnZXRf
ZnJlZV9wYWdlKEdGUF9OT0ZTKT8KPiBUaGVuIHRoaXMgd2lsbCBiZSBhIHJlZ3VsYXIgTk9GUyBy
ZXF1ZXN0LiBMZXQgbWUgcmVwZWF0IHNjb3BlIEFQSSB3aWxsCj4gZnVydGhlciByZXN0cmljdCBh
bnkgcmVxdWVzdGVkIGFsbG9jYXRpb24gbW9kZS4KCk9rLCBnb3QgaXQuCgo+Cj4+IElzIHRoZW4g
dGhlIG5vaW8gc2NvcGUgYWRkZWQgYXV0b21hdGljYWxseT8gQW5kIGlzIGl0IHBvc3NpYmxlIHRo
YXQgdGhlCj4+IHNocmlua2VyIGdldHMgY2FsbGVkIHdpdGhvdXQgbm9pbyBzY29wZSBldmVuIHdl
IHdvdWxkIG5lZWQgaXQ/Cj4gSGVyZSB5b3UgaGF2ZSBsb3N0IG1lIGFnYWluLgo+Cj4+Pj4+PiBJ
IHRoaW5rIHRoaXMgaXMgd2hlcmUgSSBkb24ndCBnZXQgeWV0IHdoYXQgQ2hyaXN0aWFuIHRyaWVz
IHRvIGRvOiBXZQo+Pj4+Pj4gcmVhbGx5IHNob3VsZG4ndCBkbyBkaWZmZXJlbnQgdHJpY2tzIGFu
ZCBjYWxsaW5nIGNvbnRleHRzIGJldHdlZW4gZGlyZWN0Cj4+Pj4+PiByZWNsYWltIGFuZCBrc3dh
cGQgcmVjbGFpbS4gT3RoZXJ3aXNlIHZlcnkgaGFyZCB0byB0cmFjayBkb3duIGJ1Z3MgYXJlCj4+
Pj4+PiBwcmV0dHkgbXVjaCBndWFyYW50ZWVkLiBTbyB3aGV0aGVyIHdlIHVzZSBleHBsaWNpdCBn
ZnAgZmxhZ3Mgb3IgdGhlCj4+Pj4+PiBjb250ZXh0IGFwaXMsIHJlc3VsdCBpcyBleGFjdGx5IHRo
ZSBzYW1lLgo+Pj4+IE9rIGxldCB1cyByZWNhcCB3aGF0IFRUTXMgVFQgc2hyaW5rZXIgZG9lcyBo
ZXJlOgo+Pj4+Cj4+Pj4gMS4gV2UgZ290IG1lbW9yeSB3aGljaCBpcyBub3Qgc3dhcGFibGUgYmVj
YXVzZSBpdCBtaWdodCBiZSBhY2Nlc3NlZCBieSB0aGUKPj4+PiBHUFUgYXQgYW55IHRpbWUuCj4+
Pj4gMi4gTWFrZSBzdXJlIHRoZSBtZW1vcnkgaXMgbm90IGFjY2Vzc2VkIGJ5IHRoZSBHUFUgYW5k
IGRyaXZlciBuZWVkIHRvIGdyYWIgYQo+Pj4+IGxvY2sgYmVmb3JlIHRoZXkgY2FuIG1ha2UgaXQg
YWNjZXNzaWJsZSBhZ2Fpbi4KPj4+PiAzLiBBbGxvY2F0ZSBhIHNobWVtIGZpbGUgYW5kIGNvcHkg
b3ZlciB0aGUgbm90IHN3YXBhYmxlIHBhZ2VzLgo+Pj4gVGhpcyBpcyBxdWl0ZSB0cmlja3kgYmVj
YXVzZSB0aGUgc2hyaW5rZXIgb3BlcmF0ZXMgaW4gdGhlIFBGX01FTUFMTE9DCj4+PiBjb250ZXh0
IHNvIHN1Y2ggYW4gYWxsb2NhdGlvbiB3b3VsZCBiZSBhbGxvd2VkIHRvIGNvbXBsZXRlbHkgZGVw
bGV0ZQo+Pj4gbWVtb3J5IHVubGVzcyB5b3UgZXhwbGljaXRseSBtYXJrIHRoYXQgY29udGV4dCBh
cyBfX0dGUF9OT01FTUFMTE9DLgo+PiBUaGFua3MsIGV4YWN0bHkgdGhhdCB3YXMgb25lIHRoaW5n
IEkgd2FzIGFic29sdXRlbHkgbm90IHN1cmUgYWJvdXQuIEFuZCB5ZXMKPj4gSSBhZ3JlZSB0aGF0
IHRoaXMgaXMgcmVhbGx5IHRyaWNreS4KPj4KPj4gSWRlYWxseSBJIHdvdWxkIGxpa2UgdG8gYmUg
YWJsZSB0byB0cmlnZ2VyIHN3YXBwaW5nIG91dCB0aGUgc2htZW0gcGFnZSBJCj4+IGFsbG9jYXRl
ZCBpbW1lZGlhdGVseSBhZnRlciBkb2luZyB0aGUgY29weS4KPiBTbyBsZXQgbWUgdHJ5IHRvIHJl
cGhyYXNlIHRvIG1ha2Ugc3VyZSBJIHVuZGVyc3RhbmQuIFlvdSB3b3VsZCBsaWtlIHRvCj4gc3dh
cCBvdXQgdGhlIGV4aXN0aW5nIGNvbnRlbnQgZnJvbSB0aGUgc2hyaW5rZXIgYW5kIHlvdSB1c2Ug
c2htZW0gYXMgYQo+IHdheSB0byBhY2hpZXZlIHRoYXQuIFRoZSBzd2Fwb3V0IHNob3VsZCBoYXBw
ZW4gYXQgdGhlIHRpbWUgb2YgY29weWluZwo+IChzaHJpbmtlciBjb250ZXh0KSBvciBzaG9ydGx5
IGFmdGVyd2FyZHM/Cj4KPiBTbyBlZmZlY3RpdmVseSB0byBjYWxsIHBhZ2VvdXQoKSBvbiB0aGUg
c2htZW0gcGFnZSBhZnRlciB0aGUgY29weT8KClllcywgZXhhY3RseSB0aGF0LgoKPj4gVGhpcyB3
YXkgSSB3b3VsZCBvbmx5IG5lZWQgYSBzaW5nbGUgcGFnZSBmb3IgdGhlIHdob2xlIHNocmluayBv
cGVyYXRpb24gYXQKPj4gYW55IGdpdmVuIHRpbWUuCj4gV2hhdCBkbyB5b3UgbWVhbiBieSB0aGF0
PyBZb3Ugd2FudCB0aGUgc2hhcmUgdGhlIHNhbWUgc2htZW0gcGFnZSBmb3IKPiBvdGhlciBjb3B5
K3N3YXBvdXQ/CgpDb3JyZWN0LCB5ZXMuCgpUaGUgaWRlYSBpcyB0aGF0IHdlIGNhbiBzd2FwIG91
dCB0aGUgY29udGVudCBvZiBhIGZ1bGwgR1BVIGJ1ZmZlciBvYmplY3QgCnRoaXMgd2F5IHRvIGdp
dmUgdGhlIGJhY2tpbmcgc3RvcmUgb2YgdGhlIG9iamVjdCBiYWNrIHRvIHRoZSBjb3JlIG1lbW9y
eSAKbWFuYWdtZW50LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
