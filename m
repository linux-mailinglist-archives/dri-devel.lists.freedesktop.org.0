Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926715EF715
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 16:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2382710E08E;
	Thu, 29 Sep 2022 14:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFCC10E08E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:02:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0E6A1F8C1;
 Thu, 29 Sep 2022 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664460172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dfm0UBZqOBIW+zVRPbPPCDTVolBlrppqrDxrW+gO2e8=;
 b=NEQHQWdYESllLzS/EZ1J7PXwyKB3L9T5Uz2JryP8FGJevuGbozBj+OX++Ro/AjZuoib5sZ
 fSlFuiOGwzNi+uoe0j/V2hzejkCXklNvYGM1iV+ATTm6CplzjlgBxxm4KnAVXOMxKb2Vja
 clQ1A53KDg3WovN5j9KGttLwQu48JAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664460172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dfm0UBZqOBIW+zVRPbPPCDTVolBlrppqrDxrW+gO2e8=;
 b=jzqu7zd+VnkqTyRnXbkvm5jI7HU4IYQDxqj0vJI+XxmTS8VWieMRSBipYmmpO3BY1eLqyc
 Wwoi9+SyqW+651BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D37C71348E;
 Thu, 29 Sep 2022 14:02:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0zTHMoylNWOXNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Sep 2022 14:02:52 +0000
Message-ID: <ecf11ec4-145d-92d9-392f-0a1814ccc99f@suse.de>
Date: Thu, 29 Sep 2022 16:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de> <YynOvpMGbVKWiO8p@intel.com>
 <CAPj87rNi0iFuG10qFMc5g=XB94G99aCyOP+D_rJpOMOWrK_QKQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAPj87rNi0iFuG10qFMc5g=XB94G99aCyOP+D_rJpOMOWrK_QKQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i6WpnNrKZz40I6opkz7lGCPz"
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
Cc: airlied@linux.ie, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------i6WpnNrKZz40I6opkz7lGCPz
Content-Type: multipart/mixed; boundary="------------sqS7uDPM66SDmz73KCOJe2EE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: airlied@linux.ie, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org
Message-ID: <ecf11ec4-145d-92d9-392f-0a1814ccc99f@suse.de>
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de> <YynOvpMGbVKWiO8p@intel.com>
 <CAPj87rNi0iFuG10qFMc5g=XB94G99aCyOP+D_rJpOMOWrK_QKQ@mail.gmail.com>
In-Reply-To: <CAPj87rNi0iFuG10qFMc5g=XB94G99aCyOP+D_rJpOMOWrK_QKQ@mail.gmail.com>

--------------sqS7uDPM66SDmz73KCOJe2EE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDkuMjIgdW0gMTY6NDcgc2NocmllYiBEYW5pZWwgU3RvbmU6DQo+IEhp
LA0KPiANCj4gT24gVHVlLCAyMCBTZXB0IDIwMjIgYXQgMTU6MzEsIFZpbGxlIFN5cmrDpGzD
pCANCj4gPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tIDxtYWlsdG86dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+PiANCj4gd3JvdGU6DQo+IA0KPiAgICAgT24gVHVlLCBT
ZXAgMjAsIDIwMjIgYXQgMDM6NTY6MThQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3Jv
dGU6DQo+ICAgICAgPiBTZXQgcGFydGlhbCB1cGRhdGVzIG9uIGEgcGxhbmUgaWYgdGhlIGZy
YW1lYnVmZmVyIGhhcyBub3QgYmVlbg0KPiAgICAgY2hhbmdlZA0KPiAgICAgID4gb24gYW4g
YXRvbWljIGNvbW1pdC4gSWYgc3VjaCBhIHBsYW5lIGhhcyBkYW1hZ2UgY2xpcHMsIHRoZSBk
cml2ZXINCj4gICAgIHdpbGwNCj4gICAgICA+IHVzZSB0aGVtOyBvdGhlcndpc2UgdGhlIHVw
ZGF0ZSBpcyBlZmZlY3RpdmVseSBlbXB0eS4gUGxhbmVzIHRoYXQNCj4gICAgIGNoYW5nZQ0K
PiAgICAgID4gdGhlaXIgZnJhbWVidWZmZXIgc3RpbGwgcGVyZm9ybSBhIGZ1bGwgdXBkYXRl
Lg0KPiANCj4gICAgIEkgaGF2ZSBhIGZlZWxpbmcgeW91J3JlIHNvcnQgb2YgcGFwZXJpbmcg
b3ZlciBzb21lIGluZWZmaWNpZW50DQo+ICAgICB1c2Vyc3BhY2UgdGhhdCdzIGFza2luZyB1
cGRhdGVzIG9uIHBsYW5lcyB0aGF0IGRvbid0IGFjdHVhbGx5DQo+ICAgICBuZWVkIHRoZW0u
IEknbSBub3Qgc3VyZSBhZGRpbmcgbW9yZSBjb2RlIGZvciB0aGF0IGlzIGEgcGFydGljdWxh
cmx5DQo+ICAgICBncmVhdCBpZGVhLiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8ganVzdCBm
aXggdGhlIHVzZXJzcGFjZSBjb2RlPw0KPiANCj4gDQo+IEknbSBub3Qgc3VyZSB3aHkgaXQg
d291bGQgbmVlZCB0byBiZSAnZml4ZWQnLCB3aGVuIGl0J3MgbmV2ZXIgYmVlbiBhIA0KPiBw
cm9wZXJ0eSBvZiB0aGUgYXRvbWljIEFQSSB0aGF0IHlvdSBtdXN0IG1pbmltaXNlIHVwZGF0
ZXMuIFdlc3RvbiBkb2VzIA0KPiB0aGlzIChkdW1wcyB0aGUgZnVsbCBzdGF0ZSBpbiBldmVy
eSB0aW1lKSwgYW5kIEkga25vdyB3ZSdyZSBub3QgdGhlIG9ubHkgDQo+IG9uZXMuDQoNCkkn
dmUgZm91bmQgYSBidWcgaW4gb25lIG9mIHRoZSBEUk0gaGVscGVycy4gSXQgdW5jb25kaXRp
b25hbGx5IGFkZHMgdGhlIA0KcHJpbWFyeSBwbGFuZSB0byB0aGUgY29tbWl0LCB3aGljaCB0
cmlnZ2VycyB0aGUgcmVwYWludC4gRml4aW5nIHRoZSBidWcgDQpyZXNvbHZlcyB0aGUgcHJv
YmxlbSBmb3IgWDExIGFuZCBXYXlsYW5kLUdub21lLg0KDQo+IA0KPiAnRml4aW5nJyBpdCB3
b3VsZCByZXF1aXJlIGRvaW5nIGEgYnVuY2ggb2YgZGlmZmluZyBpbiB1c2Vyc3BhY2UsIGJl
Y2F1c2UgDQo+IG1haW50YWluaW5nIGEgZGVsdGEgYW5kIHRyeWluZyB0byB1bndpbmQgdGhh
dCBkZWx0YSBhY3Jvc3MgbXVsdGlwbGUgDQo+IFRFU1RfT05MWSBydW5zLCBpc24ndCBtdWNo
IGZ1bi4gSXQncyBjZXJ0YWlubHkgYSBmYXIgYmlnZ2VyIGRpZmYgdGhhbiANCj4gdGhpcyBw
YXRjaC4NCg0KQnV0IGV2ZW4gd2l0aCB0aGUgZml4IGFwcGxpZWQsIHdlc3RvbiBzdGlsbCB3
YW50cyB0byByZWRyYXcgdGhlIHdob2xlIA0Kc2NyZWVuIG9uIGV2ZXJ5IG1vdmVtZW50IG9m
IHRoZSBtb3VzZSBjdXJzb3IuIFRoZSBzeXN0ZW0gaXMgdXNhYmxlLCBzbyANCml0J3Mgbm90
IGEgc2hvd3N0b3BwZXIuDQoNClN0aWxsLCB3ZXN0b24gc2hvdWxkIHN0b3Agc2VuZGluZyB0
aGUgcHJpbWFyeSBwbGFuZSdzIGZyYW1lYnVmZmVyIG9uIA0KZWFjaCBjdXJzb3IgdXBkYXRl
LiBUaGVyZSdzIG5vIHVwZGF0ZSB0byB0aGUgY29udGVudHMgYW5kIHRoZSBmaXggc2VlbXMg
DQpzaW1wbGUgdG8gZG8gZnJvbSB1c2Vyc3BhY2UuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQo+ICAgICBBbnkgcHJvcGVydHkgY2hhbmdlIG9uIHRoZSBwbGFuZSBjb3VsZCBu
ZWVkIGEgZnVsbCBwbGFuZQ0KPiAgICAgdXBkYXRlIGFzIHdlbGwgKGVnLiBzb21lIGNvbG9y
IG1hbmdlbWVudCBzdHVmZiBldGMuKS4gU28geW91J2QNCj4gICAgIGhhdmUgdG8ga2VlcCBh
ZGRpbmcgZXhjZXB0aW9ucyB0byB0aGF0IGxpc3Qgd2hlbmV2ZXIgbmV3DQo+ICAgICBwcm9w
ZXJ0aWVzIGFyZSBhZGRlZC4NCj4gDQo+IA0KPiBFaCwgaXQncyBqdXN0IGEgYmxvYiBJRCBj
b21wYXJpc29uLg0KPiANCj4gICAgIEFuZCBJIHRoaW5rIHRoZSBzZW1hbnRpY3Mgb2YgdGhl
IGlvY3RsKHMpIGhhcyBzbyBmYXIgYmVlbiB0aGF0DQo+ICAgICBiYXNpY2FsbHkgYW55IHBh
Z2UgZmxpcCAod2hldGhlciBvciBub3QgaXQgYWN0dWFsbHkgY2hhbmdlcw0KPiAgICAgdGhl
IGZiKSBzdGlsbCBlbmRzIHVwIGRvaW5nIHdoYXRldmVyIGZsdXNoaW5nIGlzIG5lZWRlZCB0
bw0KPiAgICAgZ3VhcmFudGVlIHRoZSBmYiBjb250ZW50cyBhcmUgdXAgdG8gZGF0ZSBvbiB0
aGUgc2NyZWVuIChpZg0KPiAgICAgc29tZW9uZSBzbmVha2VkIGluIHNvbWUgZnJvbnQgYnVm
ZmVyIHJlbmRlcmluZyBpbiBiZXR3ZWVuKS4NCj4gICAgIEllLiB5b3UgY291bGQgZXZlbiB1
c2UgYmFzaWNhbGx5IGEgbm9wIHBhZ2UgZmxpcCBpbiBwbGFjZQ0KPiAgICAgb2YgZGlydHlm
Yi4NCj4gDQo+ICAgICBBbm90aGVyIHRoaW5nIHRoZSBpb2N0bHMgaGF2ZSBhbHdheXMgZG9u
ZSBpcyBhY3R1YWxseSBwZXJmb3JtDQo+ICAgICB0aGUgY29tbWl0IHdoZXRoZXIgYW55dGhp
bmcgY2hhbmdlZCBvciBub3IuIFRoYXQgaXMsIHRoZXkNCj4gICAgIHN0aWxsIGRvIGFsbCB0
aGUgc2FtZSB0aGUgc2FtZSB2Ymxhbmt5IHN0dWZmIGFuZCB0aGUgY29tbWl0DQo+ICAgICB0
YWtlcyB0aGUgc2FtZSBhbW91bnQgb2YgdGltZS4gTm90IHN1cmUgaWYgeW91ciBpZGVhIGlz
DQo+ICAgICB0byBwb3RlbnRpYWxseSBzaG9ydCBjaXJjdWl0IHRoZSBlbnRpcmUgdGhpbmcg
YW5kIG1ha2UgaXQNCj4gICAgIHRha2Ugbm8gdGltZSBhdCBhbGw/DQo+IA0KPiANCj4gSSB3
b3VsZCBleHBlY3QgaXQgdG8gYWx3YXlzIHBlcmZvcm0gYSBjb21taXQsIHRob3VnaC4NCj4g
DQo+IENoZWVycywNCj4gRGFuaWVsDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------sqS7uDPM66SDmz73KCOJe2EE--

--------------i6WpnNrKZz40I6opkz7lGCPz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM1pYwFAwAAAAAACgkQlh/E3EQov+Br
3hAAsomC+Sm5hPd4zde+D9i49MKqeWUmbE56Skoz8HCLU5eD5Sfih8pliionZmz2R889wkye/cW4
vgMvv4b86GJlnjW1wbUf3rFbrMtAF5s+sbdeew9rP5eU5d4unxlS8ktjuuLaHqkBlaQyXigrWCl1
tNlyksDKAn7SGnWKAVgRvirjFm01H/hiQve/9S4swknhwLQVs98E5OHHNHZvgpLu/3Qor5TJHe0X
pN5jCXvROkbe//wLg/ASkxTQLRCzMsFboP+JosjnrrcVeMqnUiKx5kYbImIUC/F2ydea16qgjh/d
3Y7rm1+EO/99jMvnt7Tv/I/25Cxtzlwm09aWW214NOJ+MahlZ/5HbJwSxTy2dCRCpaoxfSe/eL7m
8Px1JzxD73N+GuMTggXMZdtDWEPZ00vsDonIq/fttcS63aaLo9obwpceb6vPxYCcyDuRXI1l+E5o
NmJwyk+RhupOus0qsDC6sCgv5TXEDFB+ANItwfbI4rII0IqV6zUxDTv8nx3Fcw/tDDuAZw97IgCe
J11+MMJHCKNTuWOUY9CJRmBB8RBsRPNXMT7ksL9l8aujpPuBG/ly9XWUGAwYlrSdL1+OZ7p10J0i
i3ltzAxLreowFalGJCTJCKkFAKaYzjWLUFspbl8/qPxiOjRRsVO3tJy/5r77o2LdicOJJ1hWVZSU
b2w=
=OVLW
-----END PGP SIGNATURE-----

--------------i6WpnNrKZz40I6opkz7lGCPz--
