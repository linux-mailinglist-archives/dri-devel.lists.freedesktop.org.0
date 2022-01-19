Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9F1493E1A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 17:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A1610E2FA;
	Wed, 19 Jan 2022 16:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21E710E2FA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642608829; x=1674144829;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qXn4Oyh5Dr++hHrfVGjIZqhc6CE2QEkTFFBFKnICAUk=;
 b=TagFKfk69ZkcIQ8EDPyYrP30+woDYSHG5KIPlumbKh0GtqXaUWfMN/n4
 cNp1WWUhgkYpwxbA4c+nGto4AfbMFDl8tOgIyCrzLVVkvUU1YeLTxLoNq
 u+TBR/tGJqylCYhtprhjX3IV9VqoeOnfCTQMW9ed9muE3NlXW6753t2eQ
 uE0Cj9V2c9Ak2JJNJ+Nteof9UKnewnjmhzLcqTDP20ckA2O57QUUiM9NG
 OH/CkyNmIvsSDJYNQy4omo7SlFzlws5GgqtpcPTw8NruFWnZ8BBhQlfEF
 OKHbvctdQ7jpKZ61QTJNAmrXSt1cDI8q/9eF5Ghl83TUNvwjl4tF9i1dd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="305832323"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="305832323"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 08:13:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="532353030"
Received: from elenadel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 08:13:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>, Sven
 Schnelle <svens@stackframe.org>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
In-Reply-To: <40d39363-bae8-93f2-71c6-7d5531f144bf@gmx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <Yef0j8+DBbwC7Kjv@kroah.com>
 <Yef15k2GtC40aJEu@kroah.com>
 <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
 <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
 <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
 <CAKMK7uEb53iu_HxYSnFZ59j=vXQdMvTWT7xosEo85XkAwzDMnA@mail.gmail.com>
 <8735ljkboo.fsf@x1.stackframe.org>
 <CAKMK7uHHF22+MBz5D2kBv07X2BR76UDi2-JP7eO-f=nm-pymcw@mail.gmail.com>
 <40d39363-bae8-93f2-71c6-7d5531f144bf@gmx.de>
Date: Wed, 19 Jan 2022 18:13:39 +0200
Message-ID: <87ilufbt58.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jan 2022, Helge Deller <deller@gmx.de> wrote:
> On 1/19/22 16:42, Daniel Vetter wrote:
>> If otoh you get the maintainership first to be able to cram in reverts
>> without discussions, then it's very backwards.
> I'm working on the Linux kernel since at least 23 years and am a maintainer of parts of it.
> I know that and would never push something which is controversal without discussions.

I think the entire MAINTAINERS change was controversial and rushed to
Linus without discussion over a weekend.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
