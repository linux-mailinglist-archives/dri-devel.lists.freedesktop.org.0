Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCCEBC33E2
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 05:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4525810E746;
	Wed,  8 Oct 2025 03:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z8OXyjQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB7410E00E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 03:43:37 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-791fd6bffbaso82743866d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 20:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759895017; x=1760499817; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9o84n8OuJ9ct8Z++gbUbyjg+xgPtF6XVkphwAgPiDrY=;
 b=Z8OXyjQnnIXACkFp1vItADYNdu7hLV+afaDOSf2HRDdc+GG+5ii+RZ+JwjB/JqDBpm
 i8t81oJqzfQ3AtRT4KkOEmhS9cybyX89BtcT4S4MMW1P+c0WxJ5XrYafASZKMGunybLE
 Z+7/vVqcbKLh/aco4a678XgckCbekrpEs0DqmxknU42QIsHBdDOOb6Iym6Ow19Xd6bgG
 LWU3T2cmQHbdshMxVZ7CXpv0rloyxSShmzBtsu1Tu9c3XEd7Gyc9CWgeMaw6rCS/tvlu
 Tv0cn+c0hGXun16fB2SARVyZHA2kOibPQWPqAk8gtkL+SIutoMIQs0S8oU9RE+ZCmdIM
 40Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759895017; x=1760499817;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9o84n8OuJ9ct8Z++gbUbyjg+xgPtF6XVkphwAgPiDrY=;
 b=NPo/3aiNYFDfoUndiA/2XOC3okRSD5MwRcidOLY5Nb7MAwdT7h0D8hus5LAPB6u+3I
 LK+0yX7cHZoQYqsKuk1T5UHMo3hpGnd1jmu1kEKhZv9Yi0ZHXJIpVBqdCwjB46D+4DOi
 pM967LBNmccCd/s5qGH3n/JEiT5qPkfafKm68fsm8/ujGIlEZw49W/QQLERlZdro03Ho
 E70C5jjpvdfsQsUOB6q4gtKYcOj8CQiSmq/fAcbDsTjXhefvg8ZVopBCpscnQAIcsw/c
 9ojQLdQJdnqRcm0eAhkUm8S2+hkfKCnJf14ReSFLTAXcbLNb9sOJFLdqvUE1H1i7jk5m
 MVng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVonVE1FXxGOeDXS2UDttiqk9EspwngppNoOMUm2mp3gQ2uul3+UnojGev4NnNpw7sxZMqmkah+oSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAJbO+BIjg3qG9q4E+7ytOBsv2fUFrm3l03vX+6Eh08vW8mLk7
 X/aapzWHpPufKDoKDi63iIbXkfic89TKHwHaQLpUciKlqg80e4Ew+nWPc1Dyt+NRtXbvbBCyrGK
 zOSKBIeKNUir7h8KK0tXYYvedC+uns/M=
X-Gm-Gg: ASbGncvvjfTzkz+c3GtFpvpVrJwIqRIEchPf2c8beuZPfs8px9Eo5+nKOqhe8PC7t0w
 NCh5ki4O441o7S/mCvuOj6MCId5kzCsJ2lQ94uMwOlPpvboC0JpbgcnS9TP4t3EMNKP8FBllOXa
 twy5eg3Oh47g+HJtib2bhd7RQ778MGGrcYwJyAHCoyzZeOTrJPn45ofLXSrbxSRuA/3kUhA5bqi
 ul4hS2aJfV/UXwMcibTht2LNMSPaQ==
X-Google-Smtp-Source: AGHT+IE+ekr2xDURLXt2/2QgLORVc9iZ5Vkf4ov5IS6SbosRJidHLkZgcVMiewm3ujmRFyRrdPIW8+HLuaDUv9i3XMM=
X-Received: by 2002:a0c:ee92:0:b0:812:dc64:e8fb with SMTP id
 6a1803df08f44-87b20feb981mr19197626d6.3.1759895016693; Tue, 07 Oct 2025
 20:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251007013207.1469618-1-airlied@gmail.com>
 <d57eb562b87f9c3ead50acc81d76526e947d0ab9.camel@nvidia.com>
 <CAPM=9tx3Q4NdAc5NDGUjdjOH-ZPagKNu43+zOUZTVcpEO9zSsQ@mail.gmail.com>
 <a02a0105aed482a977b06e66391b35e5a6f39cd0.camel@nvidia.com>
 <20251007152021.GA139177@pevik>
 <CAPM=9tz_fnRxZm74C+JuxZjCbGEH66JbabN012zVNgKucrw8oA@mail.gmail.com>
 <4d706ee978f0e975e5bb99e2ea342fedfbac214b.camel@nvidia.com>
In-Reply-To: <4d706ee978f0e975e5bb99e2ea342fedfbac214b.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 8 Oct 2025 13:43:25 +1000
X-Gm-Features: AS18NWCS2KGe5iKkylyWydSSiW8gltSk3LHRfV_Okqlvg653tSeuywgm9YRluok
Message-ID: <CAPM=9txXDazzxsdw0iDPb+XnguKVebhDHeszJYvoHCVvi3Tp8Q@mail.gmail.com>
Subject: Re: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
To: Timur Tabi <ttabi@nvidia.com>
Cc: "pvorel@suse.cz" <pvorel@suse.cz>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>
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

On Wed, 8 Oct 2025 at 13:18, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Wed, 2025-10-08 at 11:48 +1000, Dave Airlie wrote:
> > I think that is getting a bit complicated for distros though. There is
> > no reason to ever want 535 only. We don't want to give people options
> > we don't actually support.
>
> My Ubuntu 25.04 system ships with kernel 6.14 but only the r535 firmware.  So there systems out
> there with recent kernels that would select 535-only.

But there is no need to select 535 only, if you only have 535 firmware
you can't get the initramfs having 535 + 570 firmware.

The problem is when the distro has 535 + 570, you want to let them say
that and drop 535. Nobody needs 535 only as an option, so it confuses
people to provide it.

>
> > The options we have in the current driver, is you get 535 + 570, and
> > we give you the option to say I only need 570. If we add 580, we add
> > another option and fix it then, but I don't see the point in
> > overdesigning this for now.
>
> Well, like you said, if we move to 580, then now we need to decide between 570 and 580.  So
> let's set up a Kconfig system that handles multiple versions in a future-proof way.

We just add the exact same option when we merge 580 support, I'm not
sure what future proofing we would need, the option isn't that much
work.

Dave.
