Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAD59E3AE2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 14:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBCC10E4C8;
	Wed,  4 Dec 2024 13:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gm8sXpuY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0235D10E4C8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 13:11:33 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-385e96a285eso2254459f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 05:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733317891; x=1733922691; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N0SZ8kQHAsOIZwkil/k0ov1BrW4/jp+99A2CjCuwyeE=;
 b=gm8sXpuYbwfQ6ndSo13EKEGN3NSQSyNQiv4gNK9/AdBLV+VwsrJWwiQEeTe20qhp9P
 Qcv1CdxGHtp4kV5B6BlfOzKJlhdjUd96VEi71D1V2dLG9ZdknhXy+KZeBm3MfvasjeYL
 Y+C0qmSahZ8hMfeZAqPbnJ3YffKzjQjz/J1La6T8cqp9EdNn7EPU8SG/BQ9RzqpfIdWf
 SsoRe0YxlWZLcMekb0LBPFrySY0AwfpE7Sx3b918gLqGu9++IjQ0IikBYAVws0L7nOGn
 CYEJAYu++J/DMl7UlsYSRDoXj5BuREIzInN86Ih42NgyOZvQDqsBrsdHH2qsf3bg78hF
 B5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733317891; x=1733922691;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N0SZ8kQHAsOIZwkil/k0ov1BrW4/jp+99A2CjCuwyeE=;
 b=niAbulbaDNl3wDs6fEvURzQkkRvOjFvW5h2uwnQOmUJbKWpepNEWYQN9fHnBpgbRDk
 Wclp64sM7VH0gV/t7dS6UhipmG7xWa/EFiKD3qwa8n7MkswhbklJFmjCuAVDOWSKLg3H
 vnmwHrdnS7RkiTvL5yQaFRdt2r6aAECBWCLIURMtgZYmCxG6IcbdS6RlU1iptJPCGVE2
 nH6rpfd8iVlrK3c3C4jkPv2UAEA9BAFp0fY4kbBLYB685DTLW5qWpBmowKL412nrOO3G
 15BC2o7xf8X23Co9ao/rE7UBxSGF/tcwI7SSyNoFMpr3Pz3N4El6/d+SkUhrwdvHlz1Q
 2onw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzQoQTkkzZJF+UBpC4lLP6zxRIg2MhNE5P6Hb0gk3Bw76k/V4Y9wcxDaiMxwcKW0ySogP+3VU11CM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy88rwmijB/aaTfhG5J+flNN5qYh+jfPY2lcgwp4j6ffr67/3ve
 iR5/0up71e6ay9G6uwa1HNB/W7bjojPvjWadDDBG8+F06hFNQjNY
X-Gm-Gg: ASbGncvgiheETbmOJ3Fim2xQMUoXO8hje80gyVMRfHRucfc0oVmKKbaCg2GO9Bsqo81
 8aLDsxgMIzX5/BLdr41UBRjFeg80V8mV43+y2yoyo3O4Hw0xX9YjyNlg2Iw3YewFIw6yb9DKlQY
 zG2EDawOHuT39XMA5WwXoaLnHwqjmO50mKxYUuPgzMIRzqm2+ZGHZV2IJKke9DqIg0JklIWLmvV
 eHp+K/qkS8EwEFnCK2msmXso3ISmzG3J/lkMv9sSq1kBteC/LCQP5+SKJODGUaFbEsvOiHcufXr
 Kc8th+VWcih1E1Y1snCI
X-Google-Smtp-Source: AGHT+IGuZnkOOfZUxBSm0+r4WvUzWEwuuklRNTCmho0DrzlTwe+kaD62v7h9w5mevqqGbuXembhvLg==
X-Received: by 2002:a05:6000:18a6:b0:385:f44a:a64 with SMTP id
 ffacd0b85a97d-38607ad0280mr3654189f8f.24.1733317891110; 
 Wed, 04 Dec 2024 05:11:31 -0800 (PST)
Received: from tom-desktop (net-188-217-53-234.cust.vodafonedsl.it.
 [188.217.53.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e30c54bfsm13145015f8f.110.2024.12.04.05.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 05:11:30 -0800 (PST)
Date: Wed, 4 Dec 2024 14:11:28 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Liu Ying <victor.liu@nxp.com>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Message-ID: <Z1BVADAhfENdcc3y@tom-desktop>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
 <Z1Aw0WafGmYDrr8K@tom-desktop>
 <cnauwpk7myky6zbfcqg5335dqif4vmggzxlq554ye2bykb5iwh@ng4oxd2c5md3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cnauwpk7myky6zbfcqg5335dqif4vmggzxlq554ye2bykb5iwh@ng4oxd2c5md3>
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

Hi Dmitry,

On Wed, Dec 04, 2024 at 01:53:44PM +0200, Dmitry Baryshkov wrote:
> On Wed, Dec 04, 2024 at 11:37:05AM +0100, Tommaso Merciai wrote:
> > Hi Liu Ying,
> > Thanks for your review.
> > 
> > On Wed, Dec 04, 2024 at 11:34:23AM +0800, Liu Ying wrote:
> > > On 12/04/2024, tomm.merciai@gmail.com wrote:
> > > > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > 
> > > > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > > > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> > > > format by selecting the LVDS input format based on the LVDS data mapping
> > > > and thereby support both JEIDA and VESA input formats.
> > > 
> > > ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while
> > > this patch actually only adds vesa-24 support.  So, to be more
> > > specific, the patch subject and commit message should reflect
> > > this rather than claim "Support VESA input format".
> > 
> > Fully agree, thanks.
> > I will fix that in v2 specifying vesa-24 like you suggest.
> > 
> > > 
> > > > 
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > 
> > > Can you please send this patch with your Renesas email address
> > > instead of Gmail email address?
> > > Otherwise, add a Signed-off-by tag with your Gmail email address.
> > 
> > Thanks, for the point.
> > What about adding Acked-by: from my renesas email address?
> 
> Acked-by has a different meaning. I'd say that generally it's okay to
> have this light mismatch, see [1] or any of the emails that B4 generates
> for web-based submission.
> 
> [1] https://lore.kernel.org/dri-devel/20241121164858.457921-1-robdclark@gmail.com/

Thanks for sharing this example and for the clarification.
This is similar to my case :)

Then v1 procedure is correct?
I can use the same formatting (From: Sob:) for sending v2?

Thanks & Regards,
Tommaso
> 
> > 
> 
> -- 
> With best wishes
> Dmitry
