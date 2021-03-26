Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D04934A97B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E316F3DF;
	Fri, 26 Mar 2021 14:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756316F3DF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:20:47 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 a132-20020a1c668a0000b029010f141fe7c2so5036914wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6xcgNGeiKXVzTZo3oILiZykt3w8GnNqVy7yzUHjFBQQ=;
 b=XeWeBn8WX5c+uJ8CnM+CQZtmzh/4bB4qoMOD512ejsGsAJhBMpIRE45WmKhdf2TLqx
 MiQ6KDk6/7dK5bC7/+YYWLHrtI06Ylrvmd6twooQS+XegMtZPl4Yf+uUHzXSdofzs0cp
 bvHUTHcKSdaDDHV+Y53fP3oLBS8LcoFCOQn4l1FbEJucpwut9t3dciREPiwQSF0ZQKKQ
 Ee1jr+vVwrB3+iekJsvmKwpu8RuaJaotHb+gkCtGTJOoxCEV/+4RHUazLmcluVA1pSht
 YojJg8tbVnIbRSxGQoaeSJBznKPSXq3Clwm4mlT+W4SXXom4TtpEkaUJ2pRM4TzCKw5Z
 FVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6xcgNGeiKXVzTZo3oILiZykt3w8GnNqVy7yzUHjFBQQ=;
 b=UFDUicHxGtZ6d0/QhQMg9rNjLKICnfGv5EBHQ2ICM+KlkBG/JA1nqAiRHboA8YaFJP
 QVqSL2a32tK+Yr7yzjo1N1ahgjy0dr737CIA2AfPvLGzG6WJvbRh4rZ8gpsPJo3+3mBy
 PihMa1bd3EZHoJ6bvt5Yx5jUgBnX3EToiUgS0Z88ivybtnBE4vTZm+b8rBeTYa1LzvPa
 mSb04KoVJy+n1z/5LyO0jXgQyYZ3Hz8tS1QSeJ1Sz+TKAtzwV4G11iyWYZEtot9sEvpR
 pBOR+fmWNzKJVxLuTqOhsaVuPk3Q4EBy313fYwMN4Cwvqmb/yftHOK6Svb2bUgYw5QMP
 KDMg==
X-Gm-Message-State: AOAM533RAe0VOL3niPSH1Q/0VAJU11rSdVrzBqILyemAxMtqZQcyNX+h
 8jU/Va8TojQ5w/KFZrWA7o/GAQ==
X-Google-Smtp-Source: ABdhPJzCoDvRJ0yro1yeYdy8gIdvQTImgu841Bp+OkX3kL6D2LJpK0xk7inIx+W3Fy7Q3UcDJTIu1w==
X-Received: by 2002:a05:600c:378c:: with SMTP id
 o12mr13377556wmr.69.1616768446113; 
 Fri, 26 Mar 2021 07:20:46 -0700 (PDT)
Received: from dell ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id e8sm11125675wme.14.2021.03.26.07.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:20:45 -0700 (PDT)
Date: Fri, 26 Mar 2021 14:20:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 00/25] Rid W=1 warnings from HID
Message-ID: <20210326142041.GZ2916463@dell>
References: <20210324173404.66340-1-lee.jones@linaro.org>
 <20210326114202.3862b8c5@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326114202.3862b8c5@jic23-huawei>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Zhang Lixu <lixu.zhang@intel.com>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Anssi Hannula <anssi.hannula@gmail.com>,
 Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Henrik Rydberg <rydberg@bitmath.org>,
 Lopez Casado <nlopezcasad@logitech.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Masaki Ota <masaki.ota@jp.alps.com>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Vojtech Pavlik <vojtech@suse.cz>, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 message to <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>, "L. Vinyard,
 Jr" <rvinyard@cs.nmsu.edu>, linaro-mm-sig@lists.linaro.org,
 Michael Haboustak <mike-@cinci.rr.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Drubin <daniel.drubin@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBNYXIgMjAyMSwgSm9uYXRoYW4gQ2FtZXJvbiB3cm90ZToKCj4gT24gV2VkLCAy
NCBNYXIgMjAyMSAxNzozMzozOSArMDAwMAo+IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5v
cmc+IHdyb3RlOgo+IAo+ID4gVGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0
ZW1wdGluZyB0byBjbGVhbi11cCBXPTEKPiA+IGtlcm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJy
ZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4gPiBuaWdnbHkgbGl0dGxlIHdhcm5p
bmdzLgo+IAo+IExlZSwgaXQncyBhIGJpdCBub3ZlbCB0byBjYyBsaW51eC1paW8gb24gdGhlIGNv
dmVyIGxldHRlciBidXQKPiBub25lIG9mIHRoZSBhY3R1YWwgcGF0Y2hlcy4uICBPciBsZWFzdCBu
b25lIG9mIHRoZW0gcmVhY2hlZAo+IG1lIG9yIGxvcmUua2VybmVsLm9yZwoKTG9va3MgbGlrZSBv
bmx5IDE4IG9mIHRoZSAyNSBhY3R1YWxseSBtYWRlIGl0IG9udG8gdGhlIGxpc3QuCgpIb3cgb2Rk
IQoKSG9sZCBvbiwgSSdsbCBzdWJtaXQgYSBbUkVTRU5EXS4KCj4gSSdtIHN1cmUgdGhleSBhcmUg
Z3JlYXQgOikKCk5hdHVyYWxseSEKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRl
Y2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
