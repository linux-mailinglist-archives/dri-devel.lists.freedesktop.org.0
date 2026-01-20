Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APc3KzYJcGlyUwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:01:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162EE4D680
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFA110E65D;
	Tue, 20 Jan 2026 23:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="popOrSrT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755EE10E65D;
 Tue, 20 Jan 2026 23:01:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C8E860007;
 Tue, 20 Jan 2026 23:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1907BC16AAE;
 Tue, 20 Jan 2026 23:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768950064;
 bh=dClrHcKLkN3Omg1AAuVft+c2sQj8sX7paCLkftkiBBc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=popOrSrTL9zTWJldNDPUB2j/MRzDfzsPuDzrbGZEMz2xV40sXWFd2sKeg2EY4sjqR
 L0eryVBnxe5jnFEBcFxlvb5PVt1l7BrJxRnIGEPt80GYYVNsJcH639kCJy+hpbwKS8
 CEGdEWam6jmlu6Ig7XcnTwnroRUvpOEKqzUR9ZHmwRpcUtEKr3lw+DFcTl2X6Ly8hB
 YpQw6oZ3LmlQ698uP+J1c0w7g96Yt7qi/iEzBfbdCOGX9ZMmZ73NgtEa5HSVcPZATa
 W3U3abd+19StFhluNNTVpRntJ/48m7uV4OJyrpb29gzWdaPqNl1AecSeVWDo+Lu3pT
 Wrx/3WLNCpeAQ==
Date: Wed, 21 Jan 2026 00:00:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>, Carlos Bilbao <carlos.bilbao@kernel.org>,
 David Airlie <airlied@gmail.com>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hu Haowen <2023002089@link.tyut.edu.cn>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nsc@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter
 <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, Yanteng Si
 <si.yanteng@linux.dev>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Avadhut Naik <avadhut.naik@amd.com>,
 Chenguang Zhao <zhaochenguang@kylinos.cn>, David Disseldorp
 <ddiss@suse.de>, Dongliang Mu <dzm91@hust.edu.cn>, Gang Yan
 <yangang@kylinos.cn>, Kees Cook <kees@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, Steven
 Rostedt <rostedt@goodmis.org>, Tamir Duberstein <tamird@gmail.com>, Vincent
 Mailhol <mailhol@kernel.org>, WangYuli <wanyl5933@chinaunicom.cn>
Subject: Re: [PATCH 0/9] docs: Fix kernel-doc -Werror and moves it to
 tools/docs
Message-ID: <20260121000053.5e274248@foz.lan>
In-Reply-To: <87wm1bhozz.fsf@trenco.lwn.net>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
 <87wm1bhozz.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vaga.pv.it,link.tyut.edu.cn,linux.intel.com,intel.com,ffwll.ch,ursulin.net,linux.dev,lists.freedesktop.org,vger.kernel.org,linutronix.de,amd.com,kylinos.cn,suse.de,hust.edu.cn,infradead.org,linuxfoundation.org,goodmis.org,chinaunicom.cn];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lwn.net:email,conf.py:url]
X-Rspamd-Queue-Id: 162EE4D680
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jon,

On Tue, 20 Jan 2026 15:56:48 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,
> >
> > After a restful weekend and revisiting both yours and my series,
> > I'm opting to send a patch series merging both into one:
> >
> > - The first 4 patches are from my series (no changes since v5):
> >     https://lore.kernel.org/linux-doc/cover.1768642102.git.mchehab+huawei@kernel.org/T/#m81211c0ff38bbaa82b8b0b6606f242ccc0c2a9ac
> >
> > - It follows by the 2 patches from your renaming series:
> >     https://lore.kernel.org/linux-doc/20260119111745.4694546b@foz.lan/T/#m51099c31a99dccccdb4d17cbaadc818e9e4df8c4
> >
> >   with the fix I proposed for kernel-doc to find its libraries
> >
> > I added 3 patches afterwards:
> >
> >   - patch 5: move possible return values from docstring to helper message;
> >   - patch 6: improve MsgFormatter description;
> >   - patch 7: moves kerneldoc_bin from conf.py to the sphinx/kerneldoc.py
> >     (this is now just a debugging message - no need to pick it from env)
> >
> > IMO, this series is ready to be merged.  
> 
> Patch 7 adds a new warning:
> 
>   WARNING: unknown config value 'kerneldoc_bin' in override, ignoring
> 
> It needs to be taken out of sphinx-build-wrapper; I've appended the
> following patch to the series to deal with it. 

True, thanks for checking it!

> I think I'll go ahead
> and tack on a patch putting in the scripts/kernel-doc symlink, then I
> guess it's ready to go.

Go ahead. Yeah, I think that, with such changes, this series is
ready to go.
> 
> Thanks,
> 
> jon
> 
> From 4a3efd128f7da996b677151790d043ec44a00561 Mon Sep 17 00:00:00 2001
> From: Jonathan Corbet <corbet@lwn.net>
> Date: Tue, 20 Jan 2026 15:50:38 -0700
> Subject: [PATCH] docs: sphinx-build-wrapper: stop setting kerneldoc_bin for
>  Sphinx
> 
> Now that the Sphinx build does not use the kerneldoc_bin configuration
> variable, we shouldn't try to set it in the build wrapper or we get a nifty
> warning:
> 
>   WARNING: unknown config value 'kerneldoc_bin' in override, ignoring
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  tools/docs/sphinx-build-wrapper | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
> index cb2a5005e633..9f1ae1485f84 100755
> --- a/tools/docs/sphinx-build-wrapper
> +++ b/tools/docs/sphinx-build-wrapper
> @@ -750,7 +750,6 @@ class SphinxBuilder:
>  
>              build_args = args + [
>                  "-d", doctree_dir,
> -                "-D", f"kerneldoc_bin={kerneldoc}",
>                  "-D", f"version={self.kernelversion}",
>                  "-D", f"release={self.kernelrelease}",
>                  "-D", f"kerneldoc_srctree={self.srctree}",

Thanks,
Mauro
