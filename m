Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD15144477
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 19:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FEA88ED6;
	Tue, 21 Jan 2020 18:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A35B88ED6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 18:41:27 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id c7so1417448uaf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 10:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tkzJYN84v3RNdkCNeIa9f/kDG5CL2toNQb9rMlPqJm4=;
 b=f7qC8pByfHB7te8LCHQsFp9BrBLjm86tSGSOhK9MtQn23OSyUw3ERD01X3mhSvW+CF
 iQyAoa+iSgO3ITVSIIz9cavGY8LtpxJssQc7D6N5S0br5rgUNKyfpru/tTy00Yv9RWRg
 Cii29O0ch+z/TSqTyMe5bPmgeGTLgt//FgXTMRoaO9JdP2Q+iatvax+21Zqlz9VaA36/
 4OSQiwn5JKeAZRK+V2Rxf93Oiq6m/aHaaRPqQC8hulf2cIFTLC/0qP7/FlFe2s86ACru
 1/6xl9IbXJttgfJisNABEcqA2YAlUSyXVPZynx3DSx9D6+4juCxYd2u9k6AIbT+61ZII
 RFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tkzJYN84v3RNdkCNeIa9f/kDG5CL2toNQb9rMlPqJm4=;
 b=BL41nnOIZNwP9HWz4eb7HHWpNpe0Io1P70JEAgChdilAE9ilOyQyPdId3tumenAV3Y
 PrJqKr27Y/kBSBd3owx0gQK1mZ6gxi/MOJfBCrVqDee1SgYKAjcPjuuSkNj094d8jlVx
 LBaQl/9YpRHW7XiYkFd65FYUPd646qzvpjhhhwk1woQQ58HeUSjBsDdnmJzRiDIWekJf
 ba6yRznMi2M41yixEP3yfY5QVhOQ2Iq/SxR9cTYn4sWFmu4ymUx0TH6VnrX4o8mOZ5wc
 zckjrXM1sG16CALstTJXpdukUUJW1EXSAhaB0oNzCISqZzOFs6mpRkaGohOw+BpLc9b/
 16Wg==
X-Gm-Message-State: APjAAAVVsVwlQ7rpkE3DGu1Rj6Rv78elZvJa2RNYXzyTRLY2shQ3conf
 J92hI35P/2dbagvqPlI30D7dnmVBUVBsgkkch7M=
X-Google-Smtp-Source: APXvYqx/yATKRlpemPjRDuHNPYrmXT+njy7PwdtnkXAIFihJGaHKmjpAowoBXsN1ybySBgMkdgnEbmt/AhRrdRy3lnQ=
X-Received: by 2002:ab0:20a:: with SMTP id 10mr3913586uas.19.1579632086554;
 Tue, 21 Jan 2020 10:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20190627213707.46094-1-john.stultz@linaro.org>
In-Reply-To: <20190627213707.46094-1-john.stultz@linaro.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 21 Jan 2020 18:42:10 +0000
Message-ID: <CACvgo51FwX54nstJO8qV0=2r6=o-Pxp+kWuz1UE6idK5nGNUcA@mail.gmail.com>
Subject: Re: [PATCH v3] libdrm: modetest: Allow selecting modes by index
To: John Stultz <john.stultz@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Jun 2019 at 22:37, John Stultz <john.stultz@linaro.org> wrote:
>
> Often there are many similar modes, which cannot be selected
> via modetest due to its simple string matching.
>
> This change adds a mode index in the display output, which can
> then be used to specify a specific modeline to be set.
>
> Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v2: Reworked mode_str check per Ilia's suggestion
> v3: Added index < 0 check per Ilia's suggestion
> ---
>  tests/modetest/modetest.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
> index 9c85c07b..5e1b623a 100644
> --- a/tests/modetest/modetest.c
> +++ b/tests/modetest/modetest.c
> @@ -204,9 +204,10 @@ static void dump_encoders(struct device *dev)
>         printf("\n");
>  }
>
> -static void dump_mode(drmModeModeInfo *mode)
> +static void dump_mode(drmModeModeInfo *mode, int index)
>  {
> -       printf("  %s %d %d %d %d %d %d %d %d %d %d",
> +       printf("  #%i %s %d %d %d %d %d %d %d %d %d %d",
> +              index,
>                mode->name,
>                mode->vrefresh,
>                mode->hdisplay,

Thanks John.
Resolved a minor conflict in the above hunk and pushed to master.

Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
