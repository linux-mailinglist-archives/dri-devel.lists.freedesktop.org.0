Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A49C5340931
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 16:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D08F6E0ED;
	Thu, 18 Mar 2021 15:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2162E6E0ED;
 Thu, 18 Mar 2021 15:52:06 +0000 (UTC)
IronPort-SDR: G1xd6/1MI9qX6ySdefBUNB+wxxhKIGx5Tirk1BXTlGSVQH4uS+ForqWL1ZdnyU4f07fS0BJ3Qk
 EjSvrcxgR7bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="209712162"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="209712162"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 08:52:04 -0700
IronPort-SDR: r/yDh+WHkJ9Ctsj2zrcc2YdXkfBJXCsqurWjSwexYRP/fwwco522aj/xSzH4glDlkWH92GGicP
 jSkoMYSQwDGA==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="389287860"
Received: from pvolkovs-mobl1.ccr.corp.intel.com (HELO [10.252.35.198])
 ([10.252.35.198])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 08:52:01 -0700
Subject: Re: [PULL] drm-misc-fixes
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <a0e13bbb-6ba6-ff24-4db8-0e02e605de18@linux.intel.com>
 <CAKMK7uE_e5YqOUGfM4nvpRZTRnxBnyu-vCHveyDHCWBzqqmWfQ@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <50331627-793c-f09f-5972-236c2f342ba3@linux.intel.com>
Date: Thu, 18 Mar 2021 16:51:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE_e5YqOUGfM4nvpRZTRnxBnyu-vCHveyDHCWBzqqmWfQ@mail.gmail.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMTgtMDMtMjAyMSBvbSAxMzozMSBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gT24gVGh1LCBN
YXIgMTgsIDIwMjEgYXQgMTI6MzMgUE0gTWFhcnRlbiBMYW5raG9yc3QKPiA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPiB3cm90ZToKPj4gZHJtLW1pc2MtZml4ZXMtMjAyMS0wMy0x
ODoKPj4gZHJtLW1pc2MtZml4ZXMgZm9yIHY1LjEyLXJjNDoKPj4gLSBNYWtlIHR0bV9ib191bnBp
bigpIG5vdCB3cmFwYXJvdW5kIG9uIHRvbyBtYW55IHVucGlucy4KPj4gLSBGaXggY29jY2ljaGVj
ayB3YXJuaW5nIGluIG9tYXAuCj4gU3RpbGwgbWlzc2luZyB0aGUgMiBwYXRjaGVzIGZyb20gZHJt
LW1pc2MtbmV4dC1maXhlcywgYW5kIHRob3NlIGJlaW5nCj4gbGVmdCBvdXQgYWxzbyBtZWFucyBk
cm0tbWlzYy1uZXh0IGlzbid0IHB1c2hlZCB0byBmb3ItbGludXgtbmV4dAo+IGJyYW5jaCwgd2hp
Y2ggaXMgY2F1c2luZyBhIHRvbiBvZiBjb25mdXNpb24gaXRzZWxmLgo+IC1EYW5pZWwKCldlIGhh
ZCBhIGRpc2N1c3Npb24gb24gaXJjLCB0aG9zZSBwYXRjaGVzIHdlcmUgcGFydCBvZiB0aGUgcHJl
dmlvdXMgcHVsbC4KCkkndmUgcmVzZXQgZHJtLW1pc2MtbmV4dC1maXhlcyB0byB2NS4xMi1yYzEt
ZG9udHVzZSwgdG8gdW5wbHVnIGRybS1taXNjLW5leHQuCgo+PiBUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IGRlMDY2ZTExNjMwNmJhZjNhNmE2MjY5MWFjNjNjZmMwYjFkYWJkZGI6
Cj4+Cj4+ICAgZHJtL2NvbXBhdDogQ2xlYXIgYm91bmNlIHN0cnVjdHVyZXMgKDIwMjEtMDMtMTEg
MTE6MTE6MzMgKzAxMDApCj4+Cj4+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0Ogo+Pgo+PiAgIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYyB0
YWdzL2RybS1taXNjLWZpeGVzLTIwMjEtMDMtMTgKPj4KPj4gZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIDY5MDkxMTU0NDI3NTllZmVmM2Q0YmM1ZDljNTRkNzk0M2YxYWZjMTQ6Cj4+Cj4+
ICAgZHJtL29tYXA6IGRzaTogZml4IHVuc2lnbmVkIGV4cHJlc3Npb24gY29tcGFyZWQgd2l0aCB6
ZXJvICgyMDIxLTAzLTE3IDEzOjU5OjIzICswMjAwKQo+Pgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IGRybS1taXNj
LWZpeGVzIGZvciB2NS4xMi1yYzQ6Cj4+IC0gTWFrZSB0dG1fYm9fdW5waW4oKSBub3Qgd3JhcGFy
b3VuZCBvbiB0b28gbWFueSB1bnBpbnMuCj4+IC0gRml4IGNvY2NpY2hlY2sgd2FybmluZyBpbiBv
bWFwLgo+Pgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4+IENocmlzdGlhbiBLw7ZuaWcgKDEpOgo+PiAgICAgICBkcm0v
dHRtOiBtYWtlIHR0bV9ib191bnBpbiBtb3JlIGRlZmVuc2l2ZQo+Pgo+PiBKdW5saW4gWWFuZyAo
MSk6Cj4+ICAgICAgIGRybS9vbWFwOiBkc2k6IGZpeCB1bnNpZ25lZCBleHByZXNzaW9uIGNvbXBh
cmVkIHdpdGggemVybwo+Pgo+PiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jIHwg
NyArKysrLS0tCj4+ICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgICAgfCA2ICsrKyst
LQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
