Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF7121026A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 05:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2D06E5BB;
	Wed,  1 Jul 2020 03:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1886E5B9;
 Wed,  1 Jul 2020 03:16:52 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a1so22893717ejg.12;
 Tue, 30 Jun 2020 20:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vHvPmDVPXPDOyelV25pCVRevm6sheLB3OzUfc/QjcKo=;
 b=fcEjtlj2QgY8bW6XtCn5WhzBlRBlvIK1F78qcrgcdC64eJ9ZSMrjZ2R265ZGXZCPGJ
 7QLD6JN2qiLCRDiqwfC0XwROsZ7svbtpjamgVCk1BOQXKDSpKOnnJ0+TyBEfkUFeJSIr
 kqWBoc9Y0NvGuMZyyp9sTYpAk+cBhSWSUIy2Tff0BZBfvX2Np90v4q0H9578ehXr7Ykj
 w1FMqACKfvmNraBhI35Nn5s24gin++E/oMrVlvaaA1J9jIlCXLK5UCD2/KDd2XmvyFRI
 tKlYdJHImkuqn8B2zq4cRZr+LGfu18vtp1636ETRa9dRtRbGsXE1+oJYZscUs5OCRb/Y
 /A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vHvPmDVPXPDOyelV25pCVRevm6sheLB3OzUfc/QjcKo=;
 b=YUmie6/eo3MWv76Xnw4+wGWpmJkdEaJl5IQ+Y+9nSW8lnXPme1H1/u8p3ST6tIHnZr
 A/DkuP0vD7kUBAlVSKubZS2JnQv6HsOjfqPd/fEIRs9EfWRHZCM/Po0sHJbXoSxzpVIa
 IF6nRHu03Hp7DXP+I7WnwPaPatr913EELx9/MKPkltjcBe5ygTbIfBHlv59c0JWVFet7
 mFfPEQBE6Sm1enzKenKf0NX94UrdIoPLPjXl5EEj73QC7K90y0k2y6TEuScr6H/5XL2C
 UwqeTQ3pJgJqrw4RYvCggoVeC6hj3S0Lkl6h/DLL9g2zDqo56VKj9a5MN0GBsnGKmVJ1
 p+8g==
X-Gm-Message-State: AOAM532RnRKKGfXZhfWxkQ84Zz11TZcF6J9RVJl4pPW/uhMnzxt/sje6
 2grrtnORc9unJQfX7dIZLy1vbgLFo7lEO50TW2M=
X-Google-Smtp-Source: ABdhPJzHagPNP106Rloab5Vruvnzdq7SXzd7+lylfQoTPVVfJ6REKZpByRR5eGL4vukJO/iO7r6Cvf7pRDAmZJZNb/4=
X-Received: by 2002:a17:906:dbed:: with SMTP id
 yd13mr20484670ejb.419.1593573410817; 
 Tue, 30 Jun 2020 20:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200626214415.4397-1-alexander.deucher@amd.com>
In-Reply-To: <20200626214415.4397-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 1 Jul 2020 13:16:39 +1000
Message-ID: <CAPM=9tyRu0xq60uYhSomAg+NTGO0EDnhfY9A7_iN96Yuesguww@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd, radeon drm-next-5.9
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 5fa689e66bf406ef3a1afe03d0139d90b0b13773
Author: Likun Gao <Likun.Gao@amd.com>
Commit: Alex Deucher <alexander.deucher@amd.com>

    drm/amdgpu/powerplay: add smu block for sienna_cichlid

    Add SMU block for sienna_cichlid with psp load type.

    Signed-off-by: Likun Gao <Likun.Gao@amd.com>
    Reviewed-by: Jack Xiao <Jack.Xiao@amd.com>


Spot the missing signed-off-by. (hint dim warns about these generating
pull requests :-)

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
