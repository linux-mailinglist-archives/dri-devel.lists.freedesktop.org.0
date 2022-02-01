Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E814A646F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 20:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E415310E545;
	Tue,  1 Feb 2022 19:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A9010E549
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 19:00:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F95C1F383;
 Tue,  1 Feb 2022 19:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643742035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HbN/Qhq59Hjn7h6M4AmKs0sToifuwhxMJ9496sm61tc=;
 b=sVFu4RdWIZOtT44IWIylWARf4S3FmTbZsTCDRAKoZIgTdBXvn2enCoUmVK8/sx2BxrwEf3
 HXR+3YwGB9GKN50LhWnSqw8GiZCuS1/Px6hpfIxtmq/S/5HIhYnSrNBHh1JtPZCcbvIBtl
 HDTmtbKdZVmqQ+tvGMstq27vE6ExP5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643742035;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HbN/Qhq59Hjn7h6M4AmKs0sToifuwhxMJ9496sm61tc=;
 b=DeC/+9bJZdsx+3RSKykixvR4uVWATp1BIn8wJ/FD+WLJZA8S6Tj3ejcO187rIO1RyuUKex
 +OcZvg85+XY44jAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F283F13B6A;
 Tue,  1 Feb 2022 19:00:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eJnzOVKD+WFrFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Feb 2022 19:00:34 +0000
Message-ID: <19ed72ef-373f-3ec5-54db-9125ffae4738@suse.de>
Date: Tue, 1 Feb 2022 20:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de> <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com> <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
 <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
 <ddb0f354-be19-92fe-20b3-56b00c9304ab@suse.de>
 <840ec74d-60c6-9480-709c-8cd597c6f5b0@redhat.com>
 <e7fbef3c-2f87-15f9-b24d-34ffaa5a2853@suse.de>
 <CAMuHMdXnn+JcyMAV_Vbb4Yj8hJmae=Snc2R2fLviq67UYXg7Ew@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdXnn+JcyMAV_Vbb4Yj8hJmae=Snc2R2fLviq67UYXg7Ew@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dMcQQ2HTCLBZfDqvILpeTDuc"
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
Cc: Andy Shevchenko <andy@kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dMcQQ2HTCLBZfDqvILpeTDuc
Content-Type: multipart/mixed; boundary="------------UwleEWpIBjE3KuaLFPSuYrBU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andy Shevchenko <andy@kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <19ed72ef-373f-3ec5-54db-9125ffae4738@suse.de>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de> <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com> <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
 <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
 <ddb0f354-be19-92fe-20b3-56b00c9304ab@suse.de>
 <840ec74d-60c6-9480-709c-8cd597c6f5b0@redhat.com>
 <e7fbef3c-2f87-15f9-b24d-34ffaa5a2853@suse.de>
 <CAMuHMdXnn+JcyMAV_Vbb4Yj8hJmae=Snc2R2fLviq67UYXg7Ew@mail.gmail.com>
In-Reply-To: <CAMuHMdXnn+JcyMAV_Vbb4Yj8hJmae=Snc2R2fLviq67UYXg7Ew@mail.gmail.com>

--------------UwleEWpIBjE3KuaLFPSuYrBU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDIuMjIgdW0gMTg6MDAgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFR1ZSwgRmViIDEsIDIwMjIgYXQgNToxNiBQTSBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+PiBBbSAz
MS4wMS4yMiB1bSAxMToxOCBzY2hyaWViIEphdmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4+
PiBBbm90aGVyIHRoaW5nIHRoYXQncyBtaXNzaW5nIGlzIGEgRFJNX01PREVfQ09OTkVDVE9S
X0kyQywgYmVjYXVzZSBJIHVzZWQgZm9yDQo+Pj4gbm93IGEgRFJNX01PREVfQ09OTkVDVE9S
X1Vua25vd24uDQo+Pg0KPj4gVGhhdCBtaWdodCBoYXZlIGltcGxpY2F0aW9ucyBvbiB1c2Vy
c3BhY2UuIE1heWJlIGFzayBhcm91bmQuIChOb3QgdGhhdA0KPj4gd2UgYWN0dWFsbHkgcnVu
IHVzZXJzcGFjZSBvbiB0aGUgZGV2aWNlKS4NCj4gDQo+IExvb2tpbmcgYXQgdGhlIGxpc3Qg
b2YgY29ubmVjdG9yIHR5cGVzIChhbmQgd29uZGVyaW5nIGlmIHdlJ3JlIGdvbm5hDQo+IG5l
ZWQgbW9yZSB3aGVuIGNvbnZlcnRpbmcgZXhpc3RpbmcgZmJkZXYgZHJpdmVycyB0byBkcm0g
ZHJpdmVycyksDQo+IHRoZXJlIHNlZW0gdG8gYmUgdHdvIGRpZmZlcmVudCBmYW1pbGllcyBv
ZiBjb25uZWN0b3IgdHlwZXMsIGZvcg0KPiAgICAxLiB0cmFuc3BvcnRzIGJldHdlZW4gQ1JU
QyBhbmQgZGlzcGxheSAoZS5nLiBWR0EsIERWSUQsIEhETUkpLA0KPiAgICAyLiB0cmFuc3Bv
cnRzIGJldHdlZW4gQ1BVIGFuZCBDUlRDIChlLmcuIFNQSSwgcG9zc2libHkgVVNCLCBhbmQN
Cj4gICAgICAgdGhlIHByb3Bvc2VkIEkyQyk/DQoNCkkgdGhpbmsgSSBoYWQgYSBzaW1pbGFy
IGRpc2N1c3Npb24gd2hlbiB3ZSBtZXJnZWQgdGhlIGd1ZCBkcml2ZXIuIGd1ZCBpcyANCmEg
ZHJpdmVyIGZvciBhIFJhc1BpLWJhc2VkIHVzYiBkaXNwbGF5IGFkYXB0ZXIuICBNeSBwb2lu
dCB3YXMgdGhhdCBVU0IgDQppcyBqdXN0IGFuIGludGVybmFsIHRyYW5zcG9ydCBidXMsIGxp
a2UgUENJLiBCdXQgdGhhdCB3YXNuJ3QgY29udmluY2luZy4gDQpTbyBub3cgd2UgaGF2ZSBV
U0IgYW5kIG90aGVyIGJ1c3NlcyBhcyBjb25uZWN0b3IgdHlwZXMuDQoNCk15IHByZWZlcmVu
Y2Ugd291bGQgYmUgdG8gdXNlIGEgcGFuZWwgdHlwZSBhcyBEYW5pZWwgc3VnZ2VzdGVkOyBh
bmQgDQptYXliZSAnVW5rbm93bicgZm9yIGEgZmV3IHNwZWNpYWwgY2FzZXMuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------UwleEWpIBjE3KuaLFPSuYrBU--

--------------dMcQQ2HTCLBZfDqvILpeTDuc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH5g1IFAwAAAAAACgkQlh/E3EQov+Cb
xRAAwqg0tsulrU2Cng3tcNKrMlSOKc2IWYiKebphbBgA8eEuECYVu6b2So0ga2HUs8OBY+8uZxIo
Q1nePdqWVxYBIuc4X4yV7WRd3lIP6NOnLKcwLhydL2Ji4Rq6gMnVApNQBt9Ln7D4V8M2beSeQl3a
XTCFy/00qtTfpIij9ePIXcHB2TXwOmLgT8JDo78GWTIaH0OK205QSz3vvucBM2/POhRCk9LV5LnN
Hh4EFytGoPaZzWhmSfnlZL63kaDwzh+UtRtJmFpPmGcrhO+VG1SLbcUM9xaOh58kfzmTextLFxik
cE3SE2zM50vR7Q3kaglX3rZlus7eYJPHZE6Q7ueQrZfOVODAOaD7ybI5FhSpsBIU28l4kkJd94Q2
1YsF1NBQGgzbj4YGdgx14XVeoHiJNpixDY34MemYsl6pHmOFeL0qIH2yS/QiIvoHfBx93mow6oCk
at8JrRrJcB4zUlHQUe39KMNTcVaxkJYkXiz6anb96LTLVbkwVMLPq8X4AkwI/YJ5d+vtr5XMDoLC
bFe1HqKZkpigIYKv4Ofc83kK+y2oZxj0vz0KblsSx9vixzpIrhE2bNBfy1Kn55bA3EIXhFJRo5hq
9/NGXjI+nWSlbTrR4rUxm8gfE5OfMRLZ9LVFew4A1ia7OlbcGgHn33ukSsqTXEPiaQ0OoGx7mwnl
aSo=
=FEt0
-----END PGP SIGNATURE-----

--------------dMcQQ2HTCLBZfDqvILpeTDuc--
