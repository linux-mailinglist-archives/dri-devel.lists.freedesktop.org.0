Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069E7936C9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 10:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E8810E59C;
	Wed,  6 Sep 2023 08:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA7A10E048;
 Wed,  6 Sep 2023 08:05:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5911E20293;
 Wed,  6 Sep 2023 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693987528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CcwODln3o4la+rHiAOpHXOfrXDxitvAUTztRYWDCaiA=;
 b=QLyIFuooyZRQv707DV1+AYpBRNB8v/8s08zraYj+4kV+u0S0/7cAQFWEwfq7jntIfa5tje
 mN9mZh20bn1nk1o9qrv+G6k8s/ih5Ge0x66JrUeekUlH2AiAhLojF5cbQMleJqfBDYQR8Q
 n8X6CfzPUxOEVZY/8vBc17+L78z/Zeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693987528;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CcwODln3o4la+rHiAOpHXOfrXDxitvAUTztRYWDCaiA=;
 b=de6/lG1QSnHh/BHTQt2yz/d+XPe3mNlPf2tOG8XzUmpbv7ll/UQTv9pr1sCoPSJNjJc+/f
 rq2w7/xS+t1DtuAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 201FB1346C;
 Wed,  6 Sep 2023 08:05:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zvHjBsgy+GQMWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Sep 2023 08:05:28 +0000
Message-ID: <6035cf27-1506-dda7-e1ca-d83ce5cb5340@suse.de>
Date: Wed, 6 Sep 2023 10:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <151c0429-dbc2-e987-1491-6c733ca159ac@suse.de>
 <3eced3f5-622f-31a6-f8a0-ff0812be74ff@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3eced3f5-622f-31a6-f8a0-ff0812be74ff@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lKTOIyUfA0iBzjg2GZcTUWnZ"
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lKTOIyUfA0iBzjg2GZcTUWnZ
Content-Type: multipart/mixed; boundary="------------avNKCI03awAQ0iYpEzeAEUPr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Message-ID: <6035cf27-1506-dda7-e1ca-d83ce5cb5340@suse.de>
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <151c0429-dbc2-e987-1491-6c733ca159ac@suse.de>
 <3eced3f5-622f-31a6-f8a0-ff0812be74ff@loongson.cn>
In-Reply-To: <3eced3f5-622f-31a6-f8a0-ff0812be74ff@loongson.cn>

--------------avNKCI03awAQ0iYpEzeAEUPr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDkuMjMgdW0gMTc6NTkgc2NocmllYiBzdWlqaW5nZmVuZzoNClsuLi5d
DQo+PiBGWUk6IHBlci1kcml2ZXIgbW9kZXNldCBwYXJhbWV0ZXJzIGFyZSBkZXByZWNhdGVk
IGFuZCBub3QgdG8gYmUgdXNlZC4gDQo+PiBQbGVhc2UgZG9uJ3QgcHJvbW90ZSB0aGVtLg0K
PiANCj4gDQo+IFdlbGwsIHBsZWFzZSB3YWl0LCBJIHdhbnQgdG8gZXhwbGFpbi4NCj4gDQo+
IA0KPiANCj4gZHJtL25vdXZlYXUgYWxyZWFkeSBwcm9tb3RlIGl0IGEgbGl0dGxlIGJpdC4N
Cj4gDQo+IERlc3BpdGUgbm8gY29kZSBvZiBjb25kdWN0IG9yIHNwZWNpZmljYXRpb24gZ3Vp
ZGluZyBob3cgdGhlIG1vZHVsZXMgDQo+IHBhcmFtZXRlcnMgc2hvdWxkIGJlLg0KPiBOb3Rp
Y2VkIHRoYXQgdGhlcmUgYWxyZWFkeSBoYXZlIGEgbG90IG9mIERSTSBkcml2ZXJzIHN1cHBv
cnQgdGhlIG1vZGVzZXQgDQo+IHBhcmFtZXRlcnMsDQoNClBsZWFzZSBsb29rIGF0IHRoZSBo
aXN0b3J5IGFuZCBkaXNjdXNzaW9uIGFyb3VuZCB0aGlzIHBhcmFtZXRlci4gVG8gbXkgDQpr
bm93bGVkZ2UsICdtb2Rlc2V0JyBnb3QgaW50cm9kdWNlZCB3aGVuIG1vZGVzZXR0aW5nIHdp
dGggc3RpbGwgZG9uZSBpbiANCnVzZXJzcGFjZS4gSXQgd2FzIGFuIGVhc3kgd2F5IG9mIGRp
c2FibGluZyB0aGUga2VybmVsIGRyaXZlciBpZiB0aGUgDQpzeXN0ZW0ncyBYb3JnIGRpZCBu
byB5ZXQgc3VwcG9ydCBrZXJuZWwgbW9kZSBzZXR0aW5nLg0KDQpGYXN0IGZvcndhcmQgYSBm
ZXcgeWVhcnMgYW5kIGFsbCBMaW51eCcgdXNlIGtlcm5lbCBtb2Rlc2V0dGluZywgd2hpY2gg
DQptYWtlIHRoZSBtb2Rlc2V0IHBhcmFtZXRlcnMgb2Jzb2xldGUuIFdlIGRpc2N1c3NlZCBh
bmQgZGVjaWRlZCB0byBrZWVwIA0KdGhlbSBpbiwgYmVjYXVzZSBtYW55IGFydGljbGVzIGFu
ZCBibG9nIHBvc3RzIHJlZmVyIHRvIHRoZW0uIFdlIGRpZG4ndCANCndhbnQgdG8gaW52YWxp
ZGF0ZSB0aGVtLiBCVVQgbW9kZXNldCBpcyBkZXByZWNhdGVkIGFuZCBub3QgYWxsb3dlZCBp
biANCm5ldyBjb2RlLiBJZiB5b3UgbG9vayBhdCBleGlzdGluZyBtb2Rlc2V0IHVzYWdlLCB5
b3Ugd2lsbCBldmVudHVhbGx5IA0KY29tZSBhY3Jvc3MgdGhlIGNvbW1lbnQgYXQgWzFdLg0K
DQpUaGVyZSdzICdub21vZGVzZXQnLCB3aGljaCBkaXNhYmxlcyBhbGwgbmF0aXZlIGRyaXZl
cnMuIEl0J3MgdXNlZnVsIGZvciANCmRlYnVnZ2luZyBvciBhcyBhIHF1aWNrLWZpeCBpZiB0
aGUgZ3JhcGhpY3MgZHJpdmVyIGJyZWFrcy4gSWYgeW91IHdhbnQgDQp0byBkaXNhYmxlIGEg
c3BlY2lmaWMgZHJpdmVyLCBwbGVhc2UgdXNlIG9uZSBvZiB0aGUgb3B0aW9ucyBmb3IgDQpi
bGFja2xpc3RpbmcuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjUvc291cmNlL2luY2x1ZGUvZHJtL2RybV9t
b2R1bGUuaCNMODMNCg0KDQo+IGZvciB0aGUgbW9kZXNldCBwYXJhbWV0ZXIsIGF1dGhvcnMg
b2YgdmFyaW91cyBkZXZpY2UgZHJpdmVyIHRyeSB0byBtYWtlIA0KPiB0aGUgdXNhZ2Ugbm90
DQo+IGNvbmZsaWN0IHdpdGggb3RoZXJzLiBJIGJlbGlldmUgdGhhdCB0aGlzIGlzIGdvb2Qg
dGhpbmcgZm9yIExpbnV4IHVzZXJzLg0KPiBJdCBpcyBwcm9iYWJseSB0aGUgcmVzcG9uc2li
aWxpdHkgb2YgdGhlIGRybSBjb3JlIG1haW50YWluZXJzIHRvIGZvcmNlIA0KPiB2YXJpb3Vz
IGRybQ0KPiBkcml2ZXJzIHRvIHJlYWNoIGEgbWluaW1hbCBjb25zZW5zdXMuIFByb2JhYmx5
IGl0IHBhaW5zIHRvIGRvIHNvIGFuZCANCj4gZG9lc24ndCBwYXkgb2ZmLg0KPiBCdXQgcmVh
Y2ggYSBtaW5pbWFsIGNvbnNlbnN1cyBkbyBiZW5lZml0IHRvIExpbnV4IHVzZXJzLg0KPiAN
Cj4gDQo+PiBZb3UgY2FuIHVzZSBtb2Rwcm9iZS5ibGFja2xpc3Qgb3IgaW5pdGNhbGxfYmxh
Y2tsaXN0IG9uIHRoZSBrZXJuZWwgDQo+PiBjb21tYW5kIGxpbmUuDQo+Pg0KPiBUaGVyZSBh
cmUgc29tZSBjYXNlcyB3aGVyZSB0aGUgbW9kcHJvYmUuYmxhY2tsaXN0IGRvZXNuJ3Qgd29y
a3MsDQo+IEkgaGF2ZSBjb21lIGNyb3NzIHNldmVyYWwgdGltZSBkdXJpbmcgdGhlIHBhc3Qu
DQo+IEJlY2F1c2UgdGhlIGRldmljZSBzZWxlY3RlZCBieSB0aGUgVkdBQVJCIGlzIGRldmlj
ZS1sZXZlbCB0aGluZywNCj4gaXQgaXMgbm90IHRoZSBkcml2ZXIncyBwcm9ibGVtLg0KPiAN
Cj4gU29tZXRpbWVzIHdoZW4gVkdBQVJCIGhhcyBhIGJ1ZywgaXQgd2lsbCBzZWxlY3QgYSB3
cm9uZyBkZXZpY2UgYXMgcHJpbWFyeS4NCj4gQW5kIHRoZSBYIHNlcnZlciB3aWxsIHVzZSB0
aGlzIHdyb25nIGRldmljZSBhcyBwcmltYXJ5IGFuZCBjb21wbGV0ZWx5IGNyYXNoDQo+IHRo
ZXJlLCBkdWUgdG8gbGFjayBhIGRyaXZlci4gVGFrZSBteSBvbGQgUzMgR3JhcGhpY3MgYXMg
YW4gZXhhbXBsZToNCj4gDQo+ICQgbHNwY2kgfCBncmVwIFZHQQ0KPiANCj4gIMKgMDA6MDYu
MSBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVyOiBMb29uZ3NvbiBUZWNobm9sb2d5IExMQyBE
QyAoRGlzcGxheSANCj4gQ29udHJvbGxlcikgKHJldiAwMSkNCj4gIMKgMDM6MDAuMCBWR0Eg
Y29tcGF0aWJsZSBjb250cm9sbGVyOiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIA0K
PiBbQU1EL0FUSV0gQ2FpY29zIFhUIFtSYWRlb24gSEQgNzQ3MC84NDcwIC8gUjUgMjM1LzMx
MCBPRU1dDQo+ICDCoDA3OjAwLjAgVkdBIGNvbXBhdGlibGUgY29udHJvbGxlcjogUzMgR3Jh
cGhpY3MgTHRkLiBEZXZpY2UgOTA3MCAocmV2IDAxKQ0KPiAgwqAwODowMC4wIFZHQSBjb21w
YXRpYmxlIGNvbnRyb2xsZXI6IFMzIEdyYXBoaWNzIEx0ZC4gRGV2aWNlIDkwNzAgKHJldiAw
MSkNCj4gDQo+IEJlZm9yZSBhcHBseSB0aGlzIHBhdGNoOg0KPiANCj4gW8KgwqDCoCAwLjM2
MTc0OF0gcGNpIDAwMDA6MDA6MDYuMTogdmdhYXJiOiBzZXR0aW5nIGFzIGJvb3QgVkdBIGRl
dmljZQ0KPiBbwqDCoMKgIDAuMzYxNzUzXSBwY2kgMDAwMDowMDowNi4xOiB2Z2FhcmI6IFZH
QSBkZXZpY2UgYWRkZWQ6IA0KPiBkZWNvZGVzPWlvK21lbSxvd25zPWlvK21lbSxsb2Nrcz1u
b25lDQo+IFvCoMKgwqAgMC4zNjE3NjVdIHBjaSAwMDAwOjAzOjAwLjA6IHZnYWFyYjogVkdB
IGRldmljZSBhZGRlZDogDQo+IGRlY29kZXM9aW8rbWVtLG93bnM9bm9uZSxsb2Nrcz1ub25l
DQo+IFvCoMKgwqAgMC4zNjE3NzNdIHBjaSAwMDAwOjA3OjAwLjA6IHZnYWFyYjogVkdBIGRl
dmljZSBhZGRlZDogDQo+IGRlY29kZXM9aW8rbWVtLG93bnM9bm9uZSxsb2Nrcz1ub25lDQo+
IFvCoMKgwqAgMC4zNjE3NzldIHBjaSAwMDAwOjA4OjAwLjA6IHZnYWFyYjogVkdBIGRldmlj
ZSBhZGRlZDogDQo+IGRlY29kZXM9aW8rbWVtLG93bnM9bm9uZSxsb2Nrcz1ub25lDQo+IFvC
oMKgwqAgMC4zNjE3ODFdIHZnYWFyYjogbG9hZGVkDQo+IFvCoMKgwqAgMC4zNjc4MzhdIHBj
aSAwMDAwOjAwOjA2LjE6IE92ZXJyaWRpbmcgYm9vdCBkZXZpY2UgYXMgMTAwMjo2Nzc4DQo+
IFvCoMKgwqAgMC4zNjc4NDFdIHBjaSAwMDAwOjAwOjA2LjE6IE92ZXJyaWRpbmcgYm9vdCBk
ZXZpY2UgYXMgNTMzMzo5MDcwDQo+IFvCoMKgwqAgMC4zNjc4NDNdIHBjaSAwMDAwOjAwOjA2
LjE6IE92ZXJyaWRpbmcgYm9vdCBkZXZpY2UgYXMgNTMzMzo5MDcwDQo+IA0KPiANCj4gRm9y
IGtub3duIHJlYXNvbiwgb25lIG9mIG15IHN5c3RlbSBzZWxlY3QgdGhlIFMzIEdyYXBoaWNz
IGFzIHByaW1hcnkgR1BVLg0KPiBCdXQgdGhpcyBTMyBHcmFwaGljcyBub3QgZXZlbiBoYXZl
IGEgZGVjZW50IGRybSB1cHN0cmVhbSBkcml2ZXIgeWV0Lg0KPiBVbmRlciBzdWNoIGEgY2Fz
ZSwgSSBiZWdpbiB0byBiZWxpZXZlIHRoYXQgb25seSB0aGUgZGV2aWNlIHdobyBoYXMgYQ0K
PiBkcml2ZXIgZGVzZXJ2ZSB0aGUgcHJpbWFyeS4NCj4gDQo+IFVuZGVyIHN1Y2ggYSBjb25k
aXRpb24sIEkgd2FudCB0byByZWJvb3QgYW5kIGVudGVyIHRoZSBncmFwaGljIGVudmlyb25t
ZW50DQo+IHdpdGggb3RoZXIgd29ya2luZyB2aWRlbyBjYXJkcy4gRWl0aGVyIHBsYXRmb3Jt
IGludGVncmF0ZWQgYW5kIGRpc2NyZXRlIA0KPiBHUFUuDQo+IFRoaXMgZG9uJ3QgbWVhbnMg
SSBzaG91bGQgY29tcHJvbWlzZSBiecKgdW4tbW91bnQgdGhlIFMzIGdyYXBoaWNzIGNhcmQg
ZnJvbQ0KPiB0aGUgbW90aGVyYm9hcmQsIHRoaXMgYWxzbyBkb24ndCBtZWFucyB0aGF0IEkg
c2hvdWxkIHVwZGF0ZSBteSBCSU9TIA0KPiBzZXR0aW5nLg0KPiBBcyBzb21ldGltZXMsIHRo
ZSBCSU9TIGlzIG1vcmUgd29yc2UuDQo+IA0KPiBXaXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQs
IGFsbCBJIG5lZWQgdG8gZG8gaXMgdG8gcmVib290IHRoZSBjb21wdXRlciBhbmQNCj4gcGFz
cyBhIGNvbW1hbmQgbGluZS4gQnkgZm9yY2Ugb3ZlcnJpZGUgYW5vdGhlciB2aWRlbyBjYXJk
ICh3aG8gaGFzIGENCj4gZGVjZW50IGRyaXZlciBzdXBwb3J0KSBhcyBwcmltYXJ5LCBJJ20g
YWJsZSB0byBkbyB0aGUgZGVidWdnaW5nIHVuZGVyDQo+IGdyYXBoaWMgZW52aXJvbm1lbnQu
IEkgd291bGQgbGlrZSB0byBleGFtaW5lIHdoYXQncyB3cm9uZyB3aXRoIHRoZSB2Z2FhcmIN
Cj4gb24gYSBzcGVjaWZpYyBwbGF0Zm9ybSB1bmRlciBYIHNlcnZlciBncmFwaGljIGVudmly
b25tZW50Lg0KPiANCj4gUHJvYmFibHkgdHJ5IGNvbXBpbGUgYSBkcml2ZXIgZm9yIHRoaXMg
Y2FyZCBhbmQgc2VlIGl0IHdvcmtzLCBzaW1wbHkgcmVib290DQo+IHdpdGhvdXQgdGhlIG5l
ZWQgdG8gY2hhbmdlIGFueXRoaW5nLiBJdCBpcyBzbyBlZmZpY2llbnQuIFNvIHRoaXMgaXMg
DQo+IHByb2JhYmx5DQo+IHRoZSBzZWNvbmQgdXNhZ2Ugb2YgbXkgcGF0Y2guIEl0IGhhbmQg
dGhlIHJpZ2h0IG9mIGNvbnRyb2wgYmFjayB0byB0aGUNCj4gZ3JhcGhpYyBkZXZlbG9wZXIu
DQo+IA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------avNKCI03awAQ0iYpEzeAEUPr--

--------------lKTOIyUfA0iBzjg2GZcTUWnZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT4MscFAwAAAAAACgkQlh/E3EQov+Bs
VBAAh5MUF0ed1AUa1qADP07XsW7xCoTPXjQKApc2S3fMednRIAWU2nHXco7ivhaW1vFzP+ns70wq
ElN9hyp+JfhI2SYM5yPqWUsK7MbsdpHMPCvEG9o4bIfoVzMSz4DAfzt58xQgQijlOOglz95taL0z
YG3hx3x25SlLARweAtBzpsKkgXMBeuiehdTGvURHv7IrncTP/wv55DS227jRp2maQ2tgp+K88mKf
MFZqH9hkVkoooco7gZ4txiz+lvVDY7O+VBpuukiJ+30Wjw+kK7GRTmXcL9UxWUNxELd6XNgXJCRk
rOrqnQwfA4QqsTtC85VH/OfqIuPstW0ydYShnvTbmspaaj1ItueOf4I0FvDgc9LfId0DXC92kbxc
bedh9woDR0/9EvEFnmvctPW28v4WX1FaQNFudK/CWelUxcyr/qzKWlznBeD3a417pffDULjnepMy
CEyPITp8El0oejBMTvWSwNbvEZnRiaQAtHj0LcsJac1V8r/DT5paXn4NI36wSbVcJcIvsg+LWBGQ
ztVwKBS2FI5FWilTMCl13R7M+enulTezxkQSq1i2uS8wHKwKj45bdh1r6vsq6SjJ06eA17N3dZxP
yDI8X6LAcVt2V4COV2DJAKCpRriVaCCL0c+dO4lFRCF4GZDo8EAoeRHys5p1FBKSDAkzAfpzWkcb
DCA=
=TU97
-----END PGP SIGNATURE-----

--------------lKTOIyUfA0iBzjg2GZcTUWnZ--
