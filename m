Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B7206D5C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 09:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BEF6EA56;
	Wed, 24 Jun 2020 07:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC6C89C27
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 07:15:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r12so1127556wrj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 00:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FrXKwQyzdLQLVWIMixfwCF/d0wgzB2xwBQkr/2oaod8=;
 b=QmeossndMIz4r2SEAQWmK9ZlWfv0ssVi/nRTqFAmSTdMctLXhqRkdxOnbSSyi6S93u
 85xcXljeEk61k5a0f0DulYBV5jzjiQ6WdcKrwc+101x6tfcUJSjnTpnOk2qQUgYw2l5G
 igPgcmoWFDX/UiKKGV7pYd9pUAkr53nkrrZLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FrXKwQyzdLQLVWIMixfwCF/d0wgzB2xwBQkr/2oaod8=;
 b=MGWCxztj2S7fhhwEiGRfjfpjwtBLZAi1TVNcizk/PkK9yfZBstt5+kRGOBV8EKMGgj
 xEc3qFRcCt0Xn0hQSDBZIpWDE7swHoKKMBaevLi+yXJSKj8JH57urMb1miUomE00jIyD
 tVozwPWWWxf+L6RE3r+cG/dvvyN0OAmEYiRsKO/tQPwwh80PX3zuuf6+BYgPi972lfQg
 x/njkdyt1iyBdYUftDAVEfh0PdiDhvCPEBzW4bzQhCmsYn1cRQYCz2qM5f4iqlBWrlXv
 Y8SvdbvTDbuwEWggQJ1AIX4fkYDzi9WSh+gpuWKGZGA8FhHxqwnqqdHebxw3VCoaEquv
 jq/A==
X-Gm-Message-State: AOAM532tiKWCn2sAgdFI4IY7e73J6C5CjiLHeKILKar11CX0GHi3cDCB
 nQNQeL/d2Gz0sVHof9H/QGkvrQ==
X-Google-Smtp-Source: ABdhPJztPeo3a6/3dUeFRJHRmSfYQ+LcMBvC8ohlztpNWiHPC/xJVX2h4ynu7Lx3J1yp/uR3F93kYg==
X-Received: by 2002:a5d:4a4f:: with SMTP id v15mr28238055wrs.87.1592982956195; 
 Wed, 24 Jun 2020 00:15:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l1sm27359396wrb.31.2020.06.24.00.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 00:15:55 -0700 (PDT)
Date: Wed, 24 Jun 2020 09:15:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 8/8] drm/tiny/repaper: Drop edp->enabled
Message-ID: <20200624071553.GQ20149@phenom.ffwll.local>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-8-daniel.vetter@ffwll.ch>
 <bc85bee0-9edf-7e24-9a6f-0a9ce5153fd8@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc85bee0-9edf-7e24-9a6f-0a9ce5153fd8@tronnes.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 13, 2020 at 03:43:23PM +0200, Noralf Tr=F8nnes wrote:
> =

> =

> Den 12.06.2020 18.00, skrev Daniel Vetter:
> > Same patch as the mipi-dbi one, atomic tracks this for us already, we
> > just have to check the right thing.
> > =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> > ---
> =

> Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>

Thanks for your review, patch applied.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
