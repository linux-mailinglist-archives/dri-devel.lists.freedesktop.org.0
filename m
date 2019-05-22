Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D04D12617E
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 12:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37DF898F0;
	Wed, 22 May 2019 10:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4B2898E4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:12:50 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:38230)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hTOEl-0006xu-Ni; Wed, 22 May 2019 11:12:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hTOEj-0006b2-G1; Wed, 22 May 2019 11:12:41 +0100
Date: Wed, 22 May 2019 11:12:41 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm: etnaviv: avoid DMA API warning when importing buffers
Message-ID: <20190522101241.ozi4jia535yjaswg@shell.armlinux.org.uk>
References: <E1gyDr8-0001cW-8d@rmk-PC.armlinux.org.uk>
 <20190225105423.jouccln33vj5xtyb@shell.armlinux.org.uk>
 <20190518175133.tpj255jzi7idhwxq@shell.armlinux.org.uk>
 <CAOMZO5C_nAMQM=ODU+_v3XMhcEDg_U+wY8c0-yR-cq_BWN_tVw@mail.gmail.com>
 <20190518213748.msdvolgiu5ykmaep@shell.armlinux.org.uk>
 <1558519467.2624.38.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558519467.2624.38.camel@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cNGPwHrHQ6d8ojqanBh6p5daBihz8UArtANc1g3TaDg=; b=dmpKicDze7M5Qpy2GvhqBRl/U
 LtfmYVkQNxCfF+r3WVfZGjmQnk0vy935Oj1IpL0WRL35pzqd4ZZr7GHvyorp2DtJuhmKTclhT47pU
 v7YWaBn32dbLzPWQNr6POxX4LZX8jKoRSdtPiddo8sElN+1O9pILNoMZmhmwDAO4KLAlunLCJufm5
 idvPSuCy0kWyNJ+hh9daZb2l5mkZJmm+9eFMhhYNLyL8eBLPLVn7Vi5JYn7wHl7A7crZvkfD/laLL
 0kJ/kZma4gzYumrrVRFC/x09Y6bk8y3M/XtSLAKo0qaRyAaFNH67xkoJLJI5vXsO1e5+q7PZv/3QI
 U6pEhXx7w==;
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
Cc: David Airlie <airlied@linux.ie>, Christoph Hellwig <hch@lst.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMTI6MDQ6MjdQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gSGkgUnVzc2VsbCwKPiAKPiBBbSBTYW1zdGFnLCBkZW4gMTguMDUuMjAxOSwgMjI6Mzcg
KzAxMDAgc2NocmllYiBSdXNzZWxsIEtpbmcgLSBBUk0KPiBMaW51eCBhZG1pbjoKPiA+IE9uIFNh
dCwgTWF5IDE4LCAyMDE5IGF0IDA2OjA0OjQyUE0gLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6
Cj4gPiA+IEhpIFJ1c3NlbGwsCj4gPiA+IAo+ID4gPiBPbiBTYXQsIE1heSAxOCwgMjAxOSBhdCAy
OjUxIFBNIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCBhZG1pbgo+ID4gPiA8bGludXhAYXJtbGlu
dXgub3JnLnVrPiB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiBQaW5nLgo+ID4gPiAKPiA+ID4gVGhp
cyBwYXRjaCBpcyBwcmVzZW50IGluIEx1Y2FzJyBwdWxsIHJlcXVlc3Q6Cj4gPiA+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2V0bmF2aXYvMjAxOS1NYXkvMDAyNDkwLmh0
bWwKPiA+IAo+ID4gSSdtIHdvbmRlcmluZyB3aHkgaXQgZGlkbid0IG1ha2UgNS4xIHNpbmNlIGl0
J3MgYSByZWdyZXNzaW9uLgo+IAo+IEkgZGlkbid0IHNlZSB0aGUgaW1wb3J0YW5jZSB0byBwdXQg
dGhpcyBpbnRvIGZpeGVzLCBhcyBpdCdzIGdldHRpbmcgcmlkCj4gb2YgYSB3YXJuaW5nIHdoaWNo
IHdpbGwgb25seSBiZSBwcmVzZW50IHdoZW4gYSBkZWJ1ZyBvcHRpb24gaXMgZW5hYmxlZC4KPiBT
byBpdCBzaG91bGQgYmUgaW52aXNpYmxlIHRvIG1vc3QgdXNlcnMgYW5kIGl0IGRvZXNuJ3QgcmVn
cmVzcwo+IGZ1bmN0aW9uYWxpdHkuCgpUaGF0IGRlcGVuZHMgb24geW91ciBwb2ludCBvZiB2aWV3
LCBob3cgeW91IHVzZSB0aGUga2VybmVsLCBhbmQgd2hhdAp5b3UncmUgdXNpbmcgdGhlIGtlcm5l
bCBmb3IuICBJZiB5b3UncmUgdHJ5aW5nIHRvIHVzZSBkbWEgZGVidWdnaW5nCih3aGljaCBzaG91
bGQgYWx3YXlzIGJlIGVuYWJsZWQgd2hlbiBkb2luZyBkcml2ZXIgZGV2ZWxvcG1lbnQpIGFuZAp5
b3UgaGF2ZSBhIHN1YnN5c3RlbSB0aGF0IGtlZXBzIHRyaWdnZXJpbmcgaXQsIHRoZW4gaXQgaXMg
YSBzZXJpb3VzCnByb2JsZW0uCgpHaXZlbiB0aGF0IHdlIHdhbnQgZGV2ZWxvcGVycyB0byBoYXZl
IHN1Y2ggb3B0aW9ucyBvbiwgaGF2aW5nIGZhbHNlCmNvbXBsYWludHMgaXMgY291bnRlci1wcm9k
dWN0aXZlLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3Jn
LnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGlu
IHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcgdG8g
c3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
