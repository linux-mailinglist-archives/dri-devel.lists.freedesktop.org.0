Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225B7849529
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6807011242C;
	Mon,  5 Feb 2024 08:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WBpL9+LN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+jl09Dmn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WBpL9+LN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+jl09Dmn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB9711242C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 08:14:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5BFC12218D;
 Mon,  5 Feb 2024 08:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707120868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=u9mf2lgG92TcekYBt92zxfGqbg/erKqZ6RX2ZiIjojk=;
 b=WBpL9+LNf5LHZiYZktfNohAM5ul1qtmVGrKinahyjtW9jta7ycEiu2RdcZCu41Bvvkutg+
 83I+jBuC9dHefAxIL+YKie331uXpZt2ddClnXKMFax+D6qSc4IHEv9CeM50UwIfRv6pO55
 4oUA9WzqlmvnQFS/dRQBP1GUWL8Ln4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707120868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=u9mf2lgG92TcekYBt92zxfGqbg/erKqZ6RX2ZiIjojk=;
 b=+jl09Dmn2yzN6IdCq6yBJNfNSa39zz8HVTkVOFpMQ3FZa9L7p33GYCcKe0LoW2K1/aS3Cr
 3/RQ/PGxc/BTKBAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707120868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=u9mf2lgG92TcekYBt92zxfGqbg/erKqZ6RX2ZiIjojk=;
 b=WBpL9+LNf5LHZiYZktfNohAM5ul1qtmVGrKinahyjtW9jta7ycEiu2RdcZCu41Bvvkutg+
 83I+jBuC9dHefAxIL+YKie331uXpZt2ddClnXKMFax+D6qSc4IHEv9CeM50UwIfRv6pO55
 4oUA9WzqlmvnQFS/dRQBP1GUWL8Ln4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707120868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=u9mf2lgG92TcekYBt92zxfGqbg/erKqZ6RX2ZiIjojk=;
 b=+jl09Dmn2yzN6IdCq6yBJNfNSa39zz8HVTkVOFpMQ3FZa9L7p33GYCcKe0LoW2K1/aS3Cr
 3/RQ/PGxc/BTKBAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A851136F5;
 Mon,  5 Feb 2024 08:14:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ofQqCeSYwGVsCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Feb 2024 08:14:28 +0000
Message-ID: <9a6f1a2a-ada3-41c0-b069-53c55c2e607c@suse.de>
Date: Mon, 5 Feb 2024 09:14:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-3-tzimmermann@suse.de>
 <7f3b8c61-3266-4bba-b866-c3e5623b3893@linux.dev>
Content-Language: en-US
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
In-Reply-To: <7f3b8c61-3266-4bba-b866-c3e5623b3893@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g5xg0kgkIViF1iLk28xBSTon"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-5.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[7];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[linux.dev,redhat.com,gmx.de,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.09
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
--------------g5xg0kgkIViF1iLk28xBSTon
Content-Type: multipart/mixed; boundary="------------0sGfhsbxOuARCHeUJkOc3pxo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <9a6f1a2a-ada3-41c0-b069-53c55c2e607c@suse.de>
Subject: Re: [v2,2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
References: <20240202120140.3517-3-tzimmermann@suse.de>
 <7f3b8c61-3266-4bba-b866-c3e5623b3893@linux.dev>
In-Reply-To: <7f3b8c61-3266-4bba-b866-c3e5623b3893@linux.dev>

--------------0sGfhsbxOuARCHeUJkOc3pxo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDIuMjQgdW0gMTc6MzEgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gDQo+IE9uIDIwMjQvMi8yIDE5OjU4LCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL3NjcmVlbl9pbmZvX3BjaS5jIA0K
Pj4gYi9kcml2ZXJzL3ZpZGVvL3NjcmVlbl9pbmZvX3BjaS5jDQo+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uZDk1OWE0YzZiYTNkNQ0KPj4gLS0t
IC9kZXYvbnVsbA0KPj4gKysrIGIvZHJpdmVycy92aWRlby9zY3JlZW5faW5mb19wY2kuYw0K
Pj4gQEAgLTAsMCArMSw1MiBAQA0KPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wDQo+PiArDQo+PiArI2luY2x1ZGUgPGxpbnV4L3BjaS5oPg0KPj4gKyNpbmNsdWRl
IDxsaW51eC9zY3JlZW5faW5mby5oPg0KPj4gKw0KPj4gK3N0YXRpYyBzdHJ1Y3QgcGNpX2Rl
diAqX19zY3JlZW5faW5mb19wY2lfZGV2KHN0cnVjdCByZXNvdXJjZSAqcmVzKQ0KPj4gK3sN
Cj4+ICvCoMKgwqAgc3RydWN0IHBjaV9kZXYgKnBkZXY7DQo+PiArDQo+PiArwqDCoMKgIGlm
ICghKHJlcy0+ZmxhZ3MgJiBJT1JFU09VUkNFX01FTSkpDQo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIE5VTEw7DQo+PiArDQo+PiArwqDCoMKgIGZvcl9lYWNoX3BjaV9kZXYocGRldikg
ew0KPj4gK8KgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCByZXNvdXJjZSAqcjsNCj4+ICsN
Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoKHBkZXYtPmNsYXNzID4+IDE2KSAhPSBQQ0lfQkFT
RV9DTEFTU19ESVNQTEFZKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7
DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgciA9IHBjaV9maW5kX3Jlc291cmNlKHBkZXYs
IHJlcyk7DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHIpDQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcGRldjsNCj4+ICvCoMKgwqAgfQ0KPj4gKw0KPj4gK8KgwqDCoCBy
ZXR1cm4gTlVMTDsNCj4+ICt9DQo+IA0KPiANCj4gSSByZWNvbW1lbmQgdXNpbmcgdGhlIHBj
aV9nZXRfYmFzZV9jbGFzcygpIG9yIHBjaV9nZXRfY2xhc3MoKSBoZWxwZXIgDQo+IGZ1bmN0
aW9uIGF0IGhlcmUsDQo+IGZvciBleGFtcGxlOg0KDQpHb29kIGlkZWEsIEkgdGhpbmsgSSds
bCBkbyB0aGF0LiBUaGFua3MhDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IA0K
PiBzdGF0aWMgc3RydWN0IHBjaV9kZXYgKl9fc2NyZWVuX2luZm9fcGNpX2RldihzdHJ1Y3Qg
cmVzb3VyY2UgKnJlcykNCj4gew0KPiAgwqDCoMKgwqBzdHJ1Y3QgcGNpX2RldiAqcGRldjsN
Cj4gDQo+ICDCoMKgwqDCoGlmICghKHJlcy0+ZmxhZ3MgJiBJT1JFU09VUkNFX01FTSkpDQo+
ICDCoMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsNCj4gDQo+ICDCoMKgwqDCoHdoaWxlICgo
cGRldiA9IHBjaV9nZXRfYmFzZV9jbGFzcyhQQ0lfQkFTRV9DTEFTU19ESVNQTEFZLCBwZGV2
KSkpIHsNCj4gIMKgwqDCoMKgwqDCoMKgIGlmIChwY2lfZmluZF9yZXNvdXJjZShwZGV2LCBy
ZXMpKQ0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcGRldjsNCj4gIMKgwqDC
oMKgfQ0KPiANCj4gIMKgwqDCoMKgcmV0dXJuIE5VTEw7DQo+IH0NCj4gDQo+IA0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0
NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFu
ZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVy
ZykNCg==

--------------0sGfhsbxOuARCHeUJkOc3pxo--

--------------g5xg0kgkIViF1iLk28xBSTon
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmXAmOMFAwAAAAAACgkQlh/E3EQov+Az
gA//WWGbb4kvdwEjgbl+rRMrUeqZM6AZEp+NdAZqJtlmcawGLitSuiynLkQOy5B8cKSQeJV6XuIh
i2k2qRtPdTbI1eGL8Fi8Grr1qVmWlTC4/f4Jorbi+y+U616Dci7hmiVsKhI5UXmbPJ45wZjQKag9
zxrIq9uS5G7YB8YhHaLgPn1DCpo0rZpDJfucmZLQtJFoOcPtJfi7K81I/N4sbsdMcg/yy/+pDs7A
sbDWSaU+78dzfs29UsKpmofEq0xOHleGbgRzmJT32jEtnPmBC7rPVlETZzqdc6SdHlpQgopkRmO4
Eix/4Sy1AIoJ5d3SAciy+1xsUwL1STTCHLi8t9pFA4HdNIkXHRgsZUGAU2Uc6GkbWHOv8DvefNVl
QSY7ibEjPt1wPV6niKq7+pTg4qUBIskh4loCIV4ARRLmOMJ2V6KXB4l4Et3bKYXl0Pxsa1HPHcnK
XnLdKlRSSgsTzCiPdKruiy9D9iHr9w+NDaUAUPUbiPAJmki990KYJevorYVeWKQr1xpcFZoevXrM
QwaGRtS76CMMxmYmkkDzBiXtWmqsaLUX8fRny0I415rCBVhiKdGQTUjMDIgMg5HUqWFkXfm9/kD0
4hnmHj7RDLylMLjcwOcwGMFak/zsrWtU1VmOPag4RAeTlxiLQMo8gu5R7DTQ1HLFPd0QpiPoM6Dt
J3I=
=aJme
-----END PGP SIGNATURE-----

--------------g5xg0kgkIViF1iLk28xBSTon--
