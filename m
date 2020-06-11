Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0921F6380
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 10:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B1D6E0F7;
	Thu, 11 Jun 2020 08:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6836E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 08:25:44 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m32so3308381ede.8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 01:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ffl5DffkUJVRpn1KdY9T29WmffxTORturS2cf5oCC9o=;
 b=wa9LpQfJOfJ1BlrDYBAbP3nM7Nz2q/CQsjWbPmh4xKhAi3i+5NVIL9OCqBSX/9p4p+
 HyUnVFQDiZ9fU2EobEZXu5oAZJeetWaDM3n3aBkTudxjpVcCNb+mOLAROkkb/chAWTSJ
 ZvsVJKdmLkjqKYyMNKIXNzbSCY3SeaVSvxlTdHETpFSufhzn8NbM80HRBn+TwXNFsDdl
 FMCqsQyfjWa3RuhVrXfdRwpfldZ+Oz+a1AErW4rDKYhX+DRMN2x3ifFnMoKzI+NkH4LU
 CfITDscNEh8GAHNeb9B1Gh749qoUf4GKhtYdN0S/YbNZ3PCUNbm5kc7Zfpb2XrjXnx47
 ofjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ffl5DffkUJVRpn1KdY9T29WmffxTORturS2cf5oCC9o=;
 b=m6LZsGcdYxyERxSGalFrhBV7jtRvj7ZhvviayPWywbELB9zDEJXdo9R9R60UJKM9UD
 ymmbtBB0UfRgq02J9aLYARgPTMpDdws/09Zfmj/F09pCM2XM3q39xZUHxyAmR4vyfMXC
 8iOU5t8rtF2EqUp2lw9X0raN8f/oxzzZcKY933zto8rSgD2dZqow+4e1OFMtlp6FNY1W
 3ard5Z3aPefIHvNGH+gFlGPwjDRGy540/hlxjlhZRDsxYmpXiylgp3ZZgetJ8LNdsqXZ
 k6TDzeZA+AqIC9aozv3F7v0FHM4pkhQ7eZdG05hxZ6PBn+//KLC04tWgnEcqrvi0xY/6
 GlVw==
X-Gm-Message-State: AOAM532JAydTT2+VnXGuzFkrvNJTrcoTZRQsEdxGt5x8y/BgQ9ar/nIM
 yCEGR8Y/ougF/kGXvyOnKnW/QcrlU82yPZ5B+uCGI839uOI=
X-Google-Smtp-Source: ABdhPJy56NIBFHOxb/szKyuMHMYAq5Nhrhedew2jlPV4ckPWRdRZ9GbO0VG8xsE5J5IFkh8wCUYB3EcMUyUdVZWwVzM=
X-Received: by 2002:a5d:4245:: with SMTP id s5mr8244643wrr.6.1591863592231;
 Thu, 11 Jun 2020 01:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200610113059.2164132-1-thierry.reding@gmail.com>
 <ca53d82f-1fd0-b2da-cfbf-7183a977e1d1@gmail.com>
In-Reply-To: <ca53d82f-1fd0-b2da-cfbf-7183a977e1d1@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 11 Jun 2020 09:17:51 +0100
Message-ID: <CAPj87rMcXQozYX90wGYbv_vNnQ0-fLLnEdH3Lzio+B1L7xZuYg@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Add zpos property for cursor planes
To: Dmitry Osipenko <digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LAoKT24gVGh1LCAxMSBKdW4gMjAyMCBhdCAwODo1NCwgRG1pdHJ5IE9zaXBlbmtv
IDxkaWdldHhAZ21haWwuY29tPiB3cm90ZToKPiAxMC4wNi4yMDIwIDE0OjMwLCBUaGllcnJ5IFJl
ZGluZyDQv9C40YjQtdGCOgo+ID4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlh
LmNvbT4KPiA+IEFzIG9mIGNvbW1pdCA0ZGM1NTUyNWIwOTUgKCJkcm06IHBsYW5lOiBWZXJpZnkg
dGhhdCBubyBvciBhbGwgcGxhbmVzCj4gPiBoYXZlIGEgenBvcyBwcm9wZXJ0eSIpIGEgd2Fybmlu
ZyBpcyBlbWl0dGVkIGlmIHRoZXJlJ3MgYSBtaXggb2YgcGxhbmVzCj4gPiB3aXRoIGFuZCB3aXRo
b3V0IGEgenBvcyBwcm9wZXJ0eS4KPgo+IFdoYXQgcHJvYmxlbSBkb2VzIGl0IHNvbHZlPwoKV2Vs
bCwgaXQgZml4ZXMgdGhlIFdBUk5fT04sIHdoaWNoIGFzc2VydHMgdGhhdCBlaXRoZXIgbm8gcGxh
bmVzIGhhdmUKdGhlIHpwb3MgcHJvcGVydHkgYXR0YWNoZWQsIG9yIGFsbCBwbGFuZXMgaGF2ZSB0
aGUgenBvcyBwcm9wZXJ0eQphdHRhY2hlZC4gV2hlbiBvbmx5IF9zb21lXyBwbGFuZXMgaGF2ZSB0
aGUgcHJvcGVydHksIHRoZSBwcm9wZXJ0eSBpcwpwcmV0dHkgbXVjaCB1c2VsZXNzOiB6cG9zIGV4
aXN0cyB0byBndWFyYW50ZWUgdG8gdXNlcnNwYWNlIHRoZQpyZWxhdGl2ZSBvcmRlcmluZyBiZXR3
ZWVuIHBsYW5lcywgZGVmaW5lZCBieSB0aGUgdmFsdWUgb2YgdGhlCnByb3BlcnR5LiBJZiBub3Qg
YWxsIHBsYW5lcyBoYXZlIHRoZSBwcm9wZXJ0eSwgdGhlbiB1c2Vyc3BhY2UgY2Fubm90CnJlYXNv
biBhYm91dCB0aGUgb3JkZXJpbmcsIHNpbmNlIHNvbWUgb2YgdGhlIHBsYW5lcyBoYXZlIHVuZGVm
aW5lZApvcmRlcmluZy4KCkNoZWVycywKRGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
