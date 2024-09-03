Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C94969B80
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D4D10E49C;
	Tue,  3 Sep 2024 11:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T/SRsrIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED3410E49C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:21:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B24E5C593C;
 Tue,  3 Sep 2024 11:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058BAC4CEC4;
 Tue,  3 Sep 2024 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725362503;
 bh=4FE56k1UVGjsv95hynE4fUeRYp7Znden7WBX7cfLRK4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=T/SRsrIycJO8yXAjB7vCNpF0WYVy/zDdQ/awA04cqEZd1XkHSUu8x0ypLs7CuXv5m
 IHBQB349TRqSroeBVlAVm+TBrnsOWTIDl4xxXXqE0czlA/bCwJV7IpzNsy70Dm7ViJ
 J8R9e5CmUSyF+1zZ1TD4h8DMTDGIREApLSKvmlBLNPo/G4iU4a2yLAtnkl+7ahWM7j
 28p9FFYMhglh9u0OOSHUJn+ZKof1Tt4pGupXbxXdPJ1+4TX0erE9qKghjvFmz3+aF6
 8eW3DgM+Vp4j4Nrm/+qum3MO29eg9D4HTp84zUMJoJyQbioEH0/7WVUmejg70z9oj3
 nUPUaEqvCbBfQ==
Date: Tue, 3 Sep 2024 13:21:40 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Doug Anderson <dianders@google.com>
cc: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>, 
 bentiss@kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linus.walleij@linaro.org, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Add Add elan-ekth6a12nay on the basis of
 elan-ekth6915
In-Reply-To: <nycvar.YFH.7.76.2408222059160.12664@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2409031321260.31206@cbobk.fhfr.pm>
References: <20240722073136.8123-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAD=FV=V8ivgWn5krEYzt5C4aiHMMK07mtMVwJaCeSQHG6ZscSg@mail.gmail.com>
 <nycvar.YFH.7.76.2408222059160.12664@cbobk.fhfr.pm>
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

On Thu, 22 Aug 2024, Jiri Kosina wrote:

> > Jiri / Ben,
> [ ... snip ... ]
> > I think this series is ready for you to merge at your leisure. If
> > there's anything blocking it then please yell. Thanks! :-)
> 
> Hmm, for some reason the only mentions of this series in my inbox are your 
> Reviewed-by: from Jun 10th, but nothing else whatsoever. Seems like some 
> spam filter really didn't like it.
> 
> I will pick it up.

Now in hid.git#for-6.12/elan.

Thanks,

-- 
Jiri Kosina
SUSE Labs

