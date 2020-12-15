Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D841B2DB153
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 17:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFB16E40A;
	Tue, 15 Dec 2020 16:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6396A6E40C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 16:27:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t16so20473162wra.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 08:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cXMpZeBf2WHykqV/RP3DcTupHWYnFveNyX5gq5+rJmw=;
 b=lwpF9VNyDzS2cH/okYlW6oljlrFlSiCZYua76mypHpLiwcd7gTIiaz8zGXNgTXaF0R
 8obftUe5dTzLb9def/Vhvcnig52nWNSdjNq0v68jV2W6y/CNXDKr3T6fUpkMXNO7cdlv
 LKd5hz+ERCFRBTpNedM/SUh4GzZWdcLf9VD2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cXMpZeBf2WHykqV/RP3DcTupHWYnFveNyX5gq5+rJmw=;
 b=TeO5gRPSmvHBmZptcCZahx+cXcKtsWQ7sMx0XPSl7l5HXcRsnE4RketV3ZAdqUFmmc
 hw7vTwDDLBmHzf1ayO5alJG2MGXMnE/k6etTCOvKRhw90T4wF5+BylUXU+mphR2Q7Fcg
 cH62Wr5qYs603WgiLVtZOWhXyj1nwxhJsg2Nlc1iX2mj49ZLLWgGdl77ZLFUeAQkGEBI
 H+laKoMdiaQi4/cjdpUFN/FjN+JoFZVZWUQo/yW1mnB65tWXHO7+y3Cf/sZHcAcOPfmT
 Tau8kUzEqIomdPU777JysNDDbpTjZfeTQijP3CW73szuqYPuhpca8MwWB3Eajio/kKje
 8L/Q==
X-Gm-Message-State: AOAM532LBk5xCWzf5oVU02NgfQXtw3tWx4PPj9KJdJnl3kwkOlb+JXsr
 mV+V5utfvPw/1I2U2MPXEncVZw==
X-Google-Smtp-Source: ABdhPJzz6h7SfItFMxZGDgGwgN1c9EDjt0/+/7QyzjqENSJ6nLQ+gNb+CYHcv8slBPR11JcyFnue3g==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr15462718wrr.130.1608049643481; 
 Tue, 15 Dec 2020 08:27:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h98sm42379535wrh.69.2020.12.15.08.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:27:22 -0800 (PST)
Date: Tue, 15 Dec 2020 17:27:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PULL] drm-misc-next-fixes
Message-ID: <X9jj6BJi0p7sHoPU@phenom.ffwll.local>
References: <X9i0X9mjHN9AZGD3@linux-uq9g>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9i0X9mjHN9AZGD3@linux-uq9g>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 02:04:31PM +0100, Thomas Zimmermann wrote:
> Hi Dave and Daniel,
> =

> here's this week's PR for drm-misc-next-fixes. IIRC the radeon fix is
> already in drm-misc-next.

Pulled, and also your previous -next pull which got stuck somewhere.

Thanks, Daniel

> =

> Best regards
> Thomas
> =

> drm-misc-next-fixes-2020-12-15:
> Short summary of fixes pull (less than what git shortlog provides):
> =

>  * dma-buf: Fix docs
>  * mxsfb: Silence invalid error message
>  * radeon: Fix TTM multihop
> =

> The following changes since commit 05faf1559de52465f1e753e31883aa294e6179=
c1:
> =

>   drm/imx/dcss: allow using nearest neighbor interpolation scaling (2020-=
11-26 11:29:44 +0100)
> =

> are available in the Git repository at:
> =

>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-202=
0-12-15
> =

> for you to fetch changes up to ee46d16d2e40bebc2aa790fd7b6a056466ff895c:
> =

>   drm: mxsfb: Silence -EPROBE_DEFER while waiting for bridge (2020-12-15 =
11:01:10 +0100)
> =

> ----------------------------------------------------------------
> Short summary of fixes pull (less than what git shortlog provides):
> =

>  * dma-buf: Fix docs
>  * mxsfb: Silence invalid error message
>  * radeon: Fix TTM multihop
> =

> ----------------------------------------------------------------
> Christian K=F6nig (1):
>       drm/radeon: fix check order in radeon_bo_move
> =

> Daniel Vetter (1):
>       dma-buf: Fix kerneldoc formatting
> =

> Guido G=FCnther (1):
>       drm: mxsfb: Silence -EPROBE_DEFER while waiting for bridge
> =

>  Documentation/driver-api/dma-buf.rst |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c    | 10 +++----
>  drivers/gpu/drm/radeon/radeon_ttm.c  | 54 ++++++++++++++++--------------=
------
>  include/linux/dma-buf-map.h          |  2 +-
>  4 files changed, 30 insertions(+), 38 deletions(-)
> =

> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
