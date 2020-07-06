Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CAD2152ED
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6196E0B9;
	Mon,  6 Jul 2020 07:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B14A6E0B9
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 07:13:44 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 17so40658341wmo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 00:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=y6aItrK3ggYlleH0/viUOY6qolHTQy/1u/+BpOihMeo=;
 b=Hg0xmjE2A2QgB70rmuXJ5Pw8tCPqmCSk8JyeYpHNJadeb74FDA/UNMbzhfZk64RUnP
 Zr1rpnoAHP8vavTwaW59I5ARloISn3axV1g6YgmRwGj5OWiSj+WmXPOmPtEbzqknfQWU
 ZEub0cl9lD2LDwyIaNdZxbMfO0V7M5aBmDE7L9N2p3GkyLma3aAtEVmjt1kQl/1CfoLJ
 8G9W1b0Lti/IYKiuN1mAlMLdlrJFH51PHTACl4zbOUDV3kuYMT4KnNzeIJlnnTDm4kA2
 PyqBePTZPGxmSCPnXDR9CrS1Vy9NuS/x9NqZ8lMU11tTceRZNBArWLIisVl+XdKf+pmi
 BywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=y6aItrK3ggYlleH0/viUOY6qolHTQy/1u/+BpOihMeo=;
 b=qDUr70J2GnIzdHCQXwkaJ1KffrahvEY/WTFD4ggE+nHlOvQQIm1CkjIgZxctsuim9m
 yzGVajXKb3QMgFlQpZ/o2rW8GtgzTS47G+wp5/JYCwqnJA8SGTyr80lpTzxmtZrC4Vn6
 1W28lhYBQMF9VdRxTckgnHSTdkXI8T8wrP4NQcr5w491p3/z0IKzIsV/IBk04xttCXCX
 Kw3kbykcAxFBem5RZCpgmQzgwD791x4KnewfeGRqrGDvbA3cQGfEu6WhWf/X3BG5BACW
 KoK6wlINalCTKtNt3CtSArs615sQCdeBsiqAtPeRtzKoZUXQQQ9V2LAbmj/ztWIDxbad
 ecwA==
X-Gm-Message-State: AOAM53026wfjvMPvDN/xuOsO0O1ZpNj0q1Fq3PEQ9LmLGTDjmdDi8tc1
 MHGduvJVHG98jRXpDJn9swPmPg==
X-Google-Smtp-Source: ABdhPJxWsjw1xgjYJUFiPLMMd5RNjJNu0hJkWTnvqG5HIkpSNJgHQAoTPWkdT0q52MWphuM5cnUMdA==
X-Received: by 2002:a1c:4406:: with SMTP id r6mr47190853wma.161.1594019623028; 
 Mon, 06 Jul 2020 00:13:43 -0700 (PDT)
Received: from dell ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id l3sm6561303wrx.22.2020.07.06.00.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 00:13:42 -0700 (PDT)
Date: Mon, 6 Jul 2020 08:13:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 0/8] Fix a bunch of W=1 warnings in Backlight
Message-ID: <20200706071340.GC2821869@dell>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-1-lee.jones@linaro.org>
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNCBKdW4gMjAyMCwgTGVlIEpvbmVzIHdyb3RlOgoKPiBBdHRlbXB0aW5nIHRvIGNs
ZWFuLXVwIFc9MSBrZXJuZWwgYnVpbGRzLCB3aGljaCBhcmUgY3VycmVudGx5Cj4gb3ZlcndoZWxt
aW5nbHkgcmlkZGxlZCB3aXRoIG5pZ2dseSBsaXR0bGUgd2FybmluZ3MuCj4gCj4gTGVlIEpvbmVz
ICg4KToKPiAgIGJhY2tsaWdodDogbG1zNTAxa2YwMzogUmVtb3ZlIHVudXNlZCBjb25zdCB2YXJp
YWJsZXMKPiAgIGJhY2tsaWdodDogbGNkOiBBZGQgbWlzc2luZyBrZXJuZWxkb2MgZW50cnkgZm9y
ICdzdHJ1Y3QgZGV2aWNlIHBhcmVudCcKPiAgIGJhY2tsaWdodDogaWxpOTIyeDogQWRkIG1pc3Np
bmcga2VybmVsZG9jIGRlc2NyaXB0aW9ucyBmb3IKPiAgICAgQ0hFQ0tfRlJFUV9SRUcoKSBhcmdz
Cj4gICBiYWNrbGlnaHQ6IGlsaTkyMng6IFJlbW92ZSBpbnZhbGlkIHVzZSBvZiBrZXJuZWxkb2Mg
c3ludGF4Cj4gICBiYWNrbGlnaHQ6IGlsaTkyMng6IEFkZCBtaXNzaW5nIGtlcm5lbGRvYyBkZXNj
cmlwdGlvbiBmb3IKPiAgICAgaWxpOTIyeF9yZWdfZHVtcCgpJ3MgYXJnCj4gICBiYWNrbGlnaHQ6
IGJhY2tsaWdodDogU3VwcGx5IGRlc2NyaXB0aW9uIGZvciBmdW5jdGlvbiBhcmdzIGluIGV4aXN0
aW5nCj4gICAgIEtlcm5lbGRvY3MKPiAgIGJhY2tsaWdodDogbG0zNjMwYV9ibDogUmVtb3ZlIGlu
dmFsaWQgY2hlY2tzIGZvciB1bnNpZ25lZCBpbnQgPCAwCj4gICBiYWNrbGlnaHQ6IHFjb20td2xl
ZDogUmVtb3ZlIHVudXNlZCBjb25maWdzIGZvciBMRUQzIGFuZCBMRUQ0Cj4gCj4gIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2JhY2tsaWdodC5jICB8IDIgKysKPiAgZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvaWxpOTIyeC5jICAgIHwgOCArKysrKystLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9sY2QuYyAgICAgICAgfCAxICsKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9i
bC5jIHwgNCArKy0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtczUwMWtmMDMuYyB8IDgg
LS0tLS0tLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgIHwgOCAtLS0t
LS0tLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygt
KQoKQWxsIGFwcGxpZWQgdG8gQmFja2xpZ2h0LgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpT
ZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIg
T3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29r
IHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
