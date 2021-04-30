Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949B5370306
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 23:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918D66F5E5;
	Fri, 30 Apr 2021 21:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6B86F5E9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 21:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619818604;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VH8o2B9j422l1gHg139/GpoVDIN94tZq6RHlmA6Yejc=;
 b=BYY47LoW8X+xHX1yz/JvbRbnGLfaus37MCpPb+L1VJt9ti2Gr+FNXgCU/KgrZKcn7RUm9b
 9BPeTdChAHbhj5KQ5UQUbwDUemFyFuq5G5h5giZGGlLADBRT1SADY8nVXgDik9KNt6QUpg
 InZZoH9aOOH7UF6kz2j4KbcbhMcpN8g=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-IWe9lsWgMlGFBbmt60Bhlw-1; Fri, 30 Apr 2021 17:36:40 -0400
X-MC-Unique: IWe9lsWgMlGFBbmt60Bhlw-1
Received: by mail-qt1-f199.google.com with SMTP id
 y10-20020a05622a004ab029019d4ad3437cso30021667qtw.12
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 14:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=VH8o2B9j422l1gHg139/GpoVDIN94tZq6RHlmA6Yejc=;
 b=kKBFvd1G2D/fNNAckl8QcNAyi7BNg0jm4E0XYfD2OJzx3Q4GpnI1oR4aq1zC6SnONt
 /5HzPEPqG3FX0y5mHqfX0wFcvM/zCwSsjeVPPffd6Pm2CatQJXOssEC3TLzGJgHUvvQY
 TEeIbBxmEFrCPwKe/ob6hpNKO8KlUAO2SwZ5W1Oh+OUviFscODmLRLLWDbJFJxXZXR9B
 zrEMSsUJ7l3u6TYCEQAIK/e0FpDpY0WrP/a8jjXGSagebYqYwoHhIeSlO2pDOz5SrwBd
 wq6RodtnkgdrGbS7gcJRVjrCcOKU+6Mr5z8LCXXh7WBiwZURXk0yyHqFJh9QKAD0h7NS
 EsjQ==
X-Gm-Message-State: AOAM533xtH+EbAZhrJ1l9OYErHuQFokX29GGRQX/710/n23VgmC+CwLJ
 yz0Aaib2eL6zsBBRQqEx9L4JV4otvN2RLMUR+XsWomEMeSnymrQ1SWJDU8ZQWdNpGmnXWgc68QY
 Adfbsksxj0lcUt9hLMwzCbdtRh5z9
X-Received: by 2002:a05:622a:1044:: with SMTP id
 f4mr6605926qte.224.1619818599989; 
 Fri, 30 Apr 2021 14:36:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1Ozlat6MpQkg36ZJ+p/06L1GwocyYQh3wWifGymkZWKPVN50En+E+szzNe8ExwY6tKgwaUA==
X-Received: by 2002:a05:622a:1044:: with SMTP id
 f4mr6605904qte.224.1619818599751; 
 Fri, 30 Apr 2021 14:36:39 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id s25sm2291898qkj.34.2021.04.30.14.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 14:36:39 -0700 (PDT)
Message-ID: <ad2a851476ff0974a96613675e685893460c3eac.camel@redhat.com>
Subject: Re: [PATCH v1 1/1] drm/dp_mst: Use the correct max source link rate
 for i915
From: Lyude Paul <lyude@redhat.com>
To: Nikola Cornij <nikola.cornij@amd.com>, amd-gfx@lists.freedesktop.org
Date: Fri, 30 Apr 2021 17:36:38 -0400
In-Reply-To: <20210430212224.21588-2-nikola.cornij@amd.com>
References: <20210430212224.21588-1-nikola.cornij@amd.com>
 <20210430212224.21588-2-nikola.cornij@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Reply-To: lyude@redhat.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 koba.ko@canonical.com, aurabindo.pillai@amd.com, mikita.lipski@amd.com,
 bskeggs@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTA0LTMwIGF0IDE3OjIyIC0wNDAwLCBOaWtvbGEgQ29ybmlqIHdyb3RlOgo+
IFt3aHldCj4gUHJldmlvdXNseSB1c2VkIHZhbHVlIHdhcyBub3Qgc2FmZSB0byBwcm92aWRlIHRo
ZSBjb3JyZWN0IHZhbHVlLCBpLmUuIGl0Cj4gY291bGQgYmUgMCBpZiBub3Qgbm90IGNvbmZpZ3Vy
ZWQsIGxlYWRpbmcgdG8gbm8gTVNUIG9uIHRoaXMgcGxhdGZvcm0uCj4gCj4gW2hvd10KPiBEbyBu
b3QgdXNlIHRoZSB2YWx1ZSBmcm9tIEJJT1MsIGJ1dCBmcm9tIHRoZSBzdHJ1Y3R1cmUgcG9wdWxh
dGVkIGF0Cj4gZW5jb2RlciBpbml0aWFsaXphdGlvbiB0aW1lLgo+IAo+IEZpeGVzOiA5ODAyNWE2
MmNiMDAgKCJkcm0vZHBfbXN0OiBVc2UgRXh0ZW5kZWQgQmFzZSBSZWNlaXZlciBDYXBhYmlsaXR5
IERQQ0QKPiBzcGFjZSIpCj4gU2lnbmVkLW9mZi1ieTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNv
cm5pakBhbWQuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcF9tc3QuYyB8IDUgKystLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHBfbXN0LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHBfbXN0LmMKPiBpbmRleCBiZjdmODQ4Nzk0NWMuLjAxYTBlZDk5OTg4ZiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwo+IEBAIC05NDIsNyAr
OTQyLDYgQEAgaW50ZWxfZHBfbXN0X2VuY29kZXJfaW5pdChzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9w
b3J0Cj4gKmRpZ19wb3J0LCBpbnQgY29ubl9iYXNlX2lkKQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgaW50ZWxfZHAgKmludGVsX2RwID0gJmRpZ19wb3J0LT5kcDsKPiDCoMKgwqDCoMKgwqDCoMKg
ZW51bSBwb3J0IHBvcnQgPSBkaWdfcG9ydC0+YmFzZS5wb3J0Owo+IMKgwqDCoMKgwqDCoMKgwqBp
bnQgcmV0Owo+IC3CoMKgwqDCoMKgwqDCoGludCBiaW9zX21heF9saW5rX3JhdGU7Cj4gwqAKPiDC
oMKgwqDCoMKgwqDCoMKgaWYgKCFIQVNfRFBfTVNUKGk5MTUpIHx8IGludGVsX2RwX2lzX2VkcChp
bnRlbF9kcCkpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiBA
QCAtOTU3LDExICs5NTYsMTEgQEAgaW50ZWxfZHBfbXN0X2VuY29kZXJfaW5pdChzdHJ1Y3QgaW50
ZWxfZGlnaXRhbF9wb3J0Cj4gKmRpZ19wb3J0LCBpbnQgY29ubl9iYXNlX2lkKQo+IMKgCj4gwqDC
oMKgwqDCoMKgwqDCoC8qIGNyZWF0ZSBlbmNvZGVycyAqLwo+IMKgwqDCoMKgwqDCoMKgwqBpbnRl
bF9kcF9jcmVhdGVfZmFrZV9tc3RfZW5jb2RlcnMoZGlnX3BvcnQpOwo+IC3CoMKgwqDCoMKgwqDC
oGJpb3NfbWF4X2xpbmtfcmF0ZSA9IGludGVsX2Jpb3NfZHBfbWF4X2xpbmtfcmF0ZSgmZGlnX3Bv
cnQtPmJhc2UpOwo+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSBkcm1fZHBfbXN0X3RvcG9sb2d5X21n
cl9pbml0KCZpbnRlbF9kcC0+bXN0X21nciwgJmk5MTUtPmRybSwKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJmludGVsX2RwLT5hdXgsIDE2LCAzLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAodTgpZGlnX3BvcnQtPm1heF9sYW5lcywKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAodTgpKGJpb3NfbWF4X2xpbmtfcmF0ZSAvIDI3MDAwKSwKPiBjb25uX2Jhc2VfaWQpOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh1OCkoaW50ZWxfZHAtCj4gPnNvdXJjZV9yYXRl
c1tpbnRlbF9kcC0+bnVtX3NvdXJjZV9yYXRlcyAtIDFdIC8gMjcwMDApLAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbm5fYmFzZV9pZCk7CgpUaGlzIGxpbmUgaXMga2luZCBvZiBsb25n
LCBJJ2Qgc2F5IHdlIHNob3VsZCBqdXN0IHN0b3JlIHRoZSBtYXggbGluayByYXRlIGluIGEKbG9j
YWwgdmFyaWFibGUgbGlrZSBtYXhfbGlua19yYXRlLCB0aGVuIGp1c3QgcGFzcyB0aGF0IHRvCmRy
bV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2luaXQoKQoKQWxzbywgdGhlIGNvbW1pdCBtZXNzYWdlIHNo
b3VsZCBwcm9iYWJseSBiZToKCmRybS9pOTE1OiBVc2UgdGhlIGNvcnJlY3QgbWF4IHNvdXJjZSBs
aW5rIHJhdGUgZm9yIE1TVAoKV2l0aCB0aG9zZSB0d28gdGhpbmdzIGZpeGVkOgoKUmV2aWV3ZWQt
Ynk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cgo+IMKgwqDCoMKgwqDCoMKgwqBpZiAo
cmV0KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDCoAoK
LS0gClNpbmNlcmVseSwKICAgTHl1ZGUgUGF1bCAoc2hlL2hlcikKICAgU29mdHdhcmUgRW5naW5l
ZXIgYXQgUmVkIEhhdAogICAKTm90ZTogSSBkZWFsIHdpdGggYSBsb3Qgb2YgZW1haWxzIGFuZCBo
YXZlIGEgbG90IG9mIGJ1Z3Mgb24gbXkgcGxhdGUuIElmIHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0
aW9uLCBhcmUgd2FpdGluZyBmb3IgYSByZXZpZXcvbWVyZ2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQg
SQpoYXZlbid0IHJlc3BvbmRlZCBpbiBhIHdoaWxlLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQg
bWUgYW5vdGhlciBlbWFpbCB0byBjaGVjawpvbiBteSBzdGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
