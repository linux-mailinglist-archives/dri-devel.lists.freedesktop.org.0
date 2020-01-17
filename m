Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4EE1412BB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 22:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A256F6F927;
	Fri, 17 Jan 2020 21:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7296F927
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 21:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579296013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkztcPZbCX6DcNV+tlv571N4CBOA3ffksv1kpeO5UZw=;
 b=I/pxUcH/eLAnv1Yai4ag+Ar9To7SErE3Mzn5mEbzKeSjXOhpdG0uB7Bl8bl2O7jqhub6zx
 BHBRjjPBRYTOv8mDm1GDOAFKDNpPDu3ZAwONvsT5bVkknGKiTf8UczUiUmARRme3/O2rv7
 iMtZItuG9dFmvgn7RdOayoniT+PMwRw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-bv4uJNwbMcyNkkme1yCaXQ-1; Fri, 17 Jan 2020 16:20:11 -0500
Received: by mail-qk1-f200.google.com with SMTP id u30so16410290qke.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 13:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=5fSGhwyCelv/95Dy9PRRhNw5Xde5iz+cVX/he+RSjIU=;
 b=RCLpzNBqqZyraWTTCRzKtzBixFHADrpkmaPD8ykPaAy9wW0MdXqx2K97A8Vm3zplsq
 ZlnezJ7uEuDr/vZubXfqD7TVL0hTZt9DwMZM1jsrKV9bDPsRJVi7dQOgiAlvV2Hhn59a
 a+ILHvP157bRUYw++Q+fKM/ru2Kk1aTpe+hzyj97ux1RH81Og6EAc8X8ohDipwAoBCfz
 VkCISK0unWVzBJdECCpoDZ5kStkPWZWrpSFJUlehx+pH4I553QiJlcxDrI2oeSQEIR8F
 JG2xxs0vdMgThGGVyraHKAjsm3we9coesa0nXOsGFv35elTRADbAvHyCInSqGa4cXeea
 cbTQ==
X-Gm-Message-State: APjAAAWb+3OMTqNLwaKXNkIJDDCq/dg7ykjOELAuTpb0BZgk+0FibK4s
 cw5nfKGdevZyNSFMR7LE8lwkW6I0ejvE3N0uBDqPyZw6WyWiCQ18kxEaBtVMxv3zp7hhrLLI5RW
 IUkq8wbmL88N3iTIXzuIW5TJMvEdp
X-Received: by 2002:ac8:410f:: with SMTP id q15mr9396567qtl.192.1579296010928; 
 Fri, 17 Jan 2020 13:20:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqyV6l1oNEN5CqetaRQsAf54RuVyrmYmD2U3uNiBnAxdrVC0XUtecEC9M44Er5RZjE/yyFXCNw==
X-Received: by 2002:ac8:410f:: with SMTP id q15mr9396555qtl.192.1579296010686; 
 Fri, 17 Jan 2020 13:20:10 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id f97sm13859697qtb.18.2020.01.17.13.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 13:20:09 -0800 (PST)
Message-ID: <63956e828e54525bc86b3bac89743141f05767f8.camel@redhat.com>
Subject: Re: [PATCH 2/4] drm/mst: Some style improvements in
 drm_dp_mst_topology_mgr_set_mst()
From: Lyude Paul <lyude@redhat.com>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Fri, 17 Jan 2020 16:20:09 -0500
In-Reply-To: <20200117015837.402239-2-jose.souza@intel.com>
References: <20200117015837.402239-1-jose.souza@intel.com>
 <20200117015837.402239-2-jose.souza@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: bv4uJNwbMcyNkkme1yCaXQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SkZZSTogSSdtIGdvaW5nIHRvIGdvIGFoZWFkIGFuZCBwdXNoIHRoaXMgcGF0Y2ggYnkgaXRzZWxm
IHRvIGRybS1taXNjLW5leHQKc2luY2UgaXQgYXBwbGllcyBjbGVhbmx5LCB0aGUgb3RoZXIgcGF0
Y2hlcyBpbiB0aGlzIHNlcmllcyBkb24ndCBkZXBlbmQgb24KdGhpcywgYW5kIEknbSBhYm91dCB0
byBzZW5kIG91dCBhIHBhdGNoIHRoYXQgbW9kaWZpZXMgdGhlIGNvZGUgYXJvdW5kIHRoZXNlCmh1
bmtzIGFueXdheS4KCk9uIFRodSwgMjAyMC0wMS0xNiBhdCAxNzo1OCAtMDgwMCwgSm9zw6kgUm9i
ZXJ0byBkZSBTb3V6YSB3cm90ZToKPiBSZW1vdmluZyB0aGlzIGxvc2UgY29kZSBibG9jayBhbmQg
cmVtb3ZpbmcgdW5uZWNlc3NhcnkgYnJhY2tldC4KPiAKPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3Nl
LnNvdXphQGludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyB8IDE0ICsrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMKPiBpbmRleCAzOGJmMTExZTVmOWIuLmUzYTIyMzYyYWFmMiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC0zNDkxLDYgKzM0OTEsOCBAQCBpbnQgZHJt
X2RwX21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdChzdHJ1Y3QKPiBkcm1fZHBfbXN0X3RvcG9sb2d5
X21nciAqbWdyLCBib29sIG1zCj4gIAltZ3ItPm1zdF9zdGF0ZSA9IG1zdF9zdGF0ZTsKPiAgCS8q
IHNldCB0aGUgZGV2aWNlIGludG8gTVNUIG1vZGUgKi8KPiAgCWlmIChtc3Rfc3RhdGUpIHsKPiAr
CQlzdHJ1Y3QgZHJtX2RwX3BheWxvYWQgcmVzZXRfcGF5Owo+ICsKPiAgCQlXQVJOX09OKG1nci0+
bXN0X3ByaW1hcnkpOwo+ICAKPiAgCQkvKiBnZXQgZHBjZCBpbmZvICovCj4gQEAgLTM1MjEsMTYg
KzM1MjMsMTIgQEAgaW50IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3NldF9tc3Qoc3RydWN0Cj4g
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwgYm9vbCBtcwo+ICAKPiAgCQlyZXQgPSBkcm1f
ZHBfZHBjZF93cml0ZWIobWdyLT5hdXgsIERQX01TVE1fQ1RSTCwKPiAgCQkJCQkJCSBEUF9NU1Rf
RU4gfAo+IERQX1VQX1JFUV9FTiB8IERQX1VQU1RSRUFNX0lTX1NSQyk7Cj4gLQkJaWYgKHJldCA8
IDApIHsKPiArCQlpZiAocmV0IDwgMCkKPiAgCQkJZ290byBvdXRfdW5sb2NrOwo+IC0JCX0KPiAg
Cj4gLQkJewo+IC0JCQlzdHJ1Y3QgZHJtX2RwX3BheWxvYWQgcmVzZXRfcGF5Owo+IC0JCQlyZXNl
dF9wYXkuc3RhcnRfc2xvdCA9IDA7Cj4gLQkJCXJlc2V0X3BheS5udW1fc2xvdHMgPSAweDNmOwo+
IC0JCQlkcm1fZHBfZHBjZF93cml0ZV9wYXlsb2FkKG1nciwgMCwgJnJlc2V0X3BheSk7Cj4gLQkJ
fQo+ICsJCXJlc2V0X3BheS5zdGFydF9zbG90ID0gMDsKPiArCQlyZXNldF9wYXkubnVtX3Nsb3Rz
ID0gMHgzZjsKPiArCQlkcm1fZHBfZHBjZF93cml0ZV9wYXlsb2FkKG1nciwgMCwgJnJlc2V0X3Bh
eSk7Cj4gIAo+ICAJCXF1ZXVlX3dvcmsoc3lzdGVtX2xvbmdfd3EsICZtZ3ItPndvcmspOwo+ICAK
LS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
