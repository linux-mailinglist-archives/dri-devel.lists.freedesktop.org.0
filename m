Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2B5A1A743
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6235310E828;
	Thu, 23 Jan 2025 15:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NChYBlYz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431C310E828
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 15:47:14 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aaef00ab172so178019166b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1737647232; x=1738252032;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5c1ACikcoZvFxPEfQa5a/N07yqND3XkMMWgBnWWCeno=;
 b=NChYBlYzNXXjPze6K6MftJ9GjqbqsWqGgo8CfWvVlgR0t+Sc0F3s8/1useZcXX9o23
 zIavRttLeaH/sAMrB5ZrPA4SVjcTIzv+mgDUEJ2fRg/YXv0hFiwaDMm2KFQppOoZ/lNE
 RYXWviaFHYEMA51sIkwPxRG6fmG0EuVJ4mXc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737647232; x=1738252032;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5c1ACikcoZvFxPEfQa5a/N07yqND3XkMMWgBnWWCeno=;
 b=boBahvy2kKZTCO7FPz5pMok6YHXt76t+bZNDyhgOxiJt2tFVeBqLA3eko75DqIfyoF
 EIKLYLDFmmCPcJ+uLMAyg/GdkhR7+8rL5oy8o4FGUxeOj0VGyBl5wPst2TCm3H0C+KRJ
 o1mBvB6Oyci8VUMPPb822gacsSLe0+wP1dQkLcbAMcNujycV2396t6XHPJGshk2jwhh+
 UG49GJzvM4aCQpKZJxb8eycyfjxKa1j8ddunRDZ1cde1CyzI1ZiYm7IyLHlpoaRVl0b5
 IKDFhlo2lhx1DUqGlnbVK8k6pKuhE2BWXTzKuYYkjKL3XQrI8ZV/zXfMzXrEGDVj9KSg
 1jGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+bysQxmQ+ulRcM5Ia4vnNPFJBdZ4bc7T6rpdDUBEh8iX9lYIYSZttvZOXB/dRZZiA1HDxkeOF5NM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzh96jrt3Qf2nXflwsOaef+iQm/cxIEECKmnV/XYUJGZny0KPx
 ZIQkGM+Pjyaelfyxya66Hp/8kC3p7Jr46Ugx8bd6cO6ZpmV5YcRj7WAUF3yO0RFhBtMi/83T7ol
 JsGw=
X-Gm-Gg: ASbGncuOYC+ga/Krjfabjolm5Jlqj0ZjQg+MyD9EYg5UiGnS1neHP/H9J3s1ReK9Rt/
 BaXoKjEIJunCRY4hZTr3KkV4GOPagwC/BI5GEtbFDKB65iXY5sJ4xnGR48GM+BjO1BAB2+NReUM
 5QOu6i2rK6m5CVEg6abre+IjCAvEuhyRM4UAzZRK89Ia0svjqseuOgaHz/u6c2NVWlL2Yusot4H
 s7ZjK9Ad+NIm7YdOg0IZ9ZkzyRHX5Gh2tMbsgzx+/kpM/JCqMYmvFvihSXYBioltAjoGgZDrEyE
 wUXQPNDwCvniLdBmVhqAYZ0D5phw3duTife9LJIGf7WAN2L88Z9tog==
X-Google-Smtp-Source: AGHT+IHWH6RElArhDdaM/8F5PuWgr23BMoOgy2d+yIlf7NB3r214qX20T3q6Mc/Q0wDkBDkGwr2o3w==
X-Received: by 2002:a05:6402:518a:b0:5d3:ba42:e9e3 with SMTP id
 4fb4d7f45d1cf-5db7d2f5ec0mr65215758a12.13.1737647232515; 
 Thu, 23 Jan 2025 07:47:12 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f87d70sm1107142466b.142.2025.01.23.07.47.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 07:47:11 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso1588357a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 07:47:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUCDeef+KRxhhS7SJVzjJ1+NtT9DWEXeyGQkpUScLIEveJn6M80PgJS1xeHitxEclsIK1uoh3IBTHU=@lists.freedesktop.org
X-Received: by 2002:a05:6402:3595:b0:5db:f4fc:8a08 with SMTP id
 4fb4d7f45d1cf-5dbf4fc8bf6mr18353711a12.6.1737647230858; Thu, 23 Jan 2025
 07:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <20250123135342.1468787-6-vignesh.raman@collabora.com>
In-Reply-To: <20250123135342.1468787-6-vignesh.raman@collabora.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 23 Jan 2025 07:46:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiWcw-aPcMvWYqJDqxopPYXnPnVgFYAUSkvkRPTjO83uQ@mail.gmail.com>
X-Gm-Features: AWEUYZkvzfVO2hileHLKdeINWEzbU9zhoxsfXAWcm9kmxXjIcn6s0um9krEKyaE
Message-ID: <CAHk-=wiWcw-aPcMvWYqJDqxopPYXnPnVgFYAUSkvkRPTjO83uQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] kci-gitlab: docs: Add images
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: kernelci@lists.linux.dev, linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, mripard@kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
 gustavo.padovan@collabora.com, pawiecz@collabora.com, spbnick@gmail.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com, 
 nfraprado@collabora.com, davidgow@google.com, cocci@inria.fr, 
 Julia.Lawall@inria.fr, laura.nao@collabora.com, kernel@collabora.com, 
 gregkh@linuxfoundation.org, daniels@collabora.com, helen.koike@collabora.com, 
 shreeya.patel@collabora.com, denys.f@collabora.com, 
 nicolas.dufresne@collabora.com, louis.chauvet@bootlin.com, 
 hamohammed.sa@gmail.com, melissa.srw@gmail.com, simona@ffwll.ch, 
 airlied@gmail.com, Tim.Bird@sony.com, laurent.pinchart@ideasonboard.com, 
 broonie@kernel.org, leobras.c@gmail.com, groeck@google.com, 
 rdunlap@infradead.org, geert@linux-m68k.org, michel.daenzer@mailbox.org, 
 sakari.ailus@iki.fi, jarkko@kernel.org
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

On Thu, 23 Jan 2025 at 05:56, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
>  Documentation/ci/gitlab-ci/images/drm-vkms.png | Bin 0 -> 73810 bytes
>  .../ci/gitlab-ci/images/job-matrix.png         | Bin 0 -> 20000 bytes
>  .../ci/gitlab-ci/images/new-project-runner.png | Bin 0 -> 607737 bytes
>  .../ci/gitlab-ci/images/pipelines-on-push.png  | Bin 0 -> 532143 bytes
>  .../ci/gitlab-ci/images/the-pipeline.png       | Bin 0 -> 62464 bytes
>  .../ci/gitlab-ci/images/variables.png          | Bin 0 -> 277518 bytes


This seems excessive.

We have a few images in the tree, but they tend to be either the
penguin logo or various source SVGs.

Not a set of random screenshots or whatever.

         Linus
