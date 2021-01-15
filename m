Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92532F8866
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 23:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E849C89D49;
	Fri, 15 Jan 2021 22:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167FC89D49
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:25:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75BBA58B;
 Fri, 15 Jan 2021 23:25:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610749531;
 bh=1lWu0Wr18eUW/zYHXzAgkSrjIhn0kvFfK0ToUCV26Po=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wPYFR1F1oeXBM3AfAiWfORdKRonvEhoFCJ2W8mI7zi3niEjds2uDcDS/ZQ7/BnH0w
 G3ExpiXWanTfL/0inmcehRD35caFQB0XnFRdPoDu191joilntgVY/HtJR2x9BQjDh4
 P7kGpCCQrnuxsvokihfMRiIeHbxq9MeHFWmMTgFc=
Date: Sat, 16 Jan 2021 00:25:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: mxsfb: Convert binding to
 YAML
Message-ID: <YAIWSr46dqZpYAat@pendragon.ideasonboard.com>
References: <20201007012438.27970-2-laurent.pinchart@ideasonboard.com>
 <20210115075918.26407-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115075918.26407-1-martin.kepplinger@puri.sm>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Martin,

On Fri, Jan 15, 2021 at 08:59:18AM +0100, Martin Kepplinger wrote:
> hi Laurent,
> 
> Do you mind me adding a DT property in the old format now? If so, I'd
> appreciated an ack in this thread:
> https://lore.kernel.org/linux-arm-kernel/20201201134638.GA305734@bogon.m.sigxcpu.org/
> 
> If it causes extra work for you and want to resend your series soon, I'll
> gladly delay them for later.

I think the conversion ot YAML is ready. I've split it from the rest of
my series, and posted a v3, asking Rob to merge it. Would you mind
rebasing the addition of the new properties on top ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
