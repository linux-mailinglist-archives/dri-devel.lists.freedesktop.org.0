Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CD141C00
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682648921B;
	Wed, 12 Jun 2019 06:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B58C891CC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 06:09:33 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v14so15449065wrr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 23:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=jNHpo9jnwtLQwuoRcj9Ch+fhiSgA7li7+xLd+t9vX0c=;
 b=B1zmScCwxBZzRsFD+l+gFz6xU0g45yc1z6lI+ktodT2rTc82/jqh4Lk4did24snVil
 3JevSpxY/3ezhKPsAUGYw/vgSguNLgOarGTioVfRCs1Fps1VWsG/gHNWG6r2go27TlUm
 ui/sHiH8taYDhuBMUuc4IztXtykLk94bRSd4BYLuBBS9mLw1ZbPI/VCx38Npci3hqWp0
 7vejt2Qx/2bRQIu9wubxfJ3W521yZaBU+DyHw1jZorTrltdvxQ38F4yPZhdhnoOKwYjP
 es1GJjVIuALi++JRIjpDUKbo7HFCqkQqI0B1rge6Fc2qJc3HsejxYDm5CSugNxw7sPRT
 huLg==
X-Gm-Message-State: APjAAAUmXtG6tIYy7aGaXUU3LKc4oGiEjNsBhlzkd2YEpXcPZ1Z1T5pH
 r8L6TbwWkp24NRukUEAiR7EGFw==
X-Google-Smtp-Source: APXvYqyfYkZe1DnheBkxB3YZco+J1bRcMmIGxS+HOyR0Pfaq+SvAfBz+F8jQnAiX9kHfVifedeh39g==
X-Received: by 2002:adf:db02:: with SMTP id s2mr17167183wri.326.1560319771955; 
 Tue, 11 Jun 2019 23:09:31 -0700 (PDT)
Received: from dell ([2.27.35.243])
 by smtp.gmail.com with ESMTPSA id x16sm4926192wmj.4.2019.06.11.23.09.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Jun 2019 23:09:31 -0700 (PDT)
Date: Wed, 12 Jun 2019 07:09:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 00/33] fbcon notifier begone v3!
Message-ID: <20190612060929.GR4797@dell>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
 <CGME20190606073852epcas2p27b586b93869a30e4658581c290960fee@epcas2p2.samsung.com>
 <CAKMK7uHneUFYPiRr10X9xfWTkGtaoQBB=niDMGkAgJ-fgo5=mA@mail.gmail.com>
 <f848b4de-abab-116f-ad68-23348f1a4b76@samsung.com>
 <20190611141635.rowolr37vhalophr@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611141635.rowolr37vhalophr@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=jNHpo9jnwtLQwuoRcj9Ch+fhiSgA7li7+xLd+t9vX0c=;
 b=m8hJ2c0e3XNePvN0CW1AiuPtb6Tsm06LSMqOrEr8m/J+EAR2QK9ql0ebHsCP92aYtm
 6mqLiXGOBxsAgcaVMen9cmq1ZpkUojqFwNGKIwtxFMW7WyZKtUN5lpGdRMe0Gas16jpj
 LAT07r46pjG8q0yGqgzQizG+DFkTulNQjXqCIVy7uFbfJvOqkXl0LUGpPnKAlJyZ69qZ
 ukRc/AgAIoYDjFv5PLPBWCkh0YO8NkXsGen4B1A4NvEPVvnuVFSFyNnX14GS+Aa3aiBB
 tkgCuX8/fXozn76HmTNJ00VbrHdXvIAdJJGEGk3lkGLF5stuCF/piv6JjYoIPvT2lIhL
 Mw2Q==
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMSBKdW4gMjAxOSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IE9uIEZyaSwgSnVu
IDA3LCAyMDE5IGF0IDEyOjA3OjU1UE0gKzAyMDAsIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3og
d3JvdGU6Cj4gPiBPbiA2LzYvMTkgOTozOCBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IAo+
ID4gPj4gLSBIYXNoIG91dCBhY3R1YWwgbWVyZ2UgcGxhbi4KPiA+ID4gCj4gPiA+IEknZCBsaWtl
IHRvIHN0dWZmIHRoaXMgaW50byBkcm0uZ2l0IHNvbWVob3csIEkgZ3Vlc3MgdG9waWMgYnJhbmNo
IHdvcmtzCj4gPiA+IHRvby4KPiA+IAo+ID4gSSB3b3VsZCBsaWtlIHRvIGhhdmUgdG9waWMgYnJh
bmNoIGZvciB0aGlzIHBhdGNoc2V0Lgo+IAo+IEZyb20gYSBiYWNrbGlnaHQgcGVyc3BlY3RpdmUg
aXRzIExlZSBKb25lcyB3aG8gaG9vdmVycyB1cCB0aGUgcGF0Y2hlcwo+IGFuZCB3b3JyaWVzIGFi
b3V0IGhpZGluZyBtZXJnZSBjb25mbGljdHMgZnJvbSBMaW51cy4KPiAKPiBJJ2xsIGxldCBoaW0g
Zm9sbG93IHVwIGlmIG5lZWRlZCBidXQgSSBzdXNwZWN0IGhlJ2QgbGlrZSBhbiBpbW11dGFibGUK
PiBicmFuY2ggdG8gd29yayBmcm9tIGFsc28uCgpZZXMgcGxlYXNlLiAgSGFwcHkgdG8gZWl0aGVy
IGNyZWF0ZSBvbmUsIG9yIHJlY2VpdmUgb25lLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpM
aW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8
IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
