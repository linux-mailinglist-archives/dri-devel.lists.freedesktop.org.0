Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536C11CE87C
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017086E7D4;
	Mon, 11 May 2020 22:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE876E5A1;
 Mon, 11 May 2020 21:06:55 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id e9so11508621iok.9;
 Mon, 11 May 2020 14:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ueyDxErctHSTRdHdQtC1WB7REi3NqF34PG0me2FzsY=;
 b=LxZGLlzYiXXZFDJqEDO2gKToEoZMfLTFUJL1nrt4xthMX1vCvFQr2DCm0Y52vHZny5
 dyffsk+Qp5EMwMYyIlwsSNKssXJBYq61PDEdcxeBfej5+kaMmedCoPJHqQhKr3Ff2qo4
 iQYRLKvfoHe4exPEZi4mUfSoVc2Di9fsa4UnRcXnuxsl+qovV1JpVoYHpcLzu5dtVDFT
 Aerk5ucfrto0LQBEK8yju7tmhhR2Gd32rhgWxSwuRctV/0iewh4OPYFieKeGdyt25ENt
 ecIgX/ExeQEcQVAHXC/59o0kwfbOkQZkMZ3lnaoXakPRv0hTyDrb5Yi//Hgaa1sZ6S+m
 2pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ueyDxErctHSTRdHdQtC1WB7REi3NqF34PG0me2FzsY=;
 b=Du+Jb7P2CFIRijHKf5m+i/8OMKjxV6jb0vb3WNjjH4KH0V2TO8QuRfxhVJWb0MwwHp
 wL9vYrDosABIb17JAlmiMK60pM/SZtSacc70uQG8fpuAoA3VYoq2xvtmAZeXKmdgU7Z/
 ecCgVoDmdsOwSy4QGz+61baH/F5bv+7S3gjII8C8RQ041cXWsTdUTGLKucOelSd3kgYJ
 1S05kURXnUV4OxqT9tUrKs6wI+BnaAyaYJof7iuTlDUTaQLEUdseK1qv0NsxhakKiGSz
 oCetlm+DtuqXdsWm2taLtAI61/FYrKEDTK24xdJTTfUCKfePBtN7pabWJI/nhDfgH1zZ
 gQmA==
X-Gm-Message-State: AGi0Pubp2oNNSZoXTlTxxfTDiXU3qtYbB/XKnmzaVyI2GIcJxJRzf10v
 e7fGvShIq96g0kOCsucDBNfGUqJ3eoUrIL4WaP0=
X-Google-Smtp-Source: APiQypIXeT2hw5xoo/BASceF3qnkTblBRgFVpJQUnRLWUxlPki1C+wwZoEefIYG+Cwy8D3bgBamhrbcwqD91QXmRVD4=
X-Received: by 2002:a02:c00e:: with SMTP id y14mr11836302jai.15.1589231214644; 
 Mon, 11 May 2020 14:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200501205201.149804-1-konradybcio@gmail.com>
 <CAOCk7NqbOsQ2Bz1K8Gkeh75pLHDaUn6MhE1T7NkMYEHOPoL0NQ@mail.gmail.com>
 <CAMS8qEWNuuo5t+D1Xq_aNbh5-GSvVSMJM6BpKX4SR=-2eBegpQ@mail.gmail.com>
In-Reply-To: <CAMS8qEWNuuo5t+D1Xq_aNbh5-GSvVSMJM6BpKX4SR=-2eBegpQ@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 11 May 2020 15:06:43 -0600
Message-ID: <CAOCk7Nr3bLD1vY_1LXNGZojxdyZZjt8Ghrdfb1spa5vF5ptYDw@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: Add MDP5 configuration for MSM8x36 and
 its derivatives, such as MSM8939.
To: Konrad Dybcio <konradybcio@gmail.com>
X-Mailman-Approved-At: Mon, 11 May 2020 22:51:58 +0000
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
Cc: freedreno <freedreno@lists.freedesktop.org>, skrzynka@konradybcio.pl,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 zhengbin <zhengbin13@huawei.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 3:03 PM Konrad Dybcio <konradybcio@gmail.com> wrote:
>
> >Is the "| 0" really adding value here?
>
> As far as I can see, it is present in every other config.

Ah, I forgot about that.

Nothing to see here.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
