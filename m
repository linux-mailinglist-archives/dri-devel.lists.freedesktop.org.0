Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1D29256E0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 11:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDF210E775;
	Wed,  3 Jul 2024 09:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CPzUJr/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD64410E775
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 09:34:32 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-64f4fb6ce65so24518737b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719999272; x=1720604072; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KSZSFBoSPSHlgVrFeyK4qe9IWtkmE21sNNnRmfF3nw0=;
 b=CPzUJr/OmxE/UAfs+cP/HXYAc27AJgJ0sNGWRiSfbkycXt2sz+BH+w7lUAHz18aLf8
 mzznrBQn9M27xkSKTJ9CTqjT07ZQ3dmbORKAQeJH2lZNtvivt63K48/e0RK4hdDXaZ+r
 fc3SF81qzGE6XNdfFVXMMH2RBgI0qYj1YbyGowSlTMTry+ffgO6bn6z7DNHVyVSwug3I
 iZjZkGtXcMTD4NEjUFLV3+osfVqtJWqNhlYkFkpRhJjM/Htiwrq48wG89uQKkz270KKF
 kaW7P6rFhwjuSu+vFf0LU3planultFjAwY/aRPXLbZySHsunVgN45dRiaacYf/WK6mTF
 JIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719999272; x=1720604072;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KSZSFBoSPSHlgVrFeyK4qe9IWtkmE21sNNnRmfF3nw0=;
 b=WuG9nv4HNwx1enCZpFzsJrkf+A16uQXWE0Ivvhf9e0bj27+YZtLulD4QZ5pb4/Tz5m
 EECeXKKmEf2rMifT2Tbz2EbJD2hUA/49EtdzfoTAR5mwQKkoJQvYWfC2drfHVbl5VUd8
 QRxXRDIS/tdZqzQQUxxOZggQaeFdd11hdPycO1VZdpDSqDvyl4FTxWiotVCcD0UfBXzd
 rnMgr4JWldfAGpOLAn3r4wmeNW4HUPRNzADlYpe1OPjsCArHWpvVFmd/Awcw1O275pCy
 phV98qPyKAv3pc6gA+wcqYdwMPy+ET8CJM3KpIvZe+94/Ivu31yWg1z2ZsZVbvPK6Qie
 ZbWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnDphT+Z7PHIfsp6OLw15f+tytgTwSmLdJCIynPe5nTLDe76kkHD5vl/MJENc2tEVDLjrdGmKDewdhTYDBtJ9Z4Mp1EoF027qmuQKR5kj+
X-Gm-Message-State: AOJu0YxSOcMfivqg1t/0kd5hmSArCoNKDFclkhOtlPu+SzS/EXuSQVmY
 dNXzaczXiLcQ4TINzRmO+06npG9MXLq+MQz4xYFhGUjJlyjiK+ZBcdCZPxK/wlejD0CMOTJTRmN
 k23Zkgjdk06Cx0WcaULi+fOvcnM9QAKaAGbjg2g==
X-Google-Smtp-Source: AGHT+IGWJrwgezmMBB6Ff49RsWgWP+Dhe5l/1vgBTjC9Giv9ON6cteJavMgb4zcMw8s9IVqCUUpd79nEFAF8DD6ncSA=
X-Received: by 2002:a81:8313:0:b0:650:a1cb:b12d with SMTP id
 00721157ae682-650a1cbc444mr35317037b3.20.1719999271734; Wed, 03 Jul 2024
 02:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
 <f3d502ca-228e-4be4-b296-a9073975d34b@quicinc.com>
 <a5e69a5e-b882-4f36-b023-f85da430fa2f@quicinc.com>
 <2024062849-brunt-humvee-d338@gregkh>
 <2e616e9d-fc04-4826-b784-4c6ee45bfbc2@quicinc.com>
 <foe6khsckzdvd5ccwitzfpdwoigdgu3uostuar3zk5d5stcd4s@hkrdg7vp4mqt>
 <3b07be20-e0c9-4ee2-a37b-34400e63862b@quicinc.com>
 <CAA8EJpoxwNv-wpJvqEf9U+Dg9=BJXG++GWB+2DES92MSqXN-3w@mail.gmail.com>
 <c48e17df-1806-439d-b0c9-2c6b7c208505@quicinc.com>
In-Reply-To: <c48e17df-1806-439d-b0c9-2c6b7c208505@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Jul 2024 12:34:20 +0300
Message-ID: <CAA8EJpqJSo36_ZNT6FH2+BG0ZZPQMdPnANPyU9X-=b6a4Pfs3g@mail.gmail.com>
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

On Wed, 3 Jul 2024 at 09:44, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
> On 7/2/2024 3:10 PM, Dmitry Baryshkov wrote:
> > On Tue, 2 Jul 2024 at 10:07, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
> >>
> >>
> >> On 7/1/2024 10:41 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Jul 01, 2024 at 10:50:38AM GMT, Ekansh Gupta wrote:
> >>>> On 6/28/2024 7:51 PM, Greg KH wrote:
> >>>>> On Fri, Jun 28, 2024 at 04:12:10PM +0530, Ekansh Gupta wrote:
> >>>>>> On 6/28/2024 3:59 PM, Ekansh Gupta wrote:
> >>>>>>> On 6/27/2024 4:43 PM, Dmitry Baryshkov wrote:
> >>>>>>>> On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
> >>>>>>>>> For user PD initialization, initmem is allocated and sent to DSP for
> >>>>>>>>> initial memory requirements like shell loading. This size is passed
> >>>>>>>>> by user space and is checked against a max size. For unsigned PD
> >>>>>>>>> offloading, more than 2MB size could be passed by user which would
> >>>>>>>>> result in PD initialization failure. Remove the user PD initmem size
> >>>>>>>>> check and allow buffer allocation for user passed size. Any additional
> >>>>>>>>> memory sent to DSP during PD init is used as the PD heap.
> >>>>>>>> Would it allow malicious userspace to allocate big enough buffers and
> >>>>>>>> reduce the amount of memory available to the system? To other DSP
> >>>>>>>> programs?
> >>>>>>> The allocation here is happening from SMMU context bank which is uniquely assigned
> >>>>>>> to processes going to DSP. As per my understanding process can allocate maximum
> >>>>>>> 4GB of memory from the context bank and the memory availability will be taken care
> >>>>>>> by kernel memory management. Please correct me if my understanding is incorrect.
> >>>>>> Just wanted to add 1 question here:
> >>>>>> User space can also directly allocate memory. Wouldn't that be a problem if any malicious userspace
> >>>>>> allocated huge memory?
> >>>>> No, because any userspace program that takes up too much memory will be
> >>>>> killed by the kernel.
> >>>>>
> >>>>> You can not have userspace tell the kernel to allocate 100Gb of memory,
> >>>>> as then the kernel is the one that just took it all up, and then
> >>>>> userspace applications will start to be killed off.
> >>>>>
> >>>>> You MUST bounds check your userspace-supplied memory requests.  Remember
> >>>>> the 4 words of kernel development:
> >>>>>
> >>>>>     All input is evil.
> >>>> Thanks for the detailed explanation, Greg. I'll remember this going forward.
> >>>>
> >>>> For this change, I'll increase the max size limit to 5MB which is the requirement for
> >>>> unsigned PD to run on DSP.
> >>> So we are back to the quesiton of why 5MB is considered to be enough,
> >>> see
> >>>
> >>> https://lore.kernel.org/linux-arm-msm/2024061755-snare-french-de38@gregkh/
> >> This is based on the initial memory requirement for unsigned PD. This includes memory for shell loading on DSP
> >> + memory for static heap allocations(heap allocations are dynamic for Signed PD). This requirement tends to
> >> around 5MB. I'll update this  also information in commit text. There will be some additional memory passed to
> >> the PD which will get added to the PD heap.
> > Could you please clarify, are these 2MB and 5MB requirements coming
> > from the DSP side or from the userspace side? In other words, is it
> > coming from the shell / firmware / etc?
> I did some more checking here, I'll summarize the problem and try to propose a
> better solution:
> init.filelen is actually the size of fastrpc shell file which is close to 900kb for both
> signed and unsigned shells. User space passes this memory and size after opening
> and reading the shell file. The bound check is for this filelen which looks correct also
> as this size is not expected to be more than 2MB.
>
> Now for PD initmem, this memory is needed for PD initialization which includes
> loading of shell and other initialization requirements eg. PD heap. As of today, the
> initmem allocation is taken as the max of FASTRPC_FILELEN_MAX(2MB bound check
> macro) and 4 times of filelen(~4MB). So every time, atleast 2MB memory is allocated
> for this initmem for PD initialization.

Why are you using 4x here? Shouldn't the heap size be a const or at
least more or less independent from the object size?
Also the object size probably doesn't include the BSS size of the
file. So most likely the allocated memory size should be sum(p_memsz
for each PH) + heap size.

>
> For unsigned PD, there are some additional read-write segments loaded on DSP which
> takes the size requirement to slightly more than 4MB. Therefore allocating 5MB is
> helping unsigned PD to be spawned.

Which read-write segments?

> I hope this helps in understanding the problem.
>
> Proposed solution:
> I believe the bound check macro should not be used for initmem size. I can add some
> new definition with FASTRPC_INITMEM_MIN.
>
> In the create_process function, the "memlen" will be set to FASTRPC_INITMEM_MIN
> initially and it will get increased to 5MB if "unsigned_module" is requested.
>
> Or I can add different MACRO definitions for both signed(3MB) and unsigned PD(5MB)
> minimum initmem size.

From your description I'd prefer to have:

#define FASTRPC_EXTRA_FOR_READWRITE_WHATEVER 3MB
if (unsigned_pd)
   initmem_size += FASTRPC_EXTRA....;


>
> Please let me know if this is not clear, I'll send a patch for better understanding.
>
> --Ekansh
>
> >> --Ekansh
> >>>> --Ekansh
> >>>>> thanks,
> >>>>>
> >>>>> greg k-h
> >
>


-- 
With best wishes
Dmitry
