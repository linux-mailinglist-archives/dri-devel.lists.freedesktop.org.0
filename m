Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098BA1416E6
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 10:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1A96F9E0;
	Sat, 18 Jan 2020 09:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183C86F4F9;
 Fri, 17 Jan 2020 10:59:51 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id h8so25551385iob.2;
 Fri, 17 Jan 2020 02:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b1W+1tNt7mzVWLiRP9zTR54IrHdo1Wi4KI2T1N1KRn4=;
 b=SYiiJAtI6qekuwlu7bpgNew9pgGNZCZJUy4S3w9CfPWXyCM+0ZalBOBDT+O2A6CJfd
 3WnYFeoni3+tmsT8p1DnvGoDACfbwksQsP6qlkOVcFsTVzWGD/2xLns96iAsXQH4XjHG
 EjnyFqcFcSJ8w47Ml7pEmu+OhuoWIHYDZbGcUyMEJpcewLzF7sxoTDh+6EG0ML8oBLAF
 nMzKTg6A3fG0DQ9HU4cR74pAX9zob/xtno1yIiI5xGYtwpmOhKbreKkUy4NeZdSdi+CF
 v6Q2Q1qkIY89bsLZWHJjmev2ospDdRLecLTsPDbtjVa6yBOlPQIHjAK2nTfLljIxaxrX
 VGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1W+1tNt7mzVWLiRP9zTR54IrHdo1Wi4KI2T1N1KRn4=;
 b=aW5I2HgJIPjdkK1rmSCf1D9/Q/A9d2EMZW1I/NAZGcHbctNQqhl11L3nPSl+yPiKc2
 dYGDBRqAOjzacGwe0PLJ+hwSD0EfQ8IHm5KyhFcl+Zul4O5u6slxc+M+6vkCTZ4JHLGs
 NtWU2/WXOr94G5+GqOGhxwrMcqz6iAkxm/p8WXat5QkNogZYxf88s7GPyzgzilXOoxZ5
 8SCE+SeW+wdDF/rJwnNQCOvqGo11OJNtxRYgmexanyloOy4arfD6vZeK8qBHw0fEd9m5
 WqX7AulubWG8IrF075dMIhA7vk9EwBkRFwZL9m7UmEUNwHMdruMvF3A95L2j7PlbY+Al
 FNkQ==
X-Gm-Message-State: APjAAAVL9Im3vw7iTqi39MRTvSfbK0Rs0MQtfvRET9u1T7ADOv9cFbhG
 Mu7M5n9LfVV9Gf77zBf8WALoUo1A8f4Y3EI/fqDXhJRVoeU=
X-Google-Smtp-Source: APXvYqxpUSrw8OKIJU+pupxnh2g00DrbizM3Vl3ADeeQCYmdscVZyh6WwBom7Zxsz4RvrDCtXuM3bGh8kt3Lzx6PlKw=
X-Received: by 2002:a5d:9f05:: with SMTP id q5mr30837264iot.199.1579258790129; 
 Fri, 17 Jan 2020 02:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20200104122217.148883-1-dor.askayo@gmail.com>
In-Reply-To: <20200104122217.148883-1-dor.askayo@gmail.com>
From: Dor Askayo <dor.askayo@gmail.com>
Date: Fri, 17 Jan 2020 12:59:39 +0200
Message-ID: <CAO80jNS795mgHCp3XedZQ1o1QHbwxb8DeuSqPtKHmKbAVYsfmg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: do not allocate display_mode_lib
 unnecessarily
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Sat, 18 Jan 2020 09:55:11 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 4, 2020 at 2:23 PM Dor Askayo <dor.askayo@gmail.com> wrote:
>
> This allocation isn't required and can fail when resuming from suspend.
>
> Bug: https://gitlab.freedesktop.org/drm/amd/issues/1009
> Signed-off-by: Dor Askayo <dor.askayo@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index dd4731ab935c..83ebb716166b 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2179,12 +2179,7 @@ void dc_set_power_state(
>         enum dc_acpi_cm_power_state power_state)
>  {
>         struct kref refcount;
> -       struct display_mode_lib *dml = kzalloc(sizeof(struct display_mode_lib),
> -                                               GFP_KERNEL);
> -
> -       ASSERT(dml);
> -       if (!dml)
> -               return;
> +       struct display_mode_lib *dml;
>
>         switch (power_state) {
>         case DC_ACPI_CM_POWER_STATE_D0:
> @@ -2206,6 +2201,12 @@ void dc_set_power_state(
>                  * clean state, and dc hw programming optimizations will not
>                  * cause any trouble.
>                  */
> +               dml = kzalloc(sizeof(struct display_mode_lib),
> +                               GFP_KERNEL);
> +
> +               ASSERT(dml);
> +               if (!dml)
> +                       return;
>
>                 /* Preserve refcount */
>                 refcount = dc->current_state->refcount;
> @@ -2219,10 +2220,10 @@ void dc_set_power_state(
>                 dc->current_state->refcount = refcount;
>                 dc->current_state->bw_ctx.dml = *dml;
>
> +               kfree(dml);
> +
>                 break;
>         }
> -
> -       kfree(dml);
>  }
>
>  void dc_resume(struct dc *dc)
> --
> 2.24.1
>

I've been running with this fix applied on top of Fedora's
5.3.16-300.fc31.x86_64 kernel for
the past two weeks, suspending and resuming often. This the first time
since I bought my
RX 580 8GB more than a year ago that I can suspend and resume reliably.

I'd appreciate a quick review for the above, it really is a trivial change.

Thanks,
Dor
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
