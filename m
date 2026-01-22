Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCr+OELycWmvZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:47:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429FF64C57
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65FD10E96E;
	Thu, 22 Jan 2026 09:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="cD+4yMkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58C810E04C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:47:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769075260; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NmW93cmjM/+j+hM+wZK5y4eQLWOLm64Nz9ojwrChvJsLjlhyBFHz3ee49Qhbhnu1nH++FGcz07qoJx6oXxIBWvyieEFw56yRrssoGZPATp76EJpgbYE4lwhMzfq9/dOk0MvakTYYHx9yGxq4zOe83rzWSKNlxz8FuQJrqmTHJJw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769075260;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9w3yuU3WlAYbiHJ1EXGxjW9Zlg3UpYdlbJ8SL5HYfBE=; 
 b=CByadPfQm2KVMpVYEd/U7dF/riNM0QsG9t0YvFbEZxy8UmG2C2N6IQXZWuOUw3pMPc72Rawer45H9/kUBrhWI4B9//NtF8LtS/bSWKgqnw9WbigvE+3yjYvCSZwJAU3Oq9VxYm1FuFaLqJPu6+XWJ4pUfT0AmfPh/1znrDqjgEA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769075260; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=9w3yuU3WlAYbiHJ1EXGxjW9Zlg3UpYdlbJ8SL5HYfBE=;
 b=cD+4yMkUSrVPLC9RCPknQcmJj5FAaki4N/5fAf9RtKbNI8cFB/99GcguJikYbNwD
 LSKWeWYx3bwT15eeGllIkj9xrofbJuzWHq58oO8XwlF5VvCGHIjKTP8/SnjPcVFxgox
 vBi5vdIixi1l0+lKmv5yLL09fhzf6gWLQP1OndzrzNkrT/O6zEzWyVbLHTFVLCA6/xS
 sXWb+ZuEr2wzoZiP1fWZYETSPs9wqu9Mloz78keYh7elAq7dfN53VOiBVUlSSt9TTok
 vRxOy8jUPUM5Kls1+Eq3wxoG1VHctXXbiYRR8Q36hKtDCDM4l0uMkFjVDGCaHcWNuf0
 VYVtO3sXFg==
Received: by mx.zohomail.com with SMTPS id 1769075259007389.09373127752656;
 Thu, 22 Jan 2026 01:47:39 -0800 (PST)
Message-ID: <7bffdc45628fec9dd8175f696d3a68aa1e12f0a2.camel@icenowy.me>
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,  Yao
 Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Jan 2026 17:47:26 +0800
In-Reply-To: <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
 <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
 <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
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
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:gaohan@iscas.ac.cn,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,iscas.ac.cn];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[icenowy.me:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,icenowy.me:mid,icenowy.me:dkim]
X-Rspamd-Queue-Id: 429FF64C57
X-Rspamd-Action: no action

5ZyoIDIwMjYtMDEtMjHmmJ/mnJ/kuInnmoQgMTM6NTYgKzAxMDDvvIxUaG9tYXMgWmltbWVybWFu
buWGmemBk++8mgoKPT09PT09PT09PT09PT09PT09PSA4PCA9PT09PT09PT09PT09PT09PT09PQo+
ID4gK3ZvaWQgZHJtX2Zvcm1hdF90b192c19mb3JtYXQodTMyIGRybV9mb3JtYXQsIHN0cnVjdCB2
c19mb3JtYXQKPiA+ICp2c19mb3JtYXQpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgc3dpdGNo
IChkcm1fZm9ybWF0KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfWFJHQjQ0
NDQ6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfUkdCWDQ0NDQ6Cj4gPiArwqDC
oMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfWEJHUjQ0NDQ6Cj4gPiArwqDCoMKgwqDCoMKgwqBj
YXNlIERSTV9GT1JNQVRfQkdSWDQ0NDQ6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgdnNfZm9ybWF0LT5jb2xvciA9IFZTRENfQ09MT1JfRk9STUFUX1g0UjRHNEI0Owo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gK8KgwqDCoMKgwqDCoMKgY2Fz
ZSBEUk1fRk9STUFUX0FSR0I0NDQ0Ogo+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFU
X1JHQkE0NDQ0Ogo+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0FCR1I0NDQ0Ogo+
ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0JHUkE0NDQ0Ogo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZzX2Zvcm1hdC0+Y29sb3IgPSBWU0RDX0NPTE9SX0ZPUk1B
VF9BNFI0RzRCNDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+
ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YUkdCMTU1NToKPiA+ICvCoMKgwqDCoMKg
wqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JYNTU1MToKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJN
X0ZPUk1BVF9YQkdSMTU1NToKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9CR1JY
NTU1MToKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2c19mb3JtYXQtPmNvbG9y
ID0gVlNEQ19DT0xPUl9GT1JNQVRfWDFSNUc1QjU7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQVJHQjE1
NTU6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfUkdCQTU1NTE6Cj4gPiArwqDC
oMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJHUjE1NTU6Cj4gPiArwqDCoMKgwqDCoMKgwqBj
YXNlIERSTV9GT1JNQVRfQkdSQTU1NTE6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgdnNfZm9ybWF0LT5jb2xvciA9IFZTRENfQ09MT1JfRk9STUFUX0ExUjVHNUI1Owo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gK8KgwqDCoMKgwqDCoMKgY2Fz
ZSBEUk1fRk9STUFUX1JHQjU2NToKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9C
R1I1NjU6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdnNfZm9ybWF0LT5jb2xv
ciA9IFZTRENfQ09MT1JfRk9STUFUX1I1RzZCNTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBicmVhazsKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YUkdCODg4
ODoKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JYODg4ODoKPiA+ICvCoMKg
wqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YQkdSODg4ODoKPiA+ICvCoMKgwqDCoMKgwqDCoGNh
c2UgRFJNX0ZPUk1BVF9CR1JYODg4ODoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB2c19mb3JtYXQtPmNvbG9yID0gVlNEQ19DT0xPUl9GT1JNQVRfWDhSOEc4Qjg7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNl
IERSTV9GT1JNQVRfQVJHQjg4ODg6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRf
UkdCQTg4ODg6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJHUjg4ODg6Cj4g
PiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSQTg4ODg6Cj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgdnNfZm9ybWF0LT5jb2xvciA9IFZTRENfQ09MT1JfRk9STUFU
X0E4UjhHOEI4Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4g
K8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9STUFUX0FSR0IyMTAxMDEwOgo+ID4gK8KgwqDCoMKg
wqDCoMKgY2FzZSBEUk1fRk9STUFUX1JHQkExMDEwMTAyOgo+ID4gK8KgwqDCoMKgwqDCoMKgY2Fz
ZSBEUk1fRk9STUFUX0FCR1IyMTAxMDEwOgo+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBEUk1fRk9S
TUFUX0JHUkExMDEwMTAyOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZzX2Zv
cm1hdC0+Y29sb3IgPSBWU0RDX0NPTE9SX0ZPUk1BVF9BMlIxMEcxMEIxMDsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+ICvCoMKgwqDCoMKgwqDCoGRlZmF1bHQ6
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRFJNX1dBUk4oIlVuZXhwZWN0ZWQg
ZHJtIGZvcm1hdCFcbiIpOwo+IAo+IGRybV93YXJuKCkuIElmIHRoaXMgY2FuIGJlIGludm9rZWQg
ZnJvbSB1c2VyIHNwYWNlLGVhc2lseSwgYmV0dGVyIHVzZQo+IGRybV9kYmcoKQoKVGhpcyBmdW5j
dGlvbiBpcyBjYWxsZWQgZHVyaW5nIGF0b21pY191cGRhdGUgb2YgcGxhbmVzLCBhbmQgSSB0aGlu
ayBpbgp0aGlzIGNhc2UgdGhlIHVua25vd24gZm9ybWF0cyBzaG91bGQgYWxyZWFkeSBiZSByZWpl
Y3RlZCBiZWNhdXNlCnRoZXkncmUgbm90IGFkdmVydGlzZWQgZm9yIGFueSBwbGFuZXMuCgpEaWQg
SSBnZXQgaXQgcmlnaHQgb24gdGhpcz8KCj4gCj4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gPiArCj4g
PiArwqDCoMKgwqDCoMKgwqBzd2l0Y2ggKGRybV9mb3JtYXQpIHsKPiA+ICvCoMKgwqDCoMKgwqDC
oGNhc2UgRFJNX0ZPUk1BVF9SR0JYNDQ0NDoKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZP
Uk1BVF9SR0JBNDQ0NDoKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JYNTU1
MToKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JBNTU1MToKPiA+ICvCoMKg
wqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9SR0JYODg4ODoKPiA+ICvCoMKgwqDCoMKgwqDCoGNh
c2UgRFJNX0ZPUk1BVF9SR0JBODg4ODoKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1B
VF9SR0JBMTAxMDEwMjoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2c19mb3Jt
YXQtPnN3aXp6bGUgPSBWU0RDX1NXSVpaTEVfUkdCQTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBicmVhazsKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YQkdS
NDQ0NDoKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9BQkdSNDQ0NDoKPiA+ICvC
oMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZPUk1BVF9YQkdSMTU1NToKPiA+ICvCoMKgwqDCoMKgwqDC
oGNhc2UgRFJNX0ZPUk1BVF9BQkdSMTU1NToKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRFJNX0ZP
Uk1BVF9CR1I1NjU6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfWEJHUjg4ODg6
Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJHUjg4ODg6Cj4gPiArwqDCoMKg
wqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQUJHUjIxMDEwMTA6Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgdnNfZm9ybWF0LT5zd2l6emxlID0gVlNEQ19TV0laWkxFX0FCR1I7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKg
wqBjYXNlIERSTV9GT1JNQVRfQkdSWDQ0NDQ6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9G
T1JNQVRfQkdSQTQ0NDQ6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSWDU1
NTE6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSQTU1NTE6Cj4gPiArwqDC
oMKgwqDCoMKgwqBjYXNlIERSTV9GT1JNQVRfQkdSWDg4ODg6Cj4gPiArwqDCoMKgwqDCoMKgwqBj
YXNlIERSTV9GT1JNQVRfQkdSQTg4ODg6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9GT1JN
QVRfQkdSQTEwMTAxMDI6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdnNfZm9y
bWF0LT5zd2l6emxlID0gVlNEQ19TV0laWkxFX0JHUkE7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIE4vQSBmb3IgWVVWIGZvcm1hdHMgKi8KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2c19mb3JtYXQtPnN3aXp6bGUgPSBWU0RDX1NX
SVpaTEVfQVJHQjsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDC
oC8qIE4vQSBmb3Igbm9uLVlVViBmb3JtYXRzICovCj4gPiArwqDCoMKgwqDCoMKgwqB2c19mb3Jt
YXQtPnV2X3N3aXp6bGUgPSBmYWxzZTsKPiA+ICt9Cg==

