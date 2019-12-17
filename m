Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E243122CDD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 14:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F2B6E9E1;
	Tue, 17 Dec 2019 13:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629FE6E9E1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 13:27:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d73so2943605wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 05:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/Bd+h7ZrKit8ez5CAduwJAFXfIeURWl0IveWHe0NC4o=;
 b=f8h4vQvYKcHoQLkRx0Xxf9cV8LBGmBHdy18kZI6FoXE/7h2k0SCzQbnO9tdyhqvz90
 w6tRV/QVpmU7K45XdCVaQjR9LY5yGxdqoPwKLzFRS+7uJr+/lc9GROpp+zbjsmTUVgWZ
 JRN7QiWHcGwHUx45kiWmHxV01NcHFak9N7AFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/Bd+h7ZrKit8ez5CAduwJAFXfIeURWl0IveWHe0NC4o=;
 b=XMmAndy9f0D3l/wLeeId5cqoZ/7DqHBpn7ouQ8+vlEa5fFgV7WTpwkzCvsMPeo4xos
 EdTnCcdqf8KpssJK4jIXQ4cefAJJCqwGdelqcvzay1GW0eBLVRNquZtxHZ5iC+XAqmXY
 BuBXUq/lTZcfmmcxrvhmymAz/glYbiuT1nJ9M3IBlvjEBGLsNloIeXZSrFrAYn9b8+L4
 hWQpalJhnuJwzABtoFQRar30JxYEi4YRykJxrdPcIucuaW6vDLvTGSWOBIuRvQ0YYIfc
 lwcRjxj7BNXccKDBdJLu2RGyxQKrQACsyaL2D0Bp4V5mkW/FxTCkAvZX+KxXAPSRENYw
 uvGA==
X-Gm-Message-State: APjAAAWL/cUSbaLoHsZCA116i8j/LrKJJFu1Bo2MQtWGsCzKdGe5zH5K
 UtBK74g8/3f6c5PvqXDUA6MxUQ==
X-Google-Smtp-Source: APXvYqzAXa4FIbKFVGUbluEKhURL5JUn5mHz1NEdoT/f8KuzH/frsjKQ5YQI2xo1VcIYl8bx50OXWA==
X-Received: by 2002:a05:600c:21c6:: with SMTP id
 x6mr5326705wmj.177.1576589255099; 
 Tue, 17 Dec 2019 05:27:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id b10sm25832938wrt.90.2019.12.17.05.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 05:27:34 -0800 (PST)
Date: Tue, 17 Dec 2019 14:27:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [GIT PULL REBASED] drm/arc: Yet another set of minor fixes
Message-ID: <20191217132732.GB624164@phenom.ffwll.local>
References: <CY4PR1201MB01204228B5788F0A6619FE45A1510@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB01204228B5788F0A6619FE45A1510@CY4PR1201MB0120.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: David Airlie <airlied@linux.ie>, arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 10:59:39AM +0000, Alexey Brodkin wrote:
> Hi David, Daniel!
> 
> The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:
> 
>   Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)
> 
> are available in the Git repository at:
> 
>   git@github.com:abrodkin/linux.git tags/arcpgu-updates-2019.12.16
> 
> for you to fetch changes up to 0ff916e2ef6fb742e4906aac26c470314b59bae8:
> 
>   DRM: ARC: PGU: add ARGB8888 format to supported format list (2019-12-16 13:53:05 +0300)

Applied to drm-next, thanks for respinning.
-Daniel

> 
> ----------------------------------------------------------------
> Clean-up and fixes for FourCC handling in ARC PGU.
> 
> ----------------------------------------------------------------
> Eugeniy Paltsev (4):
>       DRM: ARC: PGU: fix framebuffer format switching
>       DRM: ARC: PGU: cleanup supported format list code
>       DRM: ARC: PGU: replace unsupported by HW RGB888 format by XRGB888
>       DRM: ARC: PGU: add ARGB8888 format to supported format list
> 
>  drivers/gpu/drm/arc/arcpgu_crtc.c | 36 ++++++++++++++++++------------------
>  drivers/gpu/drm/arc/arcpgu_regs.h |  2 +-
>  2 files changed, 19 insertions(+), 19 deletions(-)
> 
> Note this is based on the current drm/drm-next contents.
> 
> Thanks,
> Alexey

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
