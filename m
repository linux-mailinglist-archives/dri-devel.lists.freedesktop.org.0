Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2252CCDC
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487C06E272;
	Tue, 28 May 2019 17:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717CA6E272
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 17:02:45 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A02BA2003D;
 Tue, 28 May 2019 19:02:43 +0200 (CEST)
Date: Tue, 28 May 2019 19:02:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when
 using dual-link LVDS mode
Message-ID: <20190528170242.GB10262@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-8-laurent.pinchart+renesas@ideasonboard.com>
 <20190528164213.GB9610@ravnborg.org>
 <20190528165052.GB17874@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528165052.GB17874@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=xIEnxEUKAAAA:8 a=Qv0YFi8OrfPa8QNwrDoA:9 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=JpDqF-G6Ufas406PgLIE:22
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCk9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDA3OjUwOjUyUE0gKzAzMDAsIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gSGkgU2FtLAo+IAo+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5
IGF0IDA2OjQyOjEzUE0gKzAyMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5
IDI4LCAyMDE5IGF0IDA1OjEyOjMxUE0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4g
PiA+IEluIGR1YWwtbGluayBMVkRTIG1vZGUsIHRoZSBMVkRTMSBlbmNvZGVyIGlzIHVzZWQgYXMg
YSBjb21wYW5pb24gZm9yCj4gPiA+IExWRFMwLCBhbmQgYm90aCBlbmNvZGVycyB0cmFuc21pdCBk
YXRhIGZyb20gRFUwLiBUaGUgTFZEUzEgb3V0cHV0IG9mIERVMQo+ID4gPiBjYW4ndCBiZSB1c2Vk
IGluIHRoYXQgY2FzZSwgZG9uJ3QgY3JlYXRlIGFuIGVuY29kZXIgYW5kIGNvbm5lY3RvciBmb3IK
PiA+ID4gaXQuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KPiA+ID4gUmV2aWV3ZWQt
Ynk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiA+ID4gVGVzdGVk
LWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gPiA+IC0tLQo+
ID4gPiBDaGFuZ2VzcyBzaW5jZSB2MjoKPiA+ID4gCj4gPiA+IC0gUmVtb3ZlIHVubmVlZGVkIGJy
aWRnZSBOVUxMIGNoZWNrCj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9kdV9lbmNvZGVyLmMgfCAxMiArKysrKysrKysrKysKPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgICAgIHwgIDIgKy0KPiA+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZW5jb2Rlci5jIGIvZHJpdmVycy9n
cHUvZHJtL3JjYXItZHUvcmNhcl9kdV9lbmNvZGVyLmMKPiA+ID4gaW5kZXggNmM5MTc1M2FmN2Jj
Li4wZjAwYmRmZTIzNjYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfZW5jb2Rlci5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfZHVfZW5jb2Rlci5jCj4gPiA+IEBAIC0xNiw2ICsxNiw3IEBACj4gPiA+ICAjaW5jbHVkZSAi
cmNhcl9kdV9kcnYuaCIKPiA+ID4gICNpbmNsdWRlICJyY2FyX2R1X2VuY29kZXIuaCIKPiA+ID4g
ICNpbmNsdWRlICJyY2FyX2R1X2ttcy5oIgo+ID4gPiArI2luY2x1ZGUgInJjYXJfbHZkcy5oIgo+
ID4gPiAgCj4gPiA+ICAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiAgICogRW5jb2Rlcgo+
ID4gPiBAQCAtOTcsNiArOTgsMTcgQEAgaW50IHJjYXJfZHVfZW5jb2Rlcl9pbml0KHN0cnVjdCBy
Y2FyX2R1X2RldmljZSAqcmNkdSwKPiA+ID4gIAkJfQo+ID4gPiAgCX0KPiA+ID4gIAo+ID4gPiAr
CS8qCj4gPiA+ICsJICogT24gR2VuMyBza2lwIHRoZSBMVkRTMSBvdXRwdXQgaWYgdGhlIExWRFMx
IGVuY29kZXIgaXMgdXNlZCBhcyBhCj4gPiA+ICsJICogY29tcGFuaW9uIGZvciBMVkRTMCBpbiBk
dWFsLWxpbmsgbW9kZS4KPiA+ID4gKwkgKi8KPiA+ID4gKwlpZiAocmNkdS0+aW5mby0+Z2VuID49
IDMgJiYgb3V0cHV0ID09IFJDQVJfRFVfT1VUUFVUX0xWRFMxKSB7Cj4gPiAKPiA+IEJvdGggc3Vi
amVjdCBhbmQgY29tbWVudCBhYm92ZSBzYXlzICJPbiBHZW4zIiwgYnV0IHRoZSBjb2RlIGxvb2tz
IGxpa2UKPiA+IGl0IGltcGxlbWVudHMgIk9uIEdlbjMgb3IgbmV3ZXIiIC0gZHVlIHRvIHVzZSBv
ZiAiPj0iLgo+ID4gTG9va3Mgd3JvbmcgdG8gbWUuCj4gCj4gR2VuMyBpcyB0aGUgbmV3ZXN0IGdl
bmVyYXRpb24gOi0pIFdlIHRodXMgdXNlID49IHRocm91Z2ggdGhlIERVIGFuZCBMVkRTCj4gZHJp
dmVycyB0byBwcmVwYXJlIGZvciBzdXBwb3J0IG9mIEdlbjQsIGp1c3QgaW4gY2FzZS4KT0ssIGJ1
dCBJIGd1ZXNzIHdlIGFncmVlIHRoYXQgdGhlIGNvbW1lbnQgbmVlZHMgYSBzbWFsbCB1cGRhdGUg
dGhlbS4KCkFjdHVhbGx5IEkgaW1wbGljaXRseSByZWFkcyB0aGF0IGl0IGlzIG9ubHkgZnJvbSBH
ZW4zIG9ud2FyZHMgdGhhdCB0aGUKTFZEUzEgZW5jb2RlciBjYW4gYmUgdXNlZCBhcyBhIGNvbXBh
bmlvbi4KTXkgaW5pdGlhbCB1bmRlcnN0YW5kaW5nIHJlYWRpbmcgdGhlIGNvbW1lbnQgd2FzIHRo
YXQgdGhpcyBpbXBsbWVudGVkIGEKd29ya2Fyb3VuZCBmb3IgR2VuMyAtIGJ1dCBpdCBpcyBhIHdv
cmthcm91bmYgZm9yIG1pc3NpbmcgZmVhdHVyZXMgaW4Kb2xkZXIgdGhhbiBHZW4zLgpTbywgYXNz
dW1pbmcgdGhpcyBpcyBjb3JyZWN0LCB3aGVuIHRyeWluZyB0byBzcGVjaWZ5IGEgY29tcGFuaW9u
IG9uCm9sZGVyIHRoZW4gR2VuMyBzaG91bGQgcmVzdWx0IGluIHNvbWUga2luZCBvZiBlcnJvci93
YXJuaW5nPwooTWF5YmUgaXQgZG9lcykuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
