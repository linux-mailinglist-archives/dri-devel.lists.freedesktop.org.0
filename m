Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7174BB4A5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 09:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E7810E330;
	Fri, 18 Feb 2022 08:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0065610E330
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 08:56:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 93EB22110B;
 Fri, 18 Feb 2022 08:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645174567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kiKJN3y1zPPffaYK4kA7yK6j2A+IN68x5YRAkMEkxns=;
 b=ST0zI4SIO9pKYnFSsCihkpuuVeeZTkpZpgIFWmSbU+6ywoosWw+HSpts2/8BSZxLvgqBBI
 lTL2SrZhR/SVUnvUgjtBNJBun4SZWf7RSWt/b7VLdRQXmj5nNgBQfw0o1+yDwZ7RN0H6Ex
 ZgB9Lpzmq58MZrKM6ipK7J1NGvyrcAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645174567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kiKJN3y1zPPffaYK4kA7yK6j2A+IN68x5YRAkMEkxns=;
 b=SJAmdwxVRT+8UTh25usTxlotiF0iAwJNgZg0QV77ZeFCcn8bqYvfANy8UyhqFEpgNfi6zJ
 4COKQEvjRvvXtzCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 556BB13C34;
 Fri, 18 Feb 2022 08:56:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KgjdEydfD2JqWwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Feb 2022 08:56:07 +0000
Message-ID: <bdfe2a30-de5c-f05c-dc31-d405efc3a82d@suse.de>
Date: Fri, 18 Feb 2022 09:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/8] drm: Add support for low-color frame buffer formats
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <Yg6yBOVTEqyPqRUc@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Yg6yBOVTEqyPqRUc@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pbHRuaPfqnEZ3GGSaEqbXb0i"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pbHRuaPfqnEZ3GGSaEqbXb0i
Content-Type: multipart/mixed; boundary="------------aGaloi2WMOqYILvg9n6s2SgG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <bdfe2a30-de5c-f05c-dc31-d405efc3a82d@suse.de>
Subject: Re: [PATCH 0/8] drm: Add support for low-color frame buffer formats
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <Yg6yBOVTEqyPqRUc@ravnborg.org>
In-Reply-To: <Yg6yBOVTEqyPqRUc@ravnborg.org>

--------------aGaloi2WMOqYILvg9n6s2SgG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE3LjAyLjIyIHVtIDIxOjM3IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0KPiBIaSBH
ZWVydCwNCj4gDQo+IE9uIFR1ZSwgRmViIDE1LCAyMDIyIGF0IDA1OjUyOjE4UE0gKzAxMDAs
IEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4+IAlIaSBhbGwsDQo+Pg0KPj4gQSBsb25n
IG91dHN0YW5kaW5nIGlzc3VlIHdpdGggdGhlIERSTSBzdWJzeXN0ZW0gaGFzIGJlZW4gdGhl
IGxhY2sgb2YNCj4+IHN1cHBvcnQgZm9yIGxvdy1jb2xvciBkaXNwbGF5cywgYXMgdXNlZCB0
eXBpY2FsbHkgb24gb2xkZXIgZGVza3RvcA0KPj4gc3lzdGVtcyBhbmQgc21hbGwgZW1iZWRk
ZWQgZGlzcGxheXMuDQo+IA0KPiBUaGlzIGlzIG9uZSBvZiB0aGUgcGllY2VzIG1pc3Npbmcg
Zm9yIGEgbG9uZyB0aW1lIC0gZ3JlYXQgdG8gc2VlDQo+IHNvbWV0aGluZyBkb25lIGhlcmUu
IFRoYW5rcyBHZWVydCENCg0KQWJzb2x1dGVseSEgSSdtIGxvb2tpbmcgZm9yd2FyZCB0byBz
ZWUgdGhlc2UgcGF0Y2hlcyBiZWluZyBtZXJnZWQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQo+IAlTYW0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------aGaloi2WMOqYILvg9n6s2SgG--

--------------pbHRuaPfqnEZ3GGSaEqbXb0i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIPXyYFAwAAAAAACgkQlh/E3EQov+CR
bxAAyAmhIJ/PgdOp5h3c83lSq7wy8ua2Kw84LB3k1nwb4LVsj5Gmk84XfgU9C2Lod2ytNiDeeNq8
DxLhss+/rXSKDLr9WZLmWo5NCbx1M/Ui5a9HfNUx378mqw3NP6sSuR77ksLkJ3XWPqFMUhjNyV3x
h2jwHjAf9Q5aZTIoQPfEAcdB3NNPRmloOT79J26LI+D5IK1UlRKlRjA82bcqx1UxcPUNKtOp0hE1
kmu5fitApliapki0GHW9WJML0oT8+TLjv4VUXQAXC2LxqcquvVPkjEQYURF3Q0zDIoiuFIQo6FJB
H3VwwFzPx9IXy6lgWrYvw31dH0hwjfjB9rr9rHP0JE4/e4FoLTUJCUqWaafAnHF2LAdHPzrsTAQN
FGnU0ki6Edfph2RGTBVwbaA3Q+SERyVjTbSfKeyt8R3GENBhhgQQLYwRZvmXmsgWQNbSB7QDxRTf
xALw+p+We3vXrwUsh64gMfpe4qoX6MPeqXrVWvVqtNthqDs6MfYOoK0yqL/utvvWI5HUqhqA+Dv/
PASz06hZQD78BBMm/UmH7PP6mJAPVhcPJKBUBKUQhcfOxI0k2RkctxARcuKazBApCUtBEQyIr5HE
JKs3XvuN4ZqXuovpIrVMs8lN5+fwlEMYanTgpzy5qVoScTuU5m1TEs0f0uanzQ88clDs0/KXbyqC
qBc=
=OjU+
-----END PGP SIGNATURE-----

--------------pbHRuaPfqnEZ3GGSaEqbXb0i--
