Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D30411460
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 09:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA0B8929C;
	Thu,  2 May 2019 07:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75235892BE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 16:51:15 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id j11so8833610pff.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2019 09:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Kd5MuO+17SSO78jER84yawU/+kS4c+qH+M/4Z95iLNY=;
 b=S32c66SLoSI/6iconatQ/4LKhClZFsryqphMP+jWZWL2i81aMv0HBLeONcr8CIf0u4
 3irbhzX04X33IHRUXGLA0mSxhgxOVsrbhRXmzIKhRafgaXi4E7IRSvj/g7kxYht3Fzkw
 D65cLzDayzaG1NrE5KicUNX85jNapel8trPEP14a0KeRUdjnVYuaFNt7P/K88KO18XEN
 gTgcDzJaso/BXOpL8nZ2zp8RWmJMc3Y2/VsfiEILO9PptRoQeUnuIoDh5BvbLWKh2Itb
 C9WP3M0HmBk4/SDfJVrSJFDMAZU5+2CyQ3N9gMltJEV9K0XAbK5mknma52uhmvcbssnV
 xzjw==
X-Gm-Message-State: APjAAAVQBFu51SLf5ZxusaRekwV12Ci7bvnoOyRj4CDDqiUaP5Vz/Hfx
 Ip5ekVoEointiUrYGdCDjWqL5g==
X-Google-Smtp-Source: APXvYqwTaF3lkS2xcbZsYzpMTkI1G6dbKWjh7tN8qOSRuhSBT3G0ZPf6rYTURl8olJfGXJ2vBQZtGw==
X-Received: by 2002:a65:6145:: with SMTP id o5mr17411677pgv.262.1556729474737; 
 Wed, 01 May 2019 09:51:14 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id 18sm58777799pfp.18.2019.05.01.09.51.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 May 2019 09:51:13 -0700 (PDT)
Date: Wed, 1 May 2019 09:51:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Fix mdp5_cfg_init error return
Message-ID: <20190501165115.GH2938@tuxbook-pro>
References: <20190501161437.15728-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501161437.15728-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Thu, 02 May 2019 07:42:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Kd5MuO+17SSO78jER84yawU/+kS4c+qH+M/4Z95iLNY=;
 b=p4961rDhAAkYdVL2MmCqcSFfDmoIe5vhA3cShJh7egp3Eb4kLmL2sB5jcTZBT1bBrs
 X2UUpPkwn29f2c9UAdFVjJrMkV/aK/zL0MDk5lw3aYKNt8+QE8TalXcEbVeApDAU7UpH
 c/g+s2N/Ee/n2VFwIgnhu9W8R9Ope8RnBjoUlC04/UVVNRV/DsvA60nM2TVkJcPgPPBn
 0NuLBjuj6N2yXocjsMpPtUk0uZ2h6lEVZZCL6NhHgemzzc6Y0KboxPCTpXRsyjpqwnkO
 9Fb6NIX/Wne6nx8wc6NGWcfcJ8cX/arFAHndFz2zwEoeHM97MNQ6pXGTfWQ6ddBRLQBq
 9foA==
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkIDAxIE1heSAwOToxNCBQRFQgMjAxOSwgSmVmZnJleSBIdWdvIHdyb3RlOgoKPiBJZiBt
ZHA1X2NmZ19pbml0IGZhaWxzIGJlY2F1c2Ugb2YgYW4gdW5rbm93biBtYWpvciB2ZXJzaW9uLCBh
IG51bGwgcG9pbnRlcgo+IGRlcmVmZXJlbmNlIG9jY3Vycy4gIFRoaXMgaXMgYmVjYXVzZSB0aGUg
Y2FsbGVyIG9mIGluaXQgZXhwZWN0cyBlcnJvcgo+IHBvaW50ZXJzLCBidXQgaW5pdCByZXR1cm5z
IE5VTEwgb24gZXJyb3IuICBGaXggdGhpcyBieSByZXR1cm5pbmcgdGhlCj4gZXhwZWN0ZWQgdmFs
dWVzIG9uIGVycm9yLgo+IAo+IEZpeGVzOiAyZTM2MmUxNzcyYjggKGRybS9tc20vbWRwNTogaW50
cm9kdWNlIG1kcDVfY2ZnIG1vZHVsZSkKClJldmlld2VkLWJ5OiBCam9ybiBBbmRlcnNzb24gPGJq
b3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPgoKPiBTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28g
PGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL21kcDUvbWRwNV9jZmcuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9tZHA1L21kcDVfY2ZnLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1
X2NmZy5jCj4gaW5kZXggZWE4ZjdkN2RhZjdmLi41MmUyMzc4MGZjZTEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jZmcuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY2ZnLmMKPiBAQCAtNzIxLDcgKzcyMSw3IEBAIHN0
cnVjdCBtZHA1X2NmZ19oYW5kbGVyICptZHA1X2NmZ19pbml0KHN0cnVjdCBtZHA1X2ttcyAqbWRw
NV9rbXMsCj4gIAlpZiAoY2ZnX2hhbmRsZXIpCj4gIAkJbWRwNV9jZmdfZGVzdHJveShjZmdfaGFu
ZGxlcik7Cj4gIAo+IC0JcmV0dXJuIE5VTEw7Cj4gKwlyZXR1cm4gRVJSX1BUUihyZXQpOwo+ICB9
Cj4gIAo+ICBzdGF0aWMgc3RydWN0IG1kcDVfY2ZnX3BsYXRmb3JtICptZHA1X2dldF9jb25maWco
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQo+IC0tIAo+IDIuMTcuMQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
