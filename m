Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8416111B05
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 22:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A376F40E;
	Tue,  3 Dec 2019 21:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B946F40E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 21:30:40 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-MPlUU6m-N2mVD5-HQ-bZzw-1; Tue, 03 Dec 2019 16:30:37 -0500
Received: by mail-qt1-f199.google.com with SMTP id l2so3473891qti.19
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 13:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=oVkHv3p11mXgV99QlMIl1/3VrE+Xsk2FfcjR6WYk0Vk=;
 b=ob8TtP73YjXWYY01xJNYG1NLlBr8FshwnpimKL6Ezk33MVKiKjHke5g+pO+Cjvm8d1
 KR+t85fXZPBnmSbOOVooTLHXFXpTXwo49QWtSOQH+g9eEESrlS2h2EQjzib+MRveP39t
 I1Q11UfW5m9K5Jl85cN88GCwe73MnhfUydesSd5fgMpea4/Ri2XtuNgUPGJt76kO5sYG
 ma5HVKIbHxrsgcuqW1NH8Al5HemW1ZeLZqXLuix3MFsXI3jCRLfq4WwQJ3r+SCQwi7un
 0lPlZ5InKt3QoyJd/KIxFV6c73w0dq5dki6Bol3Gx4DrtbQ4N/gQQeynWQHRqOaXDhF1
 XOJg==
X-Gm-Message-State: APjAAAUn4rvRWW9QMDigwXHSB1+PYNo+s2E1J6HfNyxAZa39mUGIQzBf
 KmS750wIlBls5KwYFC00afEZiPruPtG8Sf3H/Rern0GCj/crGzqXpFjWlvJkvyrVf4NIH/hSXDs
 WG6HUcjn6XJHrp7SQ2WC6vvlHaYLv
X-Received: by 2002:a05:620a:1663:: with SMTP id
 d3mr7770117qko.204.1575408636934; 
 Tue, 03 Dec 2019 13:30:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqx54quaeILrvI+YvFwX3cJ/jz6a0mLjjFo5Z7L28rGml0sLqP9j6m4hoyBRsSJspupT20C76w==
X-Received: by 2002:a05:620a:1663:: with SMTP id
 d3mr7770089qko.204.1575408636721; 
 Tue, 03 Dec 2019 13:30:36 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id k50sm2628629qtc.90.2019.12.03.13.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 13:30:35 -0800 (PST)
Message-ID: <b35216fce6ed8f822d9147b2fa96a7cd840d96a9.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Fix build on systems with STACKTRACE_SUPPORT=n
From: Lyude Paul <lyude@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 03 Dec 2019 16:30:34 -0500
In-Reply-To: <20191203093334.GB624164@phenom.ffwll.local>
References: <20191202133650.11964-1-linux@roeck-us.net>
 <CAMuHMdUz7gewcFPE=cnVENGdwVp6AZD7U4y1PtwXTAmoGmvGUg@mail.gmail.com>
 <837a221f0fc89b9ef6d3fbd2ceae479a5c98818a.camel@redhat.com>
 <20191203093334.GB624164@phenom.ffwll.local>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: MPlUU6m-N2mVD5-HQ-bZzw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575408639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVkHv3p11mXgV99QlMIl1/3VrE+Xsk2FfcjR6WYk0Vk=;
 b=WB9dlgvws/gtprQDD7HCkJHrHQ7oWMSmzkOTQsnMnf97AE4alfIsww2sch37mFbablbEO6
 bFPtLBTh9PRjo2EYmqaI62nycThHa9ctEEkRKP8SuLy2YviHaBioFiFD3R5eOpUCnQx53q
 FwVuRDR1XHrhtefulszm3kMTstt7C9U=
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTEyLTAzIGF0IDEwOjMzICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
IE9uIE1vbiwgRGVjIDAyLCAyMDE5IGF0IDAxOjQ5OjQ3UE0gLTA1MDAsIEx5dWRlIFBhdWwgd3Jv
dGU6Cj4gPiBSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+IAo+
ID4gSSdsbCBnbyBhaGVhZCBhbmQgcHVzaCB0aGlzIHRvIGRybS1taXNjLW5leHQsIHRoYW5rcyEK
PiAKPiBkcm0tbWlzYy1uZXh0LWZpeGVzIHNpbmNlIGl0J3MgaW4gdGhlIG1lcmdlIHdpbmRvdy4g
ZHJtLW1pc2MtbmV4dCBpcyBmb3IKPiA1LjYgYWxyZWFkeS4KPiAtRGFuaWVsCgpBaGgsIHRoYXQg
ZXhwbGFpbnMgdGhpbmdzIDopLiBQdXNoZWQsIHRoYW5rcyBmb3IgdGhlIHBhdGNoZXMhCj4gCj4g
PiBPbiBNb24sIDIwMTktMTItMDIgYXQgMTY6MjAgKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToKPiA+ID4gT24gTW9uLCBEZWMgMiwgMjAxOSBhdCAyOjQxIFBNIEd1ZW50ZXIgUm9lY2sg
PGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6Cj4gPiA+ID4gT24gc3lzdGVtcyB3aXRoIFNUQUNL
VFJBQ0VfU1VQUE9SVD1uLCB3ZSBnZXQ6Cj4gPiA+ID4gCj4gPiA+ID4gV0FSTklORzogdW5tZXQg
ZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgU1RBQ0tUUkFDRQo+ID4gPiA+ICAgRGVw
ZW5kcyBvbiBbbl06IFNUQUNLVFJBQ0VfU1VQUE9SVAo+ID4gPiA+ICAgU2VsZWN0ZWQgYnkgW3ld
Ogo+ID4gPiA+ICAgLSBTVEFDS0RFUE9UIFs9eV0KPiA+ID4gPiAKPiA+ID4gPiBhbmQgYnVpbGQg
ZXJyb3JzIHN1Y2ggYXM6Cj4gPiA+ID4gCj4gPiA+ID4gbTY4ay1saW51eC1sZDoga2VybmVsL3N0
YWNrdHJhY2UubzogaW4gZnVuY3Rpb24gYHN0YWNrX3RyYWNlX3NhdmUnOgo+ID4gPiA+ICgudGV4
dCsweDExYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHNhdmVfc3RhY2tfdHJhY2UnCj4gPiA+
ID4gCj4gPiA+ID4gQWRkIHRoZSBtaXNzaW5nIGRlZW5kZW5jeSBvbiBTVEFDS1RSQUNFX1NVUFBP
UlQuCj4gPiA+ID4gCj4gPiA+ID4gRml4ZXM6IDEyYTI4MGM3Mjg2OCAoImRybS9kcF9tc3Q6IEFk
ZCB0b3BvbG9neSByZWYgaGlzdG9yeSB0cmFja2luZwo+ID4gPiA+IGZvcgo+ID4gPiA+IGRlYnVn
Z2luZyIpCj4gPiA+ID4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gPiA+ID4g
Q2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1
ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiA+ID4gCj4gPiA+IEFja2VkLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+ID4gPiAKPiA+ID4gR3J7
b2V0amUsZWV0aW5nfXMsCj4gPiA+IAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dAo+ID4gPiAKPiA+IC0tIAo+ID4gQ2hlZXJzLAo+ID4gCUx5dWRlIFBhdWwKPiA+IAotLSAKQ2hl
ZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
