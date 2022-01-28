Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1EF49F846
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 12:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F8010E6CB;
	Fri, 28 Jan 2022 11:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7DA10E740
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:26:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 59E4F212BB;
 Fri, 28 Jan 2022 11:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643369164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e2XrwtVAZ4BMQ/fgvib03bg0vWgnljkLMWfJLtOp+mE=;
 b=vogflrlJm0mEOw/Y5fUdHEaRcFqb0R0ms3PRTHv/GdsGZW5gWo1qm7qCW0CzswiFNF6IWe
 RR2wXkroaoMqhq9c66vrjjnvDUIWP/MIOqxAg7SBw/QOmC7c2LrYfI2Hxt3yp85FEOyWRr
 taSRPeTXJ0L0Z2C8eVykdeESQdsiwY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643369164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e2XrwtVAZ4BMQ/fgvib03bg0vWgnljkLMWfJLtOp+mE=;
 b=S37ciXYzxW4DqBvE3Mi4y+nJY++uJ+aiKLBWSTJEoxbycO3O8KeuSseXOVI43hNf7h9liE
 WdRXK9TgswfO6fDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 391F113A9C;
 Fri, 28 Jan 2022 11:26:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IDzpDMzS82HQOQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jan 2022 11:26:04 +0000
Message-ID: <1b1a5dc1-e3cd-c7ce-426b-cc330ae3ed81@suse.de>
Date: Fri, 28 Jan 2022 12:26:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 31/37] drm: rcar-du: Add support for the nomodeset
 kernel parameter
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-32-javierm@redhat.com>
 <164336121612.533872.1685181669511488706@Monstersaurus>
 <eb27fa44-2972-4a6e-465f-b9e4775820f4@suse.de>
 <YfPGnfly3GOAOlfp@pendragon.ideasonboard.com>
 <584f1343-b285-bf8e-e48c-764c2a56bce3@suse.de>
 <YfPN0fLfvWFC6mha@pendragon.ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YfPN0fLfvWFC6mha@pendragon.ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------seWwiieUwQvFujQVWw0s9Kac"
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------seWwiieUwQvFujQVWw0s9Kac
Content-Type: multipart/mixed; boundary="------------ezD48xp6htN6e3yV1fmhpDFf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <1b1a5dc1-e3cd-c7ce-426b-cc330ae3ed81@suse.de>
Subject: Re: [PATCH v2 31/37] drm: rcar-du: Add support for the nomodeset
 kernel parameter
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-32-javierm@redhat.com>
 <164336121612.533872.1685181669511488706@Monstersaurus>
 <eb27fa44-2972-4a6e-465f-b9e4775820f4@suse.de>
 <YfPGnfly3GOAOlfp@pendragon.ideasonboard.com>
 <584f1343-b285-bf8e-e48c-764c2a56bce3@suse.de>
 <YfPN0fLfvWFC6mha@pendragon.ideasonboard.com>
In-Reply-To: <YfPN0fLfvWFC6mha@pendragon.ideasonboard.com>

--------------ezD48xp6htN6e3yV1fmhpDFf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDEuMjIgdW0gMTI6MDQgc2NocmllYiBMYXVyZW50IFBpbmNoYXJ0Og0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBGcmksIEphbiAyOCwgMjAyMiBhdCAxMTo0Njo0OUFN
ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEFtIDI4LjAxLjIyIHVtIDEx
OjM0IHNjaHJpZWIgTGF1cmVudCBQaW5jaGFydDoNCj4+PiBPbiBGcmksIEphbiAyOCwgMjAy
MiBhdCAxMDozMzoyMUFNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4g
QW0gMjguMDEuMjIgdW0gMTA6MTMgc2NocmllYiBLaWVyYW4gQmluZ2hhbToNCj4+Pj4+IFF1
b3RpbmcgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzICgyMDIxLTEyLTE3IDAwOjM3OjQ2KQ0K
Pj4+Pj4+IEFjY29yZGluZyB0byBkaXNhYmxlIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
a2VybmVsLXBhcmFtZXRlcnMudHh0LCB0aGlzDQo+Pj4+Pj4gcGFyYW1ldGVyIGNhbiBiZSB1
c2VkIHRvIGRpc2FibGUga2VybmVsIG1vZGVzZXR0aW5nLg0KPj4+Pj4+DQo+Pj4+Pj4gRFJN
IGRyaXZlcnMgd2lsbCBub3QgcGVyZm9ybSBkaXNwbGF5LW1vZGUgY2hhbmdlcyBvciBhY2Nl
bGVyYXRlZCByZW5kZXJpbmcNCj4+Pj4+PiBhbmQgb25seSB0aGUgc3lzdGVtIGZyYW1lYnVm
ZmVyIHdpbGwgYmUgYXZhaWxhYmxlIGlmIGl0IHdhcyBzZXQtdXAuDQo+Pj4+Pg0KPj4+Pj4g
V2hhdCBpcyB0aGUgJ3N5c3RlbSBmcmFtZWJ1ZmZlcicgaW4gdGhpcyBpbnN0YW5jZT8gUmVh
ZGluZw0KPj4+Pj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQNCj4+Pj4+IGl0IHNvdW5kcyBsaWtl
IHRoYXQgbWVhbnMgYW55dGhpbmcgYWxyZWFkeSBzZXQgdXAgYnkgdGhlIGJvb3Rsb2FkZXIu
DQo+Pj4+DQo+Pj4+IEV4YWN0bHkgdGhpcy4NCj4+Pj4NCj4+Pj4+PiBCdXQgb25seSBhIGZl
dyBEUk0gZHJpdmVycyBjdXJyZW50bHkgY2hlY2sgZm9yIG5vbW9kZXNldCwgbWFrZSB0aGlz
IGRyaXZlcg0KPj4+Pj4+IHRvIGFsc28gc3VwcG9ydCB0aGUgY29tbWFuZCBsaW5lIHBhcmFt
ZXRlci4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBD
YW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4+Pj4+IC0tLQ0KPj4+Pj4+DQo+Pj4+
Pj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpDQo+Pj4+Pj4NCj4+Pj4+PiAgICAgZHJpdmVycy9n
cHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyB8IDMgKysrDQo+Pj4+Pj4gICAgIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYw0KPj4+Pj4+IGluZGV4IDVhODEzMWVmODFkNS4u
OTgyZTQ1MDIzM2VkIDEwMDY0NA0KPj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfZHVfZHJ2LmMNCj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2R1X2Rydi5jDQo+Pj4+Pj4gQEAgLTcwMSw2ICs3MDEsOSBAQCBzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciByY2FyX2R1X3BsYXRmb3JtX2RyaXZlciA9IHsNCj4+Pj4+
PiAgICAgDQo+Pj4+Pj4gICAgIHN0YXRpYyBpbnQgX19pbml0IHJjYXJfZHVfaW5pdCh2b2lk
KQ0KPj4+Pj4+ICAgICB7DQo+Pj4+Pj4gKyAgICAgICBpZiAoZHJtX2Zpcm13YXJlX2RyaXZl
cnNfb25seSgpKQ0KPj4+Pj4+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4+
Pj4+PiArDQo+Pj4+Pg0KPj4+Pj4gVGhpcyB3aWxsIGNvbXBsZXRlbHkgZGlzYWJsZSBhbGwg
Y29udHJvbCBvZiB0aGUgZGlzcGxheSBkZXZpY2Ugd2hlbg0KPj4+Pj4gbm9tb2Rlc2V0IGlz
IGVuYWJsZWQuDQo+Pj4+Pg0KPj4+Pj4gSXMgdGhlcmUgYW55IHJlcXVpcmVtZW50IGZvciB1
cyB0byBzdXBwb3J0IG91dHB1dHRpbmcgdG8gdGhlIGRpc3BsYXkgaWYNCj4+Pj4+IGl0IHdh
cyBwcmV2aW91c2x5IHNldCB1cD8gcHJlc3VtYWJseSB3aXRob3V0IHNldHRpbmcgb3IgY2hh
bmdpbmcgYW55DQo+Pj4+PiBtb2RlcywgYnV0IHNpbXBseSBhbGxvd2luZyB0aGUgZXhpc3Rp
bmcgZnJhbWUgdG8gYmUgdXBkYXRlZD8NCj4+Pj4NCj4+Pj4gVGhlcmUncyBubyByZXF1aXJl
bWVudCBmb3IgeW91ciBkcml2ZXIuIFdlIGp1c3Qgd2FudCBhIHBhcmFtZXRlciB3aGVyZQ0K
Pj4+PiB3ZSBjYW4gY29udmVuaWVudGx5IGRpc2FibGUgbW9zdCBvZiBEUk0ncyBkcml2ZXJz
IGFuZCByZWR1Y2UgaXQgdG8gYQ0KPj4+PiBtaW5pbXVtLiBIZWxwcyBkaXN0cmlidXRpb25z
IHRvIHByb3ZpZGUgYSBzaW1wbGUgZmFsbGJhY2sgbW9kZS4gIE1vc3QNCj4+Pj4gUENJLWJh
c2VkIGRyaXZlcnMgYWxyZWFkeSBzdXBwb3J0IHRoYXQuIE5vdyB3ZSdyZSBhZGRlZCBpdCB0
byB0aGUgb3RoZXINCj4+Pj4gZHJpdmVycyBhcyB3ZWxsLg0KPj4+Pg0KPj4+Pj4NCj4+Pj4+
IEkgdGhpbmsgdGhlIGltcGxpY2F0aW9uIGlzIHRoYXQgJ2Zpcm13YXJlIGRyaXZlcnMnIHdv
dWxkIG1lYW4gYSBkaXNwbGF5DQo+Pj4+PiBjb3VsZCBiZSB1cGRhdGVkIHRocm91Z2ggc29t
ZSBmaXJtd2FyZSBpbnRlcmZhY2UsIHdoaWNoIHdlIHdvbid0IGhhdmUNCj4+Pj4+IC4uLiBz
byBpdCBzZWVtcyByZWFzb25hYmxlIHRvIGFjY2VwdCB0aGF0IHRoaXMgd2hvbGUgZHJpdmVy
IGNhbiBiZQ0KPj4+Pj4gZGlzYWJsZWQgaW4gdGhhdCBpbnN0YW5jZS4NCj4+Pj4NCj4+Pj4g
SXQgY2Fubm90IGJlICdtb2RlLXNldHRlZCcuIFdlIGdldCBhIHByZS1jb25maWd1cmVkIGZy
YW1lYnVmZmVyIGZyb20gdGhlDQo+Pj4+IGZpcm13YXJlIG9yIGJvb3Rsb2FkZXIuIFdoYXRl
dmVyIHdlIGRyYXcgdGhlcmUgc2hvd3MgdXAgb24gdGhlIHNjcmVlbi4NCj4+Pg0KPj4+IEkg
ZG91YnQgdGhhdCdzIGdvaW5nIHRvIHdvcmsgYXMgeW91IGV4cGVjdCwgY2xvY2tzIGFuZCBy
ZWd1bGF0b3JzIHdpbGwNCj4+PiBnZXQgZGlzYWJsZWQgYXQgYm9vdCBpZiBub3QgdXNlZCBi
eSBhbnkgZHJpdmVyLg0KPj4NCj4+IFNpbXBsZWRybSBhbmQgc2ltcGxlZmIgYXR0YWNoIHRv
IHRoZXNlIGZpcm13YXJlIGZyYW1lYnVmZmVycy4gQm90aA0KPj4gZHJpdmVycyBsb29rIGF0
IHRoZSBkZXZpY2UgdHJlZSBub2RlcyB0byBhY3F1aXJlIHRoZSByZWxldmFudCBjbG9ja3Mg
YW5kDQo+PiByZWd1bGF0b3JzLg0KPiANCj4gSG93IGFib3V0IGNsb2NrcyBhbmQgcmVndWxh
dG9ycyBmb3IgdGhlIGFuY2lsbGFyeSBkZXZpY2VzLCBzdWNoIGFzDQo+IGVuY29kZXJzLCBv
ciBpbiB0aGUgUi1DYXIgY2FzZSwgdGhlIGV4dGVybmFsIGNvbXBvc2VyIGhhbmRsZWQgYnkg
dGhlDQo+IHZzcDEgZHJpdmVyIChpbiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZzcDEpID8N
Cj4gDQo+IFRoaXMgYXBwcm9hY2ggbWF5IHdvcmsgZmluZSBvbiB4ODYgZGVza3RvcCBzeXN0
ZW1zLCBidXQgZm9yIEFSTS1iYXNlZA0KPiBkZXZpY2VzLCB0aGUgc2l0dWF0aW9uIGlzIHVz
dWFsbHkgbW9yZSBjb21wbGV4Lg0KDQpXZWxsLCBpbiB0aGF0IGNhc2UgdGhlIHByb2JsZW0g
aGFzIGFsd2F5cyBiZWVuIHRoZXJlLiBXZSBkb24ndCBtYWtlIGl0IA0Kd29yc2UuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+Pj4+PiBSZWFkaW5nIHlvdXIgbWFpbCB0aGF0
IGJyb3VnaHQgdGhpcyB0aHJlYWQgdXAgaW4gbXkgaW5ib3gsIEkgdGhpbmsNCj4+Pj4+IHlv
dSd2ZSBhbHJlYWR5IGhpdCBtZXJnZSBvbiB0aGlzLCBzbyBkb24ndCB3b3JyeSBhYm91dCBh
ZGRpbmcgYSB0YWcgaW4NCj4+Pj4+IHRoYXQgaW5zdGFuY2UsIGJ1dCBJIHRoaW5rIHRoaXMg
aXMgb2suDQo+Pj4+Pg0KPj4+Pj4gUmV2aWV3ZWQtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVy
YW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+Pj4+Pg0KPj4+Pj4+ICAg
ICAgICAgICAgcmNhcl9kdV9vZl9pbml0KHJjYXJfZHVfb2ZfdGFibGUpOw0KPj4+Pj4+ICAg
ICANCj4+Pj4+PiAgICAgICAgICAgIHJldHVybiBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIo
JnJjYXJfZHVfcGxhdGZvcm1fZHJpdmVyKTsNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------ezD48xp6htN6e3yV1fmhpDFf--

--------------seWwiieUwQvFujQVWw0s9Kac
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHz0ssFAwAAAAAACgkQlh/E3EQov+BA
XxAAlmHdI9avxLHFOA2L9Wxka5xpSuM1KrgxyOeXz/BMlxLF+QKk2E13c8yVAViDzTO9OItr95HB
C/vdoGAOlmcFK5+jL3fYr9X6LMDHAp6C0E3YLgTWS2tAbXSb32NElCFidjJfxU+WritfGnys4brS
up7zujzFuG3r7/iCWwH0qPV44UkaVkQSIX+NnagKAi44mIDkYpmScagSL8XpWxLo/+jiULpnGO/h
uq1rTtG7Ms2ZwNW5AEWwXWOLEAG91Ps6U3xnpTOUpGxR0TxS1Xu7h1XUnLrM0x9W6vePgAW8TNhs
u6QSiZIp+jIAUNvCGZRHAkSvf5KgwDP3iBMd8XInfq4ManX34GqvFT8R5f8gfz2XwRsj3N+TXAXp
8C1QDEL9nc7IUitUwOXUE+z1Rb9mZYMPkcxgIW//B0w/N1PHSW/4lJcxNVh5s78dzCfmypxwf0jd
/2lbDDYipfxmkkX/EA+a2tPviAzYMkc9qL+qKJXVfkY7kONyljik7sFEziMbB/YY/h1h/Scfz6vW
XVbESMHmUN8/Lq0KrCxizzur+kRiwq+OC2CcdF4p15mfxGmeusUTeKJ4YveDTB6GEek8gvdGoFHw
AOcvWvCFTdCV/jEA8iW96nBDvzPqeHwmUDb/G982zQEED1Pz/VNmtutw8Vb0eaGeog9OWc0oi9/1
i1k=
=ytk7
-----END PGP SIGNATURE-----

--------------seWwiieUwQvFujQVWw0s9Kac--
