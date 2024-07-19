Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C565937181
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 02:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E511410E617;
	Fri, 19 Jul 2024 00:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="qEVlv8q3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F67910E617
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 00:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=P9Ra7plTI7oy9fda6nFx/pzNlclUgjQo9v/zk0cRKWc=; b=qEVlv8q3WJVX0Fc5
 qkBdlG6/Lu6/g80Otl39KcrVY4subps2AUWdUy7wG3nMrCW9AgabGbPB7O18Um3ZU2xgqa4khQF+i
 jtZZ4Z6KT0S/L3t/M0OmfbEOoLfMGXIoSE0JziRM/drMR6nnY9JVQ+pCtErgqiGb2bVxtXEdSj76H
 /FnkrDKIs+UUsniIHuGOtDwhmbsqIH1VoHF+yzb8rbbTR9U2BUfH6SFRBgkmZjnG6yMVfq97Eiu4z
 nRM4Qb+BbQxYf7RIlNcTJpbJ+zVLIP/8alXbkprZRZNkDN3NbCLSSdx3ZQqsfspqG0KVepj8h4x7E
 g68kTEhpvmRGH69jfw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1sUbUK-00CNfY-0I;
 Fri, 19 Jul 2024 00:28:44 +0000
Date: Fri, 19 Jul 2024 00:28:44 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: analogix: remove unused struct
 'bridge_init'
Message-ID: <ZpmzPIbDHabiIa9e@gallifrey>
References: <20240520125551.11534-1-linux@treblig.org>
 <g4nwb5cgcg2wff4qogzayhdrj3omneeusfjqmdupghy6zlji5m@kp55dmkbj6k3>
 <ZplVoj6xAAaMnisJ@gallifrey>
 <7csq4ml5hm53gqwrs4z6pc2vtokxsadzqmyc3yj57zcxz56766@asuk4vt2z43f>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <7csq4ml5hm53gqwrs4z6pc2vtokxsadzqmyc3yj57zcxz56766@asuk4vt2z43f>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 00:28:28 up 71 days, 11:42, 1 user, load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> On Thu, Jul 18, 2024 at 05:49:22PM GMT, Dr. David Alan Gilbert wrote:
> > * Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> > > On Mon, May 20, 2024 at 01:55:51PM +0100, linux@treblig.org wrote:
> > > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > > 
> > > > commit 6a1688ae8794 ("drm/bridge: ptn3460: Convert to I2C driver model")
> > > > has dropped all the users of the struct bridge_init from the
> > > > exynos_dp_core, while retaining unused structure definition.
> > > > Later on the driver was reworked and the definition migrated
> > > > to the analogix_dp driver. Remove unused struct bridge_init definition.
> > > > 
> > > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > > ---
> > > >  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
> > > >  1 file changed, 5 deletions(-)
> > > > 
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Hi Dmitry,
> >   Do you know who is likely to pick this one up?  I think all
> > my other drm patches have found their way into -next.
> 
> Applied and pushed.

Thanks!

Dave

> -- 
> With best wishes
> Dmitry
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
