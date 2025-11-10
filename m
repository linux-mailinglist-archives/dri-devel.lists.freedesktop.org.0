Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B15C48EED
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 20:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8DA10E2F2;
	Mon, 10 Nov 2025 19:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A3UT/sUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C52710E2E6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 19:14:33 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-297ea4c2933so1115775ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 11:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762802073; x=1763406873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YwHDw+RWhOlZP/amR1OZvDu5iuKr2nALD25XBBx4YF0=;
 b=A3UT/sUpESPFfaYmXplrLgrNfrUw3UryR+7LgIhdv1MTQBUUuh9jzYxOTeC4G89pnw
 z+v0ZL1deNh6mXAOkkEcinqZc/3l8/huje/B+iJDjHAR7Zp/n+aYcMQx90iPUo1bi1Ow
 0m3MNR/DYbRXAiSJsq3yKM06YUDsJ4rmWToHFso7DZDJ8zBvqeZ6oiGAnwGqRMUULzrs
 lgtFDYeew6+pyhbdxZ5AgMZtHfnpns0jLXRngq/To9NE9hUdsCn+9JH6hH4z49rERSIS
 mSxcQpBmyMtv0CXVQT/ueBqaN1Kiuo46MO7UYcA8iVjdU/xFLKvt0fv3t5jW0s82kiVG
 5qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762802073; x=1763406873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YwHDw+RWhOlZP/amR1OZvDu5iuKr2nALD25XBBx4YF0=;
 b=oW39aYlSm298NvG6a4x7lAOki618mh3bIlMmRApaNbLIZhM22Ap7D9238k0dofuHKw
 kkzM1QAZvipqjEv+tjDIhE1Q6aM+YcC6yxMTcVs/wQYaWAGTOQc9b/TqAIDxsabb+oXI
 DHV01ezKJESsJ0H+EXobQnDsQVKR1F3+MCbNYnfRtpPMST1K8JxDkiMMjY4oyuErwx9B
 yL3db9w/j4RxGYQMBjDkTn+zj/WUw/7gbBm/OxhmM8YFfyQaZQAXdsVQGGzRKmOxOHwz
 10iIoq+aCsUod+XEteo+54yHMgLwb5gjwz2ukBKHXi/ZEhLnExJk2r2HZmtFdoqZvHIz
 6eBw==
X-Gm-Message-State: AOJu0YxR3YiaSgxxQp1zTUv7EQA08mOBBdwhrjJJMwOpn/2xG56VzRCM
 XH04S7zM5XywLSOmxxsOLdgkaSbeQOeSJksK8BMY8k2Dcfox1HPuPX9egdZISb8xv5zu9ZSY1yN
 AiMwAoe0/vszMnj/QHwU7ZndiwKPVeDc=
X-Gm-Gg: ASbGncv2+E6mAqhbzF/Tf+0K/wvdzYluPNZYxZt3cVtfchluF8EzoiKpO2Zg8wygj6Z
 DQrRhtYRfTB7YYSdA5Yi+mrmWas5v6zg28C9JeKzMn1pq4mR7ZSP/PLCsoC11LiIjsP//IPXkjI
 EC9D/P1r/vDeQ/YRm1URirwx7hpKNm8l5mGv44qiG8bgQavXziv6qPhMOgOr+kplZ3nz+xwZykM
 eUSWiRSEeb7clUYqUJAN1t+RzwrQj8BSFGJm0RQKAy5gOdoZ+2RbRD6j7iE4osPeU9y6G8=
X-Google-Smtp-Source: AGHT+IGmoL24a5e2UsUDRuk9UBkWxVYKGDAVprVsr0fIJMe2VdBvfjSPwHiQpCu+jnl/LPBTuLwZI1mDrMEaljJsm48=
X-Received: by 2002:a17:903:1cc:b0:297:fe30:3b94 with SMTP id
 d9443c01a7336-2984107933cmr1991405ad.9.1762802072864; Mon, 10 Nov 2025
 11:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20250325210517.2097188-1-bradynorander@gmail.com>
 <CADnq5_MNBUY=jWbnq-gZQ_4_M_sBJGAgMD0bj2cMdnkoU9G=HA@mail.gmail.com>
 <9ab05b38-6f77-4b0b-8a1b-8314e2873047@gmail.com>
In-Reply-To: <9ab05b38-6f77-4b0b-8a1b-8314e2873047@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Nov 2025 14:14:20 -0500
X-Gm-Features: AWmQ_bniXwWbFIcQl7Z57OsTSHw-cwzsFFjBwmNKVxkysJ2r-AhfWVyV_dkSDOw
Message-ID: <CADnq5_No+w+tco9j35GBM3+CYBTo018eLwWec278d3VBJHPQxw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use static ids for ACP platform devs
To: Brady Norander <bradynorander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 sunil.khatri@amd.com, boyuan.zhang@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 25, 2025 at 7:11=E2=80=AFPM Brady Norander <bradynorander@gmail=
.com> wrote:
>
> On 3/25/25 6:12 PM, Alex Deucher wrote:
> >
> > While you are at it, can you take a look at
> > drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c and
> > drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c as well?
> >
> > Alex
>
> I think it makes more sense to handle that in a separate patch as it is
> an unrelated ip block.

Sure. Can you send a patch to fix those up as well if needed?

Alex
