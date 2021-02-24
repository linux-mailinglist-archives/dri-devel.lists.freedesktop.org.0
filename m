Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6576432438A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 19:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE216EB18;
	Wed, 24 Feb 2021 18:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07486EB18
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614190132;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DAP/4+bo7rMPoBzDXwzNHiMou9v/EWvyN52pN1kejRI=;
 b=C1tkgE18SccQOOjwH+tyi96BbTHIpOkslQvS2ZO7Keq7upRIYBIgTyb/wQE2cC2vPwwchm
 8fcEQQtVUhEpPEtLrt1rWKTT5adH0ayOTQMSLzxCr8DbKMriUKqXaEwN8ZsNnZn+rbWTCu
 Vkh1rGC/Bh47E3XNvVuurdwQTDDmjVU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-OBnS05NtNFmoWV3kxAlLsg-1; Wed, 24 Feb 2021 13:08:48 -0500
X-MC-Unique: OBnS05NtNFmoWV3kxAlLsg-1
Received: by mail-qt1-f199.google.com with SMTP id e10so2283995qtx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 10:08:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=DAP/4+bo7rMPoBzDXwzNHiMou9v/EWvyN52pN1kejRI=;
 b=lqjIOCtsreqpGpJyo9FrPzDd6cRl6z2/ezI3Mh53znYz7dmsw75pVqc27geQ5Ba6Hk
 +OJK+YS66liYaxKalTUHelztsVrVboV7QA18yXjhOB4ciYL6CjZ1L6NeamqzFmifaCpE
 2KsaD/Wn6Icn4gTlwq46rvzizXg1QH19q+Etl7KWq7xyqZn3l55bEZtw+j3ez9vv4kmx
 77EbWUq+dSRSin5Arz2ki5bJyDPajtZAwXvDDvdR2Abv3nXC/eAL9Wv6dulGpd5Vlqzh
 fR0v8/wfOedZ+olP+17tuepV0Ke6IJ1+LTehcFUpPuEnHvv3ZIk6uxDn14vyWGliv/ND
 d1gA==
X-Gm-Message-State: AOAM530yGVwPM+kAadaOna05faZAC3PGgNBYmukmhncbwqnDzHaKRUeu
 E86OFN7btW29OtNzrAEw+FGvM8w48GMzYFdWQP9DGupjOcBGacZiE9V3NW5qpGRsK/9uBCu1s3z
 p6DpadLQrY5ZTxsd7JT5/0XvmRspD
X-Received: by 2002:ae9:ec17:: with SMTP id h23mr31041203qkg.193.1614190127841; 
 Wed, 24 Feb 2021 10:08:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOiPoU8eUpYjHTThc7Exq6uyWIxcAuV5WGFv/iTh/FdLngbd0IEMYKc96a/MGLQrJ4qjrufQ==
X-Received: by 2002:ae9:ec17:: with SMTP id h23mr31041187qkg.193.1614190127691; 
 Wed, 24 Feb 2021 10:08:47 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id g186sm893793qke.0.2021.02.24.10.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:08:47 -0800 (PST)
Message-ID: <10aa57cb1a982cbc07195319580bc9604961f186.camel@redhat.com>
Subject: Re: [PATCH v2 0/2] Set CLEAR_PAYLOAD_ID_TABLE as broadcast request
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Date: Wed, 24 Feb 2021 13:08:46 -0500
In-Reply-To: <20210224101521.6713-1-Wayne.Lin@amd.com>
References: <20210224101521.6713-1-Wayne.Lin@amd.com>
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
Cc: eryk.brol@amd.com, qingqing.zhuo@amd.com, stable@vger.kernel.org,
 jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YWxzbyAtIEkgbWVhbnQgdG8gcmVwbHkgdG8gdjIsIG5vdCB2MSA6KS4gSnVzdCBzbyB5b3UgZG9u
J3Qgd29ycnkgdGhhdCBJIHB1c2hlZAp0aGUgd3JvbmcgcGF0Y2ggc2VyaWVzIHZlcnNpb24KCk9u
IFdlZCwgMjAyMS0wMi0yNCBhdCAxODoxNSArMDgwMCwgV2F5bmUgTGluIHdyb3RlOgo+IFdoaWxl
IHRlc3RpbmcgTVNUIGhvdHBsdWcgZXZlbnRzIG9uIGRhaXN5IGNoYWluIG1vbml0b3JzLCBmaW5k
IG91dAo+IHRoYXQgQ0xFQVJfUEFZTE9BRF9JRF9UQUJMRSBpcyBub3QgYnJvYWRjYXN0ZWQgYW5k
IHBheWxvYWQgaWQgdGFibGUKPiBpcyBub3QgcmVzZXQuIERpZyBpbiBkZWVwZXIgYW5kIGZpbmQg
b3V0IHR3byBwYXJ0cyBuZWVkZWQgdG8gYmUgZml4ZWQuCj4gCj4gMS4gTGlua19Db3VudF9Ub3Rh
bCAmIExpbmtfQ291bnRfUmVtYWluaW5nIG9mIEJyb2FkY2FzdCBtZXNzYWdlIGFyZQo+IGluY29y
cmVjdC4gU2hvdWxkIHNldCBsY3Q9MSAmIGxjcj02Cj4gMi4gQ0xFQVJfUEFZTE9BRF9JRF9UQUJM
RSByZXF1ZXN0IG1lc3NhZ2UgaXMgbm90IHNldCBhcyBwYXRoIGJyb2FkY2FzdAo+IHJlcXVlc3Qg
bWVzc2FnZS4gU2hvdWxkIGZpeCB0aGlzLgo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gKlJlZmVy
IHRvIHRoZSBzdWdnZXN0aW9uIGZyb20gVmlsbGUgU3lyamFsYS4gV2hpbGUgcHJlcGFyaW5nIGhk
ci1yYWQsCj4gdGFrZSBicm9hZGNhc3QgY2FzZSBpbnRvIGNvbnNpZGVyYXRpb24uCj4gCj4gV2F5
bmUgTGluICgyKToKPiDCoCBkcm0vZHBfbXN0OiBSZXZpc2UgYnJvYWRjYXN0IG1zZyBsY3QgJiBs
Y3IKPiDCoCBkcm0vZHBfbXN0OiBTZXQgQ0xFQVJfUEFZTE9BRF9JRF9UQUJMRSBhcyBicm9hZGNh
c3QKPiAKPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAxNyArKysr
KysrKysrKystLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCj4gCj4gLS0KPiAyLjE3LjEKPiAKCi0tIApTaW5jZXJlbHksCiAgIEx5dWRlIFBh
dWwgKHNoZS9oZXIpCiAgIFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKICAgCk5vdGU6IEkg
ZGVhbCB3aXRoIGEgbG90IG9mIGVtYWlscyBhbmQgaGF2ZSBhIGxvdCBvZiBidWdzIG9uIG15IHBs
YXRlLiBJZiB5b3UndmUKYXNrZWQgbWUgYSBxdWVzdGlvbiwgYXJlIHdhaXRpbmcgZm9yIGEgcmV2
aWV3L21lcmdlIG9uIGEgcGF0Y2gsIGV0Yy4gYW5kIEkKaGF2ZW4ndCByZXNwb25kZWQgaW4gYSB3
aGlsZSwgcGxlYXNlIGZlZWwgZnJlZSB0byBzZW5kIG1lIGFub3RoZXIgZW1haWwgdG8gY2hlY2sK
b24gbXkgc3RhdHVzLiBJIGRvbid0IGJpdGUhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
