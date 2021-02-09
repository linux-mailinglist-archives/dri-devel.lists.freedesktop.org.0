Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3B314DCD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 12:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEC56E03F;
	Tue,  9 Feb 2021 11:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E284D6E03F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 11:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612868696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VUrM1MxwTRoBcLK+bS+xP+lKMb7K0nm0kYlDVhBCw2U=;
 b=jQKPI9O9v9ZMVsihGbIvMuH2Tgvnht6vm/0F3uZR27U7HtPhDtP5CGVaOBheg/d3MiUyCQ
 bU2sePmrilH7oP8zdeMyfbKXRzwP1iTVGLchUaieiT3K9PII4u9wmTddPjTYUDJp2LtBk7
 DUGwqpHFrvVlmOTgTiyT3CgZh91j58s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-3pAFLMpMO82kp4Xx7HZLMw-1; Tue, 09 Feb 2021 06:04:53 -0500
X-MC-Unique: 3pAFLMpMO82kp4Xx7HZLMw-1
Received: by mail-ej1-f72.google.com with SMTP id jg11so15150031ejc.23
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 03:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VUrM1MxwTRoBcLK+bS+xP+lKMb7K0nm0kYlDVhBCw2U=;
 b=exEMtahmKx4ciTe91ISTpmu7jxNjzEs5LC/psGZqxcFP/tgTwKXlmU2ePxQ2YtoXtz
 riMT4clPg6xi+CulcDTjETLg/AATzLbY5P2kOZ89iKre5QddKNOJmm9lmqzIFwRJYa9J
 LgE1HFQ8jH7T4L+YNEvCQL4cRaMBThDvXDrYmORzq7Wt1DPmxuZdPeQ8VbddsqPSMoBZ
 WE03iLhUTKEWs0+e3cbU9YvrqtBB90KTfc1GyWh25MPDMdyClG/fJODLsu3qAM2raMat
 9hvcphjHthdHHwsYrsSiMsrI67k0J1n7wF41FqXRqS2xgG9D8luc7JKMfm1G4g4BUKut
 J/rw==
X-Gm-Message-State: AOAM532MjZH1d13TtPnGbalNtAgqNs/2oxcdCdaGAxB/xlBMX/naXMYJ
 Qzs1Rt3YTZUWyWIyottX1WY3rHMqU3VTpG6Hxk9I4+z9m5S1ploLz2xfVzYq/0hUkHP42L5l7/V
 ECfadYbMS3rChAighupFaxI7F7jbObJg4TPsj6pqbWd9Ys55Po8BVZ+PvWtytAZGt2venUlzS7d
 2ZhKza
X-Received: by 2002:a50:bb47:: with SMTP id y65mr13212024ede.33.1612868692373; 
 Tue, 09 Feb 2021 03:04:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyL6SGR3n0awnyCPR2gtsOTjhrKB0P4eurZcKvbGkB4VDWVXdRk1Vzfp+ZDYPMGDp1sOEyvKQ==
X-Received: by 2002:a50:bb47:: with SMTP id y65mr13212000ede.33.1612868692206; 
 Tue, 09 Feb 2021 03:04:52 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id x21sm10357989eje.118.2021.02.09.03.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 03:04:51 -0800 (PST)
Subject: Re: [PATCH v2 0/2] drm/vboxvideo: Use struct drm_shadow_plane_state
 for cursor plane
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20210208135044.27827-1-tzimmermann@suse.de>
 <441f2dbe-d7b1-5f2f-e6c3-2cc0fb45c296@redhat.com>
 <e0178098-ec48-0286-fc00-9f55b4d22da5@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c592fee5-f708-8e05-dacf-e7b031d03703@redhat.com>
Date: Tue, 9 Feb 2021 12:04:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e0178098-ec48-0286-fc00-9f55b4d22da5@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyLzkvMjEgOToxMyBBTSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGkKPiAK
PiBBbSAwOC4wMi4yMSB1bSAxODo0MyBzY2hyaWViIEhhbnMgZGUgR29lZGU6Cj4+IEhpLAo+Pgo+
PiBPbiAyLzgvMjEgMjo1MCBQTSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4+PiAod2FzOiBk
cm0vdmJveHZpZGVvOiBWbWFwL3Z1bm1hcCBjdXJzb3IgQk8gaW4gcHJlcGFyZV9mYiBhbmQgY2xl
YW51cF9mYikKPj4+Cj4+PiBGdW5jdGlvbnMgaW4gdGhlIGF0b21pYyBjb21taXQgdGFpbCBhcmUg
bm90IGFsbG93ZWQgdG8gYWNxdWlyZSB0aGUKPj4+IGRtYWJ1ZidzIHJlc2VydmF0aW9uIGxvY2su
IFNvIHdlIGNhbm5vdCBsZWdhbGx5IGNhbGwgdGhlIEdFTSBvYmplY3Qncwo+Pj4gdm1hcCBmdW5j
dGlvbmFsaXR5IGluIGF0b21pY191cGRhdGUuCj4+Pgo+Pj4gQnV0LCBtdWNoIGJldHRlciwgd2Ug
Y2FuIHVzZSBkcm1fc2hhZG93X3BsYW5lX3N0YXRlIHRvIGRvIGFsbCB0aGUgbWFwcGluZwo+Pj4g
Zm9yIHVzLiBQYXRjaCAxIGV4cG9ydHMgdGhlIGhlbHBlcnMgZm9yIHNoYWRvdy1idWZmZXJlZCBw
bGFuZXMgZnJvbSB0aGUKPj4+IERSTSBLTVMgaGVscGVyIGxpYnJhcnkgYW5kIGFkZHMgZG9jdW1l
bnRhdGlvbiBvbiBob3cgdG8gdXNlIHRoZW0uIFBhdGNoIDIKPj4+IHJlcGxhY2VzIHRoZSB2bWFw
IGNvZGUgaW4gdmJveCcgY3Vyc29yIHVwZGF0ZSBjb2RlIHdpdGggYSB0aGUgaGVscGVycyBmb3IK
Pj4+IHNoYWRvdy1idWZmZXJlZCBwbGFuZXMuCj4+Pgo+Pj4gVGhvbWFzIFppbW1lcm1hbm4gKDIp
Ogo+Pj4gwqDCoCBkcm0vZ2VtOiBFeHBvcnQgaGVscGVycyBmb3Igc2hhZG93LWJ1ZmZlcmVkIHBs
YW5lcwo+Pj4gwqDCoCBkcm0vdmJveHZpZGVvOiBJbXBsZW1lbnQgY3Vyc29yIHBsYW5lIHdpdGgg
c3RydWN0Cj4+PiDCoMKgwqDCoCBkcm1fc2hhZG93X3BsYW5lX3N0YXRlCj4+Cj4+IEkndmUgZ2l2
ZW4gdGhpcyBhIHRlc3Qgc3BpbiBpbiBhIHZpcnR1YWxib3ggdm0gdXNpbmcgVmJveFNWR0EgZ3Jh
cGhpY3MKPj4gYW5kIEkndmUgbm90IGZvdW5kIGFueSBwcm9ibGVtczoKPj4KPj4gVGVzdGVkLWJ5
OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+IAo+IFRoYW5rcyBhIGxvdC4g
Q2FuIEkgYWRkIHlvdXIgQWNrZWQtYnkgYXMgd2VsbD8KClBhdGNoIDEvMiBpcyBhIGJpdCBvdXRz
aWRlIG9mIG15IGFyZWEgb2YgZXhwZXJ0aXNlLCBidXQgSSBzZWUgeW91IGFscmVhZHkgaGF2ZQph
IFJldmlld2VkLWJ5IGZyb20gRGFuaWVsIHRoZXJlLCBzbyB0aGF0IG9uZSBzaG91bGQgYmUgZ29v
ZCB0byBnby4KCkkndmUganVzdCByZXZpZXdlZCAyLzIgYW5kIGl0IGxvb2tzIGdvb2QgdG8gbWUs
IHNvIGZvciAyLzIgeW91IG1heSBhZGQgbXk6CgpSZXZpZXdlZC1ieTogSGFucyBkZSBHb2VkZSA8
aGRlZ29lZGVAcmVkaGF0LmNvbT4KClJlZ2FyZHMsCgpIYW5zCgoKCj4+Pgo+Pj4gwqAgZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fYXRvbWljX2hlbHBlci5jIHwgMTQ4ICsrKysrKysrKysrKysrKysr
KysrKysrLQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21vZGUuY8KgwqAg
fMKgIDI4ICsrLS0tCj4+PiDCoCBpbmNsdWRlL2RybS9kcm1fZ2VtX2F0b21pY19oZWxwZXIuaMKg
wqDCoMKgIHzCoCAzMiArKysrKwo+Pj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxODEgaW5zZXJ0aW9u
cygrKSwgMjcgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gLS0gCj4+PiAyLjMwLjAKPj4+Cj4+Cj4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Pgo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
