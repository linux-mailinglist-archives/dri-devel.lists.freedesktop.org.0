Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B1C699750
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B00110EA5E;
	Thu, 16 Feb 2023 14:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A0510EA5E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:24:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8BE08B827A7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC4DC433D2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676557493;
 bh=9QcTEbNhfb2E7Jf5HaBAgY0ZbcC/NOWFAL6DW38WZUw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QKTYh6n4n0zAYz8GEPG+EnYNghYMAL8BLIbKbk+20cfoMSkC6nvnw7JsmSiiTlydl
 BkTP/UnSaXJAYoWJ0JIW7Nu9hpZhJ0C/L3k5ejbNNhKz6Lp/5XbRn22hIlpXDdKo+I
 gdZf26Exc+b6RQlvSVSvCEueXvVc18cxj2XJw8puQurSmeXAZjPcISHFCQfC74hXv8
 hsatwKFtK9wvfbRP09rITjeB7voXWEGoXlPcN/0bgSN9GlHGXu6dCCVlthOz/01giX
 NaF9mQzeh3c+BHDldgZXspY72q3X1y2csEz6tWb2gh00DvTlBeJ1qHHePLzsdsHdnr
 NURkv6sahs/ZQ==
Received: by mail-yb1-f180.google.com with SMTP id v14so1329329ybm.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 06:24:53 -0800 (PST)
X-Gm-Message-State: AO0yUKVgWkrDrSDI5ZmheMh629gnMfAKkO10e4WUFfPUC7DB6ijeMbrg
 lOlDKuo8QFVeK7l1aiX65B2Wx3489+A+9yIgovQ=
X-Google-Smtp-Source: AK7set9jd/6s/g0O5JS21TX+7/fNMwxpyQZm5ZYod9AWtFz8vS24veKvkVYG2YTezOTfDxnt3vGwfF7iDsf1iqO4J04=
X-Received: by 2002:a25:9887:0:b0:927:76bd:8824 with SMTP id
 l7-20020a259887000000b0092776bd8824mr498566ybo.414.1676557492341; Thu, 16 Feb
 2023 06:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230216105350.GC2849548@linux.intel.com>
In-Reply-To: <20230216105350.GC2849548@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 16 Feb 2023 16:24:26 +0200
X-Gmail-Original-Message-ID: <CAFCwf11FFkt7uSs9LBfx7D+6bgk648P=4GX3i+qEEy1b7ZXTKQ@mail.gmail.com>
Message-ID: <CAFCwf11FFkt7uSs9LBfx7D+6bgk648P=4GX3i+qEEy1b7ZXTKQ@mail.gmail.com>
Subject: Re: [PATCH 01/27] habanalabs/gaudi2: increase user interrupt grace
 time
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ofir Bitton <obitton@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 12:53 PM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Sun, Feb 12, 2023 at 10:44:28PM +0200, Oded Gabbay wrote:
> > @@ -3178,11 +3181,12 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
> >
> >                       /* irq handling in the middle give it time to finish */
> >                       spin_unlock_irqrestore(wait_list_lock, flags);
> > -                     usleep_range(1, 10);
> > +                     usleep_range(100, 1000);
> >                       if (++iter_counter == MAX_TS_ITER_NUM) {
> >                               dev_err(buf->mmg->dev,
> > -                                     "handling registration interrupt took too long!!\n");
> > -                             return -EINVAL;
> > +                                     "Timestamp offest processing reached timeout of %lld ms\n",
>
> Typo in offest, you can use './scripts/checkpatch.pl --codespell'
> to coughs some of those.
Thanks, I'll fix it in the patch in the tree.

@Ofir Bitton Can you please take care adding the codespell to our CI ?
Thanks,
Oded

>
> Regards
> Stanislaw
>
