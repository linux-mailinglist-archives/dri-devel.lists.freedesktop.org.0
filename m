Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC5849F8C8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 12:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D67110E30D;
	Fri, 28 Jan 2022 11:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71F110E30D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:53:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 950FE218A4;
 Fri, 28 Jan 2022 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643370820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lJN/BjgxzEHXEyjvuGIcnvodlG1cFc4iBoapw2HNCEE=;
 b=vU6v0aDSsIi1j6PuAbUbI6ytXl7uPBJZ1r/9roaJGLKgfS3Ywutnx9YMeEXmIacjnWvdV4
 IqbovMasB+GeKCI8wmE2ghkWQZG7ckQxFiycKw2gp6faQOvgAA/Gwz0gRHMsn8xKr3UJ/F
 /+Tv8TH6DvF0+4UApN521FpKtsPDDsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643370820;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lJN/BjgxzEHXEyjvuGIcnvodlG1cFc4iBoapw2HNCEE=;
 b=iXiQfA+JiBGOyJTXHSCf47z6f13VNVjQki6jHf+s7u7oxv9YZaONBDIEWlK5s/oyANTh7t
 KLeNlPY18g8qRSBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7102213AAE;
 Fri, 28 Jan 2022 11:53:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rpRzGkTZ82EISQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jan 2022 11:53:40 +0000
Message-ID: <3188b8b8-3090-1b58-3dc2-3e13c0a1998f@suse.de>
Date: Fri, 28 Jan 2022 12:53:39 +0100
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
 <1b1a5dc1-e3cd-c7ce-426b-cc330ae3ed81@suse.de>
 <YfPVVtWoW23xiP/g@pendragon.ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YfPVVtWoW23xiP/g@pendragon.ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OG4mR2AYVtskohp4M0AaCl4s"
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
--------------OG4mR2AYVtskohp4M0AaCl4s
Content-Type: multipart/mixed; boundary="------------CDZrs1uBqDtY18fkvb1ddrKm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <3188b8b8-3090-1b58-3dc2-3e13c0a1998f@suse.de>
Subject: Re: [PATCH v2 31/37] drm: rcar-du: Add support for the nomodeset
 kernel parameter
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-32-javierm@redhat.com>
 <164336121612.533872.1685181669511488706@Monstersaurus>
 <eb27fa44-2972-4a6e-465f-b9e4775820f4@suse.de>
 <YfPGnfly3GOAOlfp@pendragon.ideasonboard.com>
 <584f1343-b285-bf8e-e48c-764c2a56bce3@suse.de>
 <YfPN0fLfvWFC6mha@pendragon.ideasonboard.com>
 <1b1a5dc1-e3cd-c7ce-426b-cc330ae3ed81@suse.de>
 <YfPVVtWoW23xiP/g@pendragon.ideasonboard.com>
In-Reply-To: <YfPVVtWoW23xiP/g@pendragon.ideasonboard.com>

--------------CDZrs1uBqDtY18fkvb1ddrKm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDEuMjIgdW0gMTI6MzYgc2NocmllYiBMYXVyZW50IFBpbmNoYXJ0Og0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBGcmksIEphbiAyOCwgMjAyMiBhdCAxMjoyNjowM1BN
ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEFtIDI4LjAxLjIyIHVtIDEy
OjA0IHNjaHJpZWIgTGF1cmVudCBQaW5jaGFydDoNCj4+PiBPbiBGcmksIEphbiAyOCwgMjAy
MiBhdCAxMTo0Njo0OUFNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4g
QW0gMjguMDEuMjIgdW0gMTE6MzQgc2NocmllYiBMYXVyZW50IFBpbmNoYXJ0Og0KPj4+Pj4g
T24gRnJpLCBKYW4gMjgsIDIwMjIgYXQgMTA6MzM6MjFBTSArMDEwMCwgVGhvbWFzIFppbW1l
cm1hbm4gd3JvdGU6DQo+Pj4+Pj4gQW0gMjguMDEuMjIgdW0gMTA6MTMgc2NocmllYiBLaWVy
YW4gQmluZ2hhbToNCj4+Pj4+Pj4gUXVvdGluZyBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMg
KDIwMjEtMTItMTcgMDA6Mzc6NDYpDQo+Pj4+Pj4+PiBBY2NvcmRpbmcgdG8gZGlzYWJsZSBE
b2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCwgdGhpcw0K
Pj4+Pj4+Pj4gcGFyYW1ldGVyIGNhbiBiZSB1c2VkIHRvIGRpc2FibGUga2VybmVsIG1vZGVz
ZXR0aW5nLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IERSTSBkcml2ZXJzIHdpbGwgbm90IHBlcmZv
cm0gZGlzcGxheS1tb2RlIGNoYW5nZXMgb3IgYWNjZWxlcmF0ZWQgcmVuZGVyaW5nDQo+Pj4+
Pj4+PiBhbmQgb25seSB0aGUgc3lzdGVtIGZyYW1lYnVmZmVyIHdpbGwgYmUgYXZhaWxhYmxl
IGlmIGl0IHdhcyBzZXQtdXAuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFdoYXQgaXMgdGhlICdzeXN0
ZW0gZnJhbWVidWZmZXInIGluIHRoaXMgaW5zdGFuY2U/IFJlYWRpbmcNCj4+Pj4+Pj4gaHR0
cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJu
ZWwtcGFyYW1ldGVycy50eHQNCj4+Pj4+Pj4gaXQgc291bmRzIGxpa2UgdGhhdCBtZWFucyBh
bnl0aGluZyBhbHJlYWR5IHNldCB1cCBieSB0aGUgYm9vdGxvYWRlci4NCj4+Pj4+Pg0KPj4+
Pj4+IEV4YWN0bHkgdGhpcy4NCj4+Pj4+Pg0KPj4+Pj4+Pj4gQnV0IG9ubHkgYSBmZXcgRFJN
IGRyaXZlcnMgY3VycmVudGx5IGNoZWNrIGZvciBub21vZGVzZXQsIG1ha2UgdGhpcyBkcml2
ZXINCj4+Pj4+Pj4+IHRvIGFsc28gc3VwcG9ydCB0aGUgY29tbWFuZCBsaW5lIHBhcmFtZXRl
ci4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4N
Cj4+Pj4+Pj4+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQ0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+ICAg
ICAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyB8IDMgKysrDQo+Pj4+
Pj4+PiAgICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4+Pj4+Pj4+DQo+
Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMNCj4+Pj4+Pj4+
IGluZGV4IDVhODEzMWVmODFkNS4uOTgyZTQ1MDIzM2VkIDEwMDY0NA0KPj4+Pj4+Pj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYw0KPj4+Pj4+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYw0KPj4+Pj4+Pj4gQEAg
LTcwMSw2ICs3MDEsOSBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciByY2FyX2R1
X3BsYXRmb3JtX2RyaXZlciA9IHsNCj4+Pj4+Pj4+ICAgICAgDQo+Pj4+Pj4+PiAgICAgIHN0
YXRpYyBpbnQgX19pbml0IHJjYXJfZHVfaW5pdCh2b2lkKQ0KPj4+Pj4+Pj4gICAgICB7DQo+
Pj4+Pj4+PiArICAgICAgIGlmIChkcm1fZmlybXdhcmVfZHJpdmVyc19vbmx5KCkpDQo+Pj4+
Pj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+Pj4+Pj4+PiArDQo+Pj4+
Pj4+DQo+Pj4+Pj4+IFRoaXMgd2lsbCBjb21wbGV0ZWx5IGRpc2FibGUgYWxsIGNvbnRyb2wg
b2YgdGhlIGRpc3BsYXkgZGV2aWNlIHdoZW4NCj4+Pj4+Pj4gbm9tb2Rlc2V0IGlzIGVuYWJs
ZWQuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IElzIHRoZXJlIGFueSByZXF1aXJlbWVudCBmb3IgdXMg
dG8gc3VwcG9ydCBvdXRwdXR0aW5nIHRvIHRoZSBkaXNwbGF5IGlmDQo+Pj4+Pj4+IGl0IHdh
cyBwcmV2aW91c2x5IHNldCB1cD8gcHJlc3VtYWJseSB3aXRob3V0IHNldHRpbmcgb3IgY2hh
bmdpbmcgYW55DQo+Pj4+Pj4+IG1vZGVzLCBidXQgc2ltcGx5IGFsbG93aW5nIHRoZSBleGlz
dGluZyBmcmFtZSB0byBiZSB1cGRhdGVkPw0KPj4+Pj4+DQo+Pj4+Pj4gVGhlcmUncyBubyBy
ZXF1aXJlbWVudCBmb3IgeW91ciBkcml2ZXIuIFdlIGp1c3Qgd2FudCBhIHBhcmFtZXRlciB3
aGVyZQ0KPj4+Pj4+IHdlIGNhbiBjb252ZW5pZW50bHkgZGlzYWJsZSBtb3N0IG9mIERSTSdz
IGRyaXZlcnMgYW5kIHJlZHVjZSBpdCB0byBhDQo+Pj4+Pj4gbWluaW11bS4gSGVscHMgZGlz
dHJpYnV0aW9ucyB0byBwcm92aWRlIGEgc2ltcGxlIGZhbGxiYWNrIG1vZGUuICBNb3N0DQo+
Pj4+Pj4gUENJLWJhc2VkIGRyaXZlcnMgYWxyZWFkeSBzdXBwb3J0IHRoYXQuIE5vdyB3ZSdy
ZSBhZGRlZCBpdCB0byB0aGUgb3RoZXINCj4+Pj4+PiBkcml2ZXJzIGFzIHdlbGwuDQo+Pj4+
Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSSB0aGluayB0aGUgaW1wbGljYXRpb24gaXMgdGhhdCAn
ZmlybXdhcmUgZHJpdmVycycgd291bGQgbWVhbiBhIGRpc3BsYXkNCj4+Pj4+Pj4gY291bGQg
YmUgdXBkYXRlZCB0aHJvdWdoIHNvbWUgZmlybXdhcmUgaW50ZXJmYWNlLCB3aGljaCB3ZSB3
b24ndCBoYXZlDQo+Pj4+Pj4+IC4uLiBzbyBpdCBzZWVtcyByZWFzb25hYmxlIHRvIGFjY2Vw
dCB0aGF0IHRoaXMgd2hvbGUgZHJpdmVyIGNhbiBiZQ0KPj4+Pj4+PiBkaXNhYmxlZCBpbiB0
aGF0IGluc3RhbmNlLg0KPj4+Pj4+DQo+Pj4+Pj4gSXQgY2Fubm90IGJlICdtb2RlLXNldHRl
ZCcuIFdlIGdldCBhIHByZS1jb25maWd1cmVkIGZyYW1lYnVmZmVyIGZyb20gdGhlDQo+Pj4+
Pj4gZmlybXdhcmUgb3IgYm9vdGxvYWRlci4gV2hhdGV2ZXIgd2UgZHJhdyB0aGVyZSBzaG93
cyB1cCBvbiB0aGUgc2NyZWVuLg0KPj4+Pj4NCj4+Pj4+IEkgZG91YnQgdGhhdCdzIGdvaW5n
IHRvIHdvcmsgYXMgeW91IGV4cGVjdCwgY2xvY2tzIGFuZCByZWd1bGF0b3JzIHdpbGwNCj4+
Pj4+IGdldCBkaXNhYmxlZCBhdCBib290IGlmIG5vdCB1c2VkIGJ5IGFueSBkcml2ZXIuDQo+
Pj4+DQo+Pj4+IFNpbXBsZWRybSBhbmQgc2ltcGxlZmIgYXR0YWNoIHRvIHRoZXNlIGZpcm13
YXJlIGZyYW1lYnVmZmVycy4gQm90aA0KPj4+PiBkcml2ZXJzIGxvb2sgYXQgdGhlIGRldmlj
ZSB0cmVlIG5vZGVzIHRvIGFjcXVpcmUgdGhlIHJlbGV2YW50IGNsb2NrcyBhbmQNCj4+Pj4g
cmVndWxhdG9ycy4NCj4+Pg0KPj4+IEhvdyBhYm91dCBjbG9ja3MgYW5kIHJlZ3VsYXRvcnMg
Zm9yIHRoZSBhbmNpbGxhcnkgZGV2aWNlcywgc3VjaCBhcw0KPj4+IGVuY29kZXJzLCBvciBp
biB0aGUgUi1DYXIgY2FzZSwgdGhlIGV4dGVybmFsIGNvbXBvc2VyIGhhbmRsZWQgYnkgdGhl
DQo+Pj4gdnNwMSBkcml2ZXIgKGluIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdnNwMSkgPw0K
Pj4+DQo+Pj4gVGhpcyBhcHByb2FjaCBtYXkgd29yayBmaW5lIG9uIHg4NiBkZXNrdG9wIHN5
c3RlbXMsIGJ1dCBmb3IgQVJNLWJhc2VkDQo+Pj4gZGV2aWNlcywgdGhlIHNpdHVhdGlvbiBp
cyB1c3VhbGx5IG1vcmUgY29tcGxleC4NCj4+DQo+PiBXZWxsLCBpbiB0aGF0IGNhc2UgdGhl
IHByb2JsZW0gaGFzIGFsd2F5cyBiZWVuIHRoZXJlLiBXZSBkb24ndCBtYWtlIGl0DQo+PiB3
b3JzZS4NCj4gDQo+IFdoYXQncyB0aGUgcG9pbnQgb2YgYWRkaW5nIG5vbW9kZXNldCBzdXBw
b3J0IGluIHRob3NlIGRyaXZlcnMgdGhlbiwgaWYNCj4gaXQncyBrbm93biBub3QgdG8gd29y
ayA/DQoNCkJ1dCBub21vZGVzZXQgaXMga25vdyB0byB3b3JrOiBpdCBkaXNhYmxlcyB0aGUg
ZHJpdmVyLiBUaGUgYmVoYXZpb3IgaXMgDQpjb25zaXN0ZW50IGFtb25nIGFsbCBoYXJkd2Fy
ZS1zcGVjaWZpYyBkcml2ZXJzLg0KDQpKYXZpZXIgbWVudGlvbmVkIHRoYXQgdGhlcmUgYXJl
IGtlcm5lbCBwYXJhbWV0ZXJzIHRvIGtlZXAgdW51c2VkIA0KY2xvY2tzL3JlZ3VsYXRvcnMg
d29ya2luZy4NCg0KIEZyb20gdGhlIGRpc3RyaWJ1dGlvbiBQT1YsIGlmIHdlIGhhdmUgdXNl
cnMgd2l0aCBicm9rZW4gZ3JhcGhpY3MgDQpkcml2ZXJzIHdlIHdhbnQgdG8gZ2l2ZSB0aGVt
IGFuIGVhc3kgd29ya2Fyb3VuZCB1bnRpbCB3ZSBmaW5kIGEgDQpzb2x1dGlvbi4gUGFzc2lu
ZyAnbm9tb2Rlc2V0IC4uLicgb24gdGhlIGNvbW1hbmQgbGluZSBnaXZlcyB1cyB0aGF0Lg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4+Pj4+PiBSZWFkaW5nIHlvdXIgbWFp
bCB0aGF0IGJyb3VnaHQgdGhpcyB0aHJlYWQgdXAgaW4gbXkgaW5ib3gsIEkgdGhpbmsNCj4+
Pj4+Pj4geW91J3ZlIGFscmVhZHkgaGl0IG1lcmdlIG9uIHRoaXMsIHNvIGRvbid0IHdvcnJ5
IGFib3V0IGFkZGluZyBhIHRhZyBpbg0KPj4+Pj4+PiB0aGF0IGluc3RhbmNlLCBidXQgSSB0
aGluayB0aGlzIGlzIG9rLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBSZXZpZXdlZC1ieTogS2llcmFu
IEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4+
Pj4+Pj4NCj4+Pj4+Pj4+ICAgICAgICAgICAgIHJjYXJfZHVfb2ZfaW5pdChyY2FyX2R1X29m
X3RhYmxlKTsNCj4+Pj4+Pj4+ICAgICAgDQo+Pj4+Pj4+PiAgICAgICAgICAgICByZXR1cm4g
cGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZyY2FyX2R1X3BsYXRmb3JtX2RyaXZlcik7DQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------CDZrs1uBqDtY18fkvb1ddrKm--

--------------OG4mR2AYVtskohp4M0AaCl4s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHz2UMFAwAAAAAACgkQlh/E3EQov+DB
AQ/+L0KXvXkM6YJn5Q58x1v5JpKgFTQZiPOzVoMfOKTHuEMxPJ7ZgkD//HI/awg2nfkOMPiTdZpn
HA4RxL3Yqn8KqUMfFkLAtV1lqvwfn/7gKSQDdLTMfS26Lg+OOc6nl5JPMuma60ac9B/X8lyoZGys
f7k49ztQoL3PWFEgIuKYwRpxlt4Pe2ONkZvbXKxmlHlXEGMP8C9nEF/qujlh5XjNASNo2jsPuZux
9oFwtwaipQZ7LKar5feX+XZgkqovfNJAshSms5XoFHEqBnU9q00X3jARi1C48xW5mMRGtpbJP5cT
39EvsqSKiRi8YVpbOXZPU/EQ5o9X0ke8StqYWLsCReaWKcgAKlF9d4YaG3/hSEqShnVtvppzgKdV
Gss341BTdrSW9Jl4sf8n5VB22LxVKnjRynKkftbCEEHBwylskR0V3hS1a5TmA1iIW4tvyw+CLynM
VygKdNtexDy3o27ItgGn8u7zFXsOtxQQOx9X/dqA6+dvELwURMvgx5ZiwZcUzEFIKXfpZDjJw+3r
dPgGUV5IuKcIYeTuU+eyMtWeU8SyubX4cXMj+kgLdp55FauPVRQRPASMh8KUSAC+X3SijCPcTmrN
HCrIS4YKefQgRFTnqLtTIKvcgbdloH7QZv4htOGEsOyfPA55yShtMTu6TMuzj3qNRvbclgJnpXC0
F4s=
=cCKn
-----END PGP SIGNATURE-----

--------------OG4mR2AYVtskohp4M0AaCl4s--
