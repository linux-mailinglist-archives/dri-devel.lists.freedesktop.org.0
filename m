Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88030559F36
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 19:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA09010E232;
	Fri, 24 Jun 2022 17:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1763210E232
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YImQrOCjpI1Pf4sniYSIQE78QxCL87Zrr2ZodYXVNnY=;
 b=fWqRVZB/Piz7vR6GT/pFrKYPjNsODm6Lt5B5pbB2athdA4enwZe3cwndBcrnJ57M6ATcujp0kKW2S
 F6fM7giyCy9Eh1wtt9/qJRhGx2q7M8tLUenHtxp2qOh/9dtEarCJJcJCpYgFrHU3kLAUqx6xlAk2hW
 70PpcGcRobBymntLPaACuMV0fd5rBXAsNsmR3OMe5ki6m1TsvkwaAPK8HgZfdjLmdpC6brj1laBfET
 IqcPFOkzGb1JR0K7XH4FVH5btEvWwMgBg2tNiNr8kWwTgCqfciZjWE6pHIncd9tFNOaIoAD22KMoN+
 RfT6/ejTF77vupkcDkBHddZGHkF8W7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YImQrOCjpI1Pf4sniYSIQE78QxCL87Zrr2ZodYXVNnY=;
 b=0aamlKaxWOlroxmiYOuL5/s5MGru3Ba31/MhPmFhmYdTmN8Rn2J7h0+f9Zgt2oxQkHzfCsZIhEUVg
 8SIHF1ECA==
X-HalOne-Cookie: 96a8abf5ab4b9e66dba2a4c7a0ea66e15d8eb3a2
X-HalOne-ID: 9728a25b-f3e2-11ec-a916-d0431ea8a290
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 9728a25b-f3e2-11ec-a916-d0431ea8a290;
 Fri, 24 Jun 2022 17:25:06 +0000 (UTC)
Date: Fri, 24 Jun 2022 19:25:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/ingenic: Use resource_size function on resource object
Message-ID: <YrXzccaCsBpPHTYw@ravnborg.org>
References: <20220624013159.88646-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624013159.88646-1-jiapeng.chong@linux.alibaba.com>
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
Cc: paul@crapouillou.net, airlied@linux.ie, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiapeng,

On Fri, Jun 24, 2022 at 09:31:59AM +0800, Jiapeng Chong wrote:
> This was found by coccicheck:
> 
> ./drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1149:35-38: WARNING: Suspicious code. resource_size is maybe missing with res.
> 
Nice one, now I have to go back and fix my code as well.

> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
