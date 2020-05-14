Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017461D3311
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 16:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF3C6EB51;
	Thu, 14 May 2020 14:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3846EB51
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589466941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j5eJTDb4f4jboXDiifh0flxSNxHv/D1vIKqbMH6HioI=;
 b=UD5fMn3HP9OiNZuLWOpsHOjqbaAYTktgYhSsipyTK2lHYscsLFo4+iWlRoT28lAOHNi+6p
 6ffim1A+Nrk5eKcQnppEClizhKb7CEhGcbFtpq0oYm2kbOUwHaOOSihHfbuBgOyfEa14aO
 CSvRPXBbP+uaUoT+rCGl2JcNr4r9mnI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-KCJHpAnuOMOLDWSJ8oGYBQ-1; Thu, 14 May 2020 10:35:40 -0400
X-MC-Unique: KCJHpAnuOMOLDWSJ8oGYBQ-1
Received: by mail-wr1-f72.google.com with SMTP id 37so1690759wrc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j5eJTDb4f4jboXDiifh0flxSNxHv/D1vIKqbMH6HioI=;
 b=XvhlpMsMEHfIuxBGtbG9g4gqHkSc3vgmjslfpko1pr+VrKJFk9V3dLOteXGSZfxzPQ
 sSVzQC0DXisS/oNT1Yuy1n3alfRn6s3p2tLZiAxMYKOYL224YwyDdI7U5YI1W0+tx3cw
 9o8gS4w/jD/K66lKyxRbch2rcfkxwUFc+t0kVJDA8mPMVvyIGiRj5URA7NepP8uCEE/F
 XtvnNM9E5fcJ3NMehBmpqPwaudbfwg426FXZMRWr41JxhjTd5pTtEjx/08oTI4pME0Zu
 oTl8Rr1UJFb6bRqwB1QhqtrH9R9FSKSvLJNFsMRnPAhITsoIyfR/LOPTHGPzQ+e+kA5r
 ZJxA==
X-Gm-Message-State: AOAM531ndjOn/D/mm5ShAW2so1Xb2t3OUKYcVI1ZZUYQ6lKUP98/0iuc
 2KGK79wVqn59T/Wco9c4wTFaTw4ZZQgKS/5TisLdAebf0pzBdDRxd2gfVj3y8QEk5E6sJO0qyVH
 csUeRdtqjaGO1CTll6xcyJEBKmhRO
X-Received: by 2002:adf:dd01:: with SMTP id a1mr5732014wrm.224.1589466938651; 
 Thu, 14 May 2020 07:35:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKYqoLb/8K4V4zST3epuCPZoAaNfQe03LvD5BIYOcAmq6q8ZN+0iTQO6ylyH4t2qiwJP7nVQ==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr5732000wrm.224.1589466938390; 
 Thu, 14 May 2020 07:35:38 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id p8sm4217372wre.11.2020.05.14.07.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 07:35:37 -0700 (PDT)
Subject: Re: [PATCH resend] drm: Add DRM_MODE_TYPE_USERDEF flag to probed
 modes matching a video= argument
To: Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20200221173313.510235-1-hdegoede@redhat.com>
 <20200221173313.510235-2-hdegoede@redhat.com>
 <CACvgo51i8_Xyp4=RVfcft9FsasMh4G9ze1jrc0Mg8ObOZCHn5g@mail.gmail.com>
 <20200430145250.GX6112@intel.com>
 <a596b05a-a434-56c7-b3c6-ab070df2f00f@redhat.com>
 <CACvgo504dhBMO4fq9MEO8Et5AH0-+Hj00t92mjPEex6o8WRuwg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <951ca845-8f0c-41f4-b5f0-afca40123940@redhat.com>
Date: Thu, 14 May 2020 16:35:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CACvgo504dhBMO4fq9MEO8Et5AH0-+Hj00t92mjPEex6o8WRuwg@mail.gmail.com>
Content-Language: en-US
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
Cc: Sean Paul <seanpaul@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA1LzE0LzIwIDExOjUzIEFNLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gSGkgSGFucywK
PiAKPiBPbiBUaHUsIDMwIEFwciAyMDIwIGF0IDE1OjU1LCBIYW5zIGRlIEdvZWRlIDxoZGVnb2Vk
ZUByZWRoYXQuY29tPiB3cm90ZToKPj4KPj4gSGksCj4+Cj4+IE9uIDQvMzAvMjAgNDo1MiBQTSwg
VmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+Pj4gT24gVGh1LCBBcHIgMzAsIDIwMjAgYXQgMDI6NDc6
MDBQTSArMDEwMCwgRW1pbCBWZWxpa292IHdyb3RlOgo+Pj4+IEhpIEhhbnMsCj4+Pj4KPj4+PiBP
biBGcmksIDIxIEZlYiAyMDIwIGF0IDE3OjMzLCBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRo
YXQuY29tPiB3cm90ZToKPj4+Pj4KPj4+Pj4gZHJtX2hlbHBlcl9wcm9iZV9hZGRfY21kbGluZV9t
b2RlKCkgcHJlZmVycyB1c2luZyBhIHByb2JlZCBtb2RlIG1hdGNoaW5nCj4+Pj4+IGEgdmlkZW89
IGFyZ3VtZW50IG92ZXIgY2FsY3VsYXRpbmcgb3VyIG93biB0aW1pbmdzIGZvciB0aGUgdXNlciBz
cGVjaWZpZWQKPj4+Pj4gbW9kZSB1c2luZyBDVlQgb3IgR1RGLgo+Pj4+Pgo+Pj4+PiBCdXQgdXNl
cnNwYWNlIGNvZGUgd2hpY2ggaXMgYXV0by1jb25maWd1cmluZyB0aGUgbW9kZSBtYXkgd2FudCB0
byBrbm93IHRoYXQKPj4+Pj4gdGhlIHVzZXIgaGFzIHNwZWNpZmllZCB0aGF0IG1vZGUgb24gdGhl
IGtlcm5lbCBjb21tYW5kbGluZSBzbyB0aGF0IGl0IGNhbgo+Pj4+PiBwaWNrIHRoYXQgbW9kZSBv
dmVyIHRoZSBtb2RlIHdoaWNoIGlzIG1hcmtlZCBhcyBEUk1fTU9ERV9UWVBFX1BSRUZFUlJFRC4K
Pj4+Pj4KPj4+Pj4gVGhpcyBjb21taXQgc2V0cyB0aGUgRFJNX01PREVfVFlQRV9VU0VSREVGIGZs
YWcgb24gdGhlIG1hdGNoaW5nIG1vZGUsIGp1c3QKPj4+Pj4gYXMgd2Ugd291bGQgZG8gb24gdGhl
IHVzZXItc3BlY2lmaWVkIG1vZGUgd2hlbiBubyBtYXRjaGluZyBwcm9iZWQgbW9kZSBpcwo+Pj4+
PiBmb3VuZC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29l
ZGVAcmVkaGF0LmNvbT4KPj4+Pgo+Pj4+IEkgd2FzIHNraW1taW5nIGFyb3VuZCB3cnQgVmlsbGUn
cyBjb21wYWN0IGRybV9kaXNwbGF5X21vZGUgc2VyaWVzIGFuZAo+Pj4+IG5vdGljZWQgdGhhdCB0
aGlzIG5ldmVyIGxhbmRlZC4KPj4+Pgo+Pj4+IFRoZSBjb21taXQgYnJpbmdzIGV4dHJhIGNvbnNp
c3RlbmN5IHdoZW4gZGVhbGluZyB3aXRoIHVzZXIgZGVmaW5lZAo+Pj4+IG1vZGVzLCBhbmQgaXM6
Cj4+Pj4gUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5j
b20+Cj4+Pj4KPj4+PiBWaWxsZSB0aGlzIG1heSB0cml2aWFsbHkgY29uZmxpY3Qgd2l0aCB5b3Vy
IHdvcmsuIEkgc3VzcGVjdCB5b3UgY2FuIGRvCj4+Pj4gdGhlIGhvbm91cnMsIGFuZCBhcHBseSBv
biB0b3Agb2YgeW91ciBzZXJpZXM/Cj4+Pj4gVGhhdCBpcyBpZiB5b3UgYWdyZWUgd2l0aCB0aGUg
cGF0Y2guCj4+Pgo+Pj4gUXVpY2sgZ2xhbmNlIGF0IHRoZSBvcmlnaW5hbCB0aHJlYWQgc2F5cyBt
YXliZSB0aGVyZSB3ZXJlIHN0aWxsIHNvbWUKPj4+IHVzZXJzcGFjZSBpc3N1ZXMgdW5yZXNvbHZl
ZD8gTm90IHN1cmUuCj4+Cj4+IElJUkMgdGhlIHRocmVhZCBlbmRlZCB3aXRoIERhbmllbCBhZ3Jl
ZWluZyBvbiB0aGUgdXNlcnNwYWNlIGludGVyZmFjZSwKPj4gYnV0IGFza2luZyBmb3Igc29tZSBk
b2NzIGFuZCBtZSBwb2ludGluZyBvdXQgdGhhdCB0aGUgcGF0Y2ggYWxyZWFkeQo+PiB1cGRhdGVk
L2NsYXJpZmllZCB0aGUgZXhpc3RpbmcgZG9jcy4gQWZ0ZXIgdGhhdCB0aGluZ3MgZ290IHF1aWV0
Lgo+Pgo+PiBTbyBJIGJlbGlldmUgdGhhdCB0aGlzIGlzIChzdGlsbCkgcmVhZHkgdG8gZ28gdXBz
dHJlYW0uCj4+Cj4gSGF2aW5nIHJlYWQgdGhyb3VnaCB0aGUgZnVsbCBkaXNjdXNzaW9uLCBjb3Vw
bGUgb2YgdGltZXMsIEkgYmVsaWV2ZQo+IHlvdSdyZSBzcG90IG9uLgo+IAo+IERhbmllbCByZXF1
ZXN0ZWQgZG9jdW1lbnRhdGlvbiwgd2hpY2ggdGhlIHBhdGNoIHByb3ZpZGVzLiBJJ2Qgc2F5Cj4g
bGV0J3MgcG9rZSBoaW0gb24gSVJDIGEgZmV3IHRpbWVzLCBpZiBoZSBkb2Vzbid0IG9iamVjdCBs
ZXQncyBwdXNoIGl0PwoKU291bmRzIGdvb2QgdG8gbWUsIEknbSB1c3VhbGx5IG5vdCBvbiBJUkMg
KHRvbyBkaXN0cmFjdGluZyBmb3IgbWUpLCBjYW55b3UKcGluZyBEYW5pZWwgYWJvdXQgdGhpcyBv
biBJUkM/CgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
