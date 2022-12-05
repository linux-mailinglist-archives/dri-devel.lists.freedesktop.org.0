Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9DF642679
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 11:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C13610E1D1;
	Mon,  5 Dec 2022 10:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FCC10E055
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 10:11:19 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A10A021BCC;
 Mon,  5 Dec 2022 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670235078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sqNZA5zTyMlfI1v/fWKKuYoW5KcHHzow2+oG+C7H3Lc=;
 b=eEdg5lOw/D6B1odChP48YfilmfMu1o9jtRwTHFBIGPJxjCici25pjIJg3K6BzAnte57dUK
 +XJ7WTsdqrDmAhHsrGrqQA120LszXkJnQzqJPM/TwOq8wE2R4UvSn2dyK0LvsHMRgv0UVK
 dNV4UWCoTLq/HOauAFkTed4WS8CGiFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670235078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sqNZA5zTyMlfI1v/fWKKuYoW5KcHHzow2+oG+C7H3Lc=;
 b=9hrWHb64ZFrR+bAWovsqhuYgCIPUFSdLjSFr+zcp5QMUaFsNCEKoYfcWn58Uk3hhj5knjp
 CExaC89Kn0zsSYBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7149F1348F;
 Mon,  5 Dec 2022 10:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id +mhfGsbDjWN+egAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Dec 2022 10:11:18 +0000
Message-ID: <c1c8bfa5-8ba4-c365-1663-535f656ca353@suse.de>
Date: Mon, 5 Dec 2022 11:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
Content-Language: en-US
To: "mb@lab.how" <mb@lab.how>
References: <CAEdEoBYXHq9cCzsbMYTpG1B41Yz=-QAjFx7bJDOnPanN5Tmo7A@mail.gmail.com>
 <20221204175142.658d5c37.alex.williamson@redhat.com>
 <1e4d62cf-8893-0bff-51f5-5a2e419ed5a0@suse.de>
 <CAEdEoBYZa9cg0nq=P7EDsDS9m2EKYrd8M8ucqi8U0Csj0mtjDg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAEdEoBYZa9cg0nq=P7EDsDS9m2EKYrd8M8ucqi8U0Csj0mtjDg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uRsgP53PwlPRoZfb2hsusoNs"
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 kraxel@redhat.com, lersek@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uRsgP53PwlPRoZfb2hsusoNs
Content-Type: multipart/mixed; boundary="------------ubRTs0XIaXchmKOAzWfQJXuX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "mb@lab.how" <mb@lab.how>
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Williamson
 <alex.williamson@redhat.com>, kraxel@redhat.com, lersek@redhat.com
Message-ID: <c1c8bfa5-8ba4-c365-1663-535f656ca353@suse.de>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
References: <CAEdEoBYXHq9cCzsbMYTpG1B41Yz=-QAjFx7bJDOnPanN5Tmo7A@mail.gmail.com>
 <20221204175142.658d5c37.alex.williamson@redhat.com>
 <1e4d62cf-8893-0bff-51f5-5a2e419ed5a0@suse.de>
 <CAEdEoBYZa9cg0nq=P7EDsDS9m2EKYrd8M8ucqi8U0Csj0mtjDg@mail.gmail.com>
In-Reply-To: <CAEdEoBYZa9cg0nq=P7EDsDS9m2EKYrd8M8ucqi8U0Csj0mtjDg@mail.gmail.com>

--------------ubRTs0XIaXchmKOAzWfQJXuX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTIuMjIgdW0gMTA6MzIgc2NocmllYiBtYkBsYWIuaG93Og0KPiBJIGhh
dmUgYSBydHggMzA3MCBhbmQgYSAzMDkwLCBJIGFtIGFic29sdXRlbHkgc3VyZSBJIGFtIGJp
bmRpbmcgdmZpby1wY2kgDQo+IHRvIHRoZSAzMDkwIGFuZCBub3QgdGhlIDMwNzAuDQo+IA0K
PiBJIGhhdmUgYm91bmQgdGhlIGRyaXZlciBpbiB0d28gZGlmZmVyZW50IHdheXMsIGZpcnN0
IGJ5IHBhc3NpbmcgdGhlIElEcyANCj4gdG8gdGhlIG1vZHVsZSBhbmQgYWx0ZXJuYXRpdmVs
eSBieSBtYW5pcHVsYXRpbmcgdGhlIHN5c3RlbSBpbnRlcmZhY2UgYW5kIA0KPiB1c2UgdGhl
IG92ZXJyaWRlICh0aGlzIGlzIHdoYXQgSSBvcmlnaW5hbGx5IGhhZCB0byBkbyB3aGVuIEkg
dXNlZCB0d28gDQo+IDEwODBzLCBzbyBJIGtub3cgaXQgd29ya3MpLg0KPiANCj4gV2hpbGUg
dGhlIDMwOTAgZG9lc24ndCBzaG93IGEgY29uc29sZSwgdGhlcmUncyBhIHJlbW5hbnQgZnJv
bSB0aGUgcmVmdW5kIA0KPiAoYW5kIGdydWIgcHJldmlvdXNseSkgdGhlcmUuDQo+IA0KPiBU
aGUgYXNzZXNzbWVudCBBbGV4IG1hZGUgcHJldmlvdXNseSwgd2hlcmUgDQo+IGFwZXJ0dXJl
X3JlbW92ZV9jb25mbGljdGluZ19wY2lfZGV2aWNlcygpIGlzIHJlbW92aW5nIHRoZSBkcml2
ZXIgKEVGSUZCKSANCj4gaW5zdGVhZCBvZiB0aGUgZGV2aWNlIHNlZW1zIGNvcnJlY3QsIGJ1
dCBpdCBjb3VsZCBhbHNvIGNhbiBiZSBhIHF1aXJreSANCj4gb2YgaG93IEVGSUZCIGlzIGlt
cGxlbWVudGVkLiBJIHJlY2FsbCByZWFkaW5nIGEgbG9uZyB0aW1lIGFnbyB0aGF0IEVGSUZC
IA0KPiBpcyBhIHNwZWNpYWwgZGV2aWNlIGFuZCBvbmNlIGl0IGRldGVjdHMgY2hhbmdlcyBp
dCB3b3VsZCBzaW1wbHkgZ2l2ZSB1cC4gDQo+IFRoZXJlIHdhcyBhbHNvIG5vIHdheSB0byBh
dHRhY2ggYSBkZXZpY2UgdG8gaXQgYWdhaW4gYXMgaXQgZGVwZW5kcyBvbiANCj4gYmVpbmcg
cHJlbG9hZGVkIG91dHNpZGUgdGhlIGtlcm5lbDsgb25jZSBzb21ldGhpbmcgdGFrZXMgb3Zl
ciB0aGUgYnVmZmVyIA0KPiByZWluaXRpYWxpemluZyBpcyAiaW1wb3NzaWJsZSIuIEkgbmV2
ZXIgd2VudCBkZWVwZXIgdG8gdHJ5IGFuZCANCj4gdW5kZXJzdGFuZCBpdC4NCg0KV2UgcmVj
ZW50bHkgcmV3b3JrZWQgZmJkZXYncyBpbnRlcmFjdGlvbiB3aXRoIHRoZSBhcGVydHVyZSBo
ZWxwZXJzLiBbMV0gDQpBbGwgZGV2aWNlcyBzaG91bGQgbm93IGJlIHJlbW92ZWQgaWZmIHRo
ZSBkcml2ZXIgaGFzIGJlZW4gYm91bmQgdG8gaXQgDQood2hpY2ggc2hvdWxkIGJlIHRoZSBj
YXNlIGhlcmUpIFRoZSBwYXRjaGVzIHdlbnQgaW50byBhbiB2Ni4xLXJjLg0KDQpDb3VsZCB5
b3UgdHJ5IHRoZSBtb3N0IHJlY2VudCB2Ni4xLXJjIGFuZCByZXBvcnQgaWYgdGhpcyBmaXhl
cyB0aGUgcHJvYmxlbT8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTA2MDQwLw0KDQo+IA0KPiANCj4g
T24gTW9uLCBEZWMgNSwgMjAyMiwgMjowMCBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZSANCj4gPG1haWx0bzp0emltbWVybWFubkBzdXNlLmRlPj4gd3JvdGU6
DQo+IA0KPiAgICAgSGkNCj4gDQo+ICAgICBBbSAwNS4xMi4yMiB1bSAwMTo1MSBzY2hyaWVi
IEFsZXggV2lsbGlhbXNvbjoNCj4gICAgICA+IE9uIFNhdCwgMyBEZWMgMjAyMiAxNzoxMjoz
OCAtMDcwMA0KPiAgICAgID4gIm1iQGxhYi5ob3ciIDxtYkBsYWIuaG93PiB3cm90ZToNCj4g
ICAgICA+DQo+ICAgICAgPj4gSGksDQo+ICAgICAgPj4NCj4gICAgICA+PiBJIGhvcGUgaXQg
aXMgb2sgdG8gcmVwbHkgdG8gdGhpcyBvbGQgdGhyZWFkLg0KPiAgICAgID4NCj4gICAgICA+
IEl0IGlzLCBidXQgdGhlIG9ubHkgcmVsaWMgb2YgdGhlIHRocmVhZCBpcyB0aGUgc3ViamVj
dC7CoCBGb3INCj4gICAgIHJlZmVyZW5jZSwNCj4gICAgICA+IHRoZSBsYXRlc3QgdmVyc2lv
biBvZiB0aGlzIHBvc3RlZCBpcyBoZXJlOg0KPiAgICAgID4NCj4gICAgICA+DQo+ICAgICBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA2MjIxNDAxMzQuMTI3NjMtNC10emlt
bWVybWFubkBzdXNlLmRlLyA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNjIy
MTQwMTM0LjEyNzYzLTQtdHppbW1lcm1hbm5Ac3VzZS5kZS8+DQo+ICAgICAgPg0KPiAgICAg
ID4gV2hpY2ggaXMgY29tbWl0dGVkIGFzOg0KPiAgICAgID4NCj4gICAgICA+IGQxNzM3ODA2
MjA3OSAoInZmaW8vcGNpOiBSZW1vdmUgY29uc29sZSBkcml2ZXJzIikNCj4gICAgICA+DQo+
ICAgICAgPj4gVW5mb3J0dW5hdGVseSwgSSBmb3VuZCBhDQo+ICAgICAgPj4gcHJvYmxlbSBv
bmx5IG5vdyBhZnRlciB1cGdyYWRpbmcgdG8gNi4wLg0KPiAgICAgID4+DQo+ICAgICAgPj4g
TXkgc2V0dXAgaGFzIG11bHRpcGxlIEdQVXMgKDIpLCBhbmQgSSBkZXBlbmQgb24gRUZJRkIg
dG8gaGF2ZSBhDQo+ICAgICB3b3JraW5nIGNvbnNvbGUuDQo+IA0KPiAgICAgV2hpY2ggR1BV
cyBkbyB5b3UgaGF2ZT8NCj4gDQo+ICAgICAgPj4gcHJlLXBhdGNoIGJlaGF2aW9yLCB3aGVu
IEkgYmluZCB0aGUgdmZpby1wY2kgdG8gbXkgc2Vjb25kYXJ5IEdQVQ0KPiAgICAgYm90aA0K
PiAgICAgID4+IHRoZSBwYXNzdGhyb3VnaCBhbmQgdGhlIEVGSUZCIGtlZXAgd29ya2luZyBm
aW5lLg0KPiAgICAgID4+IHBvc3QtcGF0Y2ggYmVoYXZpb3IsIHdoZW4gSSBiaW5kIHRoZSB2
ZmlvLXBjaSB0byB0aGUgc2Vjb25kYXJ5IEdQVSwNCj4gICAgICA+PiB0aGUgRUZJRkIgZGlz
YXBwZWFycyBmcm9tIHRoZSBzeXN0ZW0sIGJpbmRpbmcgdGhlIGNvbnNvbGUgdG8gdGhlDQo+
ICAgICAgPj4gImR1bW15IGNvbnNvbGUiLg0KPiANCj4gICAgIFRoZSBlZmlmYiB3b3VsZCBs
aWtlbHkgdXNlIHRoZSBmaXJzdCBHUFUuIEFuZCB2ZmlvLXBjaSBzaG91bGQgb25seQ0KPiAg
ICAgcmVtb3ZlIHRoZSBnZW5lcmljIGRyaXZlciBmcm9tIHRoZSBzZWNvbmQgZGV2aWNlLiBB
cmUgeW91IHN1cmUgdGhhdA0KPiAgICAgeW91J3JlIG5vdCBzb21laG93IHVzaW5nIHRoZSBm
aXJzdCBHUFUgd2l0aCB2ZmlvLXBjaS4NCj4gDQo+ICAgICAgPj4gV2hlbmV2ZXIgeW91IHRy
eSB0byBhY2Nlc3MgdGhlIHRlcm1pbmFsLCB5b3UgaGF2ZSB0aGUgc2NyZWVuDQo+ICAgICBz
dHVjayBpbg0KPiAgICAgID4+IHdoYXRldmVyIHdhcyB0aGUgbGFzdCBidWZmZXIgY29udGVu
dCwgd2hpY2ggZ2l2ZXMgdGhlIGltcHJlc3Npb24gb2YNCj4gICAgICA+PiAiZnJlZXppbmcs
IiBidXQgSSBjYW4gc3RpbGwgdHlwZS4NCj4gICAgICA+PiBFdmVyeXRoaW5nIGVsc2Ugd29y
a3MsIGluY2x1ZGluZyB0aGUgcGFzc3Rocm91Z2guDQo+ICAgICAgPg0KPiAgICAgID4gVGhp
cyBzb3VuZHMgbGlrZSB0aGUgY2FsbCB0bw0KPiAgICAgYXBlcnR1cmVfcmVtb3ZlX2NvbmZs
aWN0aW5nX3BjaV9kZXZpY2VzKCkNCj4gICAgICA+IGlzIHJlbW92aW5nIHRoZSBjb25mbGlj
dGluZyBkcml2ZXIgaXRzZWxmIHJhdGhlciB0aGFuIHJlbW92aW5nIHRoZQ0KPiAgICAgID4g
ZGV2aWNlIGZyb20gdGhlIGRyaXZlci7CoCBJcyBpdCBub3QgcG9zc2libGUgdG8gdW5iaW5k
IHRoZSBHUFUgZnJvbQ0KPiAgICAgID4gZWZpZmIgYmVmb3JlIGJpbmRpbmcgdGhlIEdQVSB0
byB2ZmlvLXBjaSB0byBlZmZlY3RpdmVseSBudWxsaWZ5IHRoZQ0KPiAgICAgID4gYWRkZWQg
Y2FsbD8NCj4gICAgICA+DQo+ICAgICAgPj4gSSBjYW4gb25seSB0aGluayBhYm91dCBhIGZl
dyBvcHRpb25zOg0KPiAgICAgID4+DQo+ICAgICAgPj4gLSBJcyB0aGVyZSBhIHdheSB0byBo
YXZlIEVGSUZCIHNob3cgdXAgYWdhaW4/IEFmdGVyIGFsbCBpdCBsb29rcw0KPiAgICAgbGlr
ZQ0KPiAgICAgID4+IHRoZSBrZXJuZWwgaGFzIGp1c3QgYWJhbmRvbmVkIGl0LCBidXQgdGhl
IGJ1ZmZlciBpcyBzdGlsbCB0aGVyZS4gSQ0KPiAgICAgID4+IGNhbid0IGZpbmQgYSBzaW5n
bGUgbWVzc2FnZSBhYm91dCB0aGUgc2Vjb25kYXJ5IGNhcmQgYW5kIEVGSUZCIGluDQo+ICAg
ICAgPj4gZG1lc2csIGJ1dCB0aGVyZSdzIGEgbWVzc2FnZSBmb3IgdGhlIHByaW1hcnkgY2Fy
ZCBhbmQgRUZJRkIuDQo+ICAgICAgPj4gLSBDYW4gd2UgaGF2ZSBhIGJvb2xlYW4gY29udHJv
bGxpbmcgdGhlIGJlaGF2aW9yIG9mIHZmaW8tcGNpDQo+ICAgICAgPj4gYWx0b2dldGhlciBv
ciBhdCBsZWFzdCBjb250cm9sbGluZyB0aGUgYmVoYXZpb3Igb2YgdmZpby1wY2kgZm9yIHRo
YXQNCj4gICAgICA+PiBzcGVjaWZpYyBJRD8gSSBrbm93IHRoZXJlJ3MgYWxyZWFkeSBzb21l
IG9wdGlvbiBmb3IgdmZpby1wY2kgYW5kIFZHQQ0KPiAgICAgID4+IGNhcmRzLCB3b3VsZCBp
dCBiZSBhcHByb3ByaWF0ZSB0byBhdHRhY2ggdGhpcyBiZWhhdmlvciB0byB0aGF0DQo+ICAg
ICBvcHRpb24/DQo+ICAgICAgPg0KPiAgICAgID4gSSBzdXBwb3NlIHdlIGNvdWxkIGhhdmUg
YW4gb3B0LW91dCBtb2R1bGUgb3B0aW9uIG9uIHZmaW8tcGNpIHRvIHNraXANCj4gICAgICA+
IHRoZSBhYm92ZSBjYWxsLCBidXQgY2xlYXJseSBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgdGhp
bmdzIHdvcmtlZCBieQ0KPiAgICAgID4gZGVmYXVsdC7CoCBXZSBjYW5ub3QgbWFrZSBmdWxs
IHVzZSBvZiBHUFVzIHdpdGggdmZpby1wY2kgaWYgdGhleSdyZQ0KPiAgICAgID4gc3RpbGwg
aW4gdXNlIGJ5IGhvc3QgY29uc29sZSBkcml2ZXJzLsKgIFRoZSBpbnRlbnRpb24gd2FzIGNl
cnRhaW5seSB0bw0KPiAgICAgID4gdW5iaW5kIHRoZSBkZXZpY2UgZnJvbSBhbnkgbG93IGxl
dmVsIGRyaXZlcnMgcmF0aGVyIHRoYW4gZGlzYWJsZQ0KPiAgICAgdXNlIG9mDQo+ICAgICAg
PiBhIGNvbnNvbGUgZHJpdmVyIGVudGlyZWx5LsKgIERSTS9HUFUgZm9sa3MsIGlzIHRoYXQg
cG9zc2libHkgYW4NCj4gICAgICA+IGludGVyZmFjZSB3ZSBjb3VsZCBpbXBsZW1lbnQ/wqAg
VGhhbmtzLA0KPiANCj4gICAgIFdoZW4gdmZpby1wY2kgZ2l2ZXMgdGhlIEdQVSBkZXZpY2Ug
dG8gdGhlIGd1ZXN0LCB3aGljaCBkcml2ZXIgZHJpdmVyIGlzDQo+ICAgICBib3VuZCB0byBp
dD8NCj4gDQo+ICAgICBCZXN0IHJlZ2FyZHMNCj4gICAgIFRob21hcw0KPiANCj4gICAgICA+
DQo+ICAgICAgPiBBbGV4DQo+ICAgICAgPg0KPiANCj4gICAgIC0tIA0KPiAgICAgVGhvbWFz
IFppbW1lcm1hbm4NCj4gICAgIEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4gICAgIFNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiAgICAgTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+ICAgICAoSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQo+ICAgICBHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo+IA0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------ubRTs0XIaXchmKOAzWfQJXuX--

--------------uRsgP53PwlPRoZfb2hsusoNs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmONw8UFAwAAAAAACgkQlh/E3EQov+C0
TA//SlTy4HIrre0FZ/Pp7SIQGhEYUChZcgD6EST1ho9Ktp61x/nPABVnJjhz/kyQ8G7eAeqnSXK/
hapklY65w13NI9M6sfnGFV+z/1ENL6+yYYX3iCDQtI+h2PSqC8khfF/tHItzzYDOZR/L9Xqw9dT8
JAonPlSOFu1FRN0D6JgQaxG9DwLZMMBDlg6nkQR8cuzxGj480DzsaXgRNIV/lVTPqPjQQlDN6XIf
g1Fg6oNNefwedRs5zMXs3VpIlz6o2rH4Az0iH1lcI3BeMqbytWLdgimLT+KLegggvY5FQe0y5Xa9
yxb3gza26SyUn0Xk7PDmGB6VlgXAHj1UfSpVJvUQcpuKj0w07Kq5cc37TuTi6gHqDJtUZ/2VBqAD
Tgdsbj7ZwR9YjfYHPQ2gZsoQyrz+IfJcKAJJNHJ5dyDLiSUF7r7aU7VujTLGlildmz4Sjk9Tb81N
zsLNZpEix6ubTOHAF463NGDuxg/oO8gyDJ2loBN5tShBboelcT2yEFm4H0JbZJyFT7EDbqUHsJuU
8rG9rqIxmzXo1lK6R2jy1yl9E5dEW/9kpUWS78dSX+y8jtaGZDZfvbAOCUNx9FqbGNe93Oud1Ua/
c6LFSMyBOlnVrk71pkPhuhjPdGPXvwan4wSeScd31QFuhS4egpVeflPBoAcN1Ac6L2arFwUoM3hf
548=
=NgFS
-----END PGP SIGNATURE-----

--------------uRsgP53PwlPRoZfb2hsusoNs--
