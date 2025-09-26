Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E704BA28E1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 08:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359DB10E33D;
	Fri, 26 Sep 2025 06:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MuxhxgYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9295310E335
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 06:42:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so12016685e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758868978; x=1759473778; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/hPWagNOQmEjTvnm5Z1LNkDjaoDSty3o7kgmSw7FvY0=;
 b=MuxhxgYlu3Y0rLiyq/DRdPG4R6SSGY4Ch8MeCe0Tr9+lHCcJqoWcfIrEmGpNYDh/VF
 6YWg5ifOAHvN8iX22yseRmdZH7cmVHIqFb0POmIX9HqeoTssnV4a4MgzaESKBprEaRrx
 l2zyFIX8BXa/1qn8OmSaw0LKaZPULsNEyr9GQUorZ+ZnnAc6MMog99wGF0CjY2JqHaMH
 q5Zuuww6YwqnDHY9IM/fysPmzqsOBEQJxkweG1e/w1ZcMwg5TEsd3XiMD3iLmf8f9z3M
 zNyvpTgA0WlPQGIWANlScT4Zw7x0laDn2NSf8ylyST+J9H3kdD1Afhpfe2an+L5tWPGN
 fqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758868978; x=1759473778;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hPWagNOQmEjTvnm5Z1LNkDjaoDSty3o7kgmSw7FvY0=;
 b=Mjlx0UcARZOoBhBj4i/Z2h+2RazxTj5Q6cEjosAf4Y1OhBcEyWpz0XDHLzZAXMVONz
 zGpQowdoEmc44bNQazaMFe6G/16g3IL13p0fhHN/esSg5y5vD8tyttBjoUHfez5lJyoU
 AuVGUDzkMHgv8D4+gDhhmG5Cjv7vKllKR33uNRFsZPjl5DBsLyxG4pwS4+8ZAm5ndkWD
 +S+wL7sdF7But9WB3ZxxckEZnyvl3yj8eW0sVLSKek7xtHpFMhUoI6w2cWKVsd5c276l
 iTD14BVVHsYfggH8lbzRID7opxt9kYXxSJfEoq2YAFSC9iZluV4gR00GrUDVNC7N0L8y
 sBjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq83iFuLa/V7nGw9AYiLF2nzg05k3A2TwqcMb4HtUSHb9hktTq1K1+El+IjU5R0SeifueapntPYYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbqNpzR53WYqxgQ6YAJNmrpl6EYvNanA1bBS4Du3dmsnzb5DVG
 Sqo+Qn4fHamgPT4cJZv9fGwrzrO3b2FDkwjIrbrLQFNAoCmd3pVm/X8XEORs2ahA2+c=
X-Gm-Gg: ASbGncvG0gxlgV5Q/c7TVgbwqZVbC5wxt7RMUY02gil4n7E4RZst7dupMBBvilu7Vdv
 5Ot+9x3wfv+CWY4nLFvwVDAUU2V/Q5mOP/8LGIIa7pOA4baKDUb35/aMf+nF7hQzyKez2tqBJJo
 aqz/oEFCDoPd1gqqaFBiQUhdsosPaXX60XIAKFrb/y3LpeohRiVNNEDnFTClETXvtdeTY+3CsYm
 XhEhSKf99GWeqz2hZyJ0rHyU/bs1iA7UODHVCNMzqTs+SkDQ7QT51UHLBaIbx9KMQXmDSAP+u9G
 /l9z1S2bJ+yJWRS+j0mfALv00eUcqpOxaznewURaNTRE6kdshY7yqsXsEECui7/FnkJ1gcvsE7M
 p/m0GNsryqEiT9WwYqzIZ5VEXITerPGJm
X-Google-Smtp-Source: AGHT+IE4RNDa+SBbyedMcpjrMBUEZfbXwj+HO0zplrjXyPKT4StsRppVNBzD/YjIofvWgF+YJsMPMg==
X-Received: by 2002:a05:600c:5297:b0:465:a51d:ab with SMTP id
 5b1f17b1804b1-46e329bbf5amr63328455e9.15.1758868977931; 
 Thu, 25 Sep 2025 23:42:57 -0700 (PDT)
Received: from linaro.org ([86.121.170.238]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e332070e5sm30629935e9.8.2025.09.25.23.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 23:42:57 -0700 (PDT)
Date: Fri, 26 Sep 2025 09:42:55 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Message-ID: <co66vf57i4od7bpd4gwv5ztonjecvpp4nzkrvjjuwkwvp3xkar@3zatxwnwpzp5>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
 <krinjfouhgak2fvrv4runtv4kbocvfjpwxq6y53no3ajo3ykih@ooucnj5peu7j>
 <g7kqqed625hlz7yq5uwxyimfupxryr2et5jxsrmgw7jk5x5zg7@zdrgqf63n4w5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g7kqqed625hlz7yq5uwxyimfupxryr2et5jxsrmgw7jk5x5zg7@zdrgqf63n4w5>
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

On 25-09-26 01:22:07, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 09:51:28AM +0300, Abel Vesa wrote:
> > On 25-09-23 16:03:50, Jessica Zhang wrote:
> > > Since 3D merge allows for larger modes to be supported across 2 layer
> > > mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> > > supported.
> > > 
> > > Reported-by: Abel Vesa <abel.vesa@linaro.org>
> > > Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Is it also a T-B? ;-)

It will be, by the end of the day. 
