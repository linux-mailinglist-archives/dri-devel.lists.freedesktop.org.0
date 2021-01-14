Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE22F5D73
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBEA6E135;
	Thu, 14 Jan 2021 09:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529326E061
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 08:36:11 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x20so6842282lfe.12
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 00:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gGqP5AIlQ/3sPKWxFqWQSGbJK/2glJGRflSBF6MEnRc=;
 b=OCT4NYM8fLFCM9pB68jDrPrghf91OtMDdLivY4BqywVH7zLSP36IpMtwX843hHQsMk
 67sz3lDa6ZKjLFIJgTfhiRw0LIIkmcdeGKEri3FHC4zz9YptKgQJ+adAnAsSeg/UhAMO
 eOdHpvpPQwP+D4DbTEkz9bZelsuFoBz2U4G4q3t/snAMyaADWz03atIgSgWPYxzxZLHj
 sovEzyMnfhndnmSah+M3jeY3cCaLAfpv9pBT+s1Tnl5CLcUSiyN3Cxv+uXWYkrIhoO7f
 WSh+8hnBYLDUHCKsfgFkfFdkreZORwMXPFdV0LMCwcxBOxt0mE1hjgpTAzSKG5zdQaOo
 2dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gGqP5AIlQ/3sPKWxFqWQSGbJK/2glJGRflSBF6MEnRc=;
 b=rwNtY5DFtVUz+lqyAAPLr7p5OZ7ehDFgyp5Q/v1Ww42O/n/xSi3In8h2Y8ANdBNOGS
 L9G+iqQaAPoQAw1z0RNVlPnLw23uHICteLYQU+12eufXmm9REzpu7Lk20adt1R3TObxp
 7ScFdxcfk6J6CZopBHuMAT1E6u0n3GpynvDM7oO12nCtfMUeiPtrr3heBdMYyz3v6wKy
 gg7cfMZJkGz4WC2YdI3lCla0JQoqCnR2lsHZaefiZ4TNd+2iqMXk3nRAuNrjUFEOCFKm
 09iQAvbIew9mnvQOyYwqwCMVyYXIxSapHTOK9cGiIukVBsh0xV265T5q00QgFxgfRjYF
 dl4g==
X-Gm-Message-State: AOAM5300phmxUjbPjDII/hNbFzBUhhOs85xJI6b908ggwCl2TC7Xev9j
 zKGWv1sHtqr7zM2OhJdNzj4=
X-Google-Smtp-Source: ABdhPJwmfwmxCHtQP5uj2Dslrj7H8TPJyiQE/qZDLgHCvvSKou4Mo0p+9Z1JMFSmEkic+tY2+WGSYQ==
X-Received: by 2002:a19:c504:: with SMTP id w4mr2803552lfe.288.1610613369720; 
 Thu, 14 Jan 2021 00:36:09 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id y9sm387492ljm.94.2021.01.14.00.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 00:36:09 -0800 (PST)
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
 <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
Date: Thu, 14 Jan 2021 11:36:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTMuMDEuMjAyMSAyMTo1NiwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gMS8xMy8y
MSA4OjE0IFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDExLjAxLjIwMjEgMTY6MDAsIE1p
a2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4gK3N0cnVjdCBkcm1fdGVncmFfc3VibWl0X2J1
ZiB7Cj4+PiArwqDCoMKgIC8qKgo+Pj4gK8KgwqDCoMKgICogQG1hcHBpbmdfaWQ6IFtpbl0KPj4+
ICvCoMKgwqDCoCAqCj4+PiArwqDCoMKgwqAgKiBJZGVudGlmaWVyIG9mIHRoZSBtYXBwaW5nIHRv
IHVzZSBpbiB0aGUgc3VibWlzc2lvbi4KPj4+ICvCoMKgwqDCoCAqLwo+Pj4gK8KgwqDCoCBfX3Uz
MiBtYXBwaW5nX2lkOwo+Pgo+PiBJJ20gbm93IGluIHByb2Nlc3Mgb2YgdHJ5aW5nIG91dCB0aGUg
VUFQSSB1c2luZyBncmF0ZSBkcml2ZXJzIGFuZCB0aGlzCj4+IGJlY29tZXMgdGhlIGZpcnN0IG9i
c3RhY2xlLgo+Pgo+PiBMb29rcyBsaWtlIHRoaXMgaXMgbm90IGdvaW5nIHRvIHdvcmsgd2VsbCBm
b3Igb2xkZXIgVGVncmEgU29DcywgaW4KPj4gcGFydGljdWxhciBmb3IgVDIwLCB3aGljaCBoYXMg
YSBzbWFsbCBHQVJULgo+Pgo+PiBHaXZlbiB0aGF0IHRoZSB1c2VmdWxuZXNzIG9mIHRoZSBwYXJ0
aWFsIG1hcHBpbmcgZmVhdHVyZSBpcyB2ZXJ5Cj4+IHF1ZXN0aW9uYWJsZSB1bnRpbCBpdCB3aWxs
IGJlIHByb3ZlbiB3aXRoIGEgcmVhbCB1c2Vyc3BhY2UsIHdlIHNob3VsZAo+PiBzdGFydCB3aXRo
IGEgZHluYW1pYyBtYXBwaW5ncyB0aGF0IGFyZSBkb25lIGF0IGEgdGltZSBvZiBqb2Igc3VibWlz
c2lvbi4KPj4KPj4gRFJNIGFscmVhZHkgc2hvdWxkIGhhdmUgZXZlcnl0aGluZyBuZWNlc3Nhcnkg
Zm9yIGNyZWF0aW5nIGFuZCBtYW5hZ2luZwo+PiBjYWNoZXMgb2YgbWFwcGluZ3MsIGdyYXRlIGtl
cm5lbCBkcml2ZXIgaGFzIGJlZW4gdXNpbmcgZHJtX21tX3NjYW4gZm9yIGEKPj4gbG9uZyB0aW1l
IG5vdyBmb3IgdGhhdC4KPj4KPj4gSXQgc2hvdWxkIGJlIGZpbmUgdG8gc3VwcG9ydCB0aGUgc3Rh
dGljIG1hcHBpbmcgZmVhdHVyZSwgYnV0IGl0IHNob3VsZAo+PiBiZSBkb25lIHNlcGFyYXRlbHkg
d2l0aCB0aGUgZHJtX21tIGludGVncmF0aW9uLCBJTU8uCj4+Cj4+IFdoYXQgZG8gdGhpbms/Cj4+
Cj4gCj4gQ2FuIHlvdSBlbGFib3JhdGUgb24gdGhlIHJlcXVpcmVtZW50cyB0byBiZSBhYmxlIHRv
IHVzZSBHQVJUPyBBcmUgdGhlcmUKPiBhbnkgb3RoZXIgcmVhc29ucyB0aGlzIHdvdWxkIG5vdCB3
b3JrIG9uIG9sZGVyIGNoaXBzPwoKV2UgaGF2ZSBhbGwgRFJNIGRldmljZXMgaW4gYSBzaW5nbGUg
YWRkcmVzcyBzcGFjZSBvbiBUMzArLCBoZW5jZSBoYXZpbmcKZHVwbGljYXRlZCBtYXBwaW5ncyBm
b3IgZWFjaCBkZXZpY2Ugc2hvdWxkIGJlIGEgYml0IHdhc3RlZnVsLgoKPiBJIHRoaW5rIHdlIHNo
b3VsZCBrZWVwIENIQU5ORUxfTUFQIGFuZCBtYXBwaW5nX2lkcywgYnV0IGlmIGUuZy4gZm9yIEdB
UlQKPiB3ZSBjYW5ub3QgZG8gbWFwcGluZyBpbW1lZGlhdGVseSBhdCBDSEFOTkVMX01BUCB0aW1l
LCB3ZSBjYW4ganVzdCB0cmVhdAo+IGl0IGFzIGEgInJlZ2lzdHJhdGlvbiIgY2FsbCBmb3IgdGhl
IEdFTSBvYmplY3QgLSBwb3RlbnRpYWxseSBuby1vcCBsaWtlCj4gZGlyZWN0IHBoeXNpY2FsIGFk
ZHJlc3NpbmcgaXMuIFdlIGNhbiB0aGVuIGRvIHdoYXRldmVyIGlzIG5lZWRlZCBhdAo+IHN1Ym1p
dCB0aW1lLiBUaGlzIHdheSB3ZSBjYW4gaGF2ZSB0aGUgYmVzdCBvZiBib3RoIHdvcmxkcy4KCkkg
aGF2ZSBzb21lIHRob3VnaHRzIG5vdywgYnV0IG5vdGhpbmcgY29uY3JldGUgeWV0LiBNYXliZSB3
ZSB3aWxsIG5lZWQKdG8gY3JlYXRlIGEgcGVyLVNvQyBvcHMgZm9yIE1NLgoKSSdsbCBmaW5pc2gg
d2l0aCB0cnlpbmcgd2hhdCB3ZSBjdXJyZW50bHkgaGF2ZSB0byBzZWUgd2hhdCBlbHNlIGlzCm1p
c3NpbmcgYW5kIHRoZW4gd2Ugd2lsbCBkZWNpZGUgd2hhdCB0byBkbyBhYm91dCBpdC4KCj4gTm90
ZSB0aGF0IHBhcnRpYWwgbWFwcGluZ3MgYXJlIGFscmVhZHkgbm90IHByZXNlbnQgaW4gdGhpcyB2
ZXJzaW9uIG9mCj4gdGhlIFVBUEkuCgpPaCwgcmlnaHQgOikgSSBoYXZlbid0IGdvdCBjbG9zZWx5
IHRvIHRoaXMgcGFydCBvZiByZXZpZXdpbmcgeWV0LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
