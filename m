Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B54346613
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCDC6E91E;
	Tue, 23 Mar 2021 17:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618926E921
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 17:15:45 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v4so21573813wrp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jkD/89hzNsqmkTz0cgn45+3G97+hdN9w0MYvdcADVJY=;
 b=h8rraCmPEqparAn5HJ+4/mzapBhqLvKpCahb5I3lLD89c+5vSx0qm5c/WvW7Hkg0QW
 vLuQyjlK6th2ka7h1zdWq2tmQMvAueieDzg2NMMFh/wTs+KFqeDjfk8lMmtIsSDInfkj
 hgumkG5eOb9/9AvlNf9fzgg5pyrhWZAfJFjsgYr7T/qefxwDnXtc/szmhIhYx8BvhfHa
 5Ab99TVj4UW5nyy0ZNc0XDiExScRPMt0UBdDfxHlVqOGJRB6auO/+tvXmAP6dPMWr+wN
 J9ybc4PVrTZFO2L6EUnKoiv15Dx12limTVkfQqobEnnMtgbSy9vwB9+4RA9s9Cjouc2r
 +FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jkD/89hzNsqmkTz0cgn45+3G97+hdN9w0MYvdcADVJY=;
 b=mTqm5khyv75KM84OnQK3AD5vQmvrfnuC1b4QqiBRqjBh3lJp02Ovgjd4LD+YYubClI
 h/oXgj08QJVzBDOOZ0kRWL4PGdhUpMYViQnCHKBQ4wmjR9byLixSk5cbRMU0mLHLpDt/
 YtW/XcxDtkdMqbcDTd4615XqrERxlT9iWkXRA5EPs+aKONwXNMnYAIaNkj+r5DS6wuAp
 F4Mf+qY26zlRzmJo8gOn2TFIlo+K7IDIRuMpFdANrDK/pIAYOVmACXAcoujmrQr3TrFc
 p/uRG9z9PIIeM2UKUdGcfZenz8Ir3RJgcFueX92FkBP9dY2QEofFpmU7i495qy9MhgZH
 Xj/w==
X-Gm-Message-State: AOAM533P+R47DqU6ing7V0naZoKeAnZWjCPZxicWHbMktYbffdoZVU3U
 2nGTIG4sdPZDD6iy0VCPv3hpsw==
X-Google-Smtp-Source: ABdhPJzWk/7mbyRrWGJqZM8T40XSMeZ7AZ+LrfMOt0Jd/pLxU2JubXbpvZ4enfFd1MIJMNCEbK4leQ==
X-Received: by 2002:adf:e68e:: with SMTP id r14mr4985288wrm.273.1616519744011; 
 Tue, 23 Mar 2021 10:15:44 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g15sm2957207wmq.31.2021.03.23.10.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 10:15:43 -0700 (PDT)
Date: Tue, 23 Mar 2021 17:15:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/amd/display/dc/calcs/dce_calcs: Fix allocation
 size for dceip and vbios
Message-ID: <20210323171541.GX2916463@dell>
References: <20210323141541.348376-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323141541.348376-1-colin.king@canonical.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMyBNYXIgMjAyMSwgQ29saW4gS2luZyB3cm90ZToKCj4gRnJvbTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBDdXJyZW50bHkgdGhlIGFsbG9j
YXRpb25zIGZvciBkY2VpcCBhbmQgdmJpb3MgYXJlIGJhc2VkIG9uIHRoZSBzaXplIG9mCj4gdGhl
IHBvaW50ZXIgcmF0aGVyIHRoYW4gdGhlIHNpemUgb2YgdGhlIGRhdGEgc3RydWN0dXJlcywgY2F1
c2luZyBoZWFwCj4gaXNzdWVzLiBGaXggdGhpcyBieSB1c2luZyB0aGUgY29ycmVjdCBhbGxvY2F0
aW9uIHNpemVzLgo+IAo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJXcm9uZyBzaXplIG9mIGFyZ3Vt
ZW50IikKPiBGaXhlczogYTJhODU1NzcyMjEwICgiZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rj
ZV9jYWxjczogUmVtb3ZlIHNvbWUgbGFyZ2UgdmFyaWFibGVzIGZyb20gdGhlIHN0YWNrIikKPiBT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMg
fCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCkZpeGVkIGFscmVhZHkgbWF0ZS4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9y
IFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
