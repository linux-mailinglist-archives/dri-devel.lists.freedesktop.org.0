Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7A72C6CD8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 22:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7926F40E;
	Fri, 27 Nov 2020 21:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0109.hostedemail.com
 [216.40.44.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C346F40E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 21:16:52 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 49B1E18225647;
 Fri, 27 Nov 2020 21:16:49 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:857:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3872:4321:5007:6742:6743:7652:8879:10004:10400:10848:11026:11232:11657:11658:11914:12043:12048:12296:12297:12740:12895:13069:13311:13357:13439:13868:13894:14181:14659:14721:21080:21627:21740:21773:30054:30075:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: way41_430dcee2738b
X-Filterd-Recvd-Size: 3518
Received: from [10.0.0.26] (cpe-23-242-83-182.socal.res.rr.com [23.242.83.182])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Fri, 27 Nov 2020 21:16:43 +0000 (UTC)
Message-ID: <f8b2737702e295b9f780b98f27faac759ffff7ae.camel@perches.com>
Subject: Re: [PATCH v1 02/28] video: fbcon: Use pr_debug() in fbcon
From: Joe Perches <joe@perches.com>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Date: Fri, 27 Nov 2020 13:16:41 -0800
In-Reply-To: <20201127195825.858960-3-sam@ravnborg.org>
References: <20201127195825.858960-1-sam@ravnborg.org>
 <20201127195825.858960-3-sam@ravnborg.org>
User-Agent: Evolution 3.38.1-1 
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Peter Rosin <peda@axentia.se>, Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Jiri Slaby <jirislaby@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Peilin Ye <yepeilin.cs@gmail.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-11-27 at 20:57 +0100, Sam Ravnborg wrote:
> Replacing DPRINTK() statements with pr_debug fixes
> W=3D1 warnings.
> And moves to a more standard logging setup at the same time.
[]
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/=
fbcon.c
[]
> @@ -1015,9 +1007,9 @@ static const char *fbcon_startup(void)
> =A0	rows /=3D vc->vc_font.height;
> =A0	vc_resize(vc, cols, rows);
> =A0
> =

> -	DPRINTK("mode:   %s\n", info->fix.id);
> -	DPRINTK("visual: %d\n", info->fix.visual);
> -	DPRINTK("res:    %dx%d-%d\n", info->var.xres,
> +	pr_debug("mode:   %s\n", info->fix.id);
> +	pr_debug("visual: %d\n", info->fix.visual);
> +	pr_debug("res:    %dx%d-%d\n", info->var.xres,
> =A0		info->var.yres,
> =A0		info->var.bits_per_pixel);

It'd be nicer to reindent the subsequent lines too.

> @@ -3299,7 +3291,7 @@ static void fbcon_exit(void)
> =A0
> =

> =A0		if (info->queue.func)
> =A0			pending =3D cancel_work_sync(&info->queue);
> -		DPRINTK("fbcon: %s pending work\n", (pending ? "canceled" :
> +		pr_debug("fbcon: %s pending work\n", (pending ? "canceled" :
> =A0			"no"));

perhaps:

		pr_debug("fbcon: %s pending work\n", pending ? "canceled" : "no");


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
