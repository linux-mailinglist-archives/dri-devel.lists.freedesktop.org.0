Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM2TGkoEhmmyJAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:10:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A708CFF7EE
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A75410E051;
	Fri,  6 Feb 2026 15:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Z3JPN1Eg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D023510E051
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 15:09:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770390592; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Vucqg/nRCu0CTslSpFEwf9TGCyNrxPJ6YpQrYq9HkxObSkOYPyKLA/ZVIaviXM+E8l0DtGdhmcFhkpB7JmHpqiyB0i1tYfk5i6vHXCaUgRulyRI4XKc+sx8oSBIANkIngrDaW2qYUEVmEcqBesFbuX7+A3lwcEOGg2v9/+WgbeU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770390592;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hltLeAMZ0MGv2jyqGqd/sbIGh8h5TiimQqd1cAy1Sfc=; 
 b=g9kbUu7QRFJ3u/zd32pY41W6EnQ1UCHaWtGWK2XTl3kXEMCaxO+Lx5YLF4KdeygcqTyGXktTpJcsRekm6Amai5UxtVfKuggQvdc+LmI9oVcOYNY645Zx7z99sxlTSxpV2Lu3DxNqoMqEO4LJ/Eq/Yeb6a8gSMgzYRvkktiNfYSE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770390592; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=hltLeAMZ0MGv2jyqGqd/sbIGh8h5TiimQqd1cAy1Sfc=;
 b=Z3JPN1EgrL9EF/XTB2vEimuTisQUpwCZk5sxj191WCkuPfn9UNdyDS1nBpudmx1Q
 lb+85+aKuhH+qk8hwmnao/OdHqbSdVcapuhEnSvLfX6uErpFAVpB+1gSeRskUVW2h2M
 NisfgPRSZrBOXbO9dSMprBOgxR6gRn6FGGcispaweIgZeleBuLKVQh2O3rxotGX86OS
 ZxnJoZAm7GOCBcLY0TrnOdC/npZu774zJ9Su+WuL4ctx1bfiDZ3ja/fxH1SW8rA63c+
 JIiKk40v7kBR9AYI0vOu0uzArr8MguxE7Xbi8O0C9YzZ8d4lk6Yj5sZpWocGahdyZn6
 Vc6Z0sN0zQ==
Received: by mx.zohomail.com with SMTPS id 1770390589019803.0520420818741;
 Fri, 6 Feb 2026 07:09:49 -0800 (PST)
Message-ID: <8806eaf82fbef4cd51bb4e4bb44d60894b3504b4.camel@icenowy.me>
Subject: Re: [PATCH v2 3/3] drm/nuvoton: add MA35D1 display controller driver
From: Icenowy Zheng <uwu@icenowy.me>
To: Joey Lu <a0987203069@gmail.com>, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 06 Feb 2026 23:09:38 +0800
In-Reply-To: <20260129040532.382693-4-a0987203069@gmail.com>
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-4-a0987203069@gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:a0987203069@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,verisilicon.it:url,icenowy.me:mid,icenowy.me:dkim]
X-Rspamd-Queue-Id: A708CFF7EE
X-Rspamd-Action: no action

5ZyoIDIwMjYtMDEtMjnmmJ/mnJ/lm5vnmoQgMTI6MDUgKzA4MDDvvIxKb2V5IEx15YaZ6YGT77ya
Cj4gPT09PT09PT09PSA4PCA9PT09PT09PT09PT0KPiArI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9udXZvdG9uL21hMzVfcmVncy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0vbnV2
b3Rvbi9tYTM1X3JlZ3MuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MDAwLi4wZjRhN2ExM2U3ZDgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L251dm90b24vbWEzNV9yZWdzLmgKPiBAQCAtMCwwICsxLDg4IEBACj4gKy8qIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wKyAqLwo+ICsvKgo+ICsgKiBOdXZvdG9uIERSTSBkcml2ZXIK
PiArICoKPiArICogQ29weXJpZ2h0IChDKSAyMDI2IE51dm90b24gVGVjaG5vbG9neSBDb3JwLgo+
ICsgKgo+ICsgKiBBdXRob3I6IEpvZXkgTHUgPGEwOTg3MjAzMDY5QGdtYWlsLmNvbT4KPiArICov
Cj4gKwo+ICsjaWZuZGVmIF9NQTM1X1JFR1NfSF8KPiArI2RlZmluZSBfTUEzNV9SRUdTX0hfCj4g
Kwo+ICsjZGVmaW5lIE1BMzVfRlJBTUVCVUZGRVJfQ09ORklHwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDB4MTUxOAoKUGxlYXNlIGNoZWNrIG15IFZlcmlzaWxpY29uIERDODIw
MCBkcml2ZXIsIHdoaWNoIGlzIGFscmVhZHkgcGFydCBvZgpkcm0tbWlzYy1uZXh0IG5vdy4KClRo
ZSBkaXNwbGF5IGNvbnRyb2xsZXIgaGVyZSBzZWVtcyB0byBiZSBhIGVhcmxpZXIgb25lIGZyb20K
VmVyaXNpbGljb24uaXQgbG9va3MgbGlrZSBhIERDODAwMCwgb3IgbWF5YmUgYSBtb3JlIGVhcmxp
ZXIgb25lPwoKPiArI2RlZmluZSBNQTM1X0ZSQU1FQlVGRkVSX0FERFJFU1PCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTQwMAo+ICsjZGVmaW5lIE1BMzVfRlJBTUVCVUZGRVJf
U1RSSURFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTQwOAo+ICsjZGVm
aW5lIE1BMzVfSERJU1BMQVnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAweDE0MzAKPiArI2RlZmluZSBNQTM1X0hTWU5DwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxNDM4
Cj4gKyNkZWZpbmUgTUEzNV9WRElTUExBWcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTQ0MAo+ICsjZGVmaW5lIE1BMzVfVlNZTkPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAweDE0NDgKPiArI2RlZmluZSBNQTM1X1BBTkVMX0NPTkZJR8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE0MTgKPiArI2RlZmluZSBNQTM1X0RQSV9D
T05GSUfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDB4MTRCOAo+ICsjZGVmaW5lIE1BMzVfQ1VSU09SX0FERFJFU1PCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE0NkMKPiArI2RlZmluZSBNQTM1X0NVUlNPUl9D
T05GSUfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTQ2
OAo+ICsjZGVmaW5lIE1BMzVfQ1VSU09SX0xPQ0FUSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDB4MTQ3MAo+ICsjZGVmaW5lIE1BMzVfQ1VSU09SX0JBQ0tHUk9V
TkTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE0NzQKPiArI2RlZmlu
ZSBNQTM1X0NVUlNPUl9GT1JFR1JPVU5EwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgMHgxNDc4Cj4gKyNkZWZpbmUgTUEzNV9GUkFNRUJVRkZFUl9VUExBTkFSX0FERFJFU1PC
oMKgwqDCoMKgwqDCoMKgwqAgMHgxNTMwCj4gKyNkZWZpbmUgTUEzNV9GUkFNRUJVRkZFUl9WUExB
TkFSX0FERFJFU1PCoMKgwqDCoMKgwqDCoMKgwqAgMHgxNTM4Cj4gKyNkZWZpbmUgTUEzNV9GUkFN
RUJVRkZFUl9VU1RSSURFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE4MDAK
PiArI2RlZmluZSBNQTM1X0ZSQU1FQlVGRkVSX1ZTVFJJREXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDB4MTgwOAo+ICsjZGVmaW5lIE1BMzVfSU5ERVhDT0xPUl9UQUJMRUlOREVY
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTgxOAo+ICsjZGVmaW5lIE1BMzVfSU5E
RVhDT0xPUl9UQUJMRURBVEHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE4MjAK
PiArI2RlZmluZSBNQTM1X0ZSQU1FQlVGRkVSX1NJWkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDB4MTgxMAo+ICsjZGVmaW5lIE1BMzVfRlJBTUVCVUZGRVJfU0NBTEVG
QUNUT1JYwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTgyOAo+ICsjZGVmaW5lIE1BMzVfRlJB
TUVCVUZGRVJfU0NBTEVGQUNUT1JZwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTgzMAo+ICsj
ZGVmaW5lIE1BMzVfRlJBTUVCVUZGRVJfU0NBTEVGQ09ORklHwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDB4MTUyMAo+ICsjZGVmaW5lIE1BMzVfSE9SSUZJTFRFUl9LRVJORUxJTkRFWMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxODM4Cj4gKyNkZWZpbmUgTUEzNV9IT1JJRklMVEVSX0tF
Uk5FTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MUEwMAo+ICsjZGVm
aW5lIE1BMzVfVkVSVElGSUxURVJfS0VSTkVMSU5ERVjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAweDFBMDgKPiArI2RlZmluZSBNQTM1X1ZFUlRJRklMVEVSX0tFUk5FTMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDFBMTAKPiArI2RlZmluZSBNQTM1X0ZSQU1FQlVGRkVS
X0lOSVRJQUxPRkZTRVTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MUEyMAo+ICsjZGVmaW5lIE1B
MzVfRlJBTUVCVUZGRVJfQ09MT1JLRVnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAw
eDE1MDgKPiArI2RlZmluZSBNQTM1X0ZSQU1FQlVGRkVSX0NPTE9SSElHSEtFWcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAweDE1MTAKPiArI2RlZmluZSBNQTM1X0ZSQU1FQlVGRkVSX0JHQ09MT1LC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTUyOAo+ICsjZGVmaW5lIE1BMzVf
RlJBTUVCVUZGRVJfQ0xFQVJWQUxVRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxQTE4
Cj4gKyNkZWZpbmUgTUEzNV9ESVNQTEFZX0lOVFJFTkFCTEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMHgxNDgwCj4gKyNkZWZpbmUgTUEzNV9JTlRfU1RBVEXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxNDdDCj4gKyNk
ZWZpbmUgTUEzNV9QQU5FTF9ERVNUX0FERFJFU1PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMHgxNEYwCj4gKyNkZWZpbmUgTUEzNV9NRU1fREVTVF9BRERSRVNTwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE0RTgKPiArI2RlZmluZSBNQTM1X0RF
U1RfQ09ORklHwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMHgxNEY4Cj4gKyNkZWZpbmUgTUEzNV9ERVNUX1NUUklERcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTUwMAo+ICsjZGVmaW5lIE1BMzVfREJJ
X0NPTkZJR8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMHgxNDg4Cj4gKyNkZWZpbmUgTUEzNV9BUUhJQ0xPQ0tDT05UUk9MwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAwMDAKPiArI2RlZmluZSBNQTM1X09WRVJMQVlf
Q09ORklHwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxNTQw
Cj4gKyNkZWZpbmUgTUEzNV9PVkVSTEFZX1NUUklERcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDB4MTYwMAo+ICsjZGVmaW5lIE1BMzVfT1ZFUkxBWV9VU1RSSURF
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MThDMAo+ICsjZGVm
aW5lIE1BMzVfT1ZFUkxBWV9WU1RSSURFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDB4MTkwMAo+ICsjZGVmaW5lIE1BMzVfT1ZFUkxBWV9UTMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxNjQwCj4gKyNkZWZpbmUg
TUEzNV9PVkVSTEFZX0JSwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAweDE2ODAKPiArI2RlZmluZSBNQTM1X09WRVJMQVlfQUxQSEFfQkxFTkRfQ09O
RklHwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxNTgwCj4gKyNkZWZpbmUgTUEzNV9PVkVSTEFZX1NS
Q19HTE9CQUxfQ09MT1LCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxNkMwCj4gKyNkZWZpbmUg
TUEzNV9PVkVSTEFZX0RTVF9HTE9CQUxfQ09MT1LCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgx
NzAwCj4gKyNkZWZpbmUgTUEzNV9PVkVSTEFZX0NMRUFSX1ZBTFVFwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAweDE5NDAKPiArI2RlZmluZSBNQTM1X09WRVJMQVlfU0laRcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE3QzAKPiArI2Rl
ZmluZSBNQTM1X09WRVJMQVlfQ09MT1JfS0VZwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMHgxNzQwCj4gKyNkZWZpbmUgTUEzNV9PVkVSTEFZX0NPTE9SX0tFWV9ISUdIwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE3ODAKPiArI2RlZmluZSBNQTM1X09WRVJMQVlf
QUREUkVTU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE1QzAK
PiArI2RlZmluZSBNQTM1X09WRVJMQVlfVVBMQU5BUl9BRERSRVNTwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMHgxODQwCj4gKyNkZWZpbmUgTUEzNV9PVkVSTEFZX1ZQTEFOQVJfQUREUkVTU8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTg4MAo+ICsjZGVmaW5lIE1BMzVfT1ZFUkxBWV9T
Q0FMRV9DT05GSUfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDFDMDAKPiArI2Rl
ZmluZSBNQTM1X09WRVJMQVlfU0NBTEVfRkFDVE9SX1jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDB4MUE0MAo+ICsjZGVmaW5lIE1BMzVfT1ZFUkxBWV9TQ0FMRV9GQUNUT1JfWcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxQTgwCj4gKyNkZWZpbmUgTUEzNV9PVkVSTEFZX0hPUklf
RklMVEVSX0tFUk5FTF9JTkRFWMKgwqDCoMKgIDB4MUFDMAo+ICsjZGVmaW5lIE1BMzVfT1ZFUkxB
WV9IT1JJX0ZJTFRFUl9LRVJORUzCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDFCMDAKPiArI2RlZmlu
ZSBNQTM1X09WRVJMQVlfVkVSVElfRklMVEVSX0tFUk5FTF9JTkRFWMKgwqDCoCAweDFCNDAKPiAr
I2RlZmluZSBNQTM1X09WRVJMQVlfVkVSVElfRklMVEVSX0tFUk5FTMKgwqDCoMKgwqDCoMKgwqDC
oCAweDFCODAKPiArI2RlZmluZSBNQTM1X09WRVJMQVlfSU5JVElBTF9PRkZTRVTCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDB4MUJDMAo+ICsjZGVmaW5lIE1BMzVfR0FNTUFfRVhfSU5ERVjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDFDRjAKPiArI2Rl
ZmluZSBNQTM1X0dBTU1BX0VYX0RBVEHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDB4MUNGOAo+ICsjZGVmaW5lIE1BMzVfR0FNTUFfRVhfT05FX0RBVEHCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDFEODAKPiArI2RlZmluZSBNQTM1
X0dBTU1BX0lOREVYwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgMHgxNDU4Cj4gKyNkZWZpbmUgTUEzNV9HQU1NQV9EQVRBwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE0NjAKPiArI2RlZmluZSBNQTM1
X0RJU1BMQVlfRElUSEVSX1RBQkxFX0xPV8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE0MjAK
PiArI2RlZmluZSBNQTM1X0RJU1BMQVlfRElUSEVSX1RBQkxFX0hJR0jCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDB4MTQyOAo+ICsjZGVmaW5lIE1BMzVfRElTUExBWV9ESVRIRVJfQ09ORklHwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTQxMAo+ICsjZGVmaW5lIE1BMzVfRElTUExBWV9D
VVJSRU5UX0xPQ0FUSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTQ1MAo+ICsKPiArI2Vu
ZGlmCgo=

