Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7E8669B52
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1E110EA11;
	Fri, 13 Jan 2023 15:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E1E10EA11
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 15:03:07 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6FB386602DD6;
 Fri, 13 Jan 2023 15:03:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673622186;
 bh=fogr+uZTaVcUpklPH0FPHlfhwcndHj9i6ZT507O7UGQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VeGyHLZ/upyjgtilOjqJrXGwTdYKAMuw+7A7dyr+7WeRnHKKKpAPwDtpFEAC55HqS
 naqUxpBvDoZ9P9ht3i6t3ZEXKk5b9WmLI9n/8tytAi6e8cFgsQfoet7FFZ4p0OqE0J
 vUChAcB4qNG4RvZ8bnHQLBdHdeYjUyeB6fXdfFODBdughAm9Cd2057qXWs2e1iJGnF
 xIUZvk6pgWLB+yzlU8kIwuw4w2/oFNWSaoIHjRVBInek65tEXmjA0M7ocnqlaqzQ/W
 NiI+EqzJ9xwww7PUrDKKLn+MczaEkJQAHb3jFJTcOUCWabf63+uyqaGLibxHwZXdvj
 G0D0odut2rJbQ==
Date: Fri, 13 Jan 2023 10:02:40 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yunfei Dong =?utf-8?B?KOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Subject: Re: [PATCH v7, 5/7] media: mediatek: vcodec: Different codec using
 different capture format
Message-ID: <20230113150240.6tqi3kc7cdu3xr65@notapiano>
References: <20220518123004.18286-1-yunfei.dong@mediatek.com>
 <20220518123004.18286-6-yunfei.dong@mediatek.com>
 <20230112205825.wb5qcqhh5kwvyi3y@notapiano>
 <2fe7132f2fcc3fb4724a34c3c4a918b821c845a3.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fe7132f2fcc3fb4724a34c3c4a918b821c845a3.camel@mediatek.com>
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
Cc: Andrew-CT Chen =?utf-8?B?KOmZs+aZuui/qik=?= <Andrew-CT.Chen@mediatek.com>,
 "stevecho@chromium.org" <stevecho@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu =?utf-8?B?KOWNouWwj+WLhyk=?= <Xiaoyong.Lu@mediatek.com>,
 Irui Wang =?utf-8?B?KOeOi+eRnik=?= <Irui.Wang@mediatek.com>,
 George Sun =?utf-8?B?KOWtmeaelyk=?= <George.Sun@mediatek.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Tiffany Lin =?utf-8?B?KOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "tfiga@google.com" <tfiga@google.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "acourbot@chromium.org" <acourbot@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 03:25:46AM +0000, Yunfei Dong (董云飞) wrote:
> Hi Nicolas,
> 
> Thanks for your information.
> On Thu, 2023-01-12 at 15:58 -0500, Nícolas F. R. A. Prado wrote:
> > On Wed, May 18, 2022 at 08:30:02PM +0800, Yunfei Dong wrote:
> > > Vp8 need to use MM21, but vp9 and h264 need to use HyFbc mode
> > > for mt8195. Vp8/vp9/h264 use the same MM21 format for mt8192.
> > 
> > Hi Yunfei,
> > 
> > why do VP9 and H264 need to use HyFbc (is this the same as MT21C?)
> > mode on
> > MT8195? The SCP firmware on linux-firmware for MT8195 [1] only has
> > MM21
> > available and based on my testing it works just fine. And contrary to
> > what the
> > commit message states this logic is also being applied to MT8192,
> > preventing it
> > to use MM21 when there are more than one format available.
> > 
> The kernel driver not support dynamic switch mt21c and mm21. The driver
> flow as below:
> 1: If there are mt21c and mm21: h264/vp9/av1 will use mt21c(vp8 use
> mm21 always);
> 2: If there are only mt21c or mm21 will use this format only.
> 
> But the scp.img is changed to support mt21c and mm21, the kernel driver
> will use mt21c. Or force the kernel driver only support mm21(small
> effort).
> 
> But the best solution is changed the driver to dynamic switch mt21c and
> mm21, need to discuss the enum and set format flow(middle effort).

Agreed. The aim should be to get this dynamic format switching implemented in
the driver so that the firmware can expose both formats and userspace can
select any of them to use.

However, as you said that solution will take more effort, so in the meantime,
given that currently only mm21 is supported by gstreamer, I think forcing the
kernel driver to always select mm21 makes the most sense right now. That way it
doesn't matter whether the firmware has mm21 or mm21+mt21c, decoding will keep
working with gstreamer using mm21.

Thanks,
Nícolas
