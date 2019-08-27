Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D331F9FD06
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AD589CF3;
	Wed, 28 Aug 2019 08:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FCE8925D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 23:04:45 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 4so737053qki.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 16:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=twfAj3jJ2iISvtECbV5aZw57c7oT5wmcKVNF5jtBKzw=;
 b=Z+rZ3dRkZ6ETy8uv53r1Mf3Wd7UAtUoMEE1OdaCttuSlWVg87OVLDaAeWaPHS2g7hf
 YvNZd/giEngSIfKSBv4Q6i2kcfgXVPU7Sey+UShzBfEjF7c/s6v6JUpUxCed7aEBDPX7
 d2dTHB8GzabWWX/nx51Y2CR9zCAfQ0rg+nOTPVcsjWCAVBBFIRDwoCWcU63+zC12QLUe
 xTnK7IpmCgpHWhj8aDn9ZS1KEidE2rhpPqfz1nZr5uAfth98d42sCaX9DD+FjrL+fe9w
 ynUnCQK+3IUEGNU+Pyw3OPDApN/wzFCWa+RoaBY7zpYY/Qkq+GjHLp0asP138OnfeuDg
 3xkQ==
X-Gm-Message-State: APjAAAXKuHdcBlEnkktQfUJt6M+lXKTakeCcPO4leh4CuYNDUIOqB55f
 83pgQSeZxDRUWsBVr89PGlJ6Vw==
X-Google-Smtp-Source: APXvYqxETSoB7i089gEAZo3heQkfBeRm4nuAsZXEBqnzkt2y4Au7XwxwXBZ3oa3XifiOiixuSCRIRg==
X-Received: by 2002:a37:3d8:: with SMTP id 207mr671091qkd.191.1566947084848;
 Tue, 27 Aug 2019 16:04:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-216-168.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.216.168])
 by smtp.gmail.com with ESMTPSA id u28sm319212qtc.18.2019.08.27.16.04.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 16:04:44 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i2kW3-0007TV-VG; Tue, 27 Aug 2019 20:04:43 -0300
Date: Tue, 27 Aug 2019 20:04:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 0/5] mmu notifer debug annotations
Message-ID: <20190827230443.GA28580@ziepe.ca>
References: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=twfAj3jJ2iISvtECbV5aZw57c7oT5wmcKVNF5jtBKzw=;
 b=TXlm0q2xcS7/T/OenFpz5vi4Yo1hovc71pjCHSJFZtpy8c9XUnNxETQI04ONVL0JIb
 xjCg1ybda4kro9E97QJSZSC/ihNDktOyYrdT8R26XLgljCtsNC1Vrq1jHptibE/6c1Nf
 EnImq/F6CeVQdv8DhnroTOVUgpGI4Q53Tzi+7QBPIjjUtOvPjrzPVX/jcKew3UlbKL90
 uUttussOAeggtW9AKfycy76g+BnNBWpDYxb+G9wjbjpqMtDqXs7hiScwYsQlSR3G6afw
 kwtNsqYgOSibPsNyIiq4ivvhuJDj/CXdeSuB6tWCMVfMG0Gr1JdzT+6jpEuRLfpulGpr
 muWg==
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
Cc: Linux MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMTA6MTQ6MjBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBIaSBhbGwsCj4gCj4gTmV4dCByb3VuZC4gQ2hhbmdlczoKPiAKPiAtIEkga2VwdCB0
aGUgdHdvIGxvY2tkZXAgYW5ub3RhdGlvbnMgcGF0Y2hlcyBzaW5jZSB3aGVuIEkgcmViYXNlZCB0
aGlzCj4gICBiZWZvcmUgcmV0ZXN0aW5nIGxpbnV4LW5leHQgZGlkbid0IHlldCBoYXZlIHRoZW0u
IE90aGVyd2lzZSB1bmNoYW5nZWQKPiAgIGV4Y2VwdCBmb3IgYSB0cml2aWFsIGNvbmZsaWN0Lgo+
IAo+IC0gQWNrIGZyb20gUGV0ZXIgWi4gb24gdGhlIGtlcm5lbC5oIHBhdGNoLgo+IAo+IC0gQWRk
ZWQgYW5ub3RhdGlvbnMgZm9yIG5vbl9ibG9jayB0byBpbnZhbGlkYXRlX3JhbmdlX2VuZC4gSSBj
YW4ndCB0ZXN0Cj4gICB0aGF0IHJlYWRpbHkgc2luY2UgaTkxNSBkb2Vzbid0IHVzZSBpdC4KPiAK
PiAtIEFkZGVkIG1pZ2h0X3NsZWVwIGFubm90YXRpb25zIHRvIGFsc28gbWFrZSBzdXJlIHRoZSBt
bSBzaWRlIGtlZXBzIHVwCj4gICBpdCdzIHNpZGUgb2YgdGhlIGNvbnRyYWN0IGhlcmUgYXJvdW5k
IHdoYXQncyBhbGxvd2VkIGFuZCB3aGF0J3Mgbm90Lgo+IAo+IENvbW1lbnRzLCBmZWVkYmFjaywg
cmV2aWV3IGFzIHVzdWFsIHZlcnkgbXVjaCBhcHByZWNpYXRlZC4KPiAKPiAKPiBEYW5pZWwgVmV0
dGVyICg1KToKPiAgIG1tLCBub3RpZmllcjogQWRkIGEgbG9ja2RlcCBtYXAgZm9yIGludmFsaWRh
dGVfcmFuZ2Vfc3RhcnQvZW5kCj4gICBtbSwgbm90aWZpZXI6IFByaW1lIGxvY2tkZXAKPiAgIG1t
LCBub3RpZmllcjogYW5ub3RhdGUgd2l0aCBtaWdodF9zbGVlcCgpCgpJIHRvb2sgdGhlc2Ugb25l
cyB0byBobW0uZ2l0IGFzIHRoZXkgaGF2ZSBhIHNtYWxsIGNvbmZsaWN0IHdpdGggaG1tJ3MKY2hh
bmdlcy4KCj4gICBrZXJuZWwuaDogQWRkIG5vbl9ibG9ja19zdGFydC9lbmQoKQo+ICAgbW0sIG5v
dGlmaWVyOiBDYXRjaCBzbGVlcGluZy9ibG9ja2luZyBmb3IgIWJsb2NrYWJsZQoKTGV0cyBzZWUg
YWJvdXQgdGhlIGNoZWNrcGF0Y2ggd2FybmluZyBhbmQgcmV2aWV3IG9uIHRoZXNlIHR3byBwbGVh
c2UKClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
