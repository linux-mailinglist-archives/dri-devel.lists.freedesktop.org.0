Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2D376F42E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F98910E218;
	Thu,  3 Aug 2023 20:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 19499 seconds by postgrey-1.36 at gabe;
 Thu, 03 Aug 2023 20:47:21 UTC
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BF810E215;
 Thu,  3 Aug 2023 20:47:21 +0000 (UTC)
Date: Thu, 03 Aug 2023 20:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1691095638; x=1691354838;
 bh=fDIIkd6MbiuxDhWddMCvr1sTep0tBPtwcVzo2Vbd5+0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Lhk+WfXL0POi8w3MDDk+N+KGTUQcqdjQrn8XFERNWJUn8+EqTEyoNj+1qgvqiHmOr
 Q5Tl3f+NphgZlfvdUEs3rlX2K+t5yLNDKpw2m2yb8XcIDywXmMU5JlIjo/EOVjVwk3
 /8Pw89zebfKZPWJnGBWTPj8n6ehMLjGzBa5TfKCuxbCB5UFIKXLMhODfAMIzrHGNlx
 f5CLF4nA+oe7Opl9vFCt3TO4NhbpoyMvy6h/TygIuDupNwmdq4N43n9iwtQKfokHhL
 k3qeU1FwqxumT6Wu3s3k8cG8zwusNH+qviuuE/+Yi3Osu7HI0ZspzIoUcdXH0JUhdC
 /R6eiiIgSZyHQ==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/4] drm/uapi: document the USB subconnector type
Message-ID: <TR8IBdXbd0C4U8Z4zf9ZLEH66QMutWs0QAAkPnMlKiOvgEZCk6AfEIPcIfRC555XWs8eSzeCCCW9R-3NwxZg6hDhPvPseAgAULAdUQ6epDA=@emersion.fr>
In-Reply-To: <20230803204459.GD27752@pendragon.ideasonboard.com>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-4-dmitry.baryshkov@linaro.org>
 <20230802185547.GC32500@pendragon.ideasonboard.com>
 <a32ce695-038f-0ef8-3584-5bd1ba528131@linaro.org>
 <20230802191351.GA1407@pendragon.ideasonboard.com>
 <DE2B4523-D16C-4AFC-8352-212B23548DD5@linaro.org>
 <b6oOVz2YMIG4hJDWhq9lTh6R2HYcrpRwHENhplig9KSQMD8dIjTgC5KdH1Ij3URgV2HESp67Ax7QUsByGjMLouvbs-5q7PiPRdLkgJz6Fwk=@emersion.fr>
 <ADjuOeqA6575DKutMPaR9mW9rLhm-wjLc4ruoUkNwImf-GB90FdwDB7v7y6LFdzVG3BC4R52A0RUtStK4_smmGYTUs3UPDOX4T4Zl2YHkxE=@emersion.fr>
 <20230803204459.GD27752@pendragon.ideasonboard.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, August 3rd, 2023 at 22:44, Laurent Pinchart <laurent.pinchart@=
ideasonboard.com> wrote:

> On Thu, Aug 03, 2023 at 03:31:16PM +0000, Simon Ser wrote:
>=20
> > On Thursday, August 3rd, 2023 at 17:22, Simon Ser contact@emersion.fr w=
rote:
> >=20
> > > The KMS docs describe "subconnector" to be defined as "downstream por=
t" for DP.
> > > Can USB-C (or USB) be seen as a DP downstream port?
> >=20
> > To expand on this a bit: I'm wondering if we're mixing apples and
> > oranges here. The current values of "subconnector" typically describe
> > the lower-level protocol tunneled inside DP. For instance, VGA can be
> > tunneled inside the DP cable when using DP =E2=86=92 VGA adapter.
>=20
> Doesn't this contradict the example use case you gave in your previous
> e-mail, with wlroots stating "DP-3 via DVI-D" ? I understand that as DP
> carried over a DVI-D physical connector, did I get it wrong ?

No, this is DVI carried over DP. DP cannot be carried over VGA/DVI/HDMI,
but VGA/DVI/HDMI can be carried over DP.
