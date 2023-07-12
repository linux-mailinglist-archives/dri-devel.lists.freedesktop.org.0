Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B34DE750265
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8789510E3D0;
	Wed, 12 Jul 2023 09:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD43010E3C6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:03:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbc59de009so69078715e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689152635; x=1691744635;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GupHuaIqXzbPk+pS2yyaKy7yHaFuRf0nsu4uBxchRjs=;
 b=T/hA12xiZrfFKp3JKiCj0EzcXLzJaz2SziWM8IA9uYlH7QUI/nyv5mE9vnwYoO/WOU
 N9INt2gIyOW/jzLV5/cAXXR85K4yBqOOuRAqsWlgC9W/WqKqNedR/2eIcqsh3WFMUQzt
 jexpPFZoPxsqu4UasUpXMoim0zgUjZwZS9k6onTASvvvmsrwvkirgh8wD55gzf0NueV8
 v0Y1yzlWcu+UqQZ97TA1d7TRfIn/7sL+QkQNKjsqXMu+rRWrEnk3bjBty9qlf0VbEWvT
 AzOD79q4WDJPNsi1DFHB//sOu5IbgeKiMNLg/u3YonsUIRAX4oyuuXeEr98BOtNQFNey
 VOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689152635; x=1691744635;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GupHuaIqXzbPk+pS2yyaKy7yHaFuRf0nsu4uBxchRjs=;
 b=QQt+DEhLB4bE9sU1kEH6f80o+YaMf947E/DFx2micO9xXkAeOsw7Pt7FSLsfvSt9xG
 eLCwNW5cXmHp+iL1nyWicH7psp5lKt7P9COJwO3fNuDgJabi7sHyE0LhrO/eG8dGgMNQ
 9fBOJZPozmCshj8IFtrEKcAgjxNy5Qi9rSy4Q6wOvEPob/CYXK7AZ3057csfFuBPNVWO
 vzbxQ4NxtR9kMuJRV8NjNV2PA0ivAs3Ozn2pvOp3IvXSxQb2Ky0R4zFl0Lw+DTOkgnwr
 PecGM99nQ32CIu8ZgxODGQXDwpfL2VnOe8c5zpzqBFVNFSM+y+qmbaJKj6V7ckQaB+uu
 jM+A==
X-Gm-Message-State: ABy/qLZOUYt3bOCZCpGmtgHKJV6qBByDUqklJUnyUsaX0EdFpkc2M1/S
 vnCXyyFXVlz0vqOWQ5SmRGXsKQ==
X-Google-Smtp-Source: APBJJlFf58Sbazh4Bq2aZg5cfCVoDyDVW1kusrum3uRNQGXJ9/dkAONt85gMQI28jMfIru+mjGQ9wQ==
X-Received: by 2002:a05:600c:229a:b0:3fb:40ff:1cbd with SMTP id
 26-20020a05600c229a00b003fb40ff1cbdmr14987929wmf.10.1689152635607; 
 Wed, 12 Jul 2023 02:03:55 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c029000b003fc04d13242sm11977328wmk.0.2023.07.12.02.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 02:03:54 -0700 (PDT)
Date: Wed, 12 Jul 2023 09:36:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] drm/virtio: remove some redundant code
Message-ID: <b82057bf-3126-4721-87f5-79ca3682cee4@kadam.mountain>
References: <7f67ed65-647a-44d7-a262-d3f1f48d90b9@kadam.mountain>
 <0561b89b-42a8-35bf-feaa-e5feb4ec3cd5@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0561b89b-42a8-35bf-feaa-e5feb4ec3cd5@nfschina.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org,
 kraxel@redhat.com, airlied@redhat.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 09:18:42AM +0800, Su Hui wrote:
> On 2023/7/11 19:13, Dan Carpenter wrote:
> > On Tue, Jul 11, 2023 at 05:00:31PM +0800, Su Hui wrote:
> > > virtio_gpu_get_vbuf always be successful,
> > > so remove the error judgment.
> > > 
> > No, just ignore the static checker false positive in this case.  The
> > intent of the code is clear that if it did have an error it should
> > return an error pointer.
> 
> Hi, Dan,
> 
> Function "virtio_gpu_get_vbuf" call "kmem_cache_zalloc (vgdev->vbufs,
> GFP_KERNEL | __GFP_NOFAIL)" to
> allocate memory. Adding the " __GFP_NOFAIL”flag make sure it won't fail. And
> "virtio_gpu_get_vbuf" never
> return an error code, so I think this is not a false positive.

We all see this and agree.

However the check for if (IS_ERR()) is written deliberately because we
might change the code to return error pointers in the future.  Static
checkers are looking for code that does something unintentional but in
this case the code was written that way deliberately.

regards,
dan carpenter

