Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A134789BB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 12:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D763B10EEE1;
	Fri, 17 Dec 2021 11:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FC710EEE0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 11:23:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48ADC1F38A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 11:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639740203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=t70eEzWHd6oXOFRe/kwYn0xQGsFwgsYcRy0o1devI4o=;
 b=fk/vKZ/Ze9Sh9DuiR1xUE5EtFkBFUS3hsM7eNqw/vPwFyGRntCf2fOlxntGVBJRsV/QaHs
 s30URNeXwxnhjTh6e7a71rpwFbvb470kpqiraA3BpLBGbADuBBmsHumQbnC2OGrX3yo7nG
 tVv1qeR1C7UUSI8BS2dWZ+fUwjwR07k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639740203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=t70eEzWHd6oXOFRe/kwYn0xQGsFwgsYcRy0o1devI4o=;
 b=RBhYGToh7GILm+7jTWOplJrnoVpqGiCfWpNaacnJ3vfUWtxIJOzfZTdCf44SMkj9p3rXUh
 GPydBoKviShu0oAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3310413DC1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 11:23:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VqTWCitzvGFJSAAAMHmgww
 (envelope-from <tzimmermann@suse.de>)
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 11:23:23 +0000
Message-ID: <60747796-7c8f-2a60-3148-29abb6fe5b65@suse.de>
Date: Fri, 17 Dec 2021 12:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: PSA: drm-misc-next-fixes is open
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VMD0MIcVFLxwzA0qTCLyvUao"
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
--------------VMD0MIcVFLxwzA0qTCLyvUao
Content-Type: multipart/mixed; boundary="------------2k0RdhzKBXy0p642di6Kb1Ld";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <60747796-7c8f-2a60-3148-29abb6fe5b65@suse.de>
Subject: PSA: drm-misc-next-fixes is open

--------------2k0RdhzKBXy0p642di6Kb1Ld
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkknbSBqdXN0IGxldHRpbmcgeW91IGtub3cgdGhhdCBkcm0tbWlzYy1uZXh0LWZp
eGVzIGlzIG5vdyBvcGVuIGZvciBidWcgDQpmaXhlcy4gLXJjNiB3aWxsIHByZXN1bWFibHkg
YmUgdGFnZ2VkIHRoaXMgd2Vla2VuZCwgd2hpY2ggbWVhbnMgdGhhdCANCmRybS1uZXh0IGlz
IGluIGZlYXR1cmUgZnJlZXplIHVudGlsIHRoZSBuZXh0IC1yYzEgY29tZXMgb3V0Lg0KDQpU
aGUgdHJhbnNpdGlvbiBmcm9tL3RvIGRybS1taXNjLWZpeGVzLW5leHQgb2Z0ZW4gcmVzdWx0
cyBpbiBwYXRjaGVzIHRoYXQgDQphcmUgYXBwbGllZCB0byB0aGUgd3JvbmcgdHJlZSBhbmQg
Z2V0IHN0dWNrIHRoZXJlIGZvciBhIGxvbmcgdGltZS4gU29tZSANCnJ1bGVzIG9mIHRodW1i
Og0KDQogICogaWYgeW91ciBwYXRjaCBmaXhlcyBhIGJ1ZyBpbiBkcm0tbmV4dCwgcGxlYXNl
IHB1dCBpdCBpbnRvIA0KZHJtLW1pc2MtbmV4dC1maXhlcywNCg0KICAqIGlmIHlvdXIgcGF0
Y2ggZml4ZXMgYSBidWcgaW4gdXBzdHJlYW0sIHBsZWFzZSBwdXQgaXQgaW50byANCmRybS1t
aXNjLWZpeGVzLA0KDQogICogYW55dGhpbmcgZWxzZSBzaG91bGQgZ28gaW50byBkcm0tbWlz
Yy1uZXh0Lg0KDQpUaGUgZmxvdyBjaGFydCBpcyBhdCBbMV0uDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9tYWlu
dGFpbmVyLXRvb2xzL2NvbW1pdHRlci1kcm0tbWlzYy5odG1sI3doZXJlLWRvLWktYXBwbHkt
bXktcGF0Y2gNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------2k0RdhzKBXy0p642di6Kb1Ld--

--------------VMD0MIcVFLxwzA0qTCLyvUao
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG8cyoFAwAAAAAACgkQlh/E3EQov+Br
xg//RSpxCPat++YyTmbPUGkffhIV4TWJrLfAMFr42EdmGNuv3qL7vQ0hFjgVN1fddDZw83E/NbJF
87NdwX/IQ+6rQHmgk25k/isn+EmS1EoD8vJWSypUjBTDRVnZx4E2cEBErAx5IO5+Yl7tlxtb91h/
i+rMZHdxuuBhq4XOUU2WT1czIOqO8pKKcGpsdbHabPZzYDXKUVQHWjLcBKphf01HIwBcmfgfEygV
f2l/yjjg/KFTztHxyUES+JhlCWeXpEwy6MqdG9IuJ44fKG/HKkmn5bWamKmPqQmWz+N70I2ljDId
WhUI2mZHK6Sft5HGQM5s9xKtkvDdjecuDE70AOd+hcchVZxfVmopM/FyUH8jC1o5jSBBxGfpIAQF
K7t1ev0FKDktrbfF7CdaVKr8DtRecIy8sNh1ahwHiW+9lDKypeir8CPls1ZskPO979A/PLglbKVc
u5hL5mkzAjPJoCtvSsfW2JqogiW3Z7D3hH826IHM6xB/DfZLwbVN4OlGPf2oWHeeHXmqEWYRtq0Q
jVI2nKYS3Eehs0xUkibh9q87Mb9LpLX8FDLez0s7Mpfs4xkAOqKg1u3Is+7sKdV+YdJZWUSNjnQO
KUCCefnST/djtPsKdNOCnNS2hQnFqgy7REGquFevmINfarkcLPfFpdQMlzLVaCmOjqwHCOR3r8tA
7qc=
=CoC8
-----END PGP SIGNATURE-----

--------------VMD0MIcVFLxwzA0qTCLyvUao--
