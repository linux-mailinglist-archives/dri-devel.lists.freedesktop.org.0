Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC5B38C7CF
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 15:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373806F64D;
	Fri, 21 May 2021 13:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A296F64D;
 Fri, 21 May 2021 13:24:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF2E6613EC;
 Fri, 21 May 2021 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621603443;
 bh=H+w4vX7tF2iIyenYBI6epVpEEI7LBi6bD5GR38apUE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c/09CVsC3ymPZE2zRl7EjB2JhUbhtnnSz0bH9/rM+E1ZqHsFhv3v9rPGHWBn1lYGb
 NBKf/UV00ynYGjaJ6HEsEVqsUVVTP8GuirVCbIBEh3b9Q93/j7kSFh8qg8O5+Idkwc
 wQnj9z2i7Pwk8PqYMap4Zr8fnenhQjA/l6P3QCY5bQ/f811qZkKJTlj1wER0G7c6J9
 55iec6CeQKFTyF+aZzDZgRudVrVGKlEiviXXPmXVwO8iN2UoCOil+UpxbfOtb5zMxT
 b9cYWM0te5W7Cllt4Mk055vYYqNe8wWRs0GILnVZzUiHR/8GWl/7G8eEH9ijEQC+Sc
 I1FG3Bhii7NJw==
Date: Fri, 21 May 2021 18:53:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 02/13] dt-bindings: msm/dsi: Document Display Stream
 Compression (DSC) parameters
Message-ID: <YKe0b0hGN86E67iW@vkoul-mobl.Dlink>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-3-vkoul@kernel.org>
 <CAL_JsqJqPwkzxVgAfS9VgEXcY=ZH5LOaaxzoPDBzuDxOZ_OLjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJqPwkzxVgAfS9VgEXcY=ZH5LOaaxzoPDBzuDxOZ_OLjw@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21-05-21, 08:18, Rob Herring wrote:
> On Fri, May 21, 2021 at 7:50 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > DSC enables streams to be compressed before we send to panel. This
> > requires DSC enabled encoder and a panel to be present. So we add this
> > information in board DTS and find if DSC can be enabled and the
> > parameters required to configure DSC are added to binding document along
> > with example
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../devicetree/bindings/display/msm/dsi.txt       | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> 
> This is getting converted to schema. Hopefully, v17 will be it. Sigh.

I will update these on top, whenever that one gets merged... Any comments
on the parameters added here?

-- 
~Vinod
