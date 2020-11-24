Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD462C2D30
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264686E49F;
	Tue, 24 Nov 2020 16:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159FF6E49D;
 Tue, 24 Nov 2020 16:44:11 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id z5so9341497ejp.4;
 Tue, 24 Nov 2020 08:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LKWqzt2Obr/Z3Sp249CV7zD1L9gCOLMMJ/3g3L3ofjM=;
 b=j3T2jqsLfl5ilz3bC9DiRlqIcG2BN8F2VOP+boX6eHSGQAAOUPeUJ1dZVEm2VpIyAA
 WZxj1r98dONQIYb0SMHBRAe4+EBNr2MxM7TtZ0dvqD5hC0YgJpiGSZ/yml2aKLRkADYd
 9ER9N4Vk7QG9TPzO3WRUW2zdJV6Ze4G4aureireKpPkAgcPQWq/DTbfQyCTMkU94n0qT
 oY3tC/YjJr+tJuFXnaID6m1JEAvpHaRqEI/iRcchDcK4hz6Cz1qtRcPEnYaEkDpfTjQi
 tR+TK+FGzvKojzbgPks08Zx7DyiwuBEyXfXlrTPGmigkC02dKmVA0BnVN5cFX5xtHHEZ
 n9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=LKWqzt2Obr/Z3Sp249CV7zD1L9gCOLMMJ/3g3L3ofjM=;
 b=W+gyfspHS9JgZJhEtTt0BikCFYRKYjS2xm4i84Q4qIORisbE3CQrY8CzXq1f5EN65R
 8/7k4zwkQzp+RGhMKZZ+3jCOWxoEqrdn99ZVpGZp2aJh9dcQz72dfjU8ahMcEl5aHLdJ
 MPcXlIfNFY/5nV53usCD73231dzhfB6IMeKvnLu71IvHGtPFW3gLmyVCYIdEnT7X5rvX
 UtTr8DFEGNJwNPpz309s+RHqiQdev3XNOx1dmsMG9KIxLYjmx98UeUF/b3t+3MeyA8V9
 PDMeRpt0KnzmWieH+ZumT+pYhnEyng8/RuUgYRS2hUoZ9nnLaHt4yJPuap0BOBZjTmZb
 NQgw==
X-Gm-Message-State: AOAM531G3dpnte+Brw0I8UMIWSxP9Tru47EpWrlxq9EwZD1bZTkb7CR5
 BRc7b4aaz/L802OeirI3+kU=
X-Google-Smtp-Source: ABdhPJw2XkvY4Jq5drnYBJLtBqa8jB5VgfxsZoo2eAjzR1Yi92MUKJ6ISG7TfaYXHgbfPQldOasi8Q==
X-Received: by 2002:a17:906:6a51:: with SMTP id
 n17mr5072004ejs.478.1606236249610; 
 Tue, 24 Nov 2020 08:44:09 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o3sm6967303edj.41.2020.11.24.08.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 08:44:08 -0800 (PST)
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
Date: Tue, 24 Nov 2020 17:44:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMTEuMjAgdW0gMTc6MjIgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDEx
LzI0LzIwIDI6NDEgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDIzLjExLjIwIHVt
IDIyOjA4IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pgo+Pj4gT24gMTEvMjMvMjAgMzo0
MSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBBbSAyMy4xMS4yMCB1bSAyMTozOCBz
Y2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pgo+Pj4+PiBPbiAxMS8yMy8yMCAzOjIwIFBN
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4gQW0gMjMuMTEuMjAgdW0gMjE6MDUgc2No
cmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIDExLzI1LzIwIDU6NDIg
QU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4+IEFtIDIxLjExLjIwIHVtIDA2OjIx
IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+PiBJdCdzIG5lZWRlZCB0byBkcm9w
IGlvbW11IGJhY2tlZCBwYWdlcyBvbiBkZXZpY2UgdW5wbHVnCj4+Pj4+Pj4+PiBiZWZvcmUgZGV2
aWNlJ3MgSU9NTVUgZ3JvdXAgaXMgcmVsZWFzZWQuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEl0IHdvdWxk
IGJlIGNsZWFuZXIgaWYgd2UgY291bGQgZG8gdGhlIHdob2xlIGhhbmRsaW5nIGluIFRUTS4gSSAK
Pj4+Pj4+Pj4gYWxzbyBuZWVkIHRvIGRvdWJsZSBjaGVjayB3aGF0IHlvdSBhcmUgZG9pbmcgd2l0
aCB0aGlzIGZ1bmN0aW9uLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4KPj4+
Pj4+Pgo+Pj4+Pj4+IENoZWNrIHBhdGNoICJkcm0vYW1kZ3B1OiBSZWdpc3RlciBJT01NVSB0b3Bv
bG9neSBub3RpZmllciBwZXIgCj4+Pj4+Pj4gZGV2aWNlLiIgdG8gc2VlCj4+Pj4+Pj4gaG93IGkg
dXNlIGl0LiBJIGRvbid0IHNlZSB3aHkgdGhpcyBzaG91bGQgZ28gaW50byBUVE0gbWlkLWxheWVy
IAo+Pj4+Pj4+IC0gdGhlIHN0dWZmIEkgZG8gaW5zaWRlCj4+Pj4+Pj4gaXMgdmVuZG9yIHNwZWNp
ZmljIGFuZCBhbHNvIEkgZG9uJ3QgdGhpbmsgVFRNIGlzIGV4cGxpY2l0bHkgCj4+Pj4+Pj4gYXdh
cmUgb2YgSU9NTVUgPwo+Pj4+Pj4+IERvIHlvdSBtZWFuIHlvdSBwcmVmZXIgdGhlIElPTU1VIG5v
dGlmaWVyIHRvIGJlIHJlZ2lzdGVyZWQgZnJvbSAKPj4+Pj4+PiB3aXRoaW4gVFRNCj4+Pj4+Pj4g
YW5kIHRoZW4gdXNlIGEgaG9vayB0byBjYWxsIGludG8gdmVuZG9yIHNwZWNpZmljIGhhbmRsZXIg
Pwo+Pj4+Pj4KPj4+Pj4+IE5vLCB0aGF0IGlzIHJlYWxseSB2ZW5kb3Igc3BlY2lmaWMuCj4+Pj4+
Pgo+Pj4+Pj4gV2hhdCBJIG1lYW50IGlzIHRvIGhhdmUgYSBmdW5jdGlvbiBsaWtlIAo+Pj4+Pj4g
dHRtX3Jlc291cmNlX21hbmFnZXJfZXZpY3RfYWxsKCkgd2hpY2ggeW91IG9ubHkgbmVlZCB0byBj
YWxsIGFuZCAKPj4+Pj4+IGFsbCB0dCBvYmplY3RzIGFyZSB1bnBvcHVsYXRlZC4KPj4+Pj4KPj4+
Pj4KPj4+Pj4gU28gaW5zdGVhZCBvZiB0aGlzIEJPIGxpc3QgaSBjcmVhdGUgYW5kIGxhdGVyIGl0
ZXJhdGUgaW4gYW1kZ3B1IAo+Pj4+PiBmcm9tIHRoZSBJT01NVSBwYXRjaCB5b3UganVzdCB3YW50
IHRvIGRvIGl0IHdpdGhpbgo+Pj4+PiBUVE0gd2l0aCBhIHNpbmdsZSBmdW5jdGlvbiA/IE1ha2Vz
IG11Y2ggbW9yZSBzZW5zZS4KPj4+Pgo+Pj4+IFllcywgZXhhY3RseS4KPj4+Pgo+Pj4+IFRoZSBs
aXN0X2VtcHR5KCkgY2hlY2tzIHdlIGhhdmUgaW4gVFRNIGZvciB0aGUgTFJVIGFyZSBhY3R1YWxs
eSBub3QgCj4+Pj4gdGhlIGJlc3QgaWRlYSwgd2Ugc2hvdWxkIG5vdyBjaGVjayB0aGUgcGluX2Nv
dW50IGluc3RlYWQuIFRoaXMgd2F5IAo+Pj4+IHdlIGNvdWxkIGFsc28gaGF2ZSBhIGxpc3Qgb2Yg
dGhlIHBpbm5lZCBCT3MgaW4gVFRNLgo+Pj4KPj4+Cj4+PiBTbyBmcm9tIG15IElPTU1VIHRvcG9s
b2d5IGhhbmRsZXIgSSB3aWxsIGl0ZXJhdGUgdGhlIFRUTSBMUlUgZm9yIHRoZSAKPj4+IHVucGlu
bmVkIEJPcyBhbmQgdGhpcyBuZXcgZnVuY3Rpb24gZm9yIHRoZSBwaW5uZWQgb25lc8KgID8KPj4+
IEl0J3MgcHJvYmFibHkgYSBnb29kIGlkZWEgdG8gY29tYmluZSBib3RoIGl0ZXJhdGlvbnMgaW50
byB0aGlzIG5ldyAKPj4+IGZ1bmN0aW9uIHRvIGNvdmVyIGFsbCB0aGUgQk9zIGFsbG9jYXRlZCBv
biB0aGUgZGV2aWNlLgo+Pgo+PiBZZXMsIHRoYXQncyB3aGF0IEkgaGFkIGluIG15IG1pbmQgYXMg
d2VsbC4KPj4KPj4+Cj4+Pgo+Pj4+Cj4+Pj4gQlRXOiBIYXZlIHlvdSB0aG91Z2h0IGFib3V0IHdo
YXQgaGFwcGVucyB3aGVuIHdlIHVucG9wdWxhdGUgYSBCTyAKPj4+PiB3aGlsZSB3ZSBzdGlsbCB0
cnkgdG8gdXNlIGEga2VybmVsIG1hcHBpbmcgZm9yIGl0PyBUaGF0IGNvdWxkIGhhdmUgCj4+Pj4g
dW5mb3Jlc2VlbiBjb25zZXF1ZW5jZXMuCj4+Pgo+Pj4KPj4+IEFyZSB5b3UgYXNraW5nIHdoYXQg
aGFwcGVucyB0byBrbWFwIG9yIHZtYXAgc3R5bGUgbWFwcGVkIENQVSAKPj4+IGFjY2Vzc2VzIG9u
Y2Ugd2UgZHJvcCBhbGwgdGhlIERNQSBiYWNraW5nIHBhZ2VzIGZvciBhIHBhcnRpY3VsYXIgQk8g
Cj4+PiA/IEJlY2F1c2UgZm9yIHVzZXIgbWFwcGluZ3MKPj4+IChtbWFwKSB3ZSB0b29rIGNhcmUg
b2YgdGhpcyB3aXRoIGR1bW15IHBhZ2UgcmVyb3V0ZSBidXQgaW5kZWVkIAo+Pj4gbm90aGluZyB3
YXMgZG9uZSBmb3IgaW4ga2VybmVsIENQVSBtYXBwaW5ncy4KPj4KPj4gWWVzIGV4YWN0bHkgdGhh
dC4KPj4KPj4gSW4gb3RoZXIgd29yZHMgd2hhdCBoYXBwZW5zIGlmIHdlIGZyZWUgdGhlIHJpbmcg
YnVmZmVyIHdoaWxlIHRoZSAKPj4ga2VybmVsIHN0aWxsIHdyaXRlcyB0byBpdD8KPj4KPj4gQ2hy
aXN0aWFuLgo+Cj4KPiBXaGlsZSB3ZSBjYW4ndCBjb250cm9sIHVzZXIgYXBwbGljYXRpb24gYWNj
ZXNzZXMgdG8gdGhlIG1hcHBlZCBidWZmZXJzIAo+IGV4cGxpY2l0bHkgYW5kIGhlbmNlIHdlIHVz
ZSBwYWdlIGZhdWx0IHJlcm91dGluZwo+IEkgYW0gdGhpbmtpbmcgdGhhdCBpbiB0aGlzwqAgY2Fz
ZSB3ZSBtYXkgYmUgYWJsZSB0byBzcHJpbmtsZSAKPiBkcm1fZGV2X2VudGVyL2V4aXQgaW4gYW55
IHN1Y2ggc2Vuc2l0aXZlIHBsYWNlIHdlcmUgd2UgbWlnaHQKPiBDUFUgYWNjZXNzIGEgRE1BIGJ1
ZmZlciBmcm9tIHRoZSBrZXJuZWwgPwoKWWVzLCBJIGZlYXIgd2UgYXJlIGdvaW5nIHRvIG5lZWQg
dGhhdC4KCj4gVGhpbmdzIGxpa2UgQ1BVIHBhZ2UgdGFibGUgdXBkYXRlcywgcmluZyBidWZmZXIg
YWNjZXNzZXMgYW5kIEZXIG1lbWNweSAKPiA/IElzIHRoZXJlIG90aGVyIHBsYWNlcyA/CgpQdWgs
IGdvb2QgcXVlc3Rpb24uIEkgaGF2ZSBubyBpZGVhLgoKPiBBbm90aGVyIHBvaW50IGlzIHRoYXQg
YXQgdGhpcyBwb2ludCB0aGUgZHJpdmVyIHNob3VsZG4ndCBhY2Nlc3MgYW55IAo+IHN1Y2ggYnVm
ZmVycyBhcyB3ZSBhcmUgYXQgdGhlIHByb2Nlc3MgZmluaXNoaW5nIHRoZSBkZXZpY2UuCj4gQUZB
SUsgdGhlcmUgaXMgbm8gcGFnZSBmYXVsdCBtZWNoYW5pc20gZm9yIGtlcm5lbCBtYXBwaW5ncyBz
byBJIGRvbid0IAo+IHRoaW5rIHRoZXJlIGlzIGFueXRoaW5nIGVsc2UgdG8gZG8gPwoKV2VsbCB0
aGVyZSBpcyBhIHBhZ2UgZmF1bHQgaGFuZGxlciBmb3Iga2VybmVsIG1hcHBpbmdzLCBidXQgdGhh
dCBvbmUgCmp1c3QgcHJpbnRzIHRoZSBzdGFjayB0cmFjZSBpbnRvIHRoZSBzeXN0ZW0gbG9nIGFu
ZCBjYWxscyBCVUcoKTsgOikKCkxvbmcgc3Rvcnkgc2hvcnQgd2UgbmVlZCB0byBhdm9pZCBhbnkg
YWNjZXNzIHRvIHJlbGVhc2VkIHBhZ2VzIGFmdGVyIAp1bnBsdWcuIE5vIG1hdHRlciBpZiBpdCdz
IGZyb20gdGhlIGtlcm5lbCBvciB1c2Vyc3BhY2UuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4g
QW5kcmV5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
