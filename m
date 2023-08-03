Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763B76EE29
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 17:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE31A10E619;
	Thu,  3 Aug 2023 15:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD52510E61A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 15:31:25 +0000 (UTC)
Date: Thu, 03 Aug 2023 15:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1691076683; x=1691335883;
 bh=g6RwxWabpbF2BP/ZwpgNOS6SF1FbztL0pxDaVUDDMX8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=YMYeMmkP7B8lXECs60rEbVbPbNAGIdW6SdLyouTIqv6YmJLK/wBVabMePZZWt8edL
 tqXIWtuZ7vioLbjwLXcgFjbWM02PrqkJF2fGQO4rokHVj39qc1SvO6YohCdX7c3Krp
 e0aVaNOLoLcb8QXIfsQWroTr0+23jw6sjuu1NbkwWyQu+6WtIhkr9rI2q6gwuhaDp1
 luDVKn0C0Y/dYhsD/ICO3vD5U25dPP2o+cvWajuYNQvS6jPrJyH70lxyN/dxumG/IL
 HEhgXQCuUFzyqiR3hlEAQMNM1ynJqpLns2vOigYUtmbwHs3P5OkxjjRVuPKrI+yVp0
 rvyl8tRaTdZsg==
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/4] drm/uapi: document the USB subconnector type
Message-ID: <ADjuOeqA6575DKutMPaR9mW9rLhm-wjLc4ruoUkNwImf-GB90FdwDB7v7y6LFdzVG3BC4R52A0RUtStK4_smmGYTUs3UPDOX4T4Zl2YHkxE=@emersion.fr>
In-Reply-To: <b6oOVz2YMIG4hJDWhq9lTh6R2HYcrpRwHENhplig9KSQMD8dIjTgC5KdH1Ij3URgV2HESp67Ax7QUsByGjMLouvbs-5q7PiPRdLkgJz6Fwk=@emersion.fr>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-4-dmitry.baryshkov@linaro.org>
 <20230802185547.GC32500@pendragon.ideasonboard.com>
 <a32ce695-038f-0ef8-3584-5bd1ba528131@linaro.org>
 <20230802191351.GA1407@pendragon.ideasonboard.com>
 <DE2B4523-D16C-4AFC-8352-212B23548DD5@linaro.org>
 <b6oOVz2YMIG4hJDWhq9lTh6R2HYcrpRwHENhplig9KSQMD8dIjTgC5KdH1Ij3URgV2HESp67Ax7QUsByGjMLouvbs-5q7PiPRdLkgJz6Fwk=@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, August 3rd, 2023 at 17:22, Simon Ser <contact@emersion.fr> wro=
te:

> The KMS docs describe "subconnector" to be defined as "downstream port" f=
or DP.
> Can USB-C (or USB) be seen as a DP downstream port?

To expand on this a bit: I'm wondering if we're mixing apples and
oranges here. The current values of "subconnector" typically describe
the lower-level protocol tunneled inside DP. For instance, VGA can be
tunneled inside the DP cable when using DP =E2=86=92 VGA adapter.

However, in the USB-C case, DP itself is tunneled inside USB-C. And you
might use a USB-C =E2=86=92 DP adapter. So it's not really *sub*connector, =
it's
more of a *super*connector, right?

I think [1] is somewhat related, since it also allows user-space to
discover whether a connector uses USB-C. But relying on sysfs to figure
this out isn't super optimal perhaps.

[1]: https://lore.kernel.org/dri-devel/20221108185004.2263578-1-wonchung@go=
ogle.com/
