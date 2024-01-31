Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E3F8445B7
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 18:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E85210FB6C;
	Wed, 31 Jan 2024 17:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F7510FB6C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 17:12:09 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a34addf84dbso139658666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 09:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706721068; x=1707325868; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sBkFRNywevL/2N5Y/QCekYzbj190x87NDyyvW7/2yGY=;
 b=YHGdkrQ8fbcQbkVV+OvSSTeFx18LPthMcnt5izVyH4rf1an4zqmLpsIHIrNeKMWwst
 AwN80M/+hgvYIb1jpO3Jw8IDV0uTfj2sCpkHRtDtqUPKwOnzcMT4p2bSK3nDZw0o/BHc
 S6hH49978xjO+NFOUQikqfEEApcohnaXZamLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706721068; x=1707325868;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sBkFRNywevL/2N5Y/QCekYzbj190x87NDyyvW7/2yGY=;
 b=og5EzJZbU8Ybp/DAT359FAPD90d4MbFelQ+GKleFozFzCb4BLEdbY5Tmxd5gQSY2T/
 bP3CoiT/iwX4E6MoQHKtu5D6PssVOtTqU2kt0CCR84/XI1CjurpYSlaQTZiZoCYtAD6x
 PAlCV5/1rBdPcwhmayxtgBBh4nYKtuylcVDsSyTAv4WAhsIMzYW727hZhBHcJg3JDUkI
 nhzI44049aqves3W33GhWaQfg5uenQKa1xEfqFHLtp+7LKUb63p2LfLTnyGEjF6xCMMY
 3qVhYLvjClYPGiTcc1SSgHgxlXazbeS/ObTlN+K7BLWeeWUgx2vdDYt/d+QxK38cM6Vg
 vZEA==
X-Gm-Message-State: AOJu0Yz5svETwlBHD6nExWKHOIVcJ2d1se+8FP6xslCpg2Qsx3Xtbj/t
 MNiLtkA0e4OGDVD3QXo93Ngiw/vpOYO/tf1/29Q0/DSJ/vz6LjJxglkQMcBOFGM=
X-Google-Smtp-Source: AGHT+IEXLOd14TBgrpohCXh11GAEeXFo74zQwCyvg1YE+MeY0J5VsEdwY0IieFnmoBY/LLVGrGBjrQ==
X-Received: by 2002:a17:906:1b51:b0:a36:95cd:5e62 with SMTP id
 p17-20020a1709061b5100b00a3695cd5e62mr750011ejg.7.1706721067631; 
 Wed, 31 Jan 2024 09:11:07 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXxDsBPKAFJ+rOt/zkh7BLucRhUKXmIw7ci17iIBsT007O4DsY/HObYtMDpDQV83SlYdc2WGGEqXYAP9jNqBs8XfF9jvvGKScmmv9ZaiuWRgurb23R5NMA39ebdMHjv2L80l/BCTCZJuTdit3KZU9Ai8q9Z0IJpHakDeV8JTcZlowjHkHS7Tr+GK1awbZdlGJDAhzzU+ELzGkmNZATQQ8Vfm26z
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 tl10-20020a170907c30a00b00a3554bb5d22sm4986765ejc.69.2024.01.31.09.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 09:11:07 -0800 (PST)
Date: Wed, 31 Jan 2024 18:11:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/sched: Add Matthew Brost to maintainers
Message-ID: <Zbp_KUvsdcSMHsSE@phenom.ffwll.local>
References: <20240131030302.2088173-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240131030302.2088173-1-matthew.brost@intel.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: Luben Tuikov <ltuikov89@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 07:03:02PM -0800, Matthew Brost wrote:
> Add Matthew Brost to DRM scheduler maintainers.
> 
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Definitely need more people taking care of drm/sched, so thanks for
volunteering!

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think this also needs an ack from Luben and Christian. And you also need
drm-misc commit rights first, or it's going to be a bit tricky to take
care of maintainer duties for merging patches. But since your sched
patches now have landed in upstream this should be just a formality.

Cheers, Sima

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c00fad59e91..e968d68a96c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7308,6 +7308,7 @@ F:	drivers/gpu/drm/xlnx/
>  
>  DRM GPU SCHEDULER
>  M:	Luben Tuikov <ltuikov89@gmail.com>
> +M:	Matthew Brost <matthew.brost@intel.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
