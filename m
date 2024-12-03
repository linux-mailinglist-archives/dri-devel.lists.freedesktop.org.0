Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB73E9E1D46
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 14:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE8A10E36F;
	Tue,  3 Dec 2024 13:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zwoaf0r0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E2D10E36F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:15:08 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ffa3e8e917so62015981fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 05:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733231707; x=1733836507; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DeNA/Lpr5Y08mM6YBqUTV889AOBT4B5h0p2YGNFMqw8=;
 b=zwoaf0r03jChedvZVB2h6zBWnnuVOwdTgCeGijDlYvhSqvjym0dAs64XPPuC9qgOU+
 6fhX3OFDbrviFFRMDzS2xT7hLh9cl3eghdWtTF3eN4MYlIUr+yrN7zVb/EvWSmkqpMQE
 VioOYt814BfhYFqDpDz6IACuBb5lV1aHBglYwBI/2Iv4SIIrJviyzxWbhrs3ahMxPAxo
 cwYeC7MsjgVSwuXrbSE13kpV6CqaD4XrBP/sESkLWcsBpii1B/5oJ6A4hciBpCXAsnjz
 /B3ewYgMZe5Ph0h3f1UqansokHfk8MmTfhlSAdOQss15cc+4VD21S96qdeyIjY3doJzh
 ggPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733231707; x=1733836507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DeNA/Lpr5Y08mM6YBqUTV889AOBT4B5h0p2YGNFMqw8=;
 b=GmCRCNB9DLdlmxMrGL/L5ftKWH4BhcQotaqU1t1P8wWi2qfvJicdq/i+di3AxKMSRh
 gSH1fDWKAK0fw88mZjsXiVdBLN5RMSGYadIbHMZxKLCwP49ajQdytBQwT4oXgwmMF+Z4
 5ydCJ1mwAgoAcWhPol3KTeef7mll/1G3n88NTKWCQ98AoLKyuZwIsd8I4UULwx8GOHif
 +T6lO6lPbN5vAso1RvWHtzD8h7k+G8gPvHJSI4M2vWqdcdFx2USa6tt6+KK6I4FSLqLj
 0u18XA5yccfy4t8JniXmPZVFtWz+/Idfa030PtvCJZR6Avo46PO7xafFuF0Jd7xixMW3
 XuSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6TsacS7MMugDuqdDhaMfclFeBg7+prDrnZhzNQsJFPd6biGptt+c10LBCbeY1GFydn1KsPtQG1Ms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAIMqsl/53gue5p8jArqydr1TZ3Pc6l4RClCW5ipyNYkvdDia7
 251+RHRBqqolpxmhhA89e8cPhCDB2OIWKt4ReOMAt5DawPJ+pCXcyon9X8DyePx30iGu1YPulLi
 4
X-Gm-Gg: ASbGncsyJEoCAbDCUYkFMsI53pFsgaMdHxIF2OC5VvKrPyf83ixodhhbGxXhieCPglJ
 zNVcbbM+KQEfybehKRfJZ2uLHdcv1PIrYWyAZH/lImgc2BoIS85hnZn7+GJeGY9ZOPVHiFeBt7S
 UnR8zVstjlwrldEsay+B1Wh/WO5uZWaGB7FqFMNpwzdk+lSTNy4Bsk69LRaWNd46IIg/dtWaPM0
 TzjGabSMJYLEU3muZvGRq3qw/CMajTz+ZQM9+rK0fLucYV3zM0MRKxbW8Vg0R9R99Jmg97R1cbc
 Xp25vYbe1BkCL3viK9KDV6OFRpyeug==
X-Google-Smtp-Source: AGHT+IFM4VOdavQf7x5htmcA35f00mFlqCG9/SJ4fIIkch6bLXMhzCxhmHzzSYybmwSFt0nJpKD1UQ==
X-Received: by 2002:a2e:a815:0:b0:2fb:382e:4120 with SMTP id
 38308e7fff4ca-30009cb82cemr11050501fa.38.1733231706751; 
 Tue, 03 Dec 2024 05:15:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfcc9fdesm16115781fa.119.2024.12.03.05.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:15:05 -0800 (PST)
Date: Tue, 3 Dec 2024 15:15:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v6 1/2] misc: fastrpc: Add support for multiple PD from
 one process
Message-ID: <c6wcllahx5edgn3jkaqvbtp6agye5jwvzftldt775xi55sjmub@5msaghvdkflq>
References: <20241203053048.1690069-1-quic_ekangupt@quicinc.com>
 <20241203053048.1690069-2-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203053048.1690069-2-quic_ekangupt@quicinc.com>
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

On Tue, Dec 03, 2024 at 11:00:47AM +0530, Ekansh Gupta wrote:
> Memory intensive applications(which requires more tha 4GB) that wants
> to offload tasks to DSP might have to split the tasks to multiple
> user PD to make the resources available.
> 
> For every call to DSP, fastrpc driver passes the process tgid which
> works as an identifier for the DSP to enqueue the tasks to specific PD.
> With current design, if any process opens device node more than once
> and makes PD init request, same tgid will be passed to DSP which will
> be considered a bad request and this will result in failure as the same
> identifier cannot be used for multiple DSP PD.
> 
> Assign and pass a client ID to DSP which would be assigned during device
> open and will be dependent on the index of session allocated for the PD.
> This will allow the same process to open the device more than once and
> spawn multiple dynamic PD for ease of processing.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
