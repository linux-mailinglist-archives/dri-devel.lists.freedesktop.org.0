Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC4D87CC68
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 12:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795781121BF;
	Fri, 15 Mar 2024 11:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z7O98KkM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFD41121C0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 11:37:37 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso1906141276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 04:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710502656; x=1711107456; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W1YjIjeqOSOzfGq2xXT4IYkQmnAHVepprgGXQRagfTY=;
 b=z7O98KkMa0DkrG1o/qLi0SsOG53KgVgwdyEalhbzlDMOBXhpNc3768zFUyi52i6zoQ
 o8Auaxm6l+LWbKgg98GIUBFqEIa+SBXD+B04HObK0wace7gGrz4fZhRLzLPqy+K0Iy7P
 dRL1sXExjW8sGM+7EQH4o+OhLnqCVGgFjy+Xrc5MwE99mDNdhC9QA8WfPQ0h0pDOlkh+
 QTOzSYW+jam+fM6yg2GWYV85lTCcSiVWHobYr9tTJoTaD0yu0CyhXohI/NkLIGlb7DNr
 NvTCw+x8IVnkgmInsVo9wpmTf+ffpiyX3No1c2E5b6GG2NNWLJQNBiWczlHt9x2ES0NC
 HFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710502656; x=1711107456;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W1YjIjeqOSOzfGq2xXT4IYkQmnAHVepprgGXQRagfTY=;
 b=sHwhAtg+vX6ymOY4gVi6xp5y19sjhurTOpQ5W47oMzh7rHNqhKfP2sdrYV3adS9Vav
 8tDqI+0ulf9fDU7dzDjzRvONorn/SJZizBlO2ZRRUc6G2jzTYvmsUGobNQ7pT+uorY+J
 eDoFHhdvpn8mfBlnGCygbvRcDekmPp19vw48FcxSs7Bq1XQY/YN6ZiX1mhwaIYZ0xz/G
 I3Pr/+b78mu0Mi+lAaGKq66m4w5VRlY3sdXNe9NKfp9+vzVWF5wAySqH53DCOI7Shykk
 W153VqseiSY1fSf6bx5UUtzCHMoif2xQC5yzEj7iYyNcaKb3MtGPCXUUd4oUJh/epBYd
 Pw5g==
X-Gm-Message-State: AOJu0YwqPfmXXAl7U/hFj80t9yRUzgxRfNC+9F81W1F1mUNMnoN1HW6+
 fgj7bzlAfCJCzYO7QH8qLqyiQxDFggvVSq4dKCPvtDLlc63TLw3ucThdqG8WZd6yMsyrYxyVI2U
 ENvJnzjEEbQ0Zy1Eg3HbPQmStizDrn7DpFG85jA==
X-Google-Smtp-Source: AGHT+IGNjJToPdVH5hgnrzbo2/Y+N7SoBZsHPueEWHCi3sAAnAaUw/tww8bYLv5uKat8ny98eFlvnQEHDXDY2PazX2c=
X-Received: by 2002:a25:c5cb:0:b0:dc6:c2b2:c039 with SMTP id
 v194-20020a25c5cb000000b00dc6c2b2c039mr4303557ybe.41.1710502656113; Fri, 15
 Mar 2024 04:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
 <20240306030649.60269-4-vignesh.raman@collabora.com>
In-Reply-To: <20240306030649.60269-4-vignesh.raman@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 13:37:25 +0200
Message-ID: <CAA8EJpo=OXUitC+NPjZd5Kpq9dF04BSffvgsMYnn7LmmEoh09A@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] drm/ci: uprev IGT and update testlist
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, 
 mairacanal@riseup.net, mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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

On Wed, 6 Mar 2024 at 05:08, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
> Uprev IGT and add amd, v3d, vc4 and vgem specific
> tests to testlist. Have testlist.txt per driver
> and include a base testlist so that the driver
> specific tests will run only on those hardware.
> Also add testlists to the MAINTAINERS file.

I think we should move away from specifying tests explicitly. They can
easily get out of sync. A month ago I had to manually go through the
list of the tests and update it to follow changes in the IGT.

I think we should directly use testlist.txt from IGT and then filter
it out using skips.

-- 
With best wishes
Dmitry
