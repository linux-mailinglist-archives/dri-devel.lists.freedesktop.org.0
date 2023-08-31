Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B978E80C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B36410E5BB;
	Thu, 31 Aug 2023 08:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF02C10E5BB
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:31:11 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52a1c58ef30so155606a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1693470670; x=1694075470; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/FTn2te7AuLKHPlbq1eDlwj6cMqVBETPIotPXlSzOC4=;
 b=WaZx8n2eI0ClUsl9UlF+vVG2GnB+0ot8oaoVIP0mkmP41bzk52BqBxWk91UGVeNkrz
 HYbzBnwqy+eZoSKtv0MN88U4KKQjKasBbruIrqvTul+ngOuCMySaBCJwNhpVThBo3MOe
 /XmSt0iZqpg4+q+i9HCyC43xQJx9xaXp5cP3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693470670; x=1694075470;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/FTn2te7AuLKHPlbq1eDlwj6cMqVBETPIotPXlSzOC4=;
 b=huUOgWv3qZf1cLr1EFdgX9DRoFdWyfyo+WuSr0+6oJvJP+8LDtFYT8eTygtDluR1V1
 36LLna54iZzEk9AojKL005gy6xvE4crJCmaqEOMsDWhtPXrlKjGKBnVhNOjw8BpEziAF
 uuy5Loy4ZPKZv3tnfn427R32RFbCbFhF/HZKjuw5jMUtTsfaygfVUHXdUX7qb1aTZfKN
 OUBR03HZxEzmYjNlpXPAoFsbNMbXbGJzQ9ECh+VGuxMrq244a1f8g2Cw2lSS+h2RBdgu
 tW2rRMD7XvAi0nValB5Tw1b+utmWTd6MyP1Rp56/rk8MYWHNYrFVBJJTY4oipCG3arj3
 2kvg==
X-Gm-Message-State: AOJu0Yx8OqSH3HlvBAIdFwdN2DVB0nanqmJTcJCic1+Rz21PGjIdrdyO
 AATFNn+pIXo731ui0HBaKnP0JA==
X-Google-Smtp-Source: AGHT+IFS0gTMgxz5Q2aSbPp/BmPnEhXi+Q9Jd3UcN62EaMEirGUSZFSG0tRLFjiLmdJu2iK3QMWBng==
X-Received: by 2002:a17:906:109b:b0:9a5:9f3c:961f with SMTP id
 u27-20020a170906109b00b009a59f3c961fmr3644049eju.3.1693470670162; 
 Thu, 31 Aug 2023 01:31:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a170906379300b00991faf3810esm501796ejc.146.2023.08.31.01.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 01:31:09 -0700 (PDT)
Date: Thu, 31 Aug 2023 10:31:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/4] drm/doc/rfc: No STAGING out of drivers/staging.
Message-ID: <ZPBPy9K/Mx820Z3q@phenom.ffwll.local>
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829163005.54067-1-rodrigo.vivi@intel.com>
X-Operating-System: Linux phenom 6.4.0-2-amd64 
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 12:30:01PM -0400, Rodrigo Vivi wrote:
> Also the uapi should be reviewed and scrutinized before xe
> is accepted upstream and we shouldn't cause regression.
> 
> Link: https://lore.kernel.org/all/20230630100059.122881-1-thomas.hellstrom@linux.intel.com
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But also, I really don't want to be the gatekeeper for "is xe ready for
merging", so at least for the last two patches I think an ack from Danilo
that there's indeed a rough consensus/plan is much more important than my
own. The first two don't need that, because there was no "build dri-devel
consensus" aspect to those.

And for the sched side I guess an ack from Christian or maybe some of the
other in-flight drivers (Lina or Boris?), with maybe an ack from Danilo
for the long running compute stuff (or whoever cares about that, I don't
think amd is working on extracting the amdkfd trickery, but maybe they
need the sched support when they add real compute to the render driver
too) is again much more important than me dropping an ack from the
sidelines.

Cheers, Sima

> ---
>  Documentation/gpu/rfc/xe.rst | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> index 2516fe141db6..3d2181bf3dad 100644
> --- a/Documentation/gpu/rfc/xe.rst
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -67,12 +67,6 @@ platforms.
>  
>  When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
>  
> -Xe driver will be protected with both STAGING Kconfig and force_probe. Changes in
> -the uAPI are expected while the driver is behind these protections. STAGING will
> -be removed when the driver uAPI gets to a mature state where we can guarantee the
> -‘no regression’ rule. Then force_probe will be lifted only for future platforms
> -that will be productized with Xe driver, but not with i915.
> -
>  Xe – Pre-Merge Goals
>  ====================
>  
> -- 
> 2.41.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
