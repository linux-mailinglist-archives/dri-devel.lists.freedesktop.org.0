Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9621051BAF4
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC9B10EB8C;
	Thu,  5 May 2022 08:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2DC10EB8C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:49:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B9E39218ED;
 Thu,  5 May 2022 08:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651740577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G98mln19ZgjcWOJ1EpprkkSYVYDttaLj17m3CPfaya0=;
 b=fP+Z5rt/gxgHBIrKtnF8r6iXxmrS8OqhX5a0Jd2K/jAFSnh/hnzl6Y23ku2iKW7Ak3Wgjg
 CP3DhBzzJdO+V4n/WY0mmOUNdrPcxAqbnRRr0STjn+uqGG7cUEr8zh2/MzNC2A1ONdESvN
 6n0luq29P6mtKdlN0jkz8emg+8ozKdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651740577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G98mln19ZgjcWOJ1EpprkkSYVYDttaLj17m3CPfaya0=;
 b=f38ImMI5VE2CUGPJDEK5AU0qXgyiUT6TFQUq4oabCBu3l+IwipxnyrFPd6Vtr3017BXXde
 04t5xS23Keci0uCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C7B713B11;
 Thu,  5 May 2022 08:49:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gXkCIaGPc2LoGAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 May 2022 08:49:37 +0000
Message-ID: <e1797321-d901-45dc-713f-7f706147c341@suse.de>
Date: Thu, 5 May 2022 10:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215722.56970-1-javierm@redhat.com>
 <974f4d00-89bc-a2da-6d65-ca4207300794@suse.de>
 <d9a5cb30-2d9b-50b5-d287-0ead0fe252f3@redhat.com>
 <78167587-fd2e-354c-485b-db4ee9251178@suse.de>
 <237c7fa0-744d-97c2-2bba-3f714d6c2e9d@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <237c7fa0-744d-97c2-2bba-3f714d6c2e9d@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bfNxQvqkcvpizuhcxOBwiAnc"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bfNxQvqkcvpizuhcxOBwiAnc
Content-Type: multipart/mixed; boundary="------------MF9XvBTem0bHn0z8Qv0sXD0P";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <e1797321-d901-45dc-713f-7f706147c341@suse.de>
Subject: Re: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215722.56970-1-javierm@redhat.com>
 <974f4d00-89bc-a2da-6d65-ca4207300794@suse.de>
 <d9a5cb30-2d9b-50b5-d287-0ead0fe252f3@redhat.com>
 <78167587-fd2e-354c-485b-db4ee9251178@suse.de>
 <237c7fa0-744d-97c2-2bba-3f714d6c2e9d@redhat.com>
In-Reply-To: <237c7fa0-744d-97c2-2bba-3f714d6c2e9d@redhat.com>

--------------MF9XvBTem0bHn0z8Qv0sXD0P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDUuMjIgdW0gMTA6Mjggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDUvNS8yMiAxMDowNSwgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6DQo+IA0KPiBbc25pcF0NCj4gDQo+Pj4NCj4+PiBJbiBvdGhl
ciB3b3JkcywgaW4gbW9zdCBjYXNlcyAoaS5lOiBvbmx5IGZiY29uIGJvdW5kIHRvIHRoZSBm
YmRldikNCj4+PiB0aGUgZHJpdmVyJ3MgcmVtb3ZhbC8gZGV2aWNlIHVuYmluZCBhbmQgdGhl
IG1lbW9yeSByZWxlYXNlIHdpbGwgYmUNCj4+PiBhdCB0aGUgc2FtZSB0aW1lLg0KPj4+DQo+
Pg0KPj4gV2UncmUgb25lIHRoZSBzYW1lIHBhZ2UgaGVyZSwgYnV0IGl0J3Mgc3RpbGwgc29y
dCBvZiBhIG15c3RlcnkgdG8gbWUgd2h5DQo+PiB0aGlzIHdvcmtzIGluIHByYWN0aWNlLg0K
Pj4NCj4+IEknbSBzcGVjaWZpY2FsbHkgdGFsa2luZyBhYm91dCBwY2lfcmVxdWVzdF9yZWdp
b25zKCkgaW4gdm13Z2Z4IFsxXS4gSUlSQw0KPj4gdGhpcyB3b3VsZCBmYWlsIGlmIHNpbXBs
ZWZiIHN0aWxsIG93bnMgdGhlIGZyYW1lYnVmZmVyIHJlZ2lvbi4gTG90cyBvZg0KPj4gc3lz
dGVtcyBydW4gUGx5bW91dGggZHVyaW5nIGJvb3QgYW5kIHRoaXMgc2hvdWxkIHJlc3VsdCBp
biBmYWlsdXJlcw0KPj4gb2NjYXNpb25hbGx5LiBTdGlsbCwgd2UgbmV2ZXIgaGVhcmQgYWJv
dXQgYW55dGhpbmcuDQo+Pg0KPiANCj4gWWVzLCBJIHRoaW5rIGlzIGJlY2F1c2UgUGx5bW91
dGggSUlVQyB3YWl0cyBmb3IgYSAvZGV2L2RyaS9jYXJkPyB0byBiZQ0KPiBwcmVzZW50IGFu
ZCBvbmx5IHVzZXMgYSAvZGV2L2ZiPyBhcyBhIGZhbGxiYWNrIGlmIGEgdGltZW91dCBleHBp
cmVzLg0KDQpPaCwgcmlnaHQhIFRoZSBpbmZhbW91cyBwbHltb3V0aCB0aW1lb3V0LiAnc2xl
ZXAoMzApJyBpcyB0aGUgc3dpc3MtYXJteSANCmtuaWZlIG9mIGNvbmN1cnJlbnQgcHJvZ3Jh
bW1pbmcuIDspDQoNCkJ1dCBJJ20gbm90IGJsYW1pbmcgYW55b25lLiBUaGVyZSBhcmUgc2l0
dWF0aW9ucyB3aGVyZSBub3RoaW5nIGVsc2UgDQpoZWxwcy4gUGx5bW91dGggcmVhbGx5IGNh
bid0IGRvIGFueXRoaW5nIGVsc2UgaGVyZS4gV2UndmUgcmVjZWl2ZWQgDQpyZXBvcnRzIGZv
ciBnZngtaGFuZG92ZXIgYnVncyB3aGVuIHRoZSB0aW1lb3V0IGV4cGlyZWQgYW5kIHBseW1v
dXRoIHVzZXMgDQp0aGUgZmJkZXYuIFRoZSBzeXN0ZW0gZ290IHN0dWNrIHRoZW4gYmVjYXVz
ZSBvZiBmYmRldiBJSVJDLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBBdCBs
ZWFzdCBpbiBGZWRvcmEgKGV2ZW4gYmVmb3JlIHRoZSBlZmlmYiAtPiBzaW1wbGVkcm0gY2hh
bmdlKSBpdCB3aWxsDQo+IHVzZSBLTVMvRFJNIHNpbmNlIHRoZSBEUk0ga2VybmVsIG1vZHVs
ZSBmb3IgdGhlIGdyYXBoaWNzIGRldmljZSBpbiB0aGUNCj4gbWFjaGluZSB3b3VsZCBiZSBp
biB0aGUgaW50aXJkLg0KPiANCj4gU28gZWZpZmIgd2FzIG9ubHkgdXNlZCBmb3IgZmJjb24g
YW5kIHBseW1vdXRoIHdvdWxkIG9ubHkgdXNlIERSTS9LTVMNCj4gYW5kIG5vdCBpdHMgZmJk
ZXYgYmFja2VuZC4NCj4gDQo+IFRoaXMgc2VlbXMgdG8gYmUgc29ydCBvZiBhIGNvcm5lciBj
YXNlIHdoZW4geW91IGhhdmUge2VmaSxzaW1wbGV9ZmINCj4gaW4gdGhlIGVhcmx5IGJvb3Qg
YnV0IHRoZSByZWFsIERSTSBtb2R1bGUgb25seSBpbiB0aGUgcm9vdGZzIGFmdGVyIHRoZQ0K
PiBpbml0cmQgaGFzIGRvbmUgYSBwaXZvdF9yb290KDIpLg0KPiAgIA0KPj4gT2YgY291cnNl
LCBpdCdzIGFsd2F5cyBiZWVuIGJyb2tlbiAoZXZlbiBsb25nIGJlZm9yZSByZWFsIGZiZGV2
DQo+PiBob3R1bnBsdWdnaW5nKS4gU3dpdGNoaW5nIHRvIHNpbXBsZWRybSByZXNvbHZlcyB0
aGUgcHJvYmxlbS4NCj4+DQo+IA0KPiBJbmRlZWQuIE15IG9waW5pb24gYWZ0ZXIgZGVhbGlu
ZyB3aXRoIHRoZXNlIGZiZGV2IHByb2JsZW1zIGlzIHRoYXQgd2UNCj4gc2hvdWxkbid0IHRy
eSB0byBmaXggYWxsIHBvc3NpYmxlIGNvcm5lciBjYXNlcyBhbmQganVzdCB0cnkgdG8gZ2V0
IHJpZA0KPiBvZiBmYmRldiBhcyBzb29uIGFzIHBvc3NpYmxlLg0KPiAgIC0tDQo+IEJlc3Qg
cmVnYXJkcywNCj4gDQo+IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcw0KPiBMaW51eCBFbmdp
bmVlcmluZw0KPiBSZWQgSGF0DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAz
NjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------MF9XvBTem0bHn0z8Qv0sXD0P--

--------------bfNxQvqkcvpizuhcxOBwiAnc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJzj6AFAwAAAAAACgkQlh/E3EQov+AS
bRAA0XI+TZwItuDpnm0hiVI3S04EtviZIWLBCjC9Z3Sv2jm60QyRUUv+S8+Up5EHoBCMGhy2kD40
EGtnMIHqnCB9pahLx/yvy//bQ1lD6kIfRHQgqD0REZPxjf+WD7vVZ3jLdO3YqSOvxc7pamS3jcWr
yd6lyjEpuYfwa8GA+n2stNk9w97SaRC8xRzrKw2SYY3dEgW+RJL6NwCD1DOMvnvrFj2+hN6LuWck
lxw5JqT+i7zHRVeCGCMXBy9VL66+ZCnyYhwpAlrOjpTnV+YYT32Mk5y53kh+SYOmT3U3PJmtYdtN
HwT4poXg2pQSs5WBbqW8qUUZJzj9nv/3Wo3j0G4GjjPECn49d6KMSHt2lqDVJbJoVaMNdmvbZ/5l
1HTLiJblC7oszL+fqHbBArdQRCjwAFmiWXyfz4lBHhOT6VlEOGljEHVo2bVZ9u2DHu1EAeZVGUU2
N8zw88QxwLV4dMUcTkEJ+mwGTw7Ois5KGqxLAeDxDHUqgIc+5GgPE5j6puj+rI/27GmB7xvhEVRv
okR5eJLymIY2hHvIdF+1bDJmR2CmBbrRYzGrOqR/jQ4YCdfG2uYyG0AA5QX4Fsi/kbZ08HYk4H/l
U/NmGFOmF1aygCAFSdzTlnav4eEgMpVdNWKBQmjuYohPr4MP+hbROebysqHbJo295u6UwUh8TSTZ
t7I=
=b7m2
-----END PGP SIGNATURE-----

--------------bfNxQvqkcvpizuhcxOBwiAnc--
