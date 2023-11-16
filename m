Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D47EE754
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D0910E685;
	Thu, 16 Nov 2023 19:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEF110E680;
 Thu, 16 Nov 2023 19:18:00 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6d30d9f4549so648347a34.0; 
 Thu, 16 Nov 2023 11:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700162280; x=1700767080; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQvW2mlQLaPe9zQwh1aRBhkCYad5wvCc2L3vPohQIMU=;
 b=NeESLs+W6oZR5ZJC4zvw/lvRqFuG9lkEWpwJuie2HOsxNc2+ZrGmkahiWaYmKs9+L1
 lD6Q/Ai/nfO0ptceWR0nrAHbMG8S1qNP1il8jsAx/T1lmDb3Y+UjkNuKv2+gQadptziB
 ol0YNkpiDtp6zVIetJioK9S42RQ/vDheTOu0LQIRvTyB2UVXFCC5s3k3uPpT6nxSeK7i
 9mEdVjc9oJQBgXX3k3slY4w6bZhh2/F8FCY6OKRnXQLlglXUjKuPyJ/62wERn1addXAw
 iXhM+I2d2TxqQGlt2Iv0yg7r2llrEKrEKmwJmzE53/Wb8tz3hi+P8raDYs4aCdcpuRh7
 VjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700162280; x=1700767080;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQvW2mlQLaPe9zQwh1aRBhkCYad5wvCc2L3vPohQIMU=;
 b=DU5ZoPZe47svPsVNW/gsJLZ4hMjQJTEiorAK8TgCIcEEip2lOptxLk+ACHTTArZu95
 IOzZRLK7RFcopTUsh9kQGpM1tRq+ebIjsOcRr8Y+jpBf2FOsFCzoBwUmCg05BfuAk53I
 e6H7d5k6xZ8zCvctRe1vnOCcVu3bIx/64ZB/yEybJ7i6ocIUopPtzcW26bd2gk6jBAI0
 22OeHj36KcZAzDMFxvbXkbcnVtwCEcux+7OPWyE2M0DHYwH7Cneb1cv9YAektFs2nuY+
 YB+JcuBcFRuaP1JtLawjHztrHMbpLl1FTjrILP9OOo2PyKor5NVw2PecsqyE+ynBLTB0
 luxw==
X-Gm-Message-State: AOJu0Yx9u+DBDkbUWoiQkICfa0hQeduRUp7bc1YFxETotq62wisyG+AN
 qb6XobdiIbf6IS+Zv4AkUmZaJMuN7e0+oQJX1dg=
X-Google-Smtp-Source: AGHT+IFchzrhEbVbz5AEifNKluJrx6zIDMG5gc5BfPiF7RMJY6+/+9azNscfVMvB74Y03sWBedUaDVz9bS5Uf4oPXtE=
X-Received: by 2002:a05:6871:2312:b0:1e9:cb7f:2287 with SMTP id
 sf18-20020a056871231200b001e9cb7f2287mr21389323oab.46.1700162279900; Thu, 16
 Nov 2023 11:17:59 -0800 (PST)
MIME-Version: 1.0
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <ZVJhwSS16+/Zzt0f@shikoro>
 <887657ba-86ca-49bc-b6c3-8543610c3230@gmail.com> <ZVKNIn1eSlZ9yzco@shikoro>
In-Reply-To: <ZVKNIn1eSlZ9yzco@shikoro>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 14:17:48 -0500
Message-ID: <CADnq5_NgzZ+1FTzZObivnjJbbuYcafY-fbvgiGA9ryqA9wYedg@mail.gmail.com>
Subject: Re: [PATCH 00/20] remove I2C_CLASS_DDC support
To: Wolfram Sang <wsa@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
 John Stultz <jstultz@google.com>
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

On Mon, Nov 13, 2023 at 3:55=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
>
>
> > We're not in a hurry. It's just my experience with patch series' affect=
ing
> > multiple subsystems that typically the decision was to apply the full
> > series via one tree. Also to avoid inquires from maintainers like:
> > Shall I take it or are you going to take it?
> > Of course there may be different opinions. Please advise.
>
> Ok, then this turns out to be a negotation thing between the drm/fbdev
> maintainers and me. I *can* take all the patches, of course. But since
> the number of patches touching the non-i2c subsystems is high, I'd like
> to hear their preference, too.
>

I don't have a preference if you would prefer to take these via i2c.

Alex
