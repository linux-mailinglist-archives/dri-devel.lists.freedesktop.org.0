Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD576F420
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1E010E113;
	Thu,  3 Aug 2023 20:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D911F10E113;
 Thu,  3 Aug 2023 20:44:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 625A58C1;
 Thu,  3 Aug 2023 22:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691095428;
 bh=LWzMEFgrC/PlVsgJUx4AkW/o073y3IloiFtC+MVjNYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=htZTfD0VD+z3VFAZGYDuiQdDo5xVWEbeOBhNwfGKc9LSk3PLbSVgkCtCkjM/j9BxB
 8E5WnhtCUzr1uXSi06u7uVCt7vB6c1QPpGZ7D0gtqlhSJXze9SobkS2nZtv1Qcnef/
 l1oHArjkLnBuI+DbSS/WNT7hvS4yOlhpzZ/ukXSM=
Date: Thu, 3 Aug 2023 23:44:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/4] drm/uapi: document the USB subconnector type
Message-ID: <20230803204459.GD27752@pendragon.ideasonboard.com>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-4-dmitry.baryshkov@linaro.org>
 <20230802185547.GC32500@pendragon.ideasonboard.com>
 <a32ce695-038f-0ef8-3584-5bd1ba528131@linaro.org>
 <20230802191351.GA1407@pendragon.ideasonboard.com>
 <DE2B4523-D16C-4AFC-8352-212B23548DD5@linaro.org>
 <b6oOVz2YMIG4hJDWhq9lTh6R2HYcrpRwHENhplig9KSQMD8dIjTgC5KdH1Ij3URgV2HESp67Ax7QUsByGjMLouvbs-5q7PiPRdLkgJz6Fwk=@emersion.fr>
 <ADjuOeqA6575DKutMPaR9mW9rLhm-wjLc4ruoUkNwImf-GB90FdwDB7v7y6LFdzVG3BC4R52A0RUtStK4_smmGYTUs3UPDOX4T4Zl2YHkxE=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ADjuOeqA6575DKutMPaR9mW9rLhm-wjLc4ruoUkNwImf-GB90FdwDB7v7y6LFdzVG3BC4R52A0RUtStK4_smmGYTUs3UPDOX4T4Zl2YHkxE=@emersion.fr>
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
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 03, 2023 at 03:31:16PM +0000, Simon Ser wrote:
> On Thursday, August 3rd, 2023 at 17:22, Simon Ser <contact@emersion.fr> wrote:
> 
> > The KMS docs describe "subconnector" to be defined as "downstream port" for DP.
> > Can USB-C (or USB) be seen as a DP downstream port?
> 
> To expand on this a bit: I'm wondering if we're mixing apples and
> oranges here. The current values of "subconnector" typically describe
> the lower-level protocol tunneled inside DP. For instance, VGA can be
> tunneled inside the DP cable when using DP → VGA adapter.

Doesn't this contradict the example use case you gave in your previous
e-mail, with wlroots stating "DP-3 via DVI-D" ? I understand that as DP
carried over a DVI-D physical connector, did I get it wrong ?

> However, in the USB-C case, DP itself is tunneled inside USB-C. And you
> might use a USB-C → DP adapter. So it's not really *sub*connector, it's
> more of a *super*connector, right?
> 
> I think [1] is somewhat related, since it also allows user-space to
> discover whether a connector uses USB-C. But relying on sysfs to figure
> this out isn't super optimal perhaps.
> 
> [1]: https://lore.kernel.org/dri-devel/20221108185004.2263578-1-wonchung@google.com/

-- 
Regards,

Laurent Pinchart
