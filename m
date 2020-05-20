Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCB01DBE63
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 21:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224AD6E896;
	Wed, 20 May 2020 19:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0B36E896
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 19:50:52 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id m6so4543620ilq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dES2NvnWqSmRLKblNkb72ldUkwAw4mVk4pzdiCGX9aw=;
 b=Wfg3CFnB73KX9N8b5qhhBi7LaxODIlaGZaTLZdEgfyGYXImZE4d97OSlPH7cyXrLGY
 aaukRfNIJ8ovoaz0zXvz4tkzh5b3X8Ga85PhxOeB0zoK+bqYyl21rPh6mr7OuAIL81UN
 //Wu6wRc57KR72f0cqgwWv0mdKwujYObxjcGT5wjfd7is3pMI3phVKKzT0n2enHci471
 jqP53jZVeX56XWzsTufWrS6QPxrSLMjm4GOMPZJx9X89La4hHhFE1QefUaCnL9EG80B1
 Z1f2jKmBHTBj/CUZgb4oMXiBjKKf93knLILrTgAI9TCxdBCl6/rH1kWlbOLdEADNFi7Y
 UK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dES2NvnWqSmRLKblNkb72ldUkwAw4mVk4pzdiCGX9aw=;
 b=blg0c4pfNPKpSVz5c843gWhUQ5bke1x176IpeDTJOQYvDsxWIMmT89l56rN8uzRHdz
 o4hAyLHqEj39lBzOxCdQiVJULsQC9sugUodxXCezTODFNnBL/gOUqKWoqrcPeQbQLb7Z
 W5puTF6oNmYxZU63/nico/P+EppmPG6abtSZTn8jrp+NbiDFFV//fhuryReAsR2PndNg
 Tvut/LwuowpFzORNoebXuYfjR39bME/OC+BPwCLyN1BtobIm//D189D8YxHnL+qLQ1Pz
 EkDngsu/emerNaFPfJs6V0XTh8cu15tt1gHebVQP48cFylkH5o0hfrIA4SlfAigUbJ1W
 lTHA==
X-Gm-Message-State: AOAM5321RltnO7emHuKCa9gsvTpfkf7f3oOBSjf4nYu0zlG6BCIWoEIY
 GelYsrbpXISRaM+O+JY09cBv+z80MDpMOmVTbatWX2swWbM=
X-Google-Smtp-Source: ABdhPJxort0pw/NsodJ5qR0bPClMay/zT/zTBWo3WXd0LR8svsV5QFFIiXMcWn/dcP2Jo9XLX+KQDXEdssQpBlUhFA8=
X-Received: by 2002:a05:6e02:f4e:: with SMTP id
 y14mr5535473ilj.165.1590004251277; 
 Wed, 20 May 2020 12:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200520064602.GA20133@intel.com>
 <20200520130808.44095-1-sean@poorly.run>
In-Reply-To: <20200520130808.44095-1-sean@poorly.run>
From: Sean Paul <sean@poorly.run>
Date: Wed, 20 May 2020 15:50:15 -0400
Message-ID: <CAMavQK+1f1DUJmCeUa5GvOLUBKiXtXH04VZtStqWmhXGazQD-g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/hdcp: Add additional R0' wait
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
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
Cc: Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 20, 2020 at 9:08 AM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> We're seeing some R0' mismatches in the field, particularly with
> repeaters. I'm guessing the (already lenient) 300ms wait time isn't
> enough for some setups. So add an additional wait when R0' is
> mismatched.
>

I think my guess was wrong and now suspect this issue is fixed with
"drm/i915/hdcp: Avoid duplicate HDCP enables".

While this patch probably still has some value in cases where R0' is
slow to update, I don't have any concrete examples where it helps.

Sean


> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>
> Changes in v2:
> - Actually add the delay in R0` wait (Ram)
> ---
>
> Apologies, v1 was generated from a forward port from the CrOS kernel and
> patch got confused and put the diff in V' wait instead of R0' wait.
>
> Pay closer attention, Sean.
>
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 2cbc4619b4ce..3c2d8c0a6da6 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -743,6 +743,9 @@ static int intel_hdcp_auth(struct intel_connector *connector)
>                 if (!wait_for(intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)) &
>                               (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC), 1))
>                         break;
> +
> +               /* Maybe the sink is lazy, give it some more time */
> +               usleep_range(10000, 50000);
>         }
>
>         if (i == tries) {
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
