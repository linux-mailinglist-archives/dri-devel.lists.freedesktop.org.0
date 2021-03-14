Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1BF33A874
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 23:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2C689A98;
	Sun, 14 Mar 2021 22:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3EE89A98
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 22:12:55 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4DzDM52nMVz77;
 Sun, 14 Mar 2021 23:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1615759971; bh=z/wZYhYKwga+kEX//9REJYbUOgRuaiWaN10WwRJ8dFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HqlCwzxvM4E2IujlpOXABaUeT85NM8/knGJmy/8Gvt9EkIEChk2BVux9wf09SCBRn
 yQPpibsKrmoWVPJLSlT1K0SaHHpyTG2yDOyV/nrN7AP1fCcVJvcFftl7h9m9LBHqx/
 /HxuxooscE5NW1ZA9VWebD0rTyULnySwyu48FUHgR6ak8S4ex5morpEL/krfOGZ9Fr
 IipC/pZa5CED+C0oW3dQdYF5xvSkJjPUly5D4fpH5Xj63HjohZZ9PEmwKybyyapyIL
 QLe3YJABNUdbEnD3Ni3/lKmD/xC355OXODOcJuYHUzoL9qehu7fPjV/JEiOQq40XyG
 RpC+KMLlNJ32A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Sun, 14 Mar 2021 23:11:30 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v15 2/2] drm/tegra: dc: Extend debug stats with total
 number of events
Message-ID: <20210314221130.GB2733@qmqm.qmqm.pl>
References: <20210311172255.25213-1-digetx@gmail.com>
 <20210311172255.25213-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311172255.25213-3-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 08:22:55PM +0300, Dmitry Osipenko wrote:
> It's useful to know the total number of underflow events and currently
> the debug stats are getting reset each time CRTC is being disabled. Let's
> account the overall number of events that doesn't get a reset.
[...]

Looks good. It seems independent from the other patch.

Reviewed-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
