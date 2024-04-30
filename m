Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157568B769A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 15:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC4710FB20;
	Tue, 30 Apr 2024 13:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="J7MwgEQT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A07C10E348
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 13:08:13 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-346407b8c9aso1233787f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714482492; x=1715087292; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fytq8Y6LICmGHTnA5nI5+IvDlEku/UXSRqFD2nQ22Dw=;
 b=J7MwgEQTgp24bE5mkUao+bkYqWOGudAbfF7UHAET0c9URwVr//W5UAiz0612ik6TNE
 /stgGGbA8EtCmHRYiz4mBqrTzKpStyZsgr4dteDIP0qK7zHeqwA9N7hObz8FX24m/yhw
 0DCNIu7DpdtMgatL2RrQ67PJ+JAagLfCakkXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714482492; x=1715087292;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fytq8Y6LICmGHTnA5nI5+IvDlEku/UXSRqFD2nQ22Dw=;
 b=V0ZrCteX0+5eaG3Ag+OSbw7RoK9vvDrLAWMeEyL5qPsx/jRe3XQ0JwfnC2xLY9+yHz
 HSKu97Hjv0T56KpT35hCkHtCnkQsY6qvpG9243n6/ZwKug528rvCmbMifqRz55XljfP7
 JCARlEPnrvsoNys7WSNSgTlLLK4l/VBzmAu/FMY935kvcAoe2yH0OyE9lFNh/iwIEPf9
 zgCvYm5gsbkdIcMjgRNAqU2dmJV/KFTBtmDNUs45ZF70VYUEOI2VNY17wVDosbfXxasb
 hFo+awpBnklTeg2DuyqE2J2kITqp7DNoj186NLcSRefr38kL7AMFgvr1rl5WzfmznPo0
 QjlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4jtibU4x6wzqL+7xUasSq3HSNFWOtCcDTyRZZUo2kqw3yLmpXX7ObiXqzDW4WQbk83sMRIndFXocHfRg57a12t3oep4oesHWS14BGa2N0
X-Gm-Message-State: AOJu0YyQrn6+a1a/pBMxZlgicWwxo0nM7Uk4iskwBA+tRjbsZB55nMUX
 Lefl54vuBvmKxBAfcyzExlB6ZUVYAD4femla6Q+P7+cTpGndDklgkxVxrELEIqo=
X-Google-Smtp-Source: AGHT+IHIQTEJCMSlcKlebgTJKAc+/KJHNB/ilPIMUGprQbAcerBthitg2QrloV/ghRXVxxa1fORU0g==
X-Received: by 2002:a5d:59af:0:b0:34d:8bc0:3f5d with SMTP id
 p15-20020a5d59af000000b0034d8bc03f5dmr1142020wrr.0.1714482492167; 
 Tue, 30 Apr 2024 06:08:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bl2-20020adfe242000000b0034c71090653sm10450704wrb.57.2024.04.30.06.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 06:08:11 -0700 (PDT)
Date: Tue, 30 Apr 2024 15:08:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: deprecate driver date
Message-ID: <ZjDtOVHquxhWeNfo@phenom.ffwll.local>
References: <20240429164336.1406480-1-jani.nikula@intel.com>
 <c6f1677d-6fdd-4a64-9072-5ecf6dae1966@amd.com>
 <87v8402gz8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8402gz8.fsf@intel.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Mon, Apr 29, 2024 at 08:53:15PM +0300, Jani Nikula wrote:
> On Mon, 29 Apr 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> > On 4/29/24 12:43, Jani Nikula wrote:
> >> The driver date serves no useful purpose, because it's hardly ever
> >> updated. The information is misleading at best.
> >> 
> >> As described in Documentation/gpu/drm-internals.rst:
> >> 
> >>    The driver date, formatted as YYYYMMDD, is meant to identify the date
> >>    of the latest modification to the driver. However, as most drivers
> >>    fail to update it, its value is mostly useless. The DRM core prints it
> >>    to the kernel log at initialization time and passes it to userspace
> >>    through the DRM_IOCTL_VERSION ioctl.
> >> 
> >> Stop printing the driver date at init, and start returning the empty
> >> string "" as driver date through the DRM_IOCTL_VERSION ioctl.
> >> 
> >> The driver date initialization in drivers and the struct drm_driver date
> >> member can be removed in follow-up.
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > I would prefer if it was dropped entirely in this patch, but if you feel
> > that would require too much back and forth, I'm okay with what is
> > currently proposed.
> 
> I can if that's what people prefer, but decided to start with this for
> the inevitable discussion before putting in the effort. ;)

Might also be a good idea to wait a bit in case there's any regression
reports for really old userspace. But I guess there's not a high chance
for that to happen here, so imo fine to just go ahead right away.
-Sima

> 
> > Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> 
> Thanks,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
