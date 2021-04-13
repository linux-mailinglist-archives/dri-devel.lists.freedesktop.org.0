Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CA835E3AA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 18:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B6189C33;
	Tue, 13 Apr 2021 16:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F21E6E039
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 16:19:26 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id y12so13152395qtx.11
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 09:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J+mYsxaAXhddlrGPlGvTvY2sDh/hqduKqqmubiP31tk=;
 b=cpENsElCFDM0xKZ7MV8AUCdlDYvklvHRrGqxdLAyEDOGNn8jkEPXAHolosS/8wd1jp
 hnYzFPJpLWkZ3r2g9SzHED+zRTxYFs5UMl1Q90jzpoX7Lp7XsXO6KvKXnlQ0DQuSOdAD
 UaOQe0hakSzf3pBAIWX25wqD1sCQj2uN5RVjopDxe+CiB3ZH+JoBCmq/uon15+mBictb
 vNS2sh9gGiGdOT0OGYzMPgCGV+iF34VNeD1XgfFfT2BizvLFtWlCCtRgRVF663Dgin6S
 4YqVb+N+tVbdJGoscu0mDCkoVl19jP3jk1wQyHg5fv6QlAGHgCEG/pS/M4ViUb1SRvMR
 +lVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J+mYsxaAXhddlrGPlGvTvY2sDh/hqduKqqmubiP31tk=;
 b=BSw5pWlSzoFVkrSz6H/oHS9OBu+EoFEcKxnfba7cZUoN8nhJcLLBO0R4ApxjcEpblH
 cvPDygpxJOX59RLaPYpgtWP6DNX63tSlEDMyuSNS7eiTWfZWTc46eHKm90776GBNqRFF
 L1CGvTvPoFQXy92LQLmP6kMBiDGcnjiIpCX6gl36cA+NA+y6t5ZJU2DkA6CUpZH1nVeJ
 9ubsJZi3Qs9wxNqgPF2BGTSpYoaMfU/xgne32p9lZeOfGVT1Qg69h/Zw7BB6ivm/wlgN
 ASY7AUpsGeOyZgcWAi7oXKmtx7K4NOc2BJKNup84kYUIu4ihUmrWcaGX5N+tafuOxcGs
 q4uw==
X-Gm-Message-State: AOAM530VT7kmCYKkW0Ky1gq7RG87XDwvxNrGJCud9SQBFFlqMGa75EUG
 82LsrXD80LlbCaooY8iBSuhRhsb4a06oSS3TvzgjFwhFMRg=
X-Google-Smtp-Source: ABdhPJx4c2nmbmaNnfA1ZVBbiFUrwewlINPyO7DOUWJ/V4RNkMyYr2tx7CuV+0xJSTNEVq7xtmxR82/Rh9Kz2kh1WRE=
X-Received: by 2002:ac8:7dc2:: with SMTP id c2mr31063806qte.341.1618330765396; 
 Tue, 13 Apr 2021 09:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210413135248.1266-1-christian.koenig@amd.com>
 <20210413135248.1266-3-christian.koenig@amd.com>
In-Reply-To: <20210413135248.1266-3-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 13 Apr 2021 17:18:59 +0100
Message-ID: <CAM0jSHOrQq4U9JzZrTZ_wkfGru+TYj-c9AzjaFjb4U-zBRoQFg@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/ttm: minor range manager coding style clean ups
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMyBBcHIgMjAyMSBhdCAxNDo1MywgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2Vz
LCBqdXN0IHJlbW92aW5nIHRoZSBsZWZ0b3ZlcnMgZnJvbSB0aGUgcmVkZXNpZ24uCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
