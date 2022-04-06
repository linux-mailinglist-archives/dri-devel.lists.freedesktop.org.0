Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB344F5E6B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 14:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD1610E023;
	Wed,  6 Apr 2022 12:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A0F10E111
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 12:59:08 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id bq8so4050220ejb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 05:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4hyvWLbeJJxoM7mZ4/otjR+VLNFuHkADnfUJBOyh0hg=;
 b=bG/PzJe8ibXQBjqAASi94m2nhpBlAAbqIzgSIRQKCzjT1RpNdd1oNeg9UnkZ4Eb60K
 yEBrZsFVFXewlQJ2bbzxni+P4RmmqRZil3LGGHUyo950OILFvC3BmvqjZ4RHjnHu8vHk
 R78iiaMcSsWljZQz+M6Sxl0vjY4UAxLe1Jkeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4hyvWLbeJJxoM7mZ4/otjR+VLNFuHkADnfUJBOyh0hg=;
 b=Z3RIW9eC1s5i/GQi6O9gqX0Fp8oz6Nz9oTWJDkmum9Y/qhATbpNIzmwgzaL80tT6oC
 ozWzUqYTImSlK+Tlk4E8mPEwjxitCYmsGTGLsNW/7OHcK48GfwtlYrzFrgc0frUAJoeZ
 ivuaVlq9ABGi9B5qH/8ZorjpMA9aTbwB2dyrLbvpswugZLBM90AQIgBs/fSZZ72utwCp
 TJVTRQIMGtpl7yaFD7hPuLixwGMB2IFHqN9StvOvUQalgLAnqD2GGT+WK6brnCfr3Ikz
 pzs8defxp7s0Dofb5XB6EtX+YQASyCLjqUDLxc89CAIMBQiqQGf25kROYY9zkUYmDgqp
 jgwQ==
X-Gm-Message-State: AOAM531xdJblr9QgBQMYYPhXHZDxSvQyevkipvfeQAwks+8Oc4e0LdSQ
 pjetVg5LW4HyUdtO+I3FWkNOaQ==
X-Google-Smtp-Source: ABdhPJzgDzDGkIvfQvaqy5czU/TOZkhk54rVowZ3LnxaMS1E5kNwPZgQIKGfdTAt6dSH2NcBsKeG9Q==
X-Received: by 2002:a17:907:6e02:b0:6e7:f79a:eb93 with SMTP id
 sd2-20020a1709076e0200b006e7f79aeb93mr8069200ejc.115.1649249946646; 
 Wed, 06 Apr 2022 05:59:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g2-20020aa7dc42000000b00418ef55eabcsm7890306edu.83.2022.04.06.05.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 05:59:06 -0700 (PDT)
Date: Wed, 6 Apr 2022 14:59:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DMA-resvusage@phenom.ffwll.local
Subject: Re:
Message-ID: <Yk2OmC3vB3/RpcAd@phenom.ffwll.local>
References: <20220406075132.3263-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406075132.3263-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 09:51:16AM +0200, Christian König wrote:
> Hi Daniel,
> 
> rebased on top of all the changes in drm-misc-next now and hopefully
> ready for 5.19.
> 
> I think I addressed all concern, but there was a bunch of rebase fallout
> from i915, so better to double check that once more.

No idea what you managed to do with this series, but
- cover letter isn't showing up in archives
- you have Reply-To: DMA-resvusage sprinkled all over, which means my
  replies are bouncing in funny ways

Please fix for next time around.

Also the split up patches lack a bit cc.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
