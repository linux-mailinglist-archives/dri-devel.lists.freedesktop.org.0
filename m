Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9726273BA5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14D389AC6;
	Tue, 22 Sep 2020 07:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1C389AC6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:21:02 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x69so16884951lff.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 00:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YDJN3EXMJU3d3rFlGH/rbr1Jkw5/Z+5EHDzOysJfBeA=;
 b=op90nJ/Xilj6wj8zFYKVPWih3L7bMN2b/pmbPyxdblp9CDe7tU531EzGIZf2FK5fWJ
 U9zpnkChjQf1ULa+aXwAebSAB+WAL0W4tu1rwnDM54HFhNmuVxKOR+/K90NtyyWMxTe5
 lYD02J1xdeKO+3jm1a2zUBdcb0KD3Z1k/avJBxGfyg1wSQc4Vk67TxiIG7nxEwme2qrq
 svO+YCFq8aXLUVATCM/O3Z5r2GQSu1XE93bbbFTunI3Z+T5bBPAfLSRs6vkEUltRnOJ/
 8MX0LZavN3NmdDjGsQKlvrPocR/xMwp4p+St+jzyiEu5fiGx52l+DhBRXcL6l7XYpdRn
 wJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YDJN3EXMJU3d3rFlGH/rbr1Jkw5/Z+5EHDzOysJfBeA=;
 b=T2+XmF/MEzSPekmLkajS163HIJqV73kAsltJmUgwo1PYM7NqrGdMcfAeEhe/RNNmY3
 HPuMRYu1EBP5qWMNRssEZVVm8mPnOlCZkIICYIQGU7yLL/RZQXHnsENMSsBjH8K668Jd
 tpp2bsOxEeUn7uKLZL7byqktvkpCh2RYB8+TG33QmzKyJZjNY3tHjk0qLmrutrKiTGuy
 +B+TntjAanysyqAdtj6EX0f40LQhjvtuLNL7hIgkdyEOVIDzTWoS6kRxY92GcBtcsMZb
 2zVnS2NM/R7IVkd3rAkvnFFqdN78HAF2Gaz8ys5vcGps4cVSGYMPP4RzB6s9xq+qAaAu
 A8GA==
X-Gm-Message-State: AOAM533UmhI5b6a9nu3ahEG9jabAImZ+MwsNk16VTbJULe3aLxha85NR
 J11IlxXr4rwQjM8u49bQ+69+fJDYmqosI4M6IguLaQ==
X-Google-Smtp-Source: ABdhPJwh3O18KE6fGKtQXUrgxn8PXxjeImqE7D3w3MW4Mz4e1jPndLWojCXgXFlL+dyvzth3ePoQxBdjtoxLMc5pb48=
X-Received: by 2002:ac2:4a81:: with SMTP id l1mr1089424lfp.388.1600759260572; 
 Tue, 22 Sep 2020 00:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200902064407.30712-1-sumit.semwal@linaro.org>
In-Reply-To: <20200902064407.30712-1-sumit.semwal@linaro.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 22 Sep 2020 12:50:49 +0530
Message-ID: <CAO_48GHiAB1VOxd=bJWAqAh5paWAVRqLRDESiEXY_=c=uQ1jvg@mail.gmail.com>
Subject: Re: [PATCH v7 0/2]dd support for Tianma nt36672a video mode panel
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam / Theirry,

On Wed, 2 Sep 2020 at 12:14, Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> Some Poco F1 phones from Xiaomi have a FHD+ video mode panel based on the
> Novatek NT36672A display controller; Add support for the same.

This latest version (v7) had all the outstanding comments fixed, and
Bjorn has also given his r-b, so could you please get this set of
patches merged?

>

<snip>

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
