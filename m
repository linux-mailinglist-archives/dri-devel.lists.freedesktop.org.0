Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FC91E647
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 19:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754C210E48D;
	Mon,  1 Jul 2024 17:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O6YwvfIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0935610E48D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 17:11:48 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ec50d4e47bso31645041fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719853906; x=1720458706; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Tw5QduFXJcTB28IfyzuqlpIiVDaOglBAYISRE1Qzh+s=;
 b=O6YwvfIWKqslI8Kr2549fDz9lHVoszskJMlLJYkjf8wJoeUVrGOaGDTpZ6u8QVJBOT
 ynCnQarErf8OI/VHgBMnUqDLlhv47zU2o0OHvP7aESETvjOxOOBvtMgUI3mTd/g7uBr2
 n8KTFPkBeFhKq92z1yXxaaRA7zV5TwcxxK5PePl3KS61zx3FpTBZ/OapzDZTHvWN45aA
 FbzhmnKGRgcaX1TcgY/f6X7/w69W+INtDDpzlvUeO3yp9OwIlc4GchsoRmStbqT2Z6CI
 jItntqquZdxszyc9bwnMevbumTHt5Qnq/MYsdLmEh/iaxV+fIhMngz9xnosh4NJemkU5
 WWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719853906; x=1720458706;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tw5QduFXJcTB28IfyzuqlpIiVDaOglBAYISRE1Qzh+s=;
 b=XOiHvDLQEYWXrqqeeOfAdlbZiH8DBa3sikp9I8FUpEpnggKO8yaxloWgCCugWrAdmE
 wi/hdj/ZNWioeUl+h7KaA7ZSASWHqyt0oWC9H7Vj/fsrP+Q4fFMpV5hz/Ucmk1Z7pUNM
 nUzF2APVrEB3zO2Z9NTHMiaw3i30AlUjV4Tc6o/kPpzSqx8zrSa6TPdsf/FHzkC/4DK0
 v8AL4yz2wG+O32fOsd+mSO3ANTvuBVS5j9Mefp0RgShVk+20Do+r5WdSnWlQe5Jf0GfM
 Z+7b1VY3VWHMpfuxwyBU9l2fOQUzuINCGPTkHMqMJrBKeNxFmGMdcGFwHOBjs0OXQi6J
 Abng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJFIhSPymYNOiwKmmSAsdqCUk0lxbdhnAOvZ+9OChROCtrB8p/QlT6mCdxh5wT//QXEcjzJbp7BZRkbfIyT0JrLOPw6N96E1MU84Brno7i
X-Gm-Message-State: AOJu0YzAsQP9TJhSJPFSc4r6VfMyWsyiwn9+UZSZzSpoKIfZVRXmj7oA
 gUdSnWi84/HmAdVBYhoLBk+FfhWkF/zSi6vaTdq8yRB78wBSl4Rqiu2QJ1R6W8E=
X-Google-Smtp-Source: AGHT+IG0FD9r3fZ87/dPAvcHzM7eN0Yneht5xggRUbjqwkATbC+IcDe2hM7Nw/WMF7GO8ZiST5S9Iw==
X-Received: by 2002:a05:6512:6c7:b0:52c:e16e:6033 with SMTP id
 2adb3069b0e04-52e826513edmr4541733e87.2.1719853905921; 
 Mon, 01 Jul 2024 10:11:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab0b9cesm1449102e87.7.2024.07.01.10.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 10:11:45 -0700 (PDT)
Date: Mon, 1 Jul 2024 20:11:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Message-ID: <foe6khsckzdvd5ccwitzfpdwoigdgu3uostuar3zk5d5stcd4s@hkrdg7vp4mqt>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
 <f3d502ca-228e-4be4-b296-a9073975d34b@quicinc.com>
 <a5e69a5e-b882-4f36-b023-f85da430fa2f@quicinc.com>
 <2024062849-brunt-humvee-d338@gregkh>
 <2e616e9d-fc04-4826-b784-4c6ee45bfbc2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e616e9d-fc04-4826-b784-4c6ee45bfbc2@quicinc.com>
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

On Mon, Jul 01, 2024 at 10:50:38AM GMT, Ekansh Gupta wrote:
> 
> 
> On 6/28/2024 7:51 PM, Greg KH wrote:
> > On Fri, Jun 28, 2024 at 04:12:10PM +0530, Ekansh Gupta wrote:
> >>
> >> On 6/28/2024 3:59 PM, Ekansh Gupta wrote:
> >>> On 6/27/2024 4:43 PM, Dmitry Baryshkov wrote:
> >>>> On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
> >>>>> For user PD initialization, initmem is allocated and sent to DSP for
> >>>>> initial memory requirements like shell loading. This size is passed
> >>>>> by user space and is checked against a max size. For unsigned PD
> >>>>> offloading, more than 2MB size could be passed by user which would
> >>>>> result in PD initialization failure. Remove the user PD initmem size
> >>>>> check and allow buffer allocation for user passed size. Any additional
> >>>>> memory sent to DSP during PD init is used as the PD heap.
> >>>> Would it allow malicious userspace to allocate big enough buffers and
> >>>> reduce the amount of memory available to the system? To other DSP
> >>>> programs?
> >>> The allocation here is happening from SMMU context bank which is uniquely assigned
> >>> to processes going to DSP. As per my understanding process can allocate maximum
> >>> 4GB of memory from the context bank and the memory availability will be taken care
> >>> by kernel memory management. Please correct me if my understanding is incorrect.
> >> Just wanted to add 1 question here:
> >> User space can also directly allocate memory. Wouldn't that be a problem if any malicious userspace
> >> allocated huge memory?
> > No, because any userspace program that takes up too much memory will be
> > killed by the kernel.
> >
> > You can not have userspace tell the kernel to allocate 100Gb of memory,
> > as then the kernel is the one that just took it all up, and then
> > userspace applications will start to be killed off.
> >
> > You MUST bounds check your userspace-supplied memory requests.  Remember
> > the 4 words of kernel development:
> >
> > 	All input is evil.
> Thanks for the detailed explanation, Greg. I'll remember this going forward.
> 
> For this change, I'll increase the max size limit to 5MB which is the requirement for
> unsigned PD to run on DSP.

So we are back to the quesiton of why 5MB is considered to be enough,
see

https://lore.kernel.org/linux-arm-msm/2024061755-snare-french-de38@gregkh/

> 
> --Ekansh
> > thanks,
> >
> > greg k-h
> 

-- 
With best wishes
Dmitry
