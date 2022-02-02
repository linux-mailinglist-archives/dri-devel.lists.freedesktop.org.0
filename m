Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6094A6D84
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAD410E7FD;
	Wed,  2 Feb 2022 09:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B0F10E7D5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:07:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B5B4C21986;
 Wed,  2 Feb 2022 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643792851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uA2sBf//a05pokAD59RP2f2swOvfGaMSKNOa5j5zLX8=;
 b=l/4ZwPpNyk/1ViUmVx8cwg+orINOWxPPlB1ZzifVfENH2Qkm3doiIrZVfuxN8nLZ3+GdZW
 tEsHYGAIChJTL4gMy2zG1/G72gi0dnVgm+1qZd5R6wOQP6Y9mj4UGGxIYiuO3hD48vW6u4
 +cp3nZ3Riojxrtly7O6yjTMsY9BY5ZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643792851;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uA2sBf//a05pokAD59RP2f2swOvfGaMSKNOa5j5zLX8=;
 b=d1gF4Z7dt1pe9KEjkx1/oxAOjbfdqvTM7uMSrL0A82fA5QdpbPZNojmqoQdOhcMtEDDXkk
 mg9S3sX5uIymjJDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5867113B8A;
 Wed,  2 Feb 2022 09:07:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sU17FNNJ+mGxOQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Feb 2022 09:07:31 +0000
Message-ID: <76ff2848-3af4-6758-6e98-91a4c9ad26d8@suse.de>
Date: Wed, 2 Feb 2022 10:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [next] arm: panel-edp.c:(.text+0xb74): undefined reference to
 `drm_panel_dp_aux_backlight'
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 lkft-triage@lists.linaro.org, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev
References: <CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mtOg1HLWAV4mFHWm31yzy0pm"
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
Cc: Marek Vasut <marex@denx.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Arnd Bergmann <arnd@arndb.de>,
 Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Grace Mi <grace.mi@ecs.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mtOg1HLWAV4mFHWm31yzy0pm
Content-Type: multipart/mixed; boundary="------------mu050sWtlEFENyvohyXle05P";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 lkft-triage@lists.linaro.org, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev
Cc: Marek Vasut <marex@denx.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Arnd Bergmann <arnd@arndb.de>,
 Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Grace Mi <grace.mi@ecs.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <76ff2848-3af4-6758-6e98-91a4c9ad26d8@suse.de>
Subject: Re: [next] arm: panel-edp.c:(.text+0xb74): undefined reference to
 `drm_panel_dp_aux_backlight'
References: <CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com>
In-Reply-To: <CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com>

--------------mu050sWtlEFENyvohyXle05P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDIuMjIgdW0gMTA6MDIgc2NocmllYiBOYXJlc2ggS2FtYm9qdToNCj4g
Rm9sbG93aW5nIGJ1aWxkcyBmYWlsZWQgb24gTGludXggbmV4dCAyMDIyMDIwMiBhcm0gYXJj
aGl0ZWN0dXJlLg0KPiAgICAtIGFybS1nY2MtMTAtb21hcDJwbHVzX2RlZmNvbmZpZw0KPiAg
ICAtIGFybS1jbGFuZy1uaWdodGx5LXNobW9iaWxlX2RlZmNvbmZpZw0KPiAgICAtIGFybS1n
Y2MtOC1scGMzMnh4X2RlZmNvbmZpZw0KPiAgICAtIGFybS1jbGFuZy0xMy1zaG1vYmlsZV9k
ZWZjb25maWcNCj4gICAgLSBhcm0tZ2NjLTEwLXNobW9iaWxlX2RlZmNvbmZpZw0KPiAgICAt
IGFybS1jbGFuZy0xMS1zaG1vYmlsZV9kZWZjb25maWcNCj4gICAgLSBhcm0tY2xhbmctMTEt
b21hcDJwbHVzX2RlZmNvbmZpZw0KPiAgICAtIGFybS1jbGFuZy0xMy1vbWFwMnBsdXNfZGVm
Y29uZmlnDQo+ICAgIC0gYXJtLWNsYW5nLTExLWxwYzMyeHhfZGVmY29uZmlnDQo+ICAgIC0g
YXJtLWdjYy04LW9tYXAycGx1c19kZWZjb25maWcNCj4gICAgLSBhcm0tZ2NjLTktdmV4cHJl
c3NfZGVmY29uZmlnDQo+ICAgIC0gYXJtLWNsYW5nLW5pZ2h0bHktbHBjMzJ4eF9kZWZjb25m
aWcNCj4gICAgLSBhcm0tZ2NjLTktc2htb2JpbGVfZGVmY29uZmlnDQo+ICAgIC0gYXJtLWNs
YW5nLTEzLWxwYzMyeHhfZGVmY29uZmlnDQo+ICAgIC0gYXJtLWdjYy0xMC1zYW1hNV9kZWZj
b25maWcNCj4gICAgLSBhcm0tY2xhbmctMTEtdmV4cHJlc3NfZGVmY29uZmlnDQo+ICAgIC0g
YXJtLWNsYW5nLTExLXNhbWE1X2RlZmNvbmZpZw0KPiAgICAtIGFybS1nY2MtOS1vbWFwMnBs
dXNfZGVmY29uZmlnDQo+ICAgIC0gYXJtLWNsYW5nLW5pZ2h0bHktc2FtYTVfZGVmY29uZmln
DQo+ICAgIC0gYXJtLWNsYW5nLTEzLXZleHByZXNzX2RlZmNvbmZpZw0KPiAgICAtIGFybS1j
bGFuZy1uaWdodGx5LXZleHByZXNzX2RlZmNvbmZpZw0KPiAgICAtIGFybS1nY2MtOS1scGMz
Mnh4X2RlZmNvbmZpZw0KPiAgICAtIGFybS1jbGFuZy0xMi12ZXhwcmVzc19kZWZjb25maWcN
Cj4gICAgLSBhcm0tZ2NjLTEwLXZleHByZXNzX2RlZmNvbmZpZw0KPiAgICAtIGFybS1jbGFu
Zy0xMi1zaG1vYmlsZV9kZWZjb25maWcNCj4gICAgLSBhcm0tZ2NjLTExLW9tYXAycGx1c19k
ZWZjb25maWcNCj4gICAgLSBhcm0tZ2NjLTktc2FtYTVfZGVmY29uZmlnDQo+ICAgIC0gYXJt
LWdjYy04LXNobW9iaWxlX2RlZmNvbmZpZw0KPiAgICAtIGFybS1nY2MtMTAtbHBjMzJ4eF9k
ZWZjb25maWcNCj4gICAgLSBhcm0tY2xhbmctMTItb21hcDJwbHVzX2RlZmNvbmZpZw0KPiAg
ICAtIGFybS1nY2MtOC12ZXhwcmVzc19kZWZjb25maWcNCj4gICAgLSBhcm0tY2xhbmctMTIt
c2FtYTVfZGVmY29uZmlnDQo+ICAgIC0gYXJtLWNsYW5nLW5pZ2h0bHktb21hcDJwbHVzX2Rl
ZmNvbmZpZw0KPiAgICAtIGFybS1nY2MtMTEtbHBjMzJ4eF9kZWZjb25maWcNCj4gICAgLSBh
cm0tZ2NjLTExLXNhbWE1X2RlZmNvbmZpZw0KPiAgICAtIGFybS1nY2MtMTEtc2htb2JpbGVf
ZGVmY29uZmlnDQo+ICAgIC0gYXJtLWdjYy0xMS12ZXhwcmVzc19kZWZjb25maWcNCj4gICAg
LSBhcm0tZ2NjLTgtc2FtYTVfZGVmY29uZmlnDQo+ICAgIC0gYXJtLWNsYW5nLTEzLXNhbWE1
X2RlZmNvbmZpZw0KPiAgICAtIGFybS1jbGFuZy0xMi1scGMzMnh4X2RlZmNvbmZpZw0KPiAN
Cj4gDQo+IG1ha2UgLS1zaWxlbnQgLS1rZWVwLWdvaW5nIC0tam9icz04ICBBUkNIPWFybQ0K
PiBDUk9TU19DT01QSUxFPWFybS1saW51eC1nbnVlYWJpaGYtICdDQz1zY2NhY2hlDQo+IGFy
bS1saW51eC1nbnVlYWJpaGYtZ2NjJyAnSE9TVENDPXNjY2FjaGUgZ2NjJyB2ZXhwcmVzc19k
ZWZjb25maWcNCj4gbWFrZSAtLXNpbGVudCAtLWtlZXAtZ29pbmcgLS1qb2JzPTggIEFSQ0g9
YXJtDQo+IENST1NTX0NPTVBJTEU9YXJtLWxpbnV4LWdudWVhYmloZi0gJ0NDPXNjY2FjaGUN
Cj4gYXJtLWxpbnV4LWdudWVhYmloZi1nY2MnICdIT1NUQ0M9c2NjYWNoZSBnY2MnDQo+IGFy
bS1saW51eC1nbnVlYWJpaGYtbGQ6IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1lZHAu
bzogaW4gZnVuY3Rpb24NCj4gYHBhbmVsX2VkcF9wcm9iZSc6DQo+IHBhbmVsLWVkcC5jOigu
dGV4dCsweGI3NCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRybV9wYW5lbF9kcF9hdXhf
YmFja2xpZ2h0Jw0KPiBtYWtlWzFdOiAqKiogWy9idWlsZHMvbGludXgvTWFrZWZpbGU6MTIy
Mjogdm1saW51eF0gRXJyb3IgMQ0KPiANCj4gDQo+IFJlcG9ydGVkLWJ5OiBMaW51eCBLZXJu
ZWwgRnVuY3Rpb25hbCBUZXN0aW5nIDxsa2Z0QGxpbmFyby5vcmc+DQo+IA0KPiBtZXRhIGRh
dGE6DQo+IC0tLS0tLS0tLS0tDQo+ICAgICAgZ2l0IGRlc2NyaWJlOiBuZXh0LTIwMjIwMjAy
DQo+ICAgICAgZ2l0X3JlcG86IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQNCj4gICAgICB0YXJnZXRfYXJjaDog
YXJtDQo+ICAgICAga2NvbmZpZzogdmV4cHJlc3NfZGVmY29uZmlnDQo+ICAgICAgdG9vbGNo
YWluOiBnY2MtMTENCj4gDQo+IEJ1aWxkIGxvZzoNCj4gLS0tLS0tLS0tLS0tLQ0KPiBodHRw
czovL2J1aWxkcy50dXhidWlsZC5jb20vMjRYUmltNzJ2RlhpeDZsNk1kQUpORU55NmplLw0K
PiANCj4gU3RlcHMgdG8gcmVwcm9kdWNlOg0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAj
IFRvIGluc3RhbGwgdHV4bWFrZSBvbiB5b3VyIHN5c3RlbSBnbG9iYWxseToNCj4gIyBzdWRv
IHBpcDMgaW5zdGFsbCAtVSB0dXhtYWtlDQo+ICMNCj4gIyBTZWUgaHR0cHM6Ly9kb2NzLnR1
eG1ha2Uub3JnLyBmb3IgY29tcGxldGUgZG9jdW1lbnRhdGlvbi4NCj4gIyBPcmlnaW5hbCB0
dXhtYWtlIGNvbW1hbmQgd2l0aCBmcmFnbWVudHMgbGlzdGVkIGJlbG93Lg0KPiANCj4gdHV4
bWFrZSAtLXJ1bnRpbWUgcG9kbWFuIC0tdGFyZ2V0LWFyY2ggYXJtIC0tdG9vbGNoYWluIGdj
Yy0xMQ0KPiAtLWtjb25maWcgdmV4cHJlc3NfZGVmY29uZmlnDQo+IA0KPiB0dXhtYWtlIC0t
cnVudGltZSBwb2RtYW4gLS10YXJnZXQtYXJjaCBhcm0gLS10b29sY2hhaW4gZ2NjLTExDQo+
IC0ta2NvbmZpZyBodHRwczovL2J1aWxkcy50dXhidWlsZC5jb20vMjRYUmltNzJ2RlhpeDZs
Nk1kQUpORU55NmplL2NvbmZpZw0KDQpZb3UnbGwgbm93IG5lZWQNCg0KICAgQ09ORklHX0RS
TV9EUF9IRUxQRVI9eQ0KDQppbiB5b3VyIGNvbmZpZy4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gDQo+IC0tDQo+IExpbmFybyBMS0ZUDQo+IGh0dHBzOi8vbGtmdC5saW5h
cm8ub3JnDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------mu050sWtlEFENyvohyXle05P--

--------------mtOg1HLWAV4mFHWm31yzy0pm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH6SdIFAwAAAAAACgkQlh/E3EQov+Cp
UA//XsL/umxyM5Wt/HM4aHX3l4W6JeV2duzc04JnJD22Hr6SZ7kjarFVzS+UJllyqngvIk2mReZF
yZiMa+d16uv189URIHCbt2xP/a7Na64K8koe4W0QQcS56iflAbkvgcqt1wKhnDW5w8RJ2HH0gQfE
g1TlogcqzuRN3Qw1yn3AXI5VoQ1+lrjlLw/EMGpTw9mxgwSWUfyAYYrBP2CRNjnESACrA1N7G4jQ
QEp0pe1cMJeSXbWc48/pSblbCpn6XIjukTpmgfth0nDimmXMHObrYSRpX1tPge3pkAtXIu7LZCdR
AZsiZyFyOjfqlgIN6hOzQastYTUnFaq6Zq85FR+x3F59WhwRklx2cYAlrwI4fW4CgmK1+88etYz8
bFVYbrfeV83Cv0X3PISt0t7+k4zf8q4FTrQ0tK4tKuD1n9RD3FOsCvfDfsR3gJ6Hp7Sl07dPigNp
S62OwL+1wZvF45fta3ibmbK1kAdqaBw1s4M3zBVEjQ/l/dDp4oxGMMl9GSOh3wTuZl/drEQJKKIe
Gb8Mp9mbG/obV34on/ZSBO1pFCd3dcKxnQOhSVlaoriAHwCEBy7ilWIhFCaZ3yZFDny0O6sfI5fq
jSZ/CuIiES2epcbHtNhWEWFdwgHzFd2Gp7brvWER02nVWuXOsHbFQ+kHOUND07PsHC9Yu7f96CRo
Or0=
=MVeD
-----END PGP SIGNATURE-----

--------------mtOg1HLWAV4mFHWm31yzy0pm--
