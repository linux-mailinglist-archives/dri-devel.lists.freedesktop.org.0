Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD2A1D9AA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 16:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2003110E56C;
	Mon, 27 Jan 2025 15:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LsE2JBOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142E10E310
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 15:37:29 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401c52000fso4300077e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 07:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737992248; x=1738597048; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kp6joWOCfUnMEoMEFY//lu58zajvf9vP13Wi5lvaF+s=;
 b=LsE2JBOfp597s2dB7C3wYdtsM+5L3mru2P1u2Ubigq+9z/uY8UKobnh6uJMVlK23DB
 74A5Gz06DREfC3WA11UmD6uCjjC93cu6I4Yph1YvWAp0wMewijVzfXvjyqrECdHitYKP
 OD6fmOSw2zBsFbQ4Y5Z0yN1I/FJ7CKQ/JPbosgdut1f7NvMmiWcGgKA0r8FkQ8aBl4Gw
 jL0ZEo7t7hagoSUxJZ3laVhn94VgYH/IKzurLSWVCU/bdjEZB2COU9GXYG7ak84VpABe
 dyz73Q1tPN51M2P5kBrbrxMYndeS3qDGyBebPj2wmM/j/ASS8QoMyk3J5g7huf6wIDPD
 Ru8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737992248; x=1738597048;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kp6joWOCfUnMEoMEFY//lu58zajvf9vP13Wi5lvaF+s=;
 b=m+qbAH7FdE47pS4FFlRRKxGsWIJ98jnAFjUtxabqOzaIoQIzgjCikUMTXOUmFdzGlV
 dW12YP0hGKK8280Zg6cZJJSA3iyiT8rprRBiUDy97kwwp8VbHj4YGbVtl/HtYHvCWl4u
 baG3+DVSLatJ6nAqSNOX4AHxPm7Rv1sLWjenIvmZs1ojHNdBg4glQuObaHokb6DWgBiS
 VYhoXmssj3m6fEsP+CmL6dZwcjxXzdvtY2Ok9lmmtjc5yN2KQvcFMzIAU0KovDBacJMC
 Aib+8fNPKg4fJuCxsSt8gw2LyS5Tv3KOnLtixw/Yo70kOAtezV9yDbDFN5BI+FghI8Cv
 xsOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtCgt7mhkVOqB/ahTfDPtTzRxZWVVOO3Po5/lgRcDNSYJxyJgxq5hyaZ6cvYzv+n4Ku0uVac4KRtQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSqlznJdrHjqC6IVxIM+Q8mvchWZjkUD/TRskGMCICW2sgV7gY
 49k7vpYnrwMLZxqnbcDK+aP+vMxKEn51GcOLpgTMz/jj04stzX/SGtwcQhrlgaM=
X-Gm-Gg: ASbGncs1V4iSPDjvG2msBNQTZyslyMTe1oFg/TLYOrAwq+YG9eD+3u6I5TUpleOPCb8
 nYzazmMGKpMY5250oUQqgdMdj5fLepp9PULdqAy7rdItVcsOOFlD2b8DImZ7i8wGhLY1oiYagjc
 kGksQNlJptgqN7YkwG7CXP+NzGu5cMRsOjXOSzUv5Si95c0adtViQWaLtdAZk6vbwKJLnYNC0t1
 zoVV4H85BP3dezw9oT+em+4l9P0C6xH1gLGhusWmyJ2Qt8zgretd3Tm601N6iJozW9qKk9qjX+r
 6hMoxVwhAf7SuRLcehojWfMbaJJ+0Z+VsmcVTx7l0rlMrhQidW1KH5SFSjJ7
X-Google-Smtp-Source: AGHT+IEHADuBWqmOkiOtEdrv8Nl9Nndbtt2dRQZUpE5vreZ7UXfdVOF8Uf+s3QdgMJEeVPJe5D/OBw==
X-Received: by 2002:a05:6512:230f:b0:542:232a:7b2c with SMTP id
 2adb3069b0e04-5439c253ed8mr11907073e87.29.1737992248212; 
 Mon, 27 Jan 2025 07:37:28 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8379a54sm1354270e87.192.2025.01.27.07.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 07:37:27 -0800 (PST)
Date: Mon, 27 Jan 2025 17:37:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 1/5] misc: fastrpc: Move fdlist to invoke context
 structure
Message-ID: <inwvzw3cjhpyyshs4brs276uv5nucqe3xpnu2jkdgaqzr4zbhx@vpz6ofuyktag>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-2-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127044239.578540-2-quic_ekangupt@quicinc.com>
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

On Mon, Jan 27, 2025 at 10:12:35AM +0530, Ekansh Gupta wrote:
> FD list is part of meta buffer which is calulated during put args.
> Move fdlist to invoke context structure for better maintenance and
> to avoid code duplicacy for calculation of critcal meta buffer
> contents that are used by fastrpc driver.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
