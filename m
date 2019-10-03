Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F09CA085
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 16:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847CA6EA01;
	Thu,  3 Oct 2019 14:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF776EA01;
 Thu,  3 Oct 2019 14:42:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 07:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; d="scan'208";a="343683672"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga004.jf.intel.com with ESMTP; 03 Oct 2019 07:42:36 -0700
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 3 Oct 2019 07:42:35 -0700
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.84]) by
 fmsmsx111.amr.corp.intel.com ([169.254.12.246]) with mapi id 14.03.0439.000;
 Thu, 3 Oct 2019 07:42:35 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v3] dma-fence: Serialise signal enabling
 (dma_fence_enable_sw_signaling)
Thread-Topic: [Intel-gfx] [PATCH v3] dma-fence: Serialise signal enabling
 (dma_fence_enable_sw_signaling)
Thread-Index: AQHVee3mL9xC85iAXUGxFpFx/f/amKdI83UQgAB48YD//5DioA==
Date: Thu, 3 Oct 2019 14:42:35 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663D9C02A2D@fmsmsx107.amr.corp.intel.com>
References: <20191003093639.10186-2-chris@chris-wilson.co.uk>
 <20191003132422.32730-1-chris@chris-wilson.co.uk>
 <14063C7AD467DE4B82DEDB5C278E8663D9C0292F@fmsmsx107.amr.corp.intel.com>
 <157011232171.2173.4977692617014194927@skylake-alporthouse-com>
In-Reply-To: <157011232171.2173.4977692617014194927@skylake-alporthouse-com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjAzMDExNGQtNDM0OC00ZGQxLTljNjMtMDU5YmY1YTYwMjhhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieFk4UVBPOFdna3ppRUFPdHZqczB2eWl5dGI4UnBxNEk4Szd1N0puRStkV01WcituVzVuckMxM3Ria2c0UTBrdSJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.108]
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQ2hyaXMgV2lsc29uIFttYWlsdG86
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrXQ0KPlNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDMsIDIw
MTkgMTA6MTkgQU0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRlbC5j
b20+OyBpbnRlbC0NCj5nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJqZWN0OiBSRTogW0ludGVsLWdmeF0gW1BBVENIIHYz
XSBkbWEtZmVuY2U6IFNlcmlhbGlzZSBzaWduYWwgZW5hYmxpbmcNCj4oZG1hX2ZlbmNlX2VuYWJs
ZV9zd19zaWduYWxpbmcpDQo+DQo+UXVvdGluZyBSdWhsLCBNaWNoYWVsIEogKDIwMTktMTAtMDMg
MTU6MTI6MzgpDQo+PiA+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+ID5Gcm9tOiBJbnRl
bC1nZnggW21haWx0bzppbnRlbC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9u
IEJlaGFsZg0KPk9mDQo+PiA+Q2hyaXMgV2lsc29uDQo+PiA+U2VudDogVGh1cnNkYXksIE9jdG9i
ZXIgMywgMjAxOSA5OjI0IEFNDQo+PiA+VG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4+ID5DYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gPlN1YmplY3Q6
IFtJbnRlbC1nZnhdIFtQQVRDSCB2M10gZG1hLWZlbmNlOiBTZXJpYWxpc2Ugc2lnbmFsIGVuYWJs
aW5nDQo+PiA+KGRtYV9mZW5jZV9lbmFibGVfc3dfc2lnbmFsaW5nKQ0KPj4gPg0KPj4gPk1ha2Ug
ZG1hX2ZlbmNlX2VuYWJsZV9zd19zaWduYWxpbmcoKSBiZWhhdmUgbGlrZSBpdHMNCj4+ID5kbWFf
ZmVuY2VfYWRkX2NhbGxiYWNrKCkgYW5kIGRtYV9mZW5jZV9kZWZhdWx0X3dhaXQoKSBjb3VudGVy
cGFydHMNCj5hbmQNCj4+ID5wZXJmb3JtIHRoZSB0ZXN0IHRvIGVuYWJsZSBzaWduYWxpbmcgdW5k
ZXIgdGhlIGZlbmNlLT5sb2NrLCBhbG9uZyB3aXRoDQo+PiA+dGhlIGFjdGlvbiB0byBkbyBzby4g
VGhpcyBlbnN1cmUgdGhhdCBzaG91bGQgYW4gaW1wbGVtZW50YXRpb24gYmUgdHJ5aW5nDQo+PiA+
dG8gZmx1c2ggdGhlIGNiX2xpc3QgKGJ5IHNpZ25hbGluZykgb24gcmV0aXJlbWVudCBiZWZvcmUg
ZnJlZWluZyB0aGUNCj4+ID5mZW5jZSwgaXQgY2FuIGRvIHNvIGluIGEgcmFjZS1mcmVlIG1hbm5l
ci4NCj4+ID4NCj4+ID5TZWUgYWxzbyAwZmM4OWI2ODAyYmEgKCJkbWEtZmVuY2U6IFNpbXBseSB3
cmFwDQo+ZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQNCj4+ID53aXRoIGRtYV9mZW5jZV9zaWduYWwi
KS4NCj4+ID4NCj4+ID52MjogUmVmYWN0b3IgYWxsIDMgZW5hYmxlX3NpZ25hbGluZyBwYXRocyB0
byB1c2UgYSBjb21tb24gZnVuY3Rpb24uDQo+PiA+DQo+PiA+U2lnbmVkLW9mZi1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+PiA+LS0tDQo+PiA+UmV0dXJuIGZh
bHNlIGZvciAiY291bGQgbm90IF9lbmFibGVfIHNpZ25hbGluZyBhcyBpdCB3YXMgYWxyZWFkeQ0K
Pj4gPnNpZ25hbGVkIg0KPj4gPi0tLQ0KPj4gPiBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMg
fCA3OCArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiA+IDEgZmlsZSBj
aGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkNCj4+ID4NCj4+ID5kaWZm
IC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jIGIvZHJpdmVycy9kbWEtYnVmL2Rt
YS1mZW5jZS5jDQo+PiA+aW5kZXggMmMxMzZhZWUzZTc5Li5iNTg1MjhjMWNjOWQgMTAwNjQ0DQo+
PiA+LS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jDQo+PiA+KysrIGIvZHJpdmVycy9k
bWEtYnVmL2RtYS1mZW5jZS5jDQo+PiA+QEAgLTI3Myw2ICsyNzMsMzAgQEAgdm9pZCBkbWFfZmVu
Y2VfZnJlZShzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkNCj4+ID4gfQ0KPj4gPiBFWFBPUlRfU1lN
Qk9MKGRtYV9mZW5jZV9mcmVlKTsNCj4+ID4NCj4+ID4rc3RhdGljIGJvb2wgX19kbWFfZmVuY2Vf
ZW5hYmxlX3NpZ25hbGluZyhzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkNCj4+ID4rew0KPj4gPisg
ICAgICBib29sIHdhc19zZXQ7DQo+PiA+Kw0KPj4gPisgICAgICBsb2NrZGVwX2Fzc2VydF9oZWxk
KGZlbmNlLT5sb2NrKTsNCj4+DQo+PiBXaXRoIHRoaXMgaGVsZC4uLg0KPj4NCj4+ID4rICAgICAg
d2FzX3NldCA9DQo+PiA+dGVzdF9hbmRfc2V0X2JpdChETUFfRkVOQ0VfRkxBR19FTkFCTEVfU0lH
TkFMX0JJVCwNCj4+ID4rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmZlbmNlLT5m
bGFncyk7DQo+PiA+Kw0KPj4gPisgICAgICBpZiAodGVzdF9iaXQoRE1BX0ZFTkNFX0ZMQUdfU0lH
TkFMRURfQklULCAmZmVuY2UtPmZsYWdzKSkNCj4+ID4rICAgICAgICAgICAgICByZXR1cm4gZmFs
c2U7DQo+Pg0KPj4gV291bGQgbWFraW5nIHRoZXNlIHRoZSBub24tYXRvbWljIHZlcnNpb25zIGJl
IHVzZWZ1bCAoYW5kL29yDQo+cmVhc29uYWJsZSk/DQo+DQo+VGhhdCBkZXBlbmRzIG9uIGFsbCBt
b2RpZmljYXRpb25zIHRvIHRoZSBkd29yZCAobm90IGp1c3QgdGhlIGJpdCkgYmVpbmcNCj5zZXJp
YWxpc2VkIGJ5IHRoZSBzYW1lIGxvY2sgKG9yIG90aGVyd2lzZSBndWFyYW50ZWVkIHRvIGJlIHNl
cmlhbCBhbmQNCj5jb2hlcmVudCksIHdoaWNoIGFzIFR2cnRrbyByZWRpc2NvdmVyZWQgaXMgbm90
IHRoZSBjYXNlLiBkbWFfZmVuY2UuZmxhZ3MNCj5pcyBhbHNvIGhvbWUgdG8gYSBudW1iZXIgb2Yg
dXNlciBmbGFncy4NCg0KQWggZ290IGl0Lg0KDQpJbiB0aGUgZnV0dXJlLCBJICB3aWxsIHRoaW5r
IGEgYml0IG91dHNpZGUgdGhlIHBhdGNoLiAgKHNvcnJ5IGZvciB0aGUgcHVuLi4uKQ0KDQpUaGFu
a3MsDQoNCk1pa2UNCg0KPi1DaHJpcw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
