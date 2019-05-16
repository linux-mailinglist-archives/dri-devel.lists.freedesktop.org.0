Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A020F5F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 21:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978BC89791;
	Thu, 16 May 2019 19:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7700989791
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 19:54:27 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id f24so5375568qtk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 12:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=lVfGGVHrzLNjAWN2/5h71M/9lprlabcIUQfQY+OtPpg=;
 b=FGC9dLehtY2pg52j8O6CTJmPCXltsuyWl0sSTvKJSLFoZFuqRk99+XfR0vFoshLJMo
 YjpjkqzfRYwmx/qKnX//l6HJ04hCV8lfvZnZggv7ahcdDjK0gQCPZl5ZDD3sZ8uwxIZ7
 WMi2jBOgP2dg3LwhE2D8fUxB7dP6DMQJu1BWM1U95wu0M8MJ5AFcfOx30MJGnI9nY4y8
 0EAh5Q2TGAHhJ5QSaxnfpMiF3JsbBzbnPdCR/891c1iYX0t8bV+qat6EaNJX5r2Tyxej
 Ib0e/wSHDf7BiZ6O8pcHtKufj1U6Sxycnz6LIA2Ggo1DBlAGT3Ewl9y03Y0AoSNbiFVk
 QgNQ==
X-Gm-Message-State: APjAAAVgzqIJnRTryI0KP9C/8hSOAmOEK3uNqEgDczGyw7c1InmedhHd
 M55Elc8LzjO62iM/db2tcWgGvg==
X-Google-Smtp-Source: APXvYqzaUGP2RSu8A8gfN3qD2p5obuMdZoWQS2qWn56d0slefmFogb6lOMAaD+1yZd06PALBuFTGtg==
X-Received: by 2002:ac8:3128:: with SMTP id g37mr44948286qtb.65.1558036466617; 
 Thu, 16 May 2019 12:54:26 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id o37sm3114046qte.55.2019.05.16.12.54.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 16 May 2019 12:54:26 -0700 (PDT)
Message-ID: <2248d762446e824def09699f0ef719b9c90d0dbc.camel@redhat.com>
Subject: Re: [PATCH 0/7] Add DP MST AUX devices
From: Lyude Paul <lyude@redhat.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 16 May 2019 15:54:25 -0400
In-Reply-To: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

SGksIGNvdWxkIHdlIChhbmQgZm9yIGZ1dHVyZSB2ZXJzaW9ucyBvZiB0aGlzIHNlcmllcyBhbmQg
b3RoZXJzKSBnZXQgYSByZXNwaW4Kb2YgdGhpcyB0aGF0J3MgYWN0dWFsbHkgcmViYXNlZCBhZ2Fp
bnN0IGRybS10aXA/IFRoYXQgaXMgdGhlIGRlZmFjdG8gc3RhbmRhcmQKYnJhbmNoIHRvIGRvIGRl
dmVsb3BtZW50IG9uLCBhbmQgb3RoZXJ3aXNlIGFueW9uZSB0cnlpbmcgdG8gdGVzdCB0aGVzZSBw
YXRjaGVzCmhhcyB0byByZXNvbHZlIG1lcmdlIGNvbmZsaWN0cyAoYWxvbmcgd2l0aCBtYWludGFp
bmVycykuIFRoZSBicmFuY2ggdGhpcwphcHBlYXJzIHRvIGJlIGJhc2VkIG9mZiBvZiBkb2Vzbid0
IGV2ZW4gaGF2ZSB0aGUgbmV3IGtyZWYgc2NoZW1lIGZvciBicmFuY2gKZGV2aWNlcyBhbmQgcG9y
dHMuCgpPbiBUaHUsIDIwMTktMDUtMTYgYXQgMTE6MTcgLTA0MDAsIHN1bnBlbmcubGlAYW1kLmNv
bSB3cm90ZToKPiBGcm9tOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiAKPiBUaGlzIHNl
cmllcyBhZGRzIHN1cHBvcnQgZm9yIE1TVCBBVVggZGV2aWNlcy4gCj4gCj4gQSBtb3JlIGRlc2Ny
aXB0aXZlICdtc3RwYXRoJyBhdHRyaWJ1dGUgaXMgYWxzbyBhZGRlZCB0byBNU1QgY29ubmVjdG9y
Cj4gZGV2aWNlcy4gSW4gYWRkaXRpb24sIHRoZSBEUCBhdXggZGV2aWNlIGlzIG1hZGUgdG8gYmUg
YSBjaGlsZCBvZiB0aGUKPiBjb3JyZXNwb25kaW5nIGNvbm5lY3RvcidzIGRldmljZSB3aGVyZSBw
b3NzaWJsZSAoKikuIFRoaXMgYWxsb3dzIHVkZXYKPiBydWxlcyB0byBwcm92aWRlIGRlc2NyaXB0
aXZlIHN5bWxpbmtzIHRvIHRoZSBBVVggZGV2aWNlcy4KPiAKPiAoKikgVGhpcyBjYW4gb25seSBi
ZSBkb25lIG9uIGRyaXZlcnMgdGhhdCByZWdpc3RlciB0aGVpciBjb25uZWN0b3IgYW5kCj4gYXV4
IGRldmljZXMgdmlhIGRybV9jb25uZWN0b3JfcmVnaXN0ZXIoKSBhbmQgZHJtX2RwX2F1eF9yZWdp
c3RlcigpCj4gcmVzcGVjdGl2ZWx5LiBUaGUgY29ubmVjdG9yIGFsc28gbmVlZHMgdG8gYmUgcmVn
aXN0ZXJlZCBiZWZvcmUgdGhlIGF1eAo+IGRldmljZS4KPiAKPiBMZW8gTGkgKDYpOgo+ICAgZHJt
L2RwOiBVc2Ugbm9uLWN5Y2xpYyBpZHIKPiAgIGRybS9kcC1tc3Q6IFVzZSBjb25uZWN0b3Iga2Rl
diBhcyBhdXggZGV2aWNlIHBhcmVudAo+ICAgZHJtL3N5c2ZzOiBBZGQgbXN0cGF0aCBhdHRyaWJ1
dGUgdG8gY29ubmVjdG9yIGRldmljZXMKPiAgIGRybS9hbWQvZGlzcGxheTogVXNlIGNvbm5lY3Rv
ciBrZGV2IGFzIGF1eCBkZXZpY2UgcGFyZW50Cj4gICBkcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4
eHg6IFVzZSBjb25uZWN0b3Iga2RldiBhcyBhdXggZGV2aWNlIHBhcmVudAo+ICAgZHJtL25vdXZl
YXU6IFVzZSBjb25uZWN0b3Iga2RldiBhcyBhdXggZGV2aWNlIHBhcmVudAo+IAo+IFZpbGxlIFN5
cmrDpGzDpCAoMSk6Cj4gICBkcm0vZHBfbXN0OiBSZWdpc3RlciBBVVggZGV2aWNlcyBmb3IgTVNU
IHBvcnRzCj4gCj4gIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBl
cy5jICAgIHwgICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4
eC5jICAgICAgICAgIHwgIDIyICsrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rl
di5jICAgICAgICAgICAgICAgICAgIHwgIDE3ICsrKy0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYyAgICAgICAgICAgICAgfCAxMDYKPiArKysrKysrKysrKysrKysrKyst
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMjMgKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3Iu
YyAgICAgICAgfCAgIDIgKy0KPiAgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDQgKwo+ICBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5o
ICAgICAgICAgICAgICAgICAgICB8ICAgNiArKwo+ICA4IGZpbGVzIGNoYW5nZWQsIDE1MiBpbnNl
cnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKPiAKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
