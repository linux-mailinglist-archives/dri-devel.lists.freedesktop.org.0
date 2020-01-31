Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A5314F4E9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 23:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729166FC53;
	Fri, 31 Jan 2020 22:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A666FC52
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 22:38:29 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id z24so3189388uam.7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 14:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A/QwXMv8QAmipbLMot4MaxUhNNvwb0UK1sNHG1c0AVY=;
 b=n+bPBIjWQxxmXcyNtF2EyFmopFozDQdpVp68Vj3mgGrFckg86ApNTNEWR0uFO0/7DG
 vyaxvdDQ9kAE++SLmKRA5v1t6u/ZjszK4NJAbdXgkmSgqli8p4OjpqQKtuJ6Scaf7brq
 ZmpnT/9SmPlPX8EFH7dJW+bzBbfm/BGo+QXbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A/QwXMv8QAmipbLMot4MaxUhNNvwb0UK1sNHG1c0AVY=;
 b=TQRrNiUsiz6p85+WHW24Bcj7XE89EvQjr8FXnPWWRygBAPnt0XQYYqMYfdL6WPZhTE
 SzNyb/J0BapOHHd3FnmLVz0EAnU25SAmACsP6fDCilA/OyYTmvxCO3PZQsXWfWwlWht0
 dJ8a4Ep4HEzBQIH+CKGj9IjOuFNU68fIudoiAdxxfWkSbfpq2PiWeXZ1j0AoOxR/A0kl
 +cQoKtjUg6s7U4rjrzlymWpCaFBoCwGYrbitCsSBQ0nbMTfNNKYG4O+2PkvzaKTK9Wxz
 HIS2GwO1X3LwRuYcv4ZnHvRafsVVEaJrn+QfGyGjjCJPJtlQ3TODCZGujlZSEm9oG0HV
 y2AQ==
X-Gm-Message-State: APjAAAVitqYVrAU7IIT42C6ze65s58z+kNgZD6LrUPEos12rg3g0AiN3
 9bXZODoH9ceQp/XiBkiw3wfuiIFW3Oc=
X-Google-Smtp-Source: APXvYqxXlLr5Avd7X1QGB7jxbvEtD8x+cc+Ik0DtM0+N6cHg+9WiPCIdaEnsTCC31Rfs+B36xX0nMg==
X-Received: by 2002:ab0:714c:: with SMTP id k12mr7468923uao.124.1580510307948; 
 Fri, 31 Jan 2020 14:38:27 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175])
 by smtp.gmail.com with ESMTPSA id h67sm3062863vka.25.2020.01.31.14.38.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 14:38:26 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id w4so931651vkd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 14:38:25 -0800 (PST)
X-Received: by 2002:a1f:a9d0:: with SMTP id s199mr7858217vke.40.1580510305500; 
 Fri, 31 Jan 2020 14:38:25 -0800 (PST)
MIME-Version: 1.0
References: <1579774675-20235-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1579774675-20235-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Jan 2020 14:38:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XnS893yXNcm6RKV_3Do5b8hR2=nj=Y03Ymw7fbU+Zwng@mail.gmail.com>
Message-ID: <CAD=FV=XnS893yXNcm6RKV_3Do5b8hR2=nj=Y03Ymw7fbU+Zwng@mail.gmail.com>
Subject: Re: [PATCH] msm:disp:dpu1: add UBWC support for display on SC7180
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, travitej@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Harigovindan P <harigovi@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jan 23, 2020 at 2:19 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Add UBWC global configuration for display on
> SC7180 target.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 58 +++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)

I didn't do any sort of review of this patch, but I can say that
without it the screen on my sc7180-based device is super glitchy and
when I add this patch in the glitchies are gone.  Thus:

Tested-by: Douglas Anderson <dianders@chromium.org>

...one note is that the subject of this patch seems a bit
non-standard.  I would have expected a tag more like "drm/msm/dpu:"
instead of "msm:disp:dpu1:".  Presumably if the maintainer cares when
landing he/she could fix that up, but something to think about for
future patches.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
