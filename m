Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1DE1294EE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 12:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2E66E260;
	Mon, 23 Dec 2019 11:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4CE6E260
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 11:21:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:21:09 -0800
X-IronPort-AV: E=Sophos;i="5.69,347,1571727600"; d="scan'208";a="207247953"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:21:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, Joe Perches <joe@perches.com>
Subject: Re: [PATCH v1 6/8] drm/print: add drm_dev_* logging functions
In-Reply-To: <20191221144854.GA25386@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191221095553.13332-1-sam@ravnborg.org>
 <20191221095553.13332-7-sam@ravnborg.org>
 <d1995ca9ff5b2f91d255eba97b9461d8a800a807.camel@perches.com>
 <20191221144854.GA25386@ravnborg.org>
Date: Mon, 23 Dec 2019 13:21:04 +0200
Message-ID: <87woanuw2n.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 21 Dec 2019, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Joe.
>
>> > +#define __drm_dev_cat_printk(dev, cat, type, fmt, ...)			\
>> > +({									\
>> > +	if (drm_debug_enabled(cat))					\
>> > +		dev_dbg##type((dev), "[drm] " fmt, ##__VA_ARGS__);	\
>> 
>> trivia:  The parentheses around dev aren't necessary.
>> 
>> > +})
>> > +
>> > +#define drm_dev_info(dev, fmt, ...)					\
>> > +	__drm_dev_printk((dev), info,, fmt, ##__VA_ARGS__)
>> 
>> etc...
>
> I was not really sure so I just added them.
> Will remove in v2 in all relevent patches - thanks!

FWIW, they are necessary in the drm_device variants due to the macros
doing the dereferencing.

BR,
Jani.


>
> 	Sam

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
