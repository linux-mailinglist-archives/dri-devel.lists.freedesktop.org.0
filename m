Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B04FE5B745D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 17:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588B310E767;
	Tue, 13 Sep 2022 15:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB8810E767
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:25:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 561DE34767;
 Tue, 13 Sep 2022 15:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663082706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8uml+CVHSR1wkzzme+MP9OE2CB2kv9GNNkNDVSC2Jhw=;
 b=gxAeCBLX08pgFySLUZACNomI6Ddk2SYoNhQBeN5kLkJl1/9b410GO5/RlNRxQP5J0j6BFl
 PAKxIZarXE0/HKWwy/czi8b1DyAgteMRkaGEKXS1OxLiyH1DaUnghbWY2f/SpGpclPHjOP
 7gIhj1zFnCs4KRvUNlGTiQk5l9pNe+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663082706;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8uml+CVHSR1wkzzme+MP9OE2CB2kv9GNNkNDVSC2Jhw=;
 b=Pt3q5cTuskqU2g7OaTOA+KoMdRQSKJ3TfV0U2MW7wlJYiwiZlfiVypN1oLx0KvgYiYCCvY
 l2eckFzBb4Txg7Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 276BB139B3;
 Tue, 13 Sep 2022 15:25:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Z7aoCNKgIGNxVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Sep 2022 15:25:06 +0000
Message-ID: <8faee19d-8aa0-af31-15eb-170d83b4d445@suse.de>
Date: Tue, 13 Sep 2022 17:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/hyperv: Don't rely on screen_info.lfb_base for Gen1
 VMs
Content-Language: en-US
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
References: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>
 <14302178-c797-8635-4325-070f78b7f805@suse.de>
 <20220911162119.GB7754@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <34e6ccfe-d6a0-e832-14a9-0445b61db106@suse.de>
 <20220913151555.GA22169@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220913151555.GA22169@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RhuwoH4ibrfjV3Z8rFPaCZME"
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
Cc: linux-hyperv@vger.kernel.org, airlied@linux.ie, ssengar@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mikelley@microsoft.com, drawat.floss@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RhuwoH4ibrfjV3Z8rFPaCZME
Content-Type: multipart/mixed; boundary="------------c5kaYCxuNu0VgFQcC7kg0Pmk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, airlied@linux.ie, ssengar@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mikelley@microsoft.com, drawat.floss@gmail.com
Message-ID: <8faee19d-8aa0-af31-15eb-170d83b4d445@suse.de>
Subject: Re: [PATCH] drm/hyperv: Don't rely on screen_info.lfb_base for Gen1
 VMs
References: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>
 <14302178-c797-8635-4325-070f78b7f805@suse.de>
 <20220911162119.GB7754@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <34e6ccfe-d6a0-e832-14a9-0445b61db106@suse.de>
 <20220913151555.GA22169@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20220913151555.GA22169@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>

--------------c5kaYCxuNu0VgFQcC7kg0Pmk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDkuMjIgdW0gMTc6MTUgc2NocmllYiBTYXVyYWJoIFNpbmdoIFNlbmdh
cjoNCj4gT24gTW9uLCBTZXAgMTIsIDIwMjIgYXQgMDk6MDM6NTNBTSArMDIwMCwgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6DQo+PiBIaQ0KPj4NCj4+IEFtIDExLjA5LjIyIHVtIDE4OjIx
IHNjaHJpZWIgU2F1cmFiaCBTaW5naCBTZW5nYXI6DQo+Pj4gT24gU2F0LCBTZXAgMTAsIDIw
MjIgYXQgMDg6MTE6MjRQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+
IEhpDQo+Pj4+DQo+Pj4+IEFtIDA5LjA5LjIyIHVtIDE2OjQzIHNjaHJpZWIgU2F1cmFiaCBT
ZW5nYXI6DQo+Pj4+PiBoeXBlcnZfc2V0dXBfdnJhbSB0cmllcyB0byByZW1vdmUgY29uZmxp
Y3RpbmcgZnJhbWVidWZmZXIgYmFzZWQgb24NCj4+Pj4+ICdzY3JlZW5faW5mbycuIEFzIG9i
c2VydmVkIGluIHBhc3QgZHVlIHRvIHNvbWUgYnVnIG9yIHdyb25nIHNldHRpbmcNCj4+Pj4+
IGluIGdydWIsIHRoZSAnc2NyZWVuX2luZm8nIGZpZWxkcyBtYXkgbm90IGJlIHNldCBmb3Ig
R2VuMSwgYW5kIGluIHN1Y2gNCj4+Pj4+IGNhc2VzIGRybV9hcGVydHVyZV9yZW1vdmVfY29u
ZmxpY3RpbmdfZnJhbWVidWZmZXJzIHdpbGwgbm90IGRvIGFueXRoaW5nDQo+Pj4+PiB1c2Vm
dWwuDQo+Pj4+PiBGb3IgR2VuMSBWTXMsIGl0IHNob3VsZCBhbHdheXMgYmUgcG9zc2libGUg
dG8gZ2V0IGZyYW1lYnVmZmVyDQo+Pj4+PiBjb25mbGljdCByZW1vdmVkIHVzaW5nIFBDSSBk
ZXZpY2UgaW5zdGVhZC4NCj4+Pj4+DQo+Pj4+PiBGaXhlczogYTBhYjVhYmNlZDU1ICgiZHJt
L2h5cGVydiA6IFJlbW92aW5nIHRoZSByZXN0cnVjdGlvbiBvZiBWUkFNIGFsbG9jYXRpb24g
d2l0aCBQQ0kgYmFyIHNpemUiKQ0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogU2F1cmFiaCBTZW5n
YXIgPHNzZW5nYXJAbGludXgubWljcm9zb2Z0LmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gICBk
cml2ZXJzL2dwdS9kcm0vaHlwZXJ2L2h5cGVydl9kcm1fZHJ2LmMgfCAyNCArKysrKysrKysr
KysrKysrKysrKy0tLS0NCj4+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9oeXBl
cnYvaHlwZXJ2X2RybV9kcnYuYw0KPj4+Pj4gaW5kZXggNmQxMWU3OTM4YzgzLi5iMGNjOTc0
ZWZhNDUgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaHlwZXJ2L2h5cGVy
dl9kcm1fZHJ2LmMNCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2
X2RybV9kcnYuYw0KPj4+Pj4gQEAgLTczLDEyICs3MywyOCBAQCBzdGF0aWMgaW50IGh5cGVy
dl9zZXR1cF92cmFtKHN0cnVjdCBoeXBlcnZfZHJtX2RldmljZSAqaHYsDQo+Pj4+PiAgIAkJ
CSAgICAgc3RydWN0IGh2X2RldmljZSAqaGRldikNCj4+Pj4+ICAgew0KPj4+Pj4gICAJc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiA9ICZodi0+ZGV2Ow0KPj4+Pj4gKwlzdHJ1Y3QgcGNpX2Rl
diAqcGRldjsNCj4+Pj4+ICAgCWludCByZXQ7DQo+Pj4+PiAtCWRybV9hcGVydHVyZV9yZW1v
dmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKHNjcmVlbl9pbmZvLmxmYl9iYXNlLA0KPj4+
Pj4gLQkJCQkJCSAgICAgc2NyZWVuX2luZm8ubGZiX3NpemUsDQo+Pj4+PiAtCQkJCQkJICAg
ICBmYWxzZSwNCj4+Pj4+IC0JCQkJCQkgICAgICZoeXBlcnZfZHJpdmVyKTsNCj4+Pj4+ICsJ
aWYgKGVmaV9lbmFibGVkKEVGSV9CT09UKSkgew0KPj4+Pj4gKwkJZHJtX2FwZXJ0dXJlX3Jl
bW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMoc2NyZWVuX2luZm8ubGZiX2Jhc2UsDQo+
Pj4+PiArCQkJCQkJCSAgICAgc2NyZWVuX2luZm8ubGZiX3NpemUsDQo+Pj4+DQo+Pj4+IFVz
aW5nIHNjcmVlbl9pbmZvIGhlcmUgc2VlbXMgd3JvbmcgaW4gYW55IGNhc2UuIFlvdSB3YW50
IHRvIHJlbW92ZQ0KPj4+PiB0aGUgZnJhbWVidWZmZXIgZGV2aWNlcyB0aGF0IGNvbmZsaWN0
IHdpdGggeW91ciBkcml2ZXIsIHdoaWNoIG1pZ2h0DQo+Pj4+IGJlIHVucmVsYXRlZCB0byBz
Y3JlZW5faW5mby4gQUZBSUNUIHRoZSBjb3JyZWN0IHNvbHV0aW9uIHdvdWxkDQo+Pj4+IGFs
d2F5cyByZXRyaWV2ZSB0aGUgUENJIGRldmljZSBmb3IgcmVtb3ZhbCAoaS5lLiwgYWx3YXlz
IGRvIHRoZSBlbHNlDQo+Pj4+IGJyYW5jaCkuDQo+Pj4NCj4+PiBJbiBhIEdlbjIgVk0sIHRo
ZSBIeXBlci1WIGZyYW1lIGJ1ZmZlciBkZXZpY2UgaXMgcHJlc2VudGVkIG9ubHkgYXMgYSBW
TWJ1cyBkZXZpY2UuDQo+Pj4gSXQncyBub3QgcHJlc2VudGVkIGFzIGEgUENJIGRldmljZSBs
aWtlIGl0IGlzIGluIGEgR2VuMSBWTS4gVGhpcyB3b3VsZCBoYXZlIHdvcmtlZA0KPj4+IGlm
IHdlIGhhZCB0aGUgZnJhbWUgYnVmZmVyIGRldmljZSBhdmFpbGFibGUgYXMgUENJIGRldmlj
ZSBpbiBHZW4yIGJ1dCB1bmZvcnR1bmF0ZWx5DQo+Pj4gdGhhdHMgbm90IHRoZSBjYXNlIGhl
cmUuDQo+Pg0KPj4gVGhhbmtzIGZvciBleHBsYWluaW5nLiBUaGVyZSBpcyBhbiBpbnN0YW5j
ZSBvZiBzdHJ1Y3QgaHZfZGV2aWNlDQo+PiBwYXNzZWQgdG8gdGhlIHByb2JlIGZ1bmN0aW9u
LiBJIHN1c3BlY3QgeW91IGNhbm5vdCBnZXQgdGhlDQo+PiBmcmFtZWJ1ZmZlciByYW5nZSBm
cm9tIHRoaXMgaW5zdGFuY2UgKGUuZy4sIHZpYSB0aGUgZGV2aWNlJ3MNCj4+IHBsYXRmb3Jt
X2RhdGEpPw0KPj4NCj4+IElmIHlvdSBhYnNvbHV0ZWx5IGNhbid0IGdldCB0aGUgYWN0dWFs
IG1lbW9yeSByZWdpb24gZnJvbSB0aGUNCj4+IGRldmljZSwgaXQncyBiZXR0ZXIgdG8gcmVt
b3ZlIGFsbCBmcmFtZWJ1ZmZlcnMgdmlhDQo+PiBkcm1fYXBlcnR1cmVfcmVtb3ZlX2ZyYW1l
YnVmZmVycygpIHRoYW4gdG8gdXNlIHNjcmVlbl9pbmZvLg0KPj4NCj4+IEJlc3QgcmVnYXJk
cw0KPj4gVGhvbWFzDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbiwgYW5kIEkg
dGhvdWdodCBvZiB1c2luZyBkcm1fYXBlcnR1cmVfcmVtb3ZlX2ZyYW1lYnVmZmVycw0KPiBo
ZXJlLCBidXQgdGhpcyBkcml2ZXIgd2lsbCBiZSB1c2VkIGluIG1hbnkgZGlmZmVyZW50IHN5
c3RlbXMgd2l0aCBtYW55IG90aGVyIGdyYXBoaWNzDQo+IGRldmljZXMgKEdQVSBldGMpLiBS
ZW1vdmluZyBhbGwgdGhlIGZyYW1lYnVmZmVyIGlzIGEgYml0IGJsdW50IGFwcHJvYWNoIHdo
aWNoIG1heSBkaXN0dXJiDQo+IHRoZSBkZXZpY2VzIHdlIGFyZSBub3QgaW50ZW5kZWQgdG8g
YW5kIHdoaWNoIGFyZSBldmVuIG91dHNpZGUgb2YgdGhlIEh5cGVyViBNTUlPIHJlZ2lvbi4N
Cj4gSSBmZWVsIHRoaXMgQVBJIHVzZSB3aWxsIGJlIHJpc2t5LCBhbmQgSSB3b3VsZCBsaWtl
IHRvIHN0aWNrIHRvIHRoZSBlYXJsaWVyIG1ldGhvZCB3aGljaA0KPiBpcyBwcm92ZW4gdG8g
YmUgd29ya2luZyBmb3IgbWFueSB5ZWFycyBhbmQgd2UgYXJlIHN1cmUgaXQgd29uJ3QgZGlz
dHVyYiBhbnlvbmUgb3V0c2lkZQ0KPiBNTUlPIHJlZ2lvbi4NCg0KQnV0IHRoZSBwcm9ibGVt
IHdpdGggdGhlIGN1cnJlbnQgY29kZSBpcyB0aGF0IHlvdSBhbHNvIHJlbW92ZSB0aGUgZHJp
dmVyIA0KdGhhdCBjb3ZlcnMgdGhlIGJvb3QtdXAgZ3JhcGhpY3MsIGV2ZW4gaWYgaXQncyBu
b3QgZXZlbiBhIGh5cGVydiBkZXZpY2UuIA0KVGhhdCdzIHdoeSBJIHNhaWQgdGhhdCB5b3Ug
c2hvdWxkIHRyeSB0byBkZXRlY3QgaWYgdGhlIGh5cGVydiBkZXZpY2UgDQp5b3UncmUgY3Jl
YXRpbmcgYWN0dWFsbHkgdXNlcyB0aGUgc2NyZWVuX2luZm8gd2hlbiB5b3UgY3JlYXRlIHRo
ZSBkZXZpY2UuDQoNClNldCB0aGF0IGluZm9ybWF0aW9uIGFzIGRldmljZSBkYXRhIGFuZCBs
b29rIGl0IHVwIGluIHRoZSBoeXBlcnYtZHJtIA0KZHJpdmVyLiBJZiBubyBzdWNoIHNjcmVl
bl9pbmZvIGRhdGEgaXMgYXR0YWNoZWQgdG8gdGhlIGRldmljZSwgeW91IGRvbid0IA0KaGF2
ZSB0byByZW1vdmUgY29uZmxpY3RpbmcgZnJhbWVidWZmZXJzIGF0IGFsbC4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gUmVnYXJkcywNCj4gU2F1cmFiaA0KPj4NCj4+Pg0K
Pj4+IFJlZ2FyZHMsDQo+Pj4gU2F1cmFiaA0KPj4+DQo+Pj4+DQo+Pj4+IEJlc3QgcmVnYXJk
DQo+Pj4+IFRob21hcw0KPj4+Pg0KPj4+Pj4gKwkJCQkJCQkgICAgIGZhbHNlLA0KPj4+Pj4g
KwkJCQkJCQkgICAgICZoeXBlcnZfZHJpdmVyKTsNCj4+Pj4+ICsJfSBlbHNlIHsNCj4+Pj4+
ICsJCXBkZXYgPSBwY2lfZ2V0X2RldmljZShQQ0lfVkVORE9SX0lEX01JQ1JPU09GVCwgUENJ
X0RFVklDRV9JRF9IWVBFUlZfVklERU8sIE5VTEwpOw0KPj4+Pj4gKwkJaWYgKCFwZGV2KSB7
DQo+Pj4+PiArCQkJZHJtX2VycihkZXYsICJVbmFibGUgdG8gZmluZCBQQ0kgSHlwZXItViB2
aWRlb1xuIik7DQo+Pj4+PiArCQkJcmV0dXJuIC1FTk9ERVY7DQo+Pj4+PiArCQl9DQo+Pj4+
PiArDQo+Pj4+PiArCQlyZXQgPSBkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3Bj
aV9mcmFtZWJ1ZmZlcnMocGRldiwgJmh5cGVydl9kcml2ZXIpOw0KPj4+Pj4gKwkJcGNpX2Rl
dl9wdXQocGRldik7DQo+Pj4+PiArCQlpZiAocmV0KSB7DQo+Pj4+PiArCQkJZHJtX2Vycihk
ZXYsICJOb3QgYWJsZSB0byByZW1vdmUgYm9vdCBmYlxuIik7DQo+Pj4+PiArCQkJcmV0dXJu
IHJldDsNCj4+Pj4+ICsJCX0NCj4+Pj4+ICsJfQ0KPj4+Pj4gICAJaHYtPmZiX3NpemUgPSAo
dW5zaWduZWQgbG9uZylodi0+bW1pb19tZWdhYnl0ZXMgKiAxMDI0ICogMTAyNDsNCj4+Pj4N
Cj4+Pj4gLS0gDQo+Pj4+IFRob21hcyBaaW1tZXJtYW5uDQo+Pj4+IEdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINCj4+Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQo+Pj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4+PiAo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+Pj4+IEdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCj4+Pg0KPj4+DQo+Pj4NCj4+DQo+PiAtLSANCj4+IFRob21hcyBaaW1tZXJtYW5u
DQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4gR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0KPiANCj4gDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------c5kaYCxuNu0VgFQcC7kg0Pmk--

--------------RhuwoH4ibrfjV3Z8rFPaCZME
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMgoNEFAwAAAAAACgkQlh/E3EQov+AD
HA//aLM0BQSKd6p4ssLbdaT92iWRGrLkQnFhvQcjbl4yCkXq1p1bGpkbNllxTowsvYhwC+UTgmtU
lRIBUNfj1hWyTGPsNts3Sa9l5ocHk2Uitcg5jDxnUu0EePMgOHKCJIkJECKMmKgXE0Wgmw9HjOtk
TooJKzJZteaZUsQ3W64GjxjCNVXLnp3PPrLr4Rog02mEea5PaVvewtEQe216XxGC5Uk1Kdh5VJfd
YdSGdxNGDYRCizoWhQdLazIxLZRK/Aq20iOQ+ZMvmiWTcrFagxrH5Zyes/RSV51kQtMbR+l1Y7Bc
6InCxl5F9lsGeLQZGPSPpHbC5zjU4CbZIxymO7Vonca3Y+Z87i8LzHGRJW9VCFMHhkP5EDdLZxEH
OqhD48PsE2FiSaU5rqhw206V260qnxkTkyat61uimqf2huhnsKtgYyPKb9j8NTBQFT53M8Itu0XJ
lfKqm54khhWyqXaL4JyfhyET1WzMQJSnnM3DOnoUn/rGV1WHZH7nwfcqJgXtS6qIJvNSug1tSmNk
6W7IPc4NnFbX+IbEJmvyeWvrcDaw6ijCny3GkKDZwo/Ler6eeaQPL5Ge2gYsovh5xPqMDEOF9HOv
V4pdMYj0LJEZ2HxXRO852SvQXDkhf/zIz8OWT2v7uPrTUIH0Ta10PLBihb51FD7pGlp3K53wsmx3
ffo=
=a+kJ
-----END PGP SIGNATURE-----

--------------RhuwoH4ibrfjV3Z8rFPaCZME--
