Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F187730712E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9C56E95B;
	Thu, 28 Jan 2021 08:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25656E117
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 14:17:15 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id v19so1649347pgj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 06:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=SBU3ke6fyTe5WhDbhpXLXYEkr+BqHP21ZqQYSRrwOXs=;
 b=Q5O8nvrkMwwMaxaEqijSY2y5joaR6h/NQ2dkol0M9GtexhWliJre8V2Fycbtml+4MI
 E2pbHs5wpZYfbJCnxdoxXgDgANbKAK2u12ZpxY3ksMl1VtiK6JosOfiOuiPhbYLCAeM9
 vMUXzRMhFdbnDb43rvl4YvOlW9IYkWrBkpiHPROLYLIyebh0RN1WDOEld5Nln7Axs5g4
 rJCPFE/ZkOPPFO7APRdtrPLLNC7ln2KqIii6YaBkkfJn90Y58ubwszV9DWFtaeDdtlJO
 +sK/ybhRyCN1SSdON+HpfdJZWutf+6Zhy16rNyJAEwtw7klziC3BYFGOmg4jg4M1+nPA
 Kw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=SBU3ke6fyTe5WhDbhpXLXYEkr+BqHP21ZqQYSRrwOXs=;
 b=Bn8Lb+9vFtFMiNdQ9taUdiBez2nts+LNELTpEJlM7jtRtKR+SbgWhMvtOZz11M24dc
 hmU37GwycxGoCwW9Hcr5Eu6fhqmt27w78V1uR1Kyzda5Vye00c1RSdqLLAkOQ5BJcf2F
 QugLMBVUMuDQ1zOLVZpBclvOavVbQd1v8u7ucTksEnU6aTFuxTgKQSW1uSivVvw1FcvG
 VkIe5TUe4YghHgIVteIc2O3Ys2NRgeHugs9vXMrqMXvPAW/yzrJIUAnEebiMBA06G4DE
 AtY+4YtcC/CQF9baEj/TKEfvhjP1x5hhVPrrPIZVc8HHh0L79XlIn5hHIevBq0s4Y0AC
 B/5A==
X-Gm-Message-State: AOAM531X9OAZSANCXB5kbtHLFgAty6QL4dbB1t1bpUQX5umW8XT7IaFv
 m4VAmbfqMi4StyhpGcUDf2Y=
X-Google-Smtp-Source: ABdhPJxCJImDA6E9Uooenclpkv0Ck2OHxQ2VhnjVf7XXOlKRkkDt0sWmIOf2xGknjCNxTRopaoTIqw==
X-Received: by 2002:a62:160b:0:b029:1bf:56ca:a594 with SMTP id
 11-20020a62160b0000b02901bf56caa594mr10748988pfw.57.1611757035311; 
 Wed, 27 Jan 2021 06:17:15 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id s15sm2492502pfh.107.2021.01.27.06.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 06:17:14 -0800 (PST)
Date: Wed, 27 Jan 2021 22:17:08 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v10] staging: fbtft: add tearing signal detect
Message-ID: <20210127221708.00002568@gmail.com>
In-Reply-To: <YBF08Xf7qaZx3YZ1@kroah.com>
References: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
 <YBFv+12xfsoxacDb@kroah.com> <20210127220809.000026fb@gmail.com>
 <YBF08Xf7qaZx3YZ1@kroah.com>
Organization: Tyzmig-ryrjum-8kedto
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sbrivio@redhat.com, colin.king@canonical.com, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jan 2021 15:13:05 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Jan 27, 2021 at 10:08:09PM +0800, carlis wrote:
> > On Wed, 27 Jan 2021 14:51:55 +0100
> > Greg KH <gregkh@linuxfoundation.org> wrote:
> >   
> > > On Wed, Jan 27, 2021 at 09:42:52PM +0800, Carlis wrote:  
> > > > From: zhangxuezhi <zhangxuezhi1@yulong.com>
> > > > 
> > > > For st7789v ic,when we need continuous full screen refresh, it
> > > > is best to wait for the TE signal arrive to avoid screen tearing
> > > > 
> > > > Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>    
> > > 
> > > Please slow down and wait at least a day between patch
> > > submissions, there is no rush here.
> > > 
> > > And also, ALWAYS run scripts/checkpatch.pl on your submissions, so
> > > that you don't have a maintainer asking you about basic problems,
> > > like are in this current patch :(
> > > 
> > > thanks,
> > > 
> > > greg k-h  
> > 
> > hi,
> >   This is my first patch contribution to Linux, so some of the rules
> > are not very clear .In addition, I can confirm that before sending
> > patch, I check it with checkPatch.py every time.Thank you very much
> > for your help  
> 
> Please read Documentation/SubmittingPatches which has a link to the
> checklist and other documentation you should read.
> 
> And I doubt you are running checkpatch on your submission, as there is
> obvious coding style issues in it.  If so, please provide the output
> as it must be broken :(
> 
> thanks,
> 
> greg k-h
hi, the patch v11 checkpatch.pl output is below:

carlis@bf-rmsz-10:~/work/linux-kernel/linux$ ./scripts/checkpatch.pl
0001-staging-fbtft-add-tearing-signal-detect.patch total: 0 errors, 0
warnings, 0 checks, 176 lines checked

0001-staging-fbtft-add-tearing-signal-detect.patch has no obvious style
problems and is ready for submission.


regards
zhangxuezhi

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
