Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5059DFD45
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 10:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FB110E681;
	Mon,  2 Dec 2024 09:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V8UUQJuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1491B10E681
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 09:35:32 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ffa974b2b0so38744181fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 01:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733132130; x=1733736930; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dt2TVt20eO+6fZpSm814SQa3ex5u0vscKnXHANIdRWE=;
 b=V8UUQJuq77Dl/oXJaF0lsQzPpp5SqbcVT/14IBeQfHfPsXG3e3lCXM6dGvE+cqB2Kn
 odx6JfvhJEPMuO8l3FqJxftd82j+3zmeES/YHk4vEbGZg57H30lFk9KT4UK3q3VZIWMr
 VFCBc4En1Be4r+dGeEGrOTUFMt8urql8A1Cv2ybDPKnA2YUCekaDAd123uakQc6qF4pE
 Rbal7pGkN5YHFvhc5p+woKtoc9LDzdrfvV7Y02623RDTZJq5FtgtFH6xsgpPz4OYjGYX
 I3Vaz7zlHMI4vzvwZyd0xwDsuMSOfbN2SurQ3i5PMv0SMcAyxm0wcXHVWkg0i/8AzggB
 Hq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733132130; x=1733736930;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dt2TVt20eO+6fZpSm814SQa3ex5u0vscKnXHANIdRWE=;
 b=TuJUwMQ4hLDQtS1H9DNuJHeaP2p/b4GPxl1pt3hfsjV5qd9/tLLK4k6k0s5gWpn0WO
 xVnesrWJR/U5H7jo95+0rpalB6et3FMrp4K1KyB9LyncvZfzBhWYq9Jb6gZm6h2+y0NG
 tFvombR5lT/Ar3HqlE7jOGib9LyNAyjHiFLCGef4lrxMJhuutCsecCBXQTiCwB8Rm9Er
 n41to2hMe/3CzuLayCnBgWaRx9UQsoP4u9/mEUcbXemCKbvQa0gs4AhQ+kiVWxqZQEtA
 T8TUoP5X9C1D6cfJs9T+AVbzIP7gA6Y8BKUQqIVawF+dYBLNdOGmMppFTQIV7Cf8PZ2R
 nzeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8VP31ZGkMci503NRV4F6CW3V1Yc+xwgBInvM18vS/WxSQ5uyl4Yl+2B1O6f/mNTWe2aKpuSrOMPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1BNSFyubCeLvsGTyEpHrmaAWBY7VoYxI7YVr2jY1849dt3qC5
 /K4UlqFt7koaGikkE/UHqoTlpqyLlHdtD0HPj/OkNUSfv5I7GbMsJmEti1I7apo=
X-Gm-Gg: ASbGnctQpyzSaoYdg20xF5reLHNJLsTc52DgCNgSgq2odJ9sV7xmfHx7dlJSXGlKIZa
 8k3ifRRgD8BZDPcwf5ic9vVq0QHJPcFFromjRhpbTb8VHqVDNE7W/E96oZT1H8sq8OqEk/BWG5/
 LgUfg8OUzIn2+QiUtVdeicQ0bXnfjNiO6Pz6QczaXSou+k8I1R85oP7ZhZZjg2J6frKq/DEjIgx
 hETqc5rgjLE57YJq7Imthe11eqZiUMTIeRBz1mjHzk7r4zPPVSd6XPAdwAEuVRLmnD2sWMNtrkB
 wLxyaW9IedNPHANcg+U5Odcg1u6cVQ==
X-Google-Smtp-Source: AGHT+IHNU47uQDa5zlYUyUe13GGmMqDc5+hiwAOH746/APHiIUBloLMtC0ny5VGjuUcBVKRBt4XeOw==
X-Received: by 2002:a2e:a987:0:b0:2ff:c8a1:c4d1 with SMTP id
 38308e7fff4ca-2ffd60ac1c8mr100084341fa.22.1733132130015; 
 Mon, 02 Dec 2024 01:35:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfca1302sm12472391fa.103.2024.12.02.01.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 01:35:28 -0800 (PST)
Date: Mon, 2 Dec 2024 11:35:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v5 1/2] misc: fastrpc: Add support for multiple PD from
 one process
Message-ID: <pqes6ixjbcvvicnfairzmy4gqokffy5aixqnadu2exi2d5rxar@ywify4ambmtr>
References: <20241202064806.1164800-1-quic_ekangupt@quicinc.com>
 <20241202064806.1164800-2-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202064806.1164800-2-quic_ekangupt@quicinc.com>
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

On Mon, Dec 02, 2024 at 12:18:05PM +0530, Ekansh Gupta wrote:
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
>  drivers/misc/fastrpc.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> @@ -1480,6 +1481,7 @@ static struct fastrpc_session_ctx *fastrpc_session_alloc(
>  		if (!cctx->session[i].used && cctx->session[i].valid) {
>  			cctx->session[i].used = true;
>  			session = &cctx->session[i];
> +			fl->client_id = i + 1;

/* any non-zero ID will work, session_idx + 1 is the simplest one */

With the comment in place, LGTM


>  			break;
>  		}
>  	}

-- 
With best wishes
Dmitry
