Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BqzGHCjeGmGrgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:37:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A0393AE0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CB710E035;
	Tue, 27 Jan 2026 11:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J9iQD0mM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D6510E035
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:37:16 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-59dcdf60427so6576154e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 03:37:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769513835; cv=none;
 d=google.com; s=arc-20240605;
 b=Bl/qJJ//tkJhPy545M3Hc/bpquD8QmhHjyR4y7LS9W/7sXvA7TGRHTkmlgCwljID4z
 cTcWW34ApJI07xmRFfKh2rPDHEFEeYmSrtBqOMrMfeWLvGIg2V3mgwQUhtTktW7CPAt+
 uL08r92cJQY2OMQ85mgHWvVMB6M+3igZAcxcjtW1UCP4GwQ7q1owVNd5V7xl77kMtO50
 qbEBSmbkxeXTnqwXpBVmO1ZYGYFfNheseRikv+mxoSg7vevxwWRvKP5VM6R2D4jJE2pY
 jSDVWjc13mcgkrT6X9OgollQ9NwPTdvB/S1/x23IPRYiDM40mg/XWxqy7WAFPh2rAEev
 yJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Y98e89eykfl1m2pRlpPtKzy7ToW8zTQ9myJCqaoYz4M=;
 fh=sHpHDxycUVrqJCl/OBkGWXtX4CZL4z0rYyXZI+1fCaA=;
 b=MSbCcR7kqJEiEG0aQqcWu2fcZB9M4RWGogMDZPm79J/UfOJq+/8fZIFL9dg+xXv7jh
 pYPxK2MmD9VOu0UzuMf/WxPbr3OH1CnM2DS0YdCreYeHizAr8MDyj3P12vjbms07ekk2
 6nYLwqQm3PJAOg1b7ZYIR5JHs73iMzan2Qq2C1pmgcwJADXuNeuBlAID6bnB3W7bVyoj
 8gC+0APZcwE1mAoH7XoxoVPjIikUaZ1Qwbqg94qU6mG7NkbuhassA6av9jC9Gag0kDYr
 ASzJdAI2cbf6WSFCRt6xNKykp3fUHwnyt3s20rCWZsGuYarSzYNVuL+mj47u9SQYsmRq
 rDKw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769513835; x=1770118635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y98e89eykfl1m2pRlpPtKzy7ToW8zTQ9myJCqaoYz4M=;
 b=J9iQD0mMQH3WXSc7S4gnzX1be3t0tRm/wL2NXWhuf9PbYjM/kHZ1vxhz+CVYmgr/x0
 q5j+dfjGWYETsJwOlJyOgNs9I/LOKF0/dmxA3njLPpvGOqqe6O0bCbPCGbFyvVWQPUwQ
 2Cnam2kCoWV2qAj1r+VRbrnfI3SGJLpxcIfDja1nvp25o+Af06sf2jV9mXOA/jib8sD1
 yCc91Vju8UpSILtEn2Alo7TJwFGC2BxT3pVJWAKGWpuiL+zXG5UDM1Sxe/zGkN6n23yo
 7K0gMzXDesfBxSmaalWFE9kmPlrNLucFTRP5y4Dqt8WrgaYBnLoW98A8pjiLAjxKG+YW
 fItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769513835; x=1770118635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y98e89eykfl1m2pRlpPtKzy7ToW8zTQ9myJCqaoYz4M=;
 b=sN7Vg/YcjnYu7AYIagdVb/+4t3d6gzfHfBFg8x21PME9Z/85xs4JfVlP90xPUJHLvT
 canRs1esbTF/gVOlf6f9k20jcR7TXXU0GuW0xwGaBRjbsMC6bYQR97y2ly1MPKnGlylj
 F6/I3hgRQ+ZXEQM34fOewuRZsGHEYm+Oo/aw5EM1v4cLifXbBiuOTfV9LaL3MxSBJtvZ
 XpzogIE6cNBV14NcCcgxGlp8I+lAqXwjc1NIDLLyGjjf4hVmn9PhUk9BGqv07txLnCSz
 lmmeerHG8AX4zoWT4nmbknM8iFX30wILR5tAWncixwbGzHKqhp0iT/buGkiw7Fk3SzsQ
 i/Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEWvxztsecEeJ/RwMBGs7xcIX6Ij8R3CpWqMPtwJCkFXSRkbLE+twb2E4mhmm+ptmEmZutFJr04ys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPLeFJk8wW0+KZGXE5uagFMRpYcgsG9jwAWvgHo2xzt/1fvUtd
 2rRs55pHblIdxvxjwBz/MAKTG0aHGBm2fWGcuvDa3FMEK+fUACpZKkBMx9L4urGKGjVUmvKbieO
 XRVICsrC2O0z1nleX4L7ED6GrgKSz4U0=
X-Gm-Gg: AZuq6aJttTtM/bdLK1+fGB7B0+yEBk6vyuj4FWnPfSRXuhbGSw95wYpcdAg8IU4jRAn
 e1KxpfkKXN3QDmqW/A5DaArIbqL/dBSaDvqO/2Tc8/9DPjqXJX6/SyWR///9BQDbpWMMjxFgobZ
 tSKXjP5iN3K/WgxtI+51rU0iPvQ3wQx1oXjV0nCQJOunlu2PhJff5qXwAoDVmUCCS0OKmCYnAbt
 bLys9F7sXx0vZtBqJ/mVFkb7Qt8rMCALAiXay5uu7/722BCQSQYWDWJwuusjBpUhgHsi3/NaRBx
 eIeXyBpCHQOVF2fXM+ecs/Txxg==
X-Received: by 2002:ac2:4f13:0:b0:59d:d65a:7440 with SMTP id
 2adb3069b0e04-59e040263e9mr499024e87.29.1769513834658; Tue, 27 Jan 2026
 03:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20260120231930.2782444-1-festevam@gmail.com>
 <20260120231930.2782444-2-festevam@gmail.com>
 <e6ea0b8b-5f6a-4b37-83d5-3f3aa3e37e19@nxp.com>
In-Reply-To: <e6ea0b8b-5f6a-4b37-83d5-3f3aa3e37e19@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 27 Jan 2026 08:37:03 -0300
X-Gm-Features: AZwV_QjMRjUSDkLInDgdbVI2L4zjwU6c5dvSG7txEB7SHk3CLLCM17eLXHkk390
Message-ID: <CAOMZO5BePW+k2gKOsCbnHQ_xEKVMzZSj8gRzF9TPYRVUcbo+Hg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: fsl-ldb: Allow the termination
 resistor to be enabled
To: Liu Ying <victor.liu@nxp.com>
Cc: marek.vasut@mailbox.org, neil.armstrong@linaro.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, frank.li@nxp.com, 
 Fabio Estevam <festevam@nabladev.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:marek.vasut@mailbox.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:frank.li@nxp.com,m:festevam@nabladev.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[festevam@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: C7A0393AE0
X-Rspamd-Action: no action

Hi Liu Ying,

On Wed, Jan 21, 2026 at 5:23=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:
>
>
>
> On Tue, Jan 20, 2026 at 08:19:30PM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@nabladev.com>
> >
> > The LVDS Control Register (LVDS_CTRL) register has an HS_EN bit that al=
lows
> > the 100 Ohm termination resistor in the chip to be enabled.
> >
> > Add support to setting the HS_EN bit when the optional property
> > "nxp,enable-termination-resistor" is present.
> >
> > The motivation for introducing this property was a custom i.MX8MP board
> > that was showing visual artifacts. After enabling the 100 Ohm terminati=
on
> > resistor the LVDS signal quality improved causing the artifacts to
> > disappear.
> >
> > Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> > ---
> > Changes since v2:
> > - Rename variable to 'use_termination_resistor'. (Liu Ying)
> > - Remove clearing the LVDS_CTRL_HS_EN bit. (Liu Ying)
> > - Use dev->of_node. (Liu Ying)
> >
> >  drivers/gpu/drm/bridge/fsl-ldb.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
>
> Reviewed-by: Liu Ying <victor.liu@nxp.com>

Could you please help apply this series?
