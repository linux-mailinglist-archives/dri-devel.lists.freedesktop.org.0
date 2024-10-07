Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E40992D34
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 15:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D7F10E390;
	Mon,  7 Oct 2024 13:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jZURnD0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6C010E390
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 13:27:20 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5369f1c7cb8so4620757e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728307639; x=1728912439; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lNxLoRSbZI0k7IXFvf75H791GvPIK6wndlWEPKIZrUY=;
 b=jZURnD0bbBr5NknRshGId0nCKzUbH+kMm3GSAFbvcpRMDupowJq0KidSab1ZSHLU6g
 q9iYIcDKGv3mMpzeibgkEyzjwGudLmAzggvfkcaGoyznI3sNTzA0ZJYHJrOxIS3JfQuG
 kyY9NDDMIcKdoX3JJe74k1F7yT+wKs4Zc9NHdNS7O0up35Cw/qiRTvX/46gUDeq9t9W4
 pW//QCBA3ZyhKAt6p29sS8swCAYC/YaDJgbcrZpa6YbtSiE6jlKd9U0Tkx9OVEn2QsVI
 R40T1yvVGQ8dGTthL9mlwEeDugsyj9QM4x3It36TUXMK6OtcJJAb3XSXALEDEvD979Qb
 WfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728307639; x=1728912439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lNxLoRSbZI0k7IXFvf75H791GvPIK6wndlWEPKIZrUY=;
 b=SSk38InKpqC3o2Tg2dNwEc5FWTBpt16OVW1f0ouIPxz39lNwlPYwrC3G3ZY/PzN/M6
 hWu7JOmMC3VelUFhmEfsgxQUWysLsuJ9W784fG/JGZAzSWM2S0J6VqjHUXwDnB8Y6Kdd
 n6Yd7IkdMqeko20FjBOwkkX0+j+C6QCxvb+XTdFd64Xw75u7oWgAAzVMK3si0v89iFc1
 uk+Wk0kAZg3AmRN+solC9VqXwYuGUoV6aDAcov7Hcg0rrDekLgl+zH/xC9MJLN1Xt9N7
 fmO6Vkjgs35aHSD/CM756yq9Lje4tzISISMYGaRdDQ23rTW93ZeRTf1vcVzKPO3FcaWm
 Icgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcf+8IC6R5Pc/bquB8Ep8yLDB9XbOm2qp5kijBdsXr8Nl3z3opyQdjR6LoGjxAqewOeXuKUTDkcWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2bMa7iAjss9HvbIqYdDCzJptf8KgZNGaRg4MekWI0e3j6Moa2
 05fL6VdyhNihB5Jif7Za/B+MVylekctdVLtTZ9F0hWJfUbKqNysY1pI+Bwq9MjA=
X-Google-Smtp-Source: AGHT+IGl3vWdg5PH3ZdDeOZUmYnJZIlfXksyhP6LqocHQQkxY1Zwp9M/DFEYLfPwa5CHI2U89NDQ3Q==
X-Received: by 2002:a05:6512:3087:b0:535:6bb6:e7bd with SMTP id
 2adb3069b0e04-539ab88a58bmr5319560e87.28.1728307638864; 
 Mon, 07 Oct 2024 06:27:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d3cdsm846024e87.166.2024.10.07.06.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 06:27:17 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:27:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 0/4] Add invokeV2 to support new features
Message-ID: <ferdfqahe2s5a33l5bbswzx2ufrttmmleobthwqoogalx45iz4@z3fhono6eio4>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
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

On Mon, Oct 07, 2024 at 02:15:14PM GMT, Ekansh Gupta wrote:
> This patch series adds the listed features that have been missing
> in upstream fastRPC driver.

please use sensible subject for the cover letter too. Ideally it should
start with the corresponding subsys name or otherwise point out the
target.

> 
> - Add changes to support new enhanced invocation ioctl request.
> - Add support for CRC check.
> - Add support for DSP and kernel performance counters.
> - Add polling mode support.
> 
> Userspace change: https://github.com/quic/fastrpc/pull/73

Up to now we have been using [1].  There is no way to switch to the
mentioned repo with no changelog information between them.

And anyway, as pointed out earlier, please steer your activities towards
implementation at [2]. Both "fastrpc" implementation are ugly,
AOSP-centric and must be dropped as soon as possible.

[1] https://git.codelinaro.org/linaro/qcomlt/fastrpc.git
[2] https://github.com/linux-msm/hexagonrpc

> 
> Ekansh Gupta (4):
>   misc: fastrpc: Add CRC support using invokeV2 request
>   misc: fastrpc: Capture kernel and DSP performance counters
>   misc: fastrpc: Modify context id calculation for poll mode
>   misc: fastrpc: Add polling mode support for fastRPC driver
> 
>  drivers/misc/fastrpc.c      | 435 ++++++++++++++++++++++++++++++------
>  include/uapi/misc/fastrpc.h |  10 +
>  2 files changed, 376 insertions(+), 69 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
