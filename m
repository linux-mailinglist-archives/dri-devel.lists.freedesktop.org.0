Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9E91E8DF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 21:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48B510E056;
	Mon,  1 Jul 2024 19:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DB9CCxHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D6E10E4EE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 19:49:41 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52ce01403f6so3839945e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 12:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719863380; x=1720468180; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/klhqOqQpfIffOoQHl0HUCf3/QjQJt9wAB8xWlns1fY=;
 b=DB9CCxHg4JMVah0e+RxSk4fIeBaqbhzC4SvLhZfb8EFktTpijiaO17mnfa45ijUOI/
 mSFiTjhgajp202E2fAADQN/Cb4AYFGGkMqNpHkgG9zx2CB8SbTKbgat4djiBTbuLW8dM
 rDRkNnyafeffo/LK9XZ/j37rUUSiNjbHKGWAE4dmduwGM8fi/B8xjtoUxdLKLhLh98Za
 3lZvtnm9nRs16g5xdXRNtbO0iPTorhCxAzR0rB/e5LsfmAybJjb9mRTK02b/ioKh3By0
 FjP9ghKI627V/+dL6ur4xRax8qZdDlcm3vxN4IDeX1zy6Y+FEk1rtixtNsmE57JyoP1L
 8KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719863380; x=1720468180;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/klhqOqQpfIffOoQHl0HUCf3/QjQJt9wAB8xWlns1fY=;
 b=Zp5H35G7PyDM187JzSFGHYOayrC2QrEKTep1zGrEFQyL38AZ2AwDrg6ZcfXqMlbbSL
 ohu9V64fZZ7uoGCvUf5pLg8Pp2ivwBnQaEXhySXdIAVYyJHOyzmAV0YebhMwUXz+Q8EQ
 UcYLsJIRlFazjDIo5k0fk6gCmTeQl7D52NyKYMFnuv5Gp+NOKJai/MW9WrzzE3kjWjed
 +0XvSWKeJBuWGL2eDpntMtbvtOde4JlKRUpOu9ND/tOGZNh2etuG1wgJpMaoegGRDSRF
 tVbtm5tLW+sNepgH8ZwW35QqiwW9VYkwFZXgvBytRjOSsLSi5aokemcN1ruQQL1gYiPr
 Gvjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO0Yti0xTQGG77YqMCIBjZvnbaRgywWbvwPp7NCHeHqlXLd7xrsRkk4ckgRC6Caz1OQTBG+9gbpL56DEH6ZCUfQJkMzBJbJ6vgNKwcNsEk
X-Gm-Message-State: AOJu0YybhGHtzCz4LAhxI1WrwW3YgX2IXzqLRBw7vHTsmADD0wTujii+
 ZcQ91I6VIkwXXHZRv3dPbdK/lGPVX2D6Nvqv6u0jOa7cVhtB8SSmyXVXUK6Ca96w4RAAfB4LSMv
 lxU1oLQ==
X-Google-Smtp-Source: AGHT+IHJBGPp9DoIDMpnlZhDen1TE3XHx0LDJutjYa34E6KdbzqTWgJM1qLlNf0PNE3DaT98F8B0kA==
X-Received: by 2002:a05:6512:3d91:b0:52c:c1aa:dd52 with SMTP id
 2adb3069b0e04-52e8268aa24mr4398960e87.30.1719863379680; 
 Mon, 01 Jul 2024 12:49:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab3b3c8sm1536851e87.292.2024.07.01.12.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:49:39 -0700 (PDT)
Date: Mon, 1 Jul 2024 22:49:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, konrad.dybcio@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: check ubwc support before adding compressed
 formats
Message-ID: <yyoh3jpsc5cy3h4nu3nhnqdv52ajljjn63dzewyujam7d2scgt@j2mmtajldazc>
References: <20240628233927.4170966-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628233927.4170966-1-quic_abhinavk@quicinc.com>
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

On Fri, Jun 28, 2024 at 04:39:27PM GMT, Abhinav Kumar wrote:
> On QCM2290 chipset DPU does not support UBWC.
> 
> Add a dpu cap to indicate this and do not expose compressed formats
> in this case.
> 
> changes since RFC:
> 	- use ubwc enc and dec version of mdss_data instead of catalog
> 	  to decide if ubwc is supported
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
