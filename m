Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE539D5557
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B098E10E2FE;
	Thu, 21 Nov 2024 22:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="epXUzwRJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F4689D39
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 22:22:31 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2fc96f9c41fso16059931fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 14:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732227749; x=1732832549; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ej8S3vTqvmhNIveEQbgfSoDst8pJaJNYhopo+ceKPlc=;
 b=epXUzwRJ7DBodAzpMEFCF59thei5W3TiA3aFsHxzm17FS8crSMMzuLC95KlSSGcH7E
 +gpJBoRwcD6oRHerIh/zXTjI34qAA+AXdEjboFdJG8Qcv40jtOh+W/BxOuT6bPi9Ib18
 /5wzik6HARm4GQzuYUpEQ27D1MkAe3LVaX48bJIJAHiWNbXIDJhHJ7mbzMogV/b/nFby
 S1+rUZPB7v4/YzreiVJxR4HVgiT/Dr96AGt2O2zw2NaBKK7mRyHZDmbBMKiLl7j5tEsb
 pKxDSRxu+nQ/CZRt8P09VW7Y9IEEiUsWawn28or3qh29WbrftyApo/axXPPosxQ4wZQz
 6MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732227749; x=1732832549;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ej8S3vTqvmhNIveEQbgfSoDst8pJaJNYhopo+ceKPlc=;
 b=vOBGxV2YMFvsVjRiYiBf54Q3hzSgfQ+P8nQGUhVvMziilIenntVUGb37SXiTdPd0GD
 YiUDGGmHWp+K3StYwa5aMK+tP/0kQ17+fk173vMFzVXD/4Q+UsmuxYBX8tinhGO2vFo6
 gAaCzqjJXPfyBgRdcUHGK4ZZOAx74L85gqSFo7yejQOHbzjADul6LdtBFyOqSU86XNLM
 I0LCCAZXcjRG7EBXhbVlKjsNy52dHHLIeJOo+Mz2JtBLGQ2ZGm2GOsAeMwExCeDVzRX6
 DcnP8463rN0p013Qw9k+njGK50iwGEdQdRXpoEdgge9U3Wvfwq05EBTgBzoBk6PXr5sc
 dClw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsZQltwEPKTsh0yD6Gqkl8WgTXz1OuTVDlmdNDpdqQdBwRKMhPVyo/+HWandmd1wb50zY9W3PzoBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1+l0jE5kb01Z4bhaC1MHhbil1n6jxUctLu3mapid/XsxpprWi
 PGehpqMEyifp81jlTkai9DtMTPrJjWFd5GS9efilJCIiUVtwJYCgYm0hP9ymF7A=
X-Gm-Gg: ASbGncuHLS/C3vaC24ygwgMtPAM3E4uregxxNxSuaFKXBpE7sluMYwweGxkfbvg++Kg
 IkQn0fSw/gxvfPkiemNWk+kyaWWy1CIipvfe5F2EtSNN2jttMExP/UDn2OMORuz8lQtDppKezlb
 RJnVsJMOOBiK2zpo55FZHDrj1107Q2p/1s3gabp0QrfFtEej7TKS3qYXNQEifaeu/lqG3q2Tfrb
 AeGiVL+fEYkFLryVEeRk8Qi4amTfOuQOMe7uiNozI9vMkTZuYQttVEe1qzquadDqsR2SOLVI0m8
 bT3iC0h22jMpTYsb4aLmux/RIFVt5Q==
X-Google-Smtp-Source: AGHT+IE4DmJhxMe9nKX/xPXS6QUj2KIG9OcMLvY6lKA9hzUZEqv+8puapbezE/MYq4KUI/+HEGfV8A==
X-Received: by 2002:a2e:9a11:0:b0:2ff:6204:951f with SMTP id
 38308e7fff4ca-2ff9697ce7fmr14354211fa.8.1732227749517; 
 Thu, 21 Nov 2024 14:22:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa4d3f7f2sm645911fa.44.2024.11.21.14.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 14:22:28 -0800 (PST)
Date: Fri, 22 Nov 2024 00:22:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v4 2/2] misc: fastrpc: Rename tgid and pid to client_id
Message-ID: <i5aii3fcha3yasqhuiww4rzkfvr4th47lkog4lm5xhnhh3ygac@euhofylhilih>
References: <20241121084713.2599904-1-quic_ekangupt@quicinc.com>
 <20241121084713.2599904-3-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121084713.2599904-3-quic_ekangupt@quicinc.com>
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

On Thu, Nov 21, 2024 at 02:17:13PM +0530, Ekansh Gupta wrote:
> The information passed as request tgid and pid is actually the
> client id of the process. This client id is used as an
> identifier by DSP to identify the DSP PD corresponding to the
> process. Currently process tgid is getting passed as the
> identifier which is getting replaced by a custom client id.
> Rename the data which uses this client id.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 48 +++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
