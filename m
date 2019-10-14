Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28028D6FF5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F8F6E60D;
	Tue, 15 Oct 2019 07:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75FD6E124
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 07:51:33 +0000 (UTC)
Received: from [IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d]
 ([IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id Jv8ZiFGrCop0AJv8aicxLH; Mon, 14 Oct 2019 09:51:32 +0200
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
 <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl> <20190828093820.GE2917@ulmo>
 <2eed5ed3-85f3-4c19-4dd2-3d8432829c2a@xs4all.nl>
 <20190828115400.GA30919@ulmo>
 <3f7fe51a-8958-a425-f5fd-01df5301d6b2@xs4all.nl>
Message-ID: <cf936882-155c-90d3-2a10-728699392c6d@xs4all.nl>
Date: Mon, 14 Oct 2019 09:51:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3f7fe51a-8958-a425-f5fd-01df5301d6b2@xs4all.nl>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGbuU7DDL7KyVME5FwCzYOw1TzZkGOvsTJjVw3Y0FGCy76Zxyq86vy8M0cacjLOF97XRpO5TyMuyREZUqJ1gvYIVTn3BkMk8NgDLygSg5pLmNj0uLZHI
 zn0hiVOQwcHxc9kGe1rNGatQhAvo8quCB0MSphrw4m1sOAzkavW2DGhyAIXnLrAPSzw2TJeKzGiOJtsTN/0aE0BHgfSLoKH98o7Vqp56Ww3482ioh5a2HD8R
 1fFPY20AX8HLdSqMwybPLfyXeWhvm2ZmKB/HsSbGI/jDJ3qjxSUy8n6UTMUGZRzEP1shWNNJEBUaE5vvOu3C7v6q7f0CTaH804/+4+BbujVv3NCf1zYWM1Lg
 dOPGrU3pxHJIW8g9+Vk+UtUVJ5QaVZUmgppcn8WZjti3uZ54pf6aCwJmWcM6wkIcpmttTPPB0/lT0HBN3kmFuwGdDeoAh/1rWePMcnqWbfOz8naI7geFIdYz
 tTKLc++ubZgOMQuqhU5nri+CbdSKDH6o4H2QfQTasmug1a7YYdLfl1tzsr7P4gbH2XvQixfvpgHC3F+USUk8icIahPy3Hzuhzvv08g==
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Dariusz Marcinkiewicz <darekm@google.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpZXJyeSwKCkFub3RoZXIgcmVtaW5kZXIgOi0pCgpJZiB5b3Ugd2FudCBtZSB0byBkbyB0aGlz
LCB0aGVuIGp1c3QgbGV0IG1lIGtub3chCgpSZWdhcmRzLAoKCUhhbnMKCk9uIDEwLzQvMTkgMTA6
NDggQU0sIEhhbnMgVmVya3VpbCB3cm90ZToKPiBIaSBUaGllcnJ5LAo+IAo+IEp1c3QgYSByZW1p
bmRlcjogdGhpcyBwYXRjaCBoYXNuJ3QgYmVlbiBtZXJnZWQgeWV0IGZvciB2NS41Lgo+IAo+IFRo
YW5rcyEKPiAKPiAJSGFucwo+IAo+IE9uIDgvMjgvMTkgMTo1NCBQTSwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDEyOjA2OjM0UE0gKzAyMDAsIEhhbnMg
VmVya3VpbCB3cm90ZToKPj4+IE9uIDgvMjgvMTkgMTE6MzggQU0sIFRoaWVycnkgUmVkaW5nIHdy
b3RlOgo+Pj4+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDEwOjA5OjMwQU0gKzAyMDAsIEhhbnMg
VmVya3VpbCB3cm90ZToKPj4+Pj4gVGhpZXJyeSwKPj4+Pj4KPj4+Pj4gQ2FuIHlvdSByZXZpZXcg
dGhpcyBwYXRjaD8KPj4+Pj4KPj4+Pj4gVGhhbmtzIQo+Pj4+Pgo+Pj4+PiAJSGFucwo+Pj4+Cj4+
Pj4gRGlkIHlvdSB3YW50IG1lIHRvIHBpY2sgdGhpcyB1cCBpbnRvIHRoZSBkcm0vdGVncmEgdHJl
ZT8gT3IgZG8geW91IHdhbnQKPj4+PiB0byBwaWNrIGl0IHVwIGludG8geW91ciB0cmVlPwo+Pj4K
Pj4+IENhbiB5b3UgcGljayBpdCB1cCBmb3IgdGhlIG5leHQgY3ljbGU/IEFzIHlvdSBtZW50aW9u
ZWQsIHdlIG1pc3NlZCB0aGUKPj4+IGRlYWRsaW5lIGZvciA1LjQsIHNvIHRoaXMgZmVhdHVyZSB3
b24ndCBiZSBlbmFibGVkIGluIHRoZSBwdWJsaWMgQ0VDIEFQSQo+Pj4gdW50aWwgNS41Lgo+Pj4K
Pj4+IFRoYW5rcyEKPj4KPj4gU3VyZSwgd2lsbCBkby4KPj4KPj4gVGhpZXJyeQo+Pgo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
