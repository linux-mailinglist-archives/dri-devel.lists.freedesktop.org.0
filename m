Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F9A95BE9C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 21:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A4610E0FB;
	Thu, 22 Aug 2024 19:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r+8XslC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C5610E0FB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 19:00:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6CEEECE0FE6;
 Thu, 22 Aug 2024 19:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39636C32782;
 Thu, 22 Aug 2024 19:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724353250;
 bh=Ui017gkewD7xFMBxW+cEVmQbEQy8O8gCGcb0gCACXog=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=r+8XslC5/W4OqDFPYi73HsDjFSS0ECICdazXPhvYBpslrDvVROAT47eKZ8b/1LcCn
 60ZytwM2oGeiL6VWRfDcco6/ZiqdwWbYtEY9i6uwbK7dqbZ56VE0nu1do7uT8N8rTn
 gJ9dXcySvQj5f31NUD7ggPzjvvxgm2WMzTssYEflgfDqLhRl+P3ILWn2FVDwK2LJha
 ZSOZfcfG69Y72ow/7jGEfW/TnTYOFfD/G2+ecdz7W2P68F/QTmjAqShTL9XSf1GXHp
 eTpH42U0GKUly/tR5S9k/0I7RNLnGLcfFcwOIjxCFbzKDwn1VOSIO/edjtXsElzqKn
 fkKTp9WxNwAuA==
Date: Thu, 22 Aug 2024 21:00:48 +0200 (CEST)
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
In-Reply-To: <CAD=FV=V8ivgWn5krEYzt5C4aiHMMK07mtMVwJaCeSQHG6ZscSg@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2408222059160.12664@cbobk.fhfr.pm>
References: <20240722073136.8123-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAD=FV=V8ivgWn5krEYzt5C4aiHMMK07mtMVwJaCeSQHG6ZscSg@mail.gmail.com>
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

On Thu, 22 Aug 2024, Doug Anderson wrote:

> Jiri / Ben,
[ ... snip ... ]
> I think this series is ready for you to merge at your leisure. If
> there's anything blocking it then please yell. Thanks! :-)

Hmm, for some reason the only mentions of this series in my inbox are your 
Reviewed-by: from Jun 10th, but nothing else whatsoever. Seems like some 
spam filter really didn't like it.

I will pick it up.

-- 
Jiri Kosina
SUSE Labs

