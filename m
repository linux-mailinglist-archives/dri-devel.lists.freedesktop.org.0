Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9543755F061
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC3811B1AB;
	Tue, 28 Jun 2022 21:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1142C11B1CB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656451974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLJSiS4iMX/nUV79ttiy0e8LOCrjE5iV4ITH0RqhCCY=;
 b=XaRrEdr7rJ81EjNaperm2JCDs+w0joOl4RaW2rpxz4QwNXesIA4eJWT1WR2KF0JSUajwGO
 tWftdIAiR+OTjRShvonorUAvLEIcoabVUkUHKyYlt2UQH5j4MzXhGQt+7PUKXCcmwdf8Gu
 uh39HQttMMFHLjE/Mcb44GDDuwsDAac=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-03ChPHKBO7GY44SOfytTwg-1; Tue, 28 Jun 2022 17:32:50 -0400
X-MC-Unique: 03ChPHKBO7GY44SOfytTwg-1
Received: by mail-qv1-f71.google.com with SMTP id
 s11-20020a0562140cab00b0046e7d2b24b3so13590044qvs.16
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 14:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=MLJSiS4iMX/nUV79ttiy0e8LOCrjE5iV4ITH0RqhCCY=;
 b=IcQyPp3jKQpcW7tbJlErYa1LLib1P+S9MyAsD0Gn3692nLOZ4UA6zpVNcxjptsqN5h
 1LOu3hXpVZFhUFIPEyxra3VyPVYU7utvsDMMNQWnPJ/Ale1+hsEhhUFhwKRa45eh4kFo
 IO7UmkfPEqo/zzEsQMshh2zy1Y5HEmn5FAyN/UQvmSMg2vYRXWV8g6TRFhTHmxOdGcMM
 w4ppSayAZu86FlUj+nj+QPqsLSkLYeaYq/u2LBQtuMdPougeuUcecDpLpc1ufCG61Cql
 HeY4o/CF8EiAnq+hxx4hvmZCJMUQX/Zij7mvWlNnvGZyjHvs8oh2QP6fA6hep82MTlps
 SdGg==
X-Gm-Message-State: AJIora+0bL06lxhA77YVGsQy25FubRCMHEo6/2fO9X1YEseUkAHEl2kl
 2K0Wo0gG1XDY4mE6EVYxqsVt28+lG4atCUah2GxSU9M1ilpQkxco7lrlyqZAjpj6Hchy41rkd+W
 w5bovg/Un3p2lQUK6EwwvKux5Z34u
X-Received: by 2002:a05:6214:202d:b0:470:3e7a:d183 with SMTP id
 13-20020a056214202d00b004703e7ad183mr5415962qvf.4.1656451970306; 
 Tue, 28 Jun 2022 14:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5rc5cVQf8GWfwbbgQCuqUtlFNDHPZN0QGJCwkqxa7sPpHwlF5PDoTYE5KX7xZVqJJw4ldTQ==
X-Received: by 2002:a05:6214:202d:b0:470:3e7a:d183 with SMTP id
 13-20020a056214202d00b004703e7ad183mr5415949qvf.4.1656451970098; 
 Tue, 28 Jun 2022 14:32:50 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a05620a28cd00b006a6bbc2725esm12406053qkp.118.2022.06.28.14.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 14:32:49 -0700 (PDT)
Message-ID: <1f196235b92e4123ce171980dd7bdbfe9bb0e055.camel@redhat.com>
Subject: Re: [PATCH] gpu: drm: selftests: drop unexpected word 'for' in
 comments
From: Lyude Paul <lyude@redhat.com>
To: Jiang Jian <jiangjian@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 28 Jun 2022 17:32:48 -0400
In-Reply-To: <20220623100632.27056-1-jiangjian@cdjrlc.com>
References: <20220623100632.27056-1-jiangjian@cdjrlc.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: alexander.deucher@amd.com, jose.exposito89@gmail.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Going to change the name of the patch slightly so it's more obvious this is
just about the MST selftests

On Thu, 2022-06-23 at 18:06 +0800, Jiang Jian wrote:
> there is an unexpected word 'for' in the comments that need to be dropped
> 
> file - ./drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> line - 3
> 
> * Test cases for for the DRM DP MST helpers
> 
> changed to:
> 
> * Test cases for the DRM DP MST helpers
> 
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> ---
>  drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> index 967c52150b67..4caa9be900ac 100644
> --- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Test cases for for the DRM DP MST helpers
> + * Test cases for the DRM DP MST helpers
>   */
>  
>  #define PREFIX_STR "[drm_dp_mst_helper]"

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

