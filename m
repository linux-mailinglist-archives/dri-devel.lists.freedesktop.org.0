Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C445E093
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 11:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04E56E104;
	Wed,  3 Jul 2019 09:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0586E104
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 09:10:37 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A219E2189E;
 Wed,  3 Jul 2019 09:10:36 +0000 (UTC)
Date: Wed, 3 Jul 2019 11:10:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH 1/2] staging: android: ion: Remove file ion_carveout_heap.c
Message-ID: <20190703091034.GA12289@kroah.com>
References: <20190703081842.22872-1-nishkadg.linux@gmail.com>
 <20190703083745.GB8996@kroah.com>
 <380a7fb4-d299-a3ee-43ae-0822ec25ece6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <380a7fb4-d299-a3ee-43ae-0822ec25ece6@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562145037;
 bh=xnhk3fMbSDPFVysiay/3wkb9yZGp0iJiUr+SM5CZkuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rob2aqaNguUteZjoj7EGwyl4bvyM8+iI1bysfD1bUenav2wrBuidFenDMNfIDsUJC
 yZ2gfFvZwY/jAofix8LXrGBVbAkWXQpfTUUJq0FcX+R3j/7kxcesm7kB7kk6OiAuYc
 WEsHxRh5qk0NPdp+d5WwSMvgS+IoCmisThOpsx1o=
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
Cc: devel@driverdev.osuosl.org, tkjos@android.com,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 arve@android.com, joel@joelfernandes.org, maco@android.com,
 christian@brauner.io
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDI6MTQ6MjFQTSArMDUzMCwgTmlzaGthIERhc2d1cHRh
IHdyb3RlOgo+IE9uIDAzLzA3LzE5IDI6MDcgUE0sIEdyZWcgS0ggd3JvdGU6Cj4gPiBPbiBXZWQs
IEp1bCAwMywgMjAxOSBhdCAwMTo0ODo0MVBNICswNTMwLCBOaXNoa2EgRGFzZ3VwdGEgd3JvdGU6
Cj4gPiA+IFJlbW92ZSBmaWxlIGlvbl9jYXJ2ZW91dF9oZWFwLmMgYXMgaXRzIGZ1bmN0aW9ucyBh
bmQgZGVmaW5pdGlvbnMgYXJlIG5vdAo+ID4gPiB1c2VkIGFueXdoZXJlLgo+ID4gPiBJc3N1ZSBm
b3VuZCB3aXRoIENvY2NpbmVsbGUuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOaXNoa2Eg
RGFzZ3VwdGEgPG5pc2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgZHJp
dmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL0tjb25maWcgICAgICAgICAgIHwgICA5IC0tCj4gPiA+
ICAgZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL01ha2VmaWxlICAgICAgICAgIHwgICAxIC0K
PiA+ID4gICAuLi4vc3RhZ2luZy9hbmRyb2lkL2lvbi9pb25fY2FydmVvdXRfaGVhcC5jICAgfCAx
MzMgLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAKPiA+IEkga2VlcCB0cnlpbmcgdG8gZG8gdGhpcywg
YnV0IG90aGVycyBwb2ludCBvdXQgdGhhdCB0aGUgaW9uIGNvZGUgaXMKPiA+ICJnb2luZyB0byBi
ZSBmaXhlZCB1cCBzb29uIiBhbmQgdGhhdCBwZW9wbGUgcmVseSBvbiB0aGlzIGludGVyZmFjZSBu
b3cuCj4gPiBXZWxsLCAiY29kZSBvdXRzaWRlIG9mIHRoZSBrZXJuZWwgdHJlZSIgcmVsaWVzIG9u
IHRoaXMsIHdoaWNoIGlzIG5vdCBvaywKPiA+IGJ1dCB0aGUgInNvb24iIHBlb3BsZSBrZWVwIGlu
c2lzdGluZyBvbiBpdC4uLgo+ID4gCj4gPiBPZGRzIGFyZSBJIHNob3VsZCBqdXN0IGRlbGV0ZSBh
bGwgb2YgSU9OLCBhcyB0aGVyZSBoYXNuJ3QgYmVlbiBhbnkKPiA+IGZvcndhcmQgcHJvZ3Jlc3Mg
b24gaXQgaW4gYSBsb25nIHRpbWUuCj4gCj4gSSdtIHNvcnJ5LCBJIGRvbid0IHRoaW5rIEkgdW5k
ZXJzdGFuZC4gU2hvdWxkIEkgZHJvcCB0aGVzZSBwYXRjaGVzIGZyb20gbXkKPiB0cmVlIHRoZW4/
CgpXaGF0ICJ0cmVlIj8gIExldCdzIHNlZSB3aGF0IHRoZSBJT04gbWFpbnRhaW5lciBhbmQgZGV2
ZWxvcGVycyBzYXkKYmVmb3JlIHJ1c2hpbmcgdG8gYW55dGhpbmcuCgp0aGFua3MsCgpncmVnIGst
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
