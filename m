Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD4E55AE41
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 04:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDC210EF5B;
	Sun, 26 Jun 2022 02:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4.hostedemail.com (smtprelay0010.hostedemail.com
 [216.40.44.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1E010EF5B
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 02:50:09 +0000 (UTC)
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay11.hostedemail.com (Postfix) with ESMTP id D04FD80BF9;
 Sun, 26 Jun 2022 02:50:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf17.hostedemail.com (Postfix) with ESMTPA id 8AC4219; 
 Sun, 26 Jun 2022 02:50:06 +0000 (UTC)
Message-ID: <a63132e226c2bb7b3f689cb09f7479adea5fe918.camel@perches.com>
Subject: Re: [PATCH] staging: fbtft: fix alignment should match open
 parenthesis
From: Joe Perches <joe@perches.com>
To: David Reaver <me@davidreaver.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Sat, 25 Jun 2022 19:50:05 -0700
In-Reply-To: <20220626020002.1577101-1-me@davidreaver.com>
References: <20220626020002.1577101-1-me@davidreaver.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.36
X-Stat-Signature: ie1xjhbtnmtckymqa5nbd5owyyick64u
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 8AC4219
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+0U75mtrql51gGZXBWbhJ1RhG/AW4Ea4c=
X-HE-Tag: 1656211806-344269
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2022-06-25 at 19:00 -0700, David Reaver wrote:
> Fix alignment of this line of code with the previous parenthesis, as
> suggested by checkpatch.pl:
[]
> diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/f=
b_tinylcd.c
[]
> @@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
>  	write_reg(par, 0xE5, 0x00);
>  	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
>  	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
> -		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
> +		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);

It's probably better to ignore the message in this case as the first
argument means something and the second and subsequent are the data
being written via a specific macro using NUMARGS.

