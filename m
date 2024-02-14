Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529EA85535F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 20:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E1F10E2B7;
	Wed, 14 Feb 2024 19:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hKimQzPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5076C10E2B7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 19:43:27 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc25e12cc63so1059510276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 11:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707939806; x=1708544606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODDhCa7VcyKRlmjjRgSedNHpJ6Ae8gN8Lp2Kio/zqmw=;
 b=hKimQzPKGW1v3ZWA2NCsIbRkWubVru3k3BIWv5WVZhxG5Gf9X4Rz0ido/crKlN6Som
 Iikh7tXTinzjPawZwD/LxiIseBJMAkZSimP1ZFl6bg2X3GQAYKlIhkIt70GYDI6olhd4
 opY4GIbO3FQ2QJOHTXSX0FQZsAi8itpGM2dDsQy15rr/NX2Up3vxB/klttlOeghhqLIJ
 vWcn0nUGRtvLf+wKl7aY7QuA9v4oRpPxr3bSM4xLkQJhSRRNG1bEUCLtN/KhMVZm8m8z
 Krr0FoMJ7df3q9eBLFNfwq+IYFOxWqMCm6gDOlAPOYnbSKrKV3AeyDx7PvzxqaGmzXt5
 jTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707939806; x=1708544606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ODDhCa7VcyKRlmjjRgSedNHpJ6Ae8gN8Lp2Kio/zqmw=;
 b=Mc2e7kL/kSbm5RvUMxtRlCC9pguky4UlKgRdYeu8vCBPI2L4CC6fgab3Y+86JMuiOx
 93fdIlWM1F0DPYXi+15nirNCX9AIH8NmkWGSaO+geVLE6/60kiuUxYuh918KbGSVXo7E
 Ru2PWTysQFjKzpwBztE2xPnePwuVp14UNEM9RbNSc+WVRu47HLLuigW/IF9Jz8Ka+7+m
 3HmeoqfCS41IsX0Ui5exoeIFE7CABY18aRjt3+LQqeerUnTXDM+wDCnMoDIk1JsXvOs0
 lNx5+8BYBMEvyGGHeyXszPjIaFlJ9dfTQIh5xPVE45gV8cBSx2t/ghfe8Vzb/woToh/a
 /0Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDPFNe5FFL9O+dsVHtJIKQNVYFhPf1xTpYt+N6Ya0A/d4vdopW5sasm95KnSkHQLdgEhAz38nxXDQG6q492RXTtJtVJ6DADH8HwxPblp6o
X-Gm-Message-State: AOJu0YzSb7vAEsk9Wma64tap3dxNsFNWPWn5eM5Ij0lozwTn4ugk65zy
 rGvuiMzEQVa4cso8Bw439WiZnQaSnGR2bQed/fbKKvxIHSK1LCj2sWCzj2mUO9PSmaukHGU6AWO
 W6h723fs+O1MSBKPC26zgujCx368cKy0HdGuV5g==
X-Google-Smtp-Source: AGHT+IElv5wWE7Xn3AEqNXm0zLRlvAMweHJ1LUYu8e+PJ1JVGxQyeoIvtcVBRj15d7/Vnr7teXLLdeOkot8I/xKrA5E=
X-Received: by 2002:a05:6902:1547:b0:dcc:6894:4ac0 with SMTP id
 r7-20020a056902154700b00dcc68944ac0mr2727250ybu.20.1707939806385; Wed, 14 Feb
 2024 11:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-2-dmitry.baryshkov@linaro.org>
 <Zc0ITrmhQ8CWMXMq@intel.com> <Zc0KsfrI57XL7Efk@intel.com>
 <CAA8EJppv9xW1S6=eYr41Z0KG3AnsNs7+rLXWWCZ5TNetuqXuUw@mail.gmail.com>
 <Zc0W8TjigrryOPil@intel.com>
In-Reply-To: <Zc0W8TjigrryOPil@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 21:43:15 +0200
Message-ID: <CAA8EJpp0Mgwj8bp3c=+ggeC7JO=NmkwxTjkTdZ9hFwBo7--w8A@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] drm/atomic-helper: split not-scaling part of
 drm_atomic_helper_check_plane_state
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org, 
 Stephen Boyd <swboyd@chromium.org>
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

On Wed, 14 Feb 2024 at 21:39, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Feb 14, 2024 at 09:17:06PM +0200, Dmitry Baryshkov wrote:
> > On Wed, 14 Feb 2024 at 20:47, Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Wed, Feb 14, 2024 at 08:37:02PM +0200, Ville Syrj=C3=A4l=C3=A4 wro=
te:
> > > > On Thu, Sep 14, 2023 at 08:06:55AM +0300, Dmitry Baryshkov wrote:
> > > > > The helper drm_atomic_helper_check_plane_state() runs several che=
cks on
> > > > > plane src and dst rectangles, including the check whether require=
d
> > > > > scaling fits into the required margins. The msm driver would bene=
fit
> > > > > from having a function that does all these checks except the scal=
ing
> > > > > one. Split them into a new helper called
> > > > > drm_atomic_helper_check_plane_noscale().
> > > >
> > > > What's the point in eliminating a nop scaling check?
> > >
> > > Actually, what are you even doing in there? Are you saying that
> > > the hardware has absolutely no limits on how much it can scale
> > > in either direction?
> >
> > No, I'm just saying that the scaling ability depends on the rotation
> > and other plane properties. So I had to separate the basic plane
> > checks and the scaling check.
> > Basic (noscale) plane check source and destination rectangles, etc.
> > After that the driver identifies possible hardware pipe usage and
> > after that it can perform a scaling check.
>
> Hmm. We have sport of similar situation in i915 where we pick a scaler
> much later and so don't know the exact scaling limits at the time when
> we do this check. But we opted to pass the lower/upper bounds of the
> scaling limits instead. That will guarantee that at least completely
> illegal values are rejected as early as possible, and so we don't have
> to worry about running into them later on.

Ack, I'll follow this approach then.

--=20
With best wishes
Dmitry
