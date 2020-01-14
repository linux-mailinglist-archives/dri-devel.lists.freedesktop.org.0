Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474A13B0F5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 18:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BDD6E42E;
	Tue, 14 Jan 2020 17:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD17D6E42E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 17:30:46 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB6372072B;
 Tue, 14 Jan 2020 17:30:44 +0000 (UTC)
Date: Tue, 14 Jan 2020 12:30:43 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer
 accessible via debugfs
Message-ID: <20200114123043.3d92c65c@gandalf.local.home>
In-Reply-To: <20200114172155.215463-1-sean@poorly.run>
References: <20200114172155.215463-1-sean@poorly.run>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jiri Olsa <jolsa@redhat.com>,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNCBKYW4gMjAyMCAxMjoyMTo0MyAtMDUwMApTZWFuIFBhdWwgPHNlYW5AcG9vcmx5
LnJ1bj4gd3JvdGU6Cgo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+
IAo+IFRoaXMgcGF0Y2ggdXNlcyBhIHJpbmdfYnVmZmVyIHRvIGtlZXAgYSAiZmxpZ2h0IHJlY29y
ZGVyIiAobmFtZSBjcmVkaXQgV2VzdG9uKQo+IG9mIERSTSBsb2dzIGZvciBhIHNwZWNpZmllZCBz
ZXQgb2YgZGVidWcgY2F0ZWdvcmllcy4gVGhlIHVzZXIgd3JpdGVzIGEKPiBiaXRtYXNrIG9mIGRl
YnVnIGNhdGVnb3JpZXMgdG8gdGhlICJ0cmFjZV9tYXNrIiBub2RlIGFuZCBjYW4gcmVhZCBsb2cK
PiBtZXNzYWdlcyBmcm9tIHRoZSAidHJhY2UiIG5vZGUuCj4gCj4gVGhlc2Ugbm9kZXMgY3VycmVu
dGx5IGV4aXN0IGluIGRlYnVnZnMgdW5kZXIgdGhlIGRyaSBkaXJlY3RvcnkuIEkKPiBpbnRlbmRl
ZCBvbiBleHBvc2luZyBhbGwgb2YgdGhpcyB0aHJvdWdoIHRyYWNlZnMgb3JpZ2luYWxseSwgYnV0
IHRoZQo+IHRyYWNlZnMgZW50cnkgcG9pbnRzIGFyZSBub3QgZXhwb3NlZCwgc28gdGhlcmUncyBu
byB3YXkgdG8gY3JlYXRlCj4gdHJhY2VmcyBmaWxlcyBmcm9tIGRyaXZlcnMgYXQgdGhlIG1vbWVu
dC4gSSB0aGluayBpdCB3b3VsZCBiZSBhCj4gd29ydGh3aGlsZSBlbmRlYXZvdXIsIGJ1dCBvbmUg
cmVxdWlyaW5nIG1vcmUgdGltZSBhbmQgY29udmVyc2F0aW9uIHRvCj4gZW5zdXJlIHRoZSBkcm0g
dHJhY2VzIGZpdCBzb21ld2hlcmUgc2Vuc2libGUuCgpZb3UgbWF5IHdhbnQgdG8gcmViYXNlIHRo
ZXNlIG9uIG15IHRyZWUgdGhhdCByZW5hbWVzIHJpbmdfYnVmZmVyIHRvCnRyYWNlX2J1ZmZlci4g
Rm9yIG1vcmUgaW5mb3JtYXRpb24sIHJlYWQgdGhpcyB0aHJlYWQ6CgogIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAxOTEyMTMxNTM1NTMuR0UyMDU4M0BrcmF2YQoKTXkgdHJlZSBpcyBjdXJy
ZW50bHkgYmVpbmcgdGVzdGVkIGFuZCB3aGVuIGl0IGZpbmlzaGVzIGNvbnRpbmdlbnQgb24gbm8K
ZXJyb3JzIGZvdW5kLCBJJ2xsIGJlIHB1c2hpbmcgaXQgdG8gbGludXgtbmV4dC4KCiBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yb3N0ZWR0L2xpbnV4LXRy
YWNlLmdpdC9jb21taXQvP2g9ZnRyYWNlL2NvcmUmaWQ9MTMyOTI0OTQzNzlmOTJmNTMyZGU3MWIz
MWE1NDAxODMzNmFkYzU4OQoKLS0gU3RldmUKCgo+IAo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29t
Pgo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgo+IENjOiBK
b29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFBl
a2thIFBhYWxhbmVuIDxwcGFhbGFuZW5AZ21haWwuY29tPgo+IENjOiBSb2IgQ2xhcmsgPHJvYmRj
bGFya0BnbWFpbC5jb20+Cj4gQ2M6IFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0QGdvb2RtaXMub3Jn
Pgo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiBMaW5rOiBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTEwMTAyMDQ4MjMuMTk1NTQw
LTEtc2VhbkBwb29ybHkucnVuICN2MQo+IExpbms6IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LU5vdmVtYmVyLzI0MzIzMC5odG1sICN2Mgo+IExp
bms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MTIx
MjIwMzMwMS4xNDI0MzctMS1zZWFuQHBvb3JseS5ydW4gI3YzCj4gCj4gQ2hhbmdlcyBpbiB2MjoK
PiAtIFdlbnQgd2l0aCBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IGFwcHJvYWNoOgo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LU5vdmVtYmVyLzI0
MzIzMC5odG1sCj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIENoYW5nZWQgY29tbWl0IG1lc3NhZ2Ug
dG8gYmUgYSBiaXQgbGVzcyBSRkMteQo+IC0gTWFrZSBjbGFzc19kcm1fY2F0ZWdvcnlfbG9nIGFu
IGFjdHVhbCB0cmFjZSBjbGFzcwo+IAo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBJbnN0ZWFkIG9mIFth
Yl11c2luZyB0cmFjZSBldmVudHMgYW5kIHRoZSBzeXN0ZW0gdHJhY2UgYnVmZmVyLCB1c2Ugb3Vy
Cj4gICBvd24gcmluZ2J1ZmZlcgo+IC0tLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
