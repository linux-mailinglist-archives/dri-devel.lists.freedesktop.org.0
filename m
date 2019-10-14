Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD5CD6AD6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 22:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3B06E5BB;
	Mon, 14 Oct 2019 20:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F4E6E5BB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 20:36:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F0C6A80502;
 Mon, 14 Oct 2019 22:36:45 +0200 (CEST)
Date: Mon, 14 Oct 2019 22:36:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/15] DRM fbconv helpers for converting fbdev drivers
Message-ID: <20191014203644.GB4373@ravnborg.org>
References: <20191014140416.28517-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014140416.28517-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=bN8cPZFSIqpSJMKVDr4A:9 a=cFs883x1dbQTDLxy:21 a=crvWfZD_59QS1UrX:21
 a=CjuIK1q_8ugA:10
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, airlied@linux.ie,
 gregkh@linuxfoundation.org, michel@daenzer.net, corbet@lwn.net,
 malat@debian.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKT24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDQ6MDQ6MDFQTSArMDIwMCwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gKHdhczogRFJNIGRyaXZlciBmb3IgZmJkZXYgZGV2aWNl
cykKPiAKPiBUaGlzIGlzIHZlcnNpb24gMiBvZiB0aGUgZmJkZXYgY29udmVyc2lvbiBoZWxwZXJz
LiBJdCdzIG1vcmUgb3IgbGVzcyBhCj4gcmV3cml0ZSBvZiB0aGUgb3JpZ2luYWwgcGF0Y2hzZXQu
Cj4gCj4gVGhlIGZiZGV2IHN1YnN5c3RlbSBpcyBjb25zaWRlcmVkIGxlZ2FjeSBhbmQgd2lsbCBw
cm9iYWJseSBiZSByZW1vdmVkIGF0Cj4gc29tZSBwb2ludC4gVGhpcyB3b3VsZCBtZWFuIHRoZSBs
b3NzIG9mIGEgc2lnbmlmYW5jdCBudW1iZXIgb2YgZHJpdmVycy4KPiBTb21lIG9mIHRoZSBhZmZl
Y3RlZCBoYXJkd2FyZSBpcyBub3QgaW4gdXNlIGFueSBsb25nZXIsIGJ1dCBzb21lIGhhcmR3YXJl
Cj4gaXMgc3RpbGwgYXJvdW5kIGFuZCBwcm92aWRlcyBnb29kKC1lbm91Z2gpIGZyYW1lYnVmZmVy
cy4KPiAKPiBUaGUgZmJjb252IGhlbHBlcnMgYWxsb3cgZm9yIHJ1bm5pbmcgdGhlIGN1cnJlbnQg
RFJNIHN0YWNrIG9uIHRvcCBvZiBmYmRldgo+IGRyaXZlcnMuIEl0J3MgYSBzZXQgb2YgZnVuY3Rp
b25zIHRoYXQgY29udmVydCBiZXR3ZWVuIGZiZGV2IGludGVyZmFjZXMgYW5kCj4gRFJNIGludGVy
ZmFjZXMuIEJhc2VkIG9uIFNITUVNIGFuZCBzaW1wbGUgS01TIGhlbHBlcnMsIGl0IG9ubHkgb2Zm
ZXJzIHRoZQo+IGJhc2ljIGZ1bmN0aW9uYWxpdHkgb2YgYSBmcmFtZWJ1ZmZlciwgYnV0IHNob3Vs
ZCBiZSBjb21wYXRpYmxlIHdpdGggbW9zdAo+IGV4aXN0aW5nIGZiZGV2IGRyaXZlcnMuCj4gCj4g
QSBEUk0gZHJpdmVyIHVzaW5nIGZiY29udiBoZWxwZXJzIGNvbnNpc3RzIG9mCj4gCj4gICAqIERS
TSBzdHViIGNvZGUgdGhhdCBjYWxscyBpbnRvIGZiY29udiBoZWxwZXJzLCBhbmQKPiAgICogdGhl
IG9yaWdpbmFsIGZiZGV2IGRyaXZlciBjb2RlLgo+IAo+IFRoZSBmYmRldiBkcml2ZXIgY29kZSBo
YXMgdG8gYmUgbW9kaWZpZWQgdG8gcmVnaXN0ZXIgaXRzZWxmIHdpdGggdGhlCj4gc3R1YiBkcml2
ZXIgaW5zdGVhZCBvZiB0aGUgZmJkZXYgY29yZSBmcmFtZXdvcmsuIEEgdHV0b3JpYWwgb24gaG93
IHRvIHVzZQo+IHRoZSBoZWxwZXJzIGlzIHBhcnQgb2YgdGhpcyBwYXRjaHNldC4gVGhlIHJlc3Vs
dGluZyBkcml2ZXIgaHlicmlkIGNhbiBiZQo+IHJlZmFjdG9yZWQgaW50byBhIGZpcnN0LWNsYXNz
IERSTSBkcml2ZXIuIFRoZSBmYmNvbnYgaGVscGVycyBjb250YWluIGEKPiBudW1iZXIgb2YgY29t
bWVudHMsIGxhYmVsZWQgJ0RSTSBwb3J0aW5nIG5vdGUnLCB3aGljaCBleHBsYWluIHRoZSByZXF1
aXJlZAo+IHN0ZXBzLgo+IAo+IEkgdGVzdGVkIHRoZSBjdXJyZW50IHBhdGNoc2V0IHdpdGggdGhl
IGZvbGxvd2luZyBkcml2ZXJzOiBhdHlmYiwgYXR5MTI4ZmIsCj4gbWF0cm94ZmIsIHBtMmZiLCBw
bTNmYiwgcml2YWZiLCBzM2ZiLCBzYXZhZ2VmYiwgc2lzZmIsIHRkZnhmYiBhbmQgdHJpZGVudGZi
Lgo+IFdpdGggZWFjaCwgSSB3YXMgYWJsZSB0byBzdWNjZXNzZnVsbHkgc3RhcnQgd2l0aCBmYmNv
biBlbmFibGVkLCBydW4gd2VzdG9uIGFuZAo+IFgxMS4gVGhlIGRyaXZlcnMgYXJlIGF2YWlsYWJs
ZSBhdCBbMV0uIEZvciByZWZlcmVuY2UsIHRoZSBwYXRjaHNldCBpbmNsdWRlcwo+IHRoZSBNYXRy
b3ggc3R1YiBkcml2ZXIuCgpJbiBnZW5lcmFsIEkgbGlrZSB0aGUgaWRlYSBvZiBtb2Rlcm5pemlu
ZyB0aGUgZXhpc3RpbmcgZmJkZXYgZHJpdmVycy4KV2hhdCBJIGZhaWwgdG8gcmVhZCBpbiB5b3Vy
IGludHJvIGFib3ZlIGlzIGlmIHRoaXMgYWxsb3dzIHVzIHRvIHBoYXNlCm91dCB0aGUgbWlncmF0
ZWQgZmJkZXYgZHJpdmVycyBzb29uZXI/Ck9yIGRvIHdlIGVuZCB1cCB3aXRoIHR3byBkcml2ZXJz
IHRvIG1haW50YWluPwoKT2J2aW91c2x5IGEgZnVsbCBtaWdyYXRpb24gdG8gYSBEUk0gZHJpdmVy
IHdhcyBwcmVmZXJyZWQgLSBidXQgdGhpcyBtYXkKc2VydmUgYXMgYSBzdGVwIGluIHRoYXQgZGly
ZWN0aW9uLgpCdXQgd2Ugc2hvdWxkIG5vdCBlbmQgdXAgd2l0aCB0d28gZHJpdmVycyBkb2luZyBh
bG1vc3QgdGhlIHNhbWUuCgpBbm90aGVyIGdlbmVyYWwgcXVlc3Rpb24uIERvIHdlIHdhbnQgdGhl
IG1vZGVybml6ZWQgRFJNIGRyaXZlcnMgdG8gZW5kCnVwIGluIHN0YWdpbmc/IFdoeSBzaG91bGQg
dGhleSBub3QgZ28gZGlyZWN0IGludG8gZHJtLyoKSSBrbm93IHRoZXkgYXJlIG5vdCBmdWxseSBh
dG9taWMgYnV0IHRoaXMgaXMgbm90IG5ldyBkcml2ZXJzIHNvIG1heWJlCnRoZXkgY2FuIGJlIGV4
Y3VzZWQuClByb2JsZW0gaXMgdGhhdCBkcm0gZHJpdmVycyBpbiBzdGFnaW5nIGxpdmUgYSBzZWNy
ZXQgbm9udmlzaWJsZSBsaWZlCndoZXJlIHRoZXkgYXJlIGVhc3kgdG8gZm9yZ2V0IHdoZW4gd2Ug
Y2hhbmdlIGludGVyZmFjZXMgYW5kIHN1Y2guCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
