Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A77453FE0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 06:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1CF6E1D2;
	Wed, 17 Nov 2021 05:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26366E1D2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 05:10:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B13C66187F;
 Wed, 17 Nov 2021 05:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637125842;
 bh=YAWYlbsffL0+V+TDNFAwJ7WXF7SeHKdpZnj811euHtI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=npGFUrADa2IMYN9GEaNkt/aEHsR/P5aDG3yl9cwUaZRsYC12H6s0oCpLfHvR3vq90
 mc/X4mEbR2mUJh1N8GVdTC5UtZO5bpCjmIIKAsBIiDI/d7saXY9ooU4tVPNrl8+Gvi
 iV0GGiALIL1N2U2v3Gy9HFy9DwsUZfGdUdpu2KbkbMBfJj5zGQV3ivofpkUr25kYxf
 yfp/S/POujotodSlAESXx0tWoAGY9KwlU6CLbjUzIN+kWkAmNrNbSmjFyuKISZA9Ju
 SiWhZcxOzcZx1XOIX7PcyZjsSqUvq1VHJ3xKKwPr78vMkaqrjwvUzOL6GgXQ+NNoic
 8ZQaEi9rsg3aA==
Date: Wed, 17 Nov 2021 10:40:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] lontium-lt9611: check a different register bit for HDMI
 sensing
Message-ID: <YZSOzhygBRli1DVh@matsya>
References: <20211117020724.2647769-1-pcc@google.com>
 <CALAqxLWn67emfDPcMGrjVag0zCCrNF2=rEiHKQgr2eJ8AotCPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLWn67emfDPcMGrjVag0zCCrNF2=rEiHKQgr2eJ8AotCPg@mail.gmail.com>
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
Cc: Anibal Limon <anibal.limon@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Peter Collingbourne <pcc@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On 16-11-21, 20:47, John Stultz wrote:
> On Tue, Nov 16, 2021 at 6:07 PM Peter Collingbourne <pcc@google.com> wrote:
> >
> > It has been observed that with certain monitors such as the HP Z27n,
> > the register 0x825e reads a value of 0x79 when the HDMI cable is
> > connected and 0x78 when it is disconnected, i.e. bit 0 appears
> > to correspond to the HDMI connection status and bit 2 is never
> > set. Therefore, change the driver to check bit 0 instead of bit 2.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > Link: https://linux-review.googlesource.com/id/I7e76411127e1ce4988a3f6d0c8ba5f1c3d880c23
> > ---
> > N.B. I don't currently have easy access to a monitor that works
> > with the existing driver, so it would be great if people with
> > monitors that currently work could test this patch to make sure
> > that it doesn't introduce any regressions. Otherwise I will change
> > it to check both bits.
> 
> So very interesting! I gave this a spin with my monitors and it works fine.
> 
> Vinod: Can you check the datasheet to see if the wrong bit is being used here?

Well the document I have does not list this register :(

I have asked Lontium folks about this register description, will update
if I hear back. Meanwhile we can get this patch tested with different
monitors.

Thanks
-- 
~Vinod
