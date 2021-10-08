Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DFA426636
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 10:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4B26E862;
	Fri,  8 Oct 2021 08:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797676E862
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 08:49:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C959522407;
 Fri,  8 Oct 2021 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633682957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uFjGpYRopr6d5ZmehI/8g6HLiJzjtm6I0H2tC2wXkME=;
 b=KyW/Gy7kDobPYuKBiHBxpgGhwgfsAk/1O68Z2iiB3dS4v2oN/cygM8eHbFZ9Qk8oXy5vFe
 2S8QlJOQYj2GlLXxxxE3DHSBrkcHL4kMZ93mNQxlBVfQG0f3xPi99Y8/D9i6q7HAMZpY1Q
 2PK8OtkRNn0ECpJCBOOv/KVR3WPe/5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633682957;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uFjGpYRopr6d5ZmehI/8g6HLiJzjtm6I0H2tC2wXkME=;
 b=l1/dYR2iMiP61vmAVd4pdF6qQgveeKEB6WHDEt8TJvSkslfNQYOrL4s6qSS6Zq/MEjvcFx
 1BXxmeJpS7N8d+Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8F0613D13;
 Fri,  8 Oct 2021 08:49:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BncUKA0GYGE0cAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Oct 2021 08:49:17 +0000
Message-ID: <8f577b6a-3217-5b87-7dc2-eeefafef2f72@suse.de>
Date: Fri, 8 Oct 2021 10:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: 572994bf18ff prevents system boot
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ainux Wang <ainux.wang@gmail.com>
References: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
 <eeaf6170-0aca-4466-c79c-b422cdf29179@suse.de>
 <1FA5E09F-BE25-4FF6-9958-7D7B0BE9256B@oracle.com>
 <aaefdfe4-084b-7abd-5e5b-47481e20f4bd@suse.de>
 <BAE78984-959D-480E-A0F7-71CF12FCE831@oracle.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <BAE78984-959D-480E-A0F7-71CF12FCE831@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6p3rmjVOR40gR0CfCKdKcpMc"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6p3rmjVOR40gR0CfCKdKcpMc
Content-Type: multipart/mixed; boundary="------------tV70NhFRoAT3iMNtVO7fbEbx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ainux Wang <ainux.wang@gmail.com>
Message-ID: <8f577b6a-3217-5b87-7dc2-eeefafef2f72@suse.de>
Subject: Re: 572994bf18ff prevents system boot
References: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
 <eeaf6170-0aca-4466-c79c-b422cdf29179@suse.de>
 <1FA5E09F-BE25-4FF6-9958-7D7B0BE9256B@oracle.com>
 <aaefdfe4-084b-7abd-5e5b-47481e20f4bd@suse.de>
 <BAE78984-959D-480E-A0F7-71CF12FCE831@oracle.com>
In-Reply-To: <BAE78984-959D-480E-A0F7-71CF12FCE831@oracle.com>

--------------tV70NhFRoAT3iMNtVO7fbEbx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMTAuMjEgdW0gMTY6MTEgc2NocmllYiBDaHVjayBMZXZlciBJSUk6DQo+
IA0KPiANCj4+IE9uIE9jdCA0LCAyMDIxLCBhdCAxMDowNyBBTSwgVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0g
MDQuMTAuMjEgdW0gMTU6MzQgc2NocmllYiBDaHVjayBMZXZlciBJSUk6DQo+Pj4+IE9uIE9j
dCA0LCAyMDIxLCBhdCAzOjA3IEFNLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4gd3JvdGU6DQo+Pj4+DQo+Pj4+IChjYzogYWludXgud2FuZ0BnbWFpbC5jb20p
DQo+Pj4+DQo+Pj4+IEhpDQo+Pj4+DQo+Pj4+IEFtIDAzLjEwLjIxIHVtIDIwOjA5IHNjaHJp
ZWIgQ2h1Y2sgTGV2ZXIgSUlJOg0KPj4+Pj4gSGktDQo+Pj4+PiBBZnRlciB1cGRhdGluZyBv
bmUgb2YgbXkgdGVzdCBzeXN0ZW1zIHRvIHY1LjE1LXJjLCBJIGZvdW5kIHRoYXQgaXQNCj4+
Pj4+IGJlY29tZXMgdW5yZXNwb25zaXZlIGR1cmluZyB0aGUgbGF0ZXIgcGFydCBvZiB0aGUg
Ym9vdCBwcm9jZXNzLiBBDQo+Pj4+PiBwb3dlci1vbiByZXNldCBpcyBuZWNlc3NhcnkgdG8g
cmVjb3Zlci4NCj4+Pj4+IEkgYmlzZWN0ZWQgdG8gdGhpcyBjb21taXQ6DQo+Pj4+PiA1NzI5
OTRiZjE4ZmYgKCJkcm0vYXN0OiBaZXJvIGlzIG1pc3NpbmcgaW4gZGV0ZWN0IGZ1bmN0aW9u
IikNCj4+Pj4NCj4+Pj4gWW91IGRvbid0IGhhdmUgYSBtb25pdG9yIGNvbm5lY3RlZCwgSSBn
dWVzcz8NCj4+PiBDb3JyZWN0LCBteSBsYWIgc3lzdGVtcyB1c2UgSVBNSSBhbmQgYSBicm93
c2VyLWF0dGFjaGVkIGNvbnNvbGUuDQo+Pj4+IEluIHRoYXQgY2FzZSwgd2Ugbm93IHRyaWdn
ZXIgdGhlIGhlbHBlcnMgdGhhdCBwb2xsIGZvciBjb25uZWN0ZWQgbW9uaXRvcnMuIEhvd2V2
ZXIsIHRoZSBvdmVyaGVhZCBzZWVtcyByYXRoZXIgZXh0cmVtZS4NCj4+Pj4NCj4+Pj4gSSds
bCBoYXZlIHRvIHRyeSB0byByZXByb2R1Y2UgdGhpcywgb3Igb3RoZXJ3aXNlIHdlIGNhbiBy
ZXZlcnQgdGhlIGNvbW1pdC4NCj4+PiBJdCdzIHN0cmFuZ2UsIG9ubHkgdGhhdCBzeXN0ZW0g
aW4gbXkgbGFiIHNlZW1zIHRvIGhhdmUgYSBwcm9ibGVtLg0KPj4+IFRoZSBvdGhlcnMgd29y
ayBmaW5lLg0KPj4+IFRoYW5rcyBmb3IgaGF2aW5nIGEgbG9vayENCj4+DQo+PiBJcyBpdCBh
IEhXIG9yIEZXIHByb2JsZW0/IE1heWJlIGEgZGlmZmVyZW50IHJldmlzaW9uPw0KPiANCj4g
SXQncyBwb3NzaWJsZS4gSSBkb24ndCBrbm93IGhvdyB0byBmdXJ0aGVyIGRpYWdub3NlIHRo
ZSBpc3N1ZSwNCj4gdGhvdWdoLiBBbnkgZ3VpZGFuY2UgYXBwcmVjaWF0ZWQhDQoNCnY1LjE1
LXJjMyB3b3JrcyB3ZWxsIG9uIG15IHRlc3QgbWFjaGluZS4NCg0KRm9yIGdldHRpbmcgdGhl
IGZpcm13YXJlIHJldmlzaW9ucywgcnVuDQoNCiAgIHN1ZG8gZG1pZGVjb2RlDQoNCm9uIHRo
ZSBtYWNoaW5lLiBJdCB3aWxsIHByaW50IGEgbG9uZyBsaXN0IG9mIGRldmljZXMgd2l0aCBy
ZWxhdGVkIA0KaW5mb3JtYXRpb24uIFJ1bm5pbmcNCg0KICAgc3VkbyBsc3BjaSAtdg0KDQp3
aWxsIGdpdmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIFBDSSBkZXZpY2VzLiBUaGVyZSdzIGFu
IGVudHJ5IGZvciB0aGUgDQpWR0EgZGV2aWNlIHNvbWV3aGVyZS4gTWF5YmUgeW91IGNhbiBm
aW5kIHNvbWUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSANCmRpZmZlcmVudCBzeXN0ZW1zDQoN
CklmIHlvdSB0aGluayB0aGUgbWFjaGluZSBnb3Qgc3R1Y2ssIHRyeSB0byBwbHVnLWluIHRo
ZSBWR0EgY2FibGUgZHVyaW5nIA0KdGhlIGJvb3QgYW5kIHNlZSBpZiBpdCBtYWtlcyB0aGUg
bWFjaGluZSBjb21lIHVwLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4+
IEknbSBhc2tpbmcgYmVjYXVzZSB0aGUgcHJvYmxlbWF0aWMgY29tbWl0IGRvZXMgdGhlIGNv
cnJlY3QgdGhpbmcuIElmIHRoZXJlIGlzIG5vIFZHQSBjYWJsZSBjb25uZWN0ZWQsIHRoZSBk
cml2ZXIgc2hvdWxkIHBvbGwgdW50aWwgaXQgZGV0ZWN0cyBvbmUuIFRoZSBvdmVyaGVhZCBz
aG91bGQgYmUgbWluaW1hbC4NCj4+DQo+PiBCdXQgSSdsbCB0cnkgdG8gcmVwcm9kdWNlIGFu
eXdheS4NCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+Pj4gQmVzdCBy
ZWdhcmRzDQo+Pj4+IFRob21hcw0KPj4+Pg0KPj4+Pj4gQ2hlY2tpbmcgb3V0IHY1LjE1LXJj
MyBhbmQgcmV2ZXJ0aW5nIHRoaXMgY29tbWl0IGVuYWJsZXMgdGhlIHN5c3RlbQ0KPj4+Pj4g
dG8gYm9vdCBhZ2Fpbi4NCj4+Pj4+IDBiOjAwLjAgVkdBIGNvbXBhdGlibGUgY29udHJvbGxl
cjogQVNQRUVEIFRlY2hub2xvZ3ksIEluYy4gQVNQRUVEIEdyYXBoaWNzIEZhbWlseSAocmV2
IDMwKSAocHJvZy1pZiAwMCBbVkdBIGNvbnRyb2xsZXJdKQ0KPj4+Pj4gICAgICAgICAgRGV2
aWNlTmFtZTogIEFTUEVFRCBWaWRlbyBBU1QyNDAwDQo+Pj4+PiAgICAgICAgICBTdWJzeXN0
ZW06IFN1cGVyIE1pY3JvIENvbXB1dGVyIEluYyBYMTBTUkwtRg0KPj4+Pj4gICAgICAgICAg
Q29udHJvbDogSS9PKyBNZW0rIEJ1c01hc3Rlci0gU3BlY0N5Y2xlLSBNZW1XSU5WLSBWR0FT
bm9vcC0gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlzSU5UeC0NCj4+Pj4+
ICAgICAgICAgIFN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCLSBQYXJFcnItIERF
VlNFTD1tZWRpdW0gPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJSLSBJ
TlR4LQ0KPj4+Pj4gICAgICAgICAgSW50ZXJydXB0OiBwaW4gQSByb3V0ZWQgdG8gSVJRIDE4
DQo+Pj4+PiAgICAgICAgICBSZWdpb24gMDogTWVtb3J5IGF0IGZhMDAwMDAwICgzMi1iaXQs
IG5vbi1wcmVmZXRjaGFibGUpIFtzaXplPTE2TV0NCj4+Pj4+ICAgICAgICAgIFJlZ2lvbiAx
OiBNZW1vcnkgYXQgZmIwMDAwMDAgKDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9
MTI4S10NCj4+Pj4+ICAgICAgICAgIFJlZ2lvbiAyOiBJL08gcG9ydHMgYXQgYzAwMCBbc2l6
ZT0xMjhdDQo+Pj4+PiAgICAgICAgICBFeHBhbnNpb24gUk9NIGF0IDAwMGMwMDAwIFt2aXJ0
dWFsXSBbZGlzYWJsZWRdIFtzaXplPTEyOEtdDQo+Pj4+PiAgICAgICAgICBDYXBhYmlsaXRp
ZXM6IFs0MF0gUG93ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDMNCj4+Pj4+ICAgICAgICAgICAg
ICAgICAgRmxhZ3M6IFBNRUNsay0gRFNJLSBEMSsgRDIrIEF1eEN1cnJlbnQ9Mzc1bUEgUE1F
KEQwKyxEMSssRDIrLEQzaG90KyxEM2NvbGQrKQ0KPj4+Pj4gICAgICAgICAgICAgICAgICBT
dGF0dXM6IEQwIE5vU29mdFJzdC0gUE1FLUVuYWJsZS0gRFNlbD0wIERTY2FsZT0wIFBNRS0N
Cj4+Pj4+ICAgICAgICAgIENhcGFiaWxpdGllczogWzUwXSBNU0k6IEVuYWJsZS0gQ291bnQ9
MS80IE1hc2thYmxlLSA2NGJpdCsNCj4+Pj4+ICAgICAgICAgICAgICAgICAgQWRkcmVzczog
MDAwMDAwMDAwMDAwMDAwMCAgRGF0YTogMDAwMA0KPj4+Pj4gICAgICAgICAgS2VybmVsIGRy
aXZlciBpbiB1c2U6IGFzdA0KPj4+Pj4gICAgICAgICAgS2VybmVsIG1vZHVsZXM6IGFzdA0K
Pj4+Pj4gLS0NCj4+Pj4+IENodWNrIExldmVyDQo+Pj4+DQo+Pj4+IC0tIA0KPj4+PiBUaG9t
YXMgWmltbWVybWFubg0KPj4+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+Pj4+IFNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPj4+PiBNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+Pj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KPj4+PiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo+Pj4g
LS0NCj4+PiBDaHVjayBMZXZlcg0KPj4NCj4+IC0tIA0KPj4gVGhvbWFzIFppbW1lcm1hbm4N
Cj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+IFNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KPj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQo+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+PiBHZXNjaMOkZnRzZsO8
aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo+IA0KPiAtLQ0KPiBDaHVjayBMZXZlcg0KPiAN
Cj4gDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0K

--------------tV70NhFRoAT3iMNtVO7fbEbx--

--------------6p3rmjVOR40gR0CfCKdKcpMc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFgBg0FAwAAAAAACgkQlh/E3EQov+DA
2g//YuK6f+RoKcqXykPQ5UeD0Gk+Pcm73VPjknpcuDrtV43HGJOJERiV05IgXSSY2hZIA8CxBCUa
xMqOyBw0NVzEeTC2uQNwZu60itbvudrZJk/tWfHIVaYaObGHg82h8myhJ7e94WiDoeOwKnYDx5Kd
CvNzgWHaf/RAc4C8HKXDdtQ+MR+09Uh7kGAbkz7grKO/ZZOJJvtjG5/NuqsRekLoQDQNsMgy7+lE
XBXTZTv+iAmf9Tk9vD1vWYbK6MjU21h6UFHsktudqBNS3wBHxsR4TzScvupm/Y5so48gO3qZB9EY
atAz+2El8aEw4Wa2tOhx4qzuzhi/Y+3C2VAs7debgJwD4MNBcN5OAHb4IUOKnRhYxaEoVGp7RRds
tHO6xzqWGtVFxXyQLj/LBZcuVF1Q/2trkci59KWzWDGFbrIz6S1wT69gLkx2W9ZHgII3S5cyWPsu
HQAk2CTY0RdXGSxfRjj+nritz6LLTzHA6k9EPMAydWULYPNN0MBBpaneldO60WPGaFdEAG+31E4r
oHNwPKrgbL1BQzPcdjtpxmGZ9PdNhFP8j9NR1ImBY+ZsnSdFmt9gY9LQRQtpnJQSINBX6fqAHgvu
N6XkwnE8cCsucAceUUAK3lviby5qcv/tmyzIIT4wrC14yQIIbY+88ar34wEmPlTkszAHJUCn86Rd
4ks=
=b0YC
-----END PGP SIGNATURE-----

--------------6p3rmjVOR40gR0CfCKdKcpMc--
