Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB32350DB20
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 10:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6291910E0A9;
	Mon, 25 Apr 2022 08:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA9D10E0A9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 08:27:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 01AE21F37D;
 Mon, 25 Apr 2022 08:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650875221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w4ANeXLzjcqotnphnOK0rUPz/EKYu7iEZD+lfX94N5M=;
 b=AklELnOH5ksAZwBokZhcRdfs2KA+xCZFzqI4I8LzcMbiOxJ8L0C6QlnWkvSs5xF0CvPape
 4zd3lNTLNfNmqZwvA5cqCXf4uNwfhirt4X7Ay32IM78ZUgBA4nHCDawmPcEqZ6d/BbyMCu
 NJRiFfmAWIKgTe6IqYTaZr5IxDKDpL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650875221;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w4ANeXLzjcqotnphnOK0rUPz/EKYu7iEZD+lfX94N5M=;
 b=LKWQEiQj0RfY51/CMozD8tJt6TuYAXiTApafez9NxgDnRXuIpqc4hX+ppNMq/1Mzy9sPzG
 3Iqf8Ge2GMBCx/Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3BD513AED;
 Mon, 25 Apr 2022 08:27:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kMzhKlRbZmIjfAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Apr 2022 08:27:00 +0000
Message-ID: <44804419-0e83-b584-96d9-a35939b715bf@suse.de>
Date: Mon, 25 Apr 2022 10:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/5] fbdev: Restart conflicting fb removal loop when
 unregistering devices
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220420085303.100654-1-javierm@redhat.com>
 <20220420085303.100654-4-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220420085303.100654-4-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZBj3qqpnqvIaLxVKiCxcVXoT"
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZBj3qqpnqvIaLxVKiCxcVXoT
Content-Type: multipart/mixed; boundary="------------tndJ8OcZcz64aezTVTn0Tn0n";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Daniel Vetter
 <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 linux-fbdev@vger.kernel.org
Message-ID: <44804419-0e83-b584-96d9-a35939b715bf@suse.de>
Subject: Re: [PATCH v3 3/5] fbdev: Restart conflicting fb removal loop when
 unregistering devices
References: <20220420085303.100654-1-javierm@redhat.com>
 <20220420085303.100654-4-javierm@redhat.com>
In-Reply-To: <20220420085303.100654-4-javierm@redhat.com>

--------------tndJ8OcZcz64aezTVTn0Tn0n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjIgdW0gMTA6NTMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IERyaXZlcnMgdGhhdCB3YW50IHRvIHJlbW92ZSByZWdpc3RlcmVkIGNvbmZs
aWN0aW5nIGZyYW1lYnVmZmVycyBwcmlvciB0bw0KPiByZWdpc3RlciB0aGVpciBvd24gZnJh
bWVidWZmZXIsIGNhbGxzIHJlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMoKS4NCj4g
DQo+IFRoaXMgZnVuY3Rpb24gdGFrZXMgdGhlIHJlZ2lzdHJhdGlvbl9sb2NrIG11dGV4LCB0
byBwcmV2ZW50IGEgcmFjZXMgd2hlbg0KPiBkcml2ZXJzIHJlZ2lzdGVyIGZyYW1lYnVmZmVy
IGRldmljZXMuIEJ1dCBpZiBhIGNvbmZsaWN0aW5nIGZyYW1lYnVmZmVyDQo+IGRldmljZSBp
cyBmb3VuZCwgdGhlIHVuZGVybGF5aW5nIHBsYXRmb3JtIGRldmljZSBpcyB1bnJlZ2lzdGVy
ZWQgYW5kIHRoaXMNCj4gd2lsbCBsZWFkIHRvIHRoZSBwbGF0Zm9ybSBkcml2ZXIgLnJlbW92
ZSBjYWxsYmFjayB0byBiZSBjYWxsZWQsIHdoaWNoIGluDQo+IHR1cm4gd2lsbCBjYWxsIHRv
IHRoZSB1bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyKCkgdGhhdCB0YWtlcyB0aGUgc2FtZSBsb2Nr
Lg0KPiANCj4gVG8gcHJldmVudCB0aGlzLCBhIHN0cnVjdCBmYl9pbmZvLmZvcmNlZF9vdXQg
ZmllbGQgd2FzIHVzZWQgYXMgaW5kaWNhdGlvbg0KPiB0byB1bnJlZ2lzdGVyX2ZyYW1lYnVm
ZmVyKCkgd2hldGhlciB0aGUgbXV0ZXggaGFzIHRvIGJlIGdyYWJiZWQgb3Igbm90Lg0KPiAN
Cj4gQSBjbGVhbmVyIHNvbHV0aW9uIGlzIHRvIGRyb3AgdGhlIGxvY2sgYmVmb3JlIHBsYXRm
b3JtX2RldmljZV91bnJlZ2lzdGVyKCkNCj4gc28gdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcigp
IGNhbiB0YWtlIGl0IHdoZW4gY2FsbGVkIGZyb20gdGhlIGZiZGV2IGRyaXZlciwNCj4gYW5k
IGp1c3QgZ3JhYiB0aGUgbG9jayBhZ2FpbiBhZnRlciB0aGUgZGV2aWNlIGhhcyBiZWVuIHJl
Z2lzdGVyZWQgYW5kIGRvDQo+IGEgcmVtb3ZhbCBsb29wIHJlc3RhcnQuDQoNCkkgZG9uJ3Qg
c2VlIGhvdyB0aGlzIHBhdGNoIGltcHJvdmVzIHRoZSBzaXR1YXRpb24uIFNvIGZhciwgDQpk
b19yZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKCkgaGFkIG5vIGJ1c2luZXNzIGlu
IG1haW50YWluaW5nIA0KbG9ja3MuIEFuZCBub3cgaXQncyBkb2luZyB0aGlzIGluIGluIGEg
Z290by1sb29wIHdoZXJlIGl0IGtlZXBzIA0KZ2V0dGluZy9kcm9wcGluZyBsb2Nrcy4gIFRo
YXQncyBhc2tpbmcgZm9yIGJ1Z3MgSU1ITy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gU2luY2UgdGhlIGZyYW1lYnVmZmVyIGRldmljZXMgd2lsbCBhbHJlYWR5IGJlIHJl
bW92ZWQsIHRoZSBsb29wIHdvdWxkIGp1c3QNCj4gZmluaXNoIHdoZW4gbm8gbW9yZSBjb25m
bGljdGluZyBmcmFtZWJ1ZmZlcnMgYXJlIGZvdW5kLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPiBTaWduZWQtb2ZmLWJ5
OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gUmV2
aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+IC0t
LQ0KPiANCj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpDQo+IA0KPiAgIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYm1lbS5jIHwgMjIgKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgIGlu
Y2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIDIgZmlsZXMgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYm1lbS5jDQo+IGluZGV4IDg0NDI3NDcwMzY3Yi4uMGJiNDU5MjU4ZGYz
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPiAr
KysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPiBAQCAtMTU1Myw2ICsx
NTUzLDcgQEAgc3RhdGljIHZvaWQgZG9fcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVy
cyhzdHJ1Y3QgYXBlcnR1cmVzX3N0cnVjdCAqYSwNCj4gICB7DQo+ICAgCWludCBpOw0KPiAg
IA0KPiArcmVzdGFydF9yZW1vdmFsOg0KPiAgIAkvKiBjaGVjayBhbGwgZmlybXdhcmUgZmJz
IGFuZCBraWNrIG9mZiBpZiB0aGUgYmFzZSBhZGRyIG92ZXJsYXBzICovDQo+ICAgCWZvcl9l
YWNoX3JlZ2lzdGVyZWRfZmIoaSkgew0KPiAgIAkJc3RydWN0IGFwZXJ0dXJlc19zdHJ1Y3Qg
Kmdlbl9hcGVyOw0KPiBAQCAtMTU4NSwxMiArMTU4NiwyMyBAQCBzdGF0aWMgdm9pZCBkb19y
ZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKHN0cnVjdCBhcGVydHVyZXNfc3RydWN0
ICphLA0KPiAgIAkJCQlwcl93YXJuKCJmYiVkOiBubyBkZXZpY2Ugc2V0XG4iLCBpKTsNCj4g
ICAJCQkJZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihyZWdpc3RlcmVkX2ZiW2ldKTsNCj4g
ICAJCQl9IGVsc2UgaWYgKGRldl9pc19wbGF0Zm9ybShkZXZpY2UpKSB7DQo+IC0JCQkJcmVn
aXN0ZXJlZF9mYltpXS0+Zm9yY2VkX291dCA9IHRydWU7DQo+ICsJCQkJLyoNCj4gKwkJCQkg
KiBEcm9wIHRoZSBsb2NrIGJlY2F1c2UgaWYgdGhlIGRldmljZSBpcyB1bnJlZ2lzdGVyZWQs
IGl0cw0KPiArCQkJCSAqIGRyaXZlciB3aWxsIGNhbGwgdG8gdW5yZWdpc3Rlcl9mcmFtZWJ1
ZmZlcigpLCB0aGF0IHRha2VzDQo+ICsJCQkJICogdGhpcyBsb2NrLg0KPiArCQkJCSAqLw0K
PiArCQkJCW11dGV4X3VubG9jaygmcmVnaXN0cmF0aW9uX2xvY2spOw0KPiAgIAkJCQlwbGF0
Zm9ybV9kZXZpY2VfdW5yZWdpc3Rlcih0b19wbGF0Zm9ybV9kZXZpY2UoZGV2aWNlKSk7DQo+
ICsJCQkJbXV0ZXhfbG9jaygmcmVnaXN0cmF0aW9uX2xvY2spOw0KPiAgIAkJCX0gZWxzZSB7
DQo+ICAgCQkJCXByX3dhcm4oImZiJWQ6IGNhbm5vdCByZW1vdmUgZGV2aWNlXG4iLCBpKTsN
Cj4gICAJCQkJZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihyZWdpc3RlcmVkX2ZiW2ldKTsN
Cj4gICAJCQl9DQo+ICsJCQkvKg0KPiArCQkJICogUmVzdGFydCB0aGUgcmVtb3ZhbCBsb29w
IG5vdyB0aGF0IHRoZSBkZXZpY2UgaGFzIGJlZW4NCj4gKwkJCSAqIHVucmVnaXN0ZXJlZCBh
bmQgaXRzIGFzc29jaWF0ZWQgZnJhbWVidWZmZXIgZ29uZS4NCj4gKwkJCSAqLw0KPiArCQkJ
Z290byByZXN0YXJ0X3JlbW92YWw7DQo+ICAgCQl9DQo+ICAgCX0NCj4gICB9DQo+IEBAIC0x
ODk3LDEzICsxOTA5LDkgQEAgRVhQT1JUX1NZTUJPTChyZWdpc3Rlcl9mcmFtZWJ1ZmZlcik7
DQo+ICAgdm9pZA0KPiAgIHVucmVnaXN0ZXJfZnJhbWVidWZmZXIoc3RydWN0IGZiX2luZm8g
KmZiX2luZm8pDQo+ICAgew0KPiAtCWJvb2wgZm9yY2VkX291dCA9IGZiX2luZm8tPmZvcmNl
ZF9vdXQ7DQo+IC0NCj4gLQlpZiAoIWZvcmNlZF9vdXQpDQo+IC0JCW11dGV4X2xvY2soJnJl
Z2lzdHJhdGlvbl9sb2NrKTsNCj4gKwltdXRleF9sb2NrKCZyZWdpc3RyYXRpb25fbG9jayk7
DQo+ICAgCWRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIoZmJfaW5mbyk7DQo+IC0JaWYgKCFm
b3JjZWRfb3V0KQ0KPiAtCQltdXRleF91bmxvY2soJnJlZ2lzdHJhdGlvbl9sb2NrKTsNCj4g
KwltdXRleF91bmxvY2soJnJlZ2lzdHJhdGlvbl9sb2NrKTsNCj4gICB9DQo+ICAgRVhQT1JU
X1NZTUJPTCh1bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyKTsNCj4gICANCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvZmIuaCBiL2luY2x1ZGUvbGludXgvZmIuaA0KPiBpbmRleCBmOTVk
YTFhZjlmZjYuLmI3ODFiYzcyMTExMyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9m
Yi5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvZmIuaA0KPiBAQCAtNTAyLDcgKzUwMiw2IEBA
IHN0cnVjdCBmYl9pbmZvIHsNCj4gICAJfSAqYXBlcnR1cmVzOw0KPiAgIA0KPiAgIAlib29s
IHNraXBfdnRfc3dpdGNoOyAvKiBubyBWVCBzd2l0Y2ggb24gc3VzcGVuZC9yZXN1bWUgcmVx
dWlyZWQgKi8NCj4gLQlib29sIGZvcmNlZF9vdXQ7IC8qIHNldCB3aGVuIGJlaW5nIHJlbW92
ZWQgYnkgYW5vdGhlciBkcml2ZXIgKi8NCj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBpbmxp
bmUgc3RydWN0IGFwZXJ0dXJlc19zdHJ1Y3QgKmFsbG9jX2FwZXJ0dXJlcyh1bnNpZ25lZCBp
bnQgbWF4X251bSkgew0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------tndJ8OcZcz64aezTVTn0Tn0n--

--------------ZBj3qqpnqvIaLxVKiCxcVXoT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJmW1QFAwAAAAAACgkQlh/E3EQov+D5
EQ/+LYErdR2uljbQz9gIF56jHpRYK9entfnaNT/iWs4+3EE6NRaPYieK3BOP8fkOGKx0njYfBl/k
/dlQ1INXlX8rcn/5VmWMbtYt///Rd6eaw0n8plz4lbq69sEEzRAIAxgC8nA78lQ6ipHnDXXso3C7
hpj5u/eNdsfUCoGNy8Msi3NcNfZmk/jnMQyu3UsoBJnMIukI+EvAeHCIX9O1uj3JkZcf2udE97QP
3RWb5UaQhc69Rl4fe8WSq3E00edwo+UDgazzfGckjvYYUaoIuQdnUwzehRFylnpEPfZkL95eVm6w
tQkgJTBCMI14mAhyEyNMg/Y7Rb5zsnFywCSY/wHD1mkygUn1MvUUw0QXBUkHQ8e3p0kVfa+cUMW/
bzumF9LIn2IpBEh2VbSqLVNO6P9lZz4Otelu3Z6knfCyCd3Fw/YDWJcNv+QZidz/SrgvCkpA0jLh
A0m7xyhha6wTOiaOdSe55+1S4bEaoq8YCcfzD9uGMwHailGjXanw+aUC9v2mDpyK95lEVPud22nx
QTJ+yI6WZwg2bvfpV/wQtqoyDO+LrHW/tevSijiDex5W/akVz8OtrlBF//TxTJfYDNWPCO/MBuOY
BLYT1Z2HH63P9X4jJbw4QsVwLeLeNvP9K4n/Qka8OAwkDv/5xbM6Jd+Y0NL0AR5V002Lt0bX030o
wVw=
=4Zal
-----END PGP SIGNATURE-----

--------------ZBj3qqpnqvIaLxVKiCxcVXoT--
