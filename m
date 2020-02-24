Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6516C16ABA4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 17:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE856E5AB;
	Mon, 24 Feb 2020 16:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A506E5AB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 16:33:29 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id n27so6086217vsa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 08:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VTNbQHeyMP+BVKzvuWICsw36AJKxyLBXjxj8BucVTd8=;
 b=PTHr46oxkjhLFD5JMV/ISinVdJ3JzZog5Xi4J3BMLrfoQMXhuXpcoAWWXUQ8TI/g2N
 0YkANIVJlYTHS8Lg9Vy0fp6GJsfKUB1AmxrqgEaLyhx0i7zKcP2WLB+guZDnDQ8SNY+s
 bejjGT7XCUJdhBZJ7v6D4r9mFAmF6dba4XP5pNjnNcdUNoyB3m2YMBH5MKkaTlFK6ZLk
 Hm/7gzMt7FUIUFUvMSSCWtc2+AbcNVmVwxdFGZoeAiVd5YIKmOk6fGALaxjCwMQM7WJ0
 6BOoADQ80Y9ww7+8Hwvy0F1Sf6UxFHpnjQgeWEP7UGOX4ktotWWZZ9lr6iwlQJdmXVwR
 NDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VTNbQHeyMP+BVKzvuWICsw36AJKxyLBXjxj8BucVTd8=;
 b=p2npt0kb1rUaZM0i3EKloJsDYx454fnTRsX/t3juic+a8ZYvtVsak//e8kBZZ5HHJW
 fJeJ6hHbKNBc4qyU7ly8vqQT7m2AphSMpbq8TYk4WnKg2JzdfS3/KiTHMOeMGZdM717S
 wKObNBn/e4XbvWOo2TOoAXQpmHER4wUkcF4MEFs7I2vi0+j9ubN16dxdI874cSvwjJmL
 KiccIeWDxvw61Poaz4orPmpH3ndvU3PTLFwyhG8APWCcrMJbZHxWX/6/tkCGSH1M5bEI
 u9k699I0gg+nEWlzrE1TgAWWQoksi/swXN/awXENrqIrbZsZFicU8oNU8QevMEmMAg7o
 kM6g==
X-Gm-Message-State: APjAAAVxBB41EIprRc1B15xWkmQwILtRLEyPHdeySetD2CIxfy33UDjg
 uJ1h65/UPzGwd4ZoI5ciyXR+GiBR+ycwQTD9jJXNsg==
X-Google-Smtp-Source: APXvYqzNLvvnUYLGrzl4qUr2fyTC79ccN2+H7f0gxn0BsvGtOspb6wr1/uynhnVL0wlPW3pdtdCAl9B2RF2LxYrbXfk=
X-Received: by 2002:a05:6102:7a4:: with SMTP id
 x4mr26028082vsg.85.1582562008412; 
 Mon, 24 Feb 2020 08:33:28 -0800 (PST)
MIME-Version: 1.0
References: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
 <20200222175433.2259158-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20200222175433.2259158-3-daniel.vetter@ffwll.ch>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 24 Feb 2020 16:33:10 +0000
Message-ID: <CACvgo52nedq60jG-ZvhOu0Dnc1X7nrPF=V1PS+d3a0a4vdzRbQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/pci: Unexport drm_get_pci_dev
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 22 Feb 2020 at 17:54, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Only user left is the shadow attach for legacy drivers.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Going the extra step, as outlined in 2/3 would be great. But if the
series goes as-is, 2/3 and 3/3 are:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
