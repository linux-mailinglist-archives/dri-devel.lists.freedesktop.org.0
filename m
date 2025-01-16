Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF05A134A3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A7F10E8E7;
	Thu, 16 Jan 2025 08:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p7ck0bC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1073010E8ED
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:05:21 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso707489e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 00:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737014659; x=1737619459; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iWhOrb9/UASERUslvHT6A+SSMFyYSjLv0++Pj5Kul+8=;
 b=p7ck0bC1OHCs9nOgJ1t/DvqZOonLzrGFdCDPV27sthZ2+FCnB6KD1129Dt1OKDLlUe
 OkgwU39Pjig0M3tvjzYRQr9lbjaSmg76l5tLaNX/lA3LmbU+dAbV0XVf7AI6ygeqevrT
 YnTXPZ3MAwi+6Bt5SylNI7QgIXsCo5CQAT/Esl11CTNd4AAXkUTy94psSY4PL4XqyGpk
 GdYjuxRkzOtsb3BR2XI9fhgShpEEQhHuto+P9hgMfmQH88RS/KR16SW784XwUO3t1ROe
 YLONFO/4Zh6RfdmTbbkBlTLHH09uSMHxyLp57By4+PYwUklWS5danajSZZ4EdQjQXxgV
 PmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737014659; x=1737619459;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWhOrb9/UASERUslvHT6A+SSMFyYSjLv0++Pj5Kul+8=;
 b=rfRoUBuqXoj+DXIW8rnx/iBj4ys1AulWgYG5akGkUhPLDJeZFzEYbDJJSXC7lHUsZS
 hWqc/9Gm7/oCa8hifZOvwn2Q3MQ8sACcrmrhCPEGS2v3NfB4lgiHKl6SI7VTlcsG8g2t
 PPL6v+AVdIbNK6gk7Ienh4EN9EmAtHGJKKJDY4qYpzZA5yTpbgkKjCkVplCzjpxYLOKt
 1/eNDXlJiDLtYoDLGAEgapzOYNVHjNBXxVxtPfkIVFexwqqy5aleEGcM3HzmxUbU6391
 d6pM9DqLMk66/n/lVXUmnJwmDucdio6e61FKu27VuM/psdr8eReeg6ehpORHbqqxBIqv
 qlhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQoHLZ2VYutNCRdDl8JCcf8WmAJ05APIalMo1ar7RyKdCUKLnnD+s7qm6TavuIoy9YGhZmMVl1lZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+/s39bMnlC2auOYyPlJHN+SNvz/pngAoBP/kUSaOk8MXqHGz/
 SUmU4lni/aXKoMJui/4ClHb6RZz/umOu2gN0QPdKiYs/NeltIUIvn+Jc9fShcns=
X-Gm-Gg: ASbGnctPq8xhgRjA8FVqC61n1tJ/nEoRKZdJXy7PR9ada0/5Yjji9cqgNvq+bl06/S9
 a+faJkKxhDA9c4qMl/9So0OkqiXkiDjPKb8SIabnTz7Qo/eRcDOBEerEuLh+QVLoc11aitQfJNO
 yg70jOTO5ZTs/b/V2OSE96wAIc4oq6oivwZywFGGbw/GPR1SRebAfxJPQKl8bbhFdZXV7PxvcXw
 XNux4eB8VPLmdKm7v5pESHdGofFoOpJ/sDOMdGsidYtpSeo4qz2z9LKRjiIkG3gC6NiWg3rZ5Va
 Rx66IVorQfzQ0JNGIKMEJG3hGjP+MipDhBUM
X-Google-Smtp-Source: AGHT+IEuDBWymX+JxWIF/uLo9WT0Lp/ZRuWOf2NfkbN1f2elgSAAg2ctJNMqdzX6Qa3aZuc+njgQRA==
X-Received: by 2002:ac2:4e0c:0:b0:540:2a76:584b with SMTP id
 2adb3069b0e04-542845b969bmr9906447e87.36.1737014659463; 
 Thu, 16 Jan 2025 00:04:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be499fcsm2251566e87.8.2025.01.16.00.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:04:18 -0800 (PST)
Date: Thu, 16 Jan 2025 10:04:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/16] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
Message-ID: <vyc6zvymcaaw7nlkrsmxwrpbh5u7znl3pyegex6xndz3ibmm3w@xdm7lxlibkvp>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-11-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-11-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:26:00PM +0800, Jun Nie wrote:
> Split the PIPES_PER_STAGE definition per plane and mixer pair.

Why are you trying to repeat commit subject? I noticed this pattern in
other patches too.

> Currently, 2 pipes are supported for a plane at most. A stage struct
> contains configuration for a mixer pair, so pipes per stage are
> identical to pipes per plane in this case. More pipes will be required
> for the quad-pipe case in the future, and pipes per stage will be
> different from pipes per plane in this case. So pipes per plane is
> split out as PIPES_PER_PLANE.

The stage contains configuration for a mixer pair. Currently the plane
supports just one stage and 2 pipes. Quad-pipe support will require
handling 2 stages and 4 pipes at the same time. In preparation for that
add a separate define, PIPES_PER_PLANE, to denote number of pipes that
can be used by the plane.

With that being used as a commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please use this as an example of what is expected from the commit
messages.

-- 
With best wishes
Dmitry
