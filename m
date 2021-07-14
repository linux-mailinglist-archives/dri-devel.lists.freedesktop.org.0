Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA43C84DE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 14:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5246A6E25B;
	Wed, 14 Jul 2021 12:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E519A6E283
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 12:56:55 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id x25so3373066lfu.13
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 05:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TKFpa78isQisSosRPybp51ffw8MhNd0Jxnvwb6YKTCA=;
 b=KZuzekgr7wXG2FmXAr0PPvzvrvmBj0J4bs8fnWfBSPBlCDZy5CLAeYNWNOZTUk8Ltq
 Jb1KNfH/CR3zZhvGeXbUcLwlVq10brFXr4Nhw1wSTdSqI4ssLs0YyguHrtIDMeALaz5L
 88G9VX3llVKYCYeihgkoE+utDxoYNp+xQXIxdBlTio9AUfoSQ7G3l5DSLxfZSd3EW7nf
 s6ZpBoBTcgOtMl3xcMLMJBv9ZDP8OuuyBA1sswrhX9cDBY6gi9mhVPLPZeohvfF7h/Eu
 cs8Ja3oMAH1qzwipsazC2yQCXJNJA8bUDdetAj28uyBZmbuRRCOTTB0lF8khjNYAY7jQ
 /oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TKFpa78isQisSosRPybp51ffw8MhNd0Jxnvwb6YKTCA=;
 b=iYR6Xt5+d93IDucTmw/S1AINv6rnngzt2pZLjUh/sDaEkBYSiybVO0kYmb0C9W6DXw
 7do/BInTUvBlDgnN8ABnVM8Y91JRX0VUbW5zrdEt1IrSupMy5wMvUNHZ8yRF8Xs8GMcD
 6NyUhXSc6PuJ/fDzLQ0/qnqD/tvJOIKN8ZFGBDqwL/oqQbe9b4rYF1foaxkOikptudQt
 rWpC6TU77gTVJaWhEv0hXrLQsyh1jBYGif3XCiq+uRnQl9knrpiuPtYZuxqJlRkHQHsr
 VCKJ9LZdLiqyIEK6pnwLl9FUfHuhLHMQcpnzfyPAtw3O2UnmkqzJgUTjI9O8z4BkOsXR
 1Tkg==
X-Gm-Message-State: AOAM533VGKup8bGbQsv0NuN33E5kYwwtb2GC2H6BSbxz0EctiRODiW2n
 u+OBxwvkZ/3mDc6UEuHoDaqYGQ==
X-Google-Smtp-Source: ABdhPJwmFLoen/c7I313U0JHoVRop6b5mSNNUIhmly01niUZMKuO/igo18Oq7W0puYGbbjNej72ByA==
X-Received: by 2002:ac2:520c:: with SMTP id a12mr8019394lfl.67.1626267414247; 
 Wed, 14 Jul 2021 05:56:54 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id k8sm248479ljn.18.2021.07.14.05.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 05:56:53 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id B073A102647; Wed, 14 Jul 2021 15:56:52 +0300 (+03)
Date: Wed, 14 Jul 2021 15:56:52 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 airlied@linux.ie, daniel@ffwll.ch
Subject: Re: nouveau: failed to initialise sync
Message-ID: <20210714125652.eohw2s2pncplxovx@box.shutemov.name>
References: <YOC4uekpD7iA3xPi@Red> <1682547.0nLxAY2a9E@nvdebian>
 <dace0dea-7ca9-99cb-ad80-106824cb5e3f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dace0dea-7ca9-99cb-ad80-106824cb5e3f@amd.com>
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
Cc: nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 08:58:37AM +0200, Christian König wrote:
> Hi guys,
> 
> yes nouveau was using the same functionality for internal BOs without
> noticing it. This is fixes by the following commit:
> 
> commit d098775ed44021293b1962dea61efb19297b8d02
> Author: Christian König <christian.koenig@amd.com>
> Date:   Wed Jun 9 19:25:56 2021 +0200
> 
>     drm/nouveau: init the base GEM fields for internal BOs
> 
>     TTMs buffer objects are based on GEM objects for quite a while
>     and rely on initializing those fields before initializing the TTM BO.
> 
>     Nouveau now doesn't init the GEM object for internally allocated BOs,
>     so make sure that we at least initialize some necessary fields.
> 
> Could be that the patch needs to be send to stable as well.

The regression is present in v5.14-rc1. Any idea when it will hit
upstream? I don't see it being applied to drm=next.

-- 
 Kirill A. Shutemov
