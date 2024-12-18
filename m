Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091A29F6461
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 12:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CD310E8F6;
	Wed, 18 Dec 2024 11:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AC5LLg3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336C110E8F6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 11:11:30 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5401be44b58so6403379e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 03:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734520288; x=1735125088; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l1vBtYt51jNW1b+jxORD8K2hfreZX1fSorQB5nRIglI=;
 b=AC5LLg3Pu7orQeGVMsX3SO2G170fEXC4SLqmDGBtgUCKNU2MkW4IYWju+Z8HlHxQ+j
 s2po9P71fwuKihNUaun/qUyLZZRyDfVQhBdmIhWEaPaTuAMLEdNtmEaHYA3fUiSZnPxY
 0aqZ7au4V/xXr100H/8HiiTYN9C68LsI2HjJxhR+bReYCs0VlC/7XGiWUufd8UvWgzdy
 VrbSP9m/h3QVvqNAklTgvy5ntAIRA3LDIfnFNtzymZ6/pX4UX3euaXRtP2Nhhqb93Yzj
 ar7LJbxCpP7MlLDh7g7VO1UC/BeBwiMKaUtstsS4RQv6oq5GcqXpOgr5u2yXkpRjvD8h
 RELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734520288; x=1735125088;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1vBtYt51jNW1b+jxORD8K2hfreZX1fSorQB5nRIglI=;
 b=bUmO7mRGVa4NErDXP7GXJ5lWAsCE57pIWH1U1vyXVI/EALX5PwwSKqkUaTLbBGhN1G
 oTkWbabkzG6Q8jbtOL/IoXqOkGxChzM8t61nCea/VjFNwuD5bnLc4JgS2ddZCKEBNgEe
 B24EMFMxin5tc3oP2g469Nqvu2QVUH2Ki8glplvwFsXvDLQd5J4grxVF57YjGOAIKnby
 lWG+p8X0NphN3YYoH6zu51AuYL0DnSgyIAzdEhBJz4ddiywlAscsivLF0/DlKlmWvYM1
 ux7XcmdddGBDJytvVR5hKZQSgsM+C1+ow9iwHHLAFmVdd/j4xuEJtwgzLY1/DpfiJJPQ
 e1cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9w3lrYFxfOANDRMD1vSpGGPcr4ZSd2FUFbfIFl2DTbb+JzTowHPBc2Js25Fo0EkFGgrlGLDtC9eY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFGRwu6AmWgx/oyjD7vRi2yXUMp3XZc/KhCrNhlTVcRMbqTOM+
 qHF2VhCpKBQ3caFM19fKZDL/Hiz+6U1LQGTlMlwiKgwRqHWLsiqOIZ2Xendlt6g=
X-Gm-Gg: ASbGnctt7jPuZp1nVLifYa40sn78rXQLpAKa4EH96X4zjhWxjvuf/sc/SlPlaZRjL1q
 f+yltyIZ3Rs8AxiI+Y5QfpBuAKW+ikvILjCsEQPVwaYDI28udSHpUyxEguDXSnb4BQ5Fca/iXU7
 HUCtDnlrY444ggiImreFuUqJ3bbWqTY3WjGq0tAFVoivaoX5/CIHhVAUPUyb48VnMM1DSVxwovr
 6Ml4XElomLJyz8eBMjJXYLQNNNJKmDCCwrWFJ/f9Fw9+28Rl3QEZZXE++mlsU4eDf9NqcmiSuIu
 XfOwbUkGURl5EEAtRqB42aFfJBMlOaacOQGj
X-Google-Smtp-Source: AGHT+IFKDFwLbzNb+6y5h6AOCmoJ6d959430sCJ0CNhXDfR1u2zuzoAYdckeGZsJoSPcXNOEy0WBPg==
X-Received: by 2002:a05:6512:114a:b0:540:2fe6:6a3a with SMTP id
 2adb3069b0e04-541ed913250mr979841e87.57.1734520288077; 
 Wed, 18 Dec 2024 03:11:28 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c13ecesm1382042e87.204.2024.12.18.03.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:11:26 -0800 (PST)
Date: Wed, 18 Dec 2024 13:11:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 0/2] Add missing fixes in fastrpc_get_args
Message-ID: <pyq5je56m5cxu73zxcsrboxoy3nhdf4pgulqbl2j4qiifacvyz@frlsjlb3jgoz>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
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

On Wed, Dec 18, 2024 at 03:54:27PM +0530, Ekansh Gupta wrote:
> This patch series adds the listed bug fixes that have been missing
> in upstream fastRPC driver:
> - Page address for registered buffer(with fd) is not calculated
>   properly.
> - Page size calculation for non-registered buffer(copy buffer) is
>   incorrect.

Please describe something non-obvious here. You are basically repeating
the list of patches that comes in the next line.

> 
> Ekansh Gupta (2):
>   misc: fastrpc: Fix registered buffer page address
>   misc: fastrpc: Fix copy buffer page size
> 
>  drivers/misc/fastrpc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
