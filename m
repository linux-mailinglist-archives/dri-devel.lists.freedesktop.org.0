Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8809DC9D7C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 13:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3356E10A;
	Thu,  3 Oct 2019 11:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B586E10A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 11:40:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 3so2042614wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 04:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=gjHdxQE7PtU5YVyM+ycu+GpQGZRZGPXn8KLYV2GOEKk=;
 b=AoRISTiORsZ49gdu0yhaiuqZmE3g17E2iBWXh8s1umQRPeVx0b/DnEpHuYcoDJuGD5
 SnFWG+BO3NpeD+tSjafdk5iuNLI5cafhCVMo6GmvxaZ9bp5KSW+7ABsV0ROEXLkcEdCU
 IigQqaoOhcMkp6Eg1rGdt3wos0ZrFPR/nwS7mHXpL+B3dfyf0C+Lr6icy/L/qB5is+kf
 o/rkRVnJdEebpgN6AN9e7w4fZ7lu6FK+zviaOcqhPFhAgLxxQfiXEpO0GNRjdRZe05LW
 rpD85aHWsipdDuRQqUQ2Av+Jyq8HSmw06hN7Nh0GCm5MHwLvoxMX0uTFcUUSs48AQlQw
 oMaA==
X-Gm-Message-State: APjAAAVMcRG9GVq9qtIiU2hFOIuaziWPerAEZ1pnA32XU+qof0RsEvRj
 ALR/pPG1GhVGi1MBNWQ9FI1hrw==
X-Google-Smtp-Source: APXvYqzkSbKbEO08kV+O5J56dhn/FaSKA4qIomPodHv4axxtI0btIULXGYjMIdOtEj1HzR/N8fo89Q==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr6111876wml.86.1570102832057; 
 Thu, 03 Oct 2019 04:40:32 -0700 (PDT)
Received: from dell ([2.27.167.122])
 by smtp.gmail.com with ESMTPSA id q10sm5931600wrd.39.2019.10.03.04.40.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Oct 2019 04:40:31 -0700 (PDT)
Date: Thu, 3 Oct 2019 12:40:28 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v8 0/5] Add a generic driver for LED-based backlight
Message-ID: <20191003114028.GC21172@dell>
References: <20191003082812.28491-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003082812.28491-1-jjhiblot@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=gjHdxQE7PtU5YVyM+ycu+GpQGZRZGPXn8KLYV2GOEKk=;
 b=M4k7ZEaOrA5MBGW706POYnYF+p7UCzDpRDmB6KUX786TBU7kDYHUX5qgxshhoqyUQ8
 2h+yx+Wrx3YZkGDqFvQM2n76bQMi7hxDFFVRmqdFwDtmKDBHC0C1V4WbKZFFpmSKiNtk
 2dDq1dnYh8JFNYqnHUtvtgqPNTQxV5Pv+CQn+T2oHQ16zT6sk/3UJx4EkxEqfx6KIdLx
 JZwOvG9EH0TosRqhoWm+SWsNlwtJ0dPhJgNY7whXqUyetzZhUJ0nuNyMddCsl/BYp3T0
 IvpjkPZwd5ju/73exB5nEx++DHrubLvNaxZaAJuxkCLT7fv/3wBFAohiAaM+yy6nNT2g
 0oNg==
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwMyBPY3QgMjAxOSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKCj4gVGhpcyBz
ZXJpZXMgYWltcyB0byBhZGQgYSBsZWQtYmFja2xpZ2h0IGRyaXZlciwgc2ltaWxhciB0byBwd20t
YmFja2xpZ2h0LAo+IGJ1dCB1c2luZyBhIExFRCBjbGFzcyBkZXZpY2UgdW5kZXJuZWF0aC4KPiAK
PiBBIGZldyB5ZWFycyBhZ28gKDIwMTUpLCBUb21pIFZhbGtlaW5lbiBwb3N0ZWQgYSBzZXJpZXMg
aW1wbGVtZW50aW5nIGEKPiBiYWNrbGlnaHQgZHJpdmVyIG9uIHRvcCBvZiBhIExFRCBkZXZpY2U6
Cj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC83MjkzOTkxLwo+IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNzI5NDAwMS8KPiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzcyOTM5ODEvCj4gCj4gVGhlIGRpc2N1c3Npb24gc3RvcHBlZCBiZWNh
dXNlIFRvbWkgbGFja2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCgpbLi4uXQoKPiAgLi4uL2Jp
bmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgIDI4ICsrCj4gIGRyaXZl
cnMvbGVkcy9sZWQtY2xhc3MuYyAgICAgICAgICAgICAgICAgICAgICB8ICA5OCArKysrKystCj4g
IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcgICAgICAgICAgICAgICB8ICAgNyArCj4g
IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L01ha2VmaWxlICAgICAgICAgICAgICB8ICAgMSArCj4g
IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xlZF9ibC5jICAgICAgICAgICAgICB8IDI2MCArKysr
KysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9sZWRzLmggICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICA2ICsKPiAgNiBmaWxlcyBjaGFuZ2VkLCAzOTkgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0Cj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwuYwoKSG93IHNob3VsZCB0aGlz
IHNldCBiZSBwcm9jZXNzZWQ/ICBJJ20gaGFwcHkgdG8gdGFrZSBpdCB0aHJvdWdoCkJhY2tsaWdo
dCB2aWEgYW4gaW1tdXRhYmxlIGJyYW5jaCBhbmQgUFIgdG8gYmUgY29uc3VtZWQgYnkgTEVELgoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQK
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBM
aW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
