Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B680A30EE68
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7785C6ECF6;
	Thu,  4 Feb 2021 08:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346D16EA1C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 08:58:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612342715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0+x7egL9Qu9DyTDy1qWd3xGJ1Te9iPGoSgdl08Km7U=;
 b=WCS08+UTloQ8w9V9X07PshoidPrR3T0C1D8IT5lGC/Kr+EZJ6BkxmCkeJefyLiTP8qjIqm
 L73CpIywNQvgnRWI+YV3bh4QkOhpY1J1sxsIa7QBjlU9wJ7cEAQaiI1JSwb9Elv3FGGM2s
 k1KiS9e6wuNM+KE+AaDQDSKhT09Igb0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA166AC45;
 Wed,  3 Feb 2021 08:58:35 +0000 (UTC)
Date: Wed, 3 Feb 2021 09:58:34 +0100
From: Petr Mladek <pmladek@suse.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/13] kallsyms: refactor {,module_}kallsyms_on_each_symbol
Message-ID: <YBplukHLyaxTjrpV@alley>
References: <20210202121334.1361503-1-hch@lst.de>
 <20210202121334.1361503-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202121334.1361503-6-hch@lst.de>
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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
Cc: Jiri Kosina <jikos@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-kbuild@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 Michal Marek <michal.lkml@markovi.net>, Joe Lawrence <joe.lawrence@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Yu <jeyu@kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 2021-02-02 13:13:26, Christoph Hellwig wrote:
> Require an explicit call to module_kallsyms_on_each_symbol to look
> for symbols in modules instead of the call from kallsyms_on_each_symbol,
> and acquire module_mutex inside of module_kallsyms_on_each_symbol instead
> of leaving that up to the caller.  Note that this slightly changes the
> behavior for the livepatch code in that the symbols from vmlinux are not
> iterated anymore if objname is set, but that actually is the desired
> behavior in this case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Miroslav Benes <mbenes@suse.cz>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
