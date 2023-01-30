Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FA6680762
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 09:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D65410E148;
	Mon, 30 Jan 2023 08:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9037A10E148
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 08:28:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C91571FD72;
 Mon, 30 Jan 2023 08:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675067317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQRl6qbJGy3BJjmVIWe6bw8MUALqPOBomUoGDkU5lN0=;
 b=ECNgzCF13FEo5Ws8LcAA/LS2HWXWCqPKyrnTdrGA+Ug772XBFIvI9XODq6KBwWS9MR2Sm0
 20YeyFdDUUNyDUWLjtNbZh9oJ4gqLFEcUcEjdcSyFYzDFwPJUJNHOXyNKR4BxpWCZi1ywF
 P724250MiW+SXWIodRvKm5GQ97qaiZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675067317;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQRl6qbJGy3BJjmVIWe6bw8MUALqPOBomUoGDkU5lN0=;
 b=UdeJ9ZcLcwXL19KSWLDusoHEZ3SLVYlpvdOMBzmahQp6zfxumhVF4WjOwM4XRG/wc8J6dW
 uzf686lU6Z9FhHBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D42813A06;
 Mon, 30 Jan 2023 08:28:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GHNBJbV/12PcTQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 30 Jan 2023 08:28:37 +0000
Message-ID: <2a5b5059-9f60-a5bc-cbb7-8267349b2eac@suse.de>
Date: Mon, 30 Jan 2023 09:28:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] fbdev: Fix invalid page access after closing deferred
 I/O devices
To: Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>
References: <20230129082856.22113-1-tiwai@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230129082856.22113-1-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Dho9ne5BT7ziIXF88vgRxWe"
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patrik Jakobsson <pjakobsson@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Dho9ne5BT7ziIXF88vgRxWe
Content-Type: multipart/mixed; boundary="------------lRQQWQyhNpLducckKzzb6XKY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patrik Jakobsson <pjakobsson@suse.de>
Message-ID: <2a5b5059-9f60-a5bc-cbb7-8267349b2eac@suse.de>
Subject: Re: [PATCH v2] fbdev: Fix invalid page access after closing deferred
 I/O devices
References: <20230129082856.22113-1-tiwai@suse.de>
In-Reply-To: <20230129082856.22113-1-tiwai@suse.de>

--------------lRQQWQyhNpLducckKzzb6XKY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDEuMjMgdW0gMDk6Mjggc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IFdo
ZW4gYSBmYmRldiB3aXRoIGRlZmVycmVkIEkvTyBpcyBvbmNlIG9wZW5lZCBhbmQgY2xvc2Vk
LCB0aGUgZGlydHkNCj4gcGFnZXMgc3RpbGwgcmVtYWluIHF1ZXVlZCBpbiB0aGUgcGFnZXJl
ZiBsaXN0LCBhbmQgZXZlbnR1YWxseSBsYXRlcg0KPiB0aG9zZSBtYXkgYmUgcHJvY2Vzc2Vk
IGluIHRoZSBkZWxheWVkIHdvcmsuICBUaGlzIG1heSBsZWFkIHRvIGENCj4gY29ycnVwdGlv
biBvZiBwYWdlcywgaGl0dGluZyBhbiBPb3BzLg0KDQpEbyB5b3UgaGF2ZSBtb3JlIGluZm9y
bWF0aW9uIG9uIHRoaXMgcHJvYmxlbT8NCg0KVGhlIG1tYXAnZWQgYnVmZmVyIG9mIHRoZSBm
YmRldiBkZXZpY2UgY29tZXMgZnJvbSBhIHZtYWxsb2MgY2FsbC4gVGhhdCANCm1lbW9yeSdz
IGxvY2F0aW9uIG5ldmVyIGNoYW5nZXM7IGV2ZW4gYWNyb3NzIHBhaXJzIG9mIG9wZW4vY2xv
c2Ugb24gdGhlIA0KZGV2aWNlIGZpbGUuIEknbSBzdXJwcmlzZWQgdGhhdCBhIHBhZ2UgZW50
cnkgYmVjb21lcyBpbnZhbGlkLg0KDQpJbiBkcm1fZmJkZXZfY2xlYW51cCgpLCB3ZSBmaXJz
dCByZW1vdmUgdGhlIGZiZGVmaW8gYXQgWzFdIGFuZCB0aGVuIA0KdmZyZWUoKSB0aGUgc2hh
ZG93IGJ1ZmZlci4gU28gdGhlIG1lbW9yeSBzaG91bGQgc3RpbGwgYmUgYXJvdW5kIHVudGls
IA0KZmJkZXZpbyBpcyBnb25lLg0KDQpbMV0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMj
TDIxNDYNCg0KPiANCj4gVGhpcyBwYXRjaCBtYWtlcyBzdXJlIHRvIGNhbmNlbCB0aGUgZGVs
YXllZCB3b3JrIGFuZCBjbGVhbiB1cCB0aGUNCj4gcGFnZXJlZiBsaXN0IGF0IGNsb3Npbmcg
dGhlIGRldmljZSBmb3IgYWRkcmVzc2luZyB0aGUgYnVnLiAgQSBwYXJ0IG9mDQo+IHRoZSBj
bGVhbnVwIGNvZGUgaXMgZmFjdG9yZWQgb3V0IGFzIGEgbmV3IGhlbHBlciBmdW5jdGlvbiB0
aGF0IGlzDQo+IGNhbGxlZCBmcm9tIHRoZSBjb21tb24gZmJfcmVsZWFzZSgpLg0KDQpUaGUg
ZGVsYXllZCB3b3JrIGlzIHJlcXVpcmVkIHRvIGNvcHkgdGhlIGZyYW1lYnVmZmVyIHRvIHRo
ZSBkZXZpY2UgDQpvdXRwdXQuIFNvIGlmIGl0J3MganVzdCBjYW5jZWxlZCwgY291bGQgdGhp
cyByZXN1bHQgaW4gbWlzc2luZyB1cGRhdGVzPw0KDQpUaGVyZSdzIGEgY2FsbCB0byBjYW5j
ZWxfZGVsYXllZF93b3JrX3N5bmMoKSBpbiB0aGUgbmV3IGhlbHBlciANCmZiX2RlZmVycmVk
X2lvX3JlbGVhc2UoKS4gSXMgdGhpcyB0aGUgcmlnaHQgZnVuY3Rpb24/IE1heWJlIA0KZmx1
c2hfZGVsYXllZF93b3JrKCkgaXMgYSBiZXR0ZXIgY2hvaWNlLg0KDQo+IA0KPiBSZXZpZXdl
ZC1ieTogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29uQGdtYWlsLmNvbT4N
Cj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBUYWth
c2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQoNClRoaXMgY291bGQgdXNlIGEgRml4ZXMgdGFn
LiBJdCdzIG5vdCBleGFjdGx5IGNsZWFyIHRvIG1lIHdoZW4gdGhpcyANCnByb2JsZW0gZ290
IG9yaWdpbmFsbHkgaW50cm9kdWNlZCwgYnV0IHRoZSByZWNlbnQgcmVmYWN0b3Jpbmcgc2Vl
bXMgYSANCmNhbmRpZGF0ZS4NCg0KRml4ZXM6IDU2YzEzNGY3ZjFiNSAoImZiZGV2OiBUcmFj
ayBkZWZlcnJlZC1JL08gcGFnZXMgaW4gcGFnZXJlZiBzdHJ1Y3QiKQ0KQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KQ2M6IEphdmllciBNYXJ0aW5leiBD
YW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQpDYzogTWF4aW1lIFJpcGFyZCA8
bXJpcGFyZEBrZXJuZWwub3JnPg0KQ2M6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+
DQpDYzogVk13YXJlIEdyYXBoaWNzIFJldmlld2VycyA8bGludXgtZ3JhcGhpY3MtbWFpbnRh
aW5lckB2bXdhcmUuY29tPg0KQ2M6IEpheWEgS3VtYXIgPGpheWFsa0BpbnR3b3Jrcy5iaXo+
DQpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KQ2M6ICJLLiBZLiBTcmlu
aXZhc2FuIiA8a3lzQG1pY3Jvc29mdC5jb20+DQpDYzogSGFpeWFuZyBaaGFuZyA8aGFpeWFu
Z3pAbWljcm9zb2Z0LmNvbT4NCkNjOiBXZWkgTGl1IDx3ZWkubGl1QGtlcm5lbC5vcmc+DQpD
YzogRGV4dWFuIEN1aSA8ZGVjdWlAbWljcm9zb2Z0LmNvbT4NCkNjOiBTdGV2ZSBHbGVuZGlu
bmluZyA8c3RldmUuZ2xlbmRpbm5pbmdAc2hhd2VsbC5uZXQ+DQpDYzogQmVybmllIFRob21w
c29uIDxiZXJuaWVAcGx1Z2FibGUuY29tPg0KQ2M6IEhlbGdlIERlbGxlciA8ZGVsbGVyQGdt
eC5kZT4NCkNjOiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4Lmlu
dGVsLmNvbT4NCkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPg0KQ2M6IFN0ZXBoZW4gS2l0dCA8c3RldmVAc2syLm9yZz4NCkNjOiBQZXRlciBT
dXRpIDxwZXRlci5zdXRpQHN0cmVhbXVubGltaXRlZC5jb20+DQpDYzogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPg0KQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+DQpDYzogeWUgeGluZ2NoZW4gPHllLnhpbmdjaGVuQHp0ZS5jb20u
Y24+DQpDYzogUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+DQpDYzogSm9obiBPZ25l
c3MgPGpvaG4ub2duZXNzQGxpbnV0cm9uaXguZGU+DQpDYzogVG9tIFJpeCA8dHJpeEByZWRo
YXQuY29tPg0KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBsaW51
eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcNCkNjOiBsaW51eC1oeXBlcnZAdmdlci5rZXJuZWwu
b3JnDQpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjUuMTkrDQoNCj4gLS0tDQo+
IHYxLT52MjogRml4IGJ1aWxkIGVycm9yIHdpdGhvdXQgQ09ORklHX0ZCX0RFRkVSUkVEX0lP
DQo+IA0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jIHwgMTAgKysr
KysrKysrLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jICAgIHwgIDQg
KysrKw0KPiAgIGluY2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAgICAgIHwgIDEgKw0K
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5j
IGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4gaW5kZXggYzczMDI1
M2FiODVjLi41ODNjYmNmMDk0NDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYl9kZWZpby5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9m
Yl9kZWZpby5jDQo+IEBAIC0zMTMsNyArMzEzLDcgQEAgdm9pZCBmYl9kZWZlcnJlZF9pb19v
cGVuKHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MX0dQ
TChmYl9kZWZlcnJlZF9pb19vcGVuKTsNCj4gICANCj4gLXZvaWQgZmJfZGVmZXJyZWRfaW9f
Y2xlYW51cChzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gK3ZvaWQgZmJfZGVmZXJyZWRfaW9f
cmVsZWFzZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gICB7DQo+ICAgCXN0cnVjdCBmYl9k
ZWZlcnJlZF9pbyAqZmJkZWZpbyA9IGluZm8tPmZiZGVmaW87DQo+ICAgCXN0cnVjdCBwYWdl
ICpwYWdlOw0KPiBAQCAtMzI3LDYgKzMyNywxNCBAQCB2b2lkIGZiX2RlZmVycmVkX2lvX2Ns
ZWFudXAoc3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICAgCQlwYWdlID0gZmJfZGVmZXJyZWRf
aW9fcGFnZShpbmZvLCBpKTsNCj4gICAJCXBhZ2UtPm1hcHBpbmcgPSBOVUxMOw0KPiAgIAl9
DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MX0dQTChmYl9kZWZlcnJlZF9pb19yZWxlYXNlKTsN
Cg0KSXQncyBhbGwgaW4gdGhlIHNhbWUgbW9kdWxlLiBObyBuZWVkIHRvIGV4cG9ydCB0aGlz
IHN5bWJvbC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiArDQo+ICt2b2lkIGZiX2Rl
ZmVycmVkX2lvX2NsZWFudXAoc3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICt7DQo+ICsJc3Ry
dWN0IGZiX2RlZmVycmVkX2lvICpmYmRlZmlvID0gaW5mby0+ZmJkZWZpbzsNCj4gKw0KPiAr
CWZiX2RlZmVycmVkX2lvX3JlbGVhc2UoaW5mbyk7DQo+ICAgDQo+ICAgCWt2ZnJlZShpbmZv
LT5wYWdlcmVmcyk7DQo+ICAgCW11dGV4X2Rlc3Ryb3koJmZiZGVmaW8tPmxvY2spOw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPiBpbmRleCAzYTZjODQ1OGViOGQuLmFiMzU0
NWEwMGFiYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVt
LmMNCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMNCj4gQEAgLTE0
NTQsNiArMTQ1NCwxMCBAQCBfX3JlbGVhc2VzKCZpbmZvLT5sb2NrKQ0KPiAgIAlzdHJ1Y3Qg
ZmJfaW5mbyAqIGNvbnN0IGluZm8gPSBmaWxlLT5wcml2YXRlX2RhdGE7DQo+ICAgDQo+ICAg
CWxvY2tfZmJfaW5mbyhpbmZvKTsNCj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19GQl9ERUZF
UlJFRF9JTykNCj4gKwlpZiAoaW5mby0+ZmJkZWZpbykNCj4gKwkJZmJfZGVmZXJyZWRfaW9f
cmVsZWFzZShpbmZvKTsNCj4gKyNlbmRpZg0KPiAgIAlpZiAoaW5mby0+ZmJvcHMtPmZiX3Jl
bGVhc2UpDQo+ICAgCQlpbmZvLT5mYm9wcy0+ZmJfcmVsZWFzZShpbmZvLDEpOw0KDQoNCj4g
ICAJbW9kdWxlX3B1dChpbmZvLT5mYm9wcy0+b3duZXIpOw0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9mYi5oIGIvaW5jbHVkZS9saW51eC9mYi5oDQo+IGluZGV4IDk2Yjk2MzIz
ZTljYi4uNzNlYjFmODVlYThlIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZiLmgN
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9mYi5oDQo+IEBAIC02NjIsNiArNjYyLDcgQEAgZXh0
ZXJuIGludCAgZmJfZGVmZXJyZWRfaW9faW5pdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7DQo+
ICAgZXh0ZXJuIHZvaWQgZmJfZGVmZXJyZWRfaW9fb3BlbihzdHJ1Y3QgZmJfaW5mbyAqaW5m
bywNCj4gICAJCQkJc3RydWN0IGlub2RlICppbm9kZSwNCj4gICAJCQkJc3RydWN0IGZpbGUg
KmZpbGUpOw0KPiArZXh0ZXJuIHZvaWQgZmJfZGVmZXJyZWRfaW9fcmVsZWFzZShzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbyk7DQo+ICAgZXh0ZXJuIHZvaWQgZmJfZGVmZXJyZWRfaW9fY2xlYW51
cChzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7DQo+ICAgZXh0ZXJuIGludCBmYl9kZWZlcnJlZF9p
b19mc3luYyhzdHJ1Y3QgZmlsZSAqZmlsZSwgbG9mZl90IHN0YXJ0LA0KPiAgIAkJCQlsb2Zm
X3QgZW5kLCBpbnQgZGF0YXN5bmMpOw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAz
NjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------lRQQWQyhNpLducckKzzb6XKY--

--------------0Dho9ne5BT7ziIXF88vgRxWe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPXf7QFAwAAAAAACgkQlh/E3EQov+DO
rg/9GhWCC/Z0NjP7E3yoSDWqJevVIkw4NKv+aImkqCuwEN1GxJn0V88dDf5gzTTFgOL1rDLoFit1
sDprH+X0OVyY63lZ4tM0ao5JStTtRDuXhWHJXZF5R2Y4z4DdtPZlWOUSXqVm4BnhGkb+S/PZ8fug
BHUHJ0GxA96QtjIu7VWTmkSM8jC5YtOWIq1aJzjXVKL/P0Muno0Q0RWaE9+Fr3DOJFmNrcT8vXxP
Q7b1R2Yif2GcSNEBE7iQOzZelYxKmfRWBmMhqyWzY7LjJdMETfrA7YTnL+Z1djubBQ+9co1KK8Tf
85fV2sXiDiBlVnY3Ev/BLYZ7KXjPciaJacOUI68QR+Ht8cWpxE/Zjq1yMlylY9RYFkH+36aXyTPu
HLlgRMyXM8+CbDi/HiMngpyNGjaqTMXgq4tgXnJxi6kk01rFgBC+NdLqKUOlhycm0hMuH+FtIWSw
rntBO5RRc7STVGwUoleePN7ZsaWsmGkjLOUpx3WyCFYpWMY0/+A1c53mMqGzJ1HWyALD3A8wTVE7
070htioa/MlB+AMMJ4LUjFI4DY7LxkrBcp77an+sGjNAB+PcM4lt6pCKUGFpO1amEsZ8ZRbljFZw
nGFj+JAy59U/ipt0ZB98TwiWeqnfWKQInIwEXPdS5jL/E1zxaTLbtoKYkrCQrBhPYbnkWezwAIy2
MEI=
=lPhs
-----END PGP SIGNATURE-----

--------------0Dho9ne5BT7ziIXF88vgRxWe--
