Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD215867A77
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9C210E77D;
	Mon, 26 Feb 2024 15:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hjk6dUMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFDA10E77D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:41:08 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3bc23738beaso126033b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708962067; x=1709566867; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3Rjvug8FUBsUDBCli+oMoGYni81h310cRMRHKXsq8Mg=;
 b=hjk6dUMhhfq4uSOHZIAUsxMT1Aw9ikPrrrs+hr1NeH6PxZ2o7L8GyIut/SnjX1PceW
 tOfBgH4XA2ryZ4qCEsOUYQM0dIFtvxCTUX4T5w7fsdvwtPHV216VOBqaQfT7B2CnFWJG
 tn+X6f8BVSjO/GiClyGwnPWAl3znNXuc8y/wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708962067; x=1709566867;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Rjvug8FUBsUDBCli+oMoGYni81h310cRMRHKXsq8Mg=;
 b=KWDT1c+R3K4ndzaurPyxBV82gT2wcZ2rG8KuYCNAusSYYLjvKQrFl0GUu5Fuuy9pUQ
 fDUvLAcKLiv0FHPvxJsC/5n2E5T1WIc3dM5+4I4nCOEhhkCMQ4RHGlws8ruV37rtacQD
 OhOGJh5vxUXWVMXaj0cjpYZBg0qNQTobE7Mc6zY64ECT8cl6KiXmGv+PFXHYl4jQg5ZN
 jlWG57Bp14CkzdX32ExeXvMBpLvDyf7uhj6p76tngOBZ3DUIIuxHmCKU3On9lQzCnlOo
 ATCFCrX6WJ1cVYOHcblPCd06+nLgIyI2p42Zuq2JCAQzZjs1jCUrg6mwKd2gOHPWyBpl
 UJdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt7mBa8bJC7z8abMV1Grrexanh5iT7i5AfBaq72mlgBceZyQz+/X+hGrh0cCgqk3HNA9Xiwc3Fk3F/byawO59352dW2nH4PF3242T+l7Z8
X-Gm-Message-State: AOJu0Yyw3r4ubtWIVL/6kWTnHHplcFRyWB5PueyJRgL2IenPUcpIi9A9
 KRm1KJXE2iEktBm8cQsS+Ud18jppnEjxBdP+61cAm2Ck7S2MSjCOw/bbNoiGIoqkMtULzNUFkoR
 X0l8yYSbwrkyRP6JaXLtkJRC9gFIVxKrN5Q6hbVAjyMuLakGl
X-Google-Smtp-Source: AGHT+IEFPKxdhujM7KvcpdAG4LwkRZzoDtJU8Q7yFCNAPY9PyEIObMp/RuYuRc8J638EPo/GYgmSRK3YS+dx7NY5WgI=
X-Received: by 2002:a05:6870:5713:b0:21f:c6a8:f870 with SMTP id
 k19-20020a056870571300b0021fc6a8f870mr7336888oap.4.1708962067569; Mon, 26 Feb
 2024 07:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20240226151631.130754-1-mripard@kernel.org>
In-Reply-To: <20240226151631.130754-1-mripard@kernel.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 26 Feb 2024 16:40:56 +0100
Message-ID: <CAKMK7uG4-625wJ2cZsjQRAUvJY-WSk8Y70nX1yi10o1iMzO6TQ@mail.gmail.com>
Subject: Re: [rerere PATCH] nightly.conf: Switch drm.git to gitlab
To: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Daniel Stone <daniels@collabora.com>
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

On Mon, 26 Feb 2024 at 16:16, Maxime Ripard <mripard@kernel.org> wrote:
>
> Start the big migration with drm.git.
>
> Existing remotes need to be adjusted with
>
> git remote set-url drm ssh://git@gitlab.freedesktop.org:drm/kernel.git
>
> or
>
> git remote set-url drm https://gitlab.freedesktop.org/drm/kernel.git
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked.
-Sima

> ---
>  nightly.conf | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/nightly.conf b/nightly.conf
> index c189f2ccad17..68ac687a5c7f 100644
> --- a/nightly.conf
> +++ b/nightly.conf
> @@ -45,10 +45,8 @@ https://anongit.freedesktop.org/git/drm/drm-misc
>  https://anongit.freedesktop.org/git/drm/drm-misc.git
>  "
>  drm_tip_repos[drm]="
> -ssh://git.freedesktop.org/git/drm/drm
> -git://anongit.freedesktop.org/drm/drm
> -https://anongit.freedesktop.org/git/drm/drm
> -https://anongit.freedesktop.org/git/drm/drm.git
> +https://gitlab.freedesktop.org/drm/kernel.git
> +ssh://git@gitlab.freedesktop.org:drm/kernel.git
>  "
>  drm_tip_repos[linux-upstream]="
>  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> --
> 2.43.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
