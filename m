Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAjJCn3hlGlqIgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:45:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC00E150D93
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0362510E137;
	Tue, 17 Feb 2026 21:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dzatSmBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B735B10E137
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 21:45:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EBE666185B;
 Tue, 17 Feb 2026 21:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F222CC4CEF7;
 Tue, 17 Feb 2026 21:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771364727;
 bh=JPTM2IadFeMvKIMn4IZtSDZBa3m3Kmc9Y1jeip9vad4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dzatSmBb5dRdKVM7QGegf8H9JKCVmt1CyPf4WmQL1F5Vq5SXeawmvTvZVsb4Lidi3
 9tTPWPv5cblZv1V/ofOpaxUTWKnootvYiDk6wdTAKdhIWv1fWWyljUAbFhZd+bjzko
 pLHcn6JwMnFM+UwxuY6s3DyC7rhoZdsXQlIQTzMXOhSv/iRwG+NGdcZs5nQJSk6x41
 xpkoXNEMWrORVa5tgQ6/8hquM6Aw84uaut69bgWEeNICcaA4c5BfneDqQIrZQSeis2
 lKQBfio9w2Mtf1o99NqkXh9X8R5Aur9Lw3+jfXeQax305vnY+hxAFO/PeRYw2g0Z3k
 Cx7hrRUUZ0kCg==
Date: Tue, 17 Feb 2026 14:45:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Helge Deller <deller@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [GIT PULL] fbdev fixes and updates for v7.0-rc1
Message-ID: <20260217214523.GA3380010@ax162>
References: <aZBlTsIwTzS0tqBD@carbonx1>
 <177110244909.2897141.11184148040863874004.pr-tracker-bot@kernel.org>
 <aZDpCUcIXLmuydoF@carbonx1>
 <CAHk-=wj03hLzK2D=+OYmjgcmGM+XYymp8GyaEs=C0=rXG2nb7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj03hLzK2D=+OYmjgcmGM+XYymp8GyaEs=C0=rXG2nb7w@mail.gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:deller@kernel.org,m:nsc@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AC00E150D93
X-Rspamd-Action: no action

Hi Linus,

On Sat, Feb 14, 2026 at 02:47:47PM -0800, Linus Torvalds wrote:
> [ Adding Kconfig maintainers and linux-kbuild list ]
> 
> On Sat, 14 Feb 2026 at 13:30, Helge Deller <deller@kernel.org> wrote:
> >
> > Linus, I'm really sorry, but I messed up drivers/gpu/drm/Kconfig while
> > trying to fix a merge conflict.
> > My patch series should not have touched drivers/gpu/drm/Kconfig at all.
> > That's purely my fault and not the fault of the patch author.
> 
> Humm. Funky how the Kconfig parts never complained about the
> duplication of all those source lines, so the problem was basically
> entirely hidden and things still "worked" even though that Kconfig
> file had been so messed up.
> 
> I'm not sure if the Kconfig tools could perhaps warn about this kind
> of duplication - we might have some of it intentionally - but it does
> make me go "Hmm".
> 
> Nathan, Nicolas, comments? See that commit ca4ee40bf13d for the
> partial revert, and notice how Kconfig is entirely happy both before
> and after that..

It seems like we should be able to check if we have seen an sourced
Kconfig already, presumably somewhere in or around zconf_nextfile() in
scripts/kconfig/lexer.l. Not sure how complicated it will be, I will see
if I can wire something like that up during the next development cycle
(amongst the other things on my plate). Given how wonky that looks in
menuconfig and the like, maybe it is worth making that a hard error.

Cheers,
Nathan
