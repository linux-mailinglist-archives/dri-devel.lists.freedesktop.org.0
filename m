Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF6BDAB5B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 13:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF216EA5A;
	Thu, 17 Oct 2019 11:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A436EA5A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 11:41:49 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:43854)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iL4A1-0000Ck-IQ; Thu, 17 Oct 2019 12:41:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iL49x-0008As-Nc; Thu, 17 Oct 2019 12:41:37 +0100
Date: Thu, 17 Oct 2019 12:41:37 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Message-ID: <20191017114137.GC25745@shell.armlinux.org.uk>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300>
 <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
 <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
 <20191017102055.GA8308@jamwan02-TSP300>
 <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r+Q3LUtMArQNVtEuVWYwd/gVihapefhZ4NaqVNvBt2E=; b=hexeKemyFMqhlYKddx44XfooO
 ELtD5P6CikyQA/uPSMsgDh168xhS/ZGfZvsdYe7ejUlXCHqn7hiTgMvxQbnIevboyZYnmCSL8rNP7
 RNGfR6bpNVk3icaqReknuHl10R8mNZ2v9s2jNECTJFBfIkWH/jNYUt5ViLHw24S01p04vjk6mkKXC
 9BwGEu4KoL4GH3HChYbLvEHagxKu0q4HjrD1iDMuGcs776AS1B4DouVgKnPxRATkTnzoayqU+U3sA
 0tW2a5I1vMgIu+bl7wVgBUpLFtCI+dhGb+omZ6ZVmjFEf74WYwYZ2LV5iYa9Pl/DSlmz/ZEzugQyA
 dcZqZbeMw==;
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
Cc: nd <nd@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6NDg6MTJBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAxMDoyMTowM0FNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDE3
LCAyMDE5IGF0IDA4OjIwOjU2QU0gKzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+IE9u
IFRodSwgT2N0IDE3LCAyMDE5IGF0IDAzOjA3OjU5QU0gKzAwMDAsIGphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDE5
IGF0IDA0OjIyOjA3UE0gKzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+ID4gPiAKPiA+
ID4gPiA+IElmIEphbWVzIGlzIHN0cm9uZ2x5IGFnYWluc3QgbWVyZ2luZyB0aGlzLCBtYXliZSB3
ZSBqdXN0IHN3YXAKPiA+ID4gPiA+IHdob2xlc2FsZSB0byBicmlkZ2U/IEJ1dCBmb3IgbWUsIHRo
ZSBwcmFnbWF0aWMgYXBwcm9hY2ggd291bGQgYmUgdGhpcwo+ID4gPiA+ID4gc3RvcC1nYXAuCj4g
PiA+ID4gPgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgaXMgYSBnb29kIGlkZWEsIGFuZCBJIHZvdGUg
K1VMT05HX01BWCA6KQo+ID4gPiA+IAo+ID4gPiA+IGFuZCBJIGFsc28gY2hlY2tlZCB0ZGE5OTh4
IGRyaXZlciwgaXQgc3VwcG9ydHMgYnJpZGdlLiBzbyBzd2FwIHRoZQo+ID4gPiA+IHdob2xlc2Fs
ZSB0byBicmlnZSBpcyBwZXJmZWN0LiA6KQo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gV2VsbCwgYXMg
TWloYWlsIHdyb3RlLCBpdCdzIGRlZmluaXRlbHkgbm90IHBlcmZlY3QuCj4gPiA+IAo+ID4gPiBU
b2RheSwgaWYgeW91IHJtbW9kIHRkYTk5OHggd2l0aCB0aGUgRFBVIGRyaXZlciBzdGlsbCBsb2Fk
ZWQsCj4gPiA+IGV2ZXJ5dGhpbmcgd2lsbCBiZSB1bmJvdW5kIGdyYWNlZnVsbHkuCj4gPiA+IAo+
ID4gPiBJZiB3ZSBzd2FwIHRvIGJyaWRnZSwgdGhlbiBybW1vZCdpbmcgdGRhOTk4eCAob3IgYW55
IG90aGVyIGJyaWRnZQo+ID4gPiBkcml2ZXIgdGhlIERQVSBpcyB1c2luZykgd2l0aCB0aGUgRFBV
IGRyaXZlciBzdGlsbCBsb2FkZWQgd2lsbCByZXN1bHQKPiA+ID4gaW4gYSBjcmFzaC4KPiA+IAo+
ID4gSSBoYXZlbid0IHJlYWQgdGhlIGJyaWRnZSBjb2RlLCBidXQgc2VlbXMgdGhpcyBpcyBhIGJ1
ZyBvZiBkcm1fYnJpZGdlLAo+ID4gc2luY2UgaWYgdGhlIGJyaWRnZSBpcyBzdGlsbCBpbiB1c2lu
ZyBieSBvdGhlcnMsIHRoZSBybW1vZCBzaG91bGQgZmFpbAo+ID4gCj4gCj4gQ29ycmVjdCwgYnV0
IHRoZXJlJ3Mgbm8gZml4IGZvciB0aGF0IHRvZGF5LiBZb3UgY2FuIGFsc28gdGFrZSBhIGxvb2sK
PiBhdCB0aGUgdGhyZWFkIGxpbmtlZCBmcm9tIE1paGFpbCdzIGNvdmVyIGxldHRlci4KPiAKPiA+
IEFuZCBwZXJzb25hbGx5IG9waW5pb24sIGlmIHRoZSBicmlkZ2UgZG9lc24ndCBoYW5kbGUgdGhl
IGRlcGVuZGVuY2UuCj4gPiBmb3IgdXM6Cj4gPiAKPiA+IC0gYWRkIHN1Y2ggc3VwcG9ydCB0byBi
cmlkZ2UKPiAKPiBUaGF0IHdvdWxkIGNlcnRhaW5seSBiZSBoZWxwZnVsLiBJIGRvbid0IGtub3cg
aWYgdGhlcmUncyBjb25zZW5zdXMgb24KPiBob3cgdG8gZG8gdGhhdC4KPiAKPiA+ICAgb3IKPiA+
IC0ganVzdCBkbyB0aGUgaW5zbW9kL3JtbW9kIGluIGNvcnJlY3Qgb3JkZXIuCj4gPiAKPiA+ID4g
U28sIHRoZXJlIHJlYWxseSBhcmUgcHJvcGVyIGJlbmVmaXRzIHRvIHN0aWNraW5nIHdpdGggdGhl
IGNvbXBvbmVudAo+ID4gPiBjb2RlIGZvciB0ZGE5OTh4LCB3aGljaCBpcyB3aHkgSSdkIGxpa2Ug
dG8gdW5kZXJzdGFuZCB3aHkgeW91J3JlIHNvCj4gPiA+IGFnYWluc3QgdGhpcyBwYXRjaD8KPiA+
ID4KPiA+IAo+ID4gVGhpcyBjaGFuZ2UgaGFuZGxlcyB0d28gZGlmZmVyZW50IGNvbm5lY3RvcnMg
aW4ga29tZWRhIGludGVybmFsbHksIGNvbXBhcmUKPiA+IHdpdGggb25lIGludGVyZmFjZSwgaXQg
aW5jcmVhc2VzIHRoZSBjb21wbGV4aXR5LCBtb3JlIHJpc2sgb2YgYnVnIGFuZCBtb3JlCj4gPiBj
b3N0IG9mIG1haW50YWluYW5jZS4KPiA+IAo+IAo+IFdlbGwsIGl0J3Mgb25seSBhYm91dCBob3cg
dG8gYmluZCB0aGUgZHJpdmVycyAtIHR3byBkaWZmZXJlbnQgbWV0aG9kcwo+IG9mIGJpbmRpbmcs
IG5vdCB0d28gZGlmZmVyZW50IGNvbm5lY3RvcnMuIEkgd291bGQgYXJndWUgdGhhdCBjYXJyeWlu
Zwo+IG91ciBvdXQtb2YtdHJlZSBwYXRjaGVzIHRvIHN1cHBvcnQgYm90aCBwbGF0Zm9ybXMgaXMg
YSBsYXJnZXIKPiBtYWludGVuYW5jZSBidXJkZW4uCj4gCj4gSG9uZXN0bHkgdGhpcyBsb29rcyBs
aWtlIGEgd2luLXdpbiB0byBtZS4gV2UgZ2V0IHRoZSBzdXBlcmlvciBhcHByb2FjaAo+IHdoZW4g
aXRzIHN1cHBvcnRlZCwgYW5kIHN0aWxsIGdldCB0byBzdXBwb3J0IGJyaWRnZXMgd2hpY2ggYXJl
IG1vcmUKPiBjb21tb24uCj4gCj4gQXMvd2hlbiBpbXByb3ZlbWVudHMgYXJlIG1hZGUgdG8gdGhl
IGJyaWRnZSBjb2RlIHdlIGNhbiByZW1vdmUgdGhlCj4gY29tcG9uZW50IGJpdHMgYW5kIG5vdCBs
b3NlIGFueXRoaW5nLgoKVGhlcmUgd2FzIGFuIGlkZWEgYSB3aGlsZSBiYWNrIGFib3V0IHVzaW5n
IHRoZSBkZXZpY2UgbGlua3MgY29kZSB0bwpzb2x2ZSB0aGUgYnJpZGdlIGlzc3VlIC0gYnV0IGF0
IHRoZSB0aW1lIHRoZSBkZXZpY2UgbGlua3MgY29kZSB3YXNuJ3QKdXAgdG8gdGhlIGpvYi4gIEkg
dGhpbmsgdGhhdCdzIGJlZW4gcmVzb2x2ZWQgbm93LCBidXQgSSBoYXZlbid0IGJlZW4KYWJsZSB0
byBjb25maXJtIGl0LiAgSSBkaWQgcHJvcG9zZSBzb21lIHBhdGNoZXMgZm9yIGJyaWRnZSBhdCB0
aGUKdGltZSBidXQgdGhleSBwcm9iYWJseSBuZWVkIHVwZGF0aW5nLgoKLS0gClJNSydzIFBhdGNo
IHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpG
VFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFN
YnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMg
ZG93biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
