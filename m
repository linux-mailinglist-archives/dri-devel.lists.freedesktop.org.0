Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO5iLP/NjmlYFAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 08:08:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94182133664
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 08:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B9C10E79B;
	Fri, 13 Feb 2026 07:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="LxssWcge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF97810E79B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 07:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=dnmsuRPgnKCsUILPW+QojxZQhQYSal/NWozXZ/TUwRU=; b=L
 xssWcgexiUWpxvlhsK6Cx0Ano5Yl7WLP644JJFBCgiZBJGpRyfvvAKUAr6ACPV+V
 6GLztXJeHyTcSwdIF/zkOzPFLHbFVRViKn18n7uOmf7IC8M0+mLQZ/h3D3UtgDzE
 HBYMWYX4FJrWICA9cCnHbp3B8i+DuADLN5fKksAWhM=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-136 (Coremail) ; Fri, 13 Feb 2026 15:07:54 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 13 Feb 2026 15:07:54 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Sandy Huang" <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>,
 "Haneen Mohammed" <hamohammed.sa@gmail.com>,
 "Melissa Wen" <melissa.srw@gmail.com>,
 "Robert Mader" <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re:Re: [PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <67fb66b7-eee7-4109-8127-385593e88425@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
 <2750b73.10b0.19ba61052c8.Coremail.andyshrk@163.com>
 <9e4c8514-63e9-4ff7-85b1-b5af7dff9a2d@collabora.com>
 <67fb66b7-eee7-4109-8127-385593e88425@collabora.com>
X-CM-CTRLMSGS: 2tI/YHBsdXM9MTc3MDk2NjQ3MzgzM18yNmE0NDE0ZTE4ZjU3NWY3YmQzN2ZmZ
 jQyY2U5ZTYyOQ==
X-NTES-SC: AL_Qu2cAvWduUws4iaeZOkfmUgWjuw/WsG1v/Ul1YBSP556jCnr5x0aRV1hGUrS/tKPJxKisyadUBxX49ZlWK92fa4scpLAqig+KXXFVQ6i7bRmRw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <539febc7.2cf9.19c55d3dfb0.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iCgvCgD3n_3KzY5pp4hqAA--.64472W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7gqjAmmOzcrD+QAA3f
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
X-Spamd-Result: default: False [1.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:cristian.ciocaltea@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 94182133664
X-Rspamd-Action: no action

SGVsbG8gQ3Jpc3RpYW7vvIwKCkF0IDIwMjYtMDEtMTYgMjM6MjI6MTEsICJDcmlzdGlhbiBDaW9j
YWx0ZWEiIDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj5PbiAxLzEw
LzI2IDExOjU4IEFNLCBDcmlzdGlhbiBDaW9jYWx0ZWEgd3JvdGU6Cj4+IEhpIEFuZHksCj4+IAo+
PiBPbiAxLzEwLzI2IDY6MDAgQU0sIEFuZHkgWWFuIHdyb3RlOgo+Pj4KPj4+Cj4+PiBIZWxsbyBD
cmlzdGlhbiwKPj4+IEF0IDIwMjUtMTItMjAgMDU6NDc6MDEsICJDcmlzdGlhbiBDaW9jYWx0ZWEi
IDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4+Pj4gVGhlIFJvY2tj
aGlwIFZPUDIgZGlzcGxheSBjb250cm9sbGVyIGFsbG93cyBjb25maWd1cmluZyB0aGUgYmFja2dy
b3VuZAo+Pj4+IGNvbG9yIG9mIGVhY2ggdmlkZW8gb3V0cHV0IHBvcnQuCj4+Pj4KPj4+PiBTaW5j
ZSBhIHByZXZpb3VzIHBhdGNoIGludHJvZHVjZWQgdGhlIEJBQ0tHUk9VTkRfQ09MT1IgQ1JUQyBw
cm9wZXJ0eSwKPj4+PiB3aGljaCBkZWZhdWx0cyB0byBzb2xpZCBibGFjaywgbWFrZSB1c2Ugb2Yg
aXQgd2hlbiBwcm9ncmFtbWluZyB0aGUKPj4+PiBoYXJkd2FyZS4KPj4+Pgo+Pj4+IE5vdGUgdGhl
IG1heGltdW0gcHJlY2lzaW9uIGFsbG93ZWQgYnkgdGhlIGRpc3BsYXkgY29udHJvbGxlciBpcyAx
MGJwYywKPj4+PiB3aGlsZSB0aGUgYWxwaGEgY29tcG9uZW50IGlzIG5vdCBzdXBwb3J0ZWQsIGhl
bmNlIGlnbm9yZWQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDcmlzdGlhbiBDaW9jYWx0ZWEg
PGNyaXN0aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29tPgo+Pj4+IC0tLQo+Pj4+IGRyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwgMTMgKysrKysrKysrKysrLQo+
Pj4+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5oIHwgIDQgKysr
Kwo+Pj4+IDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fdm9wMi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMK
Pj4+PiBpbmRleCA0OThkZjBjZTQ2ODAuLjNhMjMyZDBkNGFjYiAxMDA2NDQKPj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+Pj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+Pj4gQEAgLTE1NTQs
NiArMTU1NCw3IEBAIHN0YXRpYyB2b2lkIHZvcDJfcG9zdF9jb25maWcoc3RydWN0IGRybV9jcnRj
ICpjcnRjKQo+Pj4+IAlzdHJ1Y3Qgdm9wMl92aWRlb19wb3J0ICp2cCA9IHRvX3ZvcDJfdmlkZW9f
cG9ydChjcnRjKTsKPj4+PiAJc3RydWN0IHZvcDIgKnZvcDIgPSB2cC0+dm9wMjsKPj4+PiAJc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUgPSAmY3J0Yy0+c3RhdGUtPmFkanVzdGVkX21vZGU7
Cj4+Pj4gKwl1NjQgYmdjb2xvciA9IGNydGMtPnN0YXRlLT5iYWNrZ3JvdW5kX2NvbG9yOwo+Pj4+
IAl1MTYgdnRvdGFsID0gbW9kZS0+Y3J0Y192dG90YWw7Cj4+Pj4gCXUxNiBoZGlzcGxheSA9IG1v
ZGUtPmNydGNfaGRpc3BsYXk7Cj4+Pj4gCXUxNiBoYWN0X3N0ID0gbW9kZS0+Y3J0Y19odG90YWwg
LSBtb2RlLT5jcnRjX2hzeW5jX3N0YXJ0Owo+Pj4+IEBAIC0xNTk5LDcgKzE2MDAsMTEgQEAgc3Rh
dGljIHZvaWQgdm9wMl9wb3N0X2NvbmZpZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4+Pj4gCQl2
b3AyX3ZwX3dyaXRlKHZwLCBSSzM1NjhfVlBfUE9TVF9EU1BfVkFDVF9JTkZPX0YxLCB2YWwpOwo+
Pj4+IAl9Cj4+Pj4KPj4+PiAtCXZvcDJfdnBfd3JpdGUodnAsIFJLMzU2OF9WUF9EU1BfQkcsIDAp
Owo+Pj4+ICsJLyogQmFja2dyb3VuZCBjb2xvciBpcyBwcm9ncmFtbWVkIHdpdGggMTAgYml0cyBv
ZiBwcmVjaXNpb24gKi8KPj4+PiArCXZhbCA9IEZJRUxEX1BSRVAoUkszNTY4X1ZQX0RTUF9CR19f
RFNQX0JHX1JFRCwgRFJNX0FSR0I2NF9HRVRSKGJnY29sb3IpID4+IDYpOwo+Pj4+ICsJdmFsIHw9
IEZJRUxEX1BSRVAoUkszNTY4X1ZQX0RTUF9CR19fRFNQX0JHX0dSRUVOLCBEUk1fQVJHQjY0X0dF
VEcoYmdjb2xvcikgPj4gNik7Cj4+Pgo+Pj4+ICsJdmFsIHw9IEZJRUxEX1BSRVAoUkszNTY4X1ZQ
X0RTUF9CR19fRFNQX0JHX0JMVUUsIERSTV9BUkdCNjRfR0VUQihiZ2NvbG9yKSA+PiA2KTsKPj4+
Cj4+Pgo+Pj4gdGhlIGJpdDMxIG9mICBSSzM1NjhfVlBfRFNQX0JHICBpcyBiZ19kaXNwbGF5X2Vu
77yMIHRoYXQgbWVhbnMgd2hlbiB3ZSBzZXQgYSAKPj4+IGJhY2tncm91bmQgY29sb3IsIHdlIHNo
b3VsZCBzZXQgdGhpcyBiZ19kaXNwbGF5X2VuIGJpdC4KPgo+SSBwZXJmb3JtZWQgc2V2ZXJhbCB0
ZXN0cyBvbiBteSBST0NLIDNBIChSSzM1NjgpLCBST0NLIDREIChSSzM1NzYpIGFuZCBST0NLIDVC
Cj4oUkszNTg4KSBib2FyZHMgYW5kIG5vdGljZWQgdGhhdCBieSBzZXR0aW5nIGJnX2Rpc3BsYXlf
ZW4gYml0IHRvIDEgb3IgMCBkb2Vzbid0Cj5oYXZlIGFueSBpbmZsdWVuY2Ugb24gUkszNTY4IGFu
ZCBSSzM1NzYsIHRoZSBiYWNrZ3JvdW5kIGNvbG9yIGlzIGFsd2F5cyBhY3RpdmUKPmFuZCBjYW5u
b3QgYmUgZGlzYWJsZWQuCj4KPkhvd2V2ZXIsIGZsaXBwaW5nIHRoZSBiaXQgdG8gMSBvbiBSSzM1
ODggaGFzIHRoZSB1bmV4cGVjdGVkIGVmZmVjdCBvZiBjb3ZlcmluZwo+dGhlIHdob2xlIHNjcmVl
biB3aXRoIHRoZSBjb25maWd1cmVkIGNvbG9yLCBldmVuIHdoZW4gdGhlcmUncyBhbiBhY3RpdmUg
cGxhbmUKPmRpc3BsYXllZCBvbiB0b3AuIFN3aXRjaGluZyBiYWNrIHRvIDAgbWFrZXMgaXQgd29y
ayBhcyBleHBlY3RlZC4KPgo+VGhlcmVmb3JlIEkgdGhpbmsgd2Ugc2hvdWxkIGtlZXAgdGhpcyBw
YXRjaCBhcyBpcywgdW5sZXNzIHRoZXJlJ3Mgc29tZXRoaW5nIGVsc2UKPndlJ3JlIG1pc3Npbmcg
aGVyZS4KPgo+Pj4gVGhlIGRlZmF1bHQgdmFsdWUgb2YgdGhpcyBiaXQgaXMgMSwgd2hpY2ggZXhw
bGFpbnMgd2h5IHRoZSBwYXRjaCBjdXJyZW50bHkgd29ya3MgCj4+PiBwcm9wZXJseSBldmVuIHRo
b3VnaCBpdCBkb2Vzbid0IHNldCBiaXQzMS4KPj4gCj4+IEZvciBzb21lIHJlYXNvbiwgdGhlIFJL
MzU4OCBUUk0gaW5kaWNhdGVzIDB4MCBmb3IgdGhlIHJlc2V0IHZhbHVlLiAgSSBhc3N1bWUKPj4g
dGhhdCdzIGEgbWlzdGFrZSwgYXMgUkszNTc2IFRSTSBzaG93cyAweDEuCj4KPkNvbnNpZGVyaW5n
IHRoZSBvYnNlcnZhdGlvbiBhYm92ZSwgaXQga2luZGEgbWFrZXMgc2Vuc2Ugbm93IGZvciBSSzM1
ODggdG8KPmRlZmF1bHQgdG8gMC4KCiAgIEkgZnVydGhlciBjb25maXJtZWQgd2l0aCBvdXIgSUMg
dGVhbTogZm9yIFJLMzU4OCwgUkszNTI4LCBhbmQgUkszNTYyLCBpZiB0aGUgZGlzcGxheV9lbmJp
dCBpcyBzZXQsIHRoZSBiYWNrZ3JvdW5kIGNvbG9yIHdpbGwgaW5kZWVkIGNvdmVyIGFsbCBsYXll
cnMuIAogICBGb3Igb3RoZXIgY2hpcHMsIHRoaXMgYml0IGhhcyBubyBlZmZlY3QuCiAgIFNvIEFD
SwoKPgo=
