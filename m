Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2EC6F6AED
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 14:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B33410E386;
	Thu,  4 May 2023 12:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87F710E326;
 Wed,  3 May 2023 17:43:17 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f20215fa70so36935615e9.0; 
 Wed, 03 May 2023 10:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683135796; x=1685727796;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0fukvTQBpdJxkwknUT2et4g7cMhSFUYtb+Kco7h5oV8=;
 b=D4rN9Laqs+WmrLaWcKfLpPBqjvy0awK33/oZwDDJTjZ4yZdvDfCvKqjVf4w05QrUQz
 Kp2POikwVM+IMY8eg8qAldD/kEiuV7xR6r8bIWAf63uKGx4B9c+oHV00JWY9+LCK/acY
 oneDyIioahvbNqsGOaXcMJHB6xlnvp/9tJSN/WD3C+0hrt9WjDmeewiYaJ0CkiZxLhXG
 /zJ/Np3fUyJ1KqD7XfLHWUnSGzBtHEZMWsunf5MOc4C6OhHZVpmIVI4Ys+4o+R2m8hSY
 wZfBjrDWgE01mKClJhTR1AQYQ+jUiBHTTxlzoSgX9kEhB89ftpxKxJQ8jw3rVcm1uyIW
 fhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683135796; x=1685727796;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0fukvTQBpdJxkwknUT2et4g7cMhSFUYtb+Kco7h5oV8=;
 b=YuTH29YGj+flH6UxYn6vV82HQscD89ePoO79sGKDRk0DBgI9iA20Vf8gWFbG3KFxYw
 Ws7HNOPMSFU42n3NoORzwOt7lIalx+9RFsoSEy/FKZ3zEvNr2HBQrO2mY0lM7zm7dUqI
 hD3KW/bK6SqlVWr+Nj8iRfqgeL2AR39/nnC/UfysqsPA4CkPtyTe3gzx8YUO+uTnLEIw
 LvwK9LbyW4sMgWbe1ViYgbltR4Jw4T67wVjQ/RwMcD/BYXLPluBucX/uPbwofTJ661ux
 DU6j23UFklhSOdyOLp65zHqaDZBsQLcVb+qpyOPn6K8OKPoKA5HrycVudwxi/Oc9Jqn7
 9aMw==
X-Gm-Message-State: AC+VfDzuNsoDOMdLHBEVLgA+zHnLChG602wuBPZXdyxOaW+hRQl4Y7v6
 JC8sN1acuZ4N30O3mrwZSZs=
X-Google-Smtp-Source: ACHHUZ5DTr5HfRX9CyS/nfphMJGbrJb9KUL6YX5QqlgooaT+AFoRvjt2aMNUD9g5dZmrtbUWJtrOBA==
X-Received: by 2002:a1c:7311:0:b0:3f1:72db:4554 with SMTP id
 d17-20020a1c7311000000b003f172db4554mr15221288wmb.1.1683135795723; 
 Wed, 03 May 2023 10:43:15 -0700 (PDT)
Received: from [10.115.201.114] ([212.108.221.126])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a1c730a000000b003f325f0e020sm2452648wmb.47.2023.05.03.10.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 10:43:14 -0700 (PDT)
Message-ID: <967a044bc2723cc24ab914506c0164db08923c59.camel@gmail.com>
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Felix Kuehling <felix.kuehling@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Alex Deucher
 <alexdeucher@gmail.com>
Date: Wed, 03 May 2023 19:43:12 +0200
In-Reply-To: <2bf162d0-6112-8370-8828-0e0b21ac22ba@amd.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
 <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
 <85c538b01efb6f3fa6ff05ed1a0bc3ff87df7a61.camel@gmail.com>
 <CADnq5_NHtFbwT=x8u7GYc4ESL_HVFzjgtOd3AnVFBYMrjZq55w@mail.gmail.com>
 <c54414482b685af0991a6b095cbfb7534d998afc.camel@gmail.com>
 <CADnq5_MSY=j9AobDk7ACevur4Hwvw_ub7g16Mfm7ymMJqwVNfQ@mail.gmail.com>
 <57fa0ee4-de4f-3797-f817-d05f72541d0e@gmail.com>
 <2bf162d0-6112-8370-8828-0e0b21ac22ba@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 May 2023 12:11:44 +0000
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
Cc: "Pelloux-Prayer, Pierre-Eric" <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?ISO-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Marek =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Felix,

On Wed, 2023-05-03 at 11:08 -0400, Felix Kuehling wrote:
> That's the worst-case scenario where you're debugging HW or FW
> issues.=20
> Those should be pretty rare post-bringup. But are there hangs caused
> by=20
> user mode driver or application bugs that are easier to debug and=20
> probably don't even require a GPU reset?

There are many GPU hangs that gamers experience while playing. We have
dozens of open bug reports against RADV about GPU hangs on various GPU
generations. These usually fall into two categories:

1. When the hang always happens at the same point in a game. These are
painful to debug but manageable.
2. "Random" hangs that happen to users over the course of playing a
game for several hours. It is absolute hell to try to even reproduce
let alone diagnose these issues, and this is what we would like to
improve.

For these hard-to-diagnose problems, it is already a challenge to
determine whether the problem is the kernel (eg. setting wrong voltages
/ frequencies) or userspace (eg. missing some synchronization), can be
even a game bug that we need to work around.

> For example most VM faults can=20
> be handled without hanging the GPU. Similarly, a shader in an endless
> loop should not require a full GPU reset.

This is actually not the case, AFAIK Andr=C3=A9's test case was an app that
had an infinite loop in a shader.

>=20
> It's more complicated for graphics because of the more complex
> pipeline=20
> and the lack of CWSR. But it should still be possible to do some=20
> debugging without JTAG if the problem is in SW and not HW or FW. It's
> probably worth improving that debugability without getting hung-up on
> the worst case.

I agree, and we welcome any constructive suggestion to improve the
situation. It seems like our idea doesn't work if the kernel can't give
us the information we need.

How do we move forward?

Best regards,
Timur

