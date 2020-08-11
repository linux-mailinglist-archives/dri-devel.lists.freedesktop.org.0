Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C377241EFA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 19:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF8D89D73;
	Tue, 11 Aug 2020 17:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EED89D73
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 17:11:47 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id qc22so13905782ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0l/SRL7pr5EuODH0wPGCem/VHy7SAt74Bopx83rmD7I=;
 b=VraWxgd94p1CULGdoDJ7GFyb21qQRym+6KA7KLJapMdSOmuxJN8wHwu5L1D9Yzp0fs
 Gx1Bwjdt8LXtsbXzyA3aJf4KffXQnSloZ0ilVEMx5MnQPTRA6f3CTsNUHN1Scawxuyu8
 9WXDT7DvDlz8qoPpgLXqurAaBrQU/HejRtWMwWkqJoI2ad/hfQveSkTlSWK+JUPbdNHU
 iSJQtOiJY1GudRAhh56q8Y9vFp8K9R1Wy6INvhSH61k54khHPqcbmGMqgcEO/GZpkR9P
 DjjBvRf5cfMulECjDvDx+WFGxluttWGfMyosdhkMjSu35H6XC6kU7nSRch4Eg6ZvnFtD
 YWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=0l/SRL7pr5EuODH0wPGCem/VHy7SAt74Bopx83rmD7I=;
 b=E3Woq99J36KErOL6Pc4vWf5W+I4JG5dHXbGNRC+iEn8cs0X5bdoEVOEZfr7h02NhZb
 j+wogKzEthSPPpxIh7DXqFgKUAof1fCSW/xMXX27GFLwKJU35k7CA9DKOPm0hPpyxDkk
 ZS443bpG3GxmfhMGxCRA3hDPnbdGk4Oy+ytxbFmDxerKO2IIVRvWgBXYhH9pvTMkz+QP
 ms7DafKqVMLBPaSw0Gmh6u69g+l4HY/76aHtkFHj1isW3JW+Hd0jybiHxR1v6u4j6uk/
 htY2TSIi/GNVqg+CubyRdQXh+R65COn7h+pVxqPllWIcL6EfaE3NSVx2j5XPg3k62DU8
 lu8w==
X-Gm-Message-State: AOAM530qVbbQMCLZI9PIS2Q791iExYEL8mnVbp3eqbt4UdkkEDOyVS3U
 oEP559KHnkpkStipJuQGgILSRcLd
X-Google-Smtp-Source: ABdhPJwo9QaHI7ELhx0RxRt2/a3q6pNVAlfb9cIAjRbhPoP6nWCRu2RjNb+Kk8nO2p67Vh8R654dig==
X-Received: by 2002:a17:906:2b44:: with SMTP id
 b4mr26851055ejg.406.1597165905680; 
 Tue, 11 Aug 2020 10:11:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l24sm15508518eji.115.2020.08.11.10.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2020 10:11:44 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: revert "make TT creation purely optional v3"
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Dave Airlie <airlied@gmail.com>
References: <20200811092400.188124-1-christian.koenig@amd.com>
 <bbeaca4b-189d-c4dd-6d3a-e1489d6b0e4f@gmail.com>
 <052cbf93-00d1-6913-a278-eb3dafa86281@gmail.com>
 <12304df3-e891-9e8e-8a51-8be3c2bddc61@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e42482e1-6dc0-d4c5-4fd0-c6b15737e67c@gmail.com>
Date: Tue, 11 Aug 2020 19:11:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <12304df3-e891-9e8e-8a51-8be3c2bddc61@daenzer.net>
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
Reply-To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDguMjAgdW0gMTg6NDIgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDIwLTA4
LTExIDI6NTMgcC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTEuMDguMjAgdW0g
MTQ6NTIgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4gQW0gMTEuMDguMjAgdW0gMTE6MjQg
c2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMmRkZWYx
NzY3OGJjMmVhMWQyMDUxN2RkMmI0ZWQ0YWE5NjdmZmE4Yi4KPj4+Pgo+Pj4+IEFzIGl0IHR1cm5l
ZCBvdXQgVk1XR0ZYIG5lZWRzIGEgbXVjaCB3aWRlciBhdWRpdCB0byBmaXggdGhpcy4KPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPj4+IERhcmUgdG8gZ2l2ZSBtZSBhbiByYiBmb3IgdGhpcz8gSSBhbHJlYWR5IHRlc3Rl
ZCBvbiBhbWRncHUgYW5kIGl0Cj4+PiBzaG91bGQgYmUgZml4aW5nIHRoZSBWTVdHRlggcHJvYmxl
bXMgd2UgY3VycmVudGx5IGhhdmUuCj4+IFVwcywgdGhhdCB3YXMgeW91ciBvbGQgQU1EIGFkZHJl
c3MgOikKPj4KPj4gU28gb25jZSBtb3JlIHdpdGggZmVlbGluZywKPiA6KQo+Cj4gSG93ZXZlciwg
SSdtIGFmcmFpZCBJJ20gbm90IGRlZXAgZW5vdWdoIGludG8gVFRNIGNvZGUgYW55bW9yZSB0byBn
aXZlCj4geW91IGFuIFItYiwgZ2l2ZW4gaXQncyBub3QgYSBzdHJhaWdodCByZXZlcnQgKHByZXN1
bWFibHkgZHVlIHRvIG90aGVyCj4gY2hhbmdlcyBpbiB0aGUgbWVhbnRpbWUpLgoKWWVhaCwgaW5k
ZWVkIGhhZCB0byBrZWVwIERhdmVzIGNoYW5nZXMgaW50YWN0LgoKRGF2ZSBjYW4geW91IHRha2Ug
YSBsb29rIHRoZW4/CgpUaGFua3MgaW4gYWR2YW5jZSwKQ2hyaXN0aWFuLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
