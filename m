Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E91B307119
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F33B6E94C;
	Thu, 28 Jan 2021 08:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFE86E47A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 01:13:06 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id f63so2875834pfa.13
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 17:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=HTf847R2lSIm8x+zWW8zp5qWCZrtnr76dEbaeyoOfVQ=;
 b=DV1RYbjq2ydxVkQXTxqIB/LGIYnbt8W+hdU9FIOEHIA3+fD3h0dT0KLSCV2jHikRkx
 Bsj1ztj3Y+d24bzrwyklZVKjQC6QgOeUcKZvhyHfpxz13N/5ONNauPzl0IJ3bkIyYHA5
 O+XGHKHemFQ74auCEZnyP+P2mCJL0z9Wxqq5Ga3ClITei1ldOdfthuyHECrERU5xoHVe
 rcW+Cf/ZRodDAWB+OvacraPumZkGrE+scd4VURd87U+Ha3zxMeJTbuMODAGdNXeG/wgZ
 mVH/XyeGnG9Abto5R6purWKOe4YOuGtxZoh/kcJ8gRDb11nKUIHFOfKICfiR8V5Z+tHO
 GWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=HTf847R2lSIm8x+zWW8zp5qWCZrtnr76dEbaeyoOfVQ=;
 b=XtqTikIRTKo8V3sOdRKB7io483gvl/FnnAE+72s+0/U/DcYBOALSxkkzd7Q3/aU+46
 Oz+kbc/thX9/cLCx2P/ib/dwZjbeEax2Z8ArhMltOEhH7f4KFn4OFnN1pXCXg1Bxiv1I
 rgo3FFepS6aAJHrT2kbDJhwl0q+bVRF8rzQMsmnBJ6v/ZP97nziXBPUEP93ZJ8sPXYIH
 B2aQHcKcYYwANYYEhlBYMBm9dm8RWjJyvXiLSn6K/7tFnFiHUgAmeOjaBcPITG5DbQHJ
 9lsZnwXyA+PYSnajAIxrHQxxvS1Sg80mgz1b8iHc1M7RrhJceWJEktAq5CjtYj++iuDb
 RofA==
X-Gm-Message-State: AOAM530Jcb3bM0oggySPqqKJlUP5Nc/J5IWUHC8XcmrdDGrdVFQq+een
 VCIl6fKtp9W45p3zLICRVbY=
X-Google-Smtp-Source: ABdhPJwAVPIVABanGwOlp0fmVeuqXJz6+UxjKrII1NyFy/nqj3OsX7LyWJpiv2D6MLArHLZ7TbNu1w==
X-Received: by 2002:a63:ea4b:: with SMTP id l11mr13854886pgk.61.1611796386638; 
 Wed, 27 Jan 2021 17:13:06 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id s9sm3731356pfd.38.2021.01.27.17.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 17:13:05 -0800 (PST)
Date: Thu, 28 Jan 2021 09:12:59 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v10] staging: fbtft: add tearing signal detect
Message-ID: <20210128091259.00003202@gmail.com>
In-Reply-To: <YBGAi+14PlXIdvxF@kroah.com>
References: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
 <YBFv+12xfsoxacDb@kroah.com> <20210127220809.000026fb@gmail.com>
 <YBF08Xf7qaZx3YZ1@kroah.com> <20210127221708.00002568@gmail.com>
 <YBF30EEUkhEMY5ti@kroah.com> <20210127144946.GF2696@kadam>
 <YBGAi+14PlXIdvxF@kroah.com>
Organization: Tyzmig-ryrjum-8kedto
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:35 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 mh12gx2825@gmail.com, oliver.graute@kococonnector.com,
 Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sbrivio@redhat.com,
 Joe Perches <joe@perches.com>, colin.king@canonical.com,
 zhangxuezhi1@yulong.com, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jan 2021 16:02:35 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Jan 27, 2021 at 05:49:46PM +0300, Dan Carpenter wrote:
> > On Wed, Jan 27, 2021 at 03:25:20PM +0100, Greg KH wrote:  
> > > On Wed, Jan 27, 2021 at 10:17:08PM +0800, carlis wrote:  
> > > > On Wed, 27 Jan 2021 15:13:05 +0100
> > > > Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >   
> > > > > On Wed, Jan 27, 2021 at 10:08:09PM +0800, carlis wrote:  
> > > > > > On Wed, 27 Jan 2021 14:51:55 +0100
> > > > > > Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > >     
> > > > > > > On Wed, Jan 27, 2021 at 09:42:52PM +0800, Carlis wrote:
> > > > > > >  
> > > > > > > > From: zhangxuezhi <zhangxuezhi1@yulong.com>
> > > > > > > > 
> > > > > > > > For st7789v ic,when we need continuous full screen
> > > > > > > > refresh, it is best to wait for the TE signal arrive to
> > > > > > > > avoid screen tearing
> > > > > > > > 
> > > > > > > > Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>
> > > > > > > >   
> > > > > > > 
> > > > > > > Please slow down and wait at least a day between patch
> > > > > > > submissions, there is no rush here.
> > > > > > > 
> > > > > > > And also, ALWAYS run scripts/checkpatch.pl on your
> > > > > > > submissions, so that you don't have a maintainer asking
> > > > > > > you about basic problems, like are in this current patch
> > > > > > > :(
> > > > > > > 
> > > > > > > thanks,
> > > > > > > 
> > > > > > > greg k-h    
> > > > > > 
> > > > > > hi,
> > > > > >   This is my first patch contribution to Linux, so some of
> > > > > > the rules are not very clear .In addition, I can confirm
> > > > > > that before sending patch, I check it with checkPatch.py
> > > > > > every time.Thank you very much for your help    
> > > > > 
> > > > > Please read Documentation/SubmittingPatches which has a link
> > > > > to the checklist and other documentation you should read.
> > > > > 
> > > > > And I doubt you are running checkpatch on your submission, as
> > > > > there is obvious coding style issues in it.  If so, please
> > > > > provide the output as it must be broken :(
> > > > > 
> > > > > thanks,
> > > > > 
> > > > > greg k-h  
> > > > hi, the patch v11 checkpatch.pl output is below:
> > > > 
> > > > carlis@bf-rmsz-10:~/work/linux-kernel/linux$
> > > > ./scripts/checkpatch.pl
> > > > 0001-staging-fbtft-add-tearing-signal-detect.patch total: 0
> > > > errors, 0 warnings, 0 checks, 176 lines checked
> > > > 
> > > > 0001-staging-fbtft-add-tearing-signal-detect.patch has no
> > > > obvious style problems and is ready for submission.  
> > > 
> > > Wow, my apologies!
> > > 
> > > Andy and Joe, there's something wrong here that is missing the
> > > fact that a line is being indented with spaces and not tabs in
> > > the patch at
> > > https://lore.kernel.org/r/1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com
> > > 
> > > Any ideas what broke?
> > >   
> > 
> >     /*Tearing Effect Line On*/
> > 
> > Comments are the exception to the "no spaces at the start of a line"
> > rule.  I was expecting that the kbuild-bot would send a Smatch
> > warning for inconsistent indenting, but comments are not counted
> > there either.
> > 
> > I'm sort of surprised that we don't have checkpatch rule about the
> > missing space characters.  It should be: "/* Tearing Effect Line On
> > */".  
> 
> That was going to be my next question, lots of comments added in this
> patch don't have spaces...
> 
> thanks,
> 
> greg k-h

Ok,i will fix it in patch v12 tomorrow

regards,
zhangxuezhi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
