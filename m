Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF230EE75
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBE36ED0A;
	Thu,  4 Feb 2021 08:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41CA6EA33
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 09:31:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56585AD24;
 Wed,  3 Feb 2021 09:31:37 +0000 (UTC)
Date: Wed, 3 Feb 2021 10:31:36 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/13] module: pass struct find_symbol_args to find_symbol
In-Reply-To: <20210203090418.GA7833@lst.de>
Message-ID: <alpine.LSU.2.21.2102031031120.24713@pobox.suse.cz>
References: <20210202121334.1361503-1-hch@lst.de>
 <20210202121334.1361503-11-hch@lst.de>
 <alpine.LSU.2.21.2102021504550.570@pobox.suse.cz>
 <20210203090418.GA7833@lst.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Joe Lawrence <joe.lawrence@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Feb 2021, Christoph Hellwig wrote:

> FYI, this is the updated version:
> 
> ---
> >From 664ca3378deac7530fe8fc15fe73d583d3333df2 Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Wed, 20 Jan 2021 14:58:27 +0100
> Subject: module: pass struct find_symbol_args to find_symbol
> 
> Simplify the calling convention by passing the find_symbol_args structure
> to find_symbol instead of initializing it inside the function.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Miroslav Benes <mbenes@suse.cz>

M
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
