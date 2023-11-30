Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470C7FEC72
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 11:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D9910E125;
	Thu, 30 Nov 2023 10:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5526F10E125
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 10:01:39 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D7DC921ABA;
 Thu, 30 Nov 2023 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701338497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KjxLaiPc4LmCfn6muUjucRKPN9M8w9yiM2KtvSfB5jU=;
 b=R25qP75rEJsPh3ly0wLnSaqMaaN5VX8Wnu8b65nfI0fHGiEbYmClU5b5NfiaXg2chtSTlA
 QEPta1NKCI5SsUFFB8VzSl3fmxjv93/6DIujNkx7GXQJmAJl6CXeQBvfADQgfpKGU3kORK
 /NtorTT8226qWMfFZctS590Vr7wjFw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701338497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KjxLaiPc4LmCfn6muUjucRKPN9M8w9yiM2KtvSfB5jU=;
 b=4lxEqUduxI+eeqXbd54foxyMHLQMbtdSJCy/cLvlFvCIZQJivIsP4XvUvmrNqc9wE9mhnj
 dPEenJWdmvJVqqAA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 84CAD13A5C;
 Thu, 30 Nov 2023 10:01:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id orQ/H4FdaGUzLgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Nov 2023 10:01:37 +0000
Message-ID: <6ea39432-5f0c-419d-8a0d-5e8cbde97a4d@suse.de>
Date: Thu, 30 Nov 2023 11:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm: enable W=1 warnings by default across the subsystem
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20231129181219.1237887-1-jani.nikula@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20231129181219.1237887-1-jani.nikula@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NWR8I09mSSUafci740gfvFuI"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -10.09
X-Spamd-Result: default: False [-10.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_TWELVE(0.00)[14];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:email];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 intel-gfx@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NWR8I09mSSUafci740gfvFuI
Content-Type: multipart/mixed; boundary="------------8D89vBe7ebgWX6a0lNDZLQAF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, Marijn Suijten <marijn.suijten@somainline.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan@freedesktop.org
Message-ID: <6ea39432-5f0c-419d-8a0d-5e8cbde97a4d@suse.de>
Subject: Re: [RFC] drm: enable W=1 warnings by default across the subsystem
References: <20231129181219.1237887-1-jani.nikula@intel.com>
In-Reply-To: <20231129181219.1237887-1-jani.nikula@intel.com>

--------------8D89vBe7ebgWX6a0lNDZLQAF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI5LjExLjIzIHVtIDE5OjEyIHNjaHJpZWIgSmFuaSBOaWt1bGE6DQo+IEF0IGxl
YXN0IHRoZSBpOTE1IGFuZCBhbWQgZHJpdmVycyBlbmFibGUgYSBidW5jaCBtb3JlIGNvbXBp
bGVyIHdhcm5pbmdzDQo+IHRoYW4gdGhlIGtlcm5lbCBkZWZhdWx0cy4NCj4gDQo+IEV4dGVu
ZCB0aGUgVz0xIHdhcm5pbmdzIHRvIHRoZSBlbnRpcmUgZHJtIHN1YnN5c3RlbSBieSBkZWZh
dWx0LiBVc2UgdGhlDQo+IGNvcHktcGFzdGVkIHdhcm5pbmdzIGZyb20gc2NyaXB0cy9NYWtl
ZmlsZS5leHRyYXdhcm4gd2l0aA0KPiBzL0tCVUlMRF9DRkxBR1Mvc3ViZGlyLWNjZmxhZ3Mt
eS8gdG8gbWFrZSBpdCBlYXNpZXIgdG8gY29tcGFyZSBhbmQga2VlcA0KPiB1cCB3aXRoIHRo
ZW0gaW4gdGhlIGZ1dHVyZS4NCj4gDQo+IFRoaXMgaXMgc2ltaWxhciB0byB0aGUgYXBwcm9h
Y2ggY3VycmVudGx5IHVzZWQgaW4gaTkxNS4NCj4gDQo+IFNvbWUgb2YgdGhlIC1XZXh0cmEg
d2FybmluZ3MgZG8gbmVlZCB0byBiZSBkaXNhYmxlZCwganVzdCBsaWtlIGluDQo+IE1ha2Vm
aWxlLmV4dHJhd2FybiwgYnV0IHRha2UgY2FyZSB0byBub3QgZGlzYWJsZSB0aGVtIGZvciBX
PTIgb3IgVz0zDQo+IGJ1aWxkcywgZGVwZW5kaW5nIG9uIHRoZSB3YXJuaW5nLg0KPiANCj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+DQo+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBDYzogTWF4aW1lIFJpcGFyZCA8bXJp
cGFyZEBrZXJuZWwub3JnPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+DQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQo+IENjOiBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPg0KPiBDYzogS2Fyb2wg
SGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+DQo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUBy
ZWRoYXQuY29tPg0KPiBDYzogRGFuaWxvIEtydW1tcmljaCA8ZGFrckByZWRoYXQuY29tPg0K
PiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPg0KPiBDYzogQWJoaW5hdiBL
dW1hciA8cXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbT4NCj4gQ2M6IERtaXRyeSBCYXJ5c2hr
b3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gQ2M6IFNlYW4gUGF1bCA8c2Vh
bkBwb29ybHkucnVuPg0KPiBDYzogTWFyaWpuIFN1aWp0ZW4gPG1hcmlqbi5zdWlqdGVuQHNv
bWFpbmxpbmUub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAaW50ZWwuY29tPg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQoNCj4gDQo+IC0tLQ0KPiANCj4gV2l0aCBteSBhZG1pdHRlZGx5IGxp
bWl0ZWQgYW5kIHZlcnkgbXVjaCB4ODYgZm9jdXNlZCBrZXJuZWwgY29uZmlnLCBJDQo+IGdl
dCBzb21lIC1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgYW5kIC1XZm9ybWF0LXRydW5jYXRp
b249IHdhcm5pbmdzLA0KPiBidXQgbm90aGluZyB3ZSBjYW4ndCBoYW5kbGUuDQo+IA0KPiBX
ZSBjb3VsZCBmaXggdGhlbSB1cCBmcm9udCwgb3IgZGlzYWJsZSB0aGUgZXh0cmEgd2Fybmlu
Z3Mgb24gYSBwZXINCj4gZHJpdmVyIGJhc2lzIHdpdGggYSBGSVhNRSBjb21tZW50IGluIHRo
ZWlyIHJlc3BlY3RpdmUgTWFrZWZpbGVzLg0KPiANCj4gV2l0aCB0aGUgZXhwZXJpZW5jZSBm
cm9tIGk5MTUsIEkgdGhpbmsgdGhpcyB3b3VsZCBzaWduaWZpY2FudGx5IHJlZHVjZQ0KPiB0
aGUgY29uc3RhbnQgbG9vcCBvZiB3YXJuaW5ncyBhZGRlZCBieSBwZW9wbGUgbm90IHVzaW5n
IFc9MSBhbmQNCj4gc3Vic2VxdWVudGx5IGZpeGVkIGJ5IHBlb3BsZSB1c2luZyBXPTEuDQo+
IA0KPiBOb3RlOiBJJ3ZlIENjJ2QgdGhlIG1haW50YWluZXJzIG9mIGRybSwgZHJtIG1pc2Mg
YW5kIHNvbWUgb2YgdGhlIGJpZ2dlc3QNCj4gZHJpdmVycy4NCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL01ha2VmaWxlIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUN
Cj4gaW5kZXggYjRjYjA4MzU2MjBhLi42OTM5ZTRlYTEzZDUgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZp
bGUNCj4gQEAgLTUsNiArNSwzMyBAQA0KPiAgIA0KPiAgIENGTEFHUy0kKENPTkZJR19EUk1f
VVNFX0RZTkFNSUNfREVCVUcpCSs9IC1ERFlOQU1JQ19ERUJVR19NT0RVTEUNCj4gICANCj4g
KyMgVW5jb25kaXRpb25hbGx5IGVuYWJsZSBXPTEgd2FybmluZ3MgbG9jYWxseQ0KPiArIyAt
LS0gYmVnaW4gY29weS1wYXN0ZSBXPTEgd2FybmluZ3MgZnJvbSBzY3JpcHRzL01ha2VmaWxl
LmV4dHJhd2Fybg0KPiArc3ViZGlyLWNjZmxhZ3MteSArPSAtV2V4dHJhIC1XdW51c2VkIC1X
bm8tdW51c2VkLXBhcmFtZXRlcg0KPiArc3ViZGlyLWNjZmxhZ3MteSArPSAtV21pc3Npbmct
ZGVjbGFyYXRpb25zDQo+ICtzdWJkaXItY2NmbGFncy15ICs9ICQoY2FsbCBjYy1vcHRpb24s
IC1XcmVzdHJpY3QpDQo+ICtzdWJkaXItY2NmbGFncy15ICs9IC1XbWlzc2luZy1mb3JtYXQt
YXR0cmlidXRlDQo+ICtzdWJkaXItY2NmbGFncy15ICs9IC1XbWlzc2luZy1wcm90b3R5cGVz
DQo+ICtzdWJkaXItY2NmbGFncy15ICs9IC1Xb2xkLXN0eWxlLWRlZmluaXRpb24NCj4gK3N1
YmRpci1jY2ZsYWdzLXkgKz0gLVdtaXNzaW5nLWluY2x1ZGUtZGlycw0KPiArc3ViZGlyLWNj
ZmxhZ3MteSArPSAkKGNhbGwgY2Mtb3B0aW9uLCAtV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
KQ0KPiArc3ViZGlyLWNjZmxhZ3MteSArPSAkKGNhbGwgY2Mtb3B0aW9uLCAtV3VudXNlZC1j
b25zdC12YXJpYWJsZSkNCj4gK3N1YmRpci1jY2ZsYWdzLXkgKz0gJChjYWxsIGNjLW9wdGlv
biwgLVdwYWNrZWQtbm90LWFsaWduZWQpDQo+ICtzdWJkaXItY2NmbGFncy15ICs9ICQoY2Fs
bCBjYy1vcHRpb24sIC1XZm9ybWF0LW92ZXJmbG93KQ0KPiArc3ViZGlyLWNjZmxhZ3MteSAr
PSAkKGNhbGwgY2Mtb3B0aW9uLCAtV2Zvcm1hdC10cnVuY2F0aW9uKQ0KPiArc3ViZGlyLWNj
ZmxhZ3MteSArPSAkKGNhbGwgY2Mtb3B0aW9uLCAtV3N0cmluZ29wLW92ZXJmbG93KQ0KPiAr
c3ViZGlyLWNjZmxhZ3MteSArPSAkKGNhbGwgY2Mtb3B0aW9uLCAtV3N0cmluZ29wLXRydW5j
YXRpb24pDQo+ICsjIFRoZSBmb2xsb3dpbmcgdHVybiBvZmYgdGhlIHdhcm5pbmdzIGVuYWJs
ZWQgYnkgLVdleHRyYQ0KPiAraWZlcSAoJChmaW5kc3RyaW5nIDIsICQoS0JVSUxEX0VYVFJB
X1dBUk4pKSwpDQo+ICtzdWJkaXItY2NmbGFncy15ICs9IC1Xbm8tbWlzc2luZy1maWVsZC1p
bml0aWFsaXplcnMNCj4gK3N1YmRpci1jY2ZsYWdzLXkgKz0gLVduby10eXBlLWxpbWl0cw0K
PiArc3ViZGlyLWNjZmxhZ3MteSArPSAtV25vLXNoaWZ0LW5lZ2F0aXZlLXZhbHVlDQo+ICtl
bmRpZg0KPiAraWZlcSAoJChmaW5kc3RyaW5nIDMsICQoS0JVSUxEX0VYVFJBX1dBUk4pKSwp
DQo+ICtzdWJkaXItY2NmbGFncy15ICs9IC1Xbm8tc2lnbi1jb21wYXJlDQo+ICtlbmRpZg0K
PiArIyAtLS0gZW5kIGNvcHktcGFzdGUNCj4gKw0KPiAgIGRybS15IDo9IFwNCj4gICAJZHJt
X2FwZXJ0dXJlLm8gXA0KPiAgIAlkcm1fYXRvbWljLm8gXA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------8D89vBe7ebgWX6a0lNDZLQAF--

--------------NWR8I09mSSUafci740gfvFuI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVoXYEFAwAAAAAACgkQlh/E3EQov+AU
aA/+Kl5K8wYmnzlKfAMH/cal3Y7KwYd9H/SS1qEFKIJIcNjnKP4PClHbBkE3eLko3htmU8uXAz8b
cvyMlG1uOiM5zXma2IUzqfKdB9214+jBQ3fBgtfLcpQSEJcKN/FLT6HzF+9+46MYeugpSm6VvoN8
CzO5ClBaokk45EpD2Zqav+CdVHPQOJ93jvcfLkoM3S6NCZY/0eCkU6b0XZ8HKZea9x96CCmB6ykk
8iKsjquyPAGxgxU/P0plwfyi07uBrG1ugDJ22yEztQKpqh0FtYi3SxA134WJKXS+Unipr6M6sX5I
K2h/iTi4RcJgBXDjUP4+CO6CCzy+VZ0LzKVq8TqL4PZTG12mmPGFrLSTsCOVURT7FT4ZyLfJJmUm
12CVrJEy88BugJYwvgu1QX5yPLb000mAJw7wnJRbd/HG2rXWkVKVeSgbIoC5/2MFbY7oCK4t1H7k
LPVtTZv8HQ1ncDrvTZAgG1pwHBFtUF5m6/fPjRL2xeZXrys23cvxd5dCkoVI9A8Zcl6zusEgQqGf
Spm5kATDvStexTp4g97H6nPKqbFoFWrw1rXmhEmlM5aZznkATqA6hKD0kEkPhJeDTIVJyHVOdblq
CPq3hL7sCYiiu/mpNoQTe+b87wTPx1CZgfTqk2pwLPb33NM7qXzLXiI/+nyYygdegs2v6KP7cCpH
RBs=
=KBHh
-----END PGP SIGNATURE-----

--------------NWR8I09mSSUafci740gfvFuI--
