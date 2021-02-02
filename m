Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B91630B9B9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13016E964;
	Tue,  2 Feb 2021 08:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABD06E243
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 01:52:51 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id j12so13269961pfj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 17:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=4dPB0xdozLnJ4HtFbULqQeJT3HtsViC+HjWIT7oeuiI=;
 b=A596Ysvq014L9mFKZs37S5/W5bTE2ckwYfmpCpJ9nK27wUnTGUHfcS4olYHh1lwEYi
 OG/cmNrMZ26tasIl3Q05IDWl/L7kDiv6u0J6SksFwo9iFK2K6lc9PpwLmyCnDho+mehZ
 AYBbibs05MBm8Z6SI6sJrBe/I9tVoQnacJWdZH3O3fANifne1TFM/clp/0CFlVvuDBLz
 Qk2bF3qevUtqIag/7tnISR7FZ6TkzhH+oFCeAaL99nzf33V/4dcm6ET4hCE9epWFKHFh
 5bHuvJwOh1oKv3pKEGkFwRwA4DJ9G+Rt3XsCWjTgn+a7fqsUHVabiv9qYDTlufjtZfmL
 8IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=4dPB0xdozLnJ4HtFbULqQeJT3HtsViC+HjWIT7oeuiI=;
 b=ftqeFQUpeK2waKNFvABrVssmJciU8BAd61CaoZ+x+MIdQ4xubtSyGcS1ZGWF3acLRn
 dfPKvshk+eDvkxqpNTup3uy0fPNW3IPB6Skl4Jj6xCYislWE3XKyY32XIXiZt8fkfOfu
 aFx8IcHZOSbSdSBrmXnX1z/tqSrlO3dXzc8OQxsLZn0sL33T07NWMJWSxiiM4eefU6hF
 z1b2yKuRFUDXlUEJybApGxtm8xGj3N3cDMIV0EUGIvU6IaVTcoTYwwp4ZU5Jre4PJIxm
 8CNTvuq6biXnePm5ZmYavc7pbaOh21ydiWjY4aFr7kOef8HvNHs5azCN+FYNLakzDcf5
 Avsw==
X-Gm-Message-State: AOAM533NHfi+/pxmyZW/KT2eh4JhGD7lqb/I+SGFSaGGZBmZFgpMW4JU
 nsPnzJbNf3eQTTM9UPIno10=
X-Google-Smtp-Source: ABdhPJzpk7F4glgCPjEUcr5K297Ke5ORCshoB5cX9ev1Y19QQXM9NU6F/FQlje3ynVyzVGfMyxYuvg==
X-Received: by 2002:a63:a542:: with SMTP id r2mr19669741pgu.211.1612230771093; 
 Mon, 01 Feb 2021 17:52:51 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id fs14sm712574pjb.46.2021.02.01.17.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 17:52:50 -0800 (PST)
Date: Tue, 2 Feb 2021 09:52:34 +0800
From: Carlis <zhangxuezhi3@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
Message-ID: <20210202095234.000059ca@gmail.com>
In-Reply-To: <CAHp75VenJVOSbAXryGK_BWytRJF=T1zwk5xDimRQOTojoXbMFQ@mail.gmail.com>
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
 <20210129130110.00003bb1@gmail.com>
 <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
 <20210129215638.000047b0@gmail.com>
 <CAHp75VcdOibSRuSBZYhFtEcVxuammYMfcnrUQGvS6ttArFxj6g@mail.gmail.com>
 <20210130143924.00005432@gmail.com>
 <CAHp75VenJVOSbAXryGK_BWytRJF=T1zwk5xDimRQOTojoXbMFQ@mail.gmail.com>
Organization: Coolpad
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, Colin King <colin.king@canonical.com>,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 1 Feb 2021 19:40:21 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Sat, Jan 30, 2021 at 8:39 AM carlis <zhangxuezhi3@gmail.com> wrote:
> > On Fri, 29 Jan 2021 16:26:12 +0200
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:  
> > > On Fri, Jan 29, 2021 at 3:56 PM carlis <zhangxuezhi3@gmail.com>
> > > wrote:  
> > > > On Fri, 29 Jan 2021 12:23:08 +0200
> > > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:  
> 
> ...
> 
> > > > Hi, I apologize for what I said in the previous two emails. I
> > > > missed one email you sent before, and now I probably understand
> > > > what you meant. Here is a version I modified according to your
> > > > suggestion:  
> 
> I have realized that you are mocking stuff in the generic fbtft
> structure for all drivers while only a single one is going to use
> that. Consider moving everything to the driver in question.
> 
> 

hi, 
   Do you mean that i define the TE completion and irq_te in the
   fb_st7789v.c as i did before?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
