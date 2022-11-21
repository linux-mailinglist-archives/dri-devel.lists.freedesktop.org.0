Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E973632B45
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 18:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFD710E321;
	Mon, 21 Nov 2022 17:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C47710E321;
 Mon, 21 Nov 2022 17:43:38 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-142b72a728fso6770999fac.9; 
 Mon, 21 Nov 2022 09:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RVYmRlCIWUFfeVnOV5mudLBiIVI6uJJnon3FBZNLLUI=;
 b=jcz1PMWg/P6eUBxRDkxKc0yQD7GP7vplwKzu1inK0mhWJoI8/LloPny5bXkEwBymN5
 DE81ekBRjKVErsWjLKQIKkswXFOZa5bvoPUbkqafrlIq6oxhq6VQfXSUpSMoVBvgPJhu
 H/VFqb2KjN2B7qnEk/Xb9WoeNPDQiWVKGN4k9glKFGm56FT10T3L+0XhXw+y8E6X6vUq
 0tu2oeQYspe06D815oLeil6BWq1FGQ/ZliZhLtVcUuJjmYdwoXBDVO50HCGOwCbfIaOF
 8w7HZGRzCVQ3FAwz0vSJYuwzGAnJXKKtM4S5xKxO5rpbnC+9IQR3Q/uIGgWdXVhYcJev
 mBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RVYmRlCIWUFfeVnOV5mudLBiIVI6uJJnon3FBZNLLUI=;
 b=DcCF2UuYwhjeaPeu/jH0pc5Tq2mZPatLmlhiwnYyAME+/GrDS4bMnlGUxPn0FIJ4Tr
 DW9PFjHVx5OFsmUVv+ArkXh88itFVexkK/HGs/7BM+tFBJVT6/O0W1xn9yYywFB9kcQf
 ifRlt6yNJykY3Pq1jjUDvWVF5+ChQZOWYjZ5Za1yJEo7mZvMybUZwREkwTaySDAjcBr7
 JNjUHvw7+TrrvhXD86rYCtlD6ou8sMDP7BRnYjekIAyr1fXkxXG8k70//iW4rTDbhsUk
 Sa0DAZGpU5X3j7bUJ2hg/OeU4x20PNmxYKm2MlfTmlAfeYeOLiFs6o3uvsriZXleoGv1
 th5w==
X-Gm-Message-State: ANoB5pkqt87Q/u1wa56wQss0pkaBrDdSWvZaL63OItrnc6n/onRh+BwK
 I8TwQ4zYasPDBcGCds4Xy8YYdQd/L3Kv80Uq976G4cDv
X-Google-Smtp-Source: AA0mqf74KkrNkY8BdaZc8j5XcGxfP6V3NbT9q1EO2RMtGv3fnMb3YyW9WSIaGDRpu2Sazq4MO0bHaAxzARnC7vzHCpg=
X-Received: by 2002:a05:6870:b07:b0:13b:d07f:f29d with SMTP id
 lh7-20020a0568700b0700b0013bd07ff29dmr2050631oab.96.1669052617328; Mon, 21
 Nov 2022 09:43:37 -0800 (PST)
MIME-Version: 1.0
References: <Y3soBt1jmXHUKhW9@mail.google.com>
In-Reply-To: <Y3soBt1jmXHUKhW9@mail.google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Nov 2022 12:43:25 -0500
Message-ID: <CADnq5_NAaX6t3r+J8qcEfL1-8SOunU9YR3HqohmuGTm_xBow+g@mail.gmail.com>
Subject: Re: [PATCH] [next] drm/amdgpu: Replace remaining 1-element array with
 flex-array
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Slark Xiao <slark_xiao@163.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rongguang Wei <weirongguang@kylinos.cn>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Nov 21, 2022 at 2:26 AM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> One-element arrays are deprecated, and we are replacing them with
> flexible array members instead. So, replace one-element array with
> flexible-array member in struct GOP_VBIOS_CONTENT and refactor the
> rest of the code accordingly.
>
> Important to mention is that doing a build before/after this patch
> results in no functional binary output differences.
>
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
>
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/238
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]
>
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
> This should be the last one-element array that had references in source
> code. Given the way it was used, no *.c code change was required.
>
> I will move on to the atombios.h in the radeon driver.
> ---
>  drivers/gpu/drm/amd/include/atombios.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
> index 4dc738c51771..b78360a71bc9 100644
> --- a/drivers/gpu/drm/amd/include/atombios.h
> +++ b/drivers/gpu/drm/amd/include/atombios.h
> @@ -9292,7 +9292,7 @@ typedef struct {
>
>  typedef struct {
>    VFCT_IMAGE_HEADER   VbiosHeader;
> -  UCHAR   VbiosContent[1];
> +  UCHAR   VbiosContent[];
>  }GOP_VBIOS_CONTENT;
>
>  typedef struct {
> --
> 2.37.3
>
