Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B661F9AA7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 16:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6126E09A;
	Mon, 15 Jun 2020 14:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36B46E09A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 14:46:05 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id i8so3219985lfo.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2evxLdSYjOMMyGDiQXV+GMESd1HuNoecTxX/6bQf6M0=;
 b=YGzbZ1OOJzf8OQ2kn9AXktEQsgbGeFkyMh2kQSscYGc03DSBx3enRlXrgyetS2aszi
 8ZRYphx5pTl2r1RgsFGgwW25lwjiQmEXDR8b5L9oHMLTqFO72ANmzCayhQwS0ISl0mAk
 ypsNiINo24tH3z1mTT2yC9z0UjETwXmM4l0XLj5FVfZ6xiMdSzF+YNoGQAD9Y21YwV5K
 ALZ5nqKD7/m9PeoxXjeuTdBAfzm/Y+0ycRs+Jx/dWiACr7p3RfmUIABauhVDKMS921Nj
 AqbYeutajvAH94DZOXI7a2idYBak6SLaRG57qd7ytHQGiH372noLRH9ry5KBdNN3z+R5
 +xSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2evxLdSYjOMMyGDiQXV+GMESd1HuNoecTxX/6bQf6M0=;
 b=W99XitrG/KUqGPDir1LYSnewqrRpphW3Eqfew21SGwDa4HaU/HaNCzMPCx0MbFCjBH
 KXTBkVpFg7zExrqE9NgMcrBegYTLu5hMerXho5tW33RVQUMQDsbudaG66sGesFZdyVqA
 bzMYAfEDLj0japFDHOZOYhbROFfr4fXB6KGxWQGbwLyFDzC3RhtGE2IKNZNE3xLHt7IO
 n10vD+rsZrOf/Ng2O03Kz+wdkNEZKyjT3SENDk7UuQPDdGtFlX2FX5623qPXr0I11cob
 Ll4J3/t6F3b736KKYn4rCOz67bS4DiglfBfHKx4zcNH7Vwio3UB5ZcPU0Os1kQqnCyf6
 GcNg==
X-Gm-Message-State: AOAM532pPpkC/05TV5kj49Jmy53AgI6wsihB7UoaG32vZCKohHKTdYMW
 dgGSBIPCECbYUZE1HLLazJafza8N5jxmo2ts4HU=
X-Google-Smtp-Source: ABdhPJzGq32dl07RYow13CE+qUf72RKnAmPMdwY07CPQKZwGRAPjwP4RCmw4PbTEAhFg3bu6iX81NN4fPXlX5lqSWVw=
X-Received: by 2002:ac2:5962:: with SMTP id h2mr1573341lfp.66.1592232364108;
 Mon, 15 Jun 2020 07:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200615131934.12440-1-aford173@gmail.com>
In-Reply-To: <20200615131934.12440-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 Jun 2020 11:45:52 -0300
Message-ID: <CAOMZO5Bw5qSDirAKBTRcu4_nDafDcfDGpuNRDyuLZs9Zc=HsQA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-simple: fix connector type for LogicPD Type28
 Display
To: Adam Ford <aford173@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Adam Ford-BE <aford@beaconembedded.com>,
 stable <stable@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 10:19 AM Adam Ford <aford173@gmail.com> wrote:
>
> The LogicPD Type28 display used by several Logic PD products has not
> worked since v5.5.

Maybe you could tell which commit exactly and then put a Fixes tag?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
