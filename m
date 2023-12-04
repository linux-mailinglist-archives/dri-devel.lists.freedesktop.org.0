Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D58780328E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64F810E1B2;
	Mon,  4 Dec 2023 12:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F2610E1B2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:26:27 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-db3fa47c2f7so2718134276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 04:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701692786; x=1702297586; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tFWyFPjADp1Fc6HbLi6uPiaZmfeg0/fMint0EXwMSxg=;
 b=w0/ImTECyidqeBC9pzoR02PqZP+eipTwOxTR5xgVcr02OL+HgHFiFm+apIubVyPbtA
 JcwsEP/X4oiPe4H5A9QWzHML2QYaYFI+ORcz+xpHyOVG73MZotrtT+mdVy2Dt/VMp/iQ
 XMmsr7hZUzY1JKExsNBU++NsLoaC5rbdw6WfJ904noW2OeCKT+V1FMIK2+/+4B5gM/U8
 xgN+a7yUEhXVppBtwRtk4NorB9llxc1yCCJFpyFd1CUYEWstifJkSSUS0hhcivvJKBj+
 fiZf743+O+li1C3OX7tpBql0p739UEkdYwd39kjlh1D+Wbw1AYSrRar/dNc87Y9Ep7w/
 MEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701692786; x=1702297586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tFWyFPjADp1Fc6HbLi6uPiaZmfeg0/fMint0EXwMSxg=;
 b=D3uggdKGOGZMzFvzoktZPEKjVFC//v4IrBMVOXYs+u+8Nkuq/F7mtaiwWZDGxsgEpH
 xVYGTRQfXa5hSVICGkY1Kl4ZCIz49sB3674FyJdDWGeCoyucf05euhzg8bVRzvJoArzV
 tvr4avtsCtw+c9cqCqDPpRbRouOWluux62z9vw9DA7Why3n4HvPFfMEfyehKXJIznI71
 VKClFCwqJCFvDtrQFDYWlDTnU8yGf6FDu4xw5df19EvLjmxma3zHBn0dlkgjnidj6O/2
 5Hk+avebDdUepxjOriAWrHiyUXyJBmmdAU6YG9iVggPGSXZmIXLsApRXmqegHOh6SlZi
 uToA==
X-Gm-Message-State: AOJu0YzlHFjrCOZw1OcRakdH7RHoBWEGVPg0F41k7WX+eHrk4D75nTuW
 gWwyC7E4RjtZ6au75/z1zBk0Q4uXvQFGHs08j1LQDQ==
X-Google-Smtp-Source: AGHT+IE+L1664SYHtY+cUpFkqq4X1I85OOyU1mq606IScbstXyiJjcP/Vfcc7mySBINjIKn/y2Cz19SvoVwqk/DjCeM=
X-Received: by 2002:a25:d85:0:b0:db5:4d4f:b3bb with SMTP id
 127-20020a250d85000000b00db54d4fb3bbmr1816647ybn.18.1701692786300; Mon, 04
 Dec 2023 04:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
 <2023120426-frosting-manliness-14bd@gregkh>
In-Reply-To: <2023120426-frosting-manliness-14bd@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 14:26:15 +0200
Message-ID: <CAA8EJpriJ-Y0Gb+PW7f5p4Sh_BXsDpeDckgnGZ+eKmWTQBegaA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/6] drm: simplify support for transparent DRM
 bridges
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Dec 2023 at 14:21, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Dec 03, 2023 at 02:43:27PM +0300, Dmitry Baryshkov wrote:
> > Greg, could you please ack the last patch to be merged through the
> > drm-misc tree? You have acked patch 3, but since that time I've added
> > patches 4-6.
>
> That is up to the typec maintainer to ack, not me!

Hmm, true. I didn't notice supporter vs maintainer.

Heikki, then we should bug you about that patch.

-- 
With best wishes
Dmitry
