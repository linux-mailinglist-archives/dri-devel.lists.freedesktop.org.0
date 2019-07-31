Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF17C340
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2FC89DC2;
	Wed, 31 Jul 2019 13:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43C589DC2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:22:29 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1808D2064A;
 Wed, 31 Jul 2019 13:22:29 +0000 (UTC)
Date: Wed, 31 Jul 2019 15:22:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups easily
Message-ID: <20190731132227.GC12603@kroah.com>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731131045.GB147138@dtor-ws>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731131045.GB147138@dtor-ws>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564579349;
 bh=W+aYKCz9gxgG7u43KzXszSqqe6R1n9t7d1fUb3QuD7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KyQY5CBjylSO7ewCUAToDkmaAwmQjJO8QvWo9w/ul3hlz4NRL+Gjz7gxVd5980jtP
 IGtcgcpPaQMoyDy1ZqpRsRWFSClc3ZThgNhemnSMgUB4JrS5m6yoU88+l6E0va7/KJ
 GHePa31wbh7qJ6l/aUhzBXH+dHwFwpLbAqoeZ3VE=
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
Cc: x86@kernel.org, linux-input@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Tony Prisk <linux@prisktech.co.nz>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Richard Gong <richard.gong@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDY6MTA6NDVBTSAtMDcwMCwgRG1pdHJ5IFRvcm9raG92
IHdyb3RlOgo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDAyOjQzOjM5UE0gKzAyMDAsIEdyZWcg
S3JvYWgtSGFydG1hbiB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggb3JpZ2luYWxseSBzdGFydGVkIG91
dCBqdXN0IGFzIGEgd2F5IGZvciBwbGF0Zm9ybSBkcml2ZXJzIHRvCj4gPiBlYXNpbHkgYWRkIGEg
c3lzZnMgZ3JvdXAgaW4gYSByYWNlLWZyZWUgd2F5LCBidXQgdGhhbmtzIHRvIERtaXRyeSdzCj4g
PiBwYXRjaCwgdGhpcyBzZXJpZXMgbm93IGlzIGZvciBhbGwgZHJpdmVycyBpbiB0aGUga2VybmVs
IChoZXksIGEgdW5pZmllZAo+ID4gZHJpdmVyIG1vZGVsIHdvcmtzISEhKQo+ID4gCj4gPiBJJ3Zl
IG9ubHkgY29udmVydGVkIGEgZmV3IHBsYXRmb3JtIGRyaXZlcnMgaGVyZSBpbiB0aGlzIHNlcmll
cyB0byBzaG93Cj4gPiBob3cgaXQgd29ya3MsIGJ1dCBvdGhlciBidXNzZXMgY2FuIGJlIGNvbnZl
cnRlZCBhZnRlciB0aGUgZmlyc3QgcGF0Y2gKPiA+IGdvZXMgaW50byB0aGUgdHJlZS4KPiA+IAo+
ID4gSGVyZSdzIHRoZSBvcmlnaW5hbCAwMCBtZXNzYWdlLCBmb3IgcGVvcGxlIHRvIGdldCBhbiBp
ZGVhIG9mIHdoYXQgaXMKPiA+IGdvaW5nIG9uIGhlcmU6Cj4gPiAKPiA+IElmIGEgcGxhdGZvcm0g
ZHJpdmVyIHdhbnRzIHRvIGFkZCBhIHN5c2ZzIGdyb3VwLCBpdCBoYXMgdG8gZG8gc28gaW4gYQo+
ID4gcmFjeSB3YXksIGFkZGluZyBpdCBhZnRlciB0aGUgZHJpdmVyIGlzIGJvdW5kLiAgVG8gcmVz
b2x2ZSB0aGlzIGlzc3VlLAo+ID4gaGF2ZSB0aGUgcGxhdGZvcm0gZHJpdmVyIGNvcmUgZG8gdGhp
cyBmb3IgdGhlIGRyaXZlciwgbWFraW5nIHRoZQo+ID4gaW5kaXZpZHVhbCBkcml2ZXJzIGxvZ2lj
IHNtYWxsZXIgYW5kIHNpbXBsZXIsIGFuZCBzb2x2aW5nIHRoZSByYWNlIGF0Cj4gPiB0aGUgc2Ft
ZSB0aW1lLgo+ID4gCj4gPiBBbGwgb2YgdGhlc2UgcGF0Y2hlcyBkZXBlbmQgb24gdGhlIGZpcnN0
IHBhdGNoLiAgSSdsbCB0YWtlIHRoZSBmaXJzdCBvbmUKPiA+IHRocm91Z2ggbXkgZHJpdmVyLWNv
cmUgdHJlZSwgYW5kIGFueSBzdWJzeXN0ZW0gbWFpbnRhaW5lciBjYW4gZWl0aGVyIGFjawo+ID4g
dGhlaXIgaW5kaXZpZHVsIHBhdGNoIGFuZCBJIHdpbGwgYmUgZ2xhZCB0byBhbHNvIG1lcmdlIGl0
LCBvciB0aGV5IGNhbgo+ID4gd2FpdCB1bnRpbCBhZnRlciA1LjQtcmMxIHdoZW4gdGhlIGNvcmUg
cGF0Y2ggaGl0cyBMaW51cydzIHRyZWUgYW5kIHRoZW4KPiA+IHRha2UgaXQsIGl0J3MgdXAgdG8g
dGhlbS4KPiAKPiBNYXliZSBtYWtlIGFuIGltbXV0YWJsZSBicmFuY2ggb2ZmIDUuMiB3aXRoIGp1
c3QgcGF0Y2ggMS8xMCBzbyB0aGF0Cj4gc3Vic3lzdGVtcyAoYW5kIHRoZSBkcml2ZXIgY29yZSB0
cmVlIGl0c2VsZikgY291bGQgcHVsbCBpdCBpbiBhdCB0aGVpcgo+IGxlaXN1cmUgaW50byB0aGVp
ciAiKi1uZXh0IiBicmFuY2hlcyBhbmQgZGlkIG5vdCBoYXZlIHRvIHdhaXQgdGlsbCA1LjQKPiBv
ciByaXNrIG1lcmdlIGNsYXNoZXM/CgpHb29kIGlkZWEsIEkgd2lsbCBkbyB0aGF0IHdoZW4gSSBh
cHBseSBpdCBhZnRlciBhIGZldyBkYXlzIHRvIGdpdmUKcGVvcGxlIGEgY2hhbmNlIHRvIHJldmll
dyBpdC4KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
