Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E84857C4B6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 08:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9B111B937;
	Thu, 21 Jul 2022 06:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B8911BC8B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 06:52:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A64A937FCA;
 Thu, 21 Jul 2022 06:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658386342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iZpNxXz4AklG3JGf5kG9J0a9G3/fKkMHuF24hgtwmE0=;
 b=rvGyf/km+O9WYkMDQLjTIzgQPmxkBEvpiK0AClpuWKGShjqCJ++SwwEtyhWfloJSz0kKSt
 1r5ugKAM0oAd9jINGMfLqklai1Yat4/Jjna7EKRA/xi7v4lGKQJ9kbFSucsSAufWy/HOtK
 w5dYsitQnZAH3dVWnn/UIzr/IcSBT9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658386342;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iZpNxXz4AklG3JGf5kG9J0a9G3/fKkMHuF24hgtwmE0=;
 b=UKuFfH4KYEaKImNZVCxW7+iAknkQ7hBrAobABfLp0dzHeEHDMwGKCpZwdpQNY0usrQWudF
 5vtqDlMbQcMWRtBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D884139FC;
 Thu, 21 Jul 2022 06:52:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FXOCHab32GJcAgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Jul 2022 06:52:22 +0000
Message-ID: <2b96adf5-9871-de2a-b4e2-521a8eede1f1@suse.de>
Date: Thu, 21 Jul 2022 08:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/7] drm: Clean up plane helpers
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220720083058.15371-1-tzimmermann@suse.de>
 <YtgaXaN9cc/9Q98z@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YtgaXaN9cc/9Q98z@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------j8p0hb0gDsgVQXVs0T0wfC8U"
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
Cc: airlied@linux.ie, alison.wang@nxp.com, linux@armlinux.org.uk,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------j8p0hb0gDsgVQXVs0T0wfC8U
Content-Type: multipart/mixed; boundary="------------ArfdGHv10BcrVkgFOp61huHQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, alison.wang@nxp.com, linux@armlinux.org.uk,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Message-ID: <2b96adf5-9871-de2a-b4e2-521a8eede1f1@suse.de>
Subject: Re: [PATCH 0/7] drm: Clean up plane helpers
References: <20220720083058.15371-1-tzimmermann@suse.de>
 <YtgaXaN9cc/9Q98z@ravnborg.org>
In-Reply-To: <YtgaXaN9cc/9Q98z@ravnborg.org>

--------------ArfdGHv10BcrVkgFOp61huHQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDIwLjA3LjIyIHVtIDE3OjA4IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBXZWQsIEp1bCAyMCwgMjAyMiBhdCAxMDozMDo1MUFN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IFRoZSBwbGFuZSBoZWxwZXJz
IGFyZSBpbmNsdWRlZCBieSBkb3plbnMgb2YgZmlsZXMgd2l0aG91dCBhbnkgbmVlZC4gT25s
eQ0KPj4gYSBoYW5kIGZ1bGwgb2Ygc291cmNlIGZpbGVzIG5lZWQgYW55dGhpbmcgZnJvbSBk
cm1fcGxhbmVfaGVscGVyLmguDQo+Pg0KPj4gVW50YW5nbGUgZXZlcnl0aGluZyBhbmQgdGlk
eSB1cCB0aGUgY29kZSBhIGJpdC4gVGhlIHBhdGNoZXMgd2VyZSBidWlsdA0KPj4gb24geDY0
LTY0LCBhYXJjaDY0IGFuZCBhcm0gd2l0aG91dCBpc3N1ZXMuDQo+IA0KPiBCdWlsZCB0ZXN0
ZWQgdGhlIGZpbmFsIHJlc3VsdCBoZXJlIG9uIGEgZmV3IG1vcmUgYXJjaHMgd2l0aG91dCBh
bnkgaXNzdWVzLg0KPiBJIGxpa2UgdGhlIHJlbW92YWwgb2YgdGhlIGluY2x1ZGUgc3RhdGVt
ZW50cyBhbmQgdGhlIHNpbXBsZXIgaGVhZGVyDQo+IGZpbGUuDQoNClRoYW5rcyBmb3IgdGVz
dGluZy4gSSB3YXMgc3VycHJpc2VkIHRoYXQgbm90aGluZyByZWFsbHkgbmVlZGVkIA0KZHJt
X3BsYW5lX2hlbHBlci5oLg0KDQo+IA0KPiBJIGRpZCBub3QgcmVhbGx5IGdldCB3aGF0IGlz
IGdhaW5lZCBieSBwdXNoaW5nIG91dCBkcm1fcGxhbmVfZnVuY3MNCj4gdG8gdGhlIGRyaXZl
cnMgYnV0IHRydXN0IHRoaXMgaXMgaW4gdGhlIGVuZCBhIGJldHRlciBzb2x1dGlvbi4NCg0K
T24gb25lIGhhbmQsIEkgdGhpbmsgaXQncyBub3QgcG9zc2libGUgdG8gZGVjbGFyZSB0aGUg
c3ltYm9sIHdpdGhvdXQgDQppbmNsdWRpbmcgZHJtX3BsYW5lLmguIFNvIHJlbW92aW5nIGl0
IHJlZHVjZXMgdGhlIG51bWJlciBvZiBpbmNsdWRlIA0Kc3RhdGVtZW50cy4NCg0KSW4gdGVy
bXMgb2Ygc29mdHdhcmUgZGVzaWduLCB0aGVzZSBleHBvcnRlZCwgcHJlLWluaXRpYWxpemVk
IGRhdGEgDQpzdHJ1Y3R1cmVzIGFyZSBsaWtlIGJsYWNrYm94ZXMgYW5kIHdpdGggbGl0dGxl
IGZsZXhpYmlsaXR5LiBCdXQgRFJNIA0KaGVscGVycyBzaG91bGQgcmF0aGVyIGJlIGxpa2Ug
YSBjb25zdHJ1Y3Rpb24ga2l0LCB3aGVyZSBkcml2ZXJzIGNhbiBwaWNrIA0KaW5kaXZpZHVh
bCBwaWVjZXMgZnJvbS4NCg0KPiANCj4gU2VyaWVzIGlzOg0KPiBSZXZpZXdlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KDQpUaGFuayB5b3UNCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gCVNhbQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------ArfdGHv10BcrVkgFOp61huHQ--

--------------j8p0hb0gDsgVQXVs0T0wfC8U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLY96UFAwAAAAAACgkQlh/E3EQov+Bo
hBAAwq81CAt1Bz6VCrhjXlzVJcgoHIQV0NE6/8WggyZI5+yDte+VsF+0etIgztdCY9AwcA8SSm+2
dKW+qGKoV3ylqZSkF0qJ+N/aSazhZeaRHeDphFpIxxO+Lkw8UDll6nTj2adgGIvLNfFhMptrfZVt
gyjWZkQQiOpnakaE6pb/ficOoPjOff3/q87X/OPltFgqdcPY0gu80r57pYEBJAm/HzatfLbptJP5
UrSIns3j/3/Rx2oI+C4IBWXWJ0/U4oSANlWduawfXs/RSo/YhXBUverkogd8kl2/7AyWn4jdcm5y
twPbtvow38DOKjVhwRQbqHt57ZBcn4G6gK/29qbUFaqt35bDkf7ZqV46W5lf9StMPqiSpf6KOEmo
YdTAj7rKvV3/VSqnVgWX7h0ODyhcegfbDCKunzz5HEu5CCETJ7V21sfh4kKaWBF2mZx6jijRidGO
q+N85P4LZ1xyw8pvm4B79WeIIyCHY9BJQhfd0KAgRKXwg+7jJixdZXEJf3mNzXJ9NimSF2yCDEQ5
eVFbRaWz+LC2emmZJKf1CSMtet145F+xwxUUPk7xzCm+/2OvuLwHnXDO9/vSv1BsAYNRwPef8Csf
ooL1kWhH3wdSPPKhI00QIOivo5liNO0ikCKkzC3nIasFeB7spsR77PIHQudl2aHyD1TNLpVCPL/u
r1I=
=WiMr
-----END PGP SIGNATURE-----

--------------j8p0hb0gDsgVQXVs0T0wfC8U--
