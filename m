Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFU4KpvscWl6ZAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:23:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1413F64794
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32BB10E048;
	Thu, 22 Jan 2026 09:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="bKWJKpx0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9637B10E966
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769073813; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=L5ltR3k8MjdtR1ZQ8aRPu69Epk7gd7HZtE1AD5dIjQ0cbeCmWnrWI6qBb65Vt1wgYY2Lbm7CYdjefv2QNa6EHpoWtgtUeaPgj1DuqOEX43z0VNjP8pX9icVg7OQZJJ+f31J5x/LtFH3soFIyYCi31CTGdzvfFFeCayTYFRhA1ao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769073813;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IbHVXj6EvAWyURsulZzgey0tLztYqyj+R+Rd9hYsBrc=; 
 b=htAo9voUbgFxgQG61stO0SFnTkj0nlqotAdPWTac3m8dqlZMmu/DEMFbs2w1POKl2HSQRRXPR4ztk/kw6C/oO9sp8r6P4js3bPpW6v3m55X3ljJ8ZsAhv3rnR0Rj63iWvc6nxxciXDMOGzPqmkd0z4ORHRMONxOzKfIy+j+FKd4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769073813; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=IbHVXj6EvAWyURsulZzgey0tLztYqyj+R+Rd9hYsBrc=;
 b=bKWJKpx0fwl7w/YxbvSVEY9bRDoHS6lyQLO7tmoMgKEXx6NZ//TN+M7ICQSxEGg2
 O8Yms5iNLDNx7iivDhsAGvn5uN9u/uySdDSkSSM4zqE+Jr372RReBf/7LR1DUP4dIIW
 xaK90MateKJgRYQzdPMxNaIh9YV6GCDB9DvURJ1mVLaZ0kawVzQ4wmUqKHsJg7sgj7B
 q4hVsGW5RYFkaS6H5m3WO2ECW7CVg/6B7QcXa9inqNR2SdgzdopTsr9kBCYFfqSvXju
 igID6g9O2mgIet02OBgfa7I7qZ8pfx2lK2b2l+fxhBAwHiEbUvwAwi0q1bezyHQAMIq
 XVBZ3r28nw==
Received: by mx.zohomail.com with SMTPS id 1769073810256448.23819699193325;
 Thu, 22 Jan 2026 01:23:30 -0800 (PST)
Message-ID: <0eb4b6ba8ef3b47cd28eb8d652b05eb5a6d1409c.camel@icenowy.me>
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
Date: Thu, 22 Jan 2026 17:23:15 +0800
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
X-Rspamd-Queue-Id: 1413F64794
X-Rspamd-Action: no action

5ZyoIDIwMjYtMDEtMjHmmJ/mnJ/kuInnmoQgMTM6NTYgKzAxMDDvvIxUaG9tYXMgWmltbWVybWFu
buWGmemBk++8mgoKPT09PT09PT09PT09PT09IDg8ID09PT09PT09PT09PT09PT09PT0KPiA+ICsK
PiA+ICvCoMKgwqDCoMKgwqDCoGRldl9pbmZvKGRldiwgIkRDJXggcmV2ICV4IGN1c3RvbWVyICV4
XG4iLCBkYy0KPiA+ID5pZGVudGl0eS5tb2RlbCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGMtPmlkZW50aXR5LnJldmlzaW9uLCBkYy0+aWRlbnRpdHkuY3VzdG9tZXJfaWQp
Owo+IAo+IGRybV9kYmcoKS7CoCBEcml2ZXJzIHNob3VsZCBiZSBxdWl0ZSBieSBkZWZhdWx0LgoK
V2VsbCBmb3IgdGhpcyBraW5kIG9mIGlkZW50aWZpY2F0aW9uIGluZm9ybWF0aW9uIEkgdGhpbmsg
ZHJpdmVyIGlzCnVzdWFsbHkgbm90IHF1aWV0LCBhdCBsZWFzdCBhbWRncHUgKHdoZW4gZG9pbmcg
SVAgZGlzY292ZXJ5KSwgcGFuZnJvc3QKYW5kIGV0bmF2aXYgKHdoaWNoIHNoYXJlcyB0aGUgc2Ft
ZSBzZXQgb2YgaWRlbnRpZmljYXRpb24gcmVnaXN0ZXJzIHdpdGgKdGhpcyBkcml2ZXIpIGlzIHJl
cG9ydGluZyBpdC4KCj4gCj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocG9ydF9jb3VudCA+
IGRjLT5pZGVudGl0eS5kaXNwbGF5X2NvdW50KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZGV2X2VycihkZXYsICJ0b28gbWFueSBkb3duc3RyZWFtIHBvcnRzIHRoYW4gSFcK
PiA+IGNhcGFiaWxpdHlcbiIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dCA9IC1FSU5WQUw7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJf
cnN0X2Fzc2VydDsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPT09PT09PT09PT09PT09IDg8
ID09PT09PT09PT09PT09PT09PT0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghc3RhdGUt
PnZpc2libGUgfHwgIWZiKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVn
bWFwX3dyaXRlKGRjLT5yZWdzLCBWU0RDX0ZCX0NPTkZJRyhvdXRwdXQpLCAwKTsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWdtYXBfd3JpdGUoZGMtPnJlZ3MsIFZTRENfRkJf
Q09ORklHX0VYKG91dHB1dCksCj4gPiAwKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBnb3RvIGNvbW1pdDsKPiA+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnbWFwX3NldF9iaXRzKGRjLT5yZWdzLAo+ID4gVlNE
Q19GQl9DT05GSUdfRVgob3V0cHV0KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFZTRENfRkJfQ09ORklHX0VYX0ZCX0VO
KTsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiAKPiBTaW5jZSB5b3UgaGFuZGxlIHRoZSBwbGFuZSBv
bi9wbGFuZSBvZmYgY2FzZXMgaGVyZSwgSSdkIGFkdmlzZSB0byAKPiBpbXBsZW1lbnQgYXRvbWlj
X2VuYWJsZSBhbmQgYXRvbWljX2Rpc2FibGUgZm9yIHRoZSBwbGFuZSwgaWYgdGhlIAo+IGhhcmR3
YXJlIGFsbG93cyBpdC4gKFRoZXJlIGlzIGhhcmR3YXJlIHdlcmUgdGhlIGN1cnJlbnQgcGF0dGVy
biBtYWtlcwo+IHNlbnNlIHRob3VnaC4pCgpJZiBhdG9taWNfKmFibGUgaXMgZ29pbmcgdG8gYmUg
aW1wbGVtZW50ZWQsIHNob3VsZCBhdG9taWNfdXBkYXRlKCkga2VlcAp0aGUgcGxhbmUgb24vb2Zm
IGNvZGU/CgpCVFcgaXQgc2VlbXMgdGhhdCBEQzgyMDAgaGFzIHRoZSBzaGFkb3cgcmVnaXN0ZXIg
Y2FwYWJpbGl0eSB0aGF0IGNvdWxkCmJlIG1hbnVhbGx5IGNvbW1pdGVkIGJ1dCB0aGUgb2xkZXIg
REM4MDAwIGhhcyBubyAodGhlClZTRENfRkJfQ09ORklHX0VYX0NPTU1JVCBiaXQgd3JpdHRlbiBi
ZWxvdyBpcyBhIG5ldyB0aGluZykgLS0gdGhlClZTRENfRkJfQ09ORklHIHJlZ2lzdGVyIG9uIERD
ODAwMCBoYXMgYSB3cml0ZS1vbmx5IGJpdCB0aGF0IHdoZW4Kd3JpdHRlbiB3aXRoIDAgdGhlIGRp
c3BsYXkgaXMgcHV0IHRvIHJlc2V0IGFuZCB3aGVuIHdyaXR0ZW4gd2l0aCAxIHRoZQpkaXNwbGF5
IHdpbGwgc3RhcnQgdG8gcnVuLiBUaGlzIHBhdHRlcm4gc2VlbXMgdG8gYmUgbm90IGFibGUgdG8g
a2VlcAp0aGUgZW5hYmxlZCBzdGF0ZSB3aGlsZSBwcm9ncmFtbWluZyAoYXQgbGVhc3QgcGFydCBv
ZikgbmV3IHBsYW5lCmNvbmZpZ3VyYXRpb24sIHNlZSBbMV0uCgpbMV0KaHR0cHM6Ly9naXRodWIu
Y29tL21pbGt2LW1lZ3Jlei9yb2Nrb3MtdS1ib290L2Jsb2IvYzkyMjFjZjJmYTc3ZDM5YzBiMjQx
YWI0YjAzMGM3MDhlN2ViZTI3OS9kcml2ZXJzL3ZpZGVvL2Vzd2luL2Vzd2luX2RjX3JlZy5oI0wz
NTc5Cgo+IAo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgZHJtX2Zvcm1hdF90b192c19mb3JtYXQo
c3RhdGUtPmZiLT5mb3JtYXQtPmZvcm1hdCwgJmZtdCk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKg
wqByZWdtYXBfdXBkYXRlX2JpdHMoZGMtPnJlZ3MsIFZTRENfRkJfQ09ORklHKG91dHB1dCksCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVlNE
Q19GQl9DT05GSUdfRk1UX01BU0ssCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgVlNEQ19GQl9DT05GSUdfRk1UKGZtdC5jb2xvcikpOwo+ID4g
K8KgwqDCoMKgwqDCoMKgcmVnbWFwX3VwZGF0ZV9iaXRzKGRjLT5yZWdzLCBWU0RDX0ZCX0NPTkZJ
RyhvdXRwdXQpLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFZTRENfRkJfQ09ORklHX1NXSVpaTEVfTUFTSywKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBWU0RDX0ZCX0NPTkZJR19TV0la
WkxFKGZtdC5zd2l6emxlKSk7Cj4gPiArwqDCoMKgwqDCoMKgwqByZWdtYXBfYXNzaWduX2JpdHMo
ZGMtPnJlZ3MsIFZTRENfRkJfQ09ORklHKG91dHB1dCksCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVlNEQ19GQl9DT05GSUdfVVZfU1dJWlpM
RV9FTiwKPiA+IGZtdC51dl9zd2l6emxlKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIEdl
dCB0aGUgcGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgYnVmZmVyIGluIG1lbW9yeSAqLwo+ID4gK8Kg
wqDCoMKgwqDCoMKgZ2VtID0gZHJtX2ZiX2RtYV9nZXRfZ2VtX29iaihmYiwgMCk7Cj4gPiArCj4g
PiArwqDCoMKgwqDCoMKgwqAvKiBDb21wdXRlIHRoZSBzdGFydCBvZiB0aGUgZGlzcGxheWVkIG1l
bW9yeSAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgYnBwID0gZmItPmZvcm1hdC0+Y3BwWzBdOwo+ID4g
K8KgwqDCoMKgwqDCoMKgZG1hX2FkZHIgPSBnZW0tPmRtYV9hZGRyICsgZmItPm9mZnNldHNbMF07
Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAvKiBGaXh1cCBmcmFtZWJ1ZmZlciBhZGRyZXNzIGZv
ciBzcmMgY29vcmRpbmF0ZXMgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoGRtYV9hZGRyICs9IChzdGF0
ZS0+c3JjLngxID4+IDE2KSAqIGJwcDsKPiAKPiBicHAgaXMgZGVwcmVjYXRlZCBhbmQgc2hvdWxk
IGJlIGF2b2lkZWQgaW4gbmV3IGNvZGUuIFlvdSBjYW4gY29tcHV0ZQo+IHRoZSAKPiBvZmZzZXQg
d2l0aCBkcm1fZm9ybWF0X21pbl9waXRjaCgpOgo+IAo+IGRybV9mb3JtYXRfbWluX3BpdGNoKGZi
LT5mb3JtYXQsIDAsIHN0YXRlLT5zcmMueDEgPj4gMTYgKQo+IAo+IEJlc3QgcmVnYXJkcwo+IFRo
b21hcwo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgZG1hX2FkZHIgKz0gKHN0YXRlLT5zcmMueTEgPj4g
MTYpICogZmItPnBpdGNoZXNbMF07Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqByZWdtYXBfd3Jp
dGUoZGMtPnJlZ3MsIFZTRENfRkJfQUREUkVTUyhvdXRwdXQpLAo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvd2VyXzMyX2JpdHMoZG1hX2FkZHIpKTsKPiA+ICvC
oMKgwqDCoMKgwqDCoHJlZ21hcF93cml0ZShkYy0+cmVncywgVlNEQ19GQl9TVFJJREUob3V0cHV0
KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYi0+cGl0Y2hl
c1swXSk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqByZWdtYXBfd3JpdGUoZGMtPnJlZ3MsIFZT
RENfRkJfVE9QX0xFRlQob3V0cHV0KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBWU0RDX01BS0VfUExBTkVfUE9TKHN0YXRlLT5jcnRjX3gsIHN0YXRlLQo+ID4g
PmNydGNfeSkpOwo+ID4gK8KgwqDCoMKgwqDCoMKgcmVnbWFwX3dyaXRlKGRjLT5yZWdzLCBWU0RD
X0ZCX0JPVFRPTV9SSUdIVChvdXRwdXQpLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFZTRENfTUFLRV9QTEFORV9QT1Moc3RhdGUtPmNydGNfeCArIHN0YXRlLQo+
ID4gPmNydGNfdywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdGUtPmNydGNfeSArIHN0
YXRlLQo+ID4gPmNydGNfaCkpOwo+ID4gK8KgwqDCoMKgwqDCoMKgcmVnbWFwX3dyaXRlKGRjLT5y
ZWdzLCBWU0RDX0ZCX1NJWkUob3V0cHV0KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBWU0RDX01BS0VfUExBTkVfU0laRShzdGF0ZS0+Y3J0Y193LCBzdGF0ZS0K
PiA+ID5jcnRjX2gpKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJlZ21hcF93cml0ZShkYy0+
cmVncywgVlNEQ19GQl9CTEVORF9DT05GSUcob3V0cHV0KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBWU0RDX0ZCX0JMRU5EX0NPTkZJR19CTEVORF9ESVNBQkxF
KTsKPiA+ICtjb21taXQ6Cj4gPiArwqDCoMKgwqDCoMKgwqByZWdtYXBfc2V0X2JpdHMoZGMtPnJl
Z3MsIFZTRENfRkJfQ09ORklHX0VYKG91dHB1dCksCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFZTRENfRkJfQ09ORklHX0VYX0NPTU1JVCk7Cj4gPiAr
fQo+ID4gKwo9PT09PT09PT09PT09PT0gODwgPT09PT09PT09PT09PT09PT09PQo=

