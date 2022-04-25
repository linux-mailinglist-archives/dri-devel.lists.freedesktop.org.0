Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E28C750DC2B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 11:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB1A10E06F;
	Mon, 25 Apr 2022 09:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E146110E06F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 09:15:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 81E2B1F37D;
 Mon, 25 Apr 2022 09:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650878152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=elvIwh1nMRMtMHgi8khOz2+RsSH3xG8wlVAUS6sSVbk=;
 b=B2EFWMk6AlvuLDrwwssHKxgrQLUW1zNwSzWHcM+5VbBWJ3ckrVlCRbSeVp3rLLoxfQPVz8
 2221qHVoFsLNtXilBMib9SeEN8r/cWN0oaTgh5jYFyof57VOQ9UOgfawGLofxDUFXzHVnS
 PwxY0uxAo8y++vXouHr++quXU015K+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650878152;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=elvIwh1nMRMtMHgi8khOz2+RsSH3xG8wlVAUS6sSVbk=;
 b=dh7Lq3c57G8edUgmixcvIl1iZs/gphND/rORxDvVoMZ9X/7hWjqwnUZyv7jkhvgSngojGV
 GsN78ZScgjB7BtDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D82813AE1;
 Mon, 25 Apr 2022 09:15:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AoAkBshmZmI2FAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Apr 2022 09:15:52 +0000
Message-ID: <093d742f-4c87-2ff3-e9fe-153cd734f8e4@suse.de>
Date: Mon, 25 Apr 2022 11:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 0/5] Fix some race conditions that exists between fbmem
 and sysfb
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220420085303.100654-1-javierm@redhat.com>
 <535ebbe4-605c-daf5-1afb-f5225e4bb3a8@suse.de>
In-Reply-To: <535ebbe4-605c-daf5-1afb-f5225e4bb3a8@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XP5yxFndbfzLlxZ1uUgkF01U"
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>, linux-doc@vger.kernel.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 Johan Hovold <johan@kernel.org>, Yizhuo Zhai <yzhai003@ucr.edu>,
 Hans de Goede <hdegoede@redhat.com>, linux-fbdev@vger.kernel.org,
 Peter Jones <pjones@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Borislav Petkov <bp@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XP5yxFndbfzLlxZ1uUgkF01U
Content-Type: multipart/mixed; boundary="------------w5dytzMYVA7FGnVCrG07Bsh6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Borislav Petkov <bp@suse.de>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Daniel Vetter
 <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Miaoqian Lin <linmq006@gmail.com>,
 Peter Jones <pjones@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Yizhuo Zhai <yzhai003@ucr.edu>, Zhen Lei <thunder.leizhen@huawei.com>,
 linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org
Message-ID: <093d742f-4c87-2ff3-e9fe-153cd734f8e4@suse.de>
Subject: Re: [PATCH v3 0/5] Fix some race conditions that exists between fbmem
 and sysfb
References: <20220420085303.100654-1-javierm@redhat.com>
 <535ebbe4-605c-daf5-1afb-f5225e4bb3a8@suse.de>
In-Reply-To: <535ebbe4-605c-daf5-1afb-f5225e4bb3a8@suse.de>

--------------w5dytzMYVA7FGnVCrG07Bsh6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDQuMjIgdW0gMTA6NTQgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGkNCj4gDQo+IEFtIDIwLjA0LjIyIHVtIDEwOjUyIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPj4gSGVsbG8sDQo+Pg0KPj4gVGhlIHBhdGNoZXMgaW4gdGhpcyBz
ZXJpZXMgYXJlIG1vc3RseSBjaGFuZ2VzIHN1Z2dlc3RlZCBieSBEYW5pZWwgVmV0dGVyDQo+
PiB0byBmaXggc29tZSByYWNlIGNvbmRpdGlvbnMgdGhhdCBleGlzdHMgYmV0d2VlbiB0aGUg
ZmJkZXYgY29yZSAoZmJtZW0pDQo+PiBhbmQgc3lzZmIgd2l0aCByZWdhcmQgdG8gZGV2aWNl
IHJlZ2lzdHJhdGlvbiBhbmQgcmVtb3ZhbC4NCj4+DQo+PiBGb3IgZXhhbXBsZSwgaXQgaXMg
Y3VycmVudGx5IHBvc3NpYmxlIGZvciBzeXNmYiB0byByZWdpc3RlciBhIHBsYXRmb3JtDQo+
PiBkZXZpY2UgYWZ0ZXIgYSByZWFsIERSTSBkcml2ZXIgd2FzIHJlZ2lzdGVyZWQgYW5kIHJl
cXVlc3RlZCB0byByZW1vdmUgdGhlDQo+PiBjb25mbGljdGluZyBmcmFtZWJ1ZmZlcnMuDQo+
Pg0KPj4gQSBzeW1wdG9tIG9mIHRoaXMgaXNzdWUsIHdhcyB3b3JrZWQgYXJvdW5kIHdpdGgg
YnkgY29tbWl0IGZiNTYxYmY5YWJkZQ0KPj4gKCJmYmRldjogUHJldmVudCBwcm9iaW5nIGdl
bmVyaWMgZHJpdmVycyBpZiBhIEZCIGlzIGFscmVhZHkgcmVnaXN0ZXJlZCIpDQo+PiBidXQg
dGhhdCdzIHJlYWxseSBhIGhhY2sgYW5kIHNob3VsZCBiZSByZXZlcnRlZC4NCj4gDQo+IEFz
IEkgbWVudGlvbmVkIG9uIElSQywgSSB0aGluayB0aGlzIHNlcmllcyBzaG91bGQgYmUgbWVy
Z2VkIGZvciB0aGUgDQo+IHJlYXNvbnMgSSBnaXZlIGluIHRoZSBvdGhlciBjb21tZW50cy4N
Cj4gDQo+Pg0KPj4gVGhpcyBzZXJpZXMgYXR0ZW1wdCB0byBmaXggaXQgbW9yZSBwcm9wZXJs
eSBhbmQgcmV2ZXJ0IHRoZSBtZW50aW9uZWQgDQo+PiBoYWNrLg0KPj4gVGhhdCB3aWxsIGFs
c28gdW5ibG9jayBhIHBlbmRpbmcgcGF0Y2ggdG8gbm90IG1ha2UgdGhlIG51bV9yZWdpc3Rl
cmVkX2ZiDQo+PiB2YXJpYWJsZSB2aXNpYmxlIHRvIGRyaXZlcnMgYW55bW9yZSwgc2luY2Ug
dGhhdCdzIGludGVybmFsIHRvIGZiZGV2IGNvcmUuDQo+IA0KPiBIZXJlJ3MgYXMgZmFyIGFz
IEkgdW5kZXJzdGFuZCB0aGUgcHJvYmxlbToNCj4gDQo+ICDCoDEpIGJ1aWxkIERSTS9mYmRl
diBhbmQgc3lzZmIgY29kZSBpbnRvIHRoZSBrZXJuZWwNCj4gIMKgMikgZHVyaW5nIGJvb3Qs
IGxvYWQgdGhlIERSTS9mYmRldiBtb2R1bGVzIGFuZCBoYXZlIHRoZW0gYWNxdWlyZSBJL08g
DQo+IHJhbmdlcw0KPiAgwqAzKSBhZnRlcndhcmRzIGxvYWQgc3lzZmIgYW5kIGhhdmUgaXQg
cmVnaXN0ZXIgcGxhdGZvcm0gZGV2aWNlcyBmb3IgdGhlIA0KPiBnZW5lcmljIGZyYW1lYnVm
ZmVycw0KPiAgwqA0KSB0aGVzZSBkZXZpY2VzIG5vdyBjb25mbGljdCB3aXRoIHRoZSBhbHJl
YWR5LXJlZ2lzdGVyZWQgRFJNL2ZiZGV2IA0KPiBkZXZpY2VzDQo+IA0KPiBJZiB0aGF0IGlz
IHRoZSBwcm9ibGVtIGhlcmUsIGxldCdzIHNpbXBseSBzZXQgYSBzeXNmYl9kaXNhYmxlIGZs
YWcgaW4gDQo+IHN5c2ZiIGNvZGUgd2hlbiB0aGUgZmlyc3QgRFJNL2ZiZGV2IGRyaXZlciBm
aXJzdCBsb2Fkcy4gV2l0aCB0aGUgZmxhZyANCj4gc2V0LCBzeXNmYiB3b24ndCBjcmVhdGUg
YW55IHBsYXRmb3JtIGRldmljZXMuIFdlIGFzc3VtZSB0aGF0IHRoZXJlIGFyZSANCj4gbm93
IERSTS9mYmRldiBkcml2ZXJzIGZvciB0aGUgZnJhbWVidWZmZXJzIGFuZCBzeXNmYiB3b24n
dCBiZSBuZWVkZWQuDQo+IA0KPiBXZSBjYW4gc2V0IHRoZSBmbGFnIGludGVybmFsbHkgZnJv
bSBkcm1fYXBlcnR1cmVfZGV0YWNoX2RyaXZlcnMoKSBbMV0gDQo+IGFuZCBkb19yZW1vdmVf
Y29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKCkgWzJdLg0KDQpBbmQgZnVydGhlciB0aGlua2lu
ZyBhYm91dCBpdCwgaXQgd291bGQgYmUgYmV0dGVyIHRvIHNldCBzdWNoIGEgZmxhZyANCmFm
dGVyIHN1Y2Nlc3NmdWxseSByZWdpc3RlcmluZyBhIERSTS9mYmRldiBkZXZpY2UuICBTbyB3
ZSBrbm93IHRoYXQgDQp0aGVyZSdzIGF0IGxlYXN0IG9uZSB3b3JraW5nIGRpc3BsYXkgaW4g
dGhlIHN5c3RlbS4gV2UgZG9uJ3QgaGF2ZSB0byANCnJlbHkgb24gZ2VuZXJpYyBmcmFtZWJ1
ZmZlcnMgYWZ0ZXIgdGhhdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQmVz
dCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4gWzFdIA0KPiBodHRwczovL2VsaXhpci5ib290
bGluLmNvbS9saW51eC92NS4xNy40L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2FwZXJ0
dXJlLmMjTDI1MyANCj4gDQo+IFsyXSANCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjUuMTcuNC9zb3VyY2UvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMj
TDE1NTkgDQo+IA0KPiANCj4+DQo+PiBQYXRjaCAjMSBpcyBqdXN0IGEgdHJpdmlhbCBwcmVw
YXJhdG9yeSBjaGFuZ2UuDQo+Pg0KPj4gUGF0Y2ggIzIgYWRkIHN5c2ZiX2Rpc2FibGUoKSBh
bmQgc3lzZmJfdHJ5X3VucmVnaXN0ZXIoKSBoZWxwZXJzIGZvciBmYm1lbQ0KPj4gdG8gdXNl
IHRoZW0uDQo+Pg0KPj4gUGF0Y2ggIzMgY2hhbmdlcyBob3cgaXMgZGVhbHQgd2l0aCBjb25m
bGljdGluZyBmcmFtZWJ1ZmZlcnMgDQo+PiB1bnJlZ2lzdGVyaW5nLA0KPj4gcmF0aGVyIHRo
YW4gaGF2aW5nIGEgdmFyaWFibGUgdG8gZGV0ZXJtaW5lIGlmIGEgbG9jayBzaG91bGQgYmUg
dGFrZSwgaXQNCj4+IGp1c3QgZHJvcHMgdGhlIGxvY2sgYmVmb3JlIHVucmVnaXN0ZXJpbmcg
dGhlIHBsYXRmb3JtIGRldmljZS4NCj4+DQo+PiBQYXRjaCAjNCBmaXhlcyB0aGUgbWVudGlv
bmVkIHJhY2UgY29uZGl0aW9ucyBhbmQgZmluYWxseSBwYXRjaCAjNSBpcyB0aGUNCj4+IHJl
dmVydCBwYXRjaCB0aGF0IHdhcyBwb3N0ZWQgYnkgRGFuaWVsIGJlZm9yZSBidXQgaGUgZHJv
cHBlZCBmcm9tIGhpcyANCj4+IHNldC4NCj4+DQo+PiBUaGUgcGF0Y2hlcyB3ZXJlIHRlc3Rl
ZCBvbiBhIHJwaTQgdXNpbmcgZGlmZmVyZW50IHZpZGVvIGNvbmZpZ3VyYXRpb25zOg0KPj4g
KHNpbXBsZWRybSAtPiB2YzQgYm90aCBidWlsdGluLCBvbmx5IHZjNCBidWlsdGluLCBvbmx5
IHNpbXBsZWRybSBidWlsdGluDQo+PiBhbmQgc2ltcGxlZHJtIGJ1aWx0aW4gd2l0aCB2YzQg
YnVpbHQgYXMgYSBtb2R1bGUpLg0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+IEphdmllcg0K
Pj4NCj4+IENoYW5nZXMgaW4gdjM6DQo+PiAtIFJlYmFzZSBvbiB0b3Agb2YgbGF0ZXN0IGRy
bS1taXNjLW5leHQgYnJhbmNoLg0KPj4NCj4+IENoYW5nZXMgaW4gdjI6DQo+PiAtIFJlYmFz
ZSBvbiB0b3Agb2YgbGF0ZXN0IGRybS1taXNjLW5leHQgYW5kIGZpeCBjb25mbGljdHMgKERh
bmllbCANCj4+IFZldHRlcikuDQo+PiAtIEFkZCBrZXJuZWwtZG9jIGNvbW1lbnRzIGFuZCBp
bmNsdWRlIGluIG90aGVyX2ludGVyZmFjZXMucnN0IChEYW5pZWwgDQo+PiBWZXR0ZXIpLg0K
Pj4gLSBFeHBsYWluIGluIHRoZSBjb21taXQgbWVzc2FnZSB0aGF0IGZibWVtIGhhcyB0byB1
bnJlZ2lzdGVyIHRoZSBkZXZpY2UNCj4+IMKgwqAgYXMgZmFsbGJhY2sgaWYgYSBkcml2ZXIg
cmVnaXN0ZXJlZCB0aGUgZGV2aWNlIGl0c2VsZiAoRGFuaWVsIFZldHRlcikuDQo+PiAtIEFs
c28gZXhwbGFpbiB0aGF0IGZhbGxiYWNrIGluIGEgY29tbWVudCBpbiB0aGUgY29kZSAoRGFu
aWVsIFZldHRlcikuDQo+PiAtIERvbid0IGVuY29kZSBpbiBmYm1lbSB0aGUgYXNzdW1wdGlv
biB0aGF0IHN5c2ZiIHdpbGwgYWx3YXlzIHJlZ2lzdGVyDQo+PiDCoMKgIHBsYXRmb3JtIGRl
dmljZXMgKERhbmllbCBWZXR0ZXIpLg0KPj4gLSBBZGQgYSBGSVhNRSBjb21tZW50IGFib3V0
IGRyaXZlcnMgcmVnaXN0ZXJpbmcgZGV2aWNlcyAoRGFuaWVsIFZldHRlcikuDQo+PiAtIERy
b3AgUkZDIHByZWZpeCBzaW5jZSBwYXRjaGVzIHdlcmUgYWxyZWFkeSByZXZpZXdlZCBieSBE
YW5pZWwgVmV0dGVyLg0KPj4gLSBBZGQgRGFuaWVsIFJldmlld2VkLWJ5IHRhZ3MgdG8gdGhl
IHBhdGNoZXMuDQo+Pg0KPj4gRGFuaWVsIFZldHRlciAoMSk6DQo+PiDCoMKgIFJldmVydCAi
ZmJkZXY6IFByZXZlbnQgcHJvYmluZyBnZW5lcmljIGRyaXZlcnMgaWYgYSBGQiBpcyBhbHJl
YWR5DQo+PiDCoMKgwqDCoCByZWdpc3RlcmVkIg0KPj4NCj4+IEphdmllciBNYXJ0aW5leiBD
YW5pbGxhcyAoNCk6DQo+PiDCoMKgIGZpcm13YXJlOiBzeXNmYjogTWFrZSBzeXNmYl9jcmVh
dGVfc2ltcGxlZmIoKSByZXR1cm4gYSBwZGV2IHBvaW50ZXINCj4+IMKgwqAgZmlybXdhcmU6
IHN5c2ZiOiBBZGQgaGVscGVycyB0byB1bnJlZ2lzdGVyIGEgcGRldiBhbmQgZGlzYWJsZQ0K
Pj4gwqDCoMKgwqAgcmVnaXN0cmF0aW9uDQo+PiDCoMKgIGZiZGV2OiBSZXN0YXJ0IGNvbmZs
aWN0aW5nIGZiIHJlbW92YWwgbG9vcCB3aGVuIHVucmVnaXN0ZXJpbmcgZGV2aWNlcw0KPj4g
wqDCoCBmYmRldjogRml4IHNvbWUgcmFjZSBjb25kaXRpb25zIGJldHdlZW4gZmJtZW0gYW5k
IHN5c2ZiDQo+Pg0KPj4gwqAgLi4uL2RyaXZlci1hcGkvZmlybXdhcmUvb3RoZXJfaW50ZXJm
YWNlcy5yc3TCoCB8wqAgNiArKw0KPj4gwqAgZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNzcgKysrKysrKysr
KysrKysrKystLQ0KPj4gwqAgZHJpdmVycy9maXJtd2FyZS9zeXNmYl9zaW1wbGVmYi5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTYgKystLQ0KPj4gwqAgZHJpdmVycy92aWRlby9m
YmRldi9jb3JlL2ZibWVtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDYyICsrKysr
KysrKysrKy0tLQ0KPj4gwqAgZHJpdmVycy92aWRlby9mYmRldi9lZmlmYi5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTEgLS0tDQo+PiDCoCBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3NpbXBsZWZiLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAx
MSAtLS0NCj4+IMKgIGluY2x1ZGUvbGludXgvZmIuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAtDQo+PiDCoCBpbmNsdWRl
L2xpbnV4L3N5c2ZiLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAyOSArKysrKy0tDQo+PiDCoCA4IGZpbGVzIGNoYW5nZWQsIDE1OCBpbnNl
cnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkNCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------w5dytzMYVA7FGnVCrG07Bsh6--

--------------XP5yxFndbfzLlxZ1uUgkF01U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJmZscFAwAAAAAACgkQlh/E3EQov+BV
CA//f9+eQpagC1n5jroJbHKHv2yHzBtLZHax9+HpqrGWsuKFJc04ukZoPBZy/+Nn+UuXxvrPxgLx
36pKdpqaOhHVqHSrAhlCr1uLqzlpO5vInFbMf6p2eoVvEZKuY3iTuU1vMwQ7qbHd46DHIfza+s3Z
1+W3D1ZKjAL/mGbMocSo9v8Bzo4743cgGtpU1rTs/SeNDb4axJoErNU5LptYkaRq/3eDDi5aO8OI
vErqgBd1FM3aOTRNLRmD0c+oeuUcTlsNXpSitLfeltkHSdbQZuQ2lX81KRekXM5CvHxHk+PSJg5W
vyA4cXKDtcuEYH72wVP+9Cq5fXpUHSc/pxzTCJbdUNdBG1HZ62r8G5grtX+XbG2cC/HGcx5Em2p7
3KP4ABOy3unymQW0KtnDc2DajP2vG4xBVPnLkQXlgGIyFjyM3FCotztmc2vtA2kEWND1CES3Avvv
PlMSxXHLkHTTT6gRVWX7NTc99kuVYNN8DL0tsznYXlMfrmRB+M9XY+AlhGK1ZroxxAkyLftc3mhw
g4CGnZDzL/05N6VIhI2ZPP9jmalfx9HDPK5PpmK8QtriHAPuV+FM2g5L9uzk5/u3G3QIEmXCmUpD
JPdVarpiY+IWGWXEZIjgFA3OpE/Jbeohu3t7nEcIagG4yaPloKAX20gw8ScM3ywI0MhTld+h6l5o
Jn8=
=uIdS
-----END PGP SIGNATURE-----

--------------XP5yxFndbfzLlxZ1uUgkF01U--
