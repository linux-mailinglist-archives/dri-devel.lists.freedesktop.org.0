Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F2368ED0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 10:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D353A6E0BF;
	Fri, 23 Apr 2021 08:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E983B6E0BF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 08:28:52 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id y204so24119596wmg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 01:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=h5v4zIXPv6WHWTKJvFYWSELVGuItjZYfaJrXobHmfuo=;
 b=LLTmm9mVlUi6clUD7JUsKWh0K7EL9Qw1q+pdK4ZgZuITlf3H+/lF//Fd0MDVRsaqTW
 /oIEliN++BGSRU87nOuOB2UvKwiAAbsHuQy6Zynb7CvSh5n2sNrZTWMKmO0kKOavskOS
 aBl2Rl8MoS3ZpdXFYhkzVmL5jCn1HXJVQeeElRhahx5oerQBev0+84SKaIvKSgFEKVYi
 NvrdvcLb0CTLSceov4ymzZfGhdkqLHjBDesJyKYl60PycziYY7wMyvWFFS1ncEkiVuQl
 DwFZ8G1IJ2GiCiBgxAeAbN2dk1H6malE9XSGm002jWeT1FwQ7cgnUwofPJDv3NAZ6oOM
 giyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=h5v4zIXPv6WHWTKJvFYWSELVGuItjZYfaJrXobHmfuo=;
 b=fJNeMK7xBUAipS3jNFqC8NKb2LPUuzBSJkUMIYqKSgcqOvc9D4AWNSvHkjp0+ljZWP
 OlAExGFWf8jklGUpZJ+FkDDT/W3GM8KKK3IdNMtbU/AxFKqvjpRak30Zguk8YVqugQ5C
 reVz46/HgLRTK3oIix09ir2iMWTb1QywFRJ4WSi9JuRF60BwEBniCox9nfL3vK18+cJJ
 ytM+G8bjZrN3g33sx+2iKvY6IJuJy+uxjG+TJ3Zn1LDWL8bfJ+SgSDcPmAJqMBLhwVZs
 eui+6a9e7T7ZKuUXmiDEtHweOeJ1qpnOxdU9lXu7ZURiRi1vZ7ARUKCZ71Api4H4Ff8h
 M3mQ==
X-Gm-Message-State: AOAM531B1lzwseBDQZhiNJvxNO55pAVsfSXau+9jk59f6HkkQuJNcVrf
 5DoBkQI3ModWhqAgUIvK0KVaYw==
X-Google-Smtp-Source: ABdhPJxWpAEBcc/UIoHyOrRT4kaqZXgVnkDlB7IPILt72r+qVIyQSieMIAQdqs2mehCKPaIeN0ZGvQ==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr4203194wmi.160.1619166531614; 
 Fri, 23 Apr 2021 01:28:51 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id 2sm9611435wmi.19.2021.04.23.01.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 01:28:51 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:28:49 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 31/40] drm/amd/amdgpu/amdgpu_gart: Correct a couple of
 function names in the docs
Message-ID: <20210423082849.GD6446@dell>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-32-lee.jones@linaro.org>
 <2029fbcf-8d2b-7a85-edd2-481a571ae43d@amd.com>
 <CADnq5_N5_poFcOpQzV+Ae22rwD0PG3kq0O3q10gmbb7=fNpEyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_N5_poFcOpQzV+Ae22rwD0PG3kq0O3q10gmbb7=fNpEyA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nirmoy Das <nirmoy.das@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBcHIgMjAyMSwgQWxleCBEZXVjaGVyIHdyb3RlOgoKPiBBcHBsaWVkLiAgdGhh
bmtzIQoKTG92ZWx5LiAgVGhhbmtzIGZvciB0aGVzZSBBbGV4LgoKLS0gCkxlZSBKb25lcyBb5p2O
55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
