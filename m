Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F49EDA61
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B1F10EAA6;
	Wed, 11 Dec 2024 22:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XoyX2INU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B88B10EAA6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:50:41 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-540218726d5so3370523e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733957440; x=1734562240; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhObuxr/02KFb2isXPxGgNEnZ1jE84bLOSCb6UyuS5M=;
 b=XoyX2INU4JA7lbPvvtLUEmgDcVEosIMiHOnyAl5MHPrEezRhPxtt3xq3cGTsaqQBcI
 tOmur+an5dygnC6H2dx9B5vPcHDE/P8sly+ERBvHrTxtkAL/qv8iaO7H1bHOoP8H7nwJ
 exHpc/EB42rSJjzcNmPaz/Mj0F/wfmIyfHceN3WdDsDNA9SnCKmm/OCbghyiPZrpbQwC
 fzPKwwIlYICJflyqxiKyPfn5EXO31tnuEZyO3XOYuJzqRruOtU4YazBQ5K0NWph+DzGV
 b7vaijhB1LzzRsPRyclQmfZyWaeNuNbgQ0yYUX56Fvd15GJrKsUYmIdJfafa2/jG0NBZ
 vApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733957440; x=1734562240;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhObuxr/02KFb2isXPxGgNEnZ1jE84bLOSCb6UyuS5M=;
 b=Y4yAASH+KZnAotZnFtazwkN9SFkteMfO1fH2/NRL6UdKtwqfmHMd2AR+NqIpXs5zX7
 ydICSuGYB/MjaK9Mw6RREuHaUN53+uw6mQ7uztRyT28u2ZFSbXvUmrOP3imIs8LuSmt0
 OB31loxIXqVW5NLz3VI72TigEkHa3iYmOGxXlVbTZ/CEQqXn0XcaEH1ZQ+oOCo3MU+x0
 toylp2zb0KTA5/j0+khK7OyjGsQQTqqd6twR8nS6h2BYxl9VdO0zV2IZMI3dTlno0Ufi
 SguT/ielx5dpLHA02eK/Y+wU35CXv50QrS7EZSZXW0M1IkWzVzv45MguBmqi76hrw6hp
 ksZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjFDd36xdY7GHzAt44qg7ANcqUA7t4MDd35iAQMDxGNEmSNByfSF92dZ630pbUcGzi6V65NPyjZe0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfpzdZLJHMs1jDueoKpMq0svT7e6f4rZQ0kh4gk5aGNHqI1OHy
 XzSPngPJw1dgK98pboArIHD/bmMZiQAGLvZNo55Uz3TCbLgxRlSDGBED7Lt2uzo=
X-Gm-Gg: ASbGnct13srv3NJ5nkPiJohlyPqAiU7Of7eIj5obuGH/3uEPKc5QN/vq2NJeOm9TL7l
 8mloF+vAJBrsJcl4bHeuDhDo+Y5BdbtWfQSK6j30s+BQDKe+Pkl2vmEf6b/ZHvtGLmPX8K1iZ1J
 BypPLjtRvc62JUjR9wS0mVqEJ9F80s9UCsFESWVjEylo6m97BruW7QokU4RDnh2A6knb2AVRT2R
 NcD6i9lThjjZFnfV3T5uXJdzE7tzFwCEmBP9tvKX54lAsd2wSdZuVf8IRUhNiPs+ufaMUeBGTns
 QcutuufhdMV6crGdQsU4rRv+Lo/y6HbnCA==
X-Google-Smtp-Source: AGHT+IFfopIZRMQLZAH8vRQxGl2sNJnS4PO0XzwFwmFMQsUTluQcT38x+rS7eG9hh809gTG97MV1HA==
X-Received: by 2002:a05:6512:2387:b0:53e:391c:e985 with SMTP id
 2adb3069b0e04-5402a5e8309mr1405330e87.32.1733957439569; 
 Wed, 11 Dec 2024 14:50:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401e51bafesm1154464e87.221.2024.12.11.14.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 14:50:38 -0800 (PST)
Date: Thu, 12 Dec 2024 00:50:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 quic_abhinavk@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com
Subject: Re: [PATCH v3 2/2] drm/tests: Add test for
 drm_atomic_helper_commit_modeset_disables()
Message-ID: <njx2ogued4bbu3ub5jlnczql3x2dr4i72onhmh35tgxyuf3lek@3liwh4butumk>
References: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
 <20241211-abhinavk-modeset-fix-v3-2-0de4bf3e7c32@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-abhinavk-modeset-fix-v3-2-0de4bf3e7c32@quicinc.com>
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

On Wed, Dec 11, 2024 at 01:18:43PM -0800, Jessica Zhang wrote:
> Add a subtest to check that modeset is called when the connector is
> changed
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v3:
> - Use BUILD_BUG_ON to check connectors and encoders array sizes (Dmitry)
> - Renamed functions to be more test-specific (Dmitry)
> - Added comment description for test (Dmitry)
> - Return get_modes_fixed() directly within the encoder get_modes
>   function (Dmitry)
> - Move drm_connector local variable declaration to top of function
>   (Dmitry)
> - Changed drm_test_modeset() to a more descriptive name
> ---
>  drivers/gpu/drm/tests/Makefile                |   1 +
>  drivers/gpu/drm/tests/drm_atomic_state_test.c | 244 ++++++++++++++++++++++++++
>  2 files changed, 245 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
