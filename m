Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D29C44D7D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 04:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1189210E299;
	Mon, 10 Nov 2025 03:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vj1HOn2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A235B10E299
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 03:34:34 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8b25dd7ab33so58151785a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Nov 2025 19:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762745673; x=1763350473; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FTjrAybYh+CPfRDZlp384E2TmhDQoxMiFnes+oHnKBY=;
 b=Vj1HOn2RYBdGbnyz53GSLxvHxH3FnTD0RU6Uic0GfGFRYiMJxvVbzdC/X1o0/ShlM9
 suc05myY2/j+J2YN3aN0yuemOcbFhmxOWhukcBP9w4mGZqY9RD7BiSfD3irkcJfWI3YZ
 GZO/8wthnc0I81zHFel25XsgvJWvJsTbYoUrAjFRbm30Aur6RiEcLGWOwYqId6ZEGKbT
 ytRd26YobZc4rsMMspjpGKR7dU7W8Vgwy5+3ATJ1edGVj0XEi5mkNaKRf8d4XgVDAvD4
 vTpLcyXAooFf9ZnoSK9l4O1h6TUcsJkSk1lnP/bWcPf3C7F15sVRiSx3SD6bQSEisGxu
 bJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762745673; x=1763350473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTjrAybYh+CPfRDZlp384E2TmhDQoxMiFnes+oHnKBY=;
 b=wfewlBvB7EqhqUy5uV/z3oHGZZMAP4ORrHJLxfV32eSwOi6X/0/dWHAaRtBB/q9ZXP
 FMTMxlJiSDWzOa4iJIgeBTFf58zki4ZIHCExQF5ct1v4yOHsdwRYoOVLEs/pY48hL30B
 asxTEk4nQspI2CpYqfGpoNnmYqNopVFwXlUrMFFGr1WARuep9xbOqm/9rzaxmKYG6qVB
 SVz2lk3T6nSds3fP2eoYPO/QuHoaWYN3+Ent6n36XE38BclyHVu2bxeWyVOD21XZhANP
 9AkaJD4YmvdDgR+/v+dk9qqzM0cZkxSAH+lQVib049XP3Fn6WTm96WwnHGvjjXUQW9ni
 cRpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnRgw0RivBwMm08g3LvHpx0Y7dUiEHmR2XnEHmgroi8Eeo9zVMf6//cUlqNYNVf4mkQ46r1yRH1RI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw683eaM1dx+85I9I580Lwm5K0utkpmL6Fyd8eVFmUM984zkZBr
 ovcXFdsUVL3gyYoyZ8et4ZmmqRuTu6qQZWegGthseqJp9y9KoriZh7A3jD5JTbpvk2C6N8R3pmB
 P0s+KraRw1TKCBRzXyRyQ5imeXItXXkQ=
X-Gm-Gg: ASbGncsYRBgJkjn2C2HFD6TRURjvEGiGLe43z/L3z9pFdJ9NGq8fO0OOTq5te6Kxx2x
 4c4ekIvBg34ZPcQHXp9Cyg91OvkbR1RBHUvSWjdq8AKgMfnJKa1oXKLIGLGeSAZMQK59vCYB+jH
 O7UuugSUEeI2OySCE+4ZzQNYt2NKH3W8AgUVnBpAlI51ymkM2cN1Rop3fJdo8nNjyDcyrNUif3e
 bICXsbW7li7Bj1duTFn+vmhqke5hLdZHbH/SyQ86/0OeHzI53S7yca7yBCYobwL94AURA==
X-Google-Smtp-Source: AGHT+IGh9xUVZzStimVPXN68ON9CRFwcDfRCkZyJ94tMFYgdld9FCjXRiERvnS8zDYWdDazJenCywCAeTpusj3odIF4=
X-Received: by 2002:a05:620a:4492:b0:8b2:7726:c7c4 with SMTP id
 af79cd13be357-8b27726ca5amr301583185a.63.1762745673376; Sun, 09 Nov 2025
 19:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <aQEVy1qjaDCwL_cc@intel.com>
 <BN9PR12MB52574F4EE2FF679D2230BBEFFCFAA@BN9PR12MB5257.namprd12.prod.outlook.com>
 <aQyftlgZN11YYQXy@intel.com>
In-Reply-To: <aQyftlgZN11YYQXy@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 10 Nov 2025 13:34:22 +1000
X-Gm-Features: AWmQ_bk9n41B0zGqQG_l6ZaRtq9Eyl4lRJWkoss6hRoHoC--Kpk8hiCQo4dtgaI
Message-ID: <CAPM=9tybY_LECdMNH6iw5pzxtd2=Z+4vwLt-_kuMQFUaEXsdpw@mail.gmail.com>
Subject: Re: DRM_RAS for CPER Error logging?!
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Lukas Wunner <lukas@wunner.de>, 
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, 
 "Liu, Xiang(Dean)" <Xiang.Liu@amd.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Hubbard <jhubbard@nvidia.com>
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

On Thu, 6 Nov 2025 at 23:16, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 02:00:38AM +0000, Zhang, Hawking wrote:
> >    [AMD Official Use Only - AMD Internal Distribution Only]
> >    + [1]@Zhou1, Tao and [2]@Liu, Xiang(Dean) for the awareness.
> >
> >    RE - AMD folks, would you consider this to replace the current debugfs you
> >    have?
> >
> >    [Hawking]:
> >
> >    Replacing the debugfs is not the primary concern.
>
> My initial plan was to go with debugfs like you are doing, but
> I keep hearing complains that debugfs is not global and we need
> to take into account some cases where debugfs is not available
> in production images.
>
> > The main concern is
> >    whether drm_ras can effectively support the necessary RAS information for
> >    all device vendors, as this largely depends on the design of the hardware
> >    and firmware.
>
> I fully agree. This is the main reason I'm doing my best to make the drm-ras
> the most generic and expansible as possible.
>
> node registration with different node types, and names.
>
> I imagined something like:
>
> [{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
>
> based on the format that the current non-standard-cper tracefs uses, with
> the FRU + CPER. But we could avoid the FRU and make the FRU as node name.
>
> >
> >    AMD is currently evaluating the proposed interface for error logging.
>
> The design of the details and the implementation is pretty much open for discussion
> at this point.
>
> What I'm really looking forward is:
>
> to know if the path is acceptable overall
> even if different drivers are opting for different node types?
>
> Is there any blocker on using this drm-ras/netlink for the CPER?

sorry for delay on this, I just had to read what CPER was :-)

I'm not offended by the idea of using tracefs here, I definitely think
debugfs is a bad idea coming from the enterprise distro land where we
don't like having it.

I'm ccing a few other people that might have opinions on exposing CPER
compatible logs for RAS purposes from devices, I assume there might be
more than GPUs wanting to do something like this,

Dave.
