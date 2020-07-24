Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8769522D22B
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jul 2020 01:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5948E6EA47;
	Fri, 24 Jul 2020 23:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413E66EA46;
 Fri, 24 Jul 2020 23:26:08 +0000 (UTC)
IronPort-SDR: K+WXDKC1jud7fWtmd8uZaEPYMfu6fVeCuMuFcrGVwrxtSwMu/+SFzMG3BpwDLJzvDmwmGCE7Fc
 80V2CWzcViWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9692"; a="130872589"
X-IronPort-AV: E=Sophos;i="5.75,392,1589266800"; d="scan'208";a="130872589"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2020 16:26:07 -0700
IronPort-SDR: /VcK5AY4ZCwhXLP8+UsnWkhVjhgo54XEziGKU4F73O39YkOiUHcPQXV3cn0SjzhTu5k3GsFaY1
 tWlMF2u0mOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,392,1589266800"; d="scan'208";a="363510284"
Received: from przanoni-mobl.amr.corp.intel.com ([10.255.228.246])
 by orsmga001.jf.intel.com with ESMTP; 24 Jul 2020 16:26:06 -0700
Message-ID: <9e43a819525424c36438329222fa1a3946c57c89.camel@intel.com>
Subject: Re: [PATCH v5 0/5] Asynchronous flip implementation for i915
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
To: Karthik B S <karthik.b.s@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 24 Jul 2020 16:26:06 -0700
In-Reply-To: <20200720113117.16131-1-karthik.b.s@intel.com>
References: <20200720113117.16131-1-karthik.b.s@intel.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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
Cc: dri-devel@lists.freedesktop.org, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, daniel.vetter@intel.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gc2VnLCAyMDIwLTA3LTIwIMOgcyAxNzowMSArMDUzMCwgS2FydGhpayBCIFMgZXNjcmV2ZXU6
Cj4gV2l0aG91dCBhc3luYyBmbGlwIHN1cHBvcnQgaW4gdGhlIGtlcm5lbCwgZnVsbHNjcmVlbiBh
cHBzIHdoZXJlIGdhbWUKPiByZXNvbHV0aW9uIGlzIGVxdWFsIHRvIHRoZSBzY3JlZW4gcmVzb2x1
dGlvbiwgbXVzdCBwZXJmb3JtIGFuIGV4dHJhIGJsaXQKPiBwZXIgZnJhbWUgcHJpb3IgdG8gZmxp
cHBpbmcuCj4gCj4gQXN5bmNocm9ub3VzIHBhZ2UgZmxpcHMgd2lsbCBhbHNvIGJvb3N0IHRoZSBG
UFMgb2YgTWVzYSBiZW5jaG1hcmtzLgoKV2UgaGFkIGEgZGlzY3Vzc2lvbiBpbiBwYXRjaCAxIG9m
IHYzIHJlZ2FyZGluZyB0aGUgc2VtYW50aWNzIG9mCmFzeW5jaHJvbm91cyBmbGlwcyBmcm9tIHRo
ZSBwb2ludCBvZiB2aWV3IG9mIHRoZSB1c2VyIHNwYWNlOiBob3cgd2UKaGFuZGxlIG91ciB2Ymxh
bmsgY291bnRlcnMsIGhvdy93aGVuIHdlIGluY3JlbWVudCB0aGUgc2VxdWVuY2UgZXZlbnRzCmFu
ZCBob3cgd2UgaGFuZGxlIHRpbWVzdGFtcHMsIGhvdy93aGVuIHdlIGRlbGl2ZXIgdmJsYW5rIGV2
ZW50cy4gU2luY2UKYXBwYXJlbnRseSBBTUQgaGFzIGFscmVhZHkgZW5hYmxlZCB0aGlzIGZlYXR1
cmUsIG91ciBqb2Igd291bGQgYmUgdG8KaW1wbGVtZW50IHRoZWlyIGN1cnJlbnQgYmVoYXZpb3Ig
c28gS01TIGNsaWVudHMgY2FuIGNvbnRpbnVlIHRvIHdvcmsKcmVnYXJkbGVzcyBvZiB0aGUgZHJp
dmVyLiAKCkZyb20gcmVhZGluZyB0aGlzIHNlcmllcyBpdCdzIG5vdCBzdXBlciBjbGVhciB0byBt
ZSB3aGF0IGV4YWN0bHkgaXMgdGhlCmJlaGF2aW9yIHRoYXQgd2UncmUgdHJ5aW5nIHRvIGZvbGxv
dy4gQ2FuIHlvdSBwbGVhc2UgZG9jdW1lbnQgc29tZXdoZXJlCndoYXQgYXJlIHRoZXNlIHJ1bGVz
IGFuZCBleHBlY3RhdGlvbnM/IFRoaXMgd2F5LCBwZW9wbGUgd3JpdGluZyB1c2VyCnNwYWNlIGNv
ZGUgKG9yIHBlb3BsZSBpbXByb3ZpbmcgdGhlIG90aGVyIGRyaXZlcnMpIHdpbGwgaGF2ZSBhbiBl
YXNpZXIKdGltZS4gSW4gYWRkaXRpb24gdG8gdGV4dCBkb2N1bWVudGF0aW9uLCBJIGJlbGlldmUg
YWxsIG91ciBhc3N1bXB0aW9ucwphbmQgcnVsZXMgc2hvdWxkIGJlIGNvZGVkIGluIElHVDogd2Ug
d2FudCB0byBiZSBjb25maWRlbnQgYSBkcml2ZXIKaW1wbGVtZW50cyBhc3luYyBwYWdlIGZsaXBz
IGNvcnJlY3RseSB3aGVuIHdlIGNhbiB2ZXJpZnkgaXQgcGFzc2VzIHRoZQpJR1QuCgpBbHNvLCBp
biB0aGUgb3RoZXIgcGF0Y2hlcyBJIHJhaXNlIHNvbWUgYWRkaXRpb25hbCBxdWVzdGlvbnMgcmVn
YXJkaW5nCm1peGluZyBhc3luYyB3aXRoIG5vbi1hc3luYyB2YmxhbmtzOiBJTUhPIHRoaXMgc2hv
dWxkIGFsc28gYmUKZG9jdW1lbnRlZCBhcyB0ZXh0IGFuZCBhcyBJR1QuCgo+IAo+IHYyOiAtRmV3
IHBhdGNoZXMgaGF2ZSBiZWVuIHNxdWFzaGVkIGFuZCBwYXRjaGVzIGhhdmUgYmVlbiBzaHVmZmxl
ZCBhcwo+ICAgICAgcGVyIHRoZSByZXZpZXdzIG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uLgo+IAo+
IHYzOiAtRmV3IHBhdGNoZXMgaGF2ZSBiZWVuIHNxdWFzaGVkIGFuZCBwYXRjaGVzIGhhdmUgYmVl
biBzaHVmZmxlZCBhcwo+ICAgICAgcGVyIHRoZSByZXZpZXdzIG9uIHRoZSBwcmV2aW91cyB2ZXJz
aW9uLgo+IAo+IHY0OiAtTWFkZSBjaGFuZ2VzIHRvIGZpeCB0aGUgc2VxdWVuY2UgYW5kIHRpbWUg
c3RhbXAgaXNzdWUgYXMgcGVyIHRoZQo+ICAgICAgY29tbWVudHMgcmVjZWl2ZWQgb24gdGhlIHBy
ZXZpb3VzIHZlcnNpb24uCj4gICAgIC1UaW1lc3RhbXBzIGFyZSBjYWxjdWxhdGVkIHVzaW5nIHRo
ZSBmbGlwIGRvbmUgdGltZSBzdGFtcCBhbmQgY3VycmVudAo+ICAgICAgdGltZXN0YW1wLiBIZXJl
IEk5MTVfTU9ERV9GTEFHX0dFVF9TQ0FOTElORV9GUk9NX1RJTUVTVEFNUCBmbGFnIGlzIHVzZWQK
PiAgICAgIGZvciB0aW1lc3RhbXAgY2FsY3VsYXRpb25zLgo+ICAgICAtRXZlbnQgaXMgc2VudCBm
cm9tIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciBpbW1lZGlhdGVseSB1c2luZyB0aGlzCj4gICAgICB1
cGRhdGVkIHRpbWVzdGFtcHMgYW5kIHNlcXVlbmNlLgo+ICAgICAtQWRkZWQgbW9yZSBzdGF0ZSBj
aGVja3MgYXMgYXN5bmMgZmxpcCBzaG91bGQgb25seSBhbGxvdyBjaGFuZ2UgaW4gcGxhbmUKPiAg
ICAgIHN1cmZhY2UgYWRkcmVzcyBhbmQgbm90aGluZyBlbHNlIHNob3VsZCBiZSBhbGxvd2VkIHRv
IGNoYW5nZS4KPiAgICAgLUFkZGVkIGEgc2VwYXJhdGUgcGxhbmUgaG9vayBmb3IgYXN5bmMgZmxp
cC4KPiAgICAgLU5lZWQgdG8gZmluZCBhIHdheSB0byByZWplY3QgZmJjIGVuYWJsaW5nIGlmIGl0
IGNvbWVzIGFzIHBhcnQgb2YgdGhpcwo+ICAgICAgZmxpcCBhcyBic3BlYyBzdGF0ZXMgdGhhdCBj
aGFuZ2VzIHRvIEZCQyBhcmUgbm90IGFsbG93ZWQuCj4gCj4gdjU6IC1GaXhlZCB0aGUgQ2hlY2tw
YXRjaCBhbmQgc3BhcnNlIHdhcm5pbmdzLgo+IAo+IEthcnRoaWsgQiBTICg1KToKPiAgIGRybS9p
OTE1OiBBZGQgZW5hYmxlL2Rpc2FibGUgZmxpcCBkb25lIGFuZCBmbGlwIGRvbmUgaGFuZGxlcgo+
ICAgZHJtL2k5MTU6IEFkZCBzdXBwb3J0IGZvciBhc3luYyBmbGlwcyBpbiBJOTE1Cj4gICBkcm0v
aTkxNTogQWRkIGNoZWNrcyBzcGVjaWZpYyB0byBhc3luYyBmbGlwcwo+ICAgZHJtL2k5MTU6IERv
IG5vdCBjYWxsIGRybV9jcnRjX2FybV92YmxhbmtfZXZlbnQgaW4gYXN5bmMgZmxpcHMKPiAgIGRy
bS9pOTE1OiBFbmFibGUgYXN5bmMgZmxpcHMgaW4gaTkxNQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDEyMyArKysrKysrKysrKysrKysrKysrCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRlLmMgIHwgIDMzICsrKyst
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMgICAgICAgICAgICAgIHwgIDgzICsr
KysrKysrKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuaCAgICAgICAgICAg
ICAgfCAgIDIgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICAgICAgICAgICAg
ICB8ICAgNSArLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDIzNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
