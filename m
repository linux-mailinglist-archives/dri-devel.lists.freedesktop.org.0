Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED7A46181
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 14:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61CE10E225;
	Wed, 26 Feb 2025 13:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="BcQyzzSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC28B10E225
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 13:59:27 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7c0b24cc566so551328185a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 05:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1740578366; x=1741183166;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QnxH9uSAX9kLW2aHAnB9zwl34wSWVlyTXJAkrl1jEgk=;
 b=BcQyzzSQhs5bKmgFaKEwKtplHUnZCa0k5DCO4Fw7/lenm8ZE4m/MDUsY3AcsUGfn/k
 3GfBqKtNUBRg3oXr/eYlB3E90JiAlFmzCKSb+JILQpfiGuynIDPixLLRFuzFIfFt3xSk
 7ipRKwtV3GMXVFO1ZIAOYcvdEPeA5yJNd68TXm0d0cAd2/Qdu0UqIbaClZGkBTtjrJju
 MhQ99UPNXGpE3zkmJHY7n4d7lL3Ddzki9R6ioEzfGUv3qCZwFKx9B2Wcp7h8SjajQ00i
 ZnuGmRcEU52ZoekdklSmuMXgezi/ijBGF5RIUdM97psV6cZccGzflGSAvS0VSvDbXg71
 NVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740578366; x=1741183166;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QnxH9uSAX9kLW2aHAnB9zwl34wSWVlyTXJAkrl1jEgk=;
 b=LSgp57moAPKg1YIdjw9yk8NdmehhEnrLaDr+ognO/gYVJHb99SoqclIMKF/KEM8fek
 IAvX4e0hyYqk+ClM8AedIdzosIyJUiXg5+C5zkspE34205rWWfeVopZFyAJFK2PCXm86
 zHVK/l/m1KLXHyOXhJ4XvAlJKhTF7Q6+eDt6zBt3yMuX/i5HZLcLMSayxGsQqRTjNtAu
 ndRB9XhecNPzaTNoJ3u8PBC/cIOM5uI8nKGYJm6FJ4rIlRDFMBNXxWSs5PLoc61dhBon
 tbDT1d7eGm+o34K5rppmcqvO393HNcNxR3s2fghoKtPVvWMCaPrIiBCwws8HfT8JVafJ
 nR+w==
X-Gm-Message-State: AOJu0YwQ2IJyHrmeQdXCm7yzfebzCWS45wzu4iXJoi38Y/R5qBC3ntxm
 Vk9ENuef0n0EHX9KAQEjKxGSqW91Rtt+UOb7TBQKR0X2mNuqQwE8fiRuZMJrgrmPCCxQ85tW81J
 dzvo8gkHHB52xsN4ljU+/VFygh6ugh2CaNz4wXRrD7CR3T+zHfYg=
X-Gm-Gg: ASbGncvSvKBsWw+4TFBZX04h04nvGrvcmUGUh3hiuDinTwFgWgr5jI/tg7xFUbTxjbb
 P0Infd3nBAvqUnFte1AXUdZMUrREW0eY0zX3t39qnm7RNl/o/u3TBwgHc5eVJWtjJIKLYJhr5z8
 bDCuFO
X-Google-Smtp-Source: AGHT+IH3LH2E7qdLqaSbVmbd0vwQgYzSLFH3zYoBT6JZblmu5a/hbpYOUjW39/0dbNVn1kAPYr4FC5G28TPPww11BC4=
X-Received: by 2002:a05:620a:2453:b0:7c0:7aab:9b43 with SMTP id
 af79cd13be357-7c247fcb787mr576156185a.40.1740578366648; Wed, 26 Feb 2025
 05:59:26 -0800 (PST)
MIME-Version: 1.0
References: <20250226135415.363605-1-vignesh.raman@collabora.com>
In-Reply-To: <20250226135415.363605-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 Feb 2025 13:59:15 +0000
X-Gm-Features: AWEUYZmmxdS5ypGHcyPPeldS7LVaWK9H32Imx1ThxzBXN-bcd6PFnzxtamWHxx8
Message-ID: <CAPj87rNAaPUEmk1edcuHX1+bMWysF=aOMceUsCxnk2SMJUjqKg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: fix merge request rules
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
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

On Wed, 26 Feb 2025 at 13:55, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Merge request pipelines were only created when changes
> were made to drivers/gpu/drm/ci/, causing MRs that didn't
> touch this path to break. Fix MR pipeline rules to trigger
> jobs for all changes.

Thanks a lot for fixing this up!

>      # Build everything after someone bypassed the CI
>      - if: *is-direct-push
>        when: on_success

Should these be when: manual? I think it would be good to align with
the rules we have for Mesa: run automatically for marge-bot and also
for scheduled pipelines, but in all other cases (MR context but not
scheduled for merge, direct push to ref, etc) be manual, so we don't
overwhelm the CI by testing everything everyone pushed.

Cheers,
Daniel
