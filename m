Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C3E70ED
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 13:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696BF6E624;
	Mon, 28 Oct 2019 12:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22036E624
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 12:07:07 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-jk9KyMGbMNytwMgRwevqjQ-1; Mon, 28 Oct 2019 08:06:31 -0400
Received: by mail-wr1-f71.google.com with SMTP id l4so6146212wru.10
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 05:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zaM05JJen5APQqVZxwEo+WWiJcDxzswUXxoOItsRRi8=;
 b=e3XhrRu59Th028c+BUx2qPNr0+ZOI5GuBxzVavANRg/Qj+DbCsQdQSHKcEkxj53CDn
 HBinvnIucUkf9oeqLowzAggfd8GAwQAxXLXyoUkAln3iEwkGYDrzarBInTZ1aER7kQ3o
 8PZfvgHdBDr4GepoWSg+QpJX2K8M3Q+UtTq8bMCjz/crmwB954/SHVMbRZcwmSnzuzYb
 p7Hs3IC5W6/LSfHyKUqn/nroF+4IMopjQ0obFTXQSlyG0EwaR3Jpsq2bclLk10rvO5Tw
 XXfbIj4v2/PAkrU439dkA+t2ZAe/aoHlfbevhbwgfAZWXN4ejtazxWEyiD2gDUjaXvJ9
 6gDw==
X-Gm-Message-State: APjAAAX0vRYJOtQ7luKnprQlS4N3zjtZcenjr/T+o+mwc36f30GCZU+2
 nlSQTefRlpmmIJty7v2SN4F4NEvpECltfrrgtAEn+9uQYu+WkKG+zRQ9Z2HEZNc6gDN8jXshpQV
 8rdymBNaKic3mY0tkYoF1L/xN2zp4
X-Received: by 2002:adf:dd47:: with SMTP id u7mr2362152wrm.354.1572264390110; 
 Mon, 28 Oct 2019 05:06:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxi1mY1TDnfVVXXUJHUwWkH3QYAlueGYKigOipp7mWtB4NdCZ6qzvjIqR2nYKgpf9w7/eyCg==
X-Received: by 2002:adf:dd47:: with SMTP id u7mr2362139wrm.354.1572264389941; 
 Mon, 28 Oct 2019 05:06:29 -0700 (PDT)
Received: from shalem.localdomain
 (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c14:2800:ec23:a060:24d5:2453])
 by smtp.gmail.com with ESMTPSA id b3sm9917872wrv.40.2019.10.28.05.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2019 05:06:29 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm/vboxvideo: Use generic fbdev and framebuffer
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch
References: <20191011134808.3955-1-tzimmermann@suse.de>
 <0e0995ff-f165-e349-b3ad-f031a9b52d77@redhat.com>
 <7180768c-077a-cbf5-ad16-7d53797b5d14@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c3e5bf4a-615b-fed1-6f11-cf5fcc3431d2@redhat.com>
Date: Mon, 28 Oct 2019 13:06:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <7180768c-077a-cbf5-ad16-7d53797b5d14@suse.de>
Content-Language: en-US
X-MC-Unique: jk9KyMGbMNytwMgRwevqjQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572264426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ivWSEIa/QsMJ9jztFImwiNhAlGq6KnhyNyHkElVS+8=;
 b=V3ARruYiyDp2LUYb6E/5dMR3us+cjBq6baOcQmj9vBNJ5hRHShYgDBvO3yIZFt+J74kyQT
 xlskE9tC+JZJyrnYkSPWaFokzU4a7Wk9626gCBtv63WIWWfWfg4/aGmBpRNs/0krg6qpqv
 sO678A/KNOncF2u3Kmo3bFv5wZoWGOs=
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyOC0xMC0yMDE5IDEyOjM0LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiBIaQo+
IAo+IEFtIDI4LjEwLjE5IHVtIDEyOjI2IHNjaHJpZWIgSGFucyBkZSBHb2VkZToKPj4gSGkgVGhv
bWFzLAo+Pgo+PiBPbiAxMS0xMC0yMDE5IDE1OjQ4LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToK
Pj4+IFRoZSB2Ym94dmlkZW8gZHJpdmVyIHByb3ZpZGVzIGl0cyBvd24gaW1wbGVtZW50YXRpb24g
Zm9yIGZiZGV2IGVtdWxhdGlvbgo+Pj4gYW5kIGZyYW1lYnVmZmVycy4gQm90aCBjYW4gYmUgcmVw
bGFjZWQgYnkgRFJNJ3MgZ2VuZXJpYyBjb2RlLgo+Pj4KPj4+IEFsbCBwYXRjaGVzIGhhdmUgYmVl
biB0ZXN0ZWQgb24gVmlydHVhbEJveCA2LjAuMTIuCj4+Pgo+Pj4gVGhvbWFzIFppbW1lcm1hbm4g
KDMpOgo+Pj4gIMKgwqAgZHJtL3Zib3h2aWRlbzogU3dpdGNoIHRvIGdlbmVyaWMgZmJkZXYgZW11
bGF0aW9uCj4+PiAgwqDCoCBkcm0vdmJveHZpZGVvOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxw
ZXJfZGlydHlfZmIoKQo+Pj4gIMKgwqAgZHJtL3Zib3h2aWRlbzogUmVwbGFjZSBzdHJ1Y3QgdnJh
bV9mcmFtZWJ1ZmZlciB3aXRoIGdlbmVyaWMKPj4+ICDCoMKgwqDCoCBpbXBsZW1lbmF0aW9uCj4+
Cj4+IFRoYW5rIHlvdSBmb3IgdGhlc2UgbmljZSBjbGVhbnVwcywgdW5mb3J0dW5hdGVseSB0aGVy
ZSBpcyBhIHNtYWxsCj4+IGJ1ZyBpbiB0aGUgbGFzdCBwYXRjaCwgeW91IGFyZSBzZXR0aW5nOgo+
Pgo+PiAgwqDCoMKgwqAuZmJfY3JlYXRlID0gZHJtX2dlbV9mYl9jcmVhdGUsCj4+Cj4+IEJ1dCBz
aW5jZSBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggeW91IHN3aXRjaGVkIHRvIGRybV9hdG9taWNfaGVs
cGVyX2RpcnR5X2ZiCj4+IHRoYXQgc2hvdWxkIGJlOgo+Pgo+PiAgwqDCoMKgwqAuZmJfY3JlYXRl
ID0gZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9kaXJ0eSwKPj4KPj4gVGhlIG1pc3Npbmcgd2l0aF9k
aXJ0eSBpcyBjYXVzaW5nIHNjcmVlbnVwZGF0ZXMgdW5kZXIgYm90aCBwbHltb3V0aCBhbmQKPj4g
Z25vbWUtc2hlbGwgKHdpdGggbGx2bXBpcGUpIHRvIGdvbmUgbWlzc2luZy4gSSdsbCBzZW5kIGEg
cGF0Y2ggZml4aW5nCj4+IHRoaXMuCj4gCj4gWW91J3JlIHJpZ2h0LiBJIGRpZCB0ZXN0IHRoZSBw
YXRjaHNldCwgYnV0IEkgY2FuJ3QgdGVsbCB3aHkgSSBkaWRuJ3Qgc2VlCj4gdGhpcyBidWcuCgpJ
IGtub3cgeW91IHRlc3RlZCB0aGUgcGF0Y2gtc2V0LCBzaW5jZSB5b3Ugc2FpZCBzbyBhYm92ZSA6
KSAgWW91IHByb2JhYmx5CmFyZSBhd2FyZSBvZiB0aGlzIGFscmVhZHksIGJ1dCBkaWQgeW91IGNo
ZWNrIHdoYXQgdmdhLWNhcmQgdGhlIHZtIGlzIHVzaW5nPwpOZXcgdmJveCBWTXMgZGVmYXVsdCB0
byB0aGVpciBuZXcgdm13YXJlLXN2Z2EgY2FyZCBlbXVsYXRpb24sIGluIHdoaWNoIGNhc2UKdmJv
eHZpZGVvIGlzIG5vdCB1c2VkIGF0IGFsbCwgdmJveHZpZGVvIGlzIG9ubHkgdXNlZCB3aXRoIHRo
ZSBvbGRlciBWYm94VkdBCmFuZCBWYm94U1ZHQSAoKikgdmlydHVhbCB2Z2EtY2FyZHMuCgo+IEFu
eXdheSwgdGhhbmtzIGEgbG90IGZvciBwcm92aWRpbmcgdGhlIGZpeC4KCllvdSBhcmUgd2VsY29t
ZS4KClJlZ2FyZHMsCgpIYW5zCgoKCiopIE9mIGNvdXJzZSBvbmNlIEkgZmluYWxseSBnZXQgdGhl
aXIgZHJpdmVyIHVwc3RyZWFtIHRoZXkgZGVwcmVjYXRlIGl0LCBncnVtYmxlLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
