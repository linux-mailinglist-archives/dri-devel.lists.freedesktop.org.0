Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648431BF520
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 12:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DB16E207;
	Thu, 30 Apr 2020 10:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFAC6E1EC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 10:15:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b11so6170395wrs.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 03:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=5pQJEnxi1ZD+zVU+9wcTIUMU9jsK5QVaYW3YwxeiYoA=;
 b=Z4jK5/Q2+yoNtPe/piK7UBqVqFGX3OQ89ytUfl7UNsG1b3m1ifHBlWIPg/YkRSxjdB
 c0wRXwmsaIE9EL6X0sMWhLn22ryuw+Yru4vK+o1MRzuIGNaz6bzvJgzvLU5tnlsn2SJP
 Gz9PSWgIGheg8T4zZsrhNkB3BJRfmwKnuSqwEOQ9jQGiUlwtEg9H7V2mSJDRYr23yNmW
 xJmhQbv9+ySDyAv8C9XOL6EgJOSfI2RLCD9WSz9uz2R4gDiIzJ2NzLohL5lkIUaJBeUK
 FjBEJ/K4dTqsQUzR2zJz3S6KzDrKLAAHq6Ucq/K1BiCYSgkFdxdHZq8wobW2E2nvcWbs
 Jpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5pQJEnxi1ZD+zVU+9wcTIUMU9jsK5QVaYW3YwxeiYoA=;
 b=bU7hhnsMYUj9zpCYrm7+UTKUmDJ5kMIU0KmxxWQGjmOqUsQzBGOsWarwAheLGlB3Ts
 mSLL351vZWrwy0wLCuKrHMfsVQS3IDDoqxA//WjGDqOg/G5+ogT1NFbXwmDsEPK9aVCi
 APVipAbf6DQiU0vMwFu7KLoaxsF7fayRYUrFHiRisvl4jQL7fBeE7pL8hW9JrQloeNH2
 PBDkLPBovdwsbnEe71B4OpRpa+K5aedhpvZBjsUv+F7g3wWKtAb1Y62rEpxqEqN/Emgm
 563fzMGRM3fkfJiqNkkK5KiUUz6au3blCUCgY5G8m9DWx58usXKd8QBYGLmQw9UKoV5v
 F7nQ==
X-Gm-Message-State: AGi0PuZX3Ah6r36jxAVKDYls1+WYTl61XcvDVKkA/6LDLgK2wY1bBE6J
 2MB6YrWbuhLqKNeM2aNDpuhGqQ==
X-Google-Smtp-Source: APiQypKyDzrfbAtIeZ2On3yC+hU2HnQ8q4rO6XTcJ+rJCMBGwEiDGDglmxTwGckDzQa3DmceDN9vbQ==
X-Received: by 2002:adf:f1c5:: with SMTP id z5mr3261383wro.100.1588241734021; 
 Thu, 30 Apr 2020 03:15:34 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id h1sm12675147wme.42.2020.04.30.03.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 03:15:33 -0700 (PDT)
Date: Thu, 30 Apr 2020 11:15:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200430101529.GB298816@dell>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org>
 <20200430083219.GC3118@dell>
 <0fbc4eb5-cb39-5974-85bb-9f13278ecab4@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fbc4eb5-cb39-5974-85bb-9f13278ecab4@tronnes.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAzMCBBcHIgMjAyMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgoKPiAKPiAKPiBEZW4g
MzAuMDQuMjAyMCAxMC4zMiwgc2tyZXYgTGVlIEpvbmVzOgo+ID4gT24gV2VkLCAyOSBBcHIgMjAy
MCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+ID4gCj4gPj4gQWRkIGEgd2F5IHRvIGxvb2t1cCBh
IGJhY2tsaWdodCBkZXZpY2UgYmFzZWQgb24gaXRzIG5hbWUuCj4gPj4gV2lsbCBiZSB1c2VkIGJ5
IGEgVVNCIGRpc3BsYXkgZ2FkZ2V0IGdldHRpbmcgdGhlIG5hbWUgZnJvbSBjb25maWdmcy4KPiA+
Pgo+ID4+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4+IENjOiBEYW5p
ZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+ID4+IENjOiBKaW5nb28g
SGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLD
uG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiA+PiAtLS0KPiA+PiAgZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvYmFja2xpZ2h0LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiA+PiAgaW5j
bHVkZS9saW51eC9iYWNrbGlnaHQuaCAgICAgICAgICAgfCAgMSArCj4gPj4gIDIgZmlsZXMgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBPbmNlIHJldmlld2VkLCBjYW4gdGhpcyBw
YXRjaCBiZSBhcHBsaWVkIG9uIGl0cyBvd24/Cj4gPiAKPiAKPiBJZiB5b3UgY2FuIGFwcGx5IGl0
IGZvciA1LjgsIHRoZW4gd2UncmUgZ29vZC4gRFJNIGhhcyBjdXRvZmYgYXQgLXJjNSBhbmQKPiB0
aGUgZHJpdmVyIHdvbid0IGJlIHJlYWR5IGZvciB0aGF0LiBUaGlzIHBhdGNoIGhhcyB0aGlzIGRl
cGVuZGVuY3kKPiBjaGFpbjogdXNiIC0+IGRybSAtPiBiYWNrbGlnaHQuIFNvIGlmIHlvdSBjYW4g
YXBwbHkgaXQgZm9yIDUuOCwgdGhpbmdzCj4gZ2V0cyBlYXNpZXIuCj4gCj4gPiBNeSBndWVzcyBp
cyB0aGF0IGl0IGNhbid0LCBhcyB0aGUgb3RoZXIgcGF0Y2hlcyBpbiB0aGlzIHNldCBkZXBlbmQg
b24KPiA+IGl0LCByaWdodD8gIElmIHRoaXMgYXNzdW1wdGlvbiBpcyB0cnVlLCB5b3UgbmVlZCB0
byBzZW5kIG1lIHRoZSByZXN0Cj4gPiBvZiB0aGUgc2V0Lgo+ID4gCj4gPiBGWUk6IEl0J3Mgbm9y
bWFsbHkgYmV0dGVyIHRvIHNlbmQgdGhlIHdob2xlIHNldCB0byBldmVyeW9uZSwgYXMgaXQKPiA+
IHByb3ZpZGVzIHZpc2liaWxpdHkgb24gY3VycmVudCByZXZpZXcgKG9yIGxhY2sgdGhlcmUgb2Yp
IHN0YXR1cyBvZiB0aGUKPiA+IG90aGVyIHBhdGNoZXMgYW5kIGFsbG93cyBlYWNoIG9mIHRoZSBt
YWludGFpbmVycyB0byBkaXNjdXNzIHBvc3NpYmxlCj4gPiBtZXJnZSBzdHJhdGVnaWVzLgo+IAo+
IGRyaS1kZXZlbCBpcyB0aGUgTUwgZm9yIGJhY2tsaWdodCBzbyBJIGFzc3VtZWQgeW91IGdvdCB0
aGUgZnVsbCBzZXQuCgpkcmktZGV2ZWwgaXNuJ3QgdGhlIE1MIGZvciBCYWNrbGlnaHQuICBJdCdz
IGFuIGludGVyZXN0ZWQgcGFydHkuCgpJIGNlcnRhaW5seSBoYXZlIG5vIGludGVudGlvbiBvZiBz
dWJzY3JpYmluZyB0byBpdC4KCj4gSSBoYXZlIGhhZCB0cm91YmxlIGluIHRoZSBwYXN0IHdpdGgg
bXkgZW1haWwgcHJvdmlkZXIgZHJvcHBpbmcgcGFydHMgb2YKPiBhIHNlcmllcyB3aGVuIEkgaGFk
IHRvIG1hbnkgcmVjaXBpZW50cy4KCldpdGhvdXQgdmlzaWJpbGl0eSBpbnRvIHRoZSBvdGhlciBw
YXRjaGVzIGluIHRoZSBzZXQsIHRoaW5ncyBiZWNvbWUKbW9yZSBkaWZmaWN1bHQuICBNYXliZSB1
c2UgYSBkaWZmZXJlbnQvYmV0dGVyIGVtYWlsIHByb3ZpZGVyLgoKLS0gCkxlZSBKb25lcyBb5p2O
55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
