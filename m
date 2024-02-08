Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BB184E3FA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39E610E8DF;
	Thu,  8 Feb 2024 15:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C21Uv5HZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB15010E8DF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:20:59 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-5bdbe2de25fso1412019a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 07:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707405654; x=1708010454; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=D4SUyOkuVIMktpMqHoBsqERsMG6Vrc32rtuOcsFES00=;
 b=C21Uv5HZUAOBtrxbYmy18b8hcgG5pwB0ILV10iumouT7DtutTOKoJRxZjOome5yKOl
 8hip+ct2KA287lytpv0+N1ax/8o2FDtRbdnnJmISl0/WvV2gLYor7prEtIMbwPtqNurM
 jEDfZtsuljLs/v+Ya0Xin4FubLxK6P/ZzvL/OT6n0/8VxXPH8Y0Mf675mdAsDSVHfCeY
 dfjEPIxM9fB49+nsSNwJMdweDQeQxNwX2GJFIH8c/KPT2VuigXpcBSR+K+jAXwzPujAg
 Xa+sUyUxzsO4wa+fxsr7u/rpBYdVvlTaZcTfW+VIzFfWaFDaA8iG/YgrrxQkdRgZv5wG
 CVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707405654; x=1708010454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4SUyOkuVIMktpMqHoBsqERsMG6Vrc32rtuOcsFES00=;
 b=EWp22D3V1v4bklIjeRvVTzRvqcCSpZ+FIszwJhd2FDXR/vzlULzshLiOTWRQUTOwc9
 duas2zChbcwciNeanyME/L9UFx/sulZ54n0kbRoSm33Us866STWsvhsIN+hYfI1cuwLn
 3gmSGMWgD0bHMjVUF0Y09Qbe0PhGm6JDK2QLAXVS6y13z1fpwgGVwaRCbbixQ51pW/W6
 PpbjHABphiH/UGWa+JefkdZpdfOvWjrIY865i2iDZHyhHNYzB6IiJFeV76NBImR+zn3q
 b59cxvlSv6QNf04lYcUukqzMtwJDRHlORCxFYZzGiv/11D6Lu8G+xlv9Bus4bB2djOPs
 ymAA==
X-Gm-Message-State: AOJu0Yy2en87z/QcotejvN0I6RHAM/jOgb4fPsvjyteGDgCVlDpfy2sc
 OoEuPkL7nK5tED32vdq3aZN0rHVng7aX04yNs6n++xwxA+bmiZ7f60AcCoUH
X-Google-Smtp-Source: AGHT+IFWij2qLvMyMS1So8ZS5+EbE5THWihGnXyqY2UhXz23H//aOHTSEK4bTUi5aRbOfssdwTnM/w==
X-Received: by 2002:a05:6a20:1594:b0:19c:aaee:bb1b with SMTP id
 h20-20020a056a20159400b0019caaeebb1bmr9414587pzj.7.1707405653887; 
 Thu, 08 Feb 2024 07:20:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUKhHbop8QyLV7zKtS1yikcbbIGGioUvFtS8Ksy8Q4nTMXqusYEVCj+9Gh3yHXuX7zHCTVGbh1zeEVYGkwUGLfZpwqPeRNsw8yimR5NmsT+iP559ztzaK4/Pij3W02NcVPXI0Sp3ZaWxgRvJ8Etu1y6pi6HXS46CjiVfMPSuyXOp7v5ttRW
Received: from five231003 ([2405:201:c006:31fd:caf7:454f:61ba:8f68])
 by smtp.gmail.com with ESMTPSA id
 it7-20020a056a00458700b006e02da39dbcsm3988559pfb.10.2024.02.08.07.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:20:53 -0800 (PST)
Date: Thu, 8 Feb 2024 20:50:48 +0530
From: Kousik Sanagavarapu <five231003@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] gpu: drm: display: indent fix in comment
Message-ID: <ZcTxUDb3_Xtqk8uW@five231003>
References: <20240124183659.511731-1-five231003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240124183659.511731-1-five231003@gmail.com>
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

On Thu, Jan 25, 2024 at 12:05:56AM +0530, Kousik Sanagavarapu wrote:
> The comments explaining the function "drm_dp_mst_atom_check_mgr()" had
> uneven indentation which made "make htmldocs" complain:
> 
> 	Documentation/gpu/drm-kms-helpers:296:
> 	./drivers/gpu/drm/display/drm_dp_mst_topology.c:5496:
> 	ERROR: Unexpected indentation.
> 
> 	Documentation/gpu/drm-kms-helpers:296:
> 	./drivers/gpu/drm/display/drm_dp_mst_topology.c:5500:
> 	WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Fix this by getting the indent right.
> 
> Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
> -- 

Ping again.

Thanks
