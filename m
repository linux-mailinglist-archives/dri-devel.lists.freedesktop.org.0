Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C866AA1736
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 19:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C95610E217;
	Tue, 29 Apr 2025 17:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 536 seconds by postgrey-1.36 at gabe;
 Tue, 29 Apr 2025 17:45:11 UTC
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com
 [216.40.44.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5C710E217
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 17:45:11 +0000 (UTC)
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay01.hostedemail.com (Postfix) with ESMTP id 3286D1CF6EA;
 Tue, 29 Apr 2025 17:36:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf05.hostedemail.com (Postfix) with ESMTPA id 934AA20011; 
 Tue, 29 Apr 2025 17:35:50 +0000 (UTC)
Message-ID: <1490923bf0b7d5e32ded1393c1f7a3e4e640de5b.camel@perches.com>
Subject: Re: [PATCH] checkpatch: remove %p4cn
From: Joe Perches <joe@perches.com>
To: Aditya Garg <gargaditya08@live.com>, pmladek@suse.com
Cc: admin@kodeit.net, airlied@redhat.com, akpm@linux-foundation.org, 
 alyssa@rosenzweig.io, andriy.shevchenko@linux.intel.com, apw@canonical.com,
 asahi@lists.linux.dev, corbet@lwn.net, dri-devel@lists.freedesktop.org, 
 dwaipayanray1@gmail.com, geert@linux-m68k.org, kees@kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@rasmusvillemoes.dk, lukas.bulwahn@gmail.com, marcan@marcan.st, 
 mripard@kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 simona@ffwll.ch, 	sven@svenpeter.dev, tamird@gmail.com, tzimmermann@suse.de
Date: Tue, 29 Apr 2025 10:35:48 -0700
In-Reply-To: <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <20250428123132.578771-1-pmladek@suse.com>
 <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 934AA20011
X-Stat-Signature: ty3t4amg1am4wfranj4it66hgc5ywusk
X-Spam-Status: No, score=1.38
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/Pi+sZD950+7lYGkQr89DieUnwzGYH3J8=
X-HE-Tag: 1745948150-531653
X-HE-Meta: U2FsdGVkX1/F/WflSpAiJ6Heq+tSmgatCv6cN3WW0dk6b5ZPd+jMUMgkgjrAVyTPWC1efrCNTJDnLnXh91eX/OoUJU0btcvbXg4J60vd7JqFt34/NaVW+QRRNzNuF0kha7z0aCOJ2COg6+11wgZuD5Wkuetnuh2tOR3bfaEG14K5bxuu589aJQuZvYWDkIT1pqWusGBVw0brO2eEyTKfCxszgF1+zDiCMvANHDIbyQj+boU7QSiHxFVCMNzUeqeWvHpGJMOekc7SvDDFtH+DJ+mkKclqXy6GXWFeuEh0L8GGQi07oZHfPs5cMjaFnGUG8NJdfCJSN3/s513PP4ctRcSx11Qd6FNK
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

On Tue, 2025-04-29 at 16:07 +0000, Aditya Garg wrote:
> %p4cn was recently removed and replaced by %p4chR in vsprintf. So,
> remove the check for %p4cn from checkpatch.pl.
>=20
> Fixes: 37eed892cc5f ("vsprintf: Use %p4chR instead of %p4cn for reading d=
ata in reversed host ordering")
>=20
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 44e233b6f..f79f0a085 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6891,7 +6891,7 @@ sub process {
>  					    ($extension eq "f" &&
>  					     defined $qualifier && $qualifier !~ /^w/) ||
>  					    ($extension eq "4" &&
> -					     defined $qualifier && $qualifier !~ /^c[hnlbc]/)) {
> +					     defined $qualifier && $qualifier !~ /^c[hlbc]/)) {

Probably needs to be something like:

					$qualifier !~ /^c(?:[hlbc]|cR)$/

>  						$bad_specifier =3D $specifier;
>  						last;
>  					}

