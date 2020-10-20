Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D148D293D60
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 15:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71236EC9B;
	Tue, 20 Oct 2020 13:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FE86EC9B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 13:33:47 +0000 (UTC)
Date: Tue, 20 Oct 2020 13:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603200824;
 bh=/qrUNfD2un69gxG7TsoELDfBz6AJjk4bWWrDR11SIRo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=f8JFuCgnNviWjNP2rrge7mRkY1WE1nSs7L1IBv/xF1kqJgwpaSGwMprxWNmeKLD1R
 ajQLe3gvIGPjr551eSJJfkxW6s7Tz4mk64OwgFu0G6BZbKt3bdqnOGelUapxajOp0R
 g9vj5LGF3Uve5fvREpmC9qaEUa6SuOJ0AANVBwpQXiM8NV+WqIYoWv+K+dEqvHsqDb
 HLPPy2y4EdFOyt5katxxjEy+orKf/o+T6v9snRnWuuEhTePt4nxzl1K2+U0DnJy+Az
 +ec6xoPH7Qvsd79QZeTt+WW0LcPUdecZ/P8g4PlF8lYOsSekxGjhFwXW008J8MaYsN
 R30N/EBAw60kg==
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 0/5] Introduce drm scaling filter property
Message-ID: <SPCOniYxuZnmPvS-BpjG2y_Hb_qbNbLe07PpRGY0XCmm8F4SsMsG6uEM84YRiVoLUvDrYpiIAGE6T99HNs3h4X6Vk49TVsBZna-VfgLoNlI=@emersion.fr>
In-Reply-To: <vAUfKEENNAi4ZswHsZfaOx4XnRIPIaMJkD4soWMaRs5uMwMW8gTwVDm0yMbfOSk6E8yjFanRUUe1asYjMgg-bOOOUI_pvJlcNtCQhNzR418=@emersion.fr>
References: <20201012184130.937-1-pankaj.laxminarayan.bharadiya@intel.com>
 <vAUfKEENNAi4ZswHsZfaOx4XnRIPIaMJkD4soWMaRs5uMwMW8gTwVDm0yMbfOSk6E8yjFanRUUe1asYjMgg-bOOOUI_pvJlcNtCQhNzR418=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "sameer.lattannavar@intel.com" <sameer.lattannavar@intel.com>,
 "daniels@collabora.com" <daniels@collabora.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lorusak@gmail.com" <lorusak@gmail.com>,
 "themagnificentmrg@gmail.com" <themagnificentmrg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 13, 2020 4:26 PM, Simon Ser <contact@emersion.fr> wrote:

> On Monday, October 12, 2020 8:41 PM, Pankaj Bharadiya pankaj.laxminarayan.bharadiya@intel.com wrote:
>
> > Now, Sameer has implemented Integer scaling in Kodi Retro gaming
> > framework which demonstrate how Integer scaling gives distinctive
> > look to pixel art games when played on higher resolution monitors.
> > Kodi patches are reviewed and accepted for merge now.
> > Here is the userspace patch series link:
> > https://github.com/xbmc/xbmc/pull/18194
>
> As a side note, these user-space patches hard-code the kernel enum
> values [1]. This is something which we discussed some time ago [2],
> the result of the discussion is that user-space shouldn't do that.

Sameer has submitted a pull request [1] to fix this. Thanks, this looks
good to me from a uAPI usage point-of-view!

[1]: https://github.com/xbmc/xbmc/pull/18567
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
