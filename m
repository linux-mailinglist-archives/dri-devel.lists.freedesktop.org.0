Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C34F001B
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 11:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EEC10F761;
	Sat,  2 Apr 2022 09:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx3.securetransport.de (mx3.securetransport.de
 [IPv6:2a01:4f8:c0c:92be::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5970610F602
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1648825550;
 bh=wCkwS8gMsQkymf3za5YDtr/V9CjlUshI9qMITfRpRWA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=v3qcghqcSWa0pFawJH5iPaidKKkdXV0c02520wzapX9fzJVGskeaXVu28FTaaNiYc
 s1NnLDL3ejwY0RbDIC8Ma65J2vFEKKcEi2zN1HWxvq+Bcln4iddmp8zKWThDpfkrDw
 psblUB3FM0tbaytJczWpbENcen/y4Outj0YZQT8WsfocZ2Rk+m0HofEUQJhU6s5lcK
 1P2GJFHjXJEj0Nh6oiB8gBXLR2ribiklbcR7bcwZNBnP7vb4Ky9dK0zbpVFuBoPDfA
 Uv3lAitl7qZ9xSJtI7SMN9Z248lAgzWt4TZeRWpTTRLGgMD1a1K0MrsRLJUQa7Ffjn
 YMYe2WNcYmQ/Q==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: "Marek MV. Vasut" <marex@denx.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/panel: lvds: Use bus_flags from DT panel-timing
 property
Thread-Topic: [PATCH 2/2] drm/panel: lvds: Use bus_flags from DT panel-timing
 property
Thread-Index: AQHYRTTkdXBwc2I5ZE2dyDGn/P53jKzbKSEA
Date: Fri, 1 Apr 2022 15:05:40 +0000
Message-ID: <3dc7ac2c3e2e4328b710c9821c05a5d7@dh-electronics.com>
References: <20220331192347.103299-1-marex@denx.de>
 <20220331192347.103299-2-marex@denx.de>
In-Reply-To: <20220331192347.103299-2-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 02 Apr 2022 09:24:49 +0000
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
Cc: "Marek MV. Vasut" <marex@denx.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFyZWsgVmFzdXQgW21haWx0bzptYXJleEBkZW54LmRlXQ0KU2VudDogVGh1cnNkYXks
IE1hcmNoIDMxLCAyMDIyIDk6MjQgUE0NCj4gVGhpcyBkcml2ZXIgY3VycmVudGx5IHJld3JpdGVz
IGJ1c19mbGFncyBiYXNlZCBzb2xlbHkgb24gdGhlIHZhbHVlIG9mDQo+IERUIHByb3BlcnR5ICdk
YXRhLW1pcnJvcicgYW5kIGlnbm9yZXMgYnVzX2ZsYWdzIHdoaWNoIG1pZ2h0IGhhdmUgYmVlbg0K
PiBzZXQgaW4gRFQgcGFuZWwtdGltaW5nIG5vZGUuIFNwZWNpZmljYWx5LCB0aGUgJ2RlLWFjdGl2
ZScgRFQgcHJvcGVydHkNCj4gc2V0cyBEUk1fQlVTX0ZMQUdfREVfIGJ1c19mbGFncy4NCj4gDQo+
IFNpbmNlIG9mX2dldF9kcm1fcGFuZWxfZGlzcGxheV9tb2RlKCkgY29udmVuaWVudGx5IHBhcnNl
cyB0aGUgYnVzX2ZsYWdzDQo+IG91dCBvZiBEVCBwYW5lbC10aW1pbmcgcHJvcGVydHksIGp1c3Qg
T1JSIHRoZW0gd2l0aCBidXNfZmxhZ3MgaW5mZXJyZWQNCj4gZnJvbSAnZGF0YS1taXJyb3InIERU
IHByb3BlcnR5IGFuZCB1c2UgdGhlIHJlc3VsdCBhcyBwYW5lbCBidXNfZmxhZ3MuDQo+IA0KPiBU
aGlzIGZpeGVzIGhhbmRsaW5nIG9mIHBhbmVscyB3aXRoICdwYW5lbC10aW1pbmcgeyBkZS1hY3Rp
dmUgPSA8MT47IH07Jy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPg0KPiBDYzogQ2hyaXN0b3BoIE5pZWRlcm1haWVyIDxjbmllZGVybWFpZXJAZGgtZWxl
Y3Ryb25pY3MuY29tPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4NCj4gQ2M6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4NCj4gQ2M6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gQ2M6IFJv
YmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5hcm8ub3JnPg0KPiBDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQo+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYyB8IDkgKysrKy0tLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jDQo+IGluZGV4IDY1YzZhNmU5ZTIyMy4uZjExMjUyZmIw
MGZlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMNCj4gQEAgLTMzLDcgKzMz
LDYgQEAgc3RydWN0IHBhbmVsX2x2ZHMgew0KPiAgICAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9t
b2RlIGRtb2RlOw0KPiAgICAgICAgIHUzMiBidXNfZmxhZ3M7DQo+ICAgICAgICAgdW5zaWduZWQg
aW50IGJ1c19mb3JtYXQ7DQo+IC0gICAgICAgYm9vbCBkYXRhX21pcnJvcjsNCj4gDQo+ICAgICAg
ICAgc3RydWN0IHJlZ3VsYXRvciAqc3VwcGx5Ow0KPiANCj4gQEAgLTk5LDkgKzk4LDcgQEAgc3Rh
dGljIGludCBwYW5lbF9sdmRzX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwNCj4g
ICAgICAgICBjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5oZWlnaHRfbW0gPSBsdmRzLT5kbW9kZS5o
ZWlnaHRfbW07DQo+ICAgICAgICAgZHJtX2Rpc3BsYXlfaW5mb19zZXRfYnVzX2Zvcm1hdHMoJmNv
bm5lY3Rvci0+ZGlzcGxheV9pbmZvLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICZsdmRzLT5idXNfZm9ybWF0LCAxKTsNCj4gLSAgICAgICBjb25uZWN0b3ItPmRp
c3BsYXlfaW5mby5idXNfZmxhZ3MgPSBsdmRzLT5kYXRhX21pcnJvcg0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA/IERSTV9CVVNfRkxBR19EQVRBX0xTQl9UT19N
U0INCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBEUk1fQlVT
X0ZMQUdfREFUQV9NU0JfVE9fTFNCOw0KPiArICAgICAgIGNvbm5lY3Rvci0+ZGlzcGxheV9pbmZv
LmJ1c19mbGFncyA9IGx2ZHMtPmJ1c19mbGFnczsNCj4gICAgICAgICBkcm1fY29ubmVjdG9yX3Nl
dF9wYW5lbF9vcmllbnRhdGlvbihjb25uZWN0b3IsIGx2ZHMtPm9yaWVudGF0aW9uKTsNCj4gDQo+
ICAgICAgICAgcmV0dXJuIDE7DQo+IEBAIC0xNDIsNyArMTM5LDkgQEAgc3RhdGljIGludCBwYW5l
bF9sdmRzX3BhcnNlX2R0KHN0cnVjdCBwYW5lbF9sdmRzICpsdmRzKQ0KPiANCj4gICAgICAgICBs
dmRzLT5idXNfZm9ybWF0ID0gcmV0Ow0KPiANCj4gLSAgICAgICBsdmRzLT5kYXRhX21pcnJvciA9
IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImRhdGEtbWlycm9yIik7DQo+ICsgICAgICAgbHZk
cy0+YnVzX2ZsYWdzIHw9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImRhdGEtbWlycm9yIikg
Pw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fQlVTX0ZMQUdfREFUQV9MU0JfVE9f
TVNCIDoNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0JVU19GTEFHX0RBVEFfTVNC
X1RPX0xTQjsNCj4gDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+ICB9DQoNCg0KVGVzdGVkLWJ5OiBD
aHJpc3RvcGggTmllZGVybWFpZXIgPGNuaWVkZXJtYWllckBkaC1lbGVjdHJvbmljcy5jb20+DQoN
ClJlZ2FyZHMNCkNocmlzdG9waA0K
