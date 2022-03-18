Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE634DE1CF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 20:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157B210E092;
	Fri, 18 Mar 2022 19:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4BB10E092
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 19:32:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B14E9210ED;
 Fri, 18 Mar 2022 19:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647631949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pqhnpog4BQ4ozVqDgEAX1kfB1laK178CQw2B2LfpM78=;
 b=HaCvDwkZgh2QReOt20KkREqhf9MqVlnyJmXnjToKo+/HkMTV43WyK1i427yM5htxRtP58r
 E7oGc4QiOhPRYwEZahiBQpMyrteweT9NcR1maB94nn1O8+uA7seQjrT2iQyjSDYjLaFduz
 fNbmmjgzf3MH5ETkWQcN87JDVobGR8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647631949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pqhnpog4BQ4ozVqDgEAX1kfB1laK178CQw2B2LfpM78=;
 b=N89xAiHEIqxqTPuiRy9i8NgDAFVF9zXbklVXHsj+U8snKG+GeES9MKTK48SZAtcxmuc0RI
 GS9bh5kamty0ytBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 826F013443;
 Fri, 18 Mar 2022 19:32:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eCTSHk3eNGKQQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Mar 2022 19:32:29 +0000
Message-ID: <271cc90c-6d3b-f31c-2818-305d8c9f5ccd@suse.de>
Date: Fri, 18 Mar 2022 20:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] fbdev: defio: fix the pagelist corruption
Content-Language: en-US
To: Chuansheng Liu <chuansheng.liu@intel.com>, jayalk@intworks.biz,
 daniel@ffwll.ch, deller@gmx.de
References: <20220318005003.51810-1-chuansheng.liu@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220318005003.51810-1-chuansheng.liu@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WifhHxhy610Sx0rEzDBzuQf3"
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WifhHxhy610Sx0rEzDBzuQf3
Content-Type: multipart/mixed; boundary="------------X0DRCAzEqLr19O7qcBExfU8b";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chuansheng Liu <chuansheng.liu@intel.com>, jayalk@intworks.biz,
 daniel@ffwll.ch, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <271cc90c-6d3b-f31c-2818-305d8c9f5ccd@suse.de>
Subject: Re: [PATCH v2] fbdev: defio: fix the pagelist corruption
References: <20220318005003.51810-1-chuansheng.liu@intel.com>
In-Reply-To: <20220318005003.51810-1-chuansheng.liu@intel.com>

--------------X0DRCAzEqLr19O7qcBExfU8b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDMuMjIgdW0gMDE6NTAgc2NocmllYiBDaHVhbnNoZW5nIExpdToNCj4g
RWFzaWx5IGhpdCB0aGUgYmVsb3cgbGlzdCBjb3JydXB0aW9uOg0KPiA9PQ0KPiBsaXN0X2Fk
ZCBjb3JydXB0aW9uLiBwcmV2LT5uZXh0IHNob3VsZCBiZSBuZXh0IChmZmZmZmZmZmMwY2Vi
MDkwKSwgYnV0DQo+IHdhcyBmZmZmZWM2MDQ1MDdlZGM4LiAocHJldj1mZmZmZWM2MDQ1MDdl
ZGM4KS4NCj4gV0FSTklORzogQ1BVOiA2NSBQSUQ6IDM5NTkgYXQgbGliL2xpc3RfZGVidWcu
YzoyNg0KPiBfX2xpc3RfYWRkX3ZhbGlkKzB4NTMvMHg4MA0KPiBDUFU6IDY1IFBJRDogMzk1
OSBDb21tOiBmYmRldiBUYWludGVkOiBHICAgICBVDQo+IFJJUDogMDAxMDpfX2xpc3RfYWRk
X3ZhbGlkKzB4NTMvMHg4MA0KPiBDYWxsIFRyYWNlOg0KPiAgIDxUQVNLPg0KPiAgIGZiX2Rl
ZmVycmVkX2lvX21rd3JpdGUrMHhlYS8weDE1MA0KPiAgIGRvX3BhZ2VfbWt3cml0ZSsweDU3
LzB4YzANCj4gICBkb193cF9wYWdlKzB4Mjc4LzB4MmYwDQo+ICAgX19oYW5kbGVfbW1fZmF1
bHQrMHhkYzIvMHgxNTkwDQo+ICAgaGFuZGxlX21tX2ZhdWx0KzB4ZGQvMHgyYzANCj4gICBk
b191c2VyX2FkZHJfZmF1bHQrMHgxZDMvMHg2NTANCj4gICBleGNfcGFnZV9mYXVsdCsweDc3
LzB4MTgwDQo+ICAgPyBhc21fZXhjX3BhZ2VfZmF1bHQrMHg4LzB4MzANCj4gICBhc21fZXhj
X3BhZ2VfZmF1bHQrMHgxZS8weDMwDQo+IFJJUDogMDAzMzoweDdmZDk4ZmM4ZmFkMQ0KPiA9
PQ0KPiANCj4gRmlndXJlIG91dCB0aGUgcmFjZSBoYXBwZW5zIHdoZW4gb25lIHByb2Nlc3Mg
aXMgYWRkaW5nICZwYWdlLT5scnUgaW50bw0KPiB0aGUgcGFnZWxpc3QgdGFpbCBpbiBmYl9k
ZWZlcnJlZF9pb19ta3dyaXRlKCksIGFub3RoZXIgcHJvY2VzcyBpcw0KPiByZS1pbml0aWFs
aXppbmcgdGhlIHNhbWUgJnBhZ2UtPmxydSBpbiBmYl9kZWZlcnJlZF9pb19mYXVsdCgpLCB3
aGljaCBpcw0KPiBub3QgcHJvdGVjdGVkIGJ5IHRoZSBsb2NrLg0KPiANCj4gVGhpcyBmaXgg
aXMgdG8gaW5pdCBhbGwgdGhlIHBhZ2UgbGlzdHMgb25lIHRpbWUgZHVyaW5nIGluaXRpYWxp
emF0aW9uLA0KPiBpdCBub3Qgb25seSBmaXhlcyB0aGUgbGlzdCBjb3JydXB0aW9uLCBidXQg
YWxzbyBhdm9pZHMgSU5JVF9MSVNUX0hFQUQoKQ0KPiByZWR1bmRhbnRseS4NCj4gDQo+IFYy
OiBjaGFuZ2UgImludCBpIiB0byAidW5zaWduZWQgaW50IGkiIChHZWVydCBVeXR0ZXJob2V2
ZW4pDQoNClRoYW5rcyBhIGxvdC4gSSBhZGRlZCB0byBwYXRjaCB0byBkcm0tbWlzYy1uZXh0
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBGaXhlczogMTA1YTk0MDQxNmZj
ICgiZmJkZXYvZGVmaW86IEVhcmx5LW91dCBpZiBwYWdlIGlzIGFscmVhZHkNCj4gZW5saXN0
ZWQiKQ0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+
IENjOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBSZXZp
ZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+
DQo+IFJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCj4gU2lnbmVkLW9mZi1ieTogQ2h1YW5zaGVuZyBMaXUgPGNodWFuc2hlbmcubGl1QGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlv
LmMgfCA5ICsrKysrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvZmJfZGVmaW8uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5j
DQo+IGluZGV4IDk4YjBmMjNiZjVlMi4uYTFkYTU0MDE2Yzg4IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8uYw0KPiArKysgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8uYw0KPiBAQCAtNTksNyArNTksNiBAQCBzdGF0aWMg
dm1fZmF1bHRfdCBmYl9kZWZlcnJlZF9pb19mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikN
Cj4gICAJCXByaW50ayhLRVJOX0VSUiAibm8gbWFwcGluZyBhdmFpbGFibGVcbiIpOw0KPiAg
IA0KPiAgIAlCVUdfT04oIXBhZ2UtPm1hcHBpbmcpOw0KPiAtCUlOSVRfTElTVF9IRUFEKCZw
YWdlLT5scnUpOw0KPiAgIAlwYWdlLT5pbmRleCA9IHZtZi0+cGdvZmY7DQo+ICAgDQo+ICAg
CXZtZi0+cGFnZSA9IHBhZ2U7DQo+IEBAIC0yMjAsNiArMjE5LDggQEAgc3RhdGljIHZvaWQg
ZmJfZGVmZXJyZWRfaW9fd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ICAgdm9p
ZCBmYl9kZWZlcnJlZF9pb19pbml0KHN0cnVjdCBmYl9pbmZvICppbmZvKQ0KPiAgIHsNCj4g
ICAJc3RydWN0IGZiX2RlZmVycmVkX2lvICpmYmRlZmlvID0gaW5mby0+ZmJkZWZpbzsNCj4g
KwlzdHJ1Y3QgcGFnZSAqcGFnZTsNCj4gKwl1bnNpZ25lZCBpbnQgaTsNCj4gICANCj4gICAJ
QlVHX09OKCFmYmRlZmlvKTsNCj4gICAJbXV0ZXhfaW5pdCgmZmJkZWZpby0+bG9jayk7DQo+
IEBAIC0yMjcsNiArMjI4LDEyIEBAIHZvaWQgZmJfZGVmZXJyZWRfaW9faW5pdChzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbykNCj4gICAJSU5JVF9MSVNUX0hFQUQoJmZiZGVmaW8tPnBhZ2VsaXN0
KTsNCj4gICAJaWYgKGZiZGVmaW8tPmRlbGF5ID09IDApIC8qIHNldCBhIGRlZmF1bHQgb2Yg
MSBzICovDQo+ICAgCQlmYmRlZmlvLT5kZWxheSA9IEhaOw0KPiArDQo+ICsJLyogaW5pdGlh
bGl6ZSBhbGwgdGhlIHBhZ2UgbGlzdHMgb25lIHRpbWUgKi8NCj4gKwlmb3IgKGkgPSAwOyBp
IDwgaW5mby0+Zml4LnNtZW1fbGVuOyBpICs9IFBBR0VfU0laRSkgew0KPiArCQlwYWdlID0g
ZmJfZGVmZXJyZWRfaW9fcGFnZShpbmZvLCBpKTsNCj4gKwkJSU5JVF9MSVNUX0hFQUQoJnBh
Z2UtPmxydSk7DQo+ICsJfQ0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MX0dQTChmYl9kZWZl
cnJlZF9pb19pbml0KTsNCj4gICANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------X0DRCAzEqLr19O7qcBExfU8b--

--------------WifhHxhy610Sx0rEzDBzuQf3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmI03kwFAwAAAAAACgkQlh/E3EQov+B2
Eg//bY5N5/BlRStsAnjXHUJw+iELrcb3CfQVWzPT1HOhB4K+TYLxfNoehbO3N5dcKP9sZDV2F66X
Owv8NDmSoDgE+X+fco8C/MD1+nWywnqw9eCMF19cgSD0oqy4fKfbP53ubvD6M/CXb0gEkmijXKAA
ZgiepvCNJ3N3R8jXKo7gnIUlRG+CpiDTZ4Dp1X8TV4qvXohMNmBeFGwc5FQ/78DN8551V+HfZh2D
wTybwUdPDHHo7vY/ZRyTNxBwZ+WmTKxfl+XVXVdpIVNTe/DEj4kzHTmSLXP6FtSEHKuwrMy/ShxD
8sdi1T8gP7+vrqrHoCRtNzHY8KlcGfkMfqLUqx4+O95IAl9ZKQH/aGu4YyaBw60ApRmkR9ixbxnV
DzoVFCdkaJCL+OCFQKJ0U8fVoqnSaCjhwi9aE5Lc0Z2ZdeQiV3G1GhZrTtuQT2cFDO1oTkt/SZx6
IFYPUw9SkdoI+QBAsvUwyLzzxRB2Uk7FEBlN4l3NNXZ/tOrhq+Hvdk0IbD0tu4/DltC+y7d0MOWu
41c5kOXLECamZ5l+izivZt5t2Bk+jmMgXvai14q9MV5JAMK4KscKp6havv+FkWBacIwmKIhCFE9C
sI2gn1zUIQ7O5bLDR/DZTvuiFafBazaPzbfUysNbtn9KbO0K5tAZWJb6htu/W8QHXeQHzItDWtyr
04I=
=1H+N
-----END PGP SIGNATURE-----

--------------WifhHxhy610Sx0rEzDBzuQf3--
