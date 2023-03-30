Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3805A6D0D77
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 20:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EEF10EF67;
	Thu, 30 Mar 2023 18:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A4B10EF67
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:12:09 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso12394238wmo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680199928; x=1682791928;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=seHCnSN9fc24OYrcfpBdgfwWSuQMWUtLp0CPwn3+aMk=;
 b=Ew2vSHlLWxT4SG2ip0bGA2R6eX6YWrkt2/fi0g2GWygsYHHNs8rzsEhazvys0UqyGL
 5kkCL9eySmcHibaebWxtOS7kO5X1XxGYTm8CD9LqXXCZzK/WRXybwuJeGhCyftu9IMpi
 +hxZnCx9BTiGQNJUYucCVvUdqg3vsuP34HjsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680199928; x=1682791928;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=seHCnSN9fc24OYrcfpBdgfwWSuQMWUtLp0CPwn3+aMk=;
 b=58UoD8GL//aSuc58nflVqtpIk/IZc0Eu1t7h9awHctSNtRJ5cCNuSsYTaKPfKjvAXY
 mWZVK8gHEGNpLAY0Vio94KGp4dQ1m60GCD7uJcV5ehhj+L2RIsYnpOpYLHi/HuFXdgBO
 UbfhBdKo5LZN/1TKnQTYubviwxKVMJsi4eXn/7TrNSGzFwTFcXUepHvIEGVf2FnAAzh3
 1qD02Q2NN2e8A51oy8s4lPReVDfpIifNyf73uFO4xB9ryhK4zxE17f5P4Ivl0cSrFpXS
 29PSWcmpIaXiNtqsdizJKr11/v/n77iuNTHdMHgJHwV0P1oYyugC1JQiugifegkdpkdS
 0tlg==
X-Gm-Message-State: AAQBX9fRgX882xKJtWGc3/SZO1YMWCE+J6M/LOwsC2CpHKuwPA4tDB3T
 LYTiIH7lfCJ/MxCDLr83iJl68Q==
X-Google-Smtp-Source: AKy350aBfkHrD19cfljv2cx+BMmhlX4WzWEZwpj221HqqkcsiMky1WcqHJLfWgas6NUV6dFKX7500A==
X-Received: by 2002:a05:600c:3b91:b0:3f0:3d41:548f with SMTP id
 n17-20020a05600c3b9100b003f03d41548fmr1516098wms.3.1680199928082; 
 Thu, 30 Mar 2023 11:12:08 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 c1-20020a05600c0a4100b003ee5fa61f45sm7515953wmq.3.2023.03.30.11.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 11:12:07 -0700 (PDT)
Date: Thu, 30 Mar 2023 20:12:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu drm-fixes-6.3
Message-ID: <ZCXQ9MkO7xO9zaF2@phenom.ffwll.local>
References: <20230330153859.18332-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330153859.18332-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.1.0-6-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 11:38:59AM -0400, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> A regression fix for 6.3.
> 
> The following changes since commit 68dc1846c3a44d5e633be145c169ce2fd5420695:
> 
>   drm/amd/display: Take FEC Overhead into Timeslot Calculation (2023-03-29 17:21:06 -0400)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-30
> 
> for you to fetch changes up to 2fec9dc8e0acc3dfb56d1389151bcf405f087b10:
> 
>   drm/amdgpu: allow more APUs to do mode2 reset when go to S4 (2023-03-30 11:23:58 -0400)
> 
> ----------------------------------------------------------------
> amd-drm-fixes-6.3-2023-03-30:
> 
> amdgpu:
> - Hibernation regression fix

Yeah for a regression fix a 2nd pull makes sense, pulled, thanks.
> 
> ----------------------------------------------------------------
> Tim Huang (1):
>       drm/amdgpu: allow more APUs to do mode2 reset when go to S4
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
