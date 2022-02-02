Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031054A6EA9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 11:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A03910E492;
	Wed,  2 Feb 2022 10:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D717E10E4F8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 10:25:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7D648210F0;
 Wed,  2 Feb 2022 10:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643797548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MBFFaDdmpbT6cNaTMIBoX1VcquThiP3u/BbxSfb0wuY=;
 b=JNyvQq662qKvUWcs9r5zq+Jz/igNI+v62rKC0yfVhjIHkHCflRLSfDyvO1+CWJpEtSmCZL
 ePl6mWc7tdwNi1N1Sdf6gr9lzmpIhZH0/qDwWBnnt756KpoQNyWAFTXMbfC095yhG0tpP8
 tySdDWFy6jc9EjuO7BeHxFbXFpvsx0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643797548;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MBFFaDdmpbT6cNaTMIBoX1VcquThiP3u/BbxSfb0wuY=;
 b=cHMA9RBg/YOLGW3X8Ur250PkskpWN81lZCwjed4jJKEwqBEfZJREGR/lLIer26dKg2HAbb
 +nmofruHHuuINuBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2299F13DFD;
 Wed,  2 Feb 2022 10:25:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iNJPByxc+mHoYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Feb 2022 10:25:48 +0000
Message-ID: <a1dd9d31-3ad0-b58f-c67b-5896048281ed@suse.de>
Date: Wed, 2 Feb 2022 11:25:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [next] arm: panel-edp.c:(.text+0xb74): undefined reference to
 `drm_panel_dp_aux_backlight'
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
References: <CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com>
 <76ff2848-3af4-6758-6e98-91a4c9ad26d8@suse.de>
 <CAMj1kXE6Q9uW45Q5A-TuPDiXTPOGrGjUn_8FUBKNGQ1g9bd3Rg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMj1kXE6Q9uW45Q5A-TuPDiXTPOGrGjUn_8FUBKNGQ1g9bd3Rg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------09SMQnBOqe6XcqkDFM74kwlP"
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
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, lkft-triage@lists.linaro.org,
 Grace Mi <grace.mi@ecs.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------09SMQnBOqe6XcqkDFM74kwlP
Content-Type: multipart/mixed; boundary="------------L3fX3bWa0slbEyrcIytD0sy2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Marek Vasut <marex@denx.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 regressions@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
 Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, lkft-triage@lists.linaro.org,
 Grace Mi <grace.mi@ecs.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Message-ID: <a1dd9d31-3ad0-b58f-c67b-5896048281ed@suse.de>
Subject: Re: [next] arm: panel-edp.c:(.text+0xb74): undefined reference to
 `drm_panel_dp_aux_backlight'
References: <CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com>
 <76ff2848-3af4-6758-6e98-91a4c9ad26d8@suse.de>
 <CAMj1kXE6Q9uW45Q5A-TuPDiXTPOGrGjUn_8FUBKNGQ1g9bd3Rg@mail.gmail.com>
In-Reply-To: <CAMj1kXE6Q9uW45Q5A-TuPDiXTPOGrGjUn_8FUBKNGQ1g9bd3Rg@mail.gmail.com>

--------------L3fX3bWa0slbEyrcIytD0sy2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDIuMjIgdW0gMTA6Mjggc2NocmllYiBBcmQgQmllc2hldXZlbDoNCj4g
T24gV2VkLCAyIEZlYiAyMDIyIGF0IDEwOjA4LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pg0KPj4gSGkNCj4+DQo+PiBBbSAwMi4wMi4yMiB1
bSAxMDowMiBzY2hyaWViIE5hcmVzaCBLYW1ib2p1Og0KPj4+IEZvbGxvd2luZyBidWlsZHMg
ZmFpbGVkIG9uIExpbnV4IG5leHQgMjAyMjAyMDIgYXJtIGFyY2hpdGVjdHVyZS4NCj4+PiAg
ICAgLSBhcm0tZ2NjLTEwLW9tYXAycGx1c19kZWZjb25maWcNCj4+PiAgICAgLSBhcm0tY2xh
bmctbmlnaHRseS1zaG1vYmlsZV9kZWZjb25maWcNCj4+PiAgICAgLSBhcm0tZ2NjLTgtbHBj
MzJ4eF9kZWZjb25maWcNCj4+PiAgICAgLSBhcm0tY2xhbmctMTMtc2htb2JpbGVfZGVmY29u
ZmlnDQo+Pj4gICAgIC0gYXJtLWdjYy0xMC1zaG1vYmlsZV9kZWZjb25maWcNCj4+PiAgICAg
LSBhcm0tY2xhbmctMTEtc2htb2JpbGVfZGVmY29uZmlnDQo+Pj4gICAgIC0gYXJtLWNsYW5n
LTExLW9tYXAycGx1c19kZWZjb25maWcNCj4+PiAgICAgLSBhcm0tY2xhbmctMTMtb21hcDJw
bHVzX2RlZmNvbmZpZw0KPj4+ICAgICAtIGFybS1jbGFuZy0xMS1scGMzMnh4X2RlZmNvbmZp
Zw0KPj4+ICAgICAtIGFybS1nY2MtOC1vbWFwMnBsdXNfZGVmY29uZmlnDQo+Pj4gICAgIC0g
YXJtLWdjYy05LXZleHByZXNzX2RlZmNvbmZpZw0KPj4+ICAgICAtIGFybS1jbGFuZy1uaWdo
dGx5LWxwYzMyeHhfZGVmY29uZmlnDQo+Pj4gICAgIC0gYXJtLWdjYy05LXNobW9iaWxlX2Rl
ZmNvbmZpZw0KPj4+ICAgICAtIGFybS1jbGFuZy0xMy1scGMzMnh4X2RlZmNvbmZpZw0KPj4+
ICAgICAtIGFybS1nY2MtMTAtc2FtYTVfZGVmY29uZmlnDQo+Pj4gICAgIC0gYXJtLWNsYW5n
LTExLXZleHByZXNzX2RlZmNvbmZpZw0KPj4+ICAgICAtIGFybS1jbGFuZy0xMS1zYW1hNV9k
ZWZjb25maWcNCj4+PiAgICAgLSBhcm0tZ2NjLTktb21hcDJwbHVzX2RlZmNvbmZpZw0KPj4+
ICAgICAtIGFybS1jbGFuZy1uaWdodGx5LXNhbWE1X2RlZmNvbmZpZw0KPj4+ICAgICAtIGFy
bS1jbGFuZy0xMy12ZXhwcmVzc19kZWZjb25maWcNCj4+PiAgICAgLSBhcm0tY2xhbmctbmln
aHRseS12ZXhwcmVzc19kZWZjb25maWcNCj4+PiAgICAgLSBhcm0tZ2NjLTktbHBjMzJ4eF9k
ZWZjb25maWcNCj4+PiAgICAgLSBhcm0tY2xhbmctMTItdmV4cHJlc3NfZGVmY29uZmlnDQo+
Pj4gICAgIC0gYXJtLWdjYy0xMC12ZXhwcmVzc19kZWZjb25maWcNCj4+PiAgICAgLSBhcm0t
Y2xhbmctMTItc2htb2JpbGVfZGVmY29uZmlnDQo+Pj4gICAgIC0gYXJtLWdjYy0xMS1vbWFw
MnBsdXNfZGVmY29uZmlnDQo+Pj4gICAgIC0gYXJtLWdjYy05LXNhbWE1X2RlZmNvbmZpZw0K
Pj4+ICAgICAtIGFybS1nY2MtOC1zaG1vYmlsZV9kZWZjb25maWcNCj4+PiAgICAgLSBhcm0t
Z2NjLTEwLWxwYzMyeHhfZGVmY29uZmlnDQo+Pj4gICAgIC0gYXJtLWNsYW5nLTEyLW9tYXAy
cGx1c19kZWZjb25maWcNCj4+PiAgICAgLSBhcm0tZ2NjLTgtdmV4cHJlc3NfZGVmY29uZmln
DQo+Pj4gICAgIC0gYXJtLWNsYW5nLTEyLXNhbWE1X2RlZmNvbmZpZw0KPj4+ICAgICAtIGFy
bS1jbGFuZy1uaWdodGx5LW9tYXAycGx1c19kZWZjb25maWcNCj4+PiAgICAgLSBhcm0tZ2Nj
LTExLWxwYzMyeHhfZGVmY29uZmlnDQo+Pj4gICAgIC0gYXJtLWdjYy0xMS1zYW1hNV9kZWZj
b25maWcNCj4+PiAgICAgLSBhcm0tZ2NjLTExLXNobW9iaWxlX2RlZmNvbmZpZw0KPj4+ICAg
ICAtIGFybS1nY2MtMTEtdmV4cHJlc3NfZGVmY29uZmlnDQo+Pj4gICAgIC0gYXJtLWdjYy04
LXNhbWE1X2RlZmNvbmZpZw0KPj4+ICAgICAtIGFybS1jbGFuZy0xMy1zYW1hNV9kZWZjb25m
aWcNCj4+PiAgICAgLSBhcm0tY2xhbmctMTItbHBjMzJ4eF9kZWZjb25maWcNCj4+Pg0KPj4+
DQo+Pj4gbWFrZSAtLXNpbGVudCAtLWtlZXAtZ29pbmcgLS1qb2JzPTggIEFSQ0g9YXJtDQo+
Pj4gQ1JPU1NfQ09NUElMRT1hcm0tbGludXgtZ251ZWFiaWhmLSAnQ0M9c2NjYWNoZQ0KPj4+
IGFybS1saW51eC1nbnVlYWJpaGYtZ2NjJyAnSE9TVENDPXNjY2FjaGUgZ2NjJyB2ZXhwcmVz
c19kZWZjb25maWcNCj4+PiBtYWtlIC0tc2lsZW50IC0ta2VlcC1nb2luZyAtLWpvYnM9OCAg
QVJDSD1hcm0NCj4+PiBDUk9TU19DT01QSUxFPWFybS1saW51eC1nbnVlYWJpaGYtICdDQz1z
Y2NhY2hlDQo+Pj4gYXJtLWxpbnV4LWdudWVhYmloZi1nY2MnICdIT1NUQ0M9c2NjYWNoZSBn
Y2MnDQo+Pj4gYXJtLWxpbnV4LWdudWVhYmloZi1sZDogZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWVkcC5vOiBpbiBmdW5jdGlvbg0KPj4+IGBwYW5lbF9lZHBfcHJvYmUnOg0KPj4+
IHBhbmVsLWVkcC5jOigudGV4dCsweGI3NCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRy
bV9wYW5lbF9kcF9hdXhfYmFja2xpZ2h0Jw0KPj4+IG1ha2VbMV06ICoqKiBbL2J1aWxkcy9s
aW51eC9NYWtlZmlsZToxMjIyOiB2bWxpbnV4XSBFcnJvciAxDQo+Pj4NCj4+Pg0KPj4+IFJl
cG9ydGVkLWJ5OiBMaW51eCBLZXJuZWwgRnVuY3Rpb25hbCBUZXN0aW5nIDxsa2Z0QGxpbmFy
by5vcmc+DQo+Pj4NCj4+PiBtZXRhIGRhdGE6DQo+Pj4gLS0tLS0tLS0tLS0NCj4+PiAgICAg
ICBnaXQgZGVzY3JpYmU6IG5leHQtMjAyMjAyMDINCj4+PiAgICAgICBnaXRfcmVwbzogaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51
eC1uZXh0LmdpdA0KPj4+ICAgICAgIHRhcmdldF9hcmNoOiBhcm0NCj4+PiAgICAgICBrY29u
ZmlnOiB2ZXhwcmVzc19kZWZjb25maWcNCj4+PiAgICAgICB0b29sY2hhaW46IGdjYy0xMQ0K
Pj4+DQo+Pj4gQnVpbGQgbG9nOg0KPj4+IC0tLS0tLS0tLS0tLS0NCj4+PiBodHRwczovL2J1
aWxkcy50dXhidWlsZC5jb20vMjRYUmltNzJ2RlhpeDZsNk1kQUpORU55NmplLw0KPj4+DQo+
Pj4gU3RlcHMgdG8gcmVwcm9kdWNlOg0KPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4g
IyBUbyBpbnN0YWxsIHR1eG1ha2Ugb24geW91ciBzeXN0ZW0gZ2xvYmFsbHk6DQo+Pj4gIyBz
dWRvIHBpcDMgaW5zdGFsbCAtVSB0dXhtYWtlDQo+Pj4gIw0KPj4+ICMgU2VlIGh0dHBzOi8v
ZG9jcy50dXhtYWtlLm9yZy8gZm9yIGNvbXBsZXRlIGRvY3VtZW50YXRpb24uDQo+Pj4gIyBP
cmlnaW5hbCB0dXhtYWtlIGNvbW1hbmQgd2l0aCBmcmFnbWVudHMgbGlzdGVkIGJlbG93Lg0K
Pj4+DQo+Pj4gdHV4bWFrZSAtLXJ1bnRpbWUgcG9kbWFuIC0tdGFyZ2V0LWFyY2ggYXJtIC0t
dG9vbGNoYWluIGdjYy0xMQ0KPj4+IC0ta2NvbmZpZyB2ZXhwcmVzc19kZWZjb25maWcNCj4+
Pg0KPj4+IHR1eG1ha2UgLS1ydW50aW1lIHBvZG1hbiAtLXRhcmdldC1hcmNoIGFybSAtLXRv
b2xjaGFpbiBnY2MtMTENCj4+PiAtLWtjb25maWcgaHR0cHM6Ly9idWlsZHMudHV4YnVpbGQu
Y29tLzI0WFJpbTcydkZYaXg2bDZNZEFKTkVOeTZqZS9jb25maWcNCj4+DQo+PiBZb3UnbGwg
bm93IG5lZWQNCj4+DQo+PiAgICAgQ09ORklHX0RSTV9EUF9IRUxQRVI9eQ0KPj4NCj4+IGlu
IHlvdXIgY29uZmlnLg0KPj4NCj4gDQo+IFRoYXQgc2hvdWxkIG5ldmVyIGJlIHRoZSBzb2x1
dGlvbiBmb3IgbGlua2VyIGVycm9ycyBzdWNoIGFzIHRoaXMgb25lLg0KPiANCj4gSWYgQ09O
RklHX0RSTV9QQU5FTF9FRFAgcmVsaWVzIG9uIHNvbWV0aGluZyBwcm92aWRlZCBieQ0KPiBD
T05GSUdfRFJNX0RQX0hFTFBFUiwgaXQgc2hvdWxkIHNlbGVjdCBpdCBvciBkZXBlbmQgb24g
aXQgaW4gS2NvbmZpZy4NCg0KT2YgY291cnNlLCB3ZSdsbCBwcm92aWRlIGEgcGF0Y2ggZm9y
IHRoZSBLY29uZmlnIGZpbGVzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------L3fX3bWa0slbEyrcIytD0sy2--

--------------09SMQnBOqe6XcqkDFM74kwlP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH6XCsFAwAAAAAACgkQlh/E3EQov+Cb
zxAAsHI8kD0VNgbrk53q4cUbmeMpCf1RfYYxmu+1fVDZrUZAdibe5zbmqg9M2npozE4Sf2v2ZiA0
tHNrtPOhaoSiPc6r8Ycu0LKpVIDXkwE1f4PnZCHth1wA7PfZ49cH5x5/pUwAjoLLzIDTZEhfFy/x
JaF1/mfFImh1ArS1XopBUxtlKnN8c3AG0fWQan1x4KkLatuPEoTt43hkrgWMdgcqa8D0UUGi06Mm
Hu9Vkf2XqQW5kPMa0oGpPkPzSQiah/rsHl+IyvzY4iMGJ54dizI3LBWYD0zCRjDr9N7oWm+XCys0
NltgnER7XzsclZCfPfEza3NVjJXTs/thMIyuz+I/T4xUQjElK/qqXw96UhF0l90ZJIpo4tCmd+lT
/tTvJUTzpRxkdYdlDIGih4bVpE3c+WzYn91GVAZEtjrtRed1xii2Cwa7CbsHqYgPeaFKNef6ZYH7
HU0c5VTDsjPGgdVQE4su4tuGRKWskvJSe+fXsWPB0Q17Z8a/k/KMelTQYFptG5Nmsb1O16PEYHw2
EEwZCIyQfDk8LZsXeEF+twzpAluT5P6HfWQwrDVTO8kL2ITF6mIIZ4SqTqX+CLAEiv1Sm4oTM6gN
j2BHtjngJ67zeSGdCGeq2GJi6dJMap+BNqdmpRiOPAdwtlv0DQCaGygTTurwg1hJIZhl3z+SXU1o
M0k=
=xpIB
-----END PGP SIGNATURE-----

--------------09SMQnBOqe6XcqkDFM74kwlP--
