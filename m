Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3732591177
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053216E9F5;
	Sat, 17 Aug 2019 15:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BAA6E2E0;
 Fri, 16 Aug 2019 03:10:05 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=[192.168.1.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hyScu-0006Dn-JI; Fri, 16 Aug 2019 03:10:04 +0000
Subject: Re: Linux Kernel 5.2.8 (uvc or i915? <<<)
References: <CAONH+Jm-O6=DQ+K2n5pNTNMg2Sq1KcVNFLuweVh6W82OPEFJoQ@mail.gmail.com>
 <abcae5c9-b3dc-7403-d628-5d7543d19702@infradead.org>
 <CAONH+JnZpbpdiwdajP7ke7X7wQGU7m4YoyZRDbLHKmRufkD6mQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5d637638-12d1-6c39-8f76-824a0e875feb@infradead.org>
Date: Thu, 15 Aug 2019 20:10:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAONH+JnZpbpdiwdajP7ke7X7wQGU7m4YoyZRDbLHKmRufkD6mQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:
 Subject:Sender:Reply-To:To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4j8pzC9X6BV/0Cgmn/vHlvEwxdtoqsY8m8EAgZ/56aI=; b=cjB+2UDwKTYOFgYTe9TsclryD
 fRTu6IgBmoFI+mvs9rUzSWQMIe8my5zq4ZZJaggyvAyurUvssi8NzmQ+IDgkvfZFbUJhXwBTWiyT9
 1BxwxTOR4XitmL/hXXt3KYaV8F1+grwZoZc6lsF+l8YTZhKQosVb2Vm5JZmgWSyhN8wG19zuICD9y
 3M85yq3D6DDgv2vI5vwrxFdo2YRbIlYT3Zegg2t+5N4MqPpcwoAV6fyo/8Z7qfOs0hpcb0A8fQf1i
 jpBMBFZEX/TRG3IOR0UX6AKwBOyqKYcdrITx8HSCB6o3pvWlM/2RU0MAqeElqVT7g/LrxSY1C4PMm
 5oQ3KzFTA==;
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nathaniel Russell <naterussell83@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W2FkZGluZyBtYWlsaW5nIGxpc3RzIGV0Yy4gd2l0aCBOYXRoYW5pZWwncyB0ZXN0IGluZm9dCgoK
T24gOC8xNS8xOSA3OjIxIFBNLCBOYXRoYW5pZWwgUnVzc2VsbCB3cm90ZToKPiBXZWxsIGkgc3Vy
cHJlc3NlZCB0aGUgdXZjdmlkZW8gZHJpdmVyIGFuZCB5b3UgYXJlIHJpZ2h0IFJhbmR5IGl0Cj4g
ZGVmaW5pdGVseSBpcyBub3QgdGhlIHV2Y3ZpZGVvIGRyaXZlci4gVGhlcmUgaXMgc29tZXRoaW5n
IGdvaW5nIG9uIGluCj4gdGhlIGk5MTUgZHJpdmVyLgo+IAo+IAo+IE9uIDgvMTUvMTksIFJhbmR5
IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPj4gT24gOC8xNS8xOSA2OjE1
IFBNLCBOYXRoYW5pZWwgUnVzc2VsbCB3cm90ZToKPj4+IEkgd291bGQgcmVhbGx5IGxpa2UgaGVs
cCB3aXRoIHRoZSBrZXJuZWwgZXJyb3Igd2l0aCBteSB1dmN2aWRlbyBkcml2ZXIuCj4+Pgo+Pgo+
PiBIaSBhZ2Fpbi4KPj4KPj4gV2hhdCBtYWtlcyB5b3UgdGhpbmsgdGhhdCB0aGUgcHJvYmxlbSBp
cyByZWxhdGVkIHRvIHRoZSB1dmN2aWRlbyBkcml2ZXI/Cj4+IERvZXMgc29tZSBwcmV2aW91cyBr
ZXJuZWwgdmVyc2lvbiB3b3JrIGNvcnJlY3RseT8gIElmIHNvLCB3aGF0IHZlcnNpb24ocyk/Cj4+
Cj4+Cj4+IERvZXMgdGhpcyB3YXJuaW5nIG1lc3NhZ2Ugb25seSBoYXBwZW4gd2hlbiB0aGUgdXZj
dmlkZW8gZHJpdmVyIGlzIGJlaW5nCj4+IGxvYWRlZD8KPj4gQ2FuIHlvdSBzdXBwcmVzcyBsb2Fk
aW5nIG9mIHRoZSB1dmN2aWRlbyBkcml2ZXIgdG8gZmluZCBvdXQ/Cj4+Cj4+IE1vc3Qgb2YgdGhl
IHByb2JsZW1zL2Vycm9ycy93YXJuaW5ncyB0aGF0IEkgc2VlIGFyZSByZWxhdGVkIHRvIHRoZSBp
OTE1Cj4+IGRyaXZlcjoKPj4KPj4gWyAgIDEzLjAzMjM0MV0gdGltZWQgb3V0IHdhaXRpbmcgZm9y
IHBvcnQgQyByZWFkeTogZ290IDB4MjAsIGV4cGVjdGVkIDB4ZTAKPj4gWyAgIDEzLjAzMjg3Ml0g
V0FSTklORzogQ1BVOiAxIFBJRDogMjM5IGF0Cj4+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X2Rpc3BsYXkuYzoxNTk3IHZsdl93YWl0X3BvcnRfcmVhZHkrMHg5OS8weGUwCj4+IFtpOTE1XQo+
PiBbICAgMTMuMDMzNjMyXSBSSVA6IDAwMTA6dmx2X3dhaXRfcG9ydF9yZWFkeSsweDk5LzB4ZTAg
W2k5MTVdCj4+Cj4+IGFsdGhvdWdoIHRoZXJlIGFyZSBhIGZldyB1dmN2aWRlbyB3YXJuaW5nczoK
Pj4gWyAgIDEzLjAzOTMwNV0gdXZjdmlkZW8gMS01OjEuMDogRW50aXR5IHR5cGUgZm9yIGVudGl0
eSBFeHRlbnNpb24gNCB3YXMgbm90Cj4+IGluaXRpYWxpemVkIQo+PiBbICAgMTMuMDM5MzE4XSB1
dmN2aWRlbyAxLTU6MS4wOiBFbnRpdHkgdHlwZSBmb3IgZW50aXR5IEV4dGVuc2lvbiAzIHdhcyBu
b3QKPj4gaW5pdGlhbGl6ZWQhCj4+IFsgICAxMy4wMzkzMzBdIHV2Y3ZpZGVvIDEtNToxLjA6IEVu
dGl0eSB0eXBlIGZvciBlbnRpdHkgUHJvY2Vzc2luZyAyIHdhcyBub3QKPj4gaW5pdGlhbGl6ZWQh
Cj4+IFsgICAxMy4wMzkzMzldIHV2Y3ZpZGVvIDEtNToxLjA6IEVudGl0eSB0eXBlIGZvciBlbnRp
dHkgQ2FtZXJhIDEgd2FzIG5vdAo+PiBpbml0aWFsaXplZCEKPj4KPj4KPj4gTGF1cmVudCwgZG8g
eW91IHNlZSBhbnkgdXZjIGlzc3VlcyBoZXJlPyAgQW55IGlkZWFzL3N1Z2dlc3Rpb25zPwo+Pgo+
Pgo+PiBAaW50ZWwtZ2Z4OiAgYW55IGlkZWFzIGFib3V0IHdoYXQgaXMgZ29pbmcgb24gaGVyZSB3
aXRoIHRoZSBpOTE1IGRyaXZlcj8KPj4KPj4KPj4KPj4gT3JpZ2luYWwgbWVzc2FnZSB0byBsa21s
Ogo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBT05IK0ptLU82PURRK0sybjVwTlRO
TWcyU3ExS2NWTkZMdXdlVmg2VzgyT1BFRkpvUUBtYWlsLmdtYWlsLmNvbS9ULyN1Cj4+Cj4+IFBy
ZXZpb3VzIG1lc3NhZ2UgZm9yIDUuMS4yMSBrZXJuZWw6Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvQ0FPTkgrSmtURnVqWTl2RXlOTnVlbSs5ckoycUJLa2YtUGJLazk9REJTVkVwNmtX
PXl3QG1haWwuZ21haWwuY29tLwo+Pgo+Pgo+PiB0aGFua3MuCj4+IC0tCj4+IH5SYW5keQo+PgoK
Ci0tIAp+UmFuZHkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
