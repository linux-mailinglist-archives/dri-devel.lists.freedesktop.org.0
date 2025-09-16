Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDDEB594D6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061ED10E70E;
	Tue, 16 Sep 2025 11:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="LstTl47c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D84410E70E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:11:27 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-816ac9f9507so723448385a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1758021086; x=1758625886;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XVfBCYDc6vHJn2JN7q6wh1lp0mW1P6Vv736KIN9xaUA=;
 b=LstTl47cDwyQnsgr8BomD/cZMTRXNRP+SOhMFdk/cGOousMJ0Miab0CqVkj8QPKNsm
 EHGrM16aNa0w7LZuCQEHjGGSq1gUpaCFR7CbV/Mv+YyCjwSKMgJwGJaCL0dLewrj2Zmc
 3byFHuxO/6v2aU/eI+AEC/aykGqcOj5udqwWMxiDEuzDqrdqnjwxx6FCY1to0dal+SVy
 E08uxBgBFAlzfqI0SLen0vz6mxSiMifFBYTrxm7X+p1MhvT9+ylr2ozGri38osXl93j2
 9nVaNwf9SsuCoMupSP9q7Imm9k+rWPQtrLwUnbsOq5i4fZTr19r5UNZznXzEjPRPW3mn
 vkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758021086; x=1758625886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XVfBCYDc6vHJn2JN7q6wh1lp0mW1P6Vv736KIN9xaUA=;
 b=eTju6YZ+lAeQiL7Z8nWgwiqSQ1Vte/cBtmu0q98bIXqY493NAwnQ+9fBjtMYP/5uDv
 TAh3z6Wq0ICwn/P1stesDYKgyFjia0MAkeBqISgx7er0w5TYsU2LuRQGdTFPbUWOp92h
 8aYGH2hIKHdTf8hBxORWyA/03R0Gu2FZYHKKsFum9Q5GpT2QGfa8PEYcURgPu+/swLNy
 pffUNdq5D3pgISjtbc0qoGjOpmc2cUKQGDEC9GEi0tF9/Zln6rPfEk7rnOBO6WbOgkUO
 zyD9LkmvOTkSIrB/8egQV/K1efbluUbDBY6Nh+L1Ku5k31hDieDeKh8Vgmoy6YSnJRQ6
 ukZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHGSZeZKlU8+B2EwZ4ECbXhu41/rMV8FWWV70IDUa7w9ZW1UblKaH7QWRpxyg87npFLSvmf9kIW7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx42LAgpQyUr/umLgvwDzb//eG7HUMriDPsM1WmJEEOXTkkQu1P
 nUm0JM4a5EQfRhQHWCgwO43m9NOwoDAGQrvw4vGqPQJ4OZPya+I0N5mTEyURRxhdpbd2/NM09xr
 I0n0wB2EnkJRCKfiybf8lg/8ZVH4F1K4xYGlzQpLAEA==
X-Gm-Gg: ASbGncuSUYiUQXulOAdOVUpjawzWb5LPgVVtBuTa0AJQ5/i/jNil3Fm8zYayZQrKfZu
 fgSaKv114TeCdHk+9OSJWd8prINHs8EISOvfm8/tu2nZmJubjNzhUFjTuEWfl690YDFMGlHyCvV
 /cpYnRKwIh1MtaPpYoJHL6ri7exauF3wCvT/6ksIY32Zz4jhs3GlKvp669ibaSafF2UYTqb9dby
 0K4hstBkh2pfSV2Byg6JLxRSyq/5SDCms9ElsAvtQ==
X-Google-Smtp-Source: AGHT+IEL1T3KvRWOFfQstWElGAdIAjRoB+E05XEoc0FnrJhp5okYLLSUniUcMrrbndiOPnGO8Ds0AnikmQ6t5FqGKiE=
X-Received: by 2002:a05:622a:1481:b0:4b0:6a6c:c8cf with SMTP id
 d75a77b69052e-4b7b444e0d7mr18124561cf.15.1758021086597; Tue, 16 Sep 2025
 04:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
 <aMMDxIWN9TadgVyw@xpredator>
 <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
 <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
 <20250916-piquant-jerboa-of-completion-87b80d@houat>
 <CAPj87rMuwvir_aDReT1ou-BNs3w9coUG6MPmCnGAeg5rQ97rCQ@mail.gmail.com>
 <CAPj87rPRG=7qPp3QMXf_6FP82-gWdgWpXdHmwZjHKrnU-PdQ0g@mail.gmail.com>
 <b6sosuofgvanq7hjj6lfev4ifu7muhhd45lncdu3m3r42rqwaq@tgxtumlxhtkx>
In-Reply-To: <b6sosuofgvanq7hjj6lfev4ifu7muhhd45lncdu3m3r42rqwaq@tgxtumlxhtkx>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 16 Sep 2025 12:11:15 +0100
X-Gm-Features: AS18NWCLpcsS_oQwueA82SisNK0eGi7Phb9egwXqrQMVqWIpRQ-unnU7z8HbETY
Message-ID: <CAPj87rOUgY+WEP73hL8kWhgbXHG7krvraQb6n__tC=vr5y0=Cg@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Marius Vlad <marius.vlad@collabora.com>,
 dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com, andri@yngvason.is, 
 sebastian.wick@redhat.com, daniel.stone@collabora.com, 
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch, 
 harry.wentland@amd.com, christian.koenig@amd.com, derek.foreman@collabora.com
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

On Tue, 16 Sept 2025 at 11:57, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Tue, Sep 16, 2025 at 11:48:39AM +0100, Daniel Stone wrote:
> > So yeah, I see it as the same as the input situation: you _can_ do the
> > basics with raw evdev, but unless you're very special, you should use
> > libinput. Equally for output, when you go past what e.g. Plymouth
> > would require, use libdisplay-info to parse the EDID, rather than
> > trying to make the kernel try to turn the unhinged madness of EDID
> > into something userspace can reason about.
>
> We do a lot of EDID parsing in the kernel, including HDMI VSDB and
> Y420CMDB parsing. Do we need anything else for this feature?

I'm slightly confused as to what you're saying here. Are you saying
that it's OK for the kernel to expose connector properties for
userspace to see which colour properties
(model/range/depth/subsampling) are OK and control what is actually
used, but your hard line is that the kernel must do an intersection
between the sink EDID and the encoder/connector capabilities to filter
the list to what it believes to be achievable?

Cheers,
Daniel
