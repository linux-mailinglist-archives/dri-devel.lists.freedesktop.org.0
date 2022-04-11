Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F884FC572
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 22:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A1410F289;
	Mon, 11 Apr 2022 20:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A5D10F28A;
 Mon, 11 Apr 2022 20:05:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A1D091F7AD;
 Mon, 11 Apr 2022 20:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649707550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1pt81Ck4x3qSosxsi+EKBi9IZrxIJffklmHrjxWK3b8=;
 b=W/gvCPwLNw59QyCKy+13WkS8ZrvszPluKsFXmT2RFTls15I4EkUAKoRCcMz+ooMy/y4wwZ
 V+h4SMYAyjnE+sIBHzkkQEyWP9F9Xg2Tpn+US3vZT7ldNqA+saODwcYYp/ZCsJgNmJKE0L
 YkuxVSjvs2tx6Fzp5TqXR5mGzIYw1Mk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649707550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1pt81Ck4x3qSosxsi+EKBi9IZrxIJffklmHrjxWK3b8=;
 b=zipwT6tuEmz8rFIe0LKHytxSr0syCpYyEBom0a2rqRes/btlgri6CUGv7vAAWrxwRx8XEv
 RXPwlouY3y2mnwDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BD7C13AB5;
 Mon, 11 Apr 2022 20:05:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iWrLGB6KVGK2QgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Apr 2022 20:05:50 +0000
Message-ID: <7d49198b-778d-f715-09e1-d9ff3def6a33@suse.de>
Date: Mon, 11 Apr 2022 22:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/ttm: stop passing NULL fence in
 ttm_bo_move_sync_cleanup
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220411085603.58156-1-matthew.auld@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220411085603.58156-1-matthew.auld@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------13WhuFUH00LzUF0oBHgvDlzT"
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------13WhuFUH00LzUF0oBHgvDlzT
Content-Type: multipart/mixed; boundary="------------wZfM5Yt4X0rtBqFTLImWkyOL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>
Message-ID: <7d49198b-778d-f715-09e1-d9ff3def6a33@suse.de>
Subject: Re: [PATCH] drm/ttm: stop passing NULL fence in
 ttm_bo_move_sync_cleanup
References: <20220411085603.58156-1-matthew.auld@intel.com>
In-Reply-To: <20220411085603.58156-1-matthew.auld@intel.com>

--------------wZfM5Yt4X0rtBqFTLImWkyOL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDExLjA0LjIyIHVtIDEwOjU2IHNjaHJpZWIgTWF0dGhldyBBdWxkOg0KPiBJZiB3
ZSBoaXQgdGhlIHN5bmMgY2FzZSwgbGlrZSB3aGVuIHNraXBwaW5nIGNsZWFyaW5nIGZvciBr
ZXJuZWwgaW50ZXJuYWwNCj4gb2JqZWN0cywgb3Igd2hlbiBmYWxsaW5nIGJhY2sgdG8gY3B1
IGNsZWFyaW5nLCBsaWtlIGluIGk5MTUsIHdlIGVuZCB1cA0KPiB0cnlpbmcgdG8gYWRkIGEg
TlVMTCBmZW5jZSwgYnV0IHdpdGggc29tZSByZWNlbnQgY2hhbmdlcyBpbiB0aGlzIGFyZWEN
Cj4gdGhpcyBub3cganVzdCByZXN1bHRzIGluIE5VTEwgZGVyZWYgaW4gZG1hX3Jlc3ZfYWRk
X2ZlbmNlOg0KPiANCj4gPDE+WyAgICA1LjQ2NjM4M10gQlVHOiBrZXJuZWwgTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDA4DQo+IDwxPlsgICAg
NS40NjYzODRdICNQRjogc3VwZXJ2aXNvciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQ0K
PiA8MT5bICAgIDUuNDY2Mzg1XSAjUEY6IGVycm9yX2NvZGUoMHgwMDAwKSAtIG5vdC1wcmVz
ZW50IHBhZ2UNCj4gPDY+WyAgICA1LjQ2NjM4Nl0gUEdEIDAgUDREIDANCj4gPDQ+WyAgICA1
LjQ2NjM4N10gT29wczogMDAwMCBbIzFdIFBSRUVNUFQgU01QIE5PUFRJDQo+IDw0PlsgICAg
NS40NjYzODldIENQVTogNSBQSUQ6IDI2NyBDb21tOiBtb2Rwcm9iZSBOb3QgdGFpbnRlZCA1
LjE4LjAtcmMyLUNJLUNJX0RSTV8xMTQ4MSsgIzENCj4gPDQ+WyAgICA1LjQ2NjM5MV0gUklQ
OiAwMDEwOmRtYV9yZXN2X2FkZF9mZW5jZSsweDYzLzB4MjYwDQo+IDw0PlsgICAgNS40NjYz
OTVdIENvZGU6IDM4IDg1IGMwIDBmIDg0IGRmIDAxIDAwIDAwIDBmIDg4IGU4IDAxIDAwIDAw
IDgzIGMwIDAxIDBmIDg4IGRmIDAxIDAwIDAwIDhiIDA1IDM1IDg5IDEwIDAxIDQ5IDhkIDVl
IDY4IDg1IGMwIDBmIDg1IDQ1IDAxIDAwIDAwIDw0OD4gOGIgNDUgMDggNDggM2QgYzAgYTUg
MGEgODIgMGYgODQgNWMgMDEgMDAgMDAgNDggM2QgNjAgYTUgMGEgODINCj4gPDQ+WyAgICA1
LjQ2NjM5Nl0gUlNQOiAwMDE4OmZmZmZjOTAwMDBlOTc0ZjggRUZMQUdTOiAwMDAxMDIwMg0K
PiA8ND5bICAgIDUuNDY2Mzk3XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDEgUkJYOiBmZmZmODg4
MTIzZTg4YjI4IFJDWDogMDAwMDAwMDBmZmZmZmZmZg0KPiA8ND5bICAgIDUuNDY2Mzk4XSBS
RFg6IDAwMDAwMDAwMDAwMDAwMDEgUlNJOiBmZmZmZmZmZjgyMmU0ZjUwIFJESTogZmZmZmZm
ZmY4MjMzZjA4Nw0KPiA8ND5bICAgIDUuNDY2Mzk5XSBSQlA6IDAwMDAwMDAwMDAwMDAwMDAg
UjA4OiBmZmZmODg4MTMxM2RiYzgwIFIwOTogMDAwMDAwMDAwMDAwMDAwMQ0KPiA8ND5bICAg
IDUuNDY2Mzk5XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDEgUjExOiAwMDAwMDAwMGRhMzU0Mjk0
IFIxMjogMDAwMDAwMDAwMDAwMDAwMA0KPiA8ND5bICAgIDUuNDY2NDAwXSBSMTM6IGZmZmY4
ODgxMDkyN2RjNTggUjE0OiBmZmZmODg4MTIzZTg4YWMwIFIxNTogZmZmZjg4ODEwYTg4ZDYw
MA0KPiA8ND5bICAgIDUuNDY2NDAxXSBGUzogIDAwMDA3ZjVmYTExOTM1NDAoMDAwMCkgR1M6
ZmZmZjg4ODQ1ZDg4MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQo+IDw0Plsg
ICAgNS40NjY0MDJdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAw
ODAwNTAwMzMNCj4gPDQ+WyAgICA1LjQ2NjQwMl0gQ1IyOiAwMDAwMDAwMDAwMDAwMDA4IENS
MzogMDAwMDAwMDEwNmRkNjAwMyBDUjQ6IDAwMDAwMDAwMDAzNzA2ZTANCj4gPDQ+WyAgICA1
LjQ2NjQwM10gRFIwOiAwMDAwMDAwMDAwMDAwMDAwIERSMTogMDAwMDAwMDAwMDAwMDAwMCBE
UjI6IDAwMDAwMDAwMDAwMDAwMDANCj4gPDQ+WyAgICA1LjQ2NjQwNF0gRFIzOiAwMDAwMDAw
MDAwMDAwMDAwIERSNjogMDAwMDAwMDBmZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAwMDA0MDAN
Cj4gPDQ+WyAgICA1LjQ2NjQwNF0gQ2FsbCBUcmFjZToNCj4gPDQ+WyAgICA1LjQ2NjQwNV0g
IDxUQVNLPg0KPiA8ND5bICAgIDUuNDY2NDA2XSAgdHRtX2JvX21vdmVfYWNjZWxfY2xlYW51
cCsweDYyLzB4MjcwIFt0dG1dDQo+IDw0PlsgICAgNS40NjY0MTFdICA/IGk5MTVfcnNndF9m
cm9tX2J1ZGR5X3Jlc291cmNlKzB4MTg1LzB4MWUwIFtpOTE1XQ0KPiA8ND5bICAgIDUuNDY2
NTI5XSAgaTkxNV90dG1fbW92ZSsweGZkLzB4NDMwIFtpOTE1XQ0KPiA8ND5bICAgIDUuNDY2
ODMzXSAgPyBkbWFfcmVzdl9yZXNlcnZlX2ZlbmNlcysweDRlLzB4MzIwDQo+IDw0PlsgICAg
NS40NjY4MzZdICA/IHR0bV9ib19hZGRfbW92ZV9mZW5jZS5jb25zdHByb3AuMjArMHhmNy8w
eDE0MCBbdHRtXQ0KPiA8ND5bICAgIDUuNDY2ODQxXSAgdHRtX2JvX2hhbmRsZV9tb3ZlX21l
bSsweGExLzB4MTQwIFt0dG1dDQo+IDw0PlsgICAgNS40NjY4NDVdICB0dG1fYm9fdmFsaWRh
dGUrMHhlZS8weDE2MCBbdHRtXQ0KPiA8ND5bICAgIDUuNDY2ODQ5XSAgX19pOTE1X3R0bV9n
ZXRfcGFnZXMrMHg0Zi8weDIxMCBbaTkxNV0NCj4gPDQ+WyAgICA1LjQ2Njk3Nl0gIGk5MTVf
dHRtX2dldF9wYWdlcysweGFkLzB4MTQwIFtpOTE1XQ0KPiA8ND5bICAgIDUuNDY3MDk0XSAg
X19fX2k5MTVfZ2VtX29iamVjdF9nZXRfcGFnZXMrMHgzMi8weGYwIFtpOTE1XQ0KPiA8ND5b
ICAgIDUuNDY3MjEwXSAgX19pOTE1X2dlbV9vYmplY3RfZ2V0X3BhZ2VzKzB4ODkvMHhhMCBb
aTkxNV0NCj4gPDQ+WyAgICA1LjQ2NzMyM10gIGk5MTVfdm1hX2dldF9wYWdlcysweDExNC8w
eDFkMCBbaTkxNV0NCj4gPDQ+WyAgICA1LjQ2NzQ0Nl0gIGk5MTVfdm1hX3Bpbl93dysweGQz
LzB4YTkwIFtpOTE1XQ0KPiA8ND5bICAgIDUuNDY3NTcwXSAgaTkxNV92bWFfcGluLmNvbnN0
cHJvcC4xMCsweDExOS8weDFiMCBbaTkxNV0NCj4gPDQ+WyAgICA1LjQ2NzcwMF0gID8gX19t
dXRleF91bmxvY2tfc2xvd3BhdGgrMHgzZS8weDJiMA0KPiA8ND5bICAgIDUuNDY3NzA0XSAg
aW50ZWxfYWxsb2NfaW5pdGlhbF9wbGFuZV9vYmouaXNyYS42KzB4MWE5LzB4MzkwIFtpOTE1
XQ0KPiA8ND5bICAgIDUuNDY3ODMzXSAgaW50ZWxfY3J0Y19pbml0aWFsX3BsYW5lX2NvbmZp
ZysweDgzLzB4MzQwIFtpOTE1XQ0KPiANCj4gSW4gdGhlIHR0bV9ib19tb3ZlX3N5bmNfY2xl
YW51cCgpIGNhc2UgaXQgc2VlbXMgd2Ugb25seSByZWFsbHkgY2FyZQ0KPiBhYm91dCBjYWxs
aW5nIHR0bV9ib193YWl0X2ZyZWVfbm9kZSgpLCBzbyBsZXQncyBpbnN0ZWFkIGp1c3QgY2Fs
bCB0aGF0DQo+IGRpcmVjdGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxk
IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRo
b21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogTHVjYXMgRGUgTWFyY2hpIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IENjOiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFz
QGxpbnV4LmludGVsLmNvbT4NCg0KVGVzdGVkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCg0Kd2l0aCBib2NocyBvbiBwcGM2NGxlLg0KDQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8IDE1ICsrKysrKysrKysr
KysrKw0KPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggICB8IDExICsrKy0t
LS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3V0aWwuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYw0KPiBpbmRleCBi
YzUxOTAzNDBiOWMuLjFjYmZiMDBjMWQ2NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdXRpbC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3V0aWwuYw0KPiBAQCAtNTcyLDYgKzU3MiwyMSBAQCBpbnQgdHRtX2JvX21vdmVfYWNj
ZWxfY2xlYW51cChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0KPiAgIH0NCj4gICBF
WFBPUlRfU1lNQk9MKHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXApOw0KPiAgIA0KPiArdm9p
ZCB0dG1fYm9fbW92ZV9zeW5jX2NsZWFudXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywNCj4gKwkJCSAgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm5ld19tZW0pDQo+ICt7DQo+
ICsJc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYgPSBiby0+YmRldjsNCj4gKwlzdHJ1Y3QgdHRt
X3Jlc291cmNlX21hbmFnZXIgKm1hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoYmRldiwgbmV3X21l
bS0+bWVtX3R5cGUpOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlyZXQgPSB0dG1fYm9fd2Fp
dF9mcmVlX25vZGUoYm8sIG1hbi0+dXNlX3R0KTsNCj4gKwlpZiAoV0FSTl9PTihyZXQpKQ0K
PiArCQlyZXR1cm47DQo+ICsNCj4gKwl0dG1fYm9fYXNzaWduX21lbShibywgbmV3X21lbSk7
DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MKHR0bV9ib19tb3ZlX3N5bmNfY2xlYW51cCk7DQo+
ICsNCj4gICAvKioNCj4gICAgKiB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyAtIHB1cmdlIHRo
ZSBjb250ZW50cyBvZiBhIGJvDQo+ICAgICogQGJvOiBUaGUgYnVmZmVyIG9iamVjdA0KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBiL2luY2x1ZGUv
ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgNCj4gaW5kZXggMDU5YTU5NWUxNGU1Li44OTdiODhm
MGJkNTkgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgN
Cj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaA0KPiBAQCAtMjQ1LDcg
KzI0NSw3IEBAIGludCB0dG1fYm9fbW92ZV9hY2NlbF9jbGVhbnVwKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sDQo+ICAgCQkJICAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3
X21lbSk7DQo+ICAgDQo+ICAgLyoqDQo+IC0gKiB0dG1fYm9fbW92ZV9hY2NlbF9jbGVhbnVw
Lg0KPiArICogdHRtX2JvX21vdmVfc3luY19jbGVhbnVwLg0KPiAgICAqDQo+ICAgICogQGJv
OiBBIHBvaW50ZXIgdG8gYSBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QuDQo+ICAgICogQG5l
d19tZW06IHN0cnVjdCB0dG1fcmVzb3VyY2UgaW5kaWNhdGluZyB3aGVyZSB0byBtb3ZlLg0K
PiBAQCAtMjUzLDEzICsyNTMsOCBAQCBpbnQgdHRtX2JvX21vdmVfYWNjZWxfY2xlYW51cChz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0KPiAgICAqIFNwZWNpYWwgY2FzZSBvZiB0
dG1fYm9fbW92ZV9hY2NlbF9jbGVhbnVwIHdoZXJlIHRoZSBibyBpcyBndWFyYW50ZWVkDQo+
ICAgICogYnkgdGhlIGNhbGxlciB0byBiZSBpZGxlLiBUeXBpY2FsbHkgdXNlZCBhZnRlciBt
ZW1jcHkgYnVmZmVyIG1vdmVzLg0KPiAgICAqLw0KPiAtc3RhdGljIGlubGluZSB2b2lkIHR0
bV9ib19tb3ZlX3N5bmNfY2xlYW51cChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0K
PiAtCQkJCQkgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3X21lbSkNCj4gLXsNCj4gLQlp
bnQgcmV0ID0gdHRtX2JvX21vdmVfYWNjZWxfY2xlYW51cChibywgTlVMTCwgdHJ1ZSwgZmFs
c2UsIG5ld19tZW0pOw0KPiAtDQo+IC0JV0FSTl9PTihyZXQpOw0KPiAtfQ0KPiArdm9pZCB0
dG1fYm9fbW92ZV9zeW5jX2NsZWFudXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywN
Cj4gKwkJCSAgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm5ld19tZW0pOw0KPiAgIA0KPiAg
IC8qKg0KPiAgICAqIHR0bV9ib19waXBlbGluZV9ndXR0aW5nLg0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------wZfM5Yt4X0rtBqFTLImWkyOL--

--------------13WhuFUH00LzUF0oBHgvDlzT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJUih0FAwAAAAAACgkQlh/E3EQov+Ax
8BAAk1GYne/ia826WPP0oPuMqdCK/EgNxw6C7O+jnGQHHlA+yMLTAcXyqiRCe8wfcuK+mpMM+I/O
RiYRE4yHCEBA1AHtSNO4fIvjnMu4h8J0Mq6Vufw/zhu3CMCai09sTUTpZvxLzTPadoulNWp6Hn77
FNzsbb9zwCYer76Q9GDDsVwCzFI0kn30Fd0Ay5qF9smkj0bcf7+XkuEY3DpntteLqPHle9jE3MBz
DKDlPwP9uh9fNT6jYmqZ1bzNCkjkiu1cjnylOUfSfa+QxtbwZtwMT1HDbph739Bfi8wfve3a2C5U
h4XoNp8nBMQR3pOY4cb7Ge4PzGwLPZozcUKsMCJsKdvV0jY0o6ddwFsqOiXp0ihpdsncPAAMrc4U
/yAjvXARiOWned+rqZFTMovmD1HPtFsvCDtt0gcxgom4Gd/Dh0kTy2qUPNvCLMLaVmG7DrlyYl2O
CmQzTtEakS/vQu9LFa9BJN7IEMEeyyWUV2yXkNcUnvtcfksjyWlR/njIs2GFSOvYYsFxU8hcNPQF
r5N5QeHJE0OPBu4DmU6t1CXHUD3t9YkUEBaIdFoCy4tOVRjIuP5TS252Psp12p4VfQGBe9eX7Mau
RwTauu8VOX1BdMkH/cFtP4Ma7IYYV64cTh91pdnhPzTRgKIz4/IWvTvLaqo7Ju805Erm+zy7EhaB
HPk=
=yFaG
-----END PGP SIGNATURE-----

--------------13WhuFUH00LzUF0oBHgvDlzT--
