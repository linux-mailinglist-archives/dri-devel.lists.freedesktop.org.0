Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E66310CFBA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 23:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998696E0F8;
	Thu, 28 Nov 2019 22:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F9F6E0F8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 22:20:03 +0000 (UTC)
Received: from 79.184.255.242.ipv4.supernova.orange.pl (79.184.255.242) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.320)
 id eea6408bb1d4e6fd; Thu, 28 Nov 2019 23:20:02 +0100
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] PM / runtime: Allow drivers to override runtime PM
 behaviour on sleep
Date: Thu, 28 Nov 2019 23:20:01 +0100
Message-ID: <4149037.GOuMSCS4uT@kreacher>
In-Reply-To: <2310325.iNVD75376c@kreacher>
References: <20191128160314.2381249-1-thierry.reding@gmail.com>
 <20191128163623.GA2382107@ulmo> <2310325.iNVD75376c@kreacher>
MIME-Version: 1.0
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
Cc: Len Brown <len.brown@intel.com>, Linux PM <linux-pm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIE5vdmVtYmVyIDI4LCAyMDE5IDExOjAzOjU3IFBNIENFVCBSYWZhZWwgSi4g
V3lzb2NraSB3cm90ZToKPiBPbiBUaHVyc2RheSwgTm92ZW1iZXIgMjgsIDIwMTkgNTo1MDoyNiBQ
TSBDRVQgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gPiAKPiA+IC0tMEYxcC8vOFBSSUNrSzRNVwo+
ID4gQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PXVzLWFzY2lpCj4gPiBDb250ZW50
LURpc3Bvc2l0aW9uOiBpbmxpbmUKPiA+IENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IHF1b3Rl
ZC1wcmludGFibGUKPiA+IAo+ID4gT24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDU6MTQ6NTFQTSAr
MDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiA+IE9uIFRodSwgTm92IDI4LCAyMDE5
IGF0IDU6MDMgUE0gVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT49Cj4g
PiAgd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Bu
dmlkaWEuY29tPgo+ID4gPiA+Cj4gPiA+ID4gQ3VycmVudGx5IHRoZSBkcml2ZXIgUE0gY29yZSB3
aWxsIGF1dG9tYXRpY2FsbHkgYWNxdWlyZSBhIHJ1bnRpbWUgUE0KPiA+ID4gPiByZWZlcmVuY2Ug
Zm9yIGRldmljZXMgYmVmb3JlIHN5c3RlbSBzbGVlcCBpcyBlbnRlcmVkLiBUaGlzIGlzIG5lZWRl
ZAo+ID4gPiA+IHRvIGF2b2lkIHBvdGVudGlhbCBpc3N1ZXMgcmVsYXRlZCB0byBkZXZpY2VzJyBw
YXJlbnRzIGdldHRpbmcgcHV0IHRvCj4gPiA+ID4gcnVudGltZSBzdXNwZW5kIGF0IHRoZSB3cm9u
ZyB0aW1lIGFuZCBjYXVzaW5nIHByb2JsZW1zIHdpdGggdGhlaXIKPiA+ID4gPiBjaGlsZHJlbi4K
PiA+ID49MjAKPiA+ID4gTm90IG9ubHkgZm9yIHRoYXQuCj4gPiA+PTIwCj4gPiA+ID4gSW4gc29t
ZSBjYXNlcyBkcml2ZXJzIGFyZSBjYXJlZnVsbHkgd3JpdHRlbiB0byBhdm9pZCBzdWNoIGlzc3Vl
cyBhbmQKPiA+ID4gPiB0aGUgZGVmYXVsdCBiZWhhdmlvdXIgY2FuIGJlIGNoYW5nZWQgdG8gYWxs
b3cgcnVudGltZSBQTSB0byBvcGVyYXRlCj4gPiA+ID4gcmVndWxhcmx5IGR1cmluZyBzeXN0ZW0g
c2xlZXAuCj4gPiA+PTIwCj4gPiA+IEJ1dCB0aGlzIGNoYW5nZSBicmVha3MgcXVpdGUgYSBmZXcg
YXNzdW1wdGlvbnMgaW4gdGhlIGNvcmUgdG9vLCBzbyBubywKPiA+ID4gaXQgY2FuJ3QgYmUgbWFk
ZS4KPiA+IAo+ID4gQW55dGhpbmcgaW4gcGFydGljdWxhciB0aGF0IEkgY2FuIGxvb2sgYXQ/IEkn
bSBub3Qgc2VlaW5nIGFueSBpc3N1ZXMKPiA+IHdoZW4gSSB0ZXN0IHRoaXMsIHdoaWNoIGNvdWxk
IG9mIGNvdXJzZSBtZWFuIHRoYXQgSSdtIGp1c3QgZ2V0dGluZwo+ID4gbHVja3kuCj4gCj4gVGhl
cmUgYXJlIHJhY2VzIGFuZCBzdWNoIHRoYXQgeW91IG1heSBuZXZlciBoaXQgZHVyaW5nIGNhc3Vh
bCB0ZXN0aW5nLgo+IAo+ID4gT25lIHRoaW5nIHRoYXQgaXJyaXRhdGVkIG1lIGlzIHRoYXQgSSB0
aGluayB0aGlzIHVzZWQgdG8gd29yay4gSSBkbwo+ID4gcmVjYWxsIHRlc3Rpbmcgc3VzcGVuZC9y
ZXN1bWUgYSBmZXcgeWVhcnMgYWdvIGFuZCBkZXZpY2VzIHdvdWxkIGdldAo+ID4gcHJvcGVybHkg
cnVudGltZSBzdXNwZW5kZWQvcmVzdW1lZC4KPiAKPiBOb3QgdHJ1ZSBhdCBhbGwuCj4gCj4gVGhl
IFBNIGNvcmUgaGFzIGFsd2F5cyB0YWtlbiBQTS1ydW50aW1lIHJlZmVyZW5jZXMgb24gYWxsIGRl
dmljZXMgcHJldHR5IG11Y2gKPiBzaW5jZSB3aGVuIFBNLXJ1bnRpbWUgd2FzIGludHJvZHVjZWQu
Cj4gCj4gPiBJIGRpZCBzb21lIGRpZ2dpbmcgYnV0IGNvdWxkbid0Cj4gPiBmaW5kIGFueXRoaW5n
IHRoYXQgd291bGQgaGF2ZSBoYWQgYW4gaW1wYWN0IG9uIHRoaXMuCj4gPiAKPiA+IEdpdmVuIHRo
YXQgdGhpcyBpcyBjb21wbGV0ZWx5IG9wdC1pbiBmZWF0dXJlLCB3aHkgYXJlIHlvdSBjYXRlZ29y
aWNhbGx5Cj4gPiBOQUsnaW5nIHRoaXM/Cj4gCj4gVGhlIGdlbmVyYWwgcHJvYmxlbSBpcyB0aGF0
IGlmIGFueSBkZXZpY2UgaGFzIGJlZW4gdG91Y2hlZCBieSBzeXN0ZW0td2lkZQo+IHN1c3BlbmQg
Y29kZSwgaXQgc2hvdWxkIG5vdCBiZSBzdWJqZWN0IHRvIFBNLXJ1bnRpbWUgYW55IG1vcmUgdW50
aWwgdGhlCj4gc3Vic2VxdWVudCBzeXN0ZW0td2lkZSByZXN1bWUgaXMgYWJsZSB0byB1bmRvIHdo
YXRldmVyIHRoZSBzdXNwZW5kIGRpZC4KPiAKPiBNb3Jlb3ZlciwgaWYgYSBkZXZpY2UgaXMgcnVu
dGltZS1zdXNwZW5kZWQsIHRoZSBzeXN0ZW0td2lkZSBzdXNwZW5kIGNvZGUKPiBtYXkgbWlzaGFu
ZGxlIGl0LCBpbiBnZW5lcmFsLiAgVGhhdCdzIHdoeSBQTS1ydW50aW1lIHN1c3BlbmQgaXMgbm90
IGFsbG93ZWQKPiBkdXJpbmcgc3lzdGVtLXdpZGUgdHJhbnNpdGlvbnMgYXQgYWxsLiAgQW5kIGl0
IGhhcyBhbHdheXMgYmVlbiBsaWtlIHRoYXQuCj4gCj4gRm9yIGEgc3BlY2lmaWMgcGxhdGZvcm0g
eW91IG1heSBiZSBhYmxlIHRvIG92ZXJjb21lIHRoZXNlIGxpbWl0YXRpb25zIGlmCj4geW91IGFy
ZSBjYXJlZnVsIGVub3VnaCwgYnV0IGNlcnRhaW5seSB0aGV5IGFyZSB0aGVyZSBpbiBnZW5lcmFs
IGFuZCBzdXJlbHkKPiB5b3UgY2Fubm90IHByZXZlbnQgcGVvcGxlIGZyb20gdXNpbmcgeW91ciBv
cHQtaW4ganVzdCBiZWNhdXNlIHRoZXkgdGhpbmsKPiB0aGF0IHRoZXkga25vdyB3aGF0IHRoZXkg
YXJlIGRvaW5nLgoKQlRXLCB3aGF0IGlmIHVzZXIgc3BhY2UgcHJldmVudHMgUE0tcnVudGltZSBm
cm9tIHN1c3BlbmRpbmcgZGV2aWNlcyBieSB3cml0aW5nCiJvbiIgdG8gdGhlaXIgImNvbnRyb2wi
IGZpbGVzPwoKU3lzdGVtLXdpZGUgc3VzcGVuZCBpcyAob2YgY291cnNlKSBzdGlsbCBleHBlY3Rl
ZCB0byB3b3JrIGluIHRoYXQgY2FzZSwgc28gaG93CmV4YWN0bHkgd291bGQgeW91IG92ZXJjb21l
IHRoYXQ/CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
