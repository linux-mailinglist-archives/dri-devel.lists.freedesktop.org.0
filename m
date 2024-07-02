Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063CD923A4F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 11:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA6F10E1BB;
	Tue,  2 Jul 2024 09:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XyK/6XjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CBE10E1BB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 09:40:35 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-630640c1e14so38489447b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 02:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719913235; x=1720518035; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gq/Bbroqxvnpkgip5EYHo2n8xKxIxzuqj82AqyB4e9g=;
 b=XyK/6XjX7zyjE5ljU0ob6kAegUiLh8On0kDq7ybQTOOpbnRiTbE3hbqi2HRJBau13A
 Kxt+DkGKzWQJFYuazx0txgnXL66LlZ88BYMdfrOK3siqPbIrTHICkv3x2ikpzXOoNAz2
 ja0iZVBmdpcFiNxC2V2aJGLW7Sb/fBc8k1cq88bvl7My4Fjyhnv6wl0RLAKXlGzSaah7
 4SgOUNobXQAlwADmGDrxpEnOLLENHHgNxYWza3hS/xtB5jUUezrLosSndmCs1POGD75t
 Ofza3Vie05XnbX/vGn1ku4HYB1cesbtcwk/RtRa1c9tjO+iNw/QV2Xl9D56cGcCSRuo+
 XHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719913235; x=1720518035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gq/Bbroqxvnpkgip5EYHo2n8xKxIxzuqj82AqyB4e9g=;
 b=R8O9FMZDMcbUK38ACCm+MQTlvN0B1YKV3J4YZfHezOtuyVPZ2/pW2dHm6WEThUF1zY
 X06TX+6si1nZkl6CsZ8Z2nJfFDqQQ2+E9G1x8ezAO2ilMhso38TOuQ0r2zLRCI5RxH/I
 NmKRIz1NfaRZu6AD961RGfPSb1UVWyGRMXeE4Vhdkz+Qf3GOokWsvdvQBi5URzm/3WMm
 kOsEo91m8wpBDZVauRRBELn/Q0bvVytM0kVg3BhNOnzcyJ1b6IJ1WWhWr6q1/uVLTwah
 8Qz1xhjPJkDF4b3UmNCqSfzUbheEKKn/FLtjiRPSGS2QGtkkvxVvJi7ABC97rPdQy9O3
 cwTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQapZcGV7AYfOXth/yQ9hWScPU2S1PyoS3CUZsYFcyKwN+xlMpzTN/pcVpGh4+3Y/AmuDcrZH9E7v1S9xcxdPTzvkWrZ+sSgQYe/ctJymS
X-Gm-Message-State: AOJu0Yw3npJI9brvdHxKDH1n6+faBGsih9t2bOfWI50U3jVPVq8cIJFo
 cCbRfGyBt8rL9uukx1YSeJjiGvlPAkhoTz2pw16RqXmVVUq/+h/KvJL7rYASlM11ISLR/OneDhj
 dmIw8fbWcRwqEsb1kGggbYC8a0TsL8fmu3CXnqQ==
X-Google-Smtp-Source: AGHT+IHVPH+x2D9veQuZ61oIQPsTP9AxyUNRYacWvYz9JNRPToJi6VkCzlbwDQrN1Pa4LZ0UIwceeMzNftvj14uy+cs=
X-Received: by 2002:a81:a9c4:0:b0:63b:f6c1:6068 with SMTP id
 00721157ae682-64c7277c692mr81276737b3.32.1719913234764; Tue, 02 Jul 2024
 02:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
 <f3d502ca-228e-4be4-b296-a9073975d34b@quicinc.com>
 <a5e69a5e-b882-4f36-b023-f85da430fa2f@quicinc.com>
 <2024062849-brunt-humvee-d338@gregkh>
 <2e616e9d-fc04-4826-b784-4c6ee45bfbc2@quicinc.com>
 <foe6khsckzdvd5ccwitzfpdwoigdgu3uostuar3zk5d5stcd4s@hkrdg7vp4mqt>
 <3b07be20-e0c9-4ee2-a37b-34400e63862b@quicinc.com>
In-Reply-To: <3b07be20-e0c9-4ee2-a37b-34400e63862b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Jul 2024 12:40:23 +0300
Message-ID: <CAA8EJpoxwNv-wpJvqEf9U+Dg9=BJXG++GWB+2DES92MSqXN-3w@mail.gmail.com>
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 2 Jul 2024 at 10:07, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
> On 7/1/2024 10:41 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 01, 2024 at 10:50:38AM GMT, Ekansh Gupta wrote:
> >>
> >> On 6/28/2024 7:51 PM, Greg KH wrote:
> >>> On Fri, Jun 28, 2024 at 04:12:10PM +0530, Ekansh Gupta wrote:
> >>>> On 6/28/2024 3:59 PM, Ekansh Gupta wrote:
> >>>>> On 6/27/2024 4:43 PM, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
> >>>>>>> For user PD initialization, initmem is allocated and sent to DSP for
> >>>>>>> initial memory requirements like shell loading. This size is passed
> >>>>>>> by user space and is checked against a max size. For unsigned PD
> >>>>>>> offloading, more than 2MB size could be passed by user which would
> >>>>>>> result in PD initialization failure. Remove the user PD initmem size
> >>>>>>> check and allow buffer allocation for user passed size. Any additional
> >>>>>>> memory sent to DSP during PD init is used as the PD heap.
> >>>>>> Would it allow malicious userspace to allocate big enough buffers and
> >>>>>> reduce the amount of memory available to the system? To other DSP
> >>>>>> programs?
> >>>>> The allocation here is happening from SMMU context bank which is uniquely assigned
> >>>>> to processes going to DSP. As per my understanding process can allocate maximum
> >>>>> 4GB of memory from the context bank and the memory availability will be taken care
> >>>>> by kernel memory management. Please correct me if my understanding is incorrect.
> >>>> Just wanted to add 1 question here:
> >>>> User space can also directly allocate memory. Wouldn't that be a problem if any malicious userspace
> >>>> allocated huge memory?
> >>> No, because any userspace program that takes up too much memory will be
> >>> killed by the kernel.
> >>>
> >>> You can not have userspace tell the kernel to allocate 100Gb of memory,
> >>> as then the kernel is the one that just took it all up, and then
> >>> userspace applications will start to be killed off.
> >>>
> >>> You MUST bounds check your userspace-supplied memory requests.  Remember
> >>> the 4 words of kernel development:
> >>>
> >>>     All input is evil.
> >> Thanks for the detailed explanation, Greg. I'll remember this going forward.
> >>
> >> For this change, I'll increase the max size limit to 5MB which is the requirement for
> >> unsigned PD to run on DSP.
> > So we are back to the quesiton of why 5MB is considered to be enough,
> > see
> >
> > https://lore.kernel.org/linux-arm-msm/2024061755-snare-french-de38@gregkh/
> This is based on the initial memory requirement for unsigned PD. This includes memory for shell loading on DSP
> + memory for static heap allocations(heap allocations are dynamic for Signed PD). This requirement tends to
> around 5MB. I'll update this  also information in commit text. There will be some additional memory passed to
> the PD which will get added to the PD heap.

Could you please clarify, are these 2MB and 5MB requirements coming
from the DSP side or from the userspace side? In other words, is it
coming from the shell / firmware / etc?

>
> --Ekansh
> >
> >> --Ekansh
> >>> thanks,
> >>>
> >>> greg k-h
>


-- 
With best wishes
Dmitry
