Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 477245F6235
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 10:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133F410E7FE;
	Thu,  6 Oct 2022 08:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C2F10E7FE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 08:01:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 22DC21F91D;
 Thu,  6 Oct 2022 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665043296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fhgErJuc0/XTfk9Wwnj3yAECHH8f4Z1tgD6kVEn5/c0=;
 b=FdVzNtNUSKt0ZsBIVsF7o785Ov0l4icBZFmzGW4DaVx6aSY4VLWY2RMW7j9r5ksIeB0dSr
 B/7ZG6Zlt9V5Kiwttg3YpSx4KC/47zY/AwEhww+sO/+iT3Zk9N7j40hU5swHRXTkYVRVhP
 Y4O/YOipLQvnsVQpUAmVxyb3aPjqz8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665043296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fhgErJuc0/XTfk9Wwnj3yAECHH8f4Z1tgD6kVEn5/c0=;
 b=FquBS4WH0fHQkccpAIhbPSTe3pUCHiNcOAk7TvTKBJWoDOLzXtS2U2gIpShjZ6Hv4e/NFA
 JngsZvmLkEiBQDBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F10A513AC8;
 Thu,  6 Oct 2022 08:01:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V0jHOV+LPmONKAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 08:01:35 +0000
Message-ID: <8fc0e4de-2448-1d04-d1b0-16f87498fe98@suse.de>
Date: Thu, 6 Oct 2022 10:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: drm fb helpers hotplug/resize
To: Zack Rusin <zackr@vmware.com>
References: <9884c2f0daeccbaeaa9995bd8bdb25b98838b980.camel@vmware.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <9884c2f0daeccbaeaa9995bd8bdb25b98838b980.camel@vmware.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gzIdw0oG6NIaAEejkxav4cV0"
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gzIdw0oG6NIaAEejkxav4cV0
Content-Type: multipart/mixed; boundary="------------anN0QP9CNVqnENDLf0995RML";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <8fc0e4de-2448-1d04-d1b0-16f87498fe98@suse.de>
Subject: Re: drm fb helpers hotplug/resize
References: <9884c2f0daeccbaeaa9995bd8bdb25b98838b980.camel@vmware.com>
In-Reply-To: <9884c2f0daeccbaeaa9995bd8bdb25b98838b980.camel@vmware.com>

--------------anN0QP9CNVqnENDLf0995RML
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgWmFjaw0KDQpBbSAwNS4xMC4yMiB1bSAyMTo0OSBzY2hyaWViIFphY2sgUnVzaW46DQo+
IEhpLCBUaG9tYXMuDQo+IA0KPiBCZWNhdXNlIHlvdSd2ZSBiZWVuIHRoZSBvbmUgd2hvJ3Mg
YmVlbiB3b3JraW5nIG9uIGRybV9mYl9oZWxwZXIuYyB0aGUgbW9zdCB0aGUgbGFzdA0KPiBm
ZXcgeWVhcnMgSSB3YW50ZWQgdG8gcGljayB5b3VyIGJyYWluIGEgYml0Lg0KPiANCj4gSSB3
YXMgcG9ydGluZyB2bXdnZnggdG8gZHJtX2ZiX2hlbHBlciBjb2RlIHdoaWNoIGlzIGxhcmdl
bHkgdHJpdmlhbCwganVzdCByZW1vdmluZw0KPiBhbGwgb2Ygdm13Z2Z4X2ZiLmMgYW5kIHJl
cGxhY2luZyBpdCB3aXRoIGEgY2FsbCB0byBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cC4gQnV0
DQoNClRoYW5rcyBhIGxvdCBmb3IgdGhpcyB3b3JrLiBJIGhhdmUgYmVlbiBsb29raW5nIGlu
dG8gZG9pbmcgdGhpcyANCmNvbnZlcnNpb24gbXlzZWxmIGF0IHNvbWUgcG9pbnQsIGJ1dCBu
ZXZlciBmb3VuZCB0aGUgdGltZSB0byBhY3R1YWxseSBkbyANCml0Lg0KDQo+IGRybV9mYl9o
ZWxwZXIuYyBjb2RlIG5ldmVyIGRlYWxzIHdpdGggcmVzaXplcyB3aGljaCBpcyBhIGJpdCBv
ZiBhIHByb2JsZW0uDQo+IA0KPiBlLmcuIHJlcGxhY2luZyB0aGUgZHJtX3N5c2ZzX2hvdHBs
dWdfZXZlbnQoKSBjYWxsIGZyb20NCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYyNM
MjI1NQ0KPiB3aXRoIGRybV9rbXNfaGVscGVyX2hvdHBsdWdfZXZlbnQgd2lsbCBjYWxsIGRy
bV9mYmRldl9jbGllbnRfaG90cGx1ZyBhbmQgZW5kIHVwIGluDQo+IGRybV9mYl9oZWxwZXJf
aG90cGx1Z19ldmVudDoNCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0
ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jI0wyMDAzDQo+IA0K
PiBOb3cgZHJtX2ZiX2hlbHBlcl9ob3RwbHVnX2V2ZW50IGRvZXMgZHJtX2NsaWVudF9tb2Rl
c2V0X3Byb2JlIGJ1dCBpdCBuZXZlciByZXNpemVzDQo+IGRybV9mYl9oZWxwZXI6OmJ1ZmZl
ciBhbmQgZHJtX2ZiX2hlbHBlcjo6ZmIgc28gdGhleSdyZSBib3RoIGluY29ycmVjdGx5IHNp
emVkLg0KPiANCj4gSW4gZ2VuZXJhbCBJIGRvbid0IHNlZSBkcm1fZmJfaGVscGVyIGNvZGUg
ZXZlciBiZWluZyBhYmxlIHRvIGRlYWwgd2l0aCByZXNpemVzLiBJbg0KPiBwYXJ0aWN1bGFy
IGJlY2F1c2UgdGhlIGZiZGV2J3MgeHJlc192aXJ0dWFsL3lyZXNfdmlydHVhbCBhcmUgc2l6
ZWQgZXhhY3RseSB0byB0aGUNCj4gaW5pdGlhbCB4cmVzL3lyZXMuDQo+IA0KPiBJdCdzIGRl
ZmluaXRlbHkgYSBsb3QgYmlnZ2VyIGlzc3VlIG9uIHZpcnR1YWxpemVkIGVudmlyb25tZW50
cyB3aGVyZSBhdCBib290IHdlJ2xsDQo+IGhhdmUgc29tZSB2ZXJ5IGNvbnNlcnZhdGl2ZSBz
aXplICg4MDB4NjAwKSBvbiB2bXdnZnggd2hpY2ggaXMgdGhlbiB1c3VhbGx5IHJlc2l6ZWQN
Cj4gdG8gdGhlIHNpemUgb2YgdGhlIHdpbmRvdy4gZHJtX2ZiX2hlbHBlciBicmVha3MgcHJl
dHR5IGJhZCBpbiB0aGF0IGNhc2UgYmVjYXVzZSBpdA0KPiBjYW4ndCBkZWFsIHdpdGggdGhv
c2UgcmVzaXplcyBhdCBhbGwuDQo+IA0KPiBJcyB0aGlzIHNjZW5hcmlvIHNvbWV0aGluZyB0
aGF0IGRybV9mYl9oZWxwZXIgc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIG9yIGlzIGl0IG5v
dA0KPiB3b3J0aCBwdXJzdWluZyBpdD8gSSBkb24ndCB0aGluayB0aGVyZSdzIGEgdHJpdmlh
bCB3YXkgb2YgaGFuZGxpbmcgaXQgc28gbXkgZ3Vlc3MgaXMNCj4gdGhhdCBpdCB3b3VsZCBt
YWtlIGRybV9mYl9oZWxwZXIgcXVpdGUgYSBiaXQgbW9yZSBjb21wbGljYXRlZC4NCg0KSSdt
IGF3YXJlIHRoYXQgcmVzaXppbmcgaXMgbWlzc2luZy4gSXQncyBvbmUgb2YgdGhlIGZldyB0
aGluZ3MgSSdkIGxpa2UgDQp0byBzZWUgYmVpbmcgYWRkZWQgdG8gZ2VuZXJpYyBmYmRldiBl
bXVsYXRpb24uIEJ1dCBhcyB5b3Ugc2F5LCBpdCdzIG5vdCANCmVhc3kuIFRoZSBnZW5lcmlj
IGZiZGV2IGVtdWxhdGlvbiBoYXMgYWxsIGtpbmRzIG9mIGNvZGUgcGF0aHMgZm9yIHRoZSAN
CnZhcmlvdXMgZHJpdmVycycgbWVtb3J5IG1hbmFnZXJzLiBUaGF0IG1ha2VzIGl0IGNvbXBs
aWNhdGVkLg0KDQpUaGUgcHJvYmxlbSBpcyB0aGF0IGZiZGV2J3MgbW1hcCdlZCBtZW1vcnkg
Y2Fubm90IGJlIHJlYWxsb2NhdGVkLiBJdCBpcyANCmV4cGVjdGVkIHRvIGJlaGF2ZSBsaWtl
ICdyZWFsIHZpZGVvIG1lbW9yeS4nIFNvIGVpdGhlciByZXNlcnZlIGEgY2h1bmsgDQpvZiB0
aGUgdmlkZW8gcmFtIGZvciBmYmRldidzIEdFTSBvYmplY3RzIG9yIHVzZSBkZWZlcnJlZCBJ
L08sIHdoaWNoIA0KcHJvdmlkZXMgbW1hcGVkIHBhZ2VzIGZyb20gYSBzaGFkb3cgYnVmZmVy
IGluIHN5c3RlbSBtZW1vcnkuIHZtd2dmeCB1c2VzIA0KdGhlIGxhdHRlciBJSVJDLg0KDQpC
dXQgaWRlYWxseSwgd2UnZCBnZXQgcmlkIG9mIG1vc3Qgb2YgdGhlIHNoYWRvdyBidWZmZXJp
bmcgYW5kIHRyeSB0byANCm1tYXAgcGFnZXMgZGlyZWN0bHkgZnJvbSBHRU0gb2JqZWN0cy4g
Rm9yIG1vZGVzZXR0aW5nLCB0aGlzIG1lYW5zIHRoYXQgDQp0aGUgbmV3IG1vZGUncyBmcmFt
ZWJ1ZmZlciBoYXMgdG8gaW5oZXJpdCB0aGUgb2xkIGZyYW1lYnVmZmVyJ3MgYnVmZmVyIA0K
b2JqZWN0cy4gUHJvYmFibHkgdGhlIGVhc2llc3Qgc29sdXRpb24gaXMgdG8gYWxsb2NhdGUg
YSBmcmFtZWJ1ZmZlciBvbmNlIA0KYW5kIHJlY29uZmlndXJlIGl0cyBwYXJhbWV0ZXJzICh3
aWR0aCwgaGVpZ2h0LCBwaXRjaCkgb24gZWFjaCBtb2Rlc2V0IA0Kb3BlcmF0aW9uLg0KDQpT
d2l0Y2hpbmcgdG8gYSBoaWdoZXIgcmVzb2x1dGlvbiB3b3VsZCByZXF1aXJlIG1vcmUgdmlk
ZW8gbWVtb3J5LiANCkFsdGhvdWdoIHdlIGNhbm5vdCByZWFsbG9jYXRlLCB0aGlzIHByb2Js
ZW0gY2FuIGJlIHNvbHZlZCB3aXRoIHRoZSANCmRybV9mYmRldl9vdmVyYWxsb2MgcGFyYW1l
dGVyLiBJdCBnaXZlcyB0aGUgcGVyY2VudGFnZSBvZiBhbGxvY2F0ZWQgDQp2aWRlbyBtZW1v
cnkuIElmIHlvdSBzdGFydCB3aXRoIDgwMHg2MDAgd2l0aCBvdmVyYWxsb2MgYXQgNDAwLCB5
b3UnZCBnZXQgDQplbm91Z2ggdmlkZW8gbWVtb3J5IGZvciAyNDAwIHNjYW5saW5lcy4gVGhp
cyBhbGxvd3MgZm9yIGZiZGV2IHBhbm5pbmcgDQooaS5lLiwgcGFnZWZsaXBwaW5nKS4gV2l0
aCB0aGF0IGV4dHJhIG1lbW9yeSBmYmRldiBjb3VsZCBzd2l0Y2ggdG8gDQphbm90aGVyIGRp
c3BsYXkgbW9kZSB3aXRoIGEgaGlnaGVyIHJlc29sdXRpb24uIEZvciBleGFtcGxlLCBjaGFu
Z2luZyB0byANCjEwMjR4Nzg2IHdvdWxkIHJlc3VsdCBpbiAxODc1IHNjYW5saW5lcyBhdCB0
aGUgZ2l2ZW4gb3ZlcmFsbG9jIG9mIDQwMC4NCg0KVG8gaW1wbGVtZW50IHRoaXMsIEkgZ3Vl
c3MgdGhhdCBzb21lIG9mIGZiZGV2J3MgbWVtb3J5IGFsbG9jYXRpb24gbmVlZHMgDQp0byBi
ZSBjaGFuZ2VkLiBUaGUgY2hlY2tfdmFyIGFuZCBzZXRfcGFyIGNvZGUgbmVlZHMgYW4gdXBk
YXRlIHRvIGhhbmRsZSANCnRoZSBtb2Rlc2V0LiBBbmQgSSBzdXNwZWN0IHRoYXQgdGhlcmUg
YXJlIG90aGVyIGRhcmsgY29ybmVycyB0aGF0IG5lZWQgDQp0byBiZSByZXdvcmtlZCBhcyB3
ZWxsLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiB6DQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------anN0QP9CNVqnENDLf0995RML--

--------------gzIdw0oG6NIaAEejkxav4cV0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM+i18FAwAAAAAACgkQlh/E3EQov+Cf
fQ//eGhSRa+XUWDmJ3K1dDmXjHYQUxRs3mpY+qV4lvSOL51825sijNbrdLntI5BjcdJDH+6dThkP
YGwThcHBkNd8rvQCzgxIAz9VyDYCPJZlA3yfaeUv2yOl2r0NV+pl+4Uj4S4dpPMRoWyFvnl2pZqC
x1orkTAMgnZunELe+W3Zz4Q3o/t2iAm5OPHo2CbEJYPJWuCudljvvVlHWk1K/Yg2Sd/R6y06HXlG
XSrhiBkmqAR4lTa14XvB/FZC98iav27+GkIUW0ymPl24FSuj2k19jV6HiWBhq/s5ArCX5s2Q06eo
P4rQJrE65R/doghjLwRk4eCxORFQdFSYYk3FPU7Zc2TC9sCTpzKAzHG7Zc3RGs8I4NIDldolGPRn
zCzZ6UoAooMF//uAlIq3QobYt2KYKBqm5OiW5D2a9Q8I+bQxIZy8HvZM53RoEZuvuL1jr4yAFYE9
iDOtTKOn0kxpWT4/RBcuQzCjvdVBnCq/LIpwkVfH1Y76d5Kg/exJTv7ILJBTNyJH1nej14L85VCk
y8D+V2+qYz76dr1SkvW9FrxfBBWt2mK6FI/G0Xw06ggxKGcpOQ+qereEuhzbzA/EyoSKfa64M09Z
9f866apphTFedSb65mPsltHoWG6rvdzZVTEcJ9y19pKdubcCJmxet3AphZy8fRtvtI0caJP0UEKm
Oy4=
=TBPx
-----END PGP SIGNATURE-----

--------------gzIdw0oG6NIaAEejkxav4cV0--
