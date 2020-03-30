Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C148198D10
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B880D6E588;
	Tue, 31 Mar 2020 07:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686EC6E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 22:03:57 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c21so8648121pfo.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 15:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Fn5bbEwDKA1CjrL2t4+buEZ5DMdOn8ZLIb0ux0e5B3Q=;
 b=QlDnJ+HXQj0YHxnX8aX313kM6rHoKORnaNm2WYXDMn1aeXXbnF8UNEQ4VowdZeG4zl
 uV2sLQkwXOtnNAwFLkHNHrGIdHbHg2WXKZ+OCxvcK6XGQ4p7XyOtNEZguQcao8eEbZik
 jzhJzwgxyju9KgyIAO6AGWgfZzTJEGj7PCStu/3VWR74BEj6493pWtlmOVLr3PXjMy6j
 EvPvcs8zuq5fFUGMmdyzRW3LnvxqECq4R5074NxZe/sQXvq3wyUHonW+iSMHkNnpBI2D
 MA52ER9NNMOOvvHw75Dyrr3HHU19n2Cm6kVIde2BUnl4kJPuV5rqVxtOQP/DKfiUAQTz
 Rlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Fn5bbEwDKA1CjrL2t4+buEZ5DMdOn8ZLIb0ux0e5B3Q=;
 b=g4iJV1oFkRunULwvUanljJDfKQ5zY22aMS2Oays7b/SfWPpyqu+Hgzr0EHTYy/RkQo
 lBmCzo7Wl3DwL0g0AC0aHpocSCj5CdMeU953k6P4CQQ5vP6zmrs1ysrCJz9aHg2lGGD/
 HTVUm/MzrL2NfdtNwU0H/Nr+1N401z9vW0dt7pt8cHTJtB+XmSDJAlGoJTstPLORb5/C
 tOkK9FbwfSMPsnWTLswrXGEKzWiJS2IQ5qG8jaC/E4nGEP50yOWt7LIJ4ecfqOqauD2S
 OIRTdT0ZwWpq3XDMsUneB6CED0oSHqkIGqHjxT8KCY+5SfQWkjdQ3sj+A6Vj46yXWxce
 id6g==
X-Gm-Message-State: AGi0PubmisdtepRrH/EbZkwVihKqz+uGRF6JEAvcRAwdlA/J9B5qQqb8
 xpNuITDOQ2hi0Yzq45UvA+Q=
X-Google-Smtp-Source: APiQypIZ7rugn26VNzMH9f1FGurreUtTRDwMeVEoQLstiLOtdeGMyyyqnQhROZmrQSttmeLztEHYWg==
X-Received: by 2002:a65:55c6:: with SMTP id k6mr1200130pgs.52.1585605836849;
 Mon, 30 Mar 2020 15:03:56 -0700 (PDT)
Received: from OptiPlexFedora ([47.144.161.84])
 by smtp.gmail.com with ESMTPSA id h4sm1230719pgg.67.2020.03.30.15.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 15:03:56 -0700 (PDT)
Message-ID: <53befe00af657428b591200b31b5349a4a462eb1.camel@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: fbtft: Replace udelay with
 preferred usleep_range
From: "John B. Wyatt IV" <jbwyatt4@gmail.com>
To: Stefano Brivio <sbrivio@redhat.com>
Date: Mon, 30 Mar 2020 15:03:55 -0700
In-Reply-To: <20200330194043.56c79bb8@elisabeth>
References: <20200329092204.770405-1-jbwyatt4@gmail.com>
 <alpine.DEB.2.21.2003291127230.2990@hadrien>
 <2fccf96c3754e6319797a10856e438e023f734a7.camel@gmail.com>
 <alpine.DEB.2.21.2003291144460.2990@hadrien>
 <CAMS7mKBEhqFat8fWi=QiFwfLV9+skwi1hE-swg=XxU48zk=_tQ@mail.gmail.com>
 <alpine.DEB.2.21.2003291235590.2990@hadrien>
 <20200330194043.56c79bb8@elisabeth>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Mar 2020 07:37:59 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@inria.fr>,
 outreachy-kernel@googlegroups.com,
 Payal Kshirsagar <payal.s.kshirsagar.98@gmail.com>,
 Soumyajit Deb <debsoumyajit100@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-03-30 at 19:40 +0200, Stefano Brivio wrote:
> On Sun, 29 Mar 2020 12:37:18 +0200 (CEST)
> Julia Lawall <julia.lawall@inria.fr> wrote:
> 
> > On Sun, 29 Mar 2020, Soumyajit Deb wrote:
> > 
> > > I had the same doubt the other day about the replacement of
> > > udelay() with
> > > usleep_range(). The corresponding range for the single argument
> > > value of
> > > udelay() is quite confusing as I couldn't decide the range. But
> > > as much as I
> > > noticed checkpatch.pl gives warning for replacing udelay() with
> > > usleep_range() by checking the argument value of udelay(). In the
> > > documentation, it is written udelay() should be used for a sleep
> > > time of at
> > > most 10 microseconds but between 10 microseconds and 20
> > > milliseconds,
> > > usleep_range() should be used. 
> > > I think the range is code specific and will depend on what range
> > > is
> > > acceptable and doesn't break the code.
> > >  Please correct me if I am wrong.  
> > 
> > The range depends on the associated hardware.
> 
> John, by the way, here you could have checked the datasheet of this
> LCD
> controller. It's a pair of those:
> 	https://www.sparkfun.com/datasheets/LCD/ks0108b.pdf
> 

No I have not. This datasheet is a little over my head honestly.

What would you recommend to get familiar with datasheets like this?

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
