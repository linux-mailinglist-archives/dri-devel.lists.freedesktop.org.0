Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4DCB544
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090AF6EAC9;
	Fri,  4 Oct 2019 07:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.heh.ee (heh.ee [213.35.143.160])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9196E060;
 Thu,  3 Oct 2019 06:45:58 +0000 (UTC)
Received: from [0.0.0.0] (unknown [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.heh.ee (Postfix) with ESMTPSA id 9479116D285;
 Thu,  3 Oct 2019 09:45:55 +0300 (EEST)
Subject: Re: [Spice-devel] Xorg indefinitely hangs in kernelspace
To: Frediano Ziglio <fziglio@redhat.com>
References: <92785039-0941-4626-610b-f4e3d9613069@ristioja.ee>
 <20190905071407.47iywqcqomizs3yr@sirius.home.kraxel.org>
 <e4b7d889-15f3-0c90-3b9f-d395344499c0@ristioja.ee>
 <ccafdbaf-7f8e-8616-5543-2a178bd63828@ristioja.ee>
 <1174991123.3693721.1569850187145.JavaMail.zimbra@redhat.com>
From: Jaak Ristioja <jaak@ristioja.ee>
Openpgp: preference=signencrypt
Autocrypt: addr=jaak@ristioja.ee; prefer-encrypt=mutual; keydata=
 mDMEWyjlXBYJKwYBBAHaRw8BAQdABEPNmQfWmwZZXSl5vKnpI1UVtS4l2N9kv7KqyFYtfLe0
 IEphYWsgUmlzdGlvamEgPGphYWtAcmlzdGlvamEuZWU+iJYEExYIAD4WIQTjaPCMFhRItZ2p
 iV/uxscoTrbt3AUCWyjlXAIbIwUJA8OZNAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRDu
 xscoTrbt3OYPAP9l6ZjLh4qK2r/H1b+7a7qZIAjwf0o4AX6qvtX1WERxywEAhhtOHg+G8idL
 FR08XPW7nlobl2qEHMnqBTqteSsz1gG4OARbKOVcEgorBgEEAZdVAQUBAQdAU6y3a2gcxTI+
 bZgPkJjPXxr0tvuLpCqkIb/envF5ajADAQgHiH4EGBYIACYWIQTjaPCMFhRItZ2piV/uxsco
 Trbt3AUCWyjlXAIbDAUJA8OZNAAKCRDuxscoTrbt3OG5AP0cd6gLbKVSBvSEgRNQ+BNk/1a5
 lSQtocXAcwUx0X9h0gEAqIZ9u7pCWBlRTL+rij97VWWkB/jb1deZ2gExNhd6RAU=
Message-ID: <b902ffbf-9d25-89bc-2d46-d0a4f67dbee4@ristioja.ee>
Date: Thu, 3 Oct 2019 09:45:55 +0300
User-Agent: undefined
MIME-Version: 1.0
In-Reply-To: <1174991123.3693721.1569850187145.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ristioja.ee; s=mail; 
 t=1570085155; bh=lo1ytOcDtHw2l+3dcU7fGcAyQaVo6i3tIMNGf9S8fnI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=qfeWJJPzVyxQRpM7KEnuTiB4TNHfik16gyUY91NXyH3hViTA7orx+Y5FlNXFJumt2
 zBZmHcQl0BCENiK6lfOMLcVVezU2WLONRdW1DECWkq3csOga2Bk4Dw5n9PftXQv7px
 a7U8jB4VSsxY5Qy264mMZReKwLsD8HdGwLip91j4=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 spice-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAuMDkuMTkgMTY6MjksIEZyZWRpYW5vIFppZ2xpbyB3cm90ZToKPiAgIFdoeSBkaWRuJ3Qg
eW91IHVwZGF0ZSBidWcgYXQgaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3Vy
Y2UvbGludXgvK2J1Zy8xODEzNjIwPwo+IEkga25vdyBpdCBjYW4gc2VlbSB0ZWRpb3VzIGJ1dCB3
b3VsZCBoZWxwIHRyYWNraW5nIGl0LgoKSSBzdXBwb3NlIHRoZSBsYWNrIG9uIGNlbnRyYWxpemVk
IHRyYWNraW5nIGFuZCBoYW5kbGluZyBvZiBMaW51eCBrZXJuZWwKYnVncyBpcyBhIGRlbGljYXRl
IHRvcGljLCBzbyBJIGRvbid0IHdhbnQgdG8gcmFudCBtdWNoIG1vcmUgb24gdGhhdC4KVXBkYXRp
bmcgdGhhdCBidWcgd291bGQgdGVkaW91cyBhbmQgdGltZS1jb25zdW1pbmcgaW5kZWVkLCB3aGlj
aCBpcyB3aHkKSSBoYXZlbid0IGRvbmUgdGhhdC4gVG8gYmUgaG9uZXN0LCBJIGRvbid0IGhhdmUg
ZW5vdWdoIHRpbWUgYW5kIG1vdGl2YXRpb24uCgpJIHdvdWxkIGhhdmUgcG9zdGVkIGEgbGluayB0
byB0aGUgdXBzdHJlYW0gKGtlcm5lbCkgYnVnIHRyYWNrZXIgZm9yCnRoaXMsIGJ1dCBiZWluZyBj
b25maW5lZCBJIG9ubHkgcG9zdGVkIGEgbGluayB0byBteSBvcmlnaW5hbCBlLW1haWwgb24KdGhl
IHZpcnR1YWxpemF0aW9uIGxpc3QgUGlwZXJtYWlsIGFyY2hpdmUuIENhbiB5b3UgcGxlYXNlIHBy
b3ZpZGUgYQpiZXR0ZXIgVVJMIHRvIGEgcmVhc29uYWJseSBicm93c2FibGUgaW5kZXggb2YgdGhp
cyB3aG9sZSBlLW1haWwgdGhyZWFkCmluIHNvbWUgd2ViLWJhc2VkIG1haWxpbmcgbGlzdCBhcmNo
aXZlPyBQZXJoYXBzIHBvc3RpbmcgdGhhdCB0bwpMYXVuY2hwYWQgd291bGQgc3VmZmljZS4KCgo+
IEl0IHNlZW1zIHlvdSBhcmUgaGF2aW5nIHRoaXMgaXNzdWUgc2luY2UgcXVpdGUgc29tZSB0aW1l
IGFuZCB3aXRoCj4gbXVsdGlwbGUga2VybmVsIHZlcnNpb25zLgo+IEFyZSB5b3Ugc3RpbGwgdXNp
bmcgS3VidW50dT8gTWF5YmUgaXQgaGFwcGVucyBtb3JlIHdpdGggS0RFLgo+IEZyb20gdGhlIEtl
cm5lbCBsb2cgbG9va3MgbGlrZSBhIGRlYWQgbG9jay4KClllcywgSSdtIHVzaW5nIEt1YnVudHUg
MTkuMDQuCgoKQmVzdCByZWdhcmRzLApKYWFrIFJpc3Rpb2phCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
