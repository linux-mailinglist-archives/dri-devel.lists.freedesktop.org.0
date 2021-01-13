Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE52F52EC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 20:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BDF6E891;
	Wed, 13 Jan 2021 19:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9076E891
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 19:01:32 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6981F804E7;
 Wed, 13 Jan 2021 20:01:20 +0100 (CET)
Date: Wed, 13 Jan 2021 20:01:18 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/31] Rid W=1 warnings from Video
Message-ID: <20210113190118.GA180942@ravnborg.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=agyv3xnNEhhBd4aT2ugA:9 a=CjuIK1q_8ugA:10
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
Cc: "Eddie C. Dost" <ecd@skynet.be>, linux-fbdev@vger.kernel.org,
 Anthony Tong <atong@uiuc.edu>, Alex Kern <alex.kern@gmx.de>,
 dri-devel@lists.freedesktop.org, Oliver Kropp <dok@directfb.org>,
 Software Engineering <lg@denx.de>, Antonino Daplas <adaplas@pol.net>,
 Frodo Looijaard <frodol@dds.nl>, Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Urs Ganse <ursg@uni.de>, Thibaut VARENE <varenet@parisc-linux.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Helge Deller <deller@gmx.de>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Ani Joshi <ajoshi@unixbox.com>,
 Emmanuel Marty <core@ggi-project.org>,
 "Mark D. Studebaker" <mdsxyz123@yahoo.com>,
 Alex Dewar <alex.dewar90@gmail.com>, daniel.mantione@freepascal.org,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 carter@compsci.bristol.ac.uk, Alan Cox <alan@redhat.com>,
 Jeff Garzik <jgarzik@pobox.com>, Ilario Nardinocchi <nardinoc@cs.unibo.it>,
 Jakub Jelinek <jakub@redhat.com>, Ani Joshi <ajoshi@shell.unixbox.com>,
 "Thomas J. Moore" <dark@mama.indstate.edu>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Fremlin <vii@users.sourceforge.net>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 William Rucklidge <wjr@cs.cornell.edu>, Paul Mundt <lethal@chaoticdreams.org>,
 Brad Douglas <brad@neruo.com>, Ralph Metzler <rjkm@thp.uni-koeln.de>,
 James Simmons <jsimmons@users.sf.net>, Ghozlane Toumi <gtoumi@laposte.net>,
 Jim Hague <jim.hague@acm.org>,
 Egbert Eich <Egbert.Eich@physik.tu-darmstadt.de>,
 Jes Sorensen <jds@kom.auc.dk>, Gerd Knorr <kraxel@goldbach.in-berlin.de>,
 Jingoo Han <jingoohan1@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Martin Mares <mj@ucw.cz>,
 linux-kernel@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>,
 Hannu Mallat <hmallat@cc.hut.fi>, Philip Edelbrock <phil@netroedge.com>,
 Jakub Jelinek <jj@ultra.linux.cz>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,

On Wed, Jan 13, 2021 at 02:49:38PM +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> This patch-set clears all of the W=1 warnings currently residing
> in drivers/video.

I am sorry to say that I expect most of your nice patches to clash
with patches that is already present in drm-misc-next.

drivers/video/ are warning free with W=1 in drm-misc-next today.

I do not know why drm-misc-next is not yet pullled into linux-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
