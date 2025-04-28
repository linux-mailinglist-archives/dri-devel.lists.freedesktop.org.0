Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6056CA9E6D3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 05:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C3210E32D;
	Mon, 28 Apr 2025 03:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DxX4D6ua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C2210E32D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 03:57:32 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so1024312866b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 20:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745812651; x=1746417451; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zKkD3D5X64hOxLzMuTgRMOH6XEDwFgEjdPhu91sFJHo=;
 b=DxX4D6uaUkMfbbOt1ZSggIMvAd0kV1BnsCHsc5A7uIX4KfgLch/DIU+9FNVNUKNJop
 YVvn6+Xy3ZAwfKnHm6hpI+sKY0iHg4US6KXWhOB3UAeoJXtOkEBWxEpQYgUh0EwdfbY9
 E5mOA+vVniyJkDOYnDhzox8qeK7tOYK38utGZugDqw0O1CfIfkfqw4QAFsi9mv41qh5e
 WNNkKkyaarzYPsBaIy0YXF5p9qsCCONHr6/S27wLrvVuVNLoNPMDzgT4NnTOO4wufeIg
 0TwSyLEcGPJtu2TYLoS4GAserAtxRlk9vsnApKYs2IEWF27U7BG6yaJ4AWT2hN/ad/zQ
 6JzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745812651; x=1746417451;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zKkD3D5X64hOxLzMuTgRMOH6XEDwFgEjdPhu91sFJHo=;
 b=JYyKuhjzaHCOGszu/9aYB9xlx6DUeEC0jfuMhf3eIeDR6au0gX44imnr+v+0uWkdZa
 YRf8l9cP/4ZsX17Rsb6Tob4xz9083RpwEKyVZvbw7fHMLBUtkhmYr5oYp1ezrzmUgSi2
 hhAJ53HOf23tmQR4Ndxi7UtMqFOQj6tPZD0UTMGYx0DriTJGujTYTcIE0puM4i57myOY
 dtNCX4RnjHEEa+MGu2V2dxV6B5kG5NHNTXdd+q05g+Zwbmg+2BfPhWhqIFMgsxposffI
 XFQqY+tXwYm4Y8bjuUf6+SGG0RsNmDgjJq9OgA3vVwr8WlJZIWaLvBPwU7dLyKrBTsPF
 VjGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5HVzEHrcNZhNvYouBl7fNpVMF0tkHJm5bb9fie5f67mCqRigS8c1Eebil780mBiwTXxCwZf4WfZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfL6X5rx0By7nByDMX0NgmUanW9OYB3i0eMCHeIaVCy356eGqf
 h8FLAWiIUxZdJ9l9GHebaEOdSERxmBJVcKiOAvmkNrBQ0QKV/h8ba9tKKBSJMevCWCixs9vLeFA
 p96MHQ9xbDORfDOZcDM3708N8Qjc=
X-Gm-Gg: ASbGncui2rZewT6EJtbGr4wbsxFmmS3wpm6NSWNCqZVNqBknFpymx2/oOAQHOPmZlpV
 sAjAgy9th9ZiVIE33d0avJIu9N1WP2OLRNBS1bxGROIhStjFsN2oYk00vDumNqRbfVer1gCQWlr
 c8J2vfRTivU5JGJ0sbmRQzdlHqOx/JZIU=
X-Google-Smtp-Source: AGHT+IGeCRKuuLFutFpPmOmuktV1/3ZxyYnFaVPtEpnPgQzg0Vb01czkv7Jp/OH3OipZQHIvx9LDfqU3TbW1bw38Dts=
X-Received: by 2002:a17:907:26ce:b0:acb:37ae:619c with SMTP id
 a640c23a62f3a-ace7341c252mr905052866b.15.1745812651184; Sun, 27 Apr 2025
 20:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250428133013.5ad6b6b7@canb.auug.org.au>
In-Reply-To: <20250428133013.5ad6b6b7@canb.auug.org.au>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 28 Apr 2025 13:57:18 +1000
X-Gm-Features: ATxdqUF1pnd1tgsz7ydsGeUkAO0Dc7dpPOkKeJcGLyMbMEHcikT6SBdM-TnbLXw
Message-ID: <CAPM=9tw=fNm8JsaHJNayN_QLiE8sHpgC5VEevhJ-9qnD8hD=LA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

> Hi all,
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> In file included from drivers/gpu/drm/xe/xe_bo.c:3118:
> drivers/gpu/drm/xe/tests/xe_bo.c: In function 'ccs_test_migrate':
> drivers/gpu/drm/xe/tests/xe_bo.c:63:15: error: too many arguments to function 'xe_bo_evict'
>    63 |         ret = xe_bo_evict(bo, true);
>       |               ^~~~~~~~~~~
> drivers/gpu/drm/xe/xe_bo.c:2939:5: note: declared here
>  2939 | int xe_bo_evict(struct xe_bo *bo)
>       |     ^~~~~~~~~~~
>
> Caused by commit
>
>   55df7c0c62c1 ("drm/ttm/xe: drop unused force_alloc flag")
>
> I have used the drm tree from next-20250424 for today.

My bad, dropped a patch on the list, I'll hopefully be fixed up for tomorrow.

Dave.
>
> --
> Cheers,
> Stephen Rothwell
