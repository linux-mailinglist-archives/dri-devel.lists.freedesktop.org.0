Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB5D28D02E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 16:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B106E8EE;
	Tue, 13 Oct 2020 14:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237BD6E117;
 Tue, 13 Oct 2020 14:26:12 +0000 (UTC)
Date: Tue, 13 Oct 2020 14:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1602599169;
 bh=PQvbxzghovjs3oRf2pQOsVtvAQfLtPYciunbnG4np3w=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=EKVM7Wngj5W0/jnAOsG9kGCn4+GUCqDZEZFO8hE0Uqinuu6OjGT1sJN3jZX4Ad6Pf
 fzmOiQPDdCT1fO8hS8bVH1d2jbob+plDGzfIhoD0Id++ezGO53U8JZWIteEYjPQzFF
 EjMSx4JS7iXNabN/2B1SJX2OI2R99vRZXxH7al331aYLFImOoSY0ukZjsOBVKE83oP
 TrE7cXyCM80B4EmTB/FbnRD6hrQz0AgrpYCPMLqrE805d5HCrth4WMESCDz80rnHMO
 6pr5wdOkP11RtqRXGh2BI+l2LZQAt8fHOq4yWjoAWCf3ob2lty6Qh7m2Xfpsxx3TAN
 RLlgNAS88Dp9w==
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 0/5] Introduce drm scaling filter property
Message-ID: <vAUfKEENNAi4ZswHsZfaOx4XnRIPIaMJkD4soWMaRs5uMwMW8gTwVDm0yMbfOSk6E8yjFanRUUe1asYjMgg-bOOOUI_pvJlcNtCQhNzR418=@emersion.fr>
In-Reply-To: <20201012184130.937-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20201012184130.937-1-pankaj.laxminarayan.bharadiya@intel.com>
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

On Monday, October 12, 2020 8:41 PM, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:

> Now, Sameer has implemented Integer scaling in Kodi Retro gaming
> framework which demonstrate how Integer scaling gives distinctive
> look to pixel art games when played on higher resolution monitors.
>
> Kodi patches are reviewed and accepted for merge now.
>
> Here is the userspace patch series link:
> https://github.com/xbmc/xbmc/pull/18194

As a side note, these user-space patches hard-code the kernel enum
values [1]. This is something which we discussed some time ago [2],
the result of the discussion is that user-space shouldn't do that.

[1]: https://github.com/xbmc/xbmc/pull/18194/files#diff-94967b31726326769b31635c3dd7fc9b50d003057b49306a136b6b702795dd96R30
[2]: https://lists.freedesktop.org/archives/dri-devel/2020-April/261055.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
