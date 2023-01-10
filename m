Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD8A6641FA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 14:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBBB10E5C0;
	Tue, 10 Jan 2023 13:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3608210E5C0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 13:34:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 702176171B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 13:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF80CC433F1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673357685;
 bh=428Utdh+e6F2/hWYnKzDhqLh/AHuuQMV5oFWLJ3BKqg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PifxqQiVsu2yVxl+rvItZRxvJQ4ShpBz+CyugsIA5h6Xy6eogwCrR6tFdn76H51+9
 qwBoKfhNOJNlRtFcQ/bMGGgJu4QKQ1zCSwlKDl9DFdRWeQ/7OuSK4Hzt0+nyn6MwOP
 LqUQ7e9EXMAJOHgoyZ7zYMsA2pTYuw+LnTwCQLOXx3ZeEZ5mMZ1ziIMRcfu+vRCPDy
 4+1UlQ99l+q3b/OU3Uvclc+Se2K9gawsEzPhhFNB0o+HDCaGQ1eS6X9FFeFWslUut1
 vEK5uBOSLo4urIQZBEhY5KYGic/0vEo1sVWuCPPhuuKCyWc32c58/++vHWcWbO8jWn
 5/8lVcEXr2T9w==
Received: by mail-yb1-f171.google.com with SMTP id e21so11790011ybb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 05:34:45 -0800 (PST)
X-Gm-Message-State: AFqh2krW/VDFBoRfrFB3PBf2MH1SYuYm29+60GJy6KD1BSKVRQ0sZC9j
 J1Ose4YxS+ZY27U+B5TMtRC7c9vbiu/VW1gaV3Q=
X-Google-Smtp-Source: AMrXdXsS1IMMV97uhXnmSnvUUs5QH5SQPpbwkG6NWvv7XZpwjDjgZlqLaV0/nOrzgqw5QouMJjwR1058Lhg2O2R76U8=
X-Received: by 2002:a25:bbd1:0:b0:70b:87c6:4fe with SMTP id
 c17-20020a25bbd1000000b0070b87c604femr7421709ybk.550.1673357684837; Tue, 10
 Jan 2023 05:34:44 -0800 (PST)
MIME-Version: 1.0
References: <Y7zB4z5cxpFkPXKV@work> <20230110104609.GA1602079@linux.intel.com>
In-Reply-To: <20230110104609.GA1602079@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 10 Jan 2023 15:34:18 +0200
X-Gmail-Original-Message-ID: <CAFCwf13yp0Sj9i9Nmq_WOU0gcwfjjWz1vgzMeD5_1YWj0aWO_g@mail.gmail.com>
Message-ID: <CAFCwf13yp0Sj9i9Nmq_WOU0gcwfjjWz1vgzMeD5_1YWj0aWO_g@mail.gmail.com>
Subject: Re: [PATCH][next] habanalabs: Replace zero-length arrays with
 flexible-array members
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
Cc: linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 12:46 PM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Mon, Jan 09, 2023 at 07:39:47PM -0600, Gustavo A. R. Silva wrote:
> > Zero-length arrays are deprecated[1] and we are moving towards
> > adopting C99 flexible-array members instead. So, replace zero-length
> > arrays in a couple of structures with flex-array members.
> >
> > This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> > routines on memcpy() and help us make progress towards globally
> > enabling -fstrict-flex-arrays=3 [2].
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays [1]
> > Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
> > Link: https://github.com/KSPP/linux/issues/78
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Thanks,
applied to -next.
Oded
