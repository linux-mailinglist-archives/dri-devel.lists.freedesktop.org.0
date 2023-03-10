Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F06B4458
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 15:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F0210E2F3;
	Fri, 10 Mar 2023 14:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511CE10E2F3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 14:23:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EA9DB21E0E;
 Fri, 10 Mar 2023 14:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678458189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FJDTvuxhTkLLSmPLCWi9Bm1SOFEXifdFoDHTO4x6g8s=;
 b=xQ7J2242aZMpvDO7f3UxdGfWHyPnIMq21SZ63vrnZqfaSeCwpZm5s/bj1vJglL4ngmFll2
 tlMyEyEXkJdZnbYul7GXXv481a7tbCWZStrM/CGIIaSSvnenAWOiJfpd/8weOFGzfFsg3v
 HCY0cTeZdjLvwfsWpaIfxXbRZi7m6/U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678458189;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FJDTvuxhTkLLSmPLCWi9Bm1SOFEXifdFoDHTO4x6g8s=;
 b=IICZv/P3TNfBehXsq5arOMeYsWvkNlDLQQ6B17+1URYGTN8y2gMv3MO/9qb1i474fZGHf2
 BG+iDlCXMRgC+dBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FCE213592;
 Fri, 10 Mar 2023 14:23:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QmoMFU09C2TIXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Mar 2023 14:23:09 +0000
Message-ID: <9860f1e9-5ad0-ea11-a098-2ff3eb4409f8@suse.de>
Date: Fri, 10 Mar 2023 15:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] fbdev: Fix incorrect page mapping clearance at
 fb_deferred_io_release()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230308105012.1845-1-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230308105012.1845-1-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WN90O91OjnVFzjRm0Unwppqp"
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
Cc: linux-fbdev@vger.kernel.org, Miko Larsson <mikoxyzzz@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patrik Jakobsson <pjakobsson@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WN90O91OjnVFzjRm0Unwppqp
Content-Type: multipart/mixed; boundary="------------YpSIrhqbG8h9R53oB55Tn8ZY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Patrik Jakobsson <pjakobsson@suse.de>,
 Helge Deller <deller@gmx.de>, Miko Larsson <mikoxyzzz@gmail.com>
Message-ID: <9860f1e9-5ad0-ea11-a098-2ff3eb4409f8@suse.de>
Subject: Re: [PATCH v2] fbdev: Fix incorrect page mapping clearance at
 fb_deferred_io_release()
References: <20230308105012.1845-1-tiwai@suse.de>
In-Reply-To: <20230308105012.1845-1-tiwai@suse.de>

--------------YpSIrhqbG8h9R53oB55Tn8ZY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QWRkZWQgdG8gZHJtLW1pc2MtZml4ZXMuIFRoYW5rcyBhIGxvdCBmb3IgdGhlIHBhdGNoLg0K
DQpBbSAwOC4wMy4yMyB1bSAxMTo1MCBzY2hyaWViIFRha2FzaGkgSXdhaToNCj4gVGhlIHJl
Y2VudCBmaXggZm9yIHRoZSBkZWZlcnJlZCBJL08gYnkgdGhlIGNvbW1pdA0KPiAgICAzZWZj
NjFkOTUyNTkgKCJmYmRldjogRml4IGludmFsaWQgcGFnZSBhY2Nlc3MgYWZ0ZXIgY2xvc2lu
ZyBkZWZlcnJlZCBJL08gZGV2aWNlcyIpDQo+IGNhdXNlZCBhIHJlZ3Jlc3Npb24gd2hlbiB0
aGUgc2FtZSBmYiBkZXZpY2UgaXMgb3BlbmVkL2Nsb3NlZCB3aGlsZQ0KPiBpdCdzIGJlaW5n
IHVzZWQuICBJdCByZXN1bHRlZCBpbiBhIGZyb3plbiBzY3JlZW4gZXZlbiBpZiBzb21ldGhp
bmcNCj4gaXMgcmVkcmF3biB0aGVyZSBhZnRlciB0aGUgY2xvc2UuICBUaGUgYnJlYWthZ2Ug
aXMgYmVjYXVzZSB0aGUgcGF0Y2gNCj4gd2FzIG1hZGUgdW5kZXIgYSB3cm9uZyBhc3N1bXB0
aW9uIG9mIGEgc2luZ2xlIG9wZW47IGluIHRoZSBjdXJyZW50DQo+IGNvZGUsIGZiX2RlZmVy
cmVkX2lvX3JlbGVhc2UoKSBjbGVhbnMgdXAgdGhlIHBhZ2UgbWFwcGluZyBvZiB0aGUNCj4g
cGFnZXJlZiBsaXN0IGFuZCBpdCBjYWxscyBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoKSB1
bmNvbmRpdGlvbmFsbHksDQo+IHdoZXJlIGJvdGggYXJlIG5vIGNvcnJlY3QgYmVoYXZpb3Ig
Zm9yIG11bHRpcGxlIG9wZW5zLg0KPiANCj4gVGhpcyBwYXRjaCBhZGRzIGEgcmVmY291bnQg
Zm9yIHRoZSBvcGVucyBvZiB0aGUgZGV2aWNlLCBhbmQgYXBwbGllcw0KPiB0aGUgY2xlYW51
cCBvbmx5IHdoZW4gYWxsIGZpbGVzIGdldCBjbG9zZWQuDQo+IA0KPiBBcyBib3RoIGZiX2Rl
ZmVycmVkX2lvX29wZW4oKSBhbmQgX2Nsb3NlKCkgYXJlIGNhbGxlZCBhbHdheXMgaW4gdGhl
DQo+IGZiX2luZm8gbG9jayAobXV0ZXgpLCBpdCdzIHNhZmUgdG8gdXNlIHRoZSBub3JtYWwg
aW50IGZvciB0aGUNCj4gcmVmY291bnRpbmcuDQo+IA0KPiBBbHNvLCBhIHVzZWxlc3MgQlVH
X09OKCkgaXMgZHJvcHBlZC4NCj4gDQo+IEZpeGVzOiAzZWZjNjFkOTUyNTkgKCJmYmRldjog
Rml4IGludmFsaWQgcGFnZSBhY2Nlc3MgYWZ0ZXIgY2xvc2luZyBkZWZlcnJlZCBJL08gZGV2
aWNlcyIpDQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4NCj4gU2lnbmVkLW9mZi1i
eTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KPiAtLS0NCj4gdjEtPnYyOg0KPiAq
IFJlbmFtZSB0byBmYl9kZWZlcnJlZF9pb19sYXN0Y2xvc2UoKQ0KPiAqIFJlbmFtZSB0aGUg
bmV3IGZpZWxkIGZyb20gb3BlbnMgdG8gb3Blbl9jb3VudA0KPiAqIFJlbW92ZWQgdW51c2Vk
IHZhcmlhYmxlDQo+ICogTW9yZSBjb21tZW50cyBhYm91dCBmYl9pbmZvIGxvY2tpbmcNCj4g
DQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMgfCAxNyArKysrKysr
KysrKysrLS0tLQ0KPiAgIGluY2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAgICAgIHwg
IDEgKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJf
ZGVmaW8uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jDQo+IGluZGV4
IGFhNWYwNTlkMDIyMi4uMjc0ZjVkMGZhMjQ3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8uYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvZmJfZGVmaW8uYw0KPiBAQCAtMzA1LDE3ICszMDUsMTggQEAgdm9pZCBmYl9kZWZl
cnJlZF9pb19vcGVuKHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPiAgIAkJCSBzdHJ1Y3QgaW5v
ZGUgKmlub2RlLA0KPiAgIAkJCSBzdHJ1Y3QgZmlsZSAqZmlsZSkNCj4gICB7DQo+ICsJc3Ry
dWN0IGZiX2RlZmVycmVkX2lvICpmYmRlZmlvID0gaW5mby0+ZmJkZWZpbzsNCj4gKw0KPiAg
IAlmaWxlLT5mX21hcHBpbmctPmFfb3BzID0gJmZiX2RlZmVycmVkX2lvX2FvcHM7DQo+ICsJ
ZmJkZWZpby0+b3Blbl9jb3VudCsrOw0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MX0dQTChm
Yl9kZWZlcnJlZF9pb19vcGVuKTsNCj4gICANCj4gLXZvaWQgZmJfZGVmZXJyZWRfaW9fcmVs
ZWFzZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gK3N0YXRpYyB2b2lkIGZiX2RlZmVycmVk
X2lvX2xhc3RjbG9zZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gICB7DQo+IC0Jc3RydWN0
IGZiX2RlZmVycmVkX2lvICpmYmRlZmlvID0gaW5mby0+ZmJkZWZpbzsNCj4gICAJc3RydWN0
IHBhZ2UgKnBhZ2U7DQo+ICAgCWludCBpOw0KPiAgIA0KPiAtCUJVR19PTighZmJkZWZpbyk7
DQo+ICAgCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmaW5mby0+ZGVmZXJyZWRfd29yayk7
DQo+ICAgDQo+ICAgCS8qIGNsZWFyIG91dCB0aGUgbWFwcGluZyB0aGF0IHdlIHNldHVwICov
DQo+IEBAIC0zMjQsMTMgKzMyNSwyMSBAQCB2b2lkIGZiX2RlZmVycmVkX2lvX3JlbGVhc2Uo
c3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICAgCQlwYWdlLT5tYXBwaW5nID0gTlVMTDsNCj4g
ICAJfQ0KPiAgIH0NCj4gKw0KPiArdm9pZCBmYl9kZWZlcnJlZF9pb19yZWxlYXNlKHN0cnVj
dCBmYl9pbmZvICppbmZvKQ0KPiArew0KPiArCXN0cnVjdCBmYl9kZWZlcnJlZF9pbyAqZmJk
ZWZpbyA9IGluZm8tPmZiZGVmaW87DQo+ICsNCj4gKwlpZiAoIS0tZmJkZWZpby0+b3Blbl9j
b3VudCkNCj4gKwkJZmJfZGVmZXJyZWRfaW9fbGFzdGNsb3NlKGluZm8pOw0KPiArfQ0KPiAg
IEVYUE9SVF9TWU1CT0xfR1BMKGZiX2RlZmVycmVkX2lvX3JlbGVhc2UpOw0KPiAgIA0KPiAg
IHZvaWQgZmJfZGVmZXJyZWRfaW9fY2xlYW51cChzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4g
ICB7DQo+ICAgCXN0cnVjdCBmYl9kZWZlcnJlZF9pbyAqZmJkZWZpbyA9IGluZm8tPmZiZGVm
aW87DQo+ICAgDQo+IC0JZmJfZGVmZXJyZWRfaW9fcmVsZWFzZShpbmZvKTsNCj4gKwlmYl9k
ZWZlcnJlZF9pb19sYXN0Y2xvc2UoaW5mbyk7DQo+ICAgDQo+ICAgCWt2ZnJlZShpbmZvLT5w
YWdlcmVmcyk7DQo+ICAgCW11dGV4X2Rlc3Ryb3koJmZiZGVmaW8tPmxvY2spOw0KPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mYi5oIGIvaW5jbHVkZS9saW51eC9mYi5oDQo+IGlu
ZGV4IGQ4ZDIwNTE0ZWEwNS4uMDJkMDljYjU3ZjZjIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L2ZiLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9mYi5oDQo+IEBAIC0yMTIsNiAr
MjEyLDcgQEAgc3RydWN0IGZiX2RlZmVycmVkX2lvIHsNCj4gICAJLyogZGVsYXkgYmV0d2Vl
biBta3dyaXRlIGFuZCBkZWZlcnJlZCBoYW5kbGVyICovDQo+ICAgCXVuc2lnbmVkIGxvbmcg
ZGVsYXk7DQo+ICAgCWJvb2wgc29ydF9wYWdlcmVmbGlzdDsgLyogc29ydCBwYWdlbGlzdCBi
eSBvZmZzZXQgKi8NCj4gKwlpbnQgb3Blbl9jb3VudDsgLyogbnVtYmVyIG9mIG9wZW5lZCBm
aWxlczsgcHJvdGVjdGVkIGJ5IGZiX2luZm8gbG9jayAqLw0KPiAgIAlzdHJ1Y3QgbXV0ZXgg
bG9jazsgLyogbXV0ZXggdGhhdCBwcm90ZWN0cyB0aGUgcGFnZXJlZiBsaXN0ICovDQo+ICAg
CXN0cnVjdCBsaXN0X2hlYWQgcGFnZXJlZmxpc3Q7IC8qIGxpc3Qgb2YgcGFnZXJlZnMgZm9y
IHRvdWNoZWQgcGFnZXMgKi8NCj4gICAJLyogY2FsbGJhY2sgKi8NCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------YpSIrhqbG8h9R53oB55Tn8ZY--

--------------WN90O91OjnVFzjRm0Unwppqp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQLPUwFAwAAAAAACgkQlh/E3EQov+CU
9Q//XjNw8h7KM1/IefFZ4loLe6NPkejow0rEyghdW+DM9YkUsnosuK0tbfVnBabd+j0JAKCXympk
IGslIHqvyedTY4ZxR7gW6SasgQZnG+ObvWEWdPjbA7QRycNJFBnSV2pj09FHwyLgYKuIIDVoUXK6
Ffp++AsfWj556Ou34ZufPsf0K6RE1ZIe0safWj2EMUnfTduHnut+UgJcccUD4fPkCVplas7mxcLs
0WHHIn5540QPSplnQsox1mh3O11wg1oWW3U0l8MaSRMKzq+FqDOfN+d++pzNHZEogiwGwKivLnF5
2uc4/isK9dXU+n+F1wOMwJMR+mNnjNAswYH8IxyXy/zfvrl6aoxhf3j39lqHn+2H9CWmyIgU7XLZ
0+cv9TxcIEJ7knZkzK2fU1j3RS5aJJxAJQBi0W7SoiTIyZcEAom6KsRaQZIwXL0VsjS33lmm/uoi
nDTCn5j/iVMhbZALi2CvK/xv6himXgs+i/6EsFIXFX7239nuT5Ub4HOQv9ylvD9ZLyNfvTOM8Chk
qHp35noGo4cDYNC/POfpXPbRyrszwCCWkfJxOCe4fNWNT80ezsx0Z1/RuwscKGnOtnvt+eYcjFFb
XtnuspYRPFjbAaidc/AvZP4JPC0AhHZp92BbAmph7UZWyq4wlEWL9jf74qdyist4L27rleaxw7bf
JnA=
=jxq2
-----END PGP SIGNATURE-----

--------------WN90O91OjnVFzjRm0Unwppqp--
