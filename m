Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12AC583A8F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 10:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C477890437;
	Thu, 28 Jul 2022 08:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E4E90437
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 08:46:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 55DA5CE24A8;
 Thu, 28 Jul 2022 08:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D3BC433D6;
 Thu, 28 Jul 2022 08:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658997997;
 bh=PHHs5nIX4IopTV7l9ydxSupubpXxFsPpF3wfP6Uh7PQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ky2BTmaXFZnSjp5uBZezKkZ2YCjVBT+RyuWrzm7y0CDJcsvDkInuVyqDmLObAC4l1
 8DB6vrT8AMdcqKlM+5NkasDZ9wAFk9b00iQ1xNRLUD04Mk++wqh0x/9C4hCHhNqtb5
 1ldyhyqnkUC6hQp/vBYybaV4jvD21snPg6O3+jzM=
Date: Thu, 28 Jul 2022 10:46:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH v2 4/5] MAINTAINERS: Add entries for Toshiba Visconti DNN
 image processing accelerator
Message-ID: <YuJM66FM97jjA2L+@kroah.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <20220722082858.17880-5-yuji2.ishikawa@toshiba.co.jp>
 <Yt6Q3A4tkmu797eX@kroah.com>
 <TYAPR01MB6201F467FB17AD40EE907E7392949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB6201F467FB17AD40EE907E7392949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
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
Cc: linaro-mm-sig@lists.linaro.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, hverkuil@xs4all.nl, robh+dt@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Tue, Jul 26, 2022 at 06:10:40AM +0000, yuji2.ishikawa@toshiba.co.jp wrote:
> Sorry for this patch not being well formatted.
> 
> I'll add change log and the signed-off-by tag.
> I should have checked patches with checkpatch.pl as well as testing sources with --file option.

Just a normal call to checkpatch will work, no need for the --file
option.

Also for new stuff, please use the --strict to see more things that you
might also want to fix up.

For future versions, also please cc: me on this series.

thanks,

greg k-h
