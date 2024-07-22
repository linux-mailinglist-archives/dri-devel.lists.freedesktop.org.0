Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C59C938B48
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F8310E428;
	Mon, 22 Jul 2024 08:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GC5spV8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B1D10E428
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:34:46 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ef2ed59200so10195251fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721637284; x=1722242084; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2bCcctmphp7eaaFNl/P4rmhmnmFCkyJeC8pSv5glUL0=;
 b=GC5spV8rKKoFZC7p8bYlbXtmANvQvfXTZ/6o9zVdoqtNF7AC8Wf4rtHEfRyU/YHvmz
 SU6yWqq70yczKwyma9mPwC9HDvBYDFXxAMsZJ+emy9xYAV5dakarWs9wy4Yl38dg/qEk
 SlTZqChVLVn5URC2xGJXkHwFD57ixsZkoH/fp8jSb2F7rzPpPuI1zzFOJK+Bz2byc+95
 Wj94TDWwoak91DEq5N6lMeyZagvJ4vnTeIPu354LSyDTAqTgavY9/qpaaoeOBB7kykG7
 wc0IC4MSG16luV/L6Zg6kdcoSjLagQei8Uoyb3CyG73EvNo3Fjc3HtJo81nxfuo1Q7Ff
 AnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721637284; x=1722242084;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2bCcctmphp7eaaFNl/P4rmhmnmFCkyJeC8pSv5glUL0=;
 b=KRkYr5hSwPqKqjEe7U6WGpMEOqPZ1QXJEPutSZRv4HuqESUOCkCTHmtPRzl1VoK3P1
 YQNwd/wdvE13qceTtDeDN0loXiqj+eJohx/3d+4TLCHtq8Va+dM+AftQe+IrY61K5DHo
 WaIbyLPLE5Z3gWWIlTeEA2K8P/6UXvrpRSs0SbZDN0AFr17lqJrULJy1d/71jQd3/Ci1
 5gGryAptTMmRumu1FR7OuU/vZEtn6qf7fV7pD3MW5tDqS3T2LJMnFAPxYQjIOSQV7LWG
 HADUAIsA9SOdx4DKYvmy2x3allNr8HNX9bl1Rmpyhdd9zb8AK6nvPX5aeN1ZFXta+ija
 J8Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEZcbwygEjKyy/9/KWFpkdRS+WPEACp3YvwIrVDOJhb+sAkhwAdTc9tVNa+n1PSNpke7pKKQKqO47MdjhpgZPQ+jwuTOQ/5aBa4aLis1c3
X-Gm-Message-State: AOJu0YywvFF0iNAnhTXrkbF8ShDrRjprGWKb8di48ZQT+pcJ0WMY8+G3
 m2SyjZB6DLCp3Yuo8A7Aq4730/BY7PrCEkebnELRGZ7k2k9QfUOYNzxloplnFBs=
X-Google-Smtp-Source: AGHT+IEsWXCCThUeEb/tyiDFPzOaoGeM+rqNvDAQgD9HMylXNk8ux7RCYmKh0XPBMGSEjZyqBJjW4Q==
X-Received: by 2002:a2e:9e92:0:b0:2ee:7d37:49bd with SMTP id
 38308e7fff4ca-2ef167bf52dmr46624991fa.22.1721637284298; 
 Mon, 22 Jul 2024 01:34:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef0fc3fcf1sm12082561fa.4.2024.07.22.01.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 01:34:43 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:34:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v6 2/2] misc: fastrpc: Increase unsigned PD initmem size
Message-ID: <cr6xv4tsk23sjynnucve4366fwvffgq3rjnbkpxhzdfeiktwtr@ydrp3mduapui>
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
 <20240722080200.3530850-3-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722080200.3530850-3-quic_ekangupt@quicinc.com>
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

On Mon, Jul 22, 2024 at 01:32:00PM GMT, Ekansh Gupta wrote:
> For unsigned PD offloading requirement, additional memory is required
> because of additional static heap initialization. Without this
> additional memory, PD initialization would fail. Increase the initmem
> size by 2MB for unsigned PD initmem buffer allocation. Any additional
> memory sent to DSP during PD init is used as the PD heap.

From the previous commit message I had the feeling that DSP can request
more memory if required. Currently you are stating that PD init would
fail if it doesn't have enough mem.

> 
> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry
