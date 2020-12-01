Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEED2C97F6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 08:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C7489A8B;
	Tue,  1 Dec 2020 07:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90CC89A98
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 07:19:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o1so990372wrx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 23:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=s4ekWG5Da7x/WlqkOj8PSgRoz7W2Hb23UEfpBiqdERA=;
 b=wYn5nmN58j3YBAM9oJ5NUmD1F8klWgjde92i623Ca9RiWgIL534fcOA9Lcia4oFz7M
 x24kwbi7GXajtELQDnw9ywTpPG4SALWUKaVDvQufJFEwwdF8t2fqxaNlWz2adxyEaHbJ
 2pSxZ4Xjlpz8L8qW1jDu4HypSuOHQ8W5JrOyuS8FjadVBt02HmwBHKFIBn+xWQXKgh40
 f2dxx5VOX6lnnFanIo+gDKf5PbUB+ZS5JWYFzDdfl1tWEd1QYcUwW61KERHnB3LtqBYF
 zQm4Sxc6OSLyQ1envR7P1rWBRGelrL4nRnx67y5sU9uRYO0I972UzWur4fIGGtmvJtRm
 +eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s4ekWG5Da7x/WlqkOj8PSgRoz7W2Hb23UEfpBiqdERA=;
 b=Yl9kX4KwAVbjwN+m5LwUL1CzaVNzSMKDyfgnz87sKHtSD7zNaFxQ8eGlZOmCeOzRUy
 aECpm5iD2MWhDUVD5ytLXyC6TblJmjg584gVq/KnkHCn4GkyZoC9LQ5UfOXRcZAz0qqG
 BY3vVfbPCvOCYLipLXbSg4oIQsdro255MuwDwA6Cwi/OHSI4YsG1EfRje+6Y6aK29Ytw
 +KQJI3Ur8CFa9KxzXz82ZW+S7N6M7K6q8uMmkA2e43PoUzD8gVaeHTMOUm//gPWG8xuw
 oVK7CKvFqe0xdGG0zg5jUdMNagWi8b36GSdqHrjbSl6gBurdXcFVDR89GkejylizjgSS
 IRRA==
X-Gm-Message-State: AOAM533M87XHqETD6CwNCGzG9YCAYlqRGUYyKvW+GhLT4JV1u7x8ZQmN
 /0v6lVgfcAMjnOUR4Qxc2Dv4wg==
X-Google-Smtp-Source: ABdhPJwJbBZx5ZXK6i3ydIfLDhrA0aJazi5AXeSMM1z90NtAPx49uDK1U9w9yKnMbSGOf8DJupBADw==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr1951722wrn.207.1606807181485; 
 Mon, 30 Nov 2020 23:19:41 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id z21sm1264690wmk.20.2020.11.30.23.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 23:19:40 -0800 (PST)
Date: Tue, 1 Dec 2020 07:19:38 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 32/40] drm/amd/display/amdgpu_dm/amdgpu_dm: Mark
 'link_bandwidth_kbps' as __maybe_unused
Message-ID: <20201201071938.GE4801@dell>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-33-lee.jones@linaro.org>
 <CADnq5_PtZRwNNV-EvMjkV9k2sYj9jdYBT3oqtS3-hm-pTsaaew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PtZRwNNV-EvMjkV9k2sYj9jdYBT3oqtS3-hm-pTsaaew@mail.gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAzMCBOb3YgMjAyMCwgQWxleCBEZXVjaGVyIHdyb3RlOgoKPiBPbiBUaHUsIE5vdiAy
NiwgMjAyMCBhdCA4OjQzIEFNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+ID4KPiA+ICdsaW5rX2JhbmR3aWR0aF9rYnBzJyBpcyBhbHdheXMgb2J0YWluZWQsIGJ1dCBv
bmx5IHVzZWQgaWYKPiA+IENPTkZJR19EUk1fQU1EX0RDX0RDTiBpcyBkZWZpbmVkLgo+IAo+IFBy
b2JhYmx5IGJldHRlciB0byBqdXN0IG1vdmUgdGhpcyB1bmRlciBDT05GSUdfRFJNX0FNRF9EQ19E
Q04uICBJJ2xsCj4gc2VuZCBhIHBhdGNoLgoKSSBjb25zaWRlcmVkIHRoYXQsIGJ1dCB0aG91Z2h0
IHRoZXJlIHdvdWxkIGhhdmUgYmVlbiBnb29kIHJlYXNvbiBmb3IKdGhlIGNsYXVzZSBicmVhayBq
dXN0IGZvciBkY19saW5rX2JhbmR3aWR0aF9rYnBzKCkuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzm
lq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFj
ZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
