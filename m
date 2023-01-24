Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429AC679E5C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 17:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571C610E6D3;
	Tue, 24 Jan 2023 16:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F3E10E6C3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 16:15:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A685A21A35;
 Tue, 24 Jan 2023 16:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674576944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ALDlH0FzwayC1grvMUaQyzlJFt4TQC1why/8S36Nj+8=;
 b=qqsvBxZEaVKgBSmtpdgg1T6nyW0ksW/X5ncEUTUCdJif2vr/ptMC1pwa/X4rvPKMGJIUeS
 Uk0jeHI8EQwnX+spCVUivvhpWD6s7hBHIy6dgPf6FfTUjd6ncrthtLLjlE40eFr5iihILD
 grjodsOLAkPRKZUBo7iVgWZORhQ5wLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674576944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ALDlH0FzwayC1grvMUaQyzlJFt4TQC1why/8S36Nj+8=;
 b=h8pILHE1B40QmxfXClFzfaNNGJGGz2rpuFhLmMJj/uIEpL/+K1VaM4eqqFouQBtRWKJkBh
 FKx52LTyUbiB08Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85D14139FB;
 Tue, 24 Jan 2023 16:15:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 85ysHzAE0GNzQgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 16:15:44 +0000
Message-ID: <04384589-3bb3-bbb6-ba0d-7a223555c5f4@suse.de>
Date: Tue, 24 Jan 2023 17:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Amdgpu module is references even after unbinding the vtcon
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zQIomSP75DTZ5w0FGkZNTMWQ"
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>, "Slivka,
 Danijel" <Danijel.Slivka@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zQIomSP75DTZ5w0FGkZNTMWQ
Content-Type: multipart/mixed; boundary="------------r9tChe2Q88Cbjklot0b90MxR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 "Slivka, Danijel" <Danijel.Slivka@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Message-ID: <04384589-3bb3-bbb6-ba0d-7a223555c5f4@suse.de>
Subject: Re: Amdgpu module is references even after unbinding the vtcon
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
In-Reply-To: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>

--------------r9tChe2Q88Cbjklot0b90MxR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDEuMjMgdW0gMTU6MTIgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiB3ZSByYW4gaW50byBhIHByb2JsZW0gd2l0aCB0aGUgZ2Vu
ZXJhbCBmYmNvbi9mYmRldiBpbXBsZW1lbnRhdGlvbiBhbmQgDQo+IHRob3VnaCB0aGF0IHlv
dSBtaWdodCBoYXZlIHNvbWUgaWRlYS4NCj4gDQo+IFdoYXQgaGFwcGVucyBpcyB0aGUgZm9s
bG93aW5nOg0KPiAxLiBXZSBsb2FkIGFtZGdwdSBhbmQgZ2V0IG91ciBub3JtYWwgZmJjb24u
DQo+IDIuIGZiY29uIGFsbG9jYXRlcyBhIGR1bXAgQk8gYXMgYmFja2luZyBzdG9yZSBmb3Ig
dGhlIGNvbnNvbGUuDQo+IDMuIEdETS9YL0FwcGxpY2F0aW9ucyBzdGFydCwgbmV3IGZyYW1l
YnVmZmVycyBhcmUgY3JlYXRlZCBCT3MgaW1wb3J0ZWQsIA0KPiBleHBvcnRlZCBldGMuLi4N
Cj4gNC4gU29tZWhvdyBYIG9yIEdETSBpdGVyYXRlZCBvdmVyIGFsbCB0aGUgZnJhbWVidWZm
ZXIgb2JqZWN0cyB0aGUgDQo+IGtlcm5lbHMga25vd3MgYWJvdXQgYW5kIGV4cG9ydCB0aGVt
IGFzIERNQS1idWYuDQo+IDUuIEFwcGxpY2F0aW9uL1gvR0RNIGFyZSBzdG9wcGVkLCBoYW5k
bGVzIGNsb3NlZCwgZnJhbWVidWZmZXJzIHJlbGVhc2VkIA0KPiBldGMuLi4NCj4gNi4gV2Ug
dW5iaW5kIHZ0Y29uLg0KPiANCj4gQXQgdGhpcyBwb2ludCB0aGUgYW1kZ3B1IG1vZHVsZSB1
c3VhbGx5IGhhcyBhIHJlZmVyZW5jZSBjb3VudCBvZiAwIGFuZCANCj4gY2FuIGJlIHVubG9h
ZGVkLCBidXQgc2luY2UgR0RNL1gvV2hvZXZlciBpdGVyYXRlZCBvdmVyIGFsbCB0aGUga25v
d24gDQo+IGZyYW1lYnVmZmVycyBhbmQgZXhwb3J0ZWQgdGhlbSBhcyBETUEtYnVmIChmb3Ig
d2hhdGV2ZXIgcmVhc29uIGlkaykgd2UgDQo+IG5vdyBzdGlsbCBoYXZlIGFuIGV4cG9ydGVk
IERNQS1idWYgYW5kIHdpdGggaXQgYSByZWZlcmVuY2UgdG8gdGhlIG1vZHVsZS4NCj4gDQo+
IEFueSBpZGVhIGhvdyB3ZSBjb3VsZCBwcmV2ZW50IHRoYXQ/DQoNCk5vIHJlYWwgY2x1ZSwg
c29ycnkuDQoNCkJ1dCBkb2VzIGl0IGNoYW5nZSBpZiB5b3UgdXNlIGEgc2hhZG93IGJ1ZmZl
ciBvbiB0b3Agb2YgdGhlIGFtZGdwdSBCTz8gDQpTZXQgcHJlZmVyX3NoYWRvd19mYmRldiA9
IDEuIFsxXSAgIEkgb25jZSB0cmllZCB0byBydW4gZ2VuZXJpYyBmYmRldiANCndpdGhvdXQg
cHJlZmVyX3NoYWRvd19mYmRldiBhbmQgaXQgbmV2ZXIgd29ya2VkLiBJIHN1c3BlY3RlZCB0
aGF0IHNvbWUgDQpyZWZlcmVuY2UgY291bnRpbmcgZ290IHdyb25nLCBidXQgY291bGQgbmV2
ZXIgcGluIGl0IGRvd24uICBNYXliZSB5b3VyIA0KaXNzdWUgaXMgc2ltaWxhci4NCg0KVGhh
dCBzYWlkLCBnZW5lcmljIGZiZGV2IGlzIG5vdCBzbyBzdXBlci1vcHRpbWFsIGZvciBUVE0t
YmFzZWQgZHJpdmVycy4gDQpJJ20gd29ya2luZyBvbiBpbXByb3ZpbmcgdGhhdCwgYnV0IGl0
J3Mgbm90IHRoZXJlIHlldC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQpbMV0gDQpo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4wL3NvdXJjZS9pbmNsdWRlL2Ry
bS9kcm1fbW9kZV9jb25maWcuaCNMODkwDQoNCj4gDQo+IFRoYW5rcywNCj4gQ2hyaXN0aWFu
Lg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------r9tChe2Q88Cbjklot0b90MxR--

--------------zQIomSP75DTZ5w0FGkZNTMWQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPQBDAFAwAAAAAACgkQlh/E3EQov+BT
lg/+MlHZ9kSDTHZ6dGIEmJ6BHJeWOtaMPpFuD+gZLtrKiDF6Vpfv9MlVQ8XyEr5F5EWXBtLz+trG
HJnpPMNe5VxQy1nw5zhJny8S9rQWwKcROz0Nc4/95ORXiwAQFeoWBu4chnE2L8/HqrGj4oinj7nC
GN3fp9p9ga6CSOoD6l7xI57cj9LXw2oVMt0ake/HqYcPzbdk7Q14vtotYIxOvflQnUrFWdCdXrUM
G6vmsHtOSVREJQjDcq7hyUUxznXiMz1IZgk2rt7p8o2nyw3Agb38dIURl4IO12LPy+CnKj9Oh3CV
cdwkAhiMzYLwM+fMyWWSWefforGNPwUQ4yuiXDBV1hCMljQJa3glvpvSKbOF+lP92S6yP7LLoY2F
2tw3p+L+vHRUO53Gdr7aacrBKTRY2/sQ0902l7EylLeqvzbiNk/x54eJnizAq901bWP/yFuEYkLQ
FroxPkAHua11ZmApjWcL1W6/4me+1OlIv5ZPZ9UMeKxlILrliqYSlrrYRrKXx+CD6jReU9ln0pch
lL8mQNkOMFDQiRHC6DgHe5P9GBs3gspXis5amAZLw1OVEXttYGVs0kUH+Np/dq/GxjVwngQzfiiR
oXE/akOQN0QPmR3dLWtR7l/JdD2mZ355uk5F6vgSMJGqKz+qVGtJT0FZfmCR+PemS8uAxkF6uyx/
0Ko=
=A1vq
-----END PGP SIGNATURE-----

--------------zQIomSP75DTZ5w0FGkZNTMWQ--
