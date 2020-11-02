Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AD2A288C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 11:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2366E09C;
	Mon,  2 Nov 2020 10:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009636E09C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 10:52:37 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w4so227834pgg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 02:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tIqjmuSJa/aLDfaBRrGmFrpGnbcflQTqm0uzq8ZOD5s=;
 b=FrBvBKgltnlkrDLjwRMFsHKFW/M/2huDzem/NZ0FwtAtqPL0TPrjBLiVj8xPtGqpQ6
 ATYUKiz/HTWggIs5pJZWqPQ9EDiDeREb+qdRlnFXl6X6paEvBnXBcrtBnx36jFLyGRO2
 DRLpVEi/SoMr1RyIeNKuI2Flvs1Z8ofaZTSqV3mwiljtjvH0NAPDLkJh6PxVB69Xmzbi
 /kwFctycSeRibulQBG1bTYt4hrgIu+Etz383kzjO/eaMhg88MgYE8KrGhQrhpGmjq6Uw
 iF7vgnZiP3WoWh/BJsiu4gHb3Dog63yxs6p4bJjF0QDEhG3skMCz/wKKB4RxzMoCBvvP
 k5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tIqjmuSJa/aLDfaBRrGmFrpGnbcflQTqm0uzq8ZOD5s=;
 b=NmLZUDEmLFJc/jqhZP0bI1zEm7OaKRnHrNCwMjkHdbI4JU/isbLOl/6a47GQDHoMp6
 zwjdwL1CXTfPWmK0TC7Q1vFRsTCzjA1fXJmUPNhXPmIYZ2s4iMr3kKZPSHFb2m2rBb/7
 3HvI2wHEIGRa4inyXJ8FP47Uw1tnUWFDcmsVa4WycPLfuAyuCEbTpbFs/bjkU2jrVU5F
 g+lUvthVBoqz/LKz5WdwS/gmhdbch/NQ9GP9bbPIpmboP/5vVriHjCKIGG/juKXSRmcR
 Qi7bYyTuGpXFZQwr9TC0oKJg3UEffRF+P+ub/+N2iZLwSLtfINeQMWZ/Oar6inuH3273
 W9jw==
X-Gm-Message-State: AOAM533Qld51dM8XlVIs17qoWxi6pgnAE3k6b5SLvELhlYdb+1ZpNZvx
 Jm/VRroBiCuG82W0tiSetQ==
X-Google-Smtp-Source: ABdhPJybd2NlpBI6FvJ3VYPiHVgRRMnM/xlFcyYk80yOHver3rNSU/1P8ZYga0AGoCb6JANi0TFXmw==
X-Received: by 2002:a62:ddd4:0:b029:155:af54:3000 with SMTP id
 w203-20020a62ddd40000b0290155af543000mr21301123pff.64.1604314357575; 
 Mon, 02 Nov 2020 02:52:37 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id 136sm13802489pfa.132.2020.11.02.02.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 02:52:36 -0800 (PST)
Date: Mon, 2 Nov 2020 05:52:28 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v2 1/2] console: Remove dummy con_font_op() callback
 implementations
Message-ID: <20201102105228.GA1558395@PWN>
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
 <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com>
 <a8157089-bc72-c409-c7cc-2fd7eb087ebc@kernel.org>
 <20201102101347.GN401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102101347.GN401619@phenom.ffwll.local>
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 George Kennedy <george.kennedy@oracle.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 11:13:47AM +0100, Daniel Vetter wrote:
> On Mon, Nov 02, 2020 at 10:47:55AM +0100, Jiri Slaby wrote:
> > On 02. 11. 20, 10:36, Peilin Ye wrote:
> > > `struct console_font` is a UAPI structure, thus ideally should not be
> > > used for kernel internal abstraction. Remove some dummy .con_font_set,
> > > .con_font_default and .con_font_copy `struct consw` callback
> > > implementations, to make it cleaner.
> > 
> > ESEMANTIC_ERROR.
> > 
> > 1) What do you refer to with the last "it"?
> > 
> > 2) What's the purpose of mentioning struct console_font at all?
> > 
> > 3) Could you clarify whether you checked it is safe to remove the hooks?

I see. I will try to elaborate in future patches, thank you!

> > 4) All the hooks now return ENOSYS for both consoles (and not 0). Is this
> > intentional?
> > 
> > I know answers to the first 3 questions, but you need to elaborate a bit in
> > the commit log to connect those sentences. Esp. for people not dealing with
> > the code on a daily basis. Ad 4) I am not sure.
> 
> Yup the behaviour change from 4) needs to be called out. I think this
> should then also be done as part of the large patch series to remove the
> dummy functions from all console drivers.
> 
> I don't expect the errno change to cause trouble, and it's the more honest
> errno - changing fonts not supported is the truth. But if it is, we can
> patch that up appropriately when we get a regression report. That's kinda
> unavoidable with old crufty uapi like this one here.
> 
> Also a bikeshed: Additional information like the patch changelog or
> reasons why you do something is imo best to include in the commit message
> itself. It ends up looking a bit less tidy sometimes, but often there's
> crucial information in these parts that was accidentally left out from the
> commit message.

Sure, I will try to include sufficient information for one to easily
understand what I'm trying to do with a patch. Thank you,

Peilin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
