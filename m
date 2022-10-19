Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D3603AAD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 09:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB30B10F171;
	Wed, 19 Oct 2022 07:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D950210F171
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 07:32:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 693B0202EC;
 Wed, 19 Oct 2022 07:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666164747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ujGILK0LU87qk5VyOBRJ5O1N+0ivxDW5W7u0Dx48OE=;
 b=onMBsN1hh2pYROzbIWilPfCiwU3XAq1RUhhsgru82iSQQpVhLrdyrUAtqsstOixOciDMUO
 wmPNWu4DGQcE2MAZFqz5XgLLLkdS34PWcb+8sO/MwAmy1W2t+7yED2VAEBmWPWObnftDqF
 IFN4nE+VqQ9qScIAKCxP8ZSz0Wf5q0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666164747;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ujGILK0LU87qk5VyOBRJ5O1N+0ivxDW5W7u0Dx48OE=;
 b=tbS3H753OCLfFPh4Skp5DFKNBx6Amg8NhXqh4rAnyqrdTc1Yyg9E1LTCFCFn3yFHNFC7fy
 9mw2OWdlwgJyD2Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C461A13A36;
 Wed, 19 Oct 2022 07:32:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uXUBLwqoT2MAPQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Oct 2022 07:32:26 +0000
Message-ID: <f374944f-f374-d07c-2ac2-bb1e5598dea1@suse.de>
Date: Wed, 19 Oct 2022 09:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm: Remove drm_mode_config::fb_base
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20221018131754.351957-1-zack@kde.org>
 <27c535fe-6dfe-43a0-f915-324878798c36@suse.de>
 <f3241efec5b8f79a23e1780edca5ead841ad6532.camel@vmware.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <f3241efec5b8f79a23e1780edca5ead841ad6532.camel@vmware.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wSuC6whr8KiEBzLeLFwYpFxv"
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
Cc: "kherbst@redhat.com" <kherbst@redhat.com>,
 "xinliang.liu@linaro.org" <xinliang.liu@linaro.org>,
 "lijo.lazar@amd.com" <lijo.lazar@amd.com>,
 "mairacanal@riseup.net" <mairacanal@riseup.net>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "Jerry.Zuo@amd.com" <Jerry.Zuo@amd.com>,
 "flora.cui@amd.com" <flora.cui@amd.com>, "etom@igel.co.jp" <etom@igel.co.jp>,
 "evan.quan@amd.com" <evan.quan@amd.com>,
 "guchun.chen@amd.com" <guchun.chen@amd.com>,
 "bernard@vivo.com" <bernard@vivo.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Yuliang.Shi@amd.com" <Yuliang.Shi@amd.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "sean@poorly.run" <sean@poorly.run>, "tomba@kernel.org" <tomba@kernel.org>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "roman.li@amd.com" <roman.li@amd.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "tiantao6@hisilicon.com" <tiantao6@hisilicon.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wSuC6whr8KiEBzLeLFwYpFxv
Content-Type: multipart/mixed; boundary="------------qEO7kHUc5mesL2PcxJadeilC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "kherbst@redhat.com" <kherbst@redhat.com>,
 "xinliang.liu@linaro.org" <xinliang.liu@linaro.org>,
 "lijo.lazar@amd.com" <lijo.lazar@amd.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "mairacanal@riseup.net" <mairacanal@riseup.net>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "flora.cui@amd.com" <flora.cui@amd.com>, "etom@igel.co.jp"
 <etom@igel.co.jp>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "guchun.chen@amd.com" <guchun.chen@amd.com>,
 "bernard@vivo.com" <bernard@vivo.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "Jerry.Zuo@amd.com" <Jerry.Zuo@amd.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "Yuliang.Shi@amd.com" <Yuliang.Shi@amd.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>, "sean@poorly.run"
 <sean@poorly.run>, "tomba@kernel.org" <tomba@kernel.org>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "roman.li@amd.com" <roman.li@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "tiantao6@hisilicon.com" <tiantao6@hisilicon.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Message-ID: <f374944f-f374-d07c-2ac2-bb1e5598dea1@suse.de>
Subject: Re: [PATCH] drm: Remove drm_mode_config::fb_base
References: <20221018131754.351957-1-zack@kde.org>
 <27c535fe-6dfe-43a0-f915-324878798c36@suse.de>
 <f3241efec5b8f79a23e1780edca5ead841ad6532.camel@vmware.com>
In-Reply-To: <f3241efec5b8f79a23e1780edca5ead841ad6532.camel@vmware.com>

--------------qEO7kHUc5mesL2PcxJadeilC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMTAuMjIgdW0gMTc6NTIgc2NocmllYiBaYWNrIFJ1c2luOg0KWy4uLl0N
Cj4+PiAgICANCj4+PiBAQCAtNTI3LDcgKzUyNyw3IEBAIHZvaWQgcHNiX21vZGVzZXRfaW5p
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4+ICAgIA0KPj4+ICAgIAkvKiBzZXQgbWVt
b3J5IGJhc2UgKi8NCj4+PiAgICAJLyogT2FrdHJhaWwgYW5kIFBvdWxzYm8gc2hvdWxkIHVz
ZSBCQVIgMiovDQo+Pj4gLQlwY2lfcmVhZF9jb25maWdfZHdvcmQocGRldiwgUFNCX0JTTSwg
KHUzMiAqKSYoZGV2LT5tb2RlX2NvbmZpZy5mYl9iYXNlKSk7DQo+Pj4gKwlwY2lfcmVhZF9j
b25maWdfZHdvcmQocGRldiwgUFNCX0JTTSwgKHUzMiAqKSYoZGV2X3ByaXYtPmZiX2Jhc2Up
KTsNCj4+DQo+PiBBbHRob3VnaCBwcm9iYWJseSBjb3JyZWN0LCB0aGF0IGNvZGUgbG9va3Mg
cXVlc3Rpb25hYmxlLiBNYXliZSBoYXZlIGENCj4+IGxvY2FsIGZiX2Jhc2Ugb2YgdHlwZSB1
MzIgYW5kIGFzc2lnbiB0aGF0IHRvIHRoZSBmaWVsZCBpbiBkZXZfcHJpdi4gSXQncw0KPj4g
dGhlIHNhZmUgdmFyaWFudC4NCj4+DQo+IA0KPiBJIHRob3VnaHQgdGhlIHNhbWUsIGJ1dCBJ
IGRvbid0IGhhdmUgYSBwc2Igc3lzdGVtIHRvIHRlc3Qgc28gSSBvcHRlZCB0byBwcmVzZXJ2
ZQ0KPiBleGFjdGx5IHdoYXQgdGhlIGNvZGUgd2FzIGRvaW5nIGJlZm9yZS4gZmJfYmFzZSBp
biBlaXRoZXIgY2FzZSBpcyBhIHJlc291cmNlX3NpemVfdCwNCj4gYW5kIEknbSBndWVzc2lu
ZyB0aGUgZW50aXJlIHRoaW5nIGRlcGVuZHMsIGluIGVpdGhlciBjYXNlLCBvbiBkcm1fcHNi
X3ByaXZhdGUgYmVpbmcNCj4ga3phbGxvYydzLiBJJ20gaGFwcHkgdG8gY2hhbmdlIHRvIGp1
c3QgdXNlIGEgbG9jYWwgdTMyIGJ1dCBJIGNhbid0IHRlc3QgaXQgc28gaWYNCj4gdGhlcmUn
cyBzb21lIHNpZGUtZWZmZWN0IHRvIHVwcGVyIGJpdHMgaW4gZmJfYmFzZSBpbiB0aGF0IGRy
aXZlciB3ZSdsbCBicmVhayBpdC4NCg0KSUlSQyBQU0IgaGFyZHdhcmUgaXMgb25seSBhdmFp
bGFibGUgaW4gMzItYml0IHN5c3RlbXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------qEO7kHUc5mesL2PcxJadeilC--

--------------wSuC6whr8KiEBzLeLFwYpFxv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNPqAoFAwAAAAAACgkQlh/E3EQov+Bl
/xAAmKeW+QJZkAG1iAIuui3cx2A8QKb8SHAksKDeQvBYHToa8oAuaD19T4QaMGmCw5crtSsz5H/U
TaLdpe0aPlFMNT81g7PhU7roa65XQdPDD5KXlnW1b9nKmdSiIyL1xvUKlgR+vmYsXtajmIKDHCUu
IIypYwVwfzksf5EIveRRrEKQWolQ5XUQWwuwxgHgED2i0BqB6n67f1LRP1hFFkX80pgj81ig03sb
ov8DBOWcPeDLSpU4aDhBOTF+XH4ch/+kQ/3i4OOX5Ld+muOKRNAXf2WO6aTqC/nLmD8oYchSwT0/
fkijMnm4INZNzpE7KhZQnKLURvUwPSFN2x14PAJ4HZsOFi/J34JMNoxeX8yATVBPmhsfAAfKjvFy
xL88PKVEO4iwuqnnULNbtWxJpuq5FMlCYVcCkk6HBE6KRNm6xCrIfMnWB7OwPs5WXjK7jvnk4Jmk
sLRsBsv1BXKse/BXs1ZUou6g5cGtd/ebHM/NgDyMi90Zii3EioZTMno4KrDykLH8wO6/GW0CsO7t
9T3Z8alBoLytOM8vcOYonmRAUPI3B8HFYhZJPQMQeXBjFzOUrcdx4coY/naKUVXlG3733HfWxEjV
CuQzzv2PhEbgJ4gbsG9BpSyXZx839PbIRRMESDEarENDO+RmBrnGJGE7sqPWgLdkQfIr0zAkoEy+
c7Y=
=8wuQ
-----END PGP SIGNATURE-----

--------------wSuC6whr8KiEBzLeLFwYpFxv--
