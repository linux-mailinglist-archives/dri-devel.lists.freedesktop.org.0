Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF61289A1
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 15:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEB26E15D;
	Sat, 21 Dec 2019 14:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB776E15D
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 14:49:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8E28F80510;
 Sat, 21 Dec 2019 15:48:56 +0100 (CET)
Date: Sat, 21 Dec 2019 15:48:54 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v1 6/8] drm/print: add drm_dev_* logging functions
Message-ID: <20191221144854.GA25386@ravnborg.org>
References: <20191221095553.13332-1-sam@ravnborg.org>
 <20191221095553.13332-7-sam@ravnborg.org>
 <d1995ca9ff5b2f91d255eba97b9461d8a800a807.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1995ca9ff5b2f91d255eba97b9461d8a800a807.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=jQ3HvStpeShiA91JBhYA:9 a=CjuIK1q_8ugA:10
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
Cc: Jani Nikula <jani.nikula@intel.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joe.

> > +#define __drm_dev_cat_printk(dev, cat, type, fmt, ...)			\
> > +({									\
> > +	if (drm_debug_enabled(cat))					\
> > +		dev_dbg##type((dev), "[drm] " fmt, ##__VA_ARGS__);	\
> 
> trivia:  The parentheses around dev aren't necessary.
> 
> > +})
> > +
> > +#define drm_dev_info(dev, fmt, ...)					\
> > +	__drm_dev_printk((dev), info,, fmt, ##__VA_ARGS__)
> 
> etc...

I was not really sure so I just added them.
Will remove in v2 in all relevent patches - thanks!

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
