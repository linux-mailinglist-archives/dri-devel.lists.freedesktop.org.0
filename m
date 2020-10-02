Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DC728160F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 17:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05186E0DE;
	Fri,  2 Oct 2020 15:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525736E0DE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 15:06:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id B58B429A1AF
Subject: Re: [PATCH v3 2/2] tty/sysrq: Add configurable handler to execute a
 compound action
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200818112825.6445-1-andrzej.p@collabora.com>
 <20200818112825.6445-3-andrzej.p@collabora.com>
 <20201002125429.GA3350322@kroah.com>
 <db7fe4ed-19a4-3303-a544-eb789badb8a1@collabora.com>
 <20201002140233.GB3475053@kroah.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <2031d74a-41df-d556-d5de-37f4b63ee30f@collabora.com>
Date: Fri, 2 Oct 2020 17:06:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002140233.GB3475053@kroah.com>
Content-Language: en-US
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
Cc: linux-input@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpXIGRuaXUgMDIuMTAuMjAyMCBvwqAxNjowMiwgR3JlZyBLcm9haC1IYXJ0bWFuIHBpc3pl
Ogo+IE9uIEZyaSwgT2N0IDAyLCAyMDIwIGF0IDAzOjQyOjUyUE0gKzAyMDAsIEFuZHJ6ZWogUGll
dHJhc2lld2ljeiB3cm90ZToKPj4gSGksCj4+Cj4+IFcgZG5pdSAwMi4xMC4yMDIwIG/CoDE0OjU0
LCBHcmVnIEtyb2FoLUhhcnRtYW4gcGlzemU6Cj4+PiBPbiBUdWUsIEF1ZyAxOCwgMjAyMCBhdCAw
MToyODoyNVBNICswMjAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6Cj4+Pj4gVXNlcmxh
bmQgbWlnaHQgd2FudCB0byBleGVjdXRlIGUuZy4gJ3cnIChzaG93IGJsb2NrZWQgdGFza3MpLCBm
b2xsb3dlZAo+Pj4+IGJ5ICdzJyAoc3luYyksIGZvbGxvd2VkIGJ5IDEwMDAgbXMgZGVsYXkgYW5k
IHRoZW4gZm9sbG93ZWQgYnkgJ2MnIChjcmFzaCkKPj4+PiB1cG9uIGEgc2luZ2xlIG1hZ2ljIFN5
c1JxLiBPciBvbmUgbWlnaHQgd2FudCB0byBleGVjdXRlIHRoZSBmYW1vdXMgIlJhaXNpbmcKPj4+
PiBFbGVwaGFudHMgSXMgU28gVXR0ZXJseSBCb3JpbmciIGFjdGlvbi4gVGhpcyBwYXRjaCBhZGRz
IGEgY29uZmlndXJhYmxlCj4+Pj4gaGFuZGxlciwgdHJpZ2dlcmVkIHdpdGggJ0MnLCBmb3IgdGhp
cyBleGFjdCBwdXJwb3NlLiBUaGUgdXNlciBzcGVjaWZpZXMgdGhlCj4+Pj4gY29tcG9zaXRpb24g
b2YgdGhlIGNvbXBvdW5kIGFjdGlvbiB1c2luZyBzeW50YXggc2ltaWxhciB0byBnZXRvcHQsIHdo
ZXJlCj4+Pj4gZWFjaCBsZXR0ZXIgY29ycmVzcG9uZHMgdG8gYW4gaW5kaXZpZHVhbCBhY3Rpb24g
YW5kIGEgY29sb24gZm9sbG93ZWQgYnkgYQo+Pj4+IG51bWJlciBjb3JyZXNwb25kcyB0byBhIGRl
bGF5IG9mIHRoYXQgbWFueSBtaWxsaXNlY29uZHMsIGUuZy46Cj4+Pj4KPj4+PiB3czoxMDAwYwo+
Pj4+Cj4+Pj4gb3IKPj4+Pgo+Pj4+IHI6MTAwZWlzOjEwMDB1Ygo+Pj4KPj4+IEEgbWFjcm8gbGFu
Z3VhZ2UgZm9yIHN5c3JxIGNvbW1hbmRzLCB3aG8gd291bGQgaGF2ZSB0aG91Z2h0Li4uCj4+Pgo+
Pj4gQW55d2F5LCBfd2h5XyB3b3VsZCB1c2VybGFuZCB3YW50IHRvIGRvIHNvbWV0aGluZyBzbyBj
cmF6eSBhcyB0aGlzPwo+Pj4gV2hhdCBpcyB0aGUgdXNlLWNhc2UgaGVyZT8KPj4+Cj4+Cj4+IEEg
dXNlLWNhc2UgaXMgQ2hyb21lYm9va3Mgd2hpY2ggZG8gd2FudCB0byBleGVjdXRlICd3JywgJ3Mn
LAo+PiB3YWl0IDEwMDBtcyBhbmQgdGhlbiAnYycgdW5kZXIgb25lIGtleSBjb21iaW5hdGlvbi4g
SGF2aW5nIHRoYXQgc3VwcG9ydGVkCj4+IHVwc3RyZWFtIGJyaW5ncyB1cyBvbmUgbGl0dGxlIHN0
ZXAgY2xvc2VyIHRvIHRob3NlIG1hY2hpbmVzIHJ1bm5pbmcKPj4gdXBzdHJlYW0ga2VybmVsLgo+
IAo+IFdobyBpcyBjYXVzaW5nIHRoYXQgdG8gImV4ZWN1dGUiPyAgU29tZSBkYWVtb24vcHJvZ3Jh
bT8KCk5vLCBhcyBmYXIgYXMgSSBrbm93IHRoZXkgcGF0Y2ggdGhlIGtlcm5lbCB0byBjaGFuZ2Ug
dGhlIGJlaGF2aW9yCm9mIFN5c3JxLXggY29tYmluYXRpb24sIHNvIHRoZSAiZXhlY3V0aW9uIiBp
cyB0cmlnZ2VyZWQgYnkgdGhlIHVzZXIuCgo+IAo+PiBBbm90aGVyIGFyZ3VtZW50IGZvciBzdWNo
IGEgIm1hY3JvIGxhbmd1YWdlIiBpcyB3aGVuIGEgbWFjaGluZSdzIHN5c3RlbQo+PiBrZWVwcyBk
ZWdyYWRpbmcgb3ZlciB0aW1lLCBwb3NzaWJseSBkZWdyYWRpbmcgKHJlbGF0aXZlbHkpIGZhc3Qu
Cj4+ICJSYWlzaW5nIEVsZXBoYW50cyBJcyBTbyBVdHRlcmx5IEJvcmluZyIgY29uc2lzdHMgb2Yg
NiBhY3Rpb25zLCBlYWNoCj4+IG9mIHdoaWNoIHJlcXVpcmVzIHByZXNzaW5nIHNldmVyYWwga2V5
cy4gVGhlIHVzZXIgbWlnaHQgYmUgdW5hYmxlCj4+IHRvIGNvbXBsZXRlIGFsbCB0aGUgNiBzdGVw
cywgd2hpbGUgYSAibWFjcm8iIHJlcXVpcmVzIHVzZXIncyBpbnZvbHZlbWVudAo+PiBmb3IgY2Fy
cnlpbmcgb3V0IGp1c3Qgb25lIHN0ZXAuCj4gCj4gU28geW91IHdhbnQgdG8gInByZWxvYWQiIHNv
bWUgY29tbWFuZHMgYWhlYWQgb2YgdGltZSwgZm9yIHdoZW4geW91IGdldAo+IGluIHRyb3VibGUK
SXQgY2FuIGJlIHNhaWQgdGhpcyB3YXksIHllcy4KCj4gCj4gVGhlc2Ugc2hvdWxkIGp1c3QgYmUg
ZGVidWdnaW5nIC8gbGFzdCByZXNvcnQgdHlwZXMgb2YgdGhpbmdzLCBob3cKPiByZWd1bGFyIGFy
ZSB0aGV5IGJlaW5nIHVzZWQgaW4geW91ciBzeXN0ZW1zPwo+IAoKVGhlICJSRUlTVUIiIGl0c2Vs
ZiBpcyBhIGtpbmQgb2YgYSBsYXN0IHJlc29ydCB0aGluZy4KCkl0IGlzIHRydWUgdGhhdCBpdCdz
IG5vdCBhIHZlcnkgZnJlcXVlbnQgc2l0dWF0aW9uLCBidXQgZG9lcyBpdHMgYmVpbmcgcmFyZQpw
cmVjbHVkZSBoYXZpbmcgc3VjaCBhIGZ1bmN0aW9uIGluIHRoZSBrZXJuZWw/CgpXaGlsZSBwcmVw
YXJpbmcgdGhpcyBwYXRjaCBJIHdhbnRlZCBpdCB0byBiZSBmbGV4aWJsZSwgYnV0IHBlcmhhcHMg
aXQgaXMKdG9vIGZsZXhpYmxlIGZvciBzb21lIHJlYXNvbj8gSWYgdGhlIHBlcm1pc3Npb25zIG9m
IHRoZSBtb2R1bGVfcGFyYW0ncwpzeXNmcyBlbnRyeSB3ZXJlIGNoYW5nZWQgdG8gMDQ0NCB3b3Vs
ZCBpdCBiZSBiZXR0ZXI/IFRoZW4gdGhlIGNvbXBvdW5kCmFjdGlvbiB3b3VsZCBzdGlsbCBiZSBj
b25maWd1cmFibGUgYnV0IG9ubHkgYXQgYm9vdCB0aW1lIHJhdGhlciB0aGFuIGF0CmJvb3QgdGlt
ZSBfYW5kXyBydW50aW1lLgoKUmVnYXJkcywKCkFuZHJ6ZWoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
