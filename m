Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 767121FC737
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80D76EABA;
	Wed, 17 Jun 2020 07:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE216E07F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 10:59:01 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id h22so1392788pjf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 03:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=sF7DY7/yFSypbszgUG1TJQhQqtKUSu6uxM9SyAmvReU=;
 b=EhXmIQtnZNq+af0f45rzYa7xY7qzFTtwkllJujVjzMVGgGdb0f19PuviYbzx31hxlB
 dspeOymuPg4ERxWpkGhe5R5BfwqLMeGfNcCgrI+rI3Ff1vVGIfhJqQyzQE7tcZwgs0U6
 ctipaBHozpgxa87Iuql79F94QEL5G+JxcY3g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=sF7DY7/yFSypbszgUG1TJQhQqtKUSu6uxM9SyAmvReU=;
 b=F539MKLcKe8Yf3eIef2IpX+tj2kXmv0lPetOBWbtfMR33DOsF/qM0teJBoqjcWrcEd
 G2KmLUM8hONseok5SWw/TB2azFVUCluWJvmGsD7+i4ZPbRC1Ub+e1K7Pjn6EMxmZNVA/
 39RL7ivJdMrUaxhRmFMeqJdptiZaHyWuFRaXtDOi4Kb0ePrfgRrtUnW5yBDjUYqA6/H1
 I2Xs2rgPlrNFgXj/fVlAX+wAS84CNeThZ87QroRdWThwmnQ0ChdF903Z+saDikgWbLNr
 0ybEnE2qz7YnPu9bwVq2iIKWXjfB++HTdMlg2lnalVR6JUqap/9SqNJMF3WYSJyLkN8b
 NXhg==
X-Gm-Message-State: AOAM5320DWsYQXvT7K7CelYOROe50ps6hpFyvwsMwpWGFrnM6m6ffUzs
 JXWqc8PWoadieq/GQUYuwHZ1/A==
X-Google-Smtp-Source: ABdhPJyDzDvXlH81r0fimCdkT22DILhAuYzfpIUugmJrsdgt9hVOKKKArx77C9sxLe88JaUmvC6KYg==
X-Received: by 2002:a17:90a:20a3:: with SMTP id
 f32mr2278443pjg.171.1592305141154; 
 Tue, 16 Jun 2020 03:59:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id u4sm16495348pfl.102.2020.06.16.03.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 03:59:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <fa12d16e7aeda5971b2a65ac5414f18c@codeaurora.org>
References: <20200612015030.16072-1-tanmay@codeaurora.org>
 <159200440578.62212.5195358467251573190@swboyd.mtv.corp.google.com>
 <1eda01da33b620ddee5162be3326853f@codeaurora.org>
 <CAOCk7NrX9Lk6GQKXcFMd1CHHu7CjVg7hUAwt1LyNFdVHHGPO-g@mail.gmail.com>
 <fa12d16e7aeda5971b2a65ac5414f18c@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v6 0/5] Add support for DisplayPort driver on
From: Stephen Boyd <swboyd@chromium.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, tanmay@codeaurora.org
Date: Tue, 16 Jun 2020 03:58:59 -0700
Message-ID: <159230513976.62212.16514480218308627258@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 DRM PANEL DRIVERS <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting tanmay@codeaurora.org (2020-06-15 16:36:52)
> On 2020-06-15 16:04, Jeffrey Hugo wrote:
> >> >
> >> > I've never seen a block diagram for a driver before...
> >> >
> >> It is here for v5. https://patchwork.freedesktop.org/series/74312/
> > 
> > I think Stephen is nitpicking your wording, and you seem to not be
> > understanding his comment.  I'm sorry if I am mistaken.
> > 
> > The "DP driver" would seem to refer to the linux software driver you
> > are proposing patches for, however this diagram looks like a hardware
> > diagram of the various hardware blocks that the Linux driver code (the
> > "DP driver") is expected to interact with.  I believe you should
> > re-word "The block diagram of DP driver is shown below:" to be more
> > specific of what you are describing with your figure.  IE your words
> > say this is a block diagram of the software, when it looks like it is
> > a block diagram of the hardware.
> 
> Thanks for reviews.
> 
> I am not sure what Stephen meant, but this diagram was available before.
> 
> Just for clarification this is not hardware diagram at all.
> This is modeling of DP driver for msm.
> Each box name above except "DRM framework", is file name in driver i.e. 
> software module.
> Each line and arrow shows how modules interact with each other.
> 
> For example, "DP PARSER" Box is pointing towards "DEVICE TREE" Box, that 
> means
> dp_parser.c file contains functions which are parsing device tree 
> properties and so on...

Yes sorry for being obtuse. To be more direct I'll just say that needing
to have a block diagram for a device driver is not a great start. Device
drivers shouldn't be as complicated to need a block diagram to guide the
reviewer. If we need them then we've failed to consolidate enough logic
into the core device driver frameworks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
