Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D31980EA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 18:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F26893D5;
	Mon, 30 Mar 2020 16:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E366893D5;
 Mon, 30 Mar 2020 16:22:54 +0000 (UTC)
IronPort-SDR: CbD7V8m7csZ0BHsjOfoKDWq8Bm2JfAsr20VpdKNT7HTp/oWn3w2uoaAq8U1s1YtzL0E5RoaWAL
 Wrs1m/o3x08A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 09:22:39 -0700
IronPort-SDR: p0KNu+EpveAAQrD2AGJ+IuzIhxL019kBbIDENElC0nNRXzgafz6NbOiUtt1khOkiNgI1jUVu48
 3iMHHTLHQbig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; d="scan'208";a="248753824"
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
 by orsmga003.jf.intel.com with ESMTP; 30 Mar 2020 09:22:37 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx105.ger.corp.intel.com (163.33.3.28) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 30 Mar 2020 17:22:36 +0100
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Mar 2020 17:22:36 +0100
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138]) by
 IRSMSX605.ger.corp.intel.com ([163.33.146.138]) with mapi id 15.01.1713.004;
 Mon, 30 Mar 2020 17:22:36 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 05/18] video/hdmi: Add Unpack only function
 for DRM infoframe
Thread-Topic: [Intel-gfx] [PATCH v7 05/18] video/hdmi: Add Unpack only
 function for DRM infoframe
Thread-Index: AQHV4K+D4GGLpaNfYkqvNBu0B8JWuahRj9KAgAAFOoCAAAcUgIAKtSmAgABblwCABOAcgA==
Date: Mon, 30 Mar 2020 16:22:36 +0000
Message-ID: <ca98f0999efa1b7db4f1b5116a13611241976308.camel@intel.com>
References: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
 <20200211074657.231405-6-gwan-gyeong.mun@intel.com>
 <87k13fcm8w.fsf@intel.com> <87h7yjcldq.fsf@intel.com>
 <20200320115737.GF5193@pendragon.ideasonboard.com>
 <2dd87897a2c1dea8d882141823ed1ca1206ec01c.camel@intel.com>
 <20200327125626.GE13686@intel.com>
In-Reply-To: <20200327125626.GE13686@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.1.242]
Content-ID: <A4A323BA1E64E54BB440AD138D173C74@intel.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIwLTAzLTI3IGF0IDE0OjU2ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDA3OjI3OjU2QU0gKzAwMDAsIE11biwgR3dhbi1n
eWVvbmcgd3JvdGU6DQo+ID4gT24gRnJpLCAyMDIwLTAzLTIwIGF0IDEzOjU3ICswMjAwLCBMYXVy
ZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+ID4gSGkgSmFuaSwNCj4gPiA+IA0KPiA+ID4gT24gRnJp
LCBNYXIgMjAsIDIwMjAgYXQgMDE6MzI6MTdQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+
ID4gPiA+IE9uIEZyaSwgMjAgTWFyIDIwMjAsIEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51
eC5pbnRlbC5jb20+DQo+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+IE9uIFR1ZSwgMTEgRmViIDIw
MjAsIEd3YW4tZ3llb25nIE11biA8DQo+ID4gPiA+ID4gZ3dhbi1neWVvbmcubXVuQGludGVsLmNv
bT4NCj4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+IEl0IGFkZHMgYW4gdW5wYWNrIG9ubHkg
ZnVuY3Rpb24gZm9yIERSTSBpbmZvZnJhbWUgZm9yDQo+ID4gPiA+ID4gPiBkeW5hbWljDQo+ID4g
PiA+ID4gPiByYW5nZSBhbmQNCj4gPiA+ID4gPiA+IG1hc3RlcmluZyBpbmZvZnJhbWUgcmVhZG91
dC4NCj4gPiA+ID4gPiA+IEl0IHVucGFja3MgdGhlIGluZm9ybWF0aW9uIGRhdGEgYmxvY2sgY29u
dGFpbmVkIGluIHRoZQ0KPiA+ID4gPiA+ID4gYmluYXJ5DQo+ID4gPiA+ID4gPiBidWZmZXIgaW50
bw0KPiA+ID4gPiA+ID4gYSBzdHJ1Y3R1cmVkIGZyYW1lIG9mIHRoZSBIRE1JIER5bmFtaWMgUmFu
Z2UgYW5kIE1hc3RlcmluZw0KPiA+ID4gPiA+ID4gKERSTSkNCj4gPiA+ID4gPiA+IGluZm9ybWF0
aW9uIGZyYW1lLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBJbiBjb250cmFzdCB0byBoZG1p
X2RybV9pbmZvZnJhbWVfdW5wYWNrKCkgZnVuY3Rpb24sIGl0DQo+ID4gPiA+ID4gPiBkb2VzDQo+
ID4gPiA+ID4gPiBub3QgdmVyaWZ5DQo+ID4gPiA+ID4gPiBhIGNoZWNrc3VtLg0KPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiBJdCBjYW4gYmUgdXNlZCBmb3IgdW5wYWNraW5nIGEgRFAgSERSIE1l
dGFkYXRhIEluZm9mcmFtZQ0KPiA+ID4gPiA+ID4gU0RQDQo+ID4gPiA+ID4gPiBjYXNlLg0KPiA+
ID4gPiA+ID4gRFAgSERSIE1ldGFkYXRhIEluZm9mcmFtZSBTRFAgdXNlcyB0aGUgc2FtZSBEeW5h
bWljIFJhbmdlDQo+ID4gPiA+ID4gPiBhbmQNCj4gPiA+ID4gPiA+IE1hc3RlcmluZw0KPiA+ID4g
PiA+ID4gKERSTSkgaW5mb3JtYXRpb24gKENUQS04NjEtRyBzcGVjLikgc3VjaCBhcyBIRE1JIERS
TQ0KPiA+ID4gPiA+ID4gaW5mb2ZyYW1lLg0KPiA+ID4gPiA+ID4gQnV0IERQIFNEUCBoZWFkZXIg
YW5kIHBheWxvYWQgc3RydWN0dXJlIGFyZSBkaWZmZXJlbnQgZnJvbQ0KPiA+ID4gPiA+ID4gSERN
SQ0KPiA+ID4gPiA+ID4gRFJNDQo+ID4gPiA+ID4gPiBJbmZvZnJhbWUuIFRoZXJlZm9yZSB1bnBh
Y2tpbmcgRFJNIGluZm9mcmFtZSBmb3IgRFANCj4gPiA+ID4gPiA+IHJlcXVpcmVzDQo+ID4gPiA+
ID4gPiBza2lwcGluZyBvZg0KPiA+ID4gPiA+ID4gYSB2ZXJpZnlpbmcgY2hlY2tzdW0uDQo+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEd3YW4tZ3llb25nIE11biA8Z3dh
bi1neWVvbmcubXVuQGludGVsLmNvbT4NCj4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBVbWEgU2hh
bmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEJhcnRs
b21pZWosIGNhbiBJIGhhdmUgeW91ciBhY2sgZm9yIG1lcmdpbmcgdGhpcyB2aWEgZHJtLQ0KPiA+
ID4gPiA+IGludGVsDQo+ID4gPiA+ID4gYWxvbmcNCj4gPiA+ID4gPiB3aXRoIHRoZSByZXN0IG9m
IHRoZSBzZXJpZXMsIHBsZWFzZT8NCj4gPiA+ID4gDQo+ID4gPiA+IE9yIEhhbnMgb3IgTGF1cmVu
dCwgZnJvbSB2NGwvdmlkZW8gcG9pbnQgb2Ygdmlldy4NCj4gPiA+IA0KPiA+ID4gSSdtIG5vIGV4
cGVydCBvbiBJbmZvRnJhbWUsIEknbGwgb25seSBjb21tZW50IG9uIHRoZSBBUEkgYmVsb3cuDQo+
ID4gPiANCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gIGRyaXZlcnMvdmlkZW8vaGRtaS5j
IHwgNTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiA+ID4gPiA+IC0tLS0N
Cj4gPiA+ID4gPiA+IC0tLS0tLS0tDQo+ID4gPiA+ID4gPiAgaW5jbHVkZS9saW51eC9oZG1pLmgg
fCAgMiArKw0KPiA+ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwg
MTcgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpZGVvL2hkbWkuYyBiL2RyaXZlcnMvdmlkZW8vaGRtaS5jDQo+ID4gPiA+ID4gPiBp
bmRleCA5YzgyZTJhMGE0MTEuLjk4MTg4MzZkODJiNyAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vaGRtaS5jDQo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3ZpZGVvL2hk
bWkuYw0KPiA+ID4gPiA+ID4gQEAgLTE3NzUsMjAgKzE3NzUsMTggQEANCj4gPiA+ID4gPiA+IGhk
bWlfdmVuZG9yX2FueV9pbmZvZnJhbWVfdW5wYWNrKHVuaW9uDQo+ID4gPiA+ID4gPiBoZG1pX3Zl
bmRvcl9hbnlfaW5mb2ZyYW1lICpmcmFtZSwNCj4gPiA+ID4gPiA+ICB9DQo+ID4gPiA+ID4gPiAg
DQo+ID4gPiA+ID4gPiAgLyoqDQo+ID4gPiA+ID4gPiAtICogaGRtaV9kcm1faW5mb2ZyYW1lX3Vu
cGFjaygpIC0gdW5wYWNrIGJpbmFyeSBidWZmZXIgdG8gYQ0KPiA+ID4gPiA+ID4gSERNSSBEUk0g
aW5mb2ZyYW1lDQo+ID4gPiA+ID4gPiArICogaGRtaV9kcm1faW5mb2ZyYW1lX3VucGFja19vbmx5
KCkgLSB1bnBhY2sgYmluYXJ5IGJ1ZmZlcg0KPiA+ID4gPiA+ID4gdG8NCj4gPiA+ID4gPiA+IGEg
SERNSSBEUk0gaW5mb2ZyYW1lDQo+ID4gPiA+ID4gPiAgICogQGZyYW1lOiBIRE1JIERSTSBpbmZv
ZnJhbWUNCj4gPiA+ID4gPiA+ICAgKiBAYnVmZmVyOiBzb3VyY2UgYnVmZmVyDQo+ID4gPiA+ID4g
PiAgICogQHNpemU6IHNpemUgb2YgYnVmZmVyDQo+ID4gPiA+ID4gPiAgICoNCj4gPiA+ID4gPiA+
IC0gKiBVbnBhY2tzIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gYmluYXJ5IEBidWZmZXIN
Cj4gPiA+ID4gPiA+IGludG8gYQ0KPiA+ID4gPiA+ID4gc3RydWN0dXJlZA0KPiA+ID4gPiA+ID4g
KyAqIFVucGFja3MgdGhlIGluZm9ybWF0aW9uIGRhdGEgYmxvY2sgY29udGFpbmVkIGluIGJpbmFy
eQ0KPiA+ID4gPiA+ID4gQGJ1ZmZlciBpbnRvIGEgc3RydWN0dXJlZA0KPiA+ID4gDQo+ID4gPiBM
aW5lIHdyYXAgcGxlYXNlLg0KPiA+ID4gDQo+ID4gPiBUaGlzIG5lZWRzIHRvIGJlIGNsYXJpZmll
ZCB0byBleHBsYWluIGV4YWN0bHkgd2hhdCB0aGUgYnVmZmVyDQo+ID4gPiBwb2ludHMNCj4gPiA+
IHRvLg0KPiA+ID4gDQo+ID4gT2theSBJJ2xsIHVwZGF0ZSBjbGVhciBjb21tZW50cyBuZXh0IHZl
cnNpb24uDQo+ID4gPiBBbHNvLCBhcyB0aGlzIGlzIGFwcGxpY2FibGUgdG8gRFAgdG9vLCBzaG91
bGRuJ3Qgd2UgZHJvcCB0aGUNCj4gPiA+IGhkbWlfDQo+ID4gPiBwcmVmaXggPyBJcyB0aGVyZSBh
bm90aGVyIHByZWZpeCB0aGF0IGNvdWxkIGJlIHVzZWQgZm9yIGZ1bmN0aW9ucw0KPiA+ID4gdGhh
dA0KPiA+ID4gYXJlIGFwcGxpY2F0aW9uIHRvIGluZm9mcmFtZSBoYW5kbGluZyBzaGFyZWQgYnkg
ZGlmZmVyZW50IGRpc3BsYXkNCj4gPiA+IGludGVyZmFjZXMgPyBBIGJpdCBvZiByZWZhY3Rvcmlu
ZyB3b3VsZCBoZWxwIG1ha2luZyBhbGwgdGhpcw0KPiA+ID4gY2xlYXIuDQo+ID4gPiANCj4gPiBC
b3RoIERQIGFuZCBIRE1JIHVzZSBDVEEtODYxLUcgc3BlYyBmb3IgRFJNIGluZm9mcmFtZS4gSSds
bCB1cGRhdGUNCj4gPiBwcmVmaXggd2l0aCBjdGFfIGluc3RlYWQgb2YgaGRtaV8uDQo+IA0KPiBN
b3N0IG9mIHZpZGVvL2hkbWkuYyBpcyBmcm9tIHRoZSBDVEEgc3BlYyhzKS4gVGhlIG5hbWUgaXMg
anVzdCBhDQo+IG5hbWUuDQo+IExldCdzIG5vdCBzdGFydCBtYWtpbmcgaXQgaW5jb25zaXN0ZW50
IGp1c3QgZm9yIHRoaXMgb25lIGNhc2UuDQo+IA0KSGkgVmlsbGUsIHRoYW5rIHlvdSBmb3IgZ2l2
aW5nIG1lIHlvdXIgb3Bpbmlvbi4NCkFuZCBJIGFncmVlIHdpdGggeW91ciBvcGluaW9uLg0KSSds
bCB1cGRhdGUgZGV0YWlsZWQgY29tbWVudHMgd2l0aCBjb25zaXN0ZW50IEFQSSBuYW1pbmdzLg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
