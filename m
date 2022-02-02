Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E2F4A74FD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E89710E200;
	Wed,  2 Feb 2022 15:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75E410E200
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:54:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2832521108;
 Wed,  2 Feb 2022 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643817249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QUXUj16uy0IAkREyILFIyfgu27cz5tMAIn1ieaEqIvA=;
 b=PAZhDN30t/U/yUkjPyjLhEDn+M1irRT5plvcHfTruNrJZ6wGb3LnwXUqLfN4gfBc8prj5e
 Jr3PBF1l/x3KsHxJ/wBSXDhc/HrrIEQAtBQBNehN5CsEKwhg4G/uhyO+pDRMfnPJNSBPxd
 +/2PdbhN4E4CmPM56f0cp3of7UpSFH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643817249;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QUXUj16uy0IAkREyILFIyfgu27cz5tMAIn1ieaEqIvA=;
 b=DwJZ0BJx3rIn4MXDnlPZP2rLPTd5r8qBROd8klxb5MnAnZO8anfLw6KvXgjOFoSl7qMBZ8
 EoGrZ8WFCwOQiqAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B66DF13E8F;
 Wed,  2 Feb 2022 15:54:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Bu5aKyCp+mHJHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Feb 2022 15:54:08 +0000
Message-ID: <f17a093f-610b-2c37-8950-e8b1701f55a7@suse.de>
Date: Wed, 2 Feb 2022 16:54:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [next] arm: panel-edp.c:(.text+0xb74): undefined reference to
 `drm_panel_dp_aux_backlight'
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com>
 <76ff2848-3af4-6758-6e98-91a4c9ad26d8@suse.de>
 <CAMj1kXE6Q9uW45Q5A-TuPDiXTPOGrGjUn_8FUBKNGQ1g9bd3Rg@mail.gmail.com>
 <a1dd9d31-3ad0-b58f-c67b-5896048281ed@suse.de>
 <CAD=FV=UzVczyMKiCt9tkMBveGqWFbACMF_Z1GRWypz+awSO06Q@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAD=FV=UzVczyMKiCt9tkMBveGqWFbACMF_Z1GRWypz+awSO06Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3rPhmaKw0jACegMxp0yf5QP3"
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
 regressions@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
 Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, lkft-triage@lists.linaro.org,
 Grace Mi <grace.mi@ecs.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3rPhmaKw0jACegMxp0yf5QP3
Content-Type: multipart/mixed; boundary="------------mnSZ9lKqSoVowtIf067tmc7x";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Doug Anderson <dianders@chromium.org>
Cc: Marek Vasut <marex@denx.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 regressions@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
 Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, lkft-triage@lists.linaro.org,
 Grace Mi <grace.mi@ecs.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Message-ID: <f17a093f-610b-2c37-8950-e8b1701f55a7@suse.de>
Subject: Re: [next] arm: panel-edp.c:(.text+0xb74): undefined reference to
 `drm_panel_dp_aux_backlight'
References: <CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com>
 <76ff2848-3af4-6758-6e98-91a4c9ad26d8@suse.de>
 <CAMj1kXE6Q9uW45Q5A-TuPDiXTPOGrGjUn_8FUBKNGQ1g9bd3Rg@mail.gmail.com>
 <a1dd9d31-3ad0-b58f-c67b-5896048281ed@suse.de>
 <CAD=FV=UzVczyMKiCt9tkMBveGqWFbACMF_Z1GRWypz+awSO06Q@mail.gmail.com>
In-Reply-To: <CAD=FV=UzVczyMKiCt9tkMBveGqWFbACMF_Z1GRWypz+awSO06Q@mail.gmail.com>

--------------mnSZ9lKqSoVowtIf067tmc7x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDIuMjIgdW0gMTY6Mzcgc2NocmllYiBEb3VnIEFuZGVyc29uOg0KPiBI
aSwNCj4gDQo+IE9uIFdlZCwgRmViIDIsIDIwMjIgYXQgMjoyNSBBTSBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pg0KPj4gSGkNCj4+DQo+PiBB
bSAwMi4wMi4yMiB1bSAxMDoyOCBzY2hyaWViIEFyZCBCaWVzaGV1dmVsOg0KPj4+IE9uIFdl
ZCwgMiBGZWIgMjAyMiBhdCAxMDowOCwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+IHdyb3RlOg0KPj4+Pg0KPj4+PiBIaQ0KPj4+Pg0KPj4+PiBBbSAwMi4wMi4y
MiB1bSAxMDowMiBzY2hyaWViIE5hcmVzaCBLYW1ib2p1Og0KPj4+Pj4gRm9sbG93aW5nIGJ1
aWxkcyBmYWlsZWQgb24gTGludXggbmV4dCAyMDIyMDIwMiBhcm0gYXJjaGl0ZWN0dXJlLg0K
Pj4+Pj4gICAgICAtIGFybS1nY2MtMTAtb21hcDJwbHVzX2RlZmNvbmZpZw0KPj4+Pj4gICAg
ICAtIGFybS1jbGFuZy1uaWdodGx5LXNobW9iaWxlX2RlZmNvbmZpZw0KPj4+Pj4gICAgICAt
IGFybS1nY2MtOC1scGMzMnh4X2RlZmNvbmZpZw0KPj4+Pj4gICAgICAtIGFybS1jbGFuZy0x
My1zaG1vYmlsZV9kZWZjb25maWcNCj4+Pj4+ICAgICAgLSBhcm0tZ2NjLTEwLXNobW9iaWxl
X2RlZmNvbmZpZw0KPj4+Pj4gICAgICAtIGFybS1jbGFuZy0xMS1zaG1vYmlsZV9kZWZjb25m
aWcNCj4+Pj4+ICAgICAgLSBhcm0tY2xhbmctMTEtb21hcDJwbHVzX2RlZmNvbmZpZw0KPj4+
Pj4gICAgICAtIGFybS1jbGFuZy0xMy1vbWFwMnBsdXNfZGVmY29uZmlnDQo+Pj4+PiAgICAg
IC0gYXJtLWNsYW5nLTExLWxwYzMyeHhfZGVmY29uZmlnDQo+Pj4+PiAgICAgIC0gYXJtLWdj
Yy04LW9tYXAycGx1c19kZWZjb25maWcNCj4+Pj4+ICAgICAgLSBhcm0tZ2NjLTktdmV4cHJl
c3NfZGVmY29uZmlnDQo+Pj4+PiAgICAgIC0gYXJtLWNsYW5nLW5pZ2h0bHktbHBjMzJ4eF9k
ZWZjb25maWcNCj4+Pj4+ICAgICAgLSBhcm0tZ2NjLTktc2htb2JpbGVfZGVmY29uZmlnDQo+
Pj4+PiAgICAgIC0gYXJtLWNsYW5nLTEzLWxwYzMyeHhfZGVmY29uZmlnDQo+Pj4+PiAgICAg
IC0gYXJtLWdjYy0xMC1zYW1hNV9kZWZjb25maWcNCj4+Pj4+ICAgICAgLSBhcm0tY2xhbmct
MTEtdmV4cHJlc3NfZGVmY29uZmlnDQo+Pj4+PiAgICAgIC0gYXJtLWNsYW5nLTExLXNhbWE1
X2RlZmNvbmZpZw0KPj4+Pj4gICAgICAtIGFybS1nY2MtOS1vbWFwMnBsdXNfZGVmY29uZmln
DQo+Pj4+PiAgICAgIC0gYXJtLWNsYW5nLW5pZ2h0bHktc2FtYTVfZGVmY29uZmlnDQo+Pj4+
PiAgICAgIC0gYXJtLWNsYW5nLTEzLXZleHByZXNzX2RlZmNvbmZpZw0KPj4+Pj4gICAgICAt
IGFybS1jbGFuZy1uaWdodGx5LXZleHByZXNzX2RlZmNvbmZpZw0KPj4+Pj4gICAgICAtIGFy
bS1nY2MtOS1scGMzMnh4X2RlZmNvbmZpZw0KPj4+Pj4gICAgICAtIGFybS1jbGFuZy0xMi12
ZXhwcmVzc19kZWZjb25maWcNCj4+Pj4+ICAgICAgLSBhcm0tZ2NjLTEwLXZleHByZXNzX2Rl
ZmNvbmZpZw0KPj4+Pj4gICAgICAtIGFybS1jbGFuZy0xMi1zaG1vYmlsZV9kZWZjb25maWcN
Cj4+Pj4+ICAgICAgLSBhcm0tZ2NjLTExLW9tYXAycGx1c19kZWZjb25maWcNCj4+Pj4+ICAg
ICAgLSBhcm0tZ2NjLTktc2FtYTVfZGVmY29uZmlnDQo+Pj4+PiAgICAgIC0gYXJtLWdjYy04
LXNobW9iaWxlX2RlZmNvbmZpZw0KPj4+Pj4gICAgICAtIGFybS1nY2MtMTAtbHBjMzJ4eF9k
ZWZjb25maWcNCj4+Pj4+ICAgICAgLSBhcm0tY2xhbmctMTItb21hcDJwbHVzX2RlZmNvbmZp
Zw0KPj4+Pj4gICAgICAtIGFybS1nY2MtOC12ZXhwcmVzc19kZWZjb25maWcNCj4+Pj4+ICAg
ICAgLSBhcm0tY2xhbmctMTItc2FtYTVfZGVmY29uZmlnDQo+Pj4+PiAgICAgIC0gYXJtLWNs
YW5nLW5pZ2h0bHktb21hcDJwbHVzX2RlZmNvbmZpZw0KPj4+Pj4gICAgICAtIGFybS1nY2Mt
MTEtbHBjMzJ4eF9kZWZjb25maWcNCj4+Pj4+ICAgICAgLSBhcm0tZ2NjLTExLXNhbWE1X2Rl
ZmNvbmZpZw0KPj4+Pj4gICAgICAtIGFybS1nY2MtMTEtc2htb2JpbGVfZGVmY29uZmlnDQo+
Pj4+PiAgICAgIC0gYXJtLWdjYy0xMS12ZXhwcmVzc19kZWZjb25maWcNCj4+Pj4+ICAgICAg
LSBhcm0tZ2NjLTgtc2FtYTVfZGVmY29uZmlnDQo+Pj4+PiAgICAgIC0gYXJtLWNsYW5nLTEz
LXNhbWE1X2RlZmNvbmZpZw0KPj4+Pj4gICAgICAtIGFybS1jbGFuZy0xMi1scGMzMnh4X2Rl
ZmNvbmZpZw0KPj4+Pj4NCj4+Pj4+DQo+Pj4+PiBtYWtlIC0tc2lsZW50IC0ta2VlcC1nb2lu
ZyAtLWpvYnM9OCAgQVJDSD1hcm0NCj4+Pj4+IENST1NTX0NPTVBJTEU9YXJtLWxpbnV4LWdu
dWVhYmloZi0gJ0NDPXNjY2FjaGUNCj4+Pj4+IGFybS1saW51eC1nbnVlYWJpaGYtZ2NjJyAn
SE9TVENDPXNjY2FjaGUgZ2NjJyB2ZXhwcmVzc19kZWZjb25maWcNCj4+Pj4+IG1ha2UgLS1z
aWxlbnQgLS1rZWVwLWdvaW5nIC0tam9icz04ICBBUkNIPWFybQ0KPj4+Pj4gQ1JPU1NfQ09N
UElMRT1hcm0tbGludXgtZ251ZWFiaWhmLSAnQ0M9c2NjYWNoZQ0KPj4+Pj4gYXJtLWxpbnV4
LWdudWVhYmloZi1nY2MnICdIT1NUQ0M9c2NjYWNoZSBnY2MnDQo+Pj4+PiBhcm0tbGludXgt
Z251ZWFiaWhmLWxkOiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZWRwLm86IGluIGZ1
bmN0aW9uDQo+Pj4+PiBgcGFuZWxfZWRwX3Byb2JlJzoNCj4+Pj4+IHBhbmVsLWVkcC5jOigu
dGV4dCsweGI3NCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRybV9wYW5lbF9kcF9hdXhf
YmFja2xpZ2h0Jw0KPj4+Pj4gbWFrZVsxXTogKioqIFsvYnVpbGRzL2xpbnV4L01ha2VmaWxl
OjEyMjI6IHZtbGludXhdIEVycm9yIDENCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gUmVwb3J0ZWQt
Ynk6IExpbnV4IEtlcm5lbCBGdW5jdGlvbmFsIFRlc3RpbmcgPGxrZnRAbGluYXJvLm9yZz4N
Cj4+Pj4+DQo+Pj4+PiBtZXRhIGRhdGE6DQo+Pj4+PiAtLS0tLS0tLS0tLQ0KPj4+Pj4gICAg
ICAgIGdpdCBkZXNjcmliZTogbmV4dC0yMDIyMDIwMg0KPj4+Pj4gICAgICAgIGdpdF9yZXBv
OiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0
L2xpbnV4LW5leHQuZ2l0DQo+Pj4+PiAgICAgICAgdGFyZ2V0X2FyY2g6IGFybQ0KPj4+Pj4g
ICAgICAgIGtjb25maWc6IHZleHByZXNzX2RlZmNvbmZpZw0KPj4+Pj4gICAgICAgIHRvb2xj
aGFpbjogZ2NjLTExDQo+Pj4+Pg0KPj4+Pj4gQnVpbGQgbG9nOg0KPj4+Pj4gLS0tLS0tLS0t
LS0tLQ0KPj4+Pj4gaHR0cHM6Ly9idWlsZHMudHV4YnVpbGQuY29tLzI0WFJpbTcydkZYaXg2
bDZNZEFKTkVOeTZqZS8NCj4+Pj4+DQo+Pj4+PiBTdGVwcyB0byByZXByb2R1Y2U6DQo+Pj4+
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+Pj4gIyBUbyBpbnN0YWxsIHR1eG1ha2Ugb24g
eW91ciBzeXN0ZW0gZ2xvYmFsbHk6DQo+Pj4+PiAjIHN1ZG8gcGlwMyBpbnN0YWxsIC1VIHR1
eG1ha2UNCj4+Pj4+ICMNCj4+Pj4+ICMgU2VlIGh0dHBzOi8vZG9jcy50dXhtYWtlLm9yZy8g
Zm9yIGNvbXBsZXRlIGRvY3VtZW50YXRpb24uDQo+Pj4+PiAjIE9yaWdpbmFsIHR1eG1ha2Ug
Y29tbWFuZCB3aXRoIGZyYWdtZW50cyBsaXN0ZWQgYmVsb3cuDQo+Pj4+Pg0KPj4+Pj4gdHV4
bWFrZSAtLXJ1bnRpbWUgcG9kbWFuIC0tdGFyZ2V0LWFyY2ggYXJtIC0tdG9vbGNoYWluIGdj
Yy0xMQ0KPj4+Pj4gLS1rY29uZmlnIHZleHByZXNzX2RlZmNvbmZpZw0KPj4+Pj4NCj4+Pj4+
IHR1eG1ha2UgLS1ydW50aW1lIHBvZG1hbiAtLXRhcmdldC1hcmNoIGFybSAtLXRvb2xjaGFp
biBnY2MtMTENCj4+Pj4+IC0ta2NvbmZpZyBodHRwczovL2J1aWxkcy50dXhidWlsZC5jb20v
MjRYUmltNzJ2RlhpeDZsNk1kQUpORU55NmplL2NvbmZpZw0KPj4+Pg0KPj4+PiBZb3UnbGwg
bm93IG5lZWQNCj4+Pj4NCj4+Pj4gICAgICBDT05GSUdfRFJNX0RQX0hFTFBFUj15DQo+Pj4+
DQo+Pj4+IGluIHlvdXIgY29uZmlnLg0KPj4+Pg0KPj4+DQo+Pj4gVGhhdCBzaG91bGQgbmV2
ZXIgYmUgdGhlIHNvbHV0aW9uIGZvciBsaW5rZXIgZXJyb3JzIHN1Y2ggYXMgdGhpcyBvbmUu
DQo+Pj4NCj4+PiBJZiBDT05GSUdfRFJNX1BBTkVMX0VEUCByZWxpZXMgb24gc29tZXRoaW5n
IHByb3ZpZGVkIGJ5DQo+Pj4gQ09ORklHX0RSTV9EUF9IRUxQRVIsIGl0IHNob3VsZCBzZWxl
Y3QgaXQgb3IgZGVwZW5kIG9uIGl0IGluIEtjb25maWcuDQo+Pg0KPj4gT2YgY291cnNlLCB3
ZSdsbCBwcm92aWRlIGEgcGF0Y2ggZm9yIHRoZSBLY29uZmlnIGZpbGVzLg0KPiANCj4gVGhl
cmUgd2FzIGRpc2N1c3Npb24gYWJvdXQgdGhpcyBsYXN0IE5vdmVtYmVyIGJ1dCBJIGd1ZXNz
IG5vdGhpbmcgY2FtZSBvZiBpdD8NCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyMTExMTcwNjI3MDQuMTQ2NzEtMS1yZHVubGFwQGluZnJhZGVhZC5vcmcvDQo+IA0KPiBJ
biB0aGVyZSBBcm5kIHByb3ZpZGVkIGEgcHJvcG9zZWQgcGF0Y2guIElmIGV2ZXJ5b25lIGxp
a2VzIHRoYXQgYW5kIGl0DQo+IGZpeGVzIHRoaW5ncyB0aGVuIHdlIGNhbiBhcHBseSBpdC4u
Lg0KDQpZZXAsIGFwcGFyZW50bHkgdGhpcyB3YXMgYnJva2VuIGJlZm9yZS4gV2UgcmVjZW50
bHkgbW92ZWQgdGhlc2Ugc3ltYm9scyANCmZyb20gQ09ORklHX0RSTV9LTVNfSEVMUEVSIGJl
aGluZCBDT05GSUdfRFJNX0RQX0hFTFBFUi4gV2UnZCBoYXZlIHRvIHVzZSANCnRoYXQgaW5z
dGVhZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gLURvdWcNCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------mnSZ9lKqSoVowtIf067tmc7x--

--------------3rPhmaKw0jACegMxp0yf5QP3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH6qSAFAwAAAAAACgkQlh/E3EQov+AC
UhAAqVy+7nc3saYAIY3Rlz8vKuGVK2JRIpclNsis0CwgYH8AlclXG3eMCAsGUyxarWnUQc0ycvNA
8ouNeDZ5PzTy+GwFTbgxTDvcrvN1JgEuDz0U0i8HbWxjEbFHvCv4HULyOckYzOxc4pE71EvYqqfH
d/LsP5cF8xOIgzH+jgu6uWrBTY73qAmON+t/y0nMq2LsfqSv0XRK9UERocOJUzQzb3f1DZDdGQg6
q2X8fsFegddFVlvm2C49p6PgTInIQ/FqYCE1et3hQ4GjQVR1NOWAiV1xb5GgiTAjsGTcuODUdfUp
hGxRJlCn4BMT+2BtLYIlFH/luOaSTr9fko92EyYR8S0yfoT0pKCNc1Jym2wmsRPZcTijKV/QWALw
TTC/k+CSZH2hcEwYTawli3aPslAfu7ziOLpoBJx+R49kVRLhe885amJcZLUakvN69P5fux1wKum2
OXYYZaJnPgKfiFex1dMbc7uBHQGg9BSSEA40gm0ts9svI20Fb6H0S0Oc0Ix3fFKfXOHp7drEgRg3
L/uUcJzTWPCfv5TZfHxGuF8nAolpRh5vxgetNd0+yCvvF8890ntMFLzSG7UUFv5bW7T2glr4dYgw
xw6DWVz305j358oUeQIH0EuiSppfTZ8NGUYfg3nSrROVWJJerbYcg3awk7yCZoATNPJPYcu54e6W
w6c=
=Q+Mo
-----END PGP SIGNATURE-----

--------------3rPhmaKw0jACegMxp0yf5QP3--
