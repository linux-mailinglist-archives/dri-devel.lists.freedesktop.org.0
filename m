Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE6DACAC69
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 12:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589A410E2A1;
	Mon,  2 Jun 2025 10:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2F610E2A1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 10:25:40 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e812c817de0so1318294276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 03:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1748859939; x=1749464739;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7P6Y4GKB06s5F+Y/MFVbmu8Z9uqQTHt8g1UGCgyc4pU=;
 b=S3Gi/VYJwPL/CVZJbFGC5w4f/w07GcN8tTYufLTEpFfg2HhRxIm4LISInmXf+miinh
 YZjK54GoNqeF7PcMp9VByG6hbgZGfbx3FYQiXZlZ+1xZFkrERordQyAStrWklxOzlddR
 Pm/HLYxOfweqLOkWxXfe7pWak/pEMtP6gSNBp9YAOYzntMlDCWlE8+7R/97bHgU9Hqvj
 1GmJ0gtV5NOfud4Q0ZI0PRJikBzGKGqPdYX6J6KgZcjwiNkt1vMBugl3OppUsKn8i1B5
 7W1B76+bSBgS2B3eKgsMBHJ9Ajeqch7jn2hRf+B/TY6OHyyJzd3BHvF7hcCN/7c6QOL+
 g6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748859939; x=1749464739;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7P6Y4GKB06s5F+Y/MFVbmu8Z9uqQTHt8g1UGCgyc4pU=;
 b=LlTOuo1YCxUtitAV6THF5egSxTqv98Z63C0sxmX+RoczVRX+Ev6RF4NIBmTMeeUz2U
 2Kf0DOqKldKlkEPZESZGDTIvWEIaMsJStaMKpojUkPWlhnIo4LV5TYvqLQDGgaCUThQO
 4/2GKu7NEBpMWFq5y6q3S+adjCH8Y68fZyC/jzPnNN9NEUFTHfg37xFKajC4LFEQ/DE2
 R5gKXF7hx2RgcTyzfYqQpbf0y5GZs1oY9zB0VqQrBrmVFJDLC3mRm7HhCLZafiESyB5x
 X2a5dP2NKIH1CxYAkx/UVe/vxGY3AlNe3BLpdBdzMzAP+gQnQ3se+klun0kZZN6flV1m
 jkqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdwgPcbOxqXb8d81JEg1mJRNkSPLyr5bA9woFI1YGoiUC5drIMEnI2dr/P17I9E/WygtsO3b4QUzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQQZK6K8bUYLTVgJVOhi5QPPruscfSBZa4+3n//g+UzEJ5/JeW
 HqvPDIj1a6yz4r1lOaStkCaSK9v7+XhcIjGyxdwk/Kqpooald0eGa8GUPsEJBUgL7c3vfjJNFy6
 BN40BTcqUBzaCR/abng2EqMGgN0rL1DigWY5fJNhC+JB1KP0J3pd/p9g=
X-Gm-Gg: ASbGncv3t3kkzynj67Y0GgufTdbnXJmQMvgt6UTEII6N+N1Ug6DwFcZbc+MOHz0W0Bu
 78PCzVM86BkYhh+ZpX/gau9nbWjSb+Bb6TPHBBp2Yw2hLrAPRdwAXzkuCR+grdbr1CSDjNxjO5l
 4P4mdi41dBLaCWrmS94sQGU7dHpdmeBowaNA==
X-Google-Smtp-Source: AGHT+IHgf241/+XooGY+7VQxGz+QMtTXcq1pcvUD9HmfJ7+OM+oqivNr0clUSJ9p7Kt8etwmmS/GC0gaf+rJbhU5LW8=
X-Received: by 2002:a05:6902:120e:b0:e7b:3d15:10f0 with SMTP id
 3f1490d57ef6-e8128c58284mr8454809276.31.1748859939384; Mon, 02 Jun 2025
 03:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADGDV=U_7CdkdEiLX9kj9yHsXhwb5zP_eGXpwmrj20cmgzMAtA@mail.gmail.com>
 <eb5f3198-7625-40f4-bc23-cac969664e85@amd.com>
 <582e10673bb749f18ebf8a18f46ca573df396576.camel@redhat.com>
 <b055ff59-4653-44d9-a2e0-bb43eb158315@amd.com>
 <DA7PC2LNU79K.28KBFOL3MGI1S@kode54.net>
In-Reply-To: <DA7PC2LNU79K.28KBFOL3MGI1S@kode54.net>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Mon, 2 Jun 2025 12:25:28 +0200
X-Gm-Features: AX0GCFuYwA4pxqr2zT4Iil1JuDkN-FBXLdtD9OExlZ-E9pvXbkNRDtWL20NsXrE
Message-ID: <CADGDV=WJjcLds5T1uAst7ctOMbApnLR6ixH8wvgvKvF-YS6kog@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: Christopher Snowhill <chris@kode54.net>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <pstanner@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
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

Hi Christopher,

Thanks for following up. The bug still annoys me from time to time.
It triggered last on May 8, May 12, and May 18.
The crash on May 18 was already with the 6.14.5 kernel.

> Could this sleep wake issue also be caused by a similar thing to the
> panics and SMU hangs I was experiencing with my own issue? It's an issue
> known to have the same workaround for both 6000 and 7000 series users. A
> specific kernel commit seems to affect it as well.
>

I posted the stack trace earlier in the thread. The question is, what
was the stack
trace of the issue you are referring to?

>
> If you could test whether you can still reproduce the error after
> disabling GFXOFF states with the following kernel commandline override:
>
> amdgpu.ppfeaturemask=0xfff73fff
>

that disables PP_OVERDRIVE_MASK, PP_GFXOFF_MASK,
and PP_GFX_DCS_MASK.

IMHO, that looks like a mitigation for something different than the non-ready
compute schedulers that seem to be the root cause for the NULL pointer derefs
in my case.

Anyhow, I will give it a try, and will report back if my workstation
does not deref
NULL pointers for more than three weeks with that amdgpu.ppfeaturemask set.

Best regards,
 Philipp
