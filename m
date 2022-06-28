Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D40755E564
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 16:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6DC10E3FB;
	Tue, 28 Jun 2022 14:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F0B10E78E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 14:42:18 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id cw10so26270204ejb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s8d6e8VlgKNljLwdtvogvE7E20oujzONVvU7lH7VUVY=;
 b=Ced1WYKRTc2AY0+y4fTNHnJQ/WwposEoSjqAMPFlDhp07sjFvsN2L2jto25G8xOpX9
 wH92Ev+6hDHWOEH7caBomeAOBBOE6M3Ebjy/WIzQpAwOwNdpktv/PgFqRR/0N9jmyd3P
 dl2D+yxP1FAwBhbWG8a/PepNjMADhV7QWm+sJ9U67i8bdpfZSd0ejdF7TKB59054NTgI
 dOH/g0g7E/bAUWS5/y56YZZKnhoKeCUwtmZLc6Ztxm3DG6/2xlbsGSu//zckLisxl6kl
 ZYjGYJs1KcA3wCj1iSGen4/M3TwGSjKCqLShIvNrWxBBTefwcUHQ758aLxZIaqyAM36h
 9FTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s8d6e8VlgKNljLwdtvogvE7E20oujzONVvU7lH7VUVY=;
 b=uWq4DdVNu6wlBjg7F1c4+f/XByOSjvMh7+WSX/gKauPe926CHoBu/UABWj7JAQvwDU
 paDiEXUsQIdMWSaj/dWpyaUn2kr21kZlBP9Q8nW+myM0qnNKgXrlCT7ZJH+oTg31IAhB
 cqStw5TP9pvMoVgAQVrr2nR8WtnzhFqH+B/eK4fii70ZWJSs+If2RWX0aEbhqTEpTcQm
 rCqfKw3IXe004OHZXe9f5cd2Y7OmVIw7f7zAvlUBSPzOtQlted96eZC8Pbnfip39k0k1
 RrH4rGEacav3OZEgD3ymByCoWtlKFReu0QJpob0U4T5nftFH5e0SqNZJ6b4l9b4eS5+1
 4LOA==
X-Gm-Message-State: AJIora8REzX6ID+KECsqGTYPikCm+Gnd57zByX6Odj1RLfPiRywuktNk
 DPljHAZrlVkqkNOZCncjMtf7rEJwgbT92YkhVqrN1SbmZSg=
X-Google-Smtp-Source: AGRyM1sPB+bqpAGxaW/+7kmrQ0Zy1eN6Ctko8Tko+6xd2JJXm0YyavGqRFgtvRCiHcC98o1oVJdKLxyIGf+ZaAv9VNQ=
X-Received: by 2002:a17:906:5d0b:b0:726:a043:fcb4 with SMTP id
 g11-20020a1709065d0b00b00726a043fcb4mr11201597ejt.508.1656427336914; Tue, 28
 Jun 2022 07:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656409369.git.mchehab@kernel.org>
 <e0a1fd8942a0e13ecf391ccd5634759d2281e2c2.1656409369.git.mchehab@kernel.org>
In-Reply-To: <e0a1fd8942a0e13ecf391ccd5634759d2281e2c2.1656409369.git.mchehab@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Jun 2022 10:42:05 -0400
Message-ID: <CADnq5_PAW_et564Sjt7HvQwnqcMyzukc3paeU-pWPMKRM55DMA@mail.gmail.com>
Subject: Re: [PATCH 13/22] drm: scheduler: add a missing kernel-doc parameter
To: Mauro Carvalho Chehab <mchehab@kernel.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 5:46 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Add a description for struct device at drm_sched_init(), in order
> to solve this warning:
>
>         drivers/gpu/drm/scheduler/sched_main.c:999: warning: Function parameter or member 'dev' not described in 'drm_sched_init'
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Generally in the drm tree we use / rather than : in the patch titles.  E.g.,

drm/scheduler: add a missing kernel-doc parameter

With that fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>


> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/22] at: https://lore.kernel.org/all/cover.1656409369.git.mchehab@kernel.org/
>
>  drivers/gpu/drm/scheduler/sched_main.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 76fd2904c7c6..b45bd8473e9e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -987,6 +987,7 @@ static int drm_sched_main(void *param)
>   *             used
>   * @score: optional score atomic shared with other schedulers
>   * @name: name used for debugging
> + * @dev: pointer to struct device
>   *
>   * Return 0 on success, otherwise error code.
>   */
> --
> 2.36.1
>
