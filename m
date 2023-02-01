Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB82D6864F5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 12:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1A310E2B8;
	Wed,  1 Feb 2023 11:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6149A10E2B8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 11:02:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 245FF338E2;
 Wed,  1 Feb 2023 11:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675249352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzuNNJj0jZNiAgDSVeG4L6FdFzD2Qpl/uxJ27gfgce4=;
 b=1qYDUTK2KoLu/fE3fOojPYMJ4lOta79GK7DXQA+Zi0wGgHstbibyCYE1uvyx0TuZp8dli8
 tatVj+tbMYF2EWkxCZuCY9bwY9MYnc2rJ/oBzFV0svh1QyuBfPnQnKw/wkBEutFhk/SAa+
 S/XywTZdgGAgu/jMEY8nprYB2DQNkvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675249352;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzuNNJj0jZNiAgDSVeG4L6FdFzD2Qpl/uxJ27gfgce4=;
 b=c+x7cLh9EDzYqW7JqCY7Eea5wpcXa8wvrGWSI+CrlAVrlqc8PF21pXSrv7IUnntNyDWBIQ
 PC/o7eeOwmfVcXAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6C4B13A10;
 Wed,  1 Feb 2023 11:02:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Z2poM8dG2mMjFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Feb 2023 11:02:31 +0000
Message-ID: <334f8ea8-581e-8711-5f1b-55e596484d9e@suse.de>
Date: Wed, 1 Feb 2023 12:02:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
References: <20230106030108.2542081-1-swboyd@chromium.org>
 <CAD=FV=U0Bwx4HzCSL8EE-+ngGLZ-NqpbC+J9jby84FKBOB_ddQ@mail.gmail.com>
 <CAD=FV=VMebqPd2ozLzY65Kba9snLKQ-KKd684O0cGQzyP0kcwQ@mail.gmail.com>
 <CAD=FV=UJOf7X-Jk0seB=Krt53Mzm6NztjP_KdT265zz=EsKp2A@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAD=FV=UJOf7X-Jk0seB=Krt53Mzm6NztjP_KdT265zz=EsKp2A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MS0l4IiGP2l7w39nnvc0J1oQ"
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
Cc: Rob Clark <robdclark@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MS0l4IiGP2l7w39nnvc0J1oQ
Content-Type: multipart/mixed; boundary="------------m91Ni10vFAUgkizxnorHgkuh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Doug Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
Cc: Rob Clark <robdclark@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Message-ID: <334f8ea8-581e-8711-5f1b-55e596484d9e@suse.de>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
References: <20230106030108.2542081-1-swboyd@chromium.org>
 <CAD=FV=U0Bwx4HzCSL8EE-+ngGLZ-NqpbC+J9jby84FKBOB_ddQ@mail.gmail.com>
 <CAD=FV=VMebqPd2ozLzY65Kba9snLKQ-KKd684O0cGQzyP0kcwQ@mail.gmail.com>
 <CAD=FV=UJOf7X-Jk0seB=Krt53Mzm6NztjP_KdT265zz=EsKp2A@mail.gmail.com>
In-Reply-To: <CAD=FV=UJOf7X-Jk0seB=Krt53Mzm6NztjP_KdT265zz=EsKp2A@mail.gmail.com>

--------------m91Ni10vFAUgkizxnorHgkuh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMxLjAxLjIzIHVtIDIyOjI3IHNjaHJpZWIgRG91ZyBBbmRlcnNvbjoNCj4gSGks
DQo+IA0KPiBPbiBUaHUsIEphbiAyNiwgMjAyMyBhdCA0OjUyIFBNIERvdWcgQW5kZXJzb24g
PGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6DQo+Pg0KPj4gSGksDQo+Pg0KPj4gT24g
V2VkLCBKYW4gMTgsIDIwMjMgYXQgMTozNCBQTSBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0Bj
aHJvbWl1bS5vcmc+IHdyb3RlOg0KPj4+DQo+Pj4gSGksDQo+Pj4NCj4+PiBPbiBUaHUsIEph
biA1LCAyMDIzIGF0IDc6MDEgUE0gU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3Jn
PiB3cm90ZToNCj4+Pj4NCj4+Pj4gVGhlIHVucHJlcGFyZSBzZXF1ZW5jZSBoYXMgc3RhcnRl
ZCB0byBmYWlsIGFmdGVyIG1vdmluZyB0byBwYW5lbCBicmlkZ2UNCj4+Pj4gY29kZSBpbiB0
aGUgbXNtIGRybSBkcml2ZXIgKGNvbW1pdCAwMDdhYzAyNjJiMGQgKCJkcm0vbXNtL2RzaTog
c3dpdGNoIHRvDQo+Pj4+IERSTV9QQU5FTF9CUklER0UiKSkuIFlvdSdsbCBzZWUgbWVzc2Fn
ZXMgbGlrZSB0aGlzIGluIHRoZSBrZXJuZWwgbG9nczoNCj4+Pj4NCj4+Pj4gICAgIHBhbmVs
LWJvZS10djEwMXd1bS1ubDYgYWU5NDAwMC5kc2kuMDogZmFpbGVkIHRvIHNldCBwYW5lbCBv
ZmY6IC0yMg0KPj4+Pg0KPj4+PiBUaGlzIGlzIGJlY2F1c2UgYm9lX3BhbmVsX2VudGVyX3Ns
ZWVwX21vZGUoKSBuZWVkcyBhbiBvcGVyYXRpbmcgRFNJIGxpbmsNCj4+Pj4gdG8gc2V0IHRo
ZSBwYW5lbCBpbnRvIHNsZWVwIG1vZGUuIFBlcmZvcm1pbmcgdGhvc2Ugd3JpdGVzIGluIHRo
ZQ0KPj4+PiB1bnByZXBhcmUgcGhhc2Ugb2YgYnJpZGdlIG9wcyBpcyB0b28gbGF0ZSwgYmVj
YXVzZSB0aGUgbGluayBoYXMgYWxyZWFkeQ0KPj4+PiBiZWVuIHRvcm4gZG93biBieSB0aGUg
RFNJIGNvbnRyb2xsZXIgaW4gcG9zdF9kaXNhYmxlLCBpLmUuIHRoZSBQSFkgaGFzDQo+Pj4+
IGJlZW4gZGlzYWJsZWQsIGV0Yy4gU2VlIGRzaV9tZ3JfYnJpZGdlX3Bvc3RfZGlzYWJsZSgp
IGZvciBtb3JlIGRldGFpbHMNCj4+Pj4gb24gdGhlIERTSSAuDQo+Pj4+DQo+Pj4+IFNwbGl0
IHRoZSB1bnByZXBhcmUgZnVuY3Rpb24gaW50byBhIGRpc2FibGUgcGFydCBhbmQgYW4gdW5w
cmVwYXJlIHBhcnQuDQo+Pj4+IEZvciBub3csIGp1c3QgdGhlIERTSSB3cml0ZXMgdG8gZW50
ZXIgc2xlZXAgbW9kZSBhcmUgcHV0IGluIHRoZSBkaXNhYmxlDQo+Pj4+IGZ1bmN0aW9uLiBU
aGlzIGZpeGVzIHRoZSBwYW5lbCBvZmYgcm91dGluZSBhbmQga2VlcHMgdGhlIHBhbmVsIGhh
cHB5Lg0KPj4+Pg0KPj4+PiBNeSBXb3JtZGluZ2xlciBoYXMgYW4gaW50ZWdyYXRlZCB0b3Vj
aHNjcmVlbiB0aGF0IHN0b3BzIHJlc3BvbmRpbmcgdG8NCj4+Pj4gdG91Y2ggaWYgdGhlIHBh
bmVsIGlzIG9ubHkgaGFsZiBkaXNhYmxlZCB0b28uIFRoaXMgcGF0Y2ggZml4ZXMgaXQuIEFu
ZA0KPj4+PiBmaW5hbGx5LCB0aGlzIHNhdmVzIHBvd2VyIHdoZW4gdGhlIHNjcmVlbiBpcyBv
ZmYgYmVjYXVzZSB3aXRob3V0IHRoaXMNCj4+Pj4gZml4IHRoZSByZWd1bGF0b3JzIGZvciB0
aGUgcGFuZWwgYXJlIGxlZnQgZW5hYmxlZCB3aGVuIG5vdGhpbmcgaXMgYmVpbmcNCj4+Pj4g
ZGlzcGxheWVkIG9uIHRoZSBzY3JlZW4uDQo+Pj4+DQo+Pj4+IEZpeGVzOiAwMDdhYzAyNjJi
MGQgKCJkcm0vbXNtL2RzaTogc3dpdGNoIHRvIERSTV9QQU5FTF9CUklER0UiKQ0KPj4+PiBG
aXhlczogYTg2OWI5ZGI3YWRmICgiZHJtL3BhbmVsOiBzdXBwb3J0IGZvciBib2UgdHYxMDF3
dW0tbmw2IHd1eGdhIGRzaSB2aWRlbyBtb2RlIHBhbmVsIikNCj4+Pj4gQ2M6IHlhbmdjb25n
IDx5YW5nY29uZzVAaHVhcWluLmNvcnAtcGFydG5lci5nb29nbGUuY29tPg0KPj4+PiBDYzog
RG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPj4+PiBDYzogSml0
YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPg0KPj4+PiBDYzogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPg0KPj4+PiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hy
b21pdW0ub3JnPg0KPj4+PiBDYzogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtv
dkBsaW5hcm8ub3JnPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVwaGVuIEJveWQgPHN3Ym95
ZEBjaHJvbWl1bS5vcmc+DQo+Pj4+IC0tLQ0KPj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMgfCAxNiArKysrKysrKysrKystLS0tDQo+Pj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9l
LXR2MTAxd3VtLW5sNi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEw
MXd1bS1ubDYuYw0KPj4+PiBpbmRleCA4NTdhMmYwNDIwZDcuLmM5MjRmMTEyNGViYyAxMDA2
NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1
bS1ubDYuYw0KPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2
MTAxd3VtLW5sNi5jDQo+Pj4+IEBAIC0xMTkzLDE0ICsxMTkzLDExIEBAIHN0YXRpYyBpbnQg
Ym9lX3BhbmVsX2VudGVyX3NsZWVwX21vZGUoc3RydWN0IGJvZV9wYW5lbCAqYm9lKQ0KPj4+
PiAgICAgICAgICByZXR1cm4gMDsNCj4+Pj4gICB9DQo+Pj4+DQo+Pj4+IC1zdGF0aWMgaW50
IGJvZV9wYW5lbF91bnByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpDQo+Pj4+ICtz
dGF0aWMgaW50IGJvZV9wYW5lbF9kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQ0K
Pj4+PiAgIHsNCj4+Pj4gICAgICAgICAgc3RydWN0IGJvZV9wYW5lbCAqYm9lID0gdG9fYm9l
X3BhbmVsKHBhbmVsKTsNCj4+Pj4gICAgICAgICAgaW50IHJldDsNCj4+Pj4NCj4+Pj4gLSAg
ICAgICBpZiAoIWJvZS0+cHJlcGFyZWQpDQo+Pj4+IC0gICAgICAgICAgICAgICByZXR1cm4g
MDsNCj4+Pj4gLQ0KPj4+PiAgICAgICAgICByZXQgPSBib2VfcGFuZWxfZW50ZXJfc2xlZXBf
bW9kZShib2UpOw0KPj4+PiAgICAgICAgICBpZiAocmV0IDwgMCkgew0KPj4+PiAgICAgICAg
ICAgICAgICAgIGRldl9lcnIocGFuZWwtPmRldiwgImZhaWxlZCB0byBzZXQgcGFuZWwgb2Zm
OiAlZFxuIiwgcmV0KTsNCj4+Pj4gQEAgLTEyMDksNiArMTIwNiwxNiBAQCBzdGF0aWMgaW50
IGJvZV9wYW5lbF91bnByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpDQo+Pj4+DQo+
Pj4+ICAgICAgICAgIG1zbGVlcCgxNTApOw0KPj4+Pg0KPj4+PiArICAgICAgIHJldHVybiAw
Ow0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+ICtzdGF0aWMgaW50IGJvZV9wYW5lbF91bnByZXBh
cmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgICAgc3Ry
dWN0IGJvZV9wYW5lbCAqYm9lID0gdG9fYm9lX3BhbmVsKHBhbmVsKTsNCj4+Pj4gKw0KPj4+
PiArICAgICAgIGlmICghYm9lLT5wcmVwYXJlZCkNCj4+Pj4gKyAgICAgICAgICAgICAgIHJl
dHVybiAwOw0KPj4+PiArDQo+Pj4+ICAgICAgICAgIGlmIChib2UtPmRlc2MtPmRpc2NoYXJn
ZV9vbl9kaXNhYmxlKSB7DQo+Pj4+ICAgICAgICAgICAgICAgICAgcmVndWxhdG9yX2Rpc2Fi
bGUoYm9lLT5hdmVlKTsNCj4+Pj4gICAgICAgICAgICAgICAgICByZWd1bGF0b3JfZGlzYWJs
ZShib2UtPmF2ZGQpOw0KPj4+PiBAQCAtMTUyOCw2ICsxNTM1LDcgQEAgc3RhdGljIGVudW0g
ZHJtX3BhbmVsX29yaWVudGF0aW9uIGJvZV9wYW5lbF9nZXRfb3JpZW50YXRpb24oc3RydWN0
IGRybV9wYW5lbCAqcGENCj4+Pj4gICB9DQo+Pj4+DQo+Pj4+ICAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fcGFuZWxfZnVuY3MgYm9lX3BhbmVsX2Z1bmNzID0gew0KPj4+PiArICAgICAg
IC5kaXNhYmxlID0gYm9lX3BhbmVsX2Rpc2FibGUsDQo+Pj4+ICAgICAgICAgIC51bnByZXBh
cmUgPSBib2VfcGFuZWxfdW5wcmVwYXJlLA0KPj4+PiAgICAgICAgICAucHJlcGFyZSA9IGJv
ZV9wYW5lbF9wcmVwYXJlLA0KPj4+PiAgICAgICAgICAuZW5hYmxlID0gYm9lX3BhbmVsX2Vu
YWJsZSwNCj4+Pg0KPj4+IEFzIG1lbnRpb25lZCBieSBTdGVwaGVuLCBteSBpbml0aWFsIHJl
YWN0aW9uIHdhcyB0aGF0IHRoaXMgZmVsdA0KPj4+IGFzeW1tZXRyaWMuIFdlIHdlcmUgbW92
aW5nIHNvbWUgc3R1ZmYgZnJvbSB1bnByZXBhcmUoKSB0byBkaXNhYmxlKCkNCj4+PiBhbmQg
aXQgZmVsdCBsaWtlIHRoYXQgd291bGQgbWVhbiB3ZSB3b3VsZCBhbHNvIG5lZWQgdG8gbW92
ZSBzb21ldGhpbmcNCj4+PiBmcm9tIHByZXBhcmUoKSB0byBlbmFibGUuIEluaXRpYWxseSBJ
IHRob3VnaHQgbWF5YmUgdGhhdCAic29tZXRoaW5nIg0KPj4+IHdhcyBhbGwgb2YgYm9lX3Bh
bmVsX2luaXRfZGNzX2NtZCgpIGJ1dCBJIGd1ZXNzIHRoYXQgZGlkbid0IHdvcmsuDQo+Pj4N
Cj4+PiBJIGRvbid0IHRydWx5IGhhdmUgYSByZWFzb24gdGhhdCB0aGlzIF9oYXNfIHRvIGJl
IHN5bW1ldHJpYy4gSSB3YXMNCj4+PiBpbml0aWFsbHkgd29ycmllZCB0aGF0IHRoZXJlIG1p
Z2h0IGJlIHNvbWUgcGxhY2Ugd2hlcmUgd2UgY2FsbA0KPj4+IHByZV9lbmFibGUoKSwgdGhl
biBuZXZlciBjYWxsIGVuYWJsZSgpIC8gZGlzYWJsZSgpLCBhbmQgdGhlbiBjYWxsDQo+Pj4g
cG9zdF9kaXNhYmxlKCkuIFRoYXQgY291bGQgaGF2ZSB1cyBpbiBhIGJhZCBzdGF0ZSBiZWNh
dXNlIHdlJ2QgbmV2ZXINCj4+PiBlbnRlciBzbGVlcCBtb2RlIC8gdHVybiB0aGUgZGlzcGxh
eSBvZmYuIEhvd2V2ZXIgKGFzIEkgdGhpbmsgSSd2ZQ0KPj4+IGRpc2NvdmVyZWQgYmVmb3Jl
IGFuZCBqdXN0IGZvcmdvdCksIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBwb3NzaWJsZQ0KPj4+
IGJlY2F1c2Ugd2UgYWx3YXlzIGNhbGwgcHJlLWVuYWJsZSgpIGFuZCBlbmFibGUoKSB0b2dl
dGhlci4gQWxzbywgYXMNCj4+PiBtZW50aW9uZWQgYnkgU2FtLCB3ZSdyZSBhYm91dCB0byBm
dWxseSBzaHV0IHRoZSBwYW5lbCdzIHBvd2VyIG9mZiBzbw0KPj4+ICh1bmxlc3MgaXQncyBv
biBhIHNoYXJlZCByYWlsKSBpdCBwcm9iYWJseSBkb2Vzbid0IHJlYWxseSBtYXR0ZXIuDQo+
Pj4NCj4+PiBUaHVzLCBJJ2QgYmUgT0sgd2l0aDoNCj4+Pg0KPj4+IFJldmlld2VkLWJ5OiBE
b3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+DQo+Pj4NCj4+PiBJJ20g
YWxzbyBoYXBweSB0byBsYW5kIHRoaXMgKGFkZGluZyBDYzogc3RhYmxlKSB0byBkcm0tbWlz
Yy1maXhlcyBpZg0KPj4+IG5vYm9keSBoYXMgYW55IG9iamVjdGlvbnMgKGFsc28gaGFwcHkg
aWYgc29tZW9uZSBlbHNlIHdhbnRzIHRvIGxhbmQNCj4+PiBpdCkuIEkgZ3Vlc3MgdGhlIG9u
ZSB3b3JyeSBJIGhhdmUgaXMgdGhhdCBzb21laG93IHRoaXMgY291bGQgYnJlYWsNCj4+PiBz
b21ldGhpbmcgZm9yIG9uZSBvZiB0aGUgb3RoZXIgOCBwYW5lbHMgdGhhdCB0aGlzIGRyaXZl
ciBzdXBwb3J0cyAob3INCj4+PiBpdCBjb3VsZCBoYXZlIGJhZCBpbnRlcmFjdGlvbnMgd2l0
aCB0aGUgZGlzcGxheSBjb250cm9sbGVyIHVzZWQgb24gYQ0KPj4+IGJvYXJkIHdpdGggb25l
IG9mIHRoZXNlIHBhbmVscz8pLiBNYXliZSB3ZSBzaG91bGQgaGF2ZSAiQ2M6IHN0YWJsZSIN
Cj4+PiBvZmYganVzdCB0byBnaXZlIGl0IGV4dHJhIGJha2UgdGltZT8gLi4uYW5kIG1heWJl
IGV2ZW4gcHVzaCB0bw0KPj4+IGRybS1taXNjLW5leHQgaW5zdGVhZCBvZiAtZml4ZXMgYWdh
aW4gdG8gZ2l2ZSBleHRyYSBiYWtlIHRpbWU/DQo+Pg0KPj4gVGhpcyB0aHJlYWQgaGFzIGdv
bmUgc2lsZW50LiBJJ2xsIHBsYW4gdG8gbGFuZCB0aGUgcGF0Y2ggaW4NCj4+IGRybS1taXNj
LW5leHQgZWFybHkgbmV4dCB3ZWVrLCBtYXliZSBNb25kYXksIF93aXRob3V0XyBDY2luZyBz
dGFibGUsDQo+PiBzbyB3ZSBoYXZlIHRoZSBsb25nZXN0IHBvc3NpYmxlIGJha2UgdGltZS4g
SWYgYW55b25lIGhhcyBvYmplY3Rpb25zLA0KPj4gcGxlYXNlIHllbGwuDQo+IA0KPiBQdXNo
ZWQgdG8gZHJtLW1pc2MtbmV4dDoNCg0KSSd2ZSBzZWVuIHRoaXMgZGlzY3Vzc2lvbiB0b28g
bGF0ZS4gSSBoYXZlIG5vdyBjaGVycnktcGlja2VkIHRoZSBwYXRjaCANCmludG8gZHJtLW1p
c2MtZml4ZXMuDQoNCj4gDQo+IGM5MTNjZDU0ODk5MyBkcm0vcGFuZWw6IGJvZS10djEwMXd1
bS1ubDY6IEVuc3VyZSBEU0kgd3JpdGVzIHN1Y2NlZWQNCj4gZHVyaW5nIGRpc2FibGUNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------m91Ni10vFAUgkizxnorHgkuh--

--------------MS0l4IiGP2l7w39nnvc0J1oQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPaRscFAwAAAAAACgkQlh/E3EQov+Ci
sQ//cJ4B7aztdvKvefDKrJ5psaaGBv3LErd2+zjQb9i+d3zpz9q81BDo8OyT9bfyGoOXGr6Zwz0V
kuWaVzYFXabCccICvowczQlOczgJj2Ml/IhZPUZHPCpFT2bHUt2QM0WljNDlXFuu6buE07+6xPN8
Tn3eeQHkX09Vb3Gnkw0ifbbOLs7xMPbFU4tdBhYjAOVr2cUcWpWU1xCpttm22Ay2EigLUI4LKEqS
yku6sYhhn6uO/NS4CK3bUo8rniv1rnW15/uS675T0VKPOrNrjjUeFHIDuTh/LcVp6FDtn7wFXtxf
4WcDtnuuQTrJufq3cadpYo3FFZ7Erzp3YgpT/U2J7N/KAASvvienWGWgP0ymgGWC1isuTr8mJVjZ
Mm7VKHgFIHn04aAVNB1iwglV3yp+FfUpRg8UMeEEzG6q38tab48G7u03mp+dcihZGIMN1FHBKIya
S7ZCZFJ+m0sHk8PX+DvfsLLhEzF5SnHvb3LavJeFCbR3VvLilA2ew8YedR66XHlcEJj+YfyEvxSu
6RsH2lz0s0Ac5sxtDF7bhowyIloHzp5aVt4CmwsLhWaDMdzRTqDlGrySwl402yMScpv4B/DLYS/L
lqEa8DXIauXfaJqVaY/9Ood2AXUsrUU6td087i7EON6I0JkwX+ueQLY1xEXTU82ELBDUOPnloPGD
8o0=
=JFmR
-----END PGP SIGNATURE-----

--------------MS0l4IiGP2l7w39nnvc0J1oQ--
