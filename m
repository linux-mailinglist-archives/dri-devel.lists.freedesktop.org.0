Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C0DE7056
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 12:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBA86E5D3;
	Mon, 28 Oct 2019 11:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC28D6E5D3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 11:26:40 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-IHy3EHMKOJKNi_JUgA34vw-1; Mon, 28 Oct 2019 07:26:37 -0400
Received: by mail-wm1-f70.google.com with SMTP id k9so3894036wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 04:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bC8Ws7IOh0lmejZznuXqTQLaUb6xMKAujNKq0Q65sb8=;
 b=pJqORS9/EbywXA+AEL7Z+hte0vXM1NqG7zrh7J6QpdFkM+BRUP5lzorpbdPE9uSMrn
 4EYmloQLNv/q+yx69fuRMD611+vkh2xraCluS2D68ZNsOZ2AZkOxClpbn0z/izgY9uov
 bgGxdX2r1H/L70MNiSM447eHS62DndzBq+LHBir+ELZ5UtiUQarvFVXk31Y/QL57Uzy9
 rlb+I9Mu3qExYfXjVDN6zx4dA02D91hZkJJzc+/qtLyxBWi3deTrFy/c6QJ5zdFNali8
 zib5A/Kd3Uaecp/rF30I6SqMYT0tr6AmHGUCplT57XeJXwbAKGCQbPhcopXIKYAwle+e
 eBAQ==
X-Gm-Message-State: APjAAAXu4WewocFEdsorYz+iySVCnZX0pA4AZ4yifa1iVZeQGc4zvPAo
 DKBnKQYrCUkLOj7EIprZC4iKHzMI6NFHNeIu3OOw6jvemQgCjexR88J16V2baFgx6HPJrlNI/wu
 OaL/cMd5t2EVZNMRDh2LUwDC9oQ8E
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr14006434wrt.195.1572261996360; 
 Mon, 28 Oct 2019 04:26:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6ryoHOMF/nnMGwhFVgHCMw5lCS3dNjfZJPkSo3NcuMB3nrhBqMRpnF+uVgN3KSbvn8iqkyg==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr14006423wrt.195.1572261996225; 
 Mon, 28 Oct 2019 04:26:36 -0700 (PDT)
Received: from shalem.localdomain
 (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c14:2800:ec23:a060:24d5:2453])
 by smtp.gmail.com with ESMTPSA id s5sm6464203wmj.37.2019.10.28.04.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2019 04:26:35 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm/vboxvideo: Use generic fbdev and framebuffer
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch
References: <20191011134808.3955-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <0e0995ff-f165-e349-b3ad-f031a9b52d77@redhat.com>
Date: Mon, 28 Oct 2019 12:26:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191011134808.3955-1-tzimmermann@suse.de>
Content-Language: en-US
X-MC-Unique: IHy3EHMKOJKNi_JUgA34vw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572261999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35sK4YTzmH7zBj3sk4MTPmRduou7KBBxMejGkmuoaNo=;
 b=VhXgApgtujWtVqP4Pw2+v2l0ouwGysEoJPY57D17977kgqzlvXbXOvcyZgTScJGrTYhZlM
 dJrCz3I68FMSv3cgSNLY2cZ0Au5P2ouOQUeH+RBXawHJuiPZT7vmfk7d2fyfk1I9lD3lL2
 Ok2CuTevJXfdXmycQaGfxpYOC2+jblA=
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

SGkgVGhvbWFzLAoKT24gMTEtMTAtMjAxOSAxNTo0OCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6
Cj4gVGhlIHZib3h2aWRlbyBkcml2ZXIgcHJvdmlkZXMgaXRzIG93biBpbXBsZW1lbnRhdGlvbiBm
b3IgZmJkZXYgZW11bGF0aW9uCj4gYW5kIGZyYW1lYnVmZmVycy4gQm90aCBjYW4gYmUgcmVwbGFj
ZWQgYnkgRFJNJ3MgZ2VuZXJpYyBjb2RlLgo+IAo+IEFsbCBwYXRjaGVzIGhhdmUgYmVlbiB0ZXN0
ZWQgb24gVmlydHVhbEJveCA2LjAuMTIuCj4gCj4gVGhvbWFzIFppbW1lcm1hbm4gKDMpOgo+ICAg
IGRybS92Ym94dmlkZW86IFN3aXRjaCB0byBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbgo+ICAgIGRy
bS92Ym94dmlkZW86IFN3aXRjaCB0byBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0eV9mYigpCj4gICAg
ZHJtL3Zib3h2aWRlbzogUmVwbGFjZSBzdHJ1Y3QgdnJhbV9mcmFtZWJ1ZmZlciB3aXRoIGdlbmVy
aWMKPiAgICAgIGltcGxlbWVuYXRpb24KClRoYW5rIHlvdSBmb3IgdGhlc2UgbmljZSBjbGVhbnVw
cywgdW5mb3J0dW5hdGVseSB0aGVyZSBpcyBhIHNtYWxsCmJ1ZyBpbiB0aGUgbGFzdCBwYXRjaCwg
eW91IGFyZSBzZXR0aW5nOgoKCS5mYl9jcmVhdGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZSwKCkJ1dCBz
aW5jZSBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggeW91IHN3aXRjaGVkIHRvIGRybV9hdG9taWNfaGVs
cGVyX2RpcnR5X2ZiCnRoYXQgc2hvdWxkIGJlOgoKCS5mYl9jcmVhdGUgPSBkcm1fZ2VtX2ZiX2Ny
ZWF0ZV93aXRoX2RpcnR5LAoKVGhlIG1pc3Npbmcgd2l0aF9kaXJ0eSBpcyBjYXVzaW5nIHNjcmVl
bnVwZGF0ZXMgdW5kZXIgYm90aCBwbHltb3V0aCBhbmQKZ25vbWUtc2hlbGwgKHdpdGggbGx2bXBp
cGUpIHRvIGdvbmUgbWlzc2luZy4gSSdsbCBzZW5kIGEgcGF0Y2ggZml4aW5nCnRoaXMuCgpSZWdh
cmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
