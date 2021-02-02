Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1A630B461
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 02:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432706E516;
	Tue,  2 Feb 2021 01:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289D16E243;
 Tue,  2 Feb 2021 01:04:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c12so18619995wrc.7;
 Mon, 01 Feb 2021 17:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Zh2Ei6J61XQxwQGIOp0JjNjlDIhrnbirBPmQD0bdfE=;
 b=oAq5tF2giAnF45SikHwCnfJ/wedC8EeUwTbA9Xj81mtid2GED8hf+tcDz5ofDAk317
 Fppcmk4PAncYIQh4qiEBMLQ9hI2XMwTQaxLakLvLXyC0gSvobWI1m5Moy+vPe2DeSYFe
 lguwTOuTfogmRYcze/aKTYtC9cye3ylJrwMi1Jpzu4yNv8e7IDp2F/gOygZUNu7PSmct
 qbA3KYuxMnPww+TJfeydaQRrB+5WhALpNiGlx+khPIViqqawzIw2Lq4gVG6JWFgkPDvA
 sysMD2kmf36qyUbNUWxlRYMbb/kCdaxqzxeZDYWcmOgKX0IYUIzE2NBDijHwBXDXwKbl
 CKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Zh2Ei6J61XQxwQGIOp0JjNjlDIhrnbirBPmQD0bdfE=;
 b=ELTxnl7pCn4eK3hPf7/dwAeXKI7KyfuG3jogwbip2ztOngSlf1kPEXSZrLKH9CvpN+
 peYnjuGXvLaolPSXq/sHvM9fmzdjL3ptnodTzZTXA2OEpV7NUyQ25Ycy00CE32Oes6Ul
 tigQpZEOcZIqwaCcUzqnvbNgf8db5lpU4m6tRIhtjUCquI0yJdcApPef3a9e3HAuT0sZ
 xXTw1sflrkBdYf6vyDL4tbvoSf5HlNAAEAOReUnvvUXd+ITW9KJzrFpEcHMi7VyUkg7f
 fFCDfcU42LpUtgDaytIrDg7SyGZBxFt2PUV7UQl1ODu9aHyV2QMq3fvUbl76lFFqgZ8E
 VhGQ==
X-Gm-Message-State: AOAM5321b8VUXbyyv4ibUINH3Cc/MS0IW4JTnt7JsGlBXEXzh4++X/g1
 BFrpAXj8LLVJR+w3TgClMXOF0tnjMQHHvtfSvBePIRL8G+8=
X-Google-Smtp-Source: ABdhPJzgYO8rG50sO+X2rVodTZe3f9r/4Cc5A9+EWJ7mWEPGrb9BUttVfkcu8UVWXTTk+U2kkzsGYdd6g2rGkiO1bdQ=
X-Received: by 2002:a5d:4b8e:: with SMTP id b14mr20353628wrt.130.1612227858834; 
 Mon, 01 Feb 2021 17:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20210127194047.21462-1-christianshewitt@gmail.com>
 <CAKGbVbtaDHmukvfF=sfSmWHVdAYoF6-i4RTzsPQ6zfsjHcGNCw@mail.gmail.com>
 <2c8d2b9e-c1cc-1157-19de-409957ecf9da@arm.com>
In-Reply-To: <2c8d2b9e-c1cc-1157-19de-409957ecf9da@arm.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 2 Feb 2021 09:04:07 +0800
Message-ID: <CAKGbVbuLRvZaZNfU-pi=7vqJZO2zOHAkrjTo6vs9BKLrV21O8g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/lima: add governor data with pre-defined thresholds
To: Lukasz Luba <lukasz.luba@arm.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OK, I see. Patch is also:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Regards,
Qiang

On Mon, Feb 1, 2021 at 5:59 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
>
>
> On 1/30/21 1:57 PM, Qiang Yu wrote:
> > This patch gets minor improvement on glmark2 (160->162).
>
> It has bigger impact when the load is changing and the frequency
> is stuck to min w/o this patch.
>
> >
> > Seems there's no way for user to change this value, do we?
> > Or there's work pending to expose it to sysfs?
>
> True there is no user sysfs. I've proposed a patch to export these via
> sysfs. Chanwoo is going to work on it. When it will land mainline, it's
> probably a few months. So for now, the fix makes sense.
>
> Regards,
> Lukasz
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
