Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8E22DBA1
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6051A6E2DE;
	Wed, 29 May 2019 11:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6176E03B;
 Wed, 29 May 2019 09:41:54 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 9808F3E80A;
 Wed, 29 May 2019 09:41:52 +0000 (UTC)
Date: Wed, 29 May 2019 05:41:52 -0400
From: Brian Masney <masneyb@onstation.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
Message-ID: <20190529094152.GB13436@basecamp>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
 <CACRpkdZu5KxKTMqAM5rueWbrXbfPNorOOerezCAA3vgAR6cD5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZu5KxKTMqAM5rueWbrXbfPNorOOerezCAA3vgAR6cD5g@mail.gmail.com>
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1559122913;
 bh=fAIT6Gqdt//3ui/hAaGpZ95WCJf2S6gz5J7z91LX3xU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uDwKDHPwA+58QqCzC0Rg04rxThkFy0yaNMhRG8AOoQTAMbnuw/G+EH8RYfMhlJ/Tl
 My9ZVW4LkMPkxL0I/L8wkMl0ZHEwT6cIPFfZXuh5DfzDM+dYTmGaJ7rdL1hF+63oXo
 XTWXWh0Z+N/0W3PuP3A7PWdxXpTsnbRpSdtZq3Xs=
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Dave Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDg6MjM6MTdBTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCAzOjE3IEFNIEJyaWFuIE1hc25leSA8bWFz
bmV5YkBvbnN0YXRpb24ub3JnPiB3cm90ZToKPiAKPiA+IEl0J3MgaW4gbG93IHNwZWVkIG1vZGUg
YnV0IGl0cyB1c2FibGUuCj4gCj4gSG93IGxvdyBzcGVlZCBpcyB0aGF0PwoKSSBkb24ndCBoYXZl
IGEgbnVtYmVyIGJ1dCBteSB0ZXN0IHdpdGggNC4xNyBpcyB0byBydW4KJ2NhdCAvZXRjL3Bhc3N3
ZCA+IC9kZXYvdHR5MScgb3ZlciBhIHNlcmlhbCBjYWJsZS4gVGhlIGZpcnN0IDItMyBjYWxscwp3
aWxsIGZpbGwgdXAgdGhlIHNjcmVlbiBhbmQgdGhlIGZpbGUgY29udGVudHMgYXBwZWFyIHRvIHNo
b3cgdXAgb24gdGhlCnNjcmVlbiBpbW1lZGlhdGVseSB0byB0aGUgaHVtYW4gZXllLiBUaGUgbmV4
dCB0aW1lIHRoYXQgSSBydW4gaXQKcmVxdWlyZXMgc2Nyb2xsaW5nIHRoZSBlbnRpcmUgY29uc29s
ZSBhbmQgdGhlcmUgaXMgYSBzbWFsbCBmcmFjdGlvbiBvZgphIHNlY29uZCB3aGVyZSBJIHNlZSB0
aGUgZW50aXJlIGZyYW1lYnVmZmVyIGNvbnRlbnRzIHNjcm9sbCB1cC4gSQpkb24ndCBoYXZlIGEg
Z3JhcGhpY3MgYmFja2dyb3VuZCwgYnV0IEkgYmVsaWV2ZSB0aGF0IHRoaXMgaXMgdGhlCnRlYXJp
bmcgZWZmZWN0IHRoYXQgSSdtIHNlZWluZyBiYXNlZCBvbiB3aGF0IEkndmUgcmVhZC4gSSBiZWxp
ZXZlIHRoYXQKZGlzcC10ZS1ncGlvcyBjYW4gYmUgdXNlZCB0byBtaXRpZ2F0ZSB0aGlzIHRlYXJp
bmcgZWZmZWN0LiBJIGhhdmUgYSBmZXcKcXVlc3Rpb25zIGFib3V0IHRoaXMgbGF0ZXIgb25jZSB3
ZSBnZXQgdGhlIGJhc2ljIGRpc3BsYXkgd29ya2luZy4KCj4gPiBJIGFzc3VtZSB0aGF0IGl0J3Mg
cmVsYXRlZCB0byB0aGUKPiA+IHZibGFuayBldmVudHMgbm90IHdvcmtpbmcgcHJvcGVybHk/Cj4g
Cj4gVGhleSBhcmUgb25seSB3YWl0aW5nIGZvciA1MCBtcyBiZWZvcmUgdGltaW5nIG91dCwgSSBy
YWlzZWQgaXQKPiB0byAxMDBtcyBpbiB0aGUgLW5leHQga2VybmVsLiBJJ20gc3RpbGwgc3VzcGlj
aW91cyBhYm91dCB0aGlzCj4gZXZlbiB0aG91Z2ggSSB0aGluayB5b3Ugc2FpZCB0aGlzIHdhcyBu
b3QgdGhlIHByb2JsZW0uCj4gCj4gRm9yIGEgY29tbWFuZCBtb2RlIHBhbmVsIGluIExQIG1vZGUg
aXQgd2lsbCBuZXZlcnRoZWxlc3MKPiBiZSBtb3JlIHRoYW4gMTAwbXMgZm9yIHN1cmUsIHRoZSB1
cGRhdGUgaXMgdmlzaWJsZSB0byB0aGUKPiBuYWtlZCBleWUuCj4gCj4gUmFpc2UgaXQgdG8gMTAw
MDAgbXMgb3Igc29tZXRoaW5nIGFuZCBzZWUgd2hhdCBoYXBwZW5zLgo+IGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fYXRvbWljX2hlbHBlci5jOgo+ICBtc2Vjc190b19qaWZmaWVzKDUwKQoKSSBwcmV2aW91
c2x5IHJhaXNlZCB0aG9zZSB0aW1lb3V0cyBhcyBoaWdoIGFzIDUgc2Vjb25kcyBhbmQgaXQgc3Rp
bGwKaGFzIHRoZSBzYW1lIGlzc3VlLiBXcml0aW5nIHRvIC9kZXYvdHR5MSBjYW4gdGFrZSBhbnl3
aGVyZSBiZXR3ZWVuIGEgZmV3CnNlY29uZHMgdG8gMzAgc2Vjb25kcyBvciBtb3JlLgoKQnJpYW4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
