Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907F29DEB9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECF589817;
	Tue, 27 Aug 2019 07:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC40B6E217;
 Mon, 26 Aug 2019 08:59:24 +0000 (UTC)
Received: from [IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4]
 ([IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4])
 by smtp-cloud9.xs4all.net with ESMTPA
 id 2AqOiuoLSzaKO2AqPiEEbI; Mon, 26 Aug 2019 10:59:21 +0200
Subject: Re: [PATCH v7 2/9] drm/i915/intel_hdmi: use
 cec_notifier_conn_(un)register
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Dariusz Marcinkiewicz <darekm@google.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-3-darekm@google.com>
 <8d0c6d9b-d321-7e4b-8c06-92b9b816d029@xs4all.nl>
Message-ID: <a942bff9-bbdc-1983-2847-a25a24512d29@xs4all.nl>
Date: Mon, 26 Aug 2019 10:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8d0c6d9b-d321-7e4b-8c06-92b9b816d029@xs4all.nl>
Content-Language: en-US
X-CMAE-Envelope: MS4wfP5A+2spB5OfeGKS2BXM/ZP4Q729Q0/F1zD6dmXVBEA2CP23zskH+T/WN7EmqDePC4AeAF8BPM9O7pJ91mqx5ilRHKy7p8/zm5WsK4cCfLHLz8eF8suU
 cWCLxFkR/a/xxoy31NJLNKUp6FzHE+lqm0fY/TWUR2a8xAWC1iFMwsyd7jbcrLP1dI++QRFWITCz+eK7S9nmhzN0MQvDMPG8MwvrDW0HwCTbQAc2uEYsk++q
 snOXOkPCMUYf+eODbSD8/aeADUaF1Ibp9Qwr8qk8YDosfKpnGsWB9PRDBy/eANbpPZjdKOydrp7EN13Zn25M9V4CKOgeiwgFwcGajzh9aJSENTFfuNkJ9Orz
 /ThOFfQFZ4G/gSssHcyQyag2ANI1ws8PVlwBDVbZ99g//xAbnc07jI/Ng92Q/tnche7UBi/LfU/KFiXJZM3CrhB5Bnz/pGW0HYU0yHTmGBav8TX97EL7bBkF
 o38FWS7VfRY0VAoJyn04XHl1rDmIPXfSYdRvlim3/G/CHazQTz7skjbMOhAELJpTmIfi+wKAt8sX8n2J
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMi8xOSAxMDowMyBBTSwgSGFucyBWZXJrdWlsIHdyb3RlOgo+IFZpbGxlIG9yIFJvZHJp
Z28sCj4gCj4gQ2FuIG9uZSBvZiB5b3UgZWl0aGVyIG1lcmdlIHRoaXMgcGF0Y2ggb3IgQWNrIGl0
IHNvIHRoYXQgSSBjYW4gbWVyZ2UgdGhpcz8KClBpbmchCgpSZWdhcmRzLAoKCUhhbnMKCj4gCj4g
VGhhbmsgeW91IQo+IAo+IFJlZ2FyZHMsCj4gCj4gCUhhbnMKPiAKPiBPbiA4LzE0LzE5IDEyOjQ1
IFBNLCBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogd3JvdGU6Cj4+IFVzZSB0aGUgbmV3IGNlY19ub3Rp
Zmllcl9jb25uXyh1bilyZWdpc3RlcigpIGZ1bmN0aW9ucyB0bwo+PiAodW4pcmVnaXN0ZXIgdGhl
IG5vdGlmaWVyIGZvciB0aGUgSERNSSBjb25uZWN0b3IsIGFuZCBmaWxsIGluCj4+IHRoZSBjZWNf
Y29ubmVjdG9yX2luZm8uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERhcml1c3ogTWFyY2lua2lld2lj
eiA8ZGFyZWttQGdvb2dsZS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3VpbCA8aHZl
cmt1aWwtY2lzY29AeHM0YWxsLm5sPgo+PiBUZXN0ZWQtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1
aWwtY2lzY29AeHM0YWxsLm5sPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfaGRtaS5jIHwgMTMgKysrKysrKysrLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9oZG1pLmMKPj4gaW5kZXggYjFjYThlNWJkYjU2ZC4uOWZjZjJjNThjMjlj
NSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1p
LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKPj4g
QEAgLTI3NTIsOCArMjc1Miw5IEBAIGludGVsX2hkbWlfY29ubmVjdG9yX3JlZ2lzdGVyKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4+ICAKPj4gIHN0YXRpYyB2b2lkIGludGVsX2hk
bWlfZGVzdHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+PiAgewo+PiAtCWlm
IChpbnRlbF9hdHRhY2hlZF9oZG1pKGNvbm5lY3RvciktPmNlY19ub3RpZmllcikKPj4gLQkJY2Vj
X25vdGlmaWVyX3B1dChpbnRlbF9hdHRhY2hlZF9oZG1pKGNvbm5lY3RvciktPmNlY19ub3RpZmll
cik7Cj4+ICsJc3RydWN0IGNlY19ub3RpZmllciAqbiA9IGludGVsX2F0dGFjaGVkX2hkbWkoY29u
bmVjdG9yKS0+Y2VjX25vdGlmaWVyOwo+PiArCj4+ICsJY2VjX25vdGlmaWVyX2Nvbm5fdW5yZWdp
c3RlcihuKTsKPj4gIAo+PiAgCWludGVsX2Nvbm5lY3Rvcl9kZXN0cm95KGNvbm5lY3Rvcik7Cj4+
ICB9Cj4+IEBAIC0zMDY4LDYgKzMwNjksNyBAQCB2b2lkIGludGVsX2hkbWlfaW5pdF9jb25uZWN0
b3Ioc3RydWN0IGludGVsX2RpZ2l0YWxfcG9ydCAqaW50ZWxfZGlnX3BvcnQsCj4+ICAJc3RydWN0
IGRybV9kZXZpY2UgKmRldiA9IGludGVsX2VuY29kZXItPmJhc2UuZGV2Owo+PiAgCXN0cnVjdCBk
cm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoZGV2KTsKPj4gIAllbnVtIHBvcnQg
cG9ydCA9IGludGVsX2VuY29kZXItPnBvcnQ7Cj4+ICsJc3RydWN0IGNlY19jb25uZWN0b3JfaW5m
byBjb25uX2luZm87Cj4+ICAKPj4gIAlEUk1fREVCVUdfS01TKCJBZGRpbmcgSERNSSBjb25uZWN0
b3Igb24gcG9ydCAlY1xuIiwKPj4gIAkJICAgICAgcG9ydF9uYW1lKHBvcnQpKTsKPj4gQEAgLTMx
MjAsOCArMzEyMiwxMSBAQCB2b2lkIGludGVsX2hkbWlfaW5pdF9jb25uZWN0b3Ioc3RydWN0IGlu
dGVsX2RpZ2l0YWxfcG9ydCAqaW50ZWxfZGlnX3BvcnQsCj4+ICAJCUk5MTVfV1JJVEUoUEVHX0JB
TkRfR0FQX0RBVEEsICh0ZW1wICYgfjB4ZikgfCAweGQpOwo+PiAgCX0KPj4gIAo+PiAtCWludGVs
X2hkbWktPmNlY19ub3RpZmllciA9IGNlY19ub3RpZmllcl9nZXRfY29ubihkZXYtPmRldiwKPj4g
LQkJCQkJCQkgcG9ydF9pZGVudGlmaWVyKHBvcnQpKTsKPj4gKwljZWNfZmlsbF9jb25uX2luZm9f
ZnJvbV9kcm0oJmNvbm5faW5mbywgY29ubmVjdG9yKTsKPj4gKwo+PiArCWludGVsX2hkbWktPmNl
Y19ub3RpZmllciA9Cj4+ICsJCWNlY19ub3RpZmllcl9jb25uX3JlZ2lzdGVyKGRldi0+ZGV2LCBw
b3J0X2lkZW50aWZpZXIocG9ydCksCj4+ICsJCQkJCSAgICZjb25uX2luZm8pOwo+PiAgCWlmICgh
aW50ZWxfaGRtaS0+Y2VjX25vdGlmaWVyKQo+PiAgCQlEUk1fREVCVUdfS01TKCJDRUMgbm90aWZp
ZXIgZ2V0IGZhaWxlZFxuIik7Cj4+ICB9Cj4+Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
