Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A487549E492
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9266910E27F;
	Thu, 27 Jan 2022 14:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC03210E219;
 Thu, 27 Jan 2022 14:26:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 19E94218D9;
 Thu, 27 Jan 2022 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643293604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qkKymbU4u855IjZtmJFOcwp6gY+Q/ceYNOhefCCfveo=;
 b=nhnd+CEmc2EtpndY7n+0uMn/vTs9PRiDhTVCeA/YnENN1tJv7fJrFk8J4AW16Vay/eNUm2
 AFmBgpXKhPX8nbkj83DxTDrRRMRv1df2FB94QE2f7EpDiLRMrzP0n7Dlqm7RSWfogmh4Wr
 Y3hlrk9W1oC2VT7LIjKstfAmp6UA/zA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643293604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qkKymbU4u855IjZtmJFOcwp6gY+Q/ceYNOhefCCfveo=;
 b=ynPnZVMQ3zqa+0cKjXQ0Df/UFOmPCdk2snvImfnxa3/uWcDlHz+2ouSRugHnprUxhX13GF
 +My6/h9Qr8GM5KCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E495813BF9;
 Thu, 27 Jan 2022 14:26:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3rjaNqOr8mF1QAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jan 2022 14:26:43 +0000
Message-ID: <b7057779-2df8-8737-e174-fcb138544dfb@suse.de>
Date: Thu, 27 Jan 2022 15:26:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/19] dma-buf-map: Add read/write helpers
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-2-lucas.demarchi@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220126203702.1784589-2-lucas.demarchi@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wrwd0Yw0wz2X0kWcNQWE68HB"
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wrwd0Yw0wz2X0kWcNQWE68HB
Content-Type: multipart/mixed; boundary="------------Aw6QOcMQfdXUzvUokqCJsVWb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Message-ID: <b7057779-2df8-8737-e174-fcb138544dfb@suse.de>
Subject: Re: [PATCH 01/19] dma-buf-map: Add read/write helpers
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-2-lucas.demarchi@intel.com>
In-Reply-To: <20220126203702.1784589-2-lucas.demarchi@intel.com>

--------------Aw6QOcMQfdXUzvUokqCJsVWb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDEuMjIgdW0gMjE6MzYgc2NocmllYiBMdWNhcyBEZSBNYXJjaGk6DQo+
IEluIGNlcnRhaW4gc2l0dWF0aW9ucyBpdCdzIHVzZWZ1bCB0byBiZSBhYmxlIHRvIHJlYWQg
b3Igd3JpdGUgdG8gYW4NCj4gb2Zmc2V0IHRoYXQgaXMgY2FsY3VsYXRlZCBieSBoYXZpbmcg
dGhlIG1lbW9yeSBsYXlvdXQgZ2l2ZW4gYnkgYSBzdHJ1Y3QNCj4gZGVjbGFyYXRpb24uIFVz
dWFsbHkgd2UgYXJlIGdvaW5nIHRvIHJlYWQvd3JpdGUgYSB1OCwgdTE2LCB1MzIgb3IgdTY0
Lg0KPiANCj4gQWRkIGEgcGFpciBvZiBtYWNyb3MgZG1hX2J1Zl9tYXBfcmVhZF9maWVsZCgp
L2RtYV9idWZfbWFwX3dyaXRlX2ZpZWxkKCkNCj4gdG8gY2FsY3VsYXRlIHRoZSBvZmZzZXQg
b2YgYSBzdHJ1Y3QgbWVtYmVyIGFuZCBtZW1jcHkgdGhlIGRhdGEgZnJvbS90bw0KPiB0aGUg
ZG1hX2J1Zl9tYXAuIFdlIGNvdWxkIHVzZSByZWFkYiwgcmVhZHcsIHJlYWRsLCByZWFkcSBh
bmQgdGhlIHdyaXRlKg0KPiBjb3VudGVycGFydHMsIGhvd2V2ZXIgZHVlIHRvIGFsaWdubWVu
dCBpc3N1ZXMgdGhpcyBtYXkgbm90IHdvcmsgb24gYWxsDQo+IGFyY2hpdGVjdHVyZXMuIElm
IGFsaWdubWVudCBuZWVkcyB0byBiZSBjaGVja2VkIHRvIGNhbGwgdGhlIHJpZ2h0DQo+IGZ1
bmN0aW9uLCBpdCdzIG5vdCBwb3NzaWJsZSB0byBkZWNpZGUgYXQgY29tcGlsZS10aW1lIHdo
aWNoIGZ1bmN0aW9uIHRvDQo+IGNhbGw6IHNvIGp1c3QgbGVhdmUgdGhlIGRlY2lzaW9uIHRv
IHRoZSBtZW1jcHkgZnVuY3Rpb24gdGhhdCB3aWxsIGRvDQo+IGV4YWN0bHkgdGhhdCBvbiBJ
TyBtZW1vcnkgb3IgZGVyZWZlcmVuY2UgdGhlIHBvaW50ZXIuDQo+IA0KPiBDYzogU3VtaXQg
U2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4NCj4gQ2M6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIu
a2VybmVsLm9yZw0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBD
YzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnDQo+IENjOiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVj
YXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gICBpbmNsdWRlL2xpbnV4L2RtYS1i
dWYtbWFwLmggfCA4MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYt
bWFwLmgNCj4gaW5kZXggMTlmYTBiNWFlNWVjLi42NWU5MjdkOWNlMzMgMTAwNjQ0DQo+IC0t
LSBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4
L2RtYS1idWYtbWFwLmgNCj4gQEAgLTYsNiArNiw3IEBADQo+ICAgI2lmbmRlZiBfX0RNQV9C
VUZfTUFQX0hfXw0KPiAgICNkZWZpbmUgX19ETUFfQlVGX01BUF9IX18NCj4gICANCj4gKyNp
bmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4g
ICAjaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+DQo+ICAgDQo+IEBAIC0yMjksNiArMjMwLDQ2
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkbWFfYnVmX21hcF9jbGVhcihzdHJ1Y3QgZG1hX2J1
Zl9tYXAgKm1hcCkNCj4gICAJfQ0KPiAgIH0NCj4gICANCj4gKy8qKg0KPiArICogZG1hX2J1
Zl9tYXBfbWVtY3B5X3RvX29mZnNldCAtIE1lbWNweSBpbnRvIG9mZnNldCBvZiBkbWEtYnVm
IG1hcHBpbmcNCj4gKyAqIEBkc3Q6CVRoZSBkbWEtYnVmIG1hcHBpbmcgc3RydWN0dXJlDQo+
ICsgKiBAb2Zmc2V0OglUaGUgb2Zmc2V0IGZyb20gd2hpY2ggdG8gY29weQ0KPiArICogQHNy
YzoJVGhlIHNvdXJjZSBidWZmZXINCj4gKyAqIEBsZW46CVRoZSBudW1iZXIgb2YgYnl0ZSBp
biBzcmMNCj4gKyAqDQo+ICsgKiBDb3BpZXMgZGF0YSBpbnRvIGEgZG1hLWJ1ZiBtYXBwaW5n
IHdpdGggYW4gb2Zmc2V0LiBUaGUgc291cmNlIGJ1ZmZlciBpcyBpbg0KPiArICogc3lzdGVt
IG1lbW9yeS4gRGVwZW5kaW5nIG9uIHRoZSBidWZmZXIncyBsb2NhdGlvbiwgdGhlIGhlbHBl
ciBwaWNrcyB0aGUNCj4gKyAqIGNvcnJlY3QgbWV0aG9kIG9mIGFjY2Vzc2luZyB0aGUgbWVt
b3J5Lg0KPiArICovDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZG1hX2J1Zl9tYXBfbWVtY3B5
X3RvX29mZnNldChzdHJ1Y3QgZG1hX2J1Zl9tYXAgKmRzdCwgc2l6ZV90IG9mZnNldCwNCj4g
KwkJCQkJCWNvbnN0IHZvaWQgKnNyYywgc2l6ZV90IGxlbikNCj4gK3sNCj4gKwlpZiAoZHN0
LT5pc19pb21lbSkNCj4gKwkJbWVtY3B5X3RvaW8oZHN0LT52YWRkcl9pb21lbSArIG9mZnNl
dCwgc3JjLCBsZW4pOw0KPiArCWVsc2UNCj4gKwkJbWVtY3B5KGRzdC0+dmFkZHIgKyBvZmZz
ZXQsIHNyYywgbGVuKTsNCj4gK30NCg0KUGxlYXNlIGRvbid0IGFkZCBhIG5ldyBmdW5jdGlv
bi4gUmF0aGVyIHBsZWFzZSBhZGQgdGhlIG9mZnNldCBwYXJhbWV0ZXIgDQp0byBkbWFfYnVm
X21hcF9tZW1jcHlfdG8oKSBhbmQgdXBkYXRlIHRoZSBjYWxsZXJzLiBUaGVyZSBhcmUgb25s
eSB0d28gDQpjYWxscyB0byBkbWFfYnVmX21hcF9tZW1jcHlfdG8oKSB3aXRoaW4gdGhlIGtl
cm5lbC4gVG8gbWFrZSBpdCBjbGVhciANCndoYXQgdGhlIG9mZnNldCBhcHBsaWVzIHRvLCBJ
J2QgY2FsbCB0aGUgcGFyYW1ldGVyICdkc3Rfb2Zmc2V0Jy4NCg0KPiArDQo+ICsvKioNCj4g
KyAqIGRtYV9idWZfbWFwX21lbWNweV9mcm9tX29mZnNldCAtIE1lbWNweSBmcm9tIG9mZnNl
dCBvZiBkbWEtYnVmIG1hcHBpbmcgaW50byBzeXN0ZW0gbWVtb3J5DQo+ICsgKiBAZHN0OglE
ZXN0aW5hdGlvbiBpbiBzeXN0ZW0gbWVtb3J5DQo+ICsgKiBAc3JjOglUaGUgZG1hLWJ1ZiBt
YXBwaW5nIHN0cnVjdHVyZQ0KPiArICogQHNyYzoJVGhlIG9mZnNldCBmcm9tIHdoaWNoIHRv
IGNvcHkNCj4gKyAqIEBsZW46CVRoZSBudW1iZXIgb2YgYnl0ZSBpbiBzcmMNCj4gKyAqDQo+
ICsgKiBDb3BpZXMgZGF0YSBmcm9tIGEgZG1hLWJ1ZiBtYXBwaW5nIHdpdGggYW4gb2Zmc2V0
LiBUaGUgZGVzdCBidWZmZXIgaXMgaW4NCj4gKyAqIHN5c3RlbSBtZW1vcnkuIERlcGVuZGlu
ZyBvbiB0aGUgbWFwcGluZyBsb2NhdGlvbiwgdGhlIGhlbHBlciBwaWNrcyB0aGUNCj4gKyAq
IGNvcnJlY3QgbWV0aG9kIG9mIGFjY2Vzc2luZyB0aGUgbWVtb3J5Lg0KPiArICovDQo+ICtz
dGF0aWMgaW5saW5lIHZvaWQgZG1hX2J1Zl9tYXBfbWVtY3B5X2Zyb21fb2Zmc2V0KHZvaWQg
KmRzdCwgY29uc3Qgc3RydWN0IGRtYV9idWZfbWFwICpzcmMsDQo+ICsJCQkJCQkgIHNpemVf
dCBvZmZzZXQsIHNpemVfdCBsZW4pDQo+ICt7DQo+ICsJaWYgKHNyYy0+aXNfaW9tZW0pDQo+
ICsJCW1lbWNweV9mcm9taW8oZHN0LCBzcmMtPnZhZGRyX2lvbWVtICsgb2Zmc2V0LCBsZW4p
Ow0KPiArCWVsc2UNCj4gKwkJbWVtY3B5KGRzdCwgc3JjLT52YWRkciArIG9mZnNldCwgbGVu
KTsNCj4gK30NCj4gKw0KDQpXaXRoIHRoZSBkbWFfYnVmX21hcF9tZW1jcHlfdG8oKSBjaGFu
Z2VzLCBwbGVhc2UganVzdCBjYWxsIHRoaXMgZnVuY3Rpb24gDQpkbWFfYnVmX21hcF9tZW1j
cHlfZnJvbSgpLg0KDQo+ICAgLyoqDQo+ICAgICogZG1hX2J1Zl9tYXBfbWVtY3B5X3RvIC0g
TWVtY3B5IGludG8gZG1hLWJ1ZiBtYXBwaW5nDQo+ICAgICogQGRzdDoJVGhlIGRtYS1idWYg
bWFwcGluZyBzdHJ1Y3R1cmUNCj4gQEAgLTI2Myw0ICszMDQsNDQgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGRtYV9idWZfbWFwX2luY3Ioc3RydWN0IGRtYV9idWZfbWFwICptYXAsIHNpemVf
dCBpbmNyKQ0KPiAgIAkJbWFwLT52YWRkciArPSBpbmNyOw0KPiAgIH0NCj4gICANCj4gKy8q
Kg0KPiArICogZG1hX2J1Zl9tYXBfcmVhZF9maWVsZCAtIFJlYWQgc3RydWN0IG1lbWJlciBm
cm9tIGRtYS1idWYgbWFwcGluZyB3aXRoDQo+ICsgKiBhcmJpdHJhcnkgc2l6ZSBhbmQgaGFu
ZGxpbmcgdW4tYWxpZ25lZCBhY2Nlc3Nlcw0KPiArICoNCj4gKyAqIEBtYXBfXzoJVGhlIGRt
YS1idWYgbWFwcGluZyBzdHJ1Y3R1cmUNCj4gKyAqIEB0eXBlX186CVRoZSBzdHJ1Y3QgdG8g
YmUgdXNlZCBjb250YWluaW5nIHRoZSBmaWVsZCB0byByZWFkDQo+ICsgKiBAZmllbGRfXzoJ
TWVtYmVyIGZyb20gc3RydWN0IHdlIHdhbnQgdG8gcmVhZA0KPiArICoNCj4gKyAqIFJlYWQg
YSB2YWx1ZSBmcm9tIGRtYS1idWYgbWFwcGluZyBjYWxjdWxhdGluZyB0aGUgb2Zmc2V0IGFu
ZCBzaXplOiB0aGlzIGFzc3VtZXMNCj4gKyAqIHRoZSBkbWEtYnVmIG1hcHBpbmcgaXMgYWxp
Z25lZCB3aXRoIGEgYSBzdHJ1Y3QgdHlwZV9fLiBBIHNpbmdsZSB1OCwgdTE2LCB1MzINCj4g
KyAqIG9yIHU2NCBjYW4gYmUgcmVhZCwgYmFzZWQgb24gdGhlIG9mZnNldCBhbmQgc2l6ZSBv
ZiB0eXBlX18uZmllbGRfXy4NCj4gKyAqLw0KPiArI2RlZmluZSBkbWFfYnVmX21hcF9yZWFk
X2ZpZWxkKG1hcF9fLCB0eXBlX18sIGZpZWxkX18pICh7CQkJCVwNCj4gKwl0eXBlX18gKnRf
XzsJCQkJCQkJCQlcDQo+ICsJdHlwZW9mKHRfXy0+ZmllbGRfXykgdmFsX187CQkJCQkJCVwN
Cj4gKwlkbWFfYnVmX21hcF9tZW1jcHlfZnJvbV9vZmZzZXQoJnZhbF9fLCBtYXBfXywgb2Zm
c2V0b2YodHlwZV9fLCBmaWVsZF9fKSwJXA0KPiArCQkJCSAgICAgICBzaXplb2YodF9fLT5m
aWVsZF9fKSk7CQkJCVwNCj4gKwl2YWxfXzsJCQkJCQkJCQkJXA0KPiArfSkNCj4gKw0KPiAr
LyoqDQo+ICsgKiBkbWFfYnVmX21hcF93cml0ZV9maWVsZCAtIFdyaXRlIHN0cnVjdCBtZW1i
ZXIgdG8gdGhlIGRtYS1idWYgbWFwcGluZyB3aXRoDQo+ICsgKiBhcmJpdHJhcnkgc2l6ZSBh
bmQgaGFuZGxpbmcgdW4tYWxpZ25lZCBhY2Nlc3Nlcw0KPiArICoNCj4gKyAqIEBtYXBfXzoJ
VGhlIGRtYS1idWYgbWFwcGluZyBzdHJ1Y3R1cmUNCj4gKyAqIEB0eXBlX186CVRoZSBzdHJ1
Y3QgdG8gYmUgdXNlZCBjb250YWluaW5nIHRoZSBmaWVsZCB0byB3cml0ZQ0KPiArICogQGZp
ZWxkX186CU1lbWJlciBmcm9tIHN0cnVjdCB3ZSB3YW50IHRvIHdyaXRlDQo+ICsgKiBAdmFs
X186CVZhbHVlIHRvIGJlIHdyaXR0ZW4NCj4gKyAqDQo+ICsgKiBXcml0ZSBhIHZhbHVlIHRv
IHRoZSBkbWEtYnVmIG1hcHBpbmcgY2FsY3VsYXRpbmcgdGhlIG9mZnNldCBhbmQgc2l6ZS4N
Cj4gKyAqIEEgc2luZ2xlIHU4LCB1MTYsIHUzMiBvciB1NjQgY2FuIGJlIHdyaXR0ZW4gYmFz
ZWQgb24gdGhlIG9mZnNldCBhbmQgc2l6ZSBvZg0KPiArICogdHlwZV9fLmZpZWxkX18uDQo+
ICsgKi8NCj4gKyNkZWZpbmUgZG1hX2J1Zl9tYXBfd3JpdGVfZmllbGQobWFwX18sIHR5cGVf
XywgZmllbGRfXywgdmFsX18pICh7CQkJXA0KPiArCXR5cGVfXyAqdF9fOwkJCQkJCQkJCVwN
Cj4gKwl0eXBlb2YodF9fLT5maWVsZF9fKSB2YWxfX19fID0gdmFsX187CQkJCQkJXA0KPiAr
CWRtYV9idWZfbWFwX21lbWNweV90b19vZmZzZXQobWFwX18sIG9mZnNldG9mKHR5cGVfXywg
ZmllbGRfXyksCQkJXA0KPiArCQkJCSAgICAgJnZhbF9fX18sIHNpemVvZih0X18tPmZpZWxk
X18pKTsJCQlcDQo+ICt9KQ0KDQpBcyB0aGUgb3JpZ2luYWwgYXV0aG9yIG9mIHRoaXMgZmls
ZSwgSSBmZWVsIGxpa2UgdGhpcyBzaG91bGRuJ3QgYmUgaGVyZS4gDQpBdCBsZWFzdCBub3Qg
dW50aWwgd2UgaGF2ZSBhbm90aGVyIGRyaXZlciB1c2luZyB0aGF0IHBhdHRlcm4uDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gKw0KPiAgICNlbmRpZiAvKiBfX0RNQV9CVUZfTUFQ
X0hfXyAqLw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Aw6QOcMQfdXUzvUokqCJsVWb--

--------------wrwd0Yw0wz2X0kWcNQWE68HB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHyq6MFAwAAAAAACgkQlh/E3EQov+AQ
/Q//b90gIWU4R3JA00li+PNQRWUckxSpzgUWZ2njJnxmAFDZIkBUd1jOYrEvDtpgrBRkA1OpGv1f
0Jb+GKmz2jxdQNqA7xtbxtDXMrR6TnZm09+caI/BLtbL8+KDEu8FBYBBuRyKflICnu2DSV/onp7x
BbZzDI9jrgMWoFPxxewEZpn17LGf+wA155n2BsLW0H1vCu0CBnM4vlNJhIlLOycd1Q8Y67t01OPC
p1nfgpA7dbmjUBkbHseWJjSL9psSsHf56EXxfTvTzwhzSVIZ4+Myv7emNJcabYyMrh1X5Auwdwcq
2uGdsP+nnC4qRQtaiBybI98Kjr5K0q0feSg08iU1USa5HXjOpN4s4YDM5JVUAiahRCLyICXWsreu
dUoZSYtM0ZV2RN8dn+YcNebKyluSGcwn3M2aBxrj5nmuUpcF7vsfLYK9JQEjnHzk6vt68dnFZYPv
5hhlzJUZVVStDq042kpaemEVsaLW4wGuWPO1xqAbKEr6yeqCTroKxVqQwLcS/BfwdQUX1iuOW3So
sZug4WLQ/ZonclSowtm6+BlC1KBFzgH3DWzkODTaEnO6hAviShsclSXtD9XjHrRZFFmqUBgfLWCc
AayZ69oQuPa1XZYpRsSAvmT2EQqOix69QpKyjKs3cltxB8/CgYRDJt+n69yQQ45BmYdbqmSCUOKi
R9I=
=oNB8
-----END PGP SIGNATURE-----

--------------wrwd0Yw0wz2X0kWcNQWE68HB--
