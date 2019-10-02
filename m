Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EA9C88C5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 14:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AD66E96A;
	Wed,  2 Oct 2019 12:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410FD6E972
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 12:38:43 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD21B21920;
 Wed,  2 Oct 2019 12:38:42 +0000 (UTC)
Date: Wed, 2 Oct 2019 08:38:41 -0400
From: Sasha Levin <sashal@kernel.org>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH v4] video: hyperv: hyperv_fb: Obtain screen resolution
 from Hyper-V host
Message-ID: <20191002123841.GK17454@sasha-vm>
References: <20190905091120.16761-1-weh@microsoft.com>
 <DM5PR21MB0137D40DF705CDB372497266D7BB0@DM5PR21MB0137.namprd21.prod.outlook.com>
 <PU1P153MB0169656B3EC48BFCF4D8C134BFB30@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PU1P153MB0169656B3EC48BFCF4D8C134BFB30@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570019923;
 bh=HQMmTzo9+zvRqR/nVhQaW+N2GPTpVZp7d3nBoEoTmPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SFPxZuRdNvktOe4qMXQU9eQM9VwnajP5nw/OAfYArBagDdU9ddNNwUwZE7y0o+YNO
 tcw0hZklpBDfeIfzvpgKDFuhg72ZJLk7qHdIW07NH5CA7aaRyHzzpeaOxTbUjanSrr
 gUV3+b1accmguO0oYIXi7OGVYjxVI74VXVSc3/CA=
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Wei Hu <weh@microsoft.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michael Kelley <mikelley@microsoft.com>, Iouri Tarassov <iourit@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDY6Mzg6NDJBTSArMDAwMCwgRGV4dWFuIEN1aSB3cm90
ZToKPj4gRnJvbTogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+Cj4+IFNl
bnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgNSwgMjAxOSA3OjA2IEFNCj4+Cj4+IEZyb206IFdlaSBI
dSA8d2VoQG1pY3Jvc29mdC5jb20+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgNSwgMjAxOSAy
OjEyCj4+IEFNCj4+ID4KPj4gPiBCZWdpbm5pbmcgZnJvbSBXaW5kb3dzIDEwIFJTNSssIFZNIHNj
cmVlbiByZXNvbHV0aW9uIGlzIG9idGFpbmVkIGZyb20KPj4gaG9zdC4KPj4gPiBUaGUgInZpZGVv
PWh5cGVydl9mYiIgYm9vdCB0aW1lIG9wdGlvbiBpcyBub3QgbmVlZGVkLCBidXQgc3RpbGwgY2Fu
IGJlCj4+ID4gdXNlZCB0byBvdmVyd3JpdGUgd2hhdCB0aGUgaG9zdCBzcGVjaWZpZXMuIFRoZSBW
TSByZXNvbHV0aW9uIG9uIHRoZSBob3N0Cj4+ID4gY291bGQgYmUgc2V0IGJ5IGV4ZWN1dGluZyB0
aGUgcG93ZXJzaGVsbCAic2V0LXZtdmlkZW8iIGNvbW1hbmQuCj4+ID4KPj4gPiBTaWduZWQtb2Zm
LWJ5OiBJb3VyaSBUYXJhc3NvdiA8aW91cml0QG1pY3Jvc29mdC5jb20+Cj4+ID4gU2lnbmVkLW9m
Zi1ieTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT4KPj4gPiAtLS0KPj4gPiAgICAgdjI6Cj4+
ID4gICAgIC0gSW1wbGVtZW50ZWQgZmFsbGJhY2sgd2hlbiB2ZXJzaW9uIG5lZ290aWF0aW9uIGZh
aWxlZC4KPj4gPiAgICAgLSBEZWZpbmVkIGZ1bGwgc2l6ZSBmb3Igc3VwcG9ydGVkX3Jlc29sdXRp
b24gYXJyYXkuCj4+ID4KPj4gPiAgICAgdjM6Cj4+ID4gICAgIC0gQ29ycmVjdGVkIHRoZSBzeW50
aHZpZCBtYWpvciBhbmQgbWlub3IgdmVyc2lvbiBjb21wYXJpc29uIHByb2JsZW0uCj4+ID4KPj4g
PiAgICAgdjQ6Cj4+ID4gICAgIC0gQ2hhbmdlZCBmdW5jdGlvbiBuYW1lIHRvIHN5bnRodmlkX3Zl
cl9nZSgpLgo+PiA+Cj4+ID4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmMgfCAxNTkK
Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDE0NyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4gPgo+Pgo+PiBSZXZpZXdlZC1i
eTogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+Cj4KPkxvb2tzIGdvb2Qg
dG8gbWUuCj4KPlJldmlld2VkLWJ5OiBEZXh1YW4gQ3VpIDxkZWN1aUBtaWNyb3NvZnQuY29tPgoK
UXVldWVkIHVwIGZvciBoeXBlcnYtbmV4dCwgdGhhbmsgeW91LgoKLS0KVGhhbmtzLApTYXNoYQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
