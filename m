Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B275121D9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 20:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9D710E28C;
	Wed, 27 Apr 2022 18:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48F310E28C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 18:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651085844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zpp2S9nE8V2+s6ZhFGuHdo2pIcOg69sKmnVSy6YdZ1I=;
 b=AsZ0J6OyPg0ZNsadvf5Y1+dnJP1jXfYCGGMk5WIGZDMJYiDzhow7YVI2XiM65hdQkzIKmD
 SDDIuc532c5etEmvkiQHzEuRyK3RIsgLJ49zi/HWL2MoPdiqj+YDBunGZW+EO2DGimEVkU
 DzSVQBS/3PaYcF0WAtOcEatQOc83S2s=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-bo2NdxQgPyKXJqL4WknvlA-1; Wed, 27 Apr 2022 14:57:20 -0400
X-MC-Unique: bo2NdxQgPyKXJqL4WknvlA-1
Received: by mail-qt1-f198.google.com with SMTP id
 x5-20020a05622a000500b002f37cb8b803so1735323qtw.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 11:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Zpp2S9nE8V2+s6ZhFGuHdo2pIcOg69sKmnVSy6YdZ1I=;
 b=47w2p7cd8+nPOlNq/ie7uci4vSPV/8NUw5oJQT1/QYXSl890kKFfMcOjimmEbqGlls
 JFUAyMgRqBzUell3f1XEbdLyRWAxnLNV1NZn9A+zU1y3j9GnUPkkylHkT/ApBsqCx0lL
 G+z8If4cwtS7GpcbG05cFxf1fL88s5BcSyjZjkGBj1Frb51SpzBJun/P3WDI4aGAOqM9
 +OlDL8tig/+bi2UFuQ+f9/JDdK73oB1C44KdYK+PdIqlo/+p7zxhhuqZ51tRwpXdrYdb
 JYhGXCy+oGTORSlTWariUW7hRs+Y/yEO1fAWy+1BlqWrwX93vL8ITwo2lH/tIpEsy44d
 vZhQ==
X-Gm-Message-State: AOAM531rDN74yNw4Y94A2HTyRgvqPSGhj4V9fB/yMHswPqPaV7SchhEq
 LQYMpVFPUjAbum/FVbCdIFo3aC7AdipOUjBUzYHAWG/KB7M2mMLRfFWvpkpg9g+dgM7Eli6P+xI
 GG+oJqFsqkDirC/Bt4Rz2ooYSpLaI
X-Received: by 2002:a05:620a:244b:b0:69f:5870:424a with SMTP id
 h11-20020a05620a244b00b0069f5870424amr9961107qkn.500.1651085840074; 
 Wed, 27 Apr 2022 11:57:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaiae/dPv6LZvS2OF4G9gBDKqeb1QhbmEzqSpZGV7qY+EsycgRZnSiqp+ywhItqUcRu7SzDA==
X-Received: by 2002:a05:620a:244b:b0:69f:5870:424a with SMTP id
 h11-20020a05620a244b00b0069f5870424amr9961098qkn.500.1651085839832; 
 Wed, 27 Apr 2022 11:57:19 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 t22-20020a05620a451600b0069f4d952f8esm5781334qkp.0.2022.04.27.11.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 11:57:19 -0700 (PDT)
Message-ID: <b005492aeda1324727c6caf946da1e5670297878.camel@redhat.com>
Subject: Re: [PATCH 0/3] HDR aux backlight range calculation
From: Lyude Paul <lyude@redhat.com>
To: Jouni =?ISO-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Wed, 27 Apr 2022 14:57:17 -0400
In-Reply-To: <20220426123044.320415-1-jouni.hogander@intel.com>
References: <20220426123044.320415-1-jouni.hogander@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mika Kahola <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey! I will try to test this out ASAP on all of the HDR backlight machines I
have (so, many :) at some point this week, will let you know when

On Tue, 2022-04-26 at 15:30 +0300, Jouni Högander wrote:
> This patch set splits out static hdr metadata backlight range parsing
> from gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c into gpu/drm/drm-edid.c as
> a new function. This new function is then used in admgpu_dm.c and
> intel_dp_aux_backlight.c
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> 
> Jouni Högander (3):
>   drm: New function to get luminance range based on static hdr metadata
>   drm/amdgpu_dm: Use split out luminance calculation function
>   drm/i915: Use luminance range from static hdr metadata
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 35 ++----------
>  drivers/gpu/drm/drm_edid.c                    | 55 +++++++++++++++++++
>  .../drm/i915/display/intel_dp_aux_backlight.c |  9 ++-
>  include/drm/drm_edid.h                        |  4 ++
>  4 files changed, 70 insertions(+), 33 deletions(-)
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

