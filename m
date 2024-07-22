Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CEE938B1A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004D110E028;
	Mon, 22 Jul 2024 08:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rd1Kmc7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A3C10E3FD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:21:08 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2eede876fbfso54484151fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 01:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721636467; x=1722241267; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uO05PChGh3iOVl9QN4C/DTf4iIyJWKDSt2PZpVRmyXs=;
 b=rd1Kmc7WpoJNX0eSyskkOnUWsU6fz0xS3uD/SVrFvnLrwtmywa9zpCjkREPG3LeIUm
 k4OQ5nz8iZGtYtkzFENgpv1nXjOXY1kpHAY0FkWdlwAXIxqSkiCryF1gBoczc2z/P9dX
 Ks+CKhLZBQ8OIcDG3m/6Ya78FUE8QGQ7+Ke1AYOMpho8VSGG7jnLLEO+07Ha0zVdfHFo
 SgbeR7BZvHmbniXN31PeHlpVuLT+5dy53k3bjaTY5oCbsucvpkdBsWXb+DZlXYysXgm1
 ruQXKpU8h7ogzAVvGumb+E7GMiUqTJaWjia4D+tByddEc+D3CdCd+dnfcfMuAsb2nmHq
 2B8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721636467; x=1722241267;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uO05PChGh3iOVl9QN4C/DTf4iIyJWKDSt2PZpVRmyXs=;
 b=puVGDQBxSdgt0X6ZLHpyJ28NEGyPBeU1eug3IZSKNtuPTXKAd52AqMyDUJ9TzXCM+l
 m6UlgdnbyzCy3p/U0nv9mNOQZQCBMPf/7SKxeKsP/laBJGO4pYJl8t+e+gM/Wap/QY1T
 n7IUynapGtnyDve2Kt7h7i5zW+6IJaQEhcJJTdENyebw/u5HFFWt6RBOwSNzRF+4c5g4
 Ad0BWoH7l+Nkpe1MYRU4rwK4YPNvLmkj1SEL9pvmpThjU2RHk8rY89Dd9IwUJ8ntpcLt
 h97H3s3HRxHyqc0ay2JM/75C0MMtxDevknuOSIovyMi07LUvuOPZtUAiiH3Sy1qqe8V5
 aMNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD66/ot0L5loAqnWHrGPRppl3JKZ9m9gxcxEt0ePyCRMQWZSI7mNnpqjjhRWcou+gc5kx2OaMpoNfGZnbQ1qtsuGWp/829U6ePJjg/38cR
X-Gm-Message-State: AOJu0YzK9bvIF+NhF6Iqa/5E8PRI2FGoAJ4Oq/4gbCGdaKXb8STFn2W1
 J6S6VMhxndVZnMcV7B3vqSUjE1NcqAdYvJ3KHQfyqm7uEJ/NkLquQmNUDURwxOQ=
X-Google-Smtp-Source: AGHT+IFOYzs4W3Sj0Mw1a+T5H+CE0aw+VqAYln2wj9EwBWio131yafI6yp7GnSY6HSkLNUL0nx6ZpA==
X-Received: by 2002:a2e:b8c3:0:b0:2ef:2f7d:c502 with SMTP id
 38308e7fff4ca-2ef2f7dc5d9mr18337991fa.49.1721636466583; 
 Mon, 22 Jul 2024 01:21:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f01b6a196csm847621fa.61.2024.07.22.01.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 01:21:06 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:21:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v5 1/2] misc: fastrpc: Define a new initmem size for user
 PD
Message-ID: <jbahzoz76s6nei2wlb5zuu3qeigji32hwghy2fm5sftsgcr7fn@hltr7aal5k6s>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-2-quic_ekangupt@quicinc.com>
 <2024072234-slug-payer-2dec@gregkh>
 <607362f2-8ae5-46bd-a3a4-2d78da98b12a@quicinc.com>
 <2024072227-purposely-swinger-86ad@gregkh>
 <0d29ff01-9d8c-48b9-b845-3370222c4ff4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d29ff01-9d8c-48b9-b845-3370222c4ff4@quicinc.com>
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

On Mon, Jul 22, 2024 at 01:23:56PM GMT, Ekansh Gupta wrote:
> 
> 
> On 7/22/2024 1:09 PM, Greg KH wrote:
> > On Mon, Jul 22, 2024 at 11:42:52AM +0530, Ekansh Gupta wrote:
> >>
> >> On 7/22/2024 11:28 AM, Greg KH wrote:
> >>> On Mon, Jul 22, 2024 at 11:24:36AM +0530, Ekansh Gupta wrote:
> >>>> For user PD initialization, initmem is allocated and sent to DSP for
> >>>> initial memory requirements like shell loading. The size of this memory
> >>>> is decided based on the shell size that is passed by the user space.
> >>>> With the current implementation, a minimum of 2MB is always allocated
> >>>> for initmem even if the size passed by user is less than that. For this
> >>>> a MACRO is being used which is intended for shell size bound check.
> >>>> This minimum size of 2MB is not recommended as the PD will have very
> >>>> less memory for heap and will have to request HLOS again for memory.
> >>>> Define a new macro for initmem minimum length of 3MB.
> >>>>
> >>>> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
> >>>> Cc: stable <stable@kernel.org>
> >>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc.c | 3 ++-
> >>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >>>> index a7a2bcedb37e..a3a5b745936e 100644
> >>>> --- a/drivers/misc/fastrpc.c
> >>>> +++ b/drivers/misc/fastrpc.c
> >>>> @@ -39,6 +39,7 @@
> >>>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> >>>>  #define FASTRPC_CTXID_MASK (0xFF0)
> >>>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> >>>> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
> >>> Meta-comment, for a future change, why not tabs to line things up?
> >> Sure, I'll add a comment.
> > I didn't say anything about comments :(
> Oops, sorry.
> >
> >> Should I line up all the MACRO definitions? If yes, should I send it as a separate patch?
> > As I said, yes, for a future change.
> Noted, thanks.
> >>> How was this tested?
> >> This is tested with fastrpc use cases available in hexagon SDK:
> >> https://developer.qualcomm.com/software/hexagon-dsp-sdk/sample-apps
> > Do you have regression tests that attempt to check the boundry
> > conditions and alignment here?
> For most of the test cases, I used the fastrpc lib:
> https://github.com/quic/fastrpc
> 
> This library is taking care of passing proper shell size which is within the boundary for
> all the platform that I've tried.
> I'll try creating and running some regression tests for this change.

Existing userspace implementation provides an example of good behaviour.
Please consider implenting and publishing 'bad' behaviour testcases
which make sure that the driver doesn't break if it gets passed 'bad'
data.

-- 
With best wishes
Dmitry
