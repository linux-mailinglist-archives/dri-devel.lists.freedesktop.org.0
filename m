Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95C82F5CC3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BE26E07F;
	Thu, 14 Jan 2021 09:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E941A6E07F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:04:47 +0000 (UTC)
IronPort-SDR: 2rgORN+pWIW6jZFaxDs8CfkguWvFOvbISTgr/jzB+IHxgKdUh1e6H9bZHXxi7TaB4Fdlwry1sQ
 87MDf5QFUcxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="239879114"
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; d="scan'208";a="239879114"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 01:04:43 -0800
IronPort-SDR: G8QGeNRrjTIX+UfYb2dYkwKbshkJZWnK/VbTJufU8URmutTPv10plPssRnoEi0mIXK3ALsiWcT
 DjXC4Fny/cWg==
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; d="scan'208";a="382199636"
Received: from dforourk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.254.146])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 01:04:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 00/31] Rid W=1 warnings from Video
In-Reply-To: <20210113202546.GG3975472@dell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210113145009.1272040-1-lee.jones@linaro.org>
 <20210113190118.GA180942@ravnborg.org> <20210113202546.GG3975472@dell>
Date: Thu, 14 Jan 2021 11:04:19 +0200
Message-ID: <877dofriss.fsf@intel.com>
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
Cc: Jakub Jelinek <jakub@redhat.com>, linux-fbdev@vger.kernel.org,
 Anthony Tong <atong@uiuc.edu>, Alex Kern <alex.kern@gmx.de>,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Software Engineering <lg@denx.de>, Paul Mundt <lethal@chaoticdreams.org>,
 Frodo Looijaard <frodol@dds.nl>, Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 James Simmons <jsimmons@users.sf.net>, Urs Ganse <ursg@uni.de>,
 Thibaut VARENE <varenet@parisc-linux.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Helge Deller <deller@gmx.de>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Ani Joshi <ajoshi@unixbox.com>,
 Emmanuel Marty <core@ggi-project.org>,
 "Mark D. Studebaker" <mdsxyz123@yahoo.com>, daniel.mantione@freepascal.org,
 carter@compsci.bristol.ac.uk, Alan Cox <alan@redhat.com>,
 Jeff Garzik <jgarzik@pobox.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "Eddie C. Dost" <ecd@skynet.be>, Ani Joshi <ajoshi@shell.unixbox.com>,
 "Thomas J. Moore" <dark@mama.indstate.edu>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Fremlin <vii@users.sourceforge.net>,
 Ilario Nardinocchi <nardinoc@cs.unibo.it>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Jakub Jelinek <jj@ultra.linux.cz>, William Rucklidge <wjr@cs.cornell.edu>,
 Antonino Daplas <adaplas@pol.net>, Brad Douglas <brad@neruo.com>,
 Ralph Metzler <rjkm@thp.uni-koeln.de>, Alex Dewar <alex.dewar90@gmail.com>,
 Philip Edelbrock <phil@netroedge.com>, Jim Hague <jim.hague@acm.org>,
 Egbert Eich <Egbert.Eich@physik.tu-darmstadt.de>,
 Jes Sorensen <jds@kom.auc.dk>, Gerd Knorr <kraxel@goldbach.in-berlin.de>,
 Jingoo Han <jingoohan1@gmail.com>, Oliver Kropp <dok@directfb.org>,
 Martin Mares <mj@ucw.cz>, linux-kernel@vger.kernel.org,
 Ben Dooks <ben@simtec.co.uk>, Hannu Mallat <hmallat@cc.hut.fi>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Ghozlane Toumi <gtoumi@laposte.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jan 2021, Lee Jones <lee.jones@linaro.org> wrote:
> On Wed, 13 Jan 2021, Sam Ravnborg wrote:
>
>> Hi Lee,
>> 
>> On Wed, Jan 13, 2021 at 02:49:38PM +0000, Lee Jones wrote:
>> > This set is part of a larger effort attempting to clean-up W=1
>> > kernel builds, which are currently overwhelmingly riddled with
>> > niggly little warnings.
>> > 
>> > This patch-set clears all of the W=1 warnings currently residing
>> > in drivers/video.
>> 
>> I am sorry to say that I expect most of your nice patches to clash
>> with patches that is already present in drm-misc-next.
>> 
>> drivers/video/ are warning free with W=1 in drm-misc-next today.
>> 
>> I do not know why drm-misc-next is not yet pullled into linux-next.
>
> Well that kinda sucks.  What are the chances of that?
>
> Most of my patches fix issues that have been there for years!

We auto-update the for-linux-next and for-linux-next-fixes branches, and
they seem to be up-to-date [1].

How recent are the fixes, maybe because of this: [2]?

BR,
Jani.


[1] https://cgit.freedesktop.org/drm/drm-misc
[2] http://lore.kernel.org/r/20210114113107.622102e0@canb.auug.org.au

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
