Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E979878F0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 20:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A4610EBCA;
	Thu, 26 Sep 2024 18:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k+HIgG9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2901010EBCA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 18:11:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D0535C59E0;
 Thu, 26 Sep 2024 18:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8894EC4CEC5;
 Thu, 26 Sep 2024 18:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727374297;
 bh=56mzS41ce5/9+IUEXD+XVGSW4V+p6gXfuozlaZk9EHA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=k+HIgG9Qa0Js8se64sSEDRTVXfWAaGsFccLLDAutjuscC/+5Z7Z/62y7bHexBCgDh
 SB3wcRdE3yapuwAH/uMUeR/oGJt/tnwwDYy6YdcEVEE61jDZDG5kYDtADL0TX7MYML
 vohhLGr3l640oa6DJDYogDw4bxr420CfPgZW93FkuO1ec8HroIHp8VSGRg4up7E3Gf
 kjp90cba8zRUhtUFQe8WrMCycGPIm7tJoCIaHQhJEW3sj6FOLk5k28ZAc3nn0KyWUu
 9uScWewce/j3ShmjOcH2DuaJ/PrqnGvC8XtYTfn+Z5xn+JJj6vgmcVme1Soh8ZYW3K
 IN3deguGAwolQ==
Date: Thu, 26 Sep 2024 20:11:34 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>, 
 "bentiss@kernel.org" <bentiss@kernel.org>
cc: "airlied@gmail.com" <airlied@gmail.com>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, 
 Orlando Chamberlain <orlandoch.dev@gmail.com>, 
 Kerem Karabay <kekrby@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
In-Reply-To: <MA0P287MB0217799EF124DAB1EB9941ACB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
Message-ID: <nycvar.YFH.7.76.2409262009240.31206@cbobk.fhfr.pm>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
 <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409262001520.31206@cbobk.fhfr.pm>
 <MA0P287MB0217799EF124DAB1EB9941ACB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 26 Sep 2024, Aditya Garg wrote:

> >> It has been more than a month since I've sent this patch set and I
> >> haven't got a clear yes or not for the same. I understand maintainers
> >> are busy people, but I'd really appreciate if I get some response for
> >> this series of patches from the HID and DRM maintainers.
> > 
> > Just to reiterate -- I am waiting for Ack from the DRM people and will
> > then take it through hid.git.
> 
> So I should assume the HID portion is fit to be merged now?

hid-appletb-* I have gone through, and it looks all good to me.

Benjamin, could you please explicitly provide your Ack for the multitouch 
changes?

-- 
Jiri Kosina
SUSE Labs

