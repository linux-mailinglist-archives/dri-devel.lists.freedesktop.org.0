Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A71F132389
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 11:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EB06E826;
	Tue,  7 Jan 2020 10:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919E96E826
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 10:27:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 20so18717072wmj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 02:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=vBJGzXj5QdU43lWqUTAK5EXXNmW/nqsNzSmp/l5OPpE=;
 b=aoX/Wy5i7qneVbenio7YTr67jD+P8zBkFjTqdw7o2qfMsEYiXtFRLf6pgVqm/wP9RX
 AO4rcKUpwHJj4ho+cFej84k2SV53pv9uxT5cleSAmAlnGk+fmm+eP0nRzRiX4f/Pr9/K
 1ZvUJGwLxolkD2bdOzL/Xoy3NCdKQo5Fn4HH2EqpcMMF8MGFX20n/8ZNW978QeM6Wclb
 vT7rIJ3NnZ2jFWq9RO1tbJmDmRRcZLF8pSl2Uh253eVq59Un4GYkflUALwCTZAcmRVbl
 XDNkA+vEz1f94slKwgkTZ/CP+l3tgRPcPhG9e7T1gnPGiggs8eo5+TFOQIZszjiWaNRa
 ceaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vBJGzXj5QdU43lWqUTAK5EXXNmW/nqsNzSmp/l5OPpE=;
 b=C+C4lXhI8rRQNZ3q4lFuFeq1x2hCg0J+599yYrRlOwhhzrH/zp9qR5rFvf5udg26uq
 NsCWmdFp77GLBlgZluzCfCo6OCxUGxWefpC7DrKLzfmMfjI36AtWilmZ1kMArWxGPUXp
 2Zaydb5nq7u3db3rfVlwH3mEO/UBYBkl94bTw0xBzpptOejquoiazmEBzCtcDOYp2kaK
 fljXEyvphYzU9Po0kARtfL1cGfqvRzC7iZmczlkI1G4y9NfuNETzG0K3ExvdGcgBCgEx
 xmkEcAOR+JVbU28bIHqy+szyUaIPoCJwBozfgm2K+haAXcegHh4SeiARbo1AP0az3VVK
 h+vg==
X-Gm-Message-State: APjAAAVeQQzPqzgsoiaFCl+UZY/8FKt1iWORIRpgrs9fF5CoETf05UDS
 Fvoxj6GG3SMm8SMDKAM6WgDmRQ==
X-Google-Smtp-Source: APXvYqx+AqXuXl4H0wjfxYwUwjlLbufwCeWtYLbBBNVm8LWKRulRE5vHHqKjtGB4u0aE4Lh97eKyYw==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr40609247wma.159.1578392873273; 
 Tue, 07 Jan 2020 02:27:53 -0800 (PST)
Received: from dell ([2.27.35.135])
 by smtp.gmail.com with ESMTPSA id t8sm73646767wrp.69.2020.01.07.02.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 02:27:52 -0800 (PST)
Date: Tue, 7 Jan 2020 10:28:00 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v10 6/6] backlight: add led-backlight driver
Message-ID: <20200107102800.GG14821@dell>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-7-jjhiblot@ti.com>
 <20191121181350.GN43123@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121181350.GN43123@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com,
 sre@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMSBOb3YgMjAxOSwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKCj4gSGksCj4gCj4gKiBK
ZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+IFs3MDAxMDEgMDA6MDBdOgo+ID4g
RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPiA+IAo+ID4gVGhp
cyBwYXRjaCBhZGRzIGEgbGVkLWJhY2tsaWdodCBkcml2ZXIgKGxlZF9ibCksIHdoaWNoIGlzIHNp
bWlsYXIgdG8KPiA+IHB3bV9ibCBleGNlcHQgdGhlIGRyaXZlciB1c2VzIGEgTEVEIGNsYXNzIGRy
aXZlciB0byBhZGp1c3QgdGhlCj4gPiBicmlnaHRuZXNzIGluIHRoZSBIVy4gTXVsdGlwbGUgTEVE
cyBjYW4gYmUgdXNlZCBmb3IgYSBzaW5nbGUgYmFja2xpZ2h0Lgo+IC4uLgo+IAo+ID4gKwlyZXQg
PSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiZGVmYXVsdC1icmlnaHRuZXNzIiwgJnZhbHVl
KTsKPiA+ICsJaWYgKCFyZXQgJiYgdmFsdWUgPD0gcHJpdi0+bWF4X2JyaWdodG5lc3MpCj4gPiAr
CQlwcml2LT5kZWZhdWx0X2JyaWdodG5lc3MgPSB2YWx1ZTsKPiA+ICsJZWxzZSBpZiAoIXJldCAg
JiYgdmFsdWUgPiBwcml2LT5tYXhfYnJpZ2h0bmVzcykKPiA+ICsJCWRldl93YXJuKGRldiwgIklu
dmFsaWQgZGVmYXVsdCBicmlnaHRuZXNzLiBJZ25vcmluZyBpdFxuIik7Cj4gCj4gSG1tIHNvIGp1
c3Qgd29uZGVyaW5nLi4gQXJlIHdlIHVzaW5nICJkZWZhdWx0LWJyaWdodG5lc3MiIGluc3RlYWQg
b2YgdGhlCj4gdXN1YWwgImRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCIgaGVyZT8KCkRpZCB0aGlz
IGdldCBhbnN3ZXJlZD8KCj4gUGxlYXNlIENjIG1lIG9uIHRoZSBuZXh0IHBhdGNoc2V0IHRvbyA6
KQoKSSd2ZSBiZWVuIHdhaXRpbmcgZm9yIHYxMS4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10K
TGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNl
IHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIg
fCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
