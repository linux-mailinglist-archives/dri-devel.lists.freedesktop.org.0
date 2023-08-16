Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F2077EAD4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 22:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FF910E3B6;
	Wed, 16 Aug 2023 20:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018BD10E3B6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 20:38:54 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-565f24a5c20so172264a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 13:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692218334; x=1692823134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cF1BM3f2bxhcGy+lZOB+pU20s/yGXG20KfnXyoafx1I=;
 b=S1cecA8Y35UFe/B7wgZ82/ZTWMSsufbVjFnSUYcJB3o8aMW/V3gdW/NqqjLGmO+/Nr
 p8v0eiPJZuYK4vEcgNTVWplYOR4aqODDHJvhA5an/IVfLeY6N1sDRsz3rQxNBzwBiMVD
 4gs2IAjxEHrARmE99bg7/U1Ht2qAQtqmWPVuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692218334; x=1692823134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cF1BM3f2bxhcGy+lZOB+pU20s/yGXG20KfnXyoafx1I=;
 b=lRhkms4ZEJXFHf9JrWP8ICBnOM04eMXoE3XCwL6J2Gnfqz+Ez1/rrZC7g8ymgxozZL
 RupYxQwDcFrdE401WfWIjY0QZEWfHUIDRAjujujZBuZG7RsiWC5tCw2mXGiSBRzsknHH
 QK4Nh6IuRAIv7k135Tm6iv/maW4kMudZqDKyJQtJNv+HpCrxN9p4Dm3hl1jADnxzOqK5
 uDZBRTAFsIO7ZwkEm5544p/1qHUr1KisglQaw7mX3OVf+GGZGO12K6dVtsXns4pwwsGH
 QbZ8nsbJ3SMZAwZCHemBIqcZg7VdaCnl0Ng4WuMrH4jKNagF2AgDY9Cs1xJmKedH5t1x
 Ylkg==
X-Gm-Message-State: AOJu0Yy4Y0CDVRogUNCx8UJlU3Hxyz4ofPOgzApe0pAGeplnxvLlYsSX
 9nEyLxJxQ0ZIRkdSzcLffFTSNQ==
X-Google-Smtp-Source: AGHT+IFBs4yFI2ZdF5J+zDBYRSv/8/8CUjxCOKVwBxVARzrU7XVEhR34nZ31QOQcz8vsQ6XyltMRDA==
X-Received: by 2002:a05:6a20:938c:b0:13e:90aa:8c8b with SMTP id
 x12-20020a056a20938c00b0013e90aa8c8bmr977018pzh.4.1692218334596; 
 Wed, 16 Aug 2023 13:38:54 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 i5-20020a63bf45000000b00565cc03f150sm4165109pgo.45.2023.08.16.13.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 13:38:54 -0700 (PDT)
Date: Wed, 16 Aug 2023 13:38:53 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH 1/2][next] nouveau/svm: Replace one-element array with
 flexible-array member in struct nouveau_svm
Message-ID: <202308161338.1B73172C@keescook>
References: <cover.1692208802.git.gustavoars@kernel.org>
 <087a1c335228bd245192bbb2fb347c9af1be5750.1692208802.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <087a1c335228bd245192bbb2fb347c9af1be5750.1692208802.git.gustavoars@kernel.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 12:04:06PM -0600, Gustavo A. R. Silva wrote:
> One-element and zero-length arrays are deprecated. So, replace
> one-element array in struct nouveau_svm with flexible-array member.
> 
> This results in no differences in binary output.
> 
> Link: https://github.com/KSPP/linux/issues/338
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
