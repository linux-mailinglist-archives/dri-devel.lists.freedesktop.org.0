Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4075750DBBE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 10:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE0710E027;
	Mon, 25 Apr 2022 08:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B7C10E027
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 08:54:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DB8B0210E5;
 Mon, 25 Apr 2022 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650876870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4Xzadw6ONsr1NkImq8B2Up17ajpTuPobm04Tzf1iZA=;
 b=YQE9CVpbFF4r0bx3MZvQcS4ZpjgquD1pPUvXSL6DWlzal1kM/qbDrYQTWyxAS5L6JdD9fB
 O2VSsFSg6rDjowFIxeJnP1oxPByojOdW49J9LiKS/3VQpDX397wjFAnya8kGGuiEkwPXV/
 N9cqVjQvNVmqzztn1dIh8h5FH8vXK+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650876870;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4Xzadw6ONsr1NkImq8B2Up17ajpTuPobm04Tzf1iZA=;
 b=jeuSfuf6ULKMEKEfa1VADZfeNo51754Uw+Uceuer4lccqUOYn/YiZpCn7fbNnMdMVF8Shj
 ZiuWCpkiMaY1yjAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7359413AED;
 Mon, 25 Apr 2022 08:54:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GvLpGsZhZmKOCgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Apr 2022 08:54:30 +0000
Message-ID: <535ebbe4-605c-daf5-1afb-f5225e4bb3a8@suse.de>
Date: Mon, 25 Apr 2022 10:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 0/5] Fix some race conditions that exists between fbmem
 and sysfb
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220420085303.100654-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220420085303.100654-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Rc95TRwpQQWj5pxD9yvjBCU3"
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
--------------Rc95TRwpQQWj5pxD9yvjBCU3
Content-Type: multipart/mixed; boundary="------------ix4uCpa8tuHsKOBCkz4wJM0I";
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
Message-ID: <535ebbe4-605c-daf5-1afb-f5225e4bb3a8@suse.de>
Subject: Re: [PATCH v3 0/5] Fix some race conditions that exists between fbmem
 and sysfb
References: <20220420085303.100654-1-javierm@redhat.com>
In-Reply-To: <20220420085303.100654-1-javierm@redhat.com>

--------------ix4uCpa8tuHsKOBCkz4wJM0I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjIgdW0gMTA6NTIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvLA0KPiANCj4gVGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgYXJl
IG1vc3RseSBjaGFuZ2VzIHN1Z2dlc3RlZCBieSBEYW5pZWwgVmV0dGVyDQo+IHRvIGZpeCBz
b21lIHJhY2UgY29uZGl0aW9ucyB0aGF0IGV4aXN0cyBiZXR3ZWVuIHRoZSBmYmRldiBjb3Jl
IChmYm1lbSkNCj4gYW5kIHN5c2ZiIHdpdGggcmVnYXJkIHRvIGRldmljZSByZWdpc3RyYXRp
b24gYW5kIHJlbW92YWwuDQo+IA0KPiBGb3IgZXhhbXBsZSwgaXQgaXMgY3VycmVudGx5IHBv
c3NpYmxlIGZvciBzeXNmYiB0byByZWdpc3RlciBhIHBsYXRmb3JtDQo+IGRldmljZSBhZnRl
ciBhIHJlYWwgRFJNIGRyaXZlciB3YXMgcmVnaXN0ZXJlZCBhbmQgcmVxdWVzdGVkIHRvIHJl
bW92ZSB0aGUNCj4gY29uZmxpY3RpbmcgZnJhbWVidWZmZXJzLg0KPiANCj4gQSBzeW1wdG9t
IG9mIHRoaXMgaXNzdWUsIHdhcyB3b3JrZWQgYXJvdW5kIHdpdGggYnkgY29tbWl0IGZiNTYx
YmY5YWJkZQ0KPiAoImZiZGV2OiBQcmV2ZW50IHByb2JpbmcgZ2VuZXJpYyBkcml2ZXJzIGlm
IGEgRkIgaXMgYWxyZWFkeSByZWdpc3RlcmVkIikNCj4gYnV0IHRoYXQncyByZWFsbHkgYSBo
YWNrIGFuZCBzaG91bGQgYmUgcmV2ZXJ0ZWQuDQoNCkFzIEkgbWVudGlvbmVkIG9uIElSQywg
SSB0aGluayB0aGlzIHNlcmllcyBzaG91bGQgYmUgbWVyZ2VkIGZvciB0aGUgDQpyZWFzb25z
IEkgZ2l2ZSBpbiB0aGUgb3RoZXIgY29tbWVudHMuDQoNCj4gDQo+IFRoaXMgc2VyaWVzIGF0
dGVtcHQgdG8gZml4IGl0IG1vcmUgcHJvcGVybHkgYW5kIHJldmVydCB0aGUgbWVudGlvbmVk
IGhhY2suDQo+IFRoYXQgd2lsbCBhbHNvIHVuYmxvY2sgYSBwZW5kaW5nIHBhdGNoIHRvIG5v
dCBtYWtlIHRoZSBudW1fcmVnaXN0ZXJlZF9mYg0KPiB2YXJpYWJsZSB2aXNpYmxlIHRvIGRy
aXZlcnMgYW55bW9yZSwgc2luY2UgdGhhdCdzIGludGVybmFsIHRvIGZiZGV2IGNvcmUuDQoN
CkhlcmUncyBhcyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoZSBwcm9ibGVtOg0KDQogIDEpIGJ1
aWxkIERSTS9mYmRldiBhbmQgc3lzZmIgY29kZSBpbnRvIHRoZSBrZXJuZWwNCiAgMikgZHVy
aW5nIGJvb3QsIGxvYWQgdGhlIERSTS9mYmRldiBtb2R1bGVzIGFuZCBoYXZlIHRoZW0gYWNx
dWlyZSBJL08gDQpyYW5nZXMNCiAgMykgYWZ0ZXJ3YXJkcyBsb2FkIHN5c2ZiIGFuZCBoYXZl
IGl0IHJlZ2lzdGVyIHBsYXRmb3JtIGRldmljZXMgZm9yIHRoZSANCmdlbmVyaWMgZnJhbWVi
dWZmZXJzDQogIDQpIHRoZXNlIGRldmljZXMgbm93IGNvbmZsaWN0IHdpdGggdGhlIGFscmVh
ZHktcmVnaXN0ZXJlZCBEUk0vZmJkZXYgDQpkZXZpY2VzDQoNCklmIHRoYXQgaXMgdGhlIHBy
b2JsZW0gaGVyZSwgbGV0J3Mgc2ltcGx5IHNldCBhIHN5c2ZiX2Rpc2FibGUgZmxhZyBpbiAN
CnN5c2ZiIGNvZGUgd2hlbiB0aGUgZmlyc3QgRFJNL2ZiZGV2IGRyaXZlciBmaXJzdCBsb2Fk
cy4gV2l0aCB0aGUgZmxhZyANCnNldCwgc3lzZmIgd29uJ3QgY3JlYXRlIGFueSBwbGF0Zm9y
bSBkZXZpY2VzLiBXZSBhc3N1bWUgdGhhdCB0aGVyZSBhcmUgDQpub3cgRFJNL2ZiZGV2IGRy
aXZlcnMgZm9yIHRoZSBmcmFtZWJ1ZmZlcnMgYW5kIHN5c2ZiIHdvbid0IGJlIG5lZWRlZC4N
Cg0KV2UgY2FuIHNldCB0aGUgZmxhZyBpbnRlcm5hbGx5IGZyb20gZHJtX2FwZXJ0dXJlX2Rl
dGFjaF9kcml2ZXJzKCkgWzFdIA0KYW5kIGRvX3JlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1
ZmZlcnMoKSBbMl0uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE3LjQvc291cmNlL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fYXBlcnR1cmUuYyNMMjUzDQpbMl0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92NS4xNy40L3NvdXJjZS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0u
YyNMMTU1OQ0KDQo+IA0KPiBQYXRjaCAjMSBpcyBqdXN0IGEgdHJpdmlhbCBwcmVwYXJhdG9y
eSBjaGFuZ2UuDQo+IA0KPiBQYXRjaCAjMiBhZGQgc3lzZmJfZGlzYWJsZSgpIGFuZCBzeXNm
Yl90cnlfdW5yZWdpc3RlcigpIGhlbHBlcnMgZm9yIGZibWVtDQo+IHRvIHVzZSB0aGVtLg0K
PiANCj4gUGF0Y2ggIzMgY2hhbmdlcyBob3cgaXMgZGVhbHQgd2l0aCBjb25mbGljdGluZyBm
cmFtZWJ1ZmZlcnMgdW5yZWdpc3RlcmluZywNCj4gcmF0aGVyIHRoYW4gaGF2aW5nIGEgdmFy
aWFibGUgdG8gZGV0ZXJtaW5lIGlmIGEgbG9jayBzaG91bGQgYmUgdGFrZSwgaXQNCj4ganVz
dCBkcm9wcyB0aGUgbG9jayBiZWZvcmUgdW5yZWdpc3RlcmluZyB0aGUgcGxhdGZvcm0gZGV2
aWNlLg0KPiANCj4gUGF0Y2ggIzQgZml4ZXMgdGhlIG1lbnRpb25lZCByYWNlIGNvbmRpdGlv
bnMgYW5kIGZpbmFsbHkgcGF0Y2ggIzUgaXMgdGhlDQo+IHJldmVydCBwYXRjaCB0aGF0IHdh
cyBwb3N0ZWQgYnkgRGFuaWVsIGJlZm9yZSBidXQgaGUgZHJvcHBlZCBmcm9tIGhpcyBzZXQu
DQo+IA0KPiBUaGUgcGF0Y2hlcyB3ZXJlIHRlc3RlZCBvbiBhIHJwaTQgdXNpbmcgZGlmZmVy
ZW50IHZpZGVvIGNvbmZpZ3VyYXRpb25zOg0KPiAoc2ltcGxlZHJtIC0+IHZjNCBib3RoIGJ1
aWx0aW4sIG9ubHkgdmM0IGJ1aWx0aW4sIG9ubHkgc2ltcGxlZHJtIGJ1aWx0aW4NCj4gYW5k
IHNpbXBsZWRybSBidWlsdGluIHdpdGggdmM0IGJ1aWx0IGFzIGEgbW9kdWxlKS4NCj4gDQo+
IEJlc3QgcmVnYXJkcywNCj4gSmF2aWVyDQo+IA0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIFJl
YmFzZSBvbiB0b3Agb2YgbGF0ZXN0IGRybS1taXNjLW5leHQgYnJhbmNoLg0KPiANCj4gQ2hh
bmdlcyBpbiB2MjoNCj4gLSBSZWJhc2Ugb24gdG9wIG9mIGxhdGVzdCBkcm0tbWlzYy1uZXh0
IGFuZCBmaXggY29uZmxpY3RzIChEYW5pZWwgVmV0dGVyKS4NCj4gLSBBZGQga2VybmVsLWRv
YyBjb21tZW50cyBhbmQgaW5jbHVkZSBpbiBvdGhlcl9pbnRlcmZhY2VzLnJzdCAoRGFuaWVs
IFZldHRlcikuDQo+IC0gRXhwbGFpbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCBmYm1l
bSBoYXMgdG8gdW5yZWdpc3RlciB0aGUgZGV2aWNlDQo+ICAgIGFzIGZhbGxiYWNrIGlmIGEg
ZHJpdmVyIHJlZ2lzdGVyZWQgdGhlIGRldmljZSBpdHNlbGYgKERhbmllbCBWZXR0ZXIpLg0K
PiAtIEFsc28gZXhwbGFpbiB0aGF0IGZhbGxiYWNrIGluIGEgY29tbWVudCBpbiB0aGUgY29k
ZSAoRGFuaWVsIFZldHRlcikuDQo+IC0gRG9uJ3QgZW5jb2RlIGluIGZibWVtIHRoZSBhc3N1
bXB0aW9uIHRoYXQgc3lzZmIgd2lsbCBhbHdheXMgcmVnaXN0ZXINCj4gICAgcGxhdGZvcm0g
ZGV2aWNlcyAoRGFuaWVsIFZldHRlcikuDQo+IC0gQWRkIGEgRklYTUUgY29tbWVudCBhYm91
dCBkcml2ZXJzIHJlZ2lzdGVyaW5nIGRldmljZXMgKERhbmllbCBWZXR0ZXIpLg0KPiAtIERy
b3AgUkZDIHByZWZpeCBzaW5jZSBwYXRjaGVzIHdlcmUgYWxyZWFkeSByZXZpZXdlZCBieSBE
YW5pZWwgVmV0dGVyLg0KPiAtIEFkZCBEYW5pZWwgUmV2aWV3ZWQtYnkgdGFncyB0byB0aGUg
cGF0Y2hlcy4NCj4gDQo+IERhbmllbCBWZXR0ZXIgKDEpOg0KPiAgICBSZXZlcnQgImZiZGV2
OiBQcmV2ZW50IHByb2JpbmcgZ2VuZXJpYyBkcml2ZXJzIGlmIGEgRkIgaXMgYWxyZWFkeQ0K
PiAgICAgIHJlZ2lzdGVyZWQiDQo+IA0KPiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgKDQp
Og0KPiAgICBmaXJtd2FyZTogc3lzZmI6IE1ha2Ugc3lzZmJfY3JlYXRlX3NpbXBsZWZiKCkg
cmV0dXJuIGEgcGRldiBwb2ludGVyDQo+ICAgIGZpcm13YXJlOiBzeXNmYjogQWRkIGhlbHBl
cnMgdG8gdW5yZWdpc3RlciBhIHBkZXYgYW5kIGRpc2FibGUNCj4gICAgICByZWdpc3RyYXRp
b24NCj4gICAgZmJkZXY6IFJlc3RhcnQgY29uZmxpY3RpbmcgZmIgcmVtb3ZhbCBsb29wIHdo
ZW4gdW5yZWdpc3RlcmluZyBkZXZpY2VzDQo+ICAgIGZiZGV2OiBGaXggc29tZSByYWNlIGNv
bmRpdGlvbnMgYmV0d2VlbiBmYm1lbSBhbmQgc3lzZmINCj4gDQo+ICAgLi4uL2RyaXZlci1h
cGkvZmlybXdhcmUvb3RoZXJfaW50ZXJmYWNlcy5yc3QgIHwgIDYgKysNCj4gICBkcml2ZXJz
L2Zpcm13YXJlL3N5c2ZiLmMgICAgICAgICAgICAgICAgICAgICAgfCA3NyArKysrKysrKysr
KysrKysrKy0tDQo+ICAgZHJpdmVycy9maXJtd2FyZS9zeXNmYl9zaW1wbGVmYi5jICAgICAg
ICAgICAgIHwgMTYgKystLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5j
ICAgICAgICAgICAgICB8IDYyICsrKysrKysrKysrKy0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvZWZpZmIuYyAgICAgICAgICAgICAgICAgICB8IDExIC0tLQ0KPiAgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvc2ltcGxlZmIuYyAgICAgICAgICAgICAgICB8IDExIC0tLQ0KPiAgIGlu
Y2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0NCj4g
ICBpbmNsdWRlL2xpbnV4L3N5c2ZiLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAyOSAr
KysrKy0tDQo+ICAgOCBmaWxlcyBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9ucygrKSwgNTUgZGVs
ZXRpb25zKC0pDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------ix4uCpa8tuHsKOBCkz4wJM0I--

--------------Rc95TRwpQQWj5pxD9yvjBCU3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJmYcYFAwAAAAAACgkQlh/E3EQov+AP
fBAAwj+zxf+d/jGDZGUcK1nkudhe+CNq3bSDDOd4wp0JJ+VC3X4oX9Sp6a6zJOGpSsL1NInqSO/y
oikzH+INlFUFKbSMGvFBXLh09CjUSY5YIqLc6fx88tviFICU2FwmusbGEnT1U1xob/L4fW4SybED
tORN2VBYegPKrcPfs5L+Ph5PNDt6z8oOLKu83PvCtHyRbLnnb4PylOxgnGpXb8FmQzVwviRn9mtI
+yx4XnjaZ1jchYcT71XUHNmZx06BFSfXo05qqD56oD2GrD+6Css36Luxf/IKjTQVFCOU4qK9rjal
2Esr8Hq0EwmAgmquEWa7ENm3ahJcXr09L5gyjubJK39PP39V6p1ZbT6P75RQlabvSWPIvgqxlH9v
vEP5HVlcK+tcBcSkaws978Ea1kKbKqsgEsVuAa8vk5v/+Btu0x6qikjBraRPf86Ad8pZfV7aLIiL
5xXD7dytYOhmxwBpcJDY+ZnY3E1p54I8ve/RZzg0pFvgdFvcKGoM8G8bQeChbz5n9P91Hln+idSb
uVO7CixCMX4FQUgaagAFhlHTDHcnakmxIEeO60TzLbzeab2GCstgA8JfFErxsa6jvaKyGij0ZC2Q
la6VaO6pOutVhqSw9JOTk7jBvZFpktuPKpJ7LEaSUZoC1wiBR+yHLFciFTuakD74CM4qyWRPAbbQ
2rY=
=X50l
-----END PGP SIGNATURE-----

--------------Rc95TRwpQQWj5pxD9yvjBCU3--
