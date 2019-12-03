Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E310F96C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4476E6E3F7;
	Tue,  3 Dec 2019 08:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21D9A6E3B2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 07:02:08 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 03 Dec 2019 15:02:06 +0800
Received: from csbcas.internal.ite.com.tw (csbmail1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id xB3720BW051544;
 Tue, 3 Dec 2019 15:02:00 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from CSBMAIL1.internal.ite.com.tw (192.168.65.58) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Tue, 3 Dec 2019 15:01:59 +0800
Received: from CSBMAIL1.internal.ite.com.tw ([fe80::2cba:f37c:ac09:f33f]) by
 CSBMAIL1.internal.ite.com.tw ([fe80::2cba:f37c:ac09:f33f%22]) with mapi id
 15.01.1713.004; Tue, 3 Dec 2019 15:01:59 +0800
From: <allen.chen@ite.com.tw>
To: <jani.nikula@linux.intel.com>
Subject: RE: [PATCH] drm/edid: fixup EDID 1.3 and 1.4 judge reduced-blanking
 timings logic
Thread-Topic: [PATCH] drm/edid: fixup EDID 1.3 and 1.4 judge reduced-blanking
 timings logic
Thread-Index: AQHVpQ2LG/Dn409R7Eq+X4IR10TMhqen/hSg
Date: Tue, 3 Dec 2019 07:01:59 +0000
Message-ID: <e2486891920843798e9af97209464833@ite.com.tw>
References: <1574761572-26585-1-git-send-email-allen.chen@ite.com.tw>
 <87pnhdobns.fsf@intel.com>
In-Reply-To: <87pnhdobns.fsf@intel.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.70.14]
x-tm-snts-smtp: C5FDEED50984D5976BC00F76DCD7C9CA4BB429B6D5C31C1AD480C4B32479A1D42000:8
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw xB3720BW051544
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
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
Cc: Jau-Chih.Tseng@ite.com.tw, maxime.ripard@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, pihsun@chromium.org, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============1238877627=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1238877627==
Content-Language: zh-TW
Content-Type: multipart/related;
	boundary="_006_e2486891920843798e9af97209464833itecomtw_";
	type="multipart/alternative"

--_006_e2486891920843798e9af97209464833itecomtw_
Content-Type: multipart/alternative;
	boundary="_000_e2486891920843798e9af97209464833itecomtw_"

--_000_e2486891920843798e9af97209464833itecomtw_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SGkgSmFuaSBOaWt1bGENCg0KDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uIGFuZCBJIGhh
dmUgcmVwbGllZCB0d28gY29tbWVudHMgYmVsb3cuDQoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSmFuaSBOaWt1bGEgW21haWx0bzpqYW5pLm5pa3VsYUBsaW51eC5pbnRl
bC5jb21dDQpTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDI3LCAyMDE5IDY6MjkgUE0NClRvOiBB
bGxlbiBDaGVuICjy59va6dQpDQpDYzogSmF1LUNoaWggVHNlbmcgKPH04bnyqik7IE1heGltZSBS
aXBhcmQ7IEFsbGVuIENoZW4gKPLn29rp1Ck7IG9wZW4gbGlzdDsgb3BlbiBsaXN0OkRSTSBEUklW
RVJTOyBEYXZpZCBBaXJsaWU7IFBpLUhzdW4gU2hpaDsgU2VhbiBQYXVsDQpTdWJqZWN0OiBSZTog
W1BBVENIXSBkcm0vZWRpZDogZml4dXAgRURJRCAxLjMgYW5kIDEuNCBqdWRnZSByZWR1Y2VkLWJs
YW5raW5nIHRpbWluZ3MgbG9naWMNCg0KDQoNCk9uIFR1ZSwgMjYgTm92IDIwMTksIGFsbGVuIDxh
bGxlbi5jaGVuQGl0ZS5jb20udHc+IHdyb3RlOg0KDQo+IEFjY29yZGluZyB0byBWRVNBIEVOSEFO
Q0VEIEVYVEVOREVEIERJU1BMQVkgSURFTlRJRklDQVRJT04gREFUQSBTVEFOREFSRA0KDQo+IChE
ZWZpbmVzIEVESUQgU3RydWN0dXJlIFZlcnNpb24gMSwgUmV2aXNpb24gNCkgcGFnZTogMzkNCg0K
PiBIb3cgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIG1vbml0b3Igc3VwcG9ydCBSQiB0aW1pbmcg
b3Igbm90Pw0KDQo+IEVESUQgMS40DQoNCj4gRmlyc3Q6ICByZWFkIGRldGFpbGVkIHRpbWluZyBk
ZXNjcmlwdG9yIGFuZCBtYWtlIHN1cmUgYnl0ZSAwID0gMHgwMCwNCg0KPiAgICAgYnl0ZSAxID0g
MHgwMCwgYnl0ZSAyID0gMHgwMCBhbmQgYnl0ZSAzID0gMHhGRA0KDQo+IFNlY29uZDogcmVhZCBF
RElEIGJpdCAwIGluIGZlYXR1cmUgc3VwcG9ydCBieXRlIGF0IGFkZHJlc3MgMThoID0gMQ0KDQo+
ICAgICBhbmQgZGV0YWlsZWQgdGltaW5nIGRlc2NyaXB0b3IgYnl0ZSAxMCA9IDB4MDQNCg0KPiBU
aGlyZDogIGlmIEVESUQgYml0IDAgaW4gZmVhdHVyZSBzdXBwb3J0IGJ5dGUgPSAxICYmDQoNCj4g
ICAgIGRldGFpbGVkIHRpbWluZyBkZXNjcmlwdG9yIGJ5dGUgMTAgPSAweDA0DQoNCj4gICAgIHRo
ZW4gd2UgY2FuIGNoZWNrIGJ5dGUgMTUsIGlmIGJpdCA0IGluIGJ5dGUgMTUgPSAxIGlzIHN1cHBv
cnQgUkINCg0KPiAgICAgICAgIGlmIEVESUQgYml0IDAgaW4gZmVhdHVyZSBzdXBwb3J0IGJ5dGUg
IT0gMSB8fA0KDQo+ICAgICBkZXRhaWxlZCB0aW1pbmcgZGVzY3JpcHRvciBieXRlIDEwICE9IDB4
MDQsDQoNCj4gICAgIHRoZW4gYnl0ZSAxNSBjYW4gbm90IGJlIHVzZWQNCg0KPg0KDQo+IFRoZSBs
aW51eCBjb2RlIGlzX3JiIGZ1bmN0aW9uIG5vdCBmb2xsb3cgdGhlIFZFU0EncyBydWxlDQoNCj4N
Cg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGxlbiBDaGVuIDxhbGxlbi5jaGVuQGl0ZS5jb20udHc+DQoN
Cj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KDQo+IC0t
LQ0KDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDM2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLQ0KDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkNCg0KPg0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jDQoNCj4gaW5kZXggZjU5MjZi
Zi4uZTExZTU4NSAxMDA2NDQNCg0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0K
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jDQoNCj4gQEAgLTkzLDYgKzkzLDEy
IEBAIHN0cnVjdCBkZXRhaWxlZF9tb2RlX2Nsb3N1cmUgew0KDQo+ICAgIGludCBtb2RlczsNCg0K
PiAgfTsNCg0KPg0KDQo+ICtzdHJ1Y3QgZWRpZF9zdXBwb3J0X3JiX2Nsb3N1cmUgew0KDQo+ICsg
ICBzdHJ1Y3QgZWRpZCAqZWRpZDsNCg0KPiArICAgYm9vbCB2YWxpZF9zdXBwb3J0X3JiOw0KDQo+
ICsgICBib29sIHN1cHBvcnRfcmI7DQoNCj4gK307DQoNCj4gKw0KDQo+ICAjZGVmaW5lIExFVkVM
X0RNVCAwDQoNCj4gICNkZWZpbmUgTEVWRUxfR1RGICAgMQ0KDQo+ICAjZGVmaW5lIExFVkVMX0dU
RjIgMg0KDQo+IEBAIC0yMDE3LDIzICsyMDIzLDQxIEBAIHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICpkcm1fbW9kZV9maW5kX2RtdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KDQo+ICAgIH0NCg0K
PiAgfQ0KDQo+DQoNCj4gK3N0YXRpYyBib29sDQoNCj4gK2lzX2Rpc3BsYXlfZGVzY3JpcHRvcihj
b25zdCB1OCAqciwgdTggdGFnKQ0KDQo+ICt7DQoNCj4gKyAgIHJldHVybiAoIXJbMF0gJiYgIXJb
MV0gJiYgIXJbMl0gJiYgclszXSA9PSB0YWcpID8gdHJ1ZSA6IGZhbHNlOw0KDQo+ICt9DQoNCj4g
Kw0KDQo+ICBzdGF0aWMgdm9pZA0KDQo+ICBpc19yYihzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICp0
LCB2b2lkICpkYXRhKQ0KDQo+ICB7DQoNCj4gICAgdTggKnIgPSAodTggKil0Ow0KDQo+IC0gICAg
aWYgKHJbM10gPT0gRURJRF9ERVRBSUxfTU9OSVRPUl9SQU5HRSkNCg0KPiAtICAgICAgICAgICAg
aWYgKHJbMTVdICYgMHgxMCkNCg0KPiAtICAgICAgICAgICAgICAgICAgICAqKGJvb2wgKilkYXRh
ID0gdHJ1ZTsNCg0KPiArICAgc3RydWN0IGVkaWRfc3VwcG9ydF9yYl9jbG9zdXJlICpjbG9zdXJl
ID0gZGF0YTsNCg0KPiArICAgc3RydWN0IGVkaWQgKmVkaWQgPSBjbG9zdXJlLT5lZGlkOw0KDQo+
ICsNCg0KPiArICAgaWYgKGlzX2Rpc3BsYXlfZGVzY3JpcHRvcihyLCBFRElEX0RFVEFJTF9NT05J
VE9SX1JBTkdFKSkgew0KDQo+ICsgICAgICAgICAgIGlmIChlZGlkLT5mZWF0dXJlcyAmIEJJVCgw
KSAmJiByWzEwXSA9PSBCSVQoMikpIHsNCg0KPiArICAgICAgICAgICAgICAgICAgIGNsb3N1cmUt
PnZhbGlkX3N1cHBvcnRfcmIgPSB0cnVlOw0KDQo+ICsgICAgICAgICAgICAgICAgICAgY2xvc3Vy
ZS0+c3VwcG9ydF9yYiA9IChyWzE1XSAmIDB4MTApID8gdHJ1ZSA6IGZhbHNlOw0KDQo+ICsgICAg
ICAgICAgIH0NCg0KPiArICAgfQ0KDQo+ICB9DQoNCj4NCg0KPiAgLyogRURJRCAxLjQgZGVmaW5l
cyB0aGlzIGV4cGxpY2l0bHkuICBGb3IgRURJRCAxLjMsIHdlIGd1ZXNzLCBiYWRseS4gKi8NCg0K
PiAgc3RhdGljIGJvb2wNCg0KPiAgZHJtX21vbml0b3Jfc3VwcG9ydHNfcmIoc3RydWN0IGVkaWQg
KmVkaWQpDQoNCj4gIHsNCg0KPiArICAgc3RydWN0IGVkaWRfc3VwcG9ydF9yYl9jbG9zdXJlIGNs
b3N1cmUgPSB7DQoNCj4gKyAgICAgICAgICAgLmVkaWQgPSBlZGlkLA0KDQo+ICsgICAgICAgICAg
IC52YWxpZF9zdXBwb3J0X3JiID0gZmFsc2UsDQoNCj4gKyAgICAgICAgICAgLnN1cHBvcnRfcmIg
PSBmYWxzZSwNCg0KPiArICAgfTsNCg0KPiArDQoNCj4gICAgaWYgKGVkaWQtPnJldmlzaW9uID49
IDQpIHsNCg0KPiAtICAgICAgICAgICAgYm9vbCByZXQgPSBmYWxzZTsNCg0KPiAtICAgICAgICAg
ICAgZHJtX2Zvcl9lYWNoX2RldGFpbGVkX2Jsb2NrKCh1OCAqKWVkaWQsIGlzX3JiLCAmcmV0KTsN
Cg0KPiAtICAgICAgICAgICAgcmV0dXJuIHJldDsNCg0KPiArICAgICAgICAgICBkcm1fZm9yX2Vh
Y2hfZGV0YWlsZWRfYmxvY2soKHU4ICopZWRpZCwgaXNfcmIsICZjbG9zdXJlKTsNCg0KPiArICAg
ICAgICAgICBpZiAoY2xvc3VyZS52YWxpZF9zdXBwb3J0X3JiKQ0KDQo+ICsgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIGNsb3N1cmUuc3VwcG9ydF9yYjsNCg0KDQoNCkFyZSB5b3UgcGxhbm5pbmcg
b24gZXh0ZW5kaW5nIHRoZSBjbG9zdXJlIHVzZSBzb21laG93Pw0KDQoNCg0KSSBkaWQgbm90IGxv
b2sgdXAgdGhlIHNwZWMsDQoNCg0KDQo9PT4gaVRFOiBhcyB0aGUgcGljdHVyZSBiZWxvdywgZnJv
bSBWRVNBIEUtRURJRCBzdGFuZGFyZA0KDQpbY2lkOmltYWdlMDAzLmpwZ0AwMUQ1QTlFQS45Qjcz
NjREMF0NCg0KDQoNCltjaWQ6aW1hZ2UwMDUuanBnQDAxRDVBOUVBLjlCNzM2NEQwXQ0KDQoNCg0K
aWYgRURJRCBiaXQgMCBpbiBmZWF0dXJlIHN1cHBvcnQgYnl0ZSA9IDEgJiYgZGV0YWlsZWQgdGlt
aW5nIGRlc2NyaXB0b3IgYnl0ZSAxMCA9IDB4MDQgdGhlbiB0aGUgQ1ZUIHRpbWluZyBzdXBwb3J0
ZWQuDQoNCg0KDQpbY2lkOmltYWdlMDA5LmpwZ0AwMUQ1QTlFQS45QjczNjREMF0NCg0KDQoNCklm
IENWVCB0aW1pbmcgc3VwcG9ydGVkIHRoZW4gd2UgY2FuIGNoZWNrIGJ5dGUgMTUgYml0IDQgdG8g
ZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIHJlZHVjZWQtYmxhbmtpbmcgdGltaW5ncyBzdXBvcnRlZCBv
ciBub3QuDQoNCklmIENWVCB0aW1pbmcgbm90IHN1cHBvcnRlZCB0aGVuIHdlIGNhbiBub3QgdXNl
IGJ5dGUgMTUgdG8ganVkZ2UuDQoNCmJ1dCBwdXJlbHkgb24gdGhlIGNvZGUgY2hhbmdlcyBhbG9u
ZSwgeW91DQoNCmNvdWxkIGp1c3QgbW92ZSB0aGUgZWRpZC0+ZmVhdHVyZXMgYml0IGNoZWNrIGF0
IHRoaXMgbGV2ZWwsIGFuZCBub3QgcGFzcw0KDQppdCBkb3duLCBhbmQgbm90aGluZyB3b3VsZCBj
aGFuZ2UuIEkuZS4gZG9uJ3QgaXRlcmF0ZSB0aGUgRURJRCBhdCBhbGwgaWYNCg0KdGhlIGJpdCBp
cyBub3Qgc2V0Lg0KDQoNCg0KqaMgIGlURTogV2Ugc3RpbGwgaGF2ZSB0byBjaGVjayB3aGV0aGVy
IGRldGFpbGVkIHRpbWluZyBkZXNjcmlwdG9yIGJ5dGUgMTAgPSAweDA0IG9yIG5vdCwgc28gaXQg
aXMgaGFyZCB0byBjaGVjayBhdCB0aGlzIGxldmVsDQoNCllvdSBhbHNvIGRvbid0IGFjdHVhbGx5
IHVzZSB0aGUgZGlzdGluY3Rpb24gYmV0d2VlbiB2YWxpZF9zdXBwb3J0X3JiDQoNCnZzLiBzdXBw
b3J0X3JiIGZvciBhbnl0aGluZywgc28gdGhlIGNsb3N1cmUganVzdCBhZGRzIGNvZGUuDQoNCg0K
DQpCUiwNCg0KSmFuaS4NCg0KDQoNCg0KDQo+ICAgIH0NCg0KPg0KDQo+ICAgIHJldHVybiAoKGVk
aWQtPmlucHV0ICYgRFJNX0VESURfSU5QVVRfRElHSVRBTCkgIT0gMCk7DQoNCg0KDQotLQ0KDQpK
YW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyDQo=

--_000_e2486891920843798e9af97209464833itecomtw_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:p=3D"urn:schemas-m=
icrosoft-com:office:powerpoint" xmlns:a=3D"urn:schemas-microsoft-com:office=
:access" xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:s=3D"=
uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" xmlns:rs=3D"urn:schemas-microsof=
t-com:rowset" xmlns:z=3D"#RowsetSchema" xmlns:b=3D"urn:schemas-microsoft-co=
m:office:publisher" xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadshee=
t" xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" xmlns=
:odc=3D"urn:schemas-microsoft-com:office:odc" xmlns:oa=3D"urn:schemas-micro=
soft-com:office:activation" xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" xmlns:rtc=3D"http://m=
icrosoft.com/officenet/conferencing" xmlns:D=3D"DAV:" xmlns:Repl=3D"http://=
schemas.microsoft.com/repl/" xmlns:mt=3D"http://schemas.microsoft.com/share=
point/soap/meetings/" xmlns:x2=3D"http://schemas.microsoft.com/office/excel=
/2003/xml" xmlns:ppda=3D"http://www.passport.com/NameSpace.xsd" xmlns:ois=
=3D"http://schemas.microsoft.com/sharepoint/soap/ois/" xmlns:dir=3D"http://=
schemas.microsoft.com/sharepoint/soap/directory/" xmlns:ds=3D"http://www.w3=
.org/2000/09/xmldsig#" xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint=
/dsp" xmlns:udc=3D"http://schemas.microsoft.com/data/udc" xmlns:xsd=3D"http=
://www.w3.org/2001/XMLSchema" xmlns:sub=3D"http://schemas.microsoft.com/sha=
repoint/soap/2002/1/alerts/" xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#"=
 xmlns:sp=3D"http://schemas.microsoft.com/sharepoint/" xmlns:sps=3D"http://=
schemas.microsoft.com/sharepoint/soap/" xmlns:xsi=3D"http://www.w3.org/2001=
/XMLSchema-instance" xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/so=
ap" xmlns:udcxf=3D"http://schemas.microsoft.com/data/udc/xmlfile" xmlns:udc=
p2p=3D"http://schemas.microsoft.com/data/udc/parttopart" xmlns:wf=3D"http:/=
/schemas.microsoft.com/sharepoint/soap/workflow/" xmlns:dsss=3D"http://sche=
mas.microsoft.com/office/2006/digsig-setup" xmlns:dssi=3D"http://schemas.mi=
crosoft.com/office/2006/digsig" xmlns:mdssi=3D"http://schemas.openxmlformat=
s.org/package/2006/digital-signature" xmlns:mver=3D"http://schemas.openxmlf=
ormats.org/markup-compatibility/2006" xmlns:m=3D"http://schemas.microsoft.c=
om/office/2004/12/omml" xmlns:mrels=3D"http://schemas.openxmlformats.org/pa=
ckage/2006/relationships" xmlns:spwp=3D"http://microsoft.com/sharepoint/web=
partpages" xmlns:ex12t=3D"http://schemas.microsoft.com/exchange/services/20=
06/types" xmlns:ex12m=3D"http://schemas.microsoft.com/exchange/services/200=
6/messages" xmlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/Sli=
deLibrary/" xmlns:spsl=3D"http://microsoft.com/webservices/SharePointPortal=
Server/PublishedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" xmlns:=
tax=3D"http://schemas.microsoft.com/sharepoint/taxonomy/soap/" xmlns:tns=3D=
"http://schemas.microsoft.com/sharepoint/soap/recordsrepository/" xmlns:sps=
up=3D"http://microsoft.com/webservices/SharePointPortalServer/UserProfileSe=
rvice" xmlns:mml=3D"http://www.w3.org/1998/Math/MathML" xmlns:st=3D"&#1;" x=
mlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"\7D14\6587\5B57 \5B57\5143";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"\8A3B\89E3\65B9\584A\6587\5B57 \5B57\5143";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:9.0pt;
	font-family:"Cambria","serif";}
span.a
	{mso-style-name:"\7D14\6587\5B57 \5B57\5143";
	mso-style-priority:99;
	mso-style-link:\7D14\6587\5B57;
	font-family:"Calibri","sans-serif";}
span.a0
	{mso-style-name:"\8A3B\89E3\65B9\584A\6587\5B57 \5B57\5143";
	mso-style-priority:99;
	mso-style-link:\8A3B\89E3\65B9\584A\6587\5B57;
	font-family:"Cambria","serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:977685191;
	mso-list-type:hybrid;
	mso-list-template-ids:-1075653140 574018634 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0F0;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;
	font-family:Wingdings;
	mso-fareast-font-family:PMingLiU;
	mso-bidi-font-family:"Courier New";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:72.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F06C;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:144.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F06C;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:216.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi Jani Nikula<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Thanks for your suggestion a=
nd I have replied two comments below.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-----Original Message-----<b=
r>
From: Jani Nikula [mailto:jani.nikula@linux.intel.com] <br>
Sent: Wednesday, November 27, 2019 6:29 PM<br>
To: Allen Chen (</span><span style=3D"font-family:&quot;=E3=E6=E1=AC=D9=A5=
=F4=F7&quot;,&quot;serif&quot;">=F2=E7=DB=DA=E9=D4</span><span lang=3D"EN-U=
S">)<br>
Cc: Jau-Chih Tseng (</span><span style=3D"font-family:&quot;=E3=E6=E1=AC=D9=
=A5=F4=F7&quot;,&quot;serif&quot;">=F1=F4=E1=B9=F2=AA</span><span lang=3D"E=
N-US">); Maxime Ripard; Allen Chen (</span><span style=3D"font-family:&quot=
;=E3=E6=E1=AC=D9=A5=F4=F7&quot;,&quot;serif&quot;">=F2=E7=DB=DA=E9=D4</span=
><span lang=3D"EN-US">); open list; open list:DRM DRIVERS; David Airlie; Pi=
-Hsun
 Shih; Sean Paul<br>
Subject: Re: [PATCH] drm/edid: fixup EDID 1.3 and 1.4 judge reduced-blankin=
g timings logic</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">On Tue, 26 Nov 2019, allen &=
lt;allen.chen@ite.com.tw&gt; wrote:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; According to VESA ENHAN=
CED EXTENDED DISPLAY IDENTIFICATION DATA STANDARD<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; (Defines EDID Structure=
 Version 1, Revision 4) page: 39<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; How to determine whethe=
r the monitor support RB timing or not?<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; EDID 1.4<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; First:&nbsp; read detai=
led timing descriptor and make sure byte 0 =3D 0x00,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &nbsp;&nbsp;&nbsp; byte=
 1 =3D 0x00, byte 2 =3D 0x00 and byte 3 =3D 0xFD<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Second: read EDID bit 0=
 in feature support byte at address 18h =3D 1<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &nbsp;&nbsp;&nbsp; and =
detailed timing descriptor byte 10 =3D 0x04<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Third:&nbsp; if EDID bi=
t 0 in feature support byte =3D 1 &amp;&amp;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &nbsp;&nbsp;&nbsp; deta=
iled timing descriptor byte 10 =3D 0x04<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &nbsp;&nbsp;&nbsp; then=
 we can check byte 15, if bit 4 in byte 15 =3D 1 is support RB<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; if EDID bit 0 in feature support byte !=3D 1 ||<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &nbsp;&nbsp;&nbsp; deta=
iled timing descriptor byte 10 !=3D 0x04,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &nbsp;&nbsp;&nbsp; then=
 byte 15 can not be used<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; The linux code is_rb fu=
nction not follow the VESA's rule<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Signed-off-by: Allen Ch=
en &lt;allen.chen@ite.com.tw&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Reported-by: kbuild tes=
t robot &lt;lkp@intel.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; ---<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; drivers/gpu/drm/d=
rm_edid.c | 36 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;------<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; 1 file changed, 3=
0 insertions(&#43;), 6 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; diff --git a/drivers/gp=
u/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; index f5926bf..e11e585 =
100644<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; --- a/drivers/gpu/drm/d=
rm_edid.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&#43;&#43; b/drive=
rs/gpu/drm/drm_edid.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; @@ -93,6 &#43;93,12 @@ =
struct detailed_mode_closure {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; int modes;=
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; };<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; <o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;struct edid_suppor=
t_rb_closure {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; struc=
t edid *edid;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; bool =
valid_support_rb;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; bool =
support_rb;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;};<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; #define LEVEL_DMT=
 0<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; #define LEVEL_GTF=
&nbsp;&nbsp; 1<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; #define LEVEL_GTF=
2 2<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; @@ -2017,23 &#43;2023,4=
1 @@ struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; }<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; }<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; <o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;static bool<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;is_display_descrip=
tor(const u8 *r, u8 tag)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;{<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; retur=
n (!r[0] &amp;&amp; !r[1] &amp;&amp; !r[2] &amp;&amp; r[3] =3D=3D tag) ? tr=
ue : false;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;}<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; static void<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; is_rb(struct deta=
iled_timing *t, void *data)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; {<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; u8 *r =3D =
(u8 *)t;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -&nbsp;&nbsp;&nbsp; if =
(r[3] =3D=3D EDID_DETAIL_MONITOR_RANGE)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r[15] &amp; 0x10)<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; *(bool *)data =3D true;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; struc=
t edid_support_rb_closure *closure =3D data;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; struc=
t edid *edid =3D closure-&gt;edid;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; if (i=
s_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE)) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (edid-&gt;features &amp; BIT(=
0) &amp;&amp; r[10] =3D=3D BIT(2)) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; closure-&gt;valid_support_rb =3D true;<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; closure-&gt;support_rb =3D (r[15] &amp; 0x10) ? true : fals=
e;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; }<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; }<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; <o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; /* EDID 1.4 defin=
es this explicitly.&nbsp; For EDID 1.3, we guess, badly. */<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; static bool<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; drm_monitor_suppo=
rts_rb(struct edid *edid)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; {<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; struc=
t edid_support_rb_closure closure =3D {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .edid =3D edid,<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .valid_support_rb =3D false,<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .support_rb =3D false,<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp; };<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; if (edid-&=
gt;revision &gt;=3D 4) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ret =3D false;<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_for_each_detailed_block((u=
8 *)edid, is_rb, &amp;ret);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; -&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<o:p></o:p></span><=
/p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_for_each_detailed_block((u8 =
*)edid, is_rb, &amp;closure);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (closure.valid_support_rb)<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; &#43;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return closure.support_rb;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Are you planning on extendin=
g the closure use somehow?<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I did not look up the spec, =
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:#1F497D">=3D=
=3D&gt; iTE: as the picture below, from VESA E-EDID standard<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:#1F497D"><img=
 width=3D"383" height=3D"214" id=3D"=D3=F1=F8=B8_x0020_1" src=3D"cid:image0=
03.jpg@01D5A9EA.9B7364D0">
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:#1F497D"><img=
 width=3D"476" height=3D"77" id=3D"=D3=F1=F8=B8_x0020_4" src=3D"cid:image00=
5.jpg@01D5A9EA.9B7364D0"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:#1F497D">if E=
DID bit 0 in feature support byte =3D 1 &amp;&amp; detailed timing descript=
or byte 10 =3D 0x04 then the CVT timing supported.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:#1F497D"><img=
 width=3D"480" height=3D"104" id=3D"=D3=F1=F8=B8_x0020_3" src=3D"cid:image0=
09.jpg@01D5A9EA.9B7364D0"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:#1F497D">If C=
VT timing supported then we can check byte 15 bit 4 to determine whether th=
e reduced-blanking timings suported or not.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US" style=3D"color:#1F497D">If C=
VT timing not supported then we can not use byte 15 to judge.<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">but purely on the code chang=
es alone, you<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">could just move the edid-&gt=
;features bit check at this level, and not pass<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">it down, and nothing would c=
hange. I.e. don't iterate the EDID at all if<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">the bit is not set.<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText" style=3D"margin-left:0cm;text-indent:0cm;mso-list=
:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Wingdings;co=
lor:#1F497D"><span style=3D"mso-list:Ignore">=A9=A3<span style=3D"font:7.0p=
t &quot;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"color:#1F497D"=
>iTE: We still have to check whether detailed timing descriptor byte 10 =3D=
 0x04 or not, so it is hard to check at this level<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">You also don't actually use =
the distinction between valid_support_rb<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">vs. support_rb for anything,=
 so the closure just adds code.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">BR,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Jani.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; }<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; <o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp; &nbsp; return ((e=
did-&gt;input &amp; DRM_EDID_INPUT_DIGITAL) !=3D 0);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-- <o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Jani Nikula, Intel Open Sour=
ce Graphics Center<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_e2486891920843798e9af97209464833itecomtw_--

--_006_e2486891920843798e9af97209464833itecomtw_
Content-Type: image/jpeg; name="image003.jpg"
Content-Description: image003.jpg
Content-Disposition: inline; filename="image003.jpg"; size=9380;
	creation-date="Tue, 03 Dec 2019 07:01:59 GMT";
	modification-date="Tue, 03 Dec 2019 07:01:59 GMT"
Content-ID: <image003.jpg@01D5A9EA.9B7364D0>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMg
IyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCADWAX8DASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD2aiii
gAooqGS8tof9bcRJj+84FAm0tyais+TXtLiGX1C1H/bUVUl8Y6JF1v0b/cVj/SldGbr0o7yX3m3R
WDB4z0q5m8uB5XwpZm8shUUdWJPQUaB4usvEV3PBZRzr5K7i0igAjOOOauMXJOS2Qo4ilJpRknc3
qKKKk2CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigAooooAK8OuebqbP8Afb+de415uNAt/EttNc6YUgv4nKzW
54Rjn7w9M/lWVTdI8/McFWxFL2lNX5d/n/wxyVWdP0+41S8S2tIy8j/kB6k9hUsOi382qDTxbOty
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
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi
iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACsPxpez6d4O1W8tJ2guILdpI5FxkMO
nXitymSxRzxlJo1kQ9VYZB/CgDF0zUPItkNzJczyzMuYk/0jys9CSg4BxnmsPQdUvLu01WW61KXM
FzdwwMZk+cIzBRtx1UKDnvXaQ20NuCIIY4w3UIoGfyqNdPs1JK2luCQQcRjnPXtQwR53F4m1YaDv
W/klMnhxtQkmIXMFwANpzjGG5+U/3eO9PvPEOpWq38sGqSNJbaPa3cKNtYSTMWBUjHO7AGB68V6I
tnbLC0S28Iib7yBBtP4UiWNrHIHS2hV16MIwCPxpgc5fWniRy1xps5RpWz5U0gKorRY446q5J/4D
ik8QalqmkW9jKpM6RWzPeRQyKs/AX94gYYcD5srxnI+ldXTHhjlx5kaPtORuGcGkBx1z44msI9Yl
nit3W0uvIgjMmxmAg83kHkk8jgfyp8fjwvrcVp9iQ28hiAdZsvl4GmHy4wfukde4rrWt4XYs0UbE
nJJUcnGP5UwWVsJBILeEOMYbYMjHA5oA4a08c3CyX97N5RhlgtJba2aYARmSORiM4yT8oBAzzWjH
45klgvLqPT1e2tNOh1Bws2ZCskbMFAxyQVxnPQ59q6r7LBjHkRYzn7g60JbQxsWSGNSVCkhQMgdB
9KAMPwpqVzqE+srdTrJ5F7tjCMGCIYo2wDgZGWPWuhpkcUcQxGioPRRin0AFFFFABRRRQAlRC6tz
GJBPEYy20MHGM+mfWnToZIJEUKSykAMOOnf2rnIfD+oRx2+LgK8ZO1t+ShOz5s4+fAUqAexA9aAO
iN1AIpJDNGI48723DC465Pamfb7UkgXMJIAYgODgEZB+hFZKaLcx6VfW4KGSa0FtGN3BwrDcTjgn
dz16VCmj6jBdiSIlkPk799yckKrhl+7yMsOPbNAG9b3UF0CbeaOULjJRgcZAI/Qg/jUiOsgyhBGS
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
rQsIHt4HEh5eV5Nv90MxOKQGZY+EbCxnhl33E5guJbqJZWG1JZM7mwAMnk4z0zxW7RRQAUUUUAFF
FFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUVk
+KftB8Lan9i8/wC1fZ38nyN3mb8fLtxznOK5/T7zxBbzmBLWYedeYJnDvFDH5YKlWI3EMQc5+6xI
wODQB21FcRpWpeIre1aN7SZo4YZpQ88bvJKfMkwoHqAI8AkZBqf+3PE0diZDpRll8mX5FjIIdZCA
SD1BTBGOp7cigDsKKwtTfVJvDot4XKancxsqTQKwWM4JDZI47cHHU4pbDWH1XQ2+0Wt3a3v2QSTR
NC6FWIIIU9zkHp7etAG5RXnmjXniWysED2t41zJDaKfPEkiKCCJJSSNwfdgMnYAMM1sX1zr6R3Cy
RsTFeW/lm3ibEkTMhfoc/L84PqMU7AdXRXGtqniL7XEzWUgZYXSUrGxjB86MeYo7/IXIBGflP4ya
brXiGXW7SG9sGjt5dglxbthMxuSd3T7yoMdt2KQHXUVh6fI7+KtR2nUlhWNF2TxuIC4JyyMeOhAw
vpmtygAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA
KKKKACiiigAooooAKKKKACiiigArmrrxcumaldQ6nC1tFFkwkoT56/KMow+UnLYKnBHXkV0tVJdK
sZ/N820hfzQVcMgO4Hrn60AY7+NLNJJI/st2HReA6BcsYmkC8nIOEbqMce9Mj8c2X2QyyW1zvjjh
eVY0DBGkCELuzjOJFP5+laUXh6xj1S5v2j82W4VVIkAZUCqV+XjuCQamOiaa0TxGxg8t1RWXYMME
+5n6YGPTFAGFL44SV7dLK0lLvcxxOkwAJRjKuVIOM7omHNTx+OdMngee3jupY1ERZli4Bk2YByeu
JFOPrjOK0l8O6SgYLp1sN2M/ux2JI/VmP4n1qWTR9PlSRHsoCsuzeuwANs+5ke2Bj0wKAINQv7yB
bF7W3jPnTIksUzYdVJ5IxkZUZJ+mKg0DWLzUrvUYb+2Fq8EoEUTIwcxnO1ifunOP4fQ5q/e6TYaj
PbzXtpDPJbNvhaRAxjbg5HoeBSJpFjE9u0dtGht2Z4toxsLAg4/An86AMnUPEF9p99PA1tA8Zljj
glVjgEq7MHHqAg5H98elUV8elkWRbB2E2EgjzhjJiHAJ6AEzgZ/2feuhTQNKjluZU0+2El0wadxG
MyEHIJPfrUz6ZZSGQvawt5qhHyg5A6D9B+Q9KAG6TfpqelwXcbq6yrnKqVGc4IweRgjFXKZFFHBE
sUKKkaDCqowAKfQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR
RRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF
FABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB/9k=

--_006_e2486891920843798e9af97209464833itecomtw_
Content-Type: image/jpeg; name="image005.jpg"
Content-Description: image005.jpg
Content-Disposition: inline; filename="image005.jpg"; size=10724;
	creation-date="Tue, 03 Dec 2019 07:01:59 GMT";
	modification-date="Tue, 03 Dec 2019 07:01:59 GMT"
Content-ID: <image005.jpg@01D5A9EA.9B7364D0>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMg
IyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCABNAdwDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDq/iCr
v4m8HLFJ5bnUGw+3ODtHaup+xal/0FR/4DL/AI1zPjz/AJGvwX/2EW/9BFdxQBm/YtS/6Co/8Bl/
xo+xal/0FR/4DL/jWlRQBm/YtS/6Co/8Bl/xqpB9ptdduBPcidmtosHywuBuf0rdrGuP+Rgm/wCv
WP8A9DegC39rk/2fyo+1yf7P5VDRQBN9rk/2fyo+1yf7P5VDRQBN9rk/2fypjy+ZJG7xxM8ZJRmX
JUng4PamUUAMkgtpf9ZZ2r/MX+aIH5j1P1PrU8UxhiWOJI0jQYVVXAA9AKjooAm+1yf7P5Ufa5P9
n8qhooAm+1yf7P5Ufa5P9n8qhooAma6kZSDtwRjpWdfXOn6do8aambcWMARAbhNyjHC5461bqtqN
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
aQdBS0Af/9k=

--_006_e2486891920843798e9af97209464833itecomtw_
Content-Type: image/jpeg; name="image009.jpg"
Content-Description: image009.jpg
Content-Disposition: inline; filename="image009.jpg"; size=13848;
	creation-date="Tue, 03 Dec 2019 07:01:59 GMT";
	modification-date="Tue, 03 Dec 2019 07:01:59 GMT"
Content-ID: <image009.jpg@01D5A9EA.9B7364D0>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMg
IyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCABoAeADASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD2aqqa
nZyfatlzE32Q4nw3+rOM8+nFWq5g2gnvfESX+nXUtncmIBVGPOUIFO3BB6j2oA3NN1Oz1ezW70+d
Z4GJAdQcEjr1q3WZoFncWOmiC4lmlCyN5JnbdIseflVj3IFadDAxbecx6zqoRQCJI8nrn92KlmSK
5mimntreWWE5jd4wzIfYnpVWH/kN6v8A9dIv/RYrC11NVOqXMllHqTosUBhELfu94k+fjIz8nXNH
UDrvtcv+z+VH2uX/AGfyqEkE5HSoL3ebC48rzPM8ptnl/e3Y4x75oYIswstsGEEUUQdi7BEC5Y9S
cd6k+1y/7P5VzHhpNRindb6O+CNaQEtctuHnAESY5OO3Tiuh7U2A6dlukCXEUUqqwYB0DAEdDz3q
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

--_006_e2486891920843798e9af97209464833itecomtw_--

--===============1238877627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1238877627==--
