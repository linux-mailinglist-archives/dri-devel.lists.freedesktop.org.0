Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C9B2F1AC3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A1C6E106;
	Mon, 11 Jan 2021 16:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A506E106
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:19:34 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 190so335416wmz.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GKweivvV/MCkbxIb+dEuCmondK84mc3yFd2Dm4sVwKU=;
 b=zf9yevvuaN/7Mpolk4Tq0vrt7NA2/B8CG5E8d8qnAGPCt+5d497iKznwr8W096nKVg
 jYVrl9eV2yPdG95ziPv8qig4g16K7h6bVqXQiGeQmBjaOkEtKiK7sF0y1HDBeizcYYhY
 M1EjXXoX0SmhvsLWe3btD1CLMbwJzTBfhwloZD/TNJiNl3NxyFV9bc8J1RYsc3q4wqMZ
 vzA7Zmks9FDcw6VmAz6NteGYV5nCRBLV+WdD1TPfsRd6wmZwBPYjSBTJYeHL0JbMni9z
 /HEVrLN567EpR2+0+5clyaKnhyJosRtYD5P0Z4gfLGIgDI+EM8mhXOFArbSqIUxBAH6U
 pfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GKweivvV/MCkbxIb+dEuCmondK84mc3yFd2Dm4sVwKU=;
 b=Rffk0U3ZYllMUlMbA7hqXdME01sfP8KLeFf0RxclUsyIAROlKhsIlAe5ttmFyN/Vbc
 A/2SmSlmzzPlLb9WM7EIUpERAeUmlAypgg41zagxbos3WNAtsuBOMTn6I7bX70GQRyY+
 MGFw9nCPgS+JJ1rapyGGnGSb8fFc3lPmWLDqv0m7aFpZNETjaHIhFtn+8MM1WOZYKHdT
 gqeK0lKkHyfYo0zSTTBpU+HvijB56XG4tYUPN4lxthlToh81+RQ9s3nKEIaoWehadjzO
 8rrWC9fSTq7raxUhzGNdOmbtaiW5l0qu4xZWnDusCPh2mTxgDO0kjlCDpoXT7EVXZz95
 JBkg==
X-Gm-Message-State: AOAM530GK0ZykyTM6Vu/SvsnNOR7MDfLVeb38jyixShHIXDy2dYYcRrS
 hlqu8yY6j+q20iW5rbDVc7g+9g==
X-Google-Smtp-Source: ABdhPJz6cSjcKtSr136d9+ANUaDuZygUhfiAf+XT4Yfc5OsJik7vzzcpdJX4b++ePKscKpYNcH9n3Q==
X-Received: by 2002:a1c:b7d4:: with SMTP id h203mr417105wmf.59.1610381972707; 
 Mon, 11 Jan 2021 08:19:32 -0800 (PST)
Received: from dell ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id f77sm250282wmf.42.2021.01.11.08.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 08:19:31 -0800 (PST)
Date: Mon, 11 Jan 2021 16:19:30 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8] backlight: lms283gf05: Convert to GPIO descriptors
Message-ID: <20210111161930.GA3575260@dell>
References: <20210110120926.80471-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210110120926.80471-1-linus.walleij@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAxMCBKYW4gMjAyMSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhpcyBjb252ZXJ0
cyB0aGUgbG1zMjgzZ2YwNSBiYWNrbGlnaHQgZHJpdmVyIHRvIHVzZSBHUElPCj4gZGVzY3JpcHRv
cnMgYW5kIHN3aXRjaGVzIHRoZSBzaW5nbGUgUFhBIFBhbG0gWjIgZGV2aWNlCj4gb3ZlciB0byBk
ZWZpbmluZyB0aGVzZS4KPiAKPiBTaW5jZSB0aGUgcGxhdGZvcm0gZGF0YSB3YXMgb25seSB1c2Vk
IHRvIGNvbnZleSBHUElPCj4gaW5mb3JtYXRpb24gd2UgY2FuIGRlbGV0ZSB0aGUgcGxhdGZvcm0g
ZGF0YSBoZWFkZXIuCj4gCj4gTm90aWNlIHRoYXQgd2UgZGVmaW5lIHRoZSBwcm9wZXIgYWN0aXZl
IGxvdyBzZW1hbnRpY3MgaW4KPiB0aGUgYm9hcmQgZmlsZSBHUElPIGRlc2NyaXB0b3IgdGFibGUg
KGFjdGl2ZSBsb3cpIGFuZAo+IGFzc2VydCB0aGUgcmVzZXQgbGluZSBieSBicmluZ2luZyBpdCB0
byAiMSIgKGFzc2VydGVkKS4KPiAKPiBDYzogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4g
Q2M6IERhbmllbCBNYWNrIDxkYW5pZWxAem9ucXVlLm9yZz4KPiBDYzogSGFvamlhbiBaaHVhbmcg
PGhhb2ppYW4uemh1YW5nQGdtYWlsLmNvbT4KPiBDYzogUm9iZXJ0IEphcnptaWsgPHJvYmVydC5q
YXJ6bWlrQGZyZWUuZnI+Cj4gUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRo
b21wc29uQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgo+IC0tLQo+IENoYW5nZUxvZyB2Ny0+djg6Cj4gLSBSZWJhc2Ug
b250byB2NS4xMS1yYzEKPiAtIEkgd29uZGVyIHdoeSB0aGlzIG5ldmVyIHNlZW1zIHRvIGdldCBt
ZXJnZWQuLi4/CgpCZWNhdXNlIHlvdSBuZWVkIFNQSSAmIFBYQSBBY2tzIGFuZCBhIG1lcmdlIHBs
YW4uCgo+IENoYW5nZUxvZyB2Ni0+djc6Cj4gLSBSZWJhc2Ugb250byB2NS4xMC1yYzEKPiBDaGFu
Z2VMb2cgdjUtPnY2Ogo+IC0gUmViYXNlIG9udG8gdjUuOS1yYzEKPiBDaGFuZ2VMb2cgdjQtPnY1
Ogo+IC0gUmViYXNlIG9uIHY1LjgtcmMxCj4gLSBDb2xsZWN0ZWQgRGFuaWVsJ3MgUmV2aWV3ZWQt
YnkgdGFnLgo+IENoYW5nZUxvZyB2My0+djQ6Cj4gLSBDaGVjayBJU19FUlIoKSBvbiB0aGUgcmV0
dXJuZWQgR1BJTyBkZXNjcmlwdG9yLgo+IC0gVW5jb25kaXRpb25hbGx5IHNldCBjb25zdW1lciBu
YW1lIHNpbmNlIHRoZSBBUEkgdG9sZXJhdGVzIE5VTEwuCj4gQ2hhbmdlTG9nIHYyLT52MzoKPiAt
IEZpeCBhIHVzZS1iZWZvcmUtYWxsb2NhdGVkIGJ1ZyBkaXNjb3ZlcmVkIGJ5IGNvbXBpbGUgdGVz
dHMuCj4gLSBSZW1vdmUgdW51c2VkIHJldCB2YXJpYWJsZSBhcyBhdXRvYnVpbGRlcnMgY29tcGxh
aW5lZC4KPiBDaGFuZ2VMb2cgdjEtPnYyOgo+IC0gQnJpbmcgdXAgdGhlIEdQSU8gZGUtYXNzZXJ0
ZWQgaW4gcHJvYmUoKQo+IAo+IE1hcmVrOiBJIHNhdyB0aGlzIHdhcyB3cml0dGVuIGJ5IHlvdSwg
YXJlIHlvdSByZWd1bGFybHkKPiB0ZXN0aW5nIHRoZSBaMiBkZXZpY2U/Cj4gLS0tCj4gIGFyY2gv
YXJtL21hY2gtcHhhL3oyLmMgICAgICAgICAgICAgICB8IDEyICsrKysrLS0tCj4gIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2xtczI4M2dmMDUuYyB8IDQzICsrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0KPiAgaW5jbHVkZS9saW51eC9zcGkvbG1zMjgzZ2YwNS5oICAgICAgIHwgMTYgLS0tLS0t
LS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMo
LSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvc3BpL2xtczI4M2dmMDUuaAoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9w
ZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
