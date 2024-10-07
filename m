Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD55993387
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B83310E3D4;
	Mon,  7 Oct 2024 16:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="ICN5V1x3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FD110E3D4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:37:51 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7a9acc6f22dso431241285a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1728319071; x=1728923871;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W4CFFIJB0/w1KDKpJP7Na0Tu7Wo8uI2KSmr76xqMrKs=;
 b=ICN5V1x35LJMobUMCUsUw+ba6Iq2eyGvwuOHPZQIP0KxPmqaH4gLbK/3ngESvR1I4j
 qbOSs3GiNXx6MvHy2PltBCtufZ4wLy1GQOUJdoIE3Hxs6u70z8ORkOCGTliS6TjoQxSC
 1G6NIaqXlHvaJQRxMrWIB7sJ9t8X34JoV66IgdjxVHoMqEHN62/1i6jgBbkCh/MtDZSM
 RZoXQZpqLVGrVfPu8PQPBo2F3ST07IEQeaMnha41mmbAqmaMWph1AUjPKt/zGCJlklRi
 lKqX4RF7pSBYg5if1jeeZ0V5+iq1+m825OCPKZvIqViRKcgBEghd5Vn8SFgRaP5jLDLz
 uXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728319071; x=1728923871;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W4CFFIJB0/w1KDKpJP7Na0Tu7Wo8uI2KSmr76xqMrKs=;
 b=RgCKEmLIrnZOdN141M/nDnbkQzD8l8VlEwVK0eKFVgsz0mmkFQcxC+d9U53LTljqrs
 DNc+/g+VKl58okkY3AejnQot3gNIOe4BdN4tdS6f31popslC49eNBkqU0co1WPH73BZ2
 6T4hsbAgCl4uDDNu6CJ+clZLjIOUvR8Nqth3wEDEMF/Ses298vWEmPANUggc3h3HZ5w3
 bOH1XCDvkDbtZhSpXjFBPUnQeTDWLCxVjCck/75sNTo/JyuyBop3HKPyXxsQwCDL57Jw
 /rUSXeurJ4mvymu64V9bvWsJ6hUNuE/1Rm6s0NDNqfJfDNytN2/P96VqQncFZGJIOxCG
 iwvg==
X-Gm-Message-State: AOJu0YzWGe0vC7ti54GQ1JASnvDZLYhd+gT47QqtG1EN+7N0ZMQ90Yu7
 YDM7TN3L+hU7xC4f75IaK9D6qZmW9rJIXRmQJO6sQG/iugnlJ0SHg2S2VLN45osmpezB1LSDcVq
 X2hSpt+kUlJCS3qqyS7w70puGbrNnADY4BxdMwA==
X-Google-Smtp-Source: AGHT+IFUEdp+6Zfk/3canOH8YLTeCDElWZbOWdFUC/AjiXkqb6tWoEUHRz5ImwY747H/eYo44KjaW8o6FN6Tmv1CB1Q=
X-Received: by 2002:a05:620a:1aa0:b0:7ac:b3bf:c30c with SMTP id
 af79cd13be357-7ae6f48ae1fmr1890545885a.45.1728319070658; Mon, 07 Oct 2024
 09:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241004133126.2436930-1-vignesh.raman@collabora.com>
 <20241004133126.2436930-2-vignesh.raman@collabora.com>
In-Reply-To: <20241004133126.2436930-2-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 7 Oct 2024 12:37:39 -0400
Message-ID: <CAPj87rPGD8Pu_CSPXfRtsS_w8UYVJGR9CoLx7RAT69EUKefs3A@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/ci: refactor software-driver stage jobs
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
 robdclark@gmail.com, guilherme.gallo@collabora.com, 
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
 dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vignesh,

On Fri, 4 Oct 2024 at 09:31, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> +.software-driver:
> +  stage: software-driver
> +  extends:
> +    - .test-gl
> +    - .test-rules
> +  timeout: "1h30m"
> +  tags:
> +    - kvm
> +  script:
> +    - ln -sf $CI_PROJECT_DIR/install /install
> +    - mv install/bzImage /lava-files/bzImage
> +    - mkdir -p /lib/modules
> +    - mkdir -p $CI_PROJECT_DIR/results
> +    - ln -sf $CI_PROJECT_DIR/results /results
> +    - install/crosvm-runner.sh install/igt_runner.sh

Instead of inlining this here, can we please move towards reusing more
of .gitlab-ci/common/init-stage[12].sh? If those files need to be
modified then that's totally fine, but I'd rather have something more
predictable, and fewer random pieces of shell in each job section.
