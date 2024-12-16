Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F89F32AF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 15:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5871D10E69D;
	Mon, 16 Dec 2024 14:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TNEzDvFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862A410E1CB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 14:15:11 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5401be44b58so4186975e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 06:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734358510; x=1734963310; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UKSczxnLoUJAPWSomZ621XIOP46vr1LWagGXlu/bsRA=;
 b=TNEzDvFIbiI+vuMQVlfkEoCjkLnbOj0mltn+rZw5WokSoT61d1mDsUWJPCekAF5es8
 0rrPhMQF8NAEVnBlBGd4QdmEoVGT5G5iYZ6Lmm2a7JAmhaQ/qpOyPnUHiRa/PBgutZXB
 G99iLmmXrFBDec0N2tXlLB0Yva2C/IRq5D3tGgDjqKNULb3zoESutCk7Wo+z5qrxK24F
 DQHrzIDziU9/X+TgMotZ/v9SyazpnGM1Dh84shhQ1t0ajsEA0FCBQfNJ7eeyJgm5ax7l
 /kHa/ot4Dlr/UQHIECn+4+gdUT1G4Cgr0FXiV3H+WBSP3z4YQXntdr5DtkSGKFzO8eP0
 KzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734358510; x=1734963310;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKSczxnLoUJAPWSomZ621XIOP46vr1LWagGXlu/bsRA=;
 b=wMJEOeu1nYUI5FKTP3/RKqqM3A3zHvD3xk3Gu8cH/wZZwr5J4Svv6rUI37huKwb2QS
 ul2fJ8ptUVm54iScnQPKqEeb64nZhiQu2PnbNaydhA8vmOSTu5myUGZoMhk22kGeeJ/i
 18JNpFvpIeDsln8J7lstmA4tzsZSeyge9Hr33lCCBIv6VyW3iErkpPMvFATB9E6NgXOf
 +rFi7L4iJgZEM1LbtLIuQOOWLytWVDMdAC7DOjsWJxaHRoch6NKOANG0l9RW/Zkb3PIl
 7dLT8mR8pf0SUd+yD7kYvKSQ0ePaTA1UTldQHWebSZME9ZH4h3FhnKRCsmzwPy+cvKEc
 if4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsT16UcqbDton1Y3zYohm5sni7G1RZM2VH4piy27M/8tqEm9qA3QFOlJEdxdNCbJhWpWUfzA5ncOs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybc+wN1LrkJSTjpIH0GIOBcBCI+l+64Wn+ECbJZ8VEQ/VXHOkk
 XN1wFnjBxUMbMzq+om0HameUl6LUi9BtXaE8WEAxqWTpASIGYL6Llngdm8Y5Dyg=
X-Gm-Gg: ASbGnctUUV7yoBW8/pl3CRK5BySxIBNCXLBffbYCQtVgTbr74U9gJ/5Nq3K20CN4vAg
 U3gK9fmeRg/RVBm43gFzQ22N3eE0UjYD8c4UyhFehTmVdLzDuQHhQxC2eUuahbdBSMjknnmo/3T
 DttPtO1oIS7tdgJP1gYv8n7HSGjbPI9imCSw5jfmLDJivkwuObg971Vy/iy+a/qAs2UiUku8HmO
 JqJo4nxiyICQzxOoU05TY2F8f8ERrDsTnTeNkHvcBtOU88IRy+zLZJ9t9+/pYrRfApbqt9IoJut
 /ueLdBydqwcN7qFb0L6WBNpW2iQ4TLJlaE5d
X-Google-Smtp-Source: AGHT+IHbHSLczqY5nj/2VfoD1kdLMoq1Dp5yoiXtRZ5jCeqQsP9C363sZLJ5c9AJ/IeUMH19P3sgNg==
X-Received: by 2002:a05:6512:110e:b0:540:241d:d74e with SMTP id
 2adb3069b0e04-54090558390mr4985254e87.24.1734358509762; 
 Mon, 16 Dec 2024 06:15:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120b9f686sm868000e87.49.2024.12.16.06.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 06:15:08 -0800 (PST)
Date: Mon, 16 Dec 2024 16:15:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] drm/nouveau: remove drm_encoder_slave interface
Message-ID: <bpvyq543f4o3uusbjrivlymxeiqjcrnzb3atae2bp2vjleiggc@eolxb6jdep57>
References: <20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org>
 <Z2ASy3TQ4suupdvd@cassiopeiae>
 <fw7i3kusogrrsslb5sjdid27uqnwey5qa5yhyrfa677n4iqqhq@tfh5s6bmqgna>
 <20241216121651.GP32204@pendragon.ideasonboard.com>
 <Z2AgFHV2BaaZYGTx@cassiopeiae>
 <2p2rx6zmuph4bdwjork5aqp5n3xkho7cohapvgfijka64vbpop@nse4i55pkyy7>
 <Z2Arj_cLW-aY5cnD@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2Arj_cLW-aY5cnD@cassiopeiae>
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

On Mon, Dec 16, 2024 at 02:30:55PM +0100, Danilo Krummrich wrote:
> On Mon, Dec 16, 2024 at 02:58:59PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Dec 16, 2024 at 01:41:56PM +0100, Danilo Krummrich wrote:
> > > On Mon, Dec 16, 2024 at 02:16:51PM +0200, Laurent Pinchart wrote:
> > > > On Mon, Dec 16, 2024 at 02:11:41PM +0200, Dmitry Baryshkov wrote:
> > > > > On Mon, Dec 16, 2024 at 12:45:15PM +0100, Danilo Krummrich wrote:
> > > > > > On Sun, Dec 15, 2024 at 12:19:22PM +0200, Dmitry Baryshkov wrote:
> > > > > > > The nouveau driver is the only user of the drm_encoder_slave interface.
> > > > > > > Demote it from KMS helpers module to the nouveau driver itself, moving
> > > > > > > corresponding I2C encoders to be handled by nouveau driver too.
> > > > > > 
> > > > > > I understand nouveau is the only driver using this interface (and the
> > > > > > corresponding i2c encoders).
> > > > > > 
> > > > > > However, I'm not quite seeing the advantage of folding the interface (including
> > > > > > the two i2c drivers) into nouveau. I don't think this legacy interface does harm
> > > > > > the subsystem in any way / does prevent the subsystem from moving forward.
> > > > > > 
> > > > > > Can't we just keep it as it is?
> > > > > 
> > > > > Well, drm_encoder_slave is a part of the DRM KMS helpers module, so it
> > > > > take (a little bit) of space on every system. The nouveau situation
> > > > > isn't unique, other drivers (i915, ast) also incorporate the code for
> > > > > I2C backends. For the further discussion see the thread starting from
> > > > > Laurent's email ([1]).
> > > > > 
> > > > > [1] https://lore.kernel.org/all/20241117205426.GE12409@pendragon.ideasonboard.com/
> > > 
> > > The drm_encoder_slave code it's rather small, but I guess this can be used as
> > > argument for both, keeping it where it is and moving it.
> > > 
> > > If you want to move it to nouveau, I'm not going to object. But please fold the
> > > helper code, such that we aren't left with unused functions and unnecessary
> > > function pointer indirections through struct drm_encoder_slave_funcs.
> > 
> > This is more or less what I've done. Or would you prefer to keep the
> > wrapping functions that just execute the callback? I can change the
> > patchset accordingly.
> 
> No, I think it's good indeed -- st a first glance it looked like there's more to
> get rid of.
> 
> There are just a few more nits, I'll go ahead and add comments in the
> corresponding patches.
> 
> > 
> > > 
> > > > 
> > > > It's also a question of whether maintenance of this code based used by
> > > > the nouveau driver only should be the responsibility of the drm-misc
> > > > community or the nouveau driver maintainers.
> > > 
> > > Good question. It's common infrastructure; do we expect / require the last user
> > > of such infrastructure to take ownership?
> > 
> > Unfortunately it's more like 'the only one' :-( In other words, if we
> 
> I can't see a major difference between "last one" and "only one" in this
> context.

I was thinkinkg between "the last one" and "the only one, there will be
more in future". Excuse me.

> 
> > were expecting other users, there would not be such a move. But
> > hopefully all new drivers will use bridges infrastructure.
> 
> Agreed, but I don't think it answers my question.

Anyway, yes (in my humble opinion). it's usually easier to push bits of
infrasrucure towards the last user. Frequently it allows us to simplify
both the framework and the last user.

-- 
With best wishes
Dmitry
