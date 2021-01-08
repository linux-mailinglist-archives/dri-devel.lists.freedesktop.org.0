Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB7D2EF5EE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 17:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37C46E84A;
	Fri,  8 Jan 2021 16:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540B76E835;
 Fri,  8 Jan 2021 16:44:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i9so9644214wrc.4;
 Fri, 08 Jan 2021 08:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wEYZtFdJL8UqOaXWXQmAQtp/FUt4d1Fh9znRYtE/2NQ=;
 b=TeeWZzx4kG8U/PycJTvDXWk/fVXG6AnGbIYISEzLhpY7z1Bkb1aSo8GkQNnArh6vC8
 k/OFv/yyZjUOUrz2OxbFwZdr8e5lXRUhY7ch7nXF7pKdMtSGPYmRWfW+hssGMoptMqq5
 lcOg/61PpUUDeKPOn3j45r+z7ODVCyDF7J58ZBS0wQc/3kEZ7S0YK14k7i+Zor0GFUh8
 eVTlQMeS2JaiBUm8Nhs6P/5f/FEl8nO/Nmp3vf2AF436FYvoetGTtbVrg4nyVSwFcjfa
 fRhCObznsFLK179CNjbAuIHuyl4eoscRxB3TgJBhvv+1vQodY77TALD1wmxPGoHVkgU6
 4WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wEYZtFdJL8UqOaXWXQmAQtp/FUt4d1Fh9znRYtE/2NQ=;
 b=qZvuxHC6n2/Mtf29fwnJBolm4yJMvEOBMk45g4Q+86lxbCcAGUy+MiavqxX0WwEN0p
 5rd42K0lubJikhWpjh6PqAoTwQs4W3/nLN+ma0ilucWlhbBS2nEy0OpQ4AhLRfNzp9pj
 Frv5NN1trLeB18wWoLTeW0a4dJ/YL8whKaE38ZlGemQxELBC02EcmbXcDFW/l6MMNS4a
 RAQDfihFteAqb09UORfyqeCB1IqbNrIAXWCDI/epQ9rJtrECRQc/34QlN2H2WKtOZpv4
 i8vhrvj8SyIlWGJspt5znikAe0VhbrvdAUKjnQFP2raNdB1+LldyT+20plKwrpyiXRb9
 bVbg==
X-Gm-Message-State: AOAM532qZbmOOJPuw4Thb0YkmLbSbTvvZ4tqf4ZMJ0oEMvRxTHjZEeZ4
 AhLCfKdfdxqNyHImrTrXCGc12kI+/JTi/PVl7bE=
X-Google-Smtp-Source: ABdhPJw37JxMPDRe7QR5V1YZJlzOk9GO4YGeeIgQCPiOCxdK12at+OLtIDEAqjh3WeXyq80BOTTuCEm6la2a3QFWoVY=
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr4558937wrv.132.1610124273846; 
 Fri, 08 Jan 2021 08:44:33 -0800 (PST)
MIME-Version: 1.0
References: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
 <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
 <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
 <43c8779bc5f03be2e8072c6484dfcabb@codeaurora.org>
In-Reply-To: <43c8779bc5f03be2e8072c6484dfcabb@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 8 Jan 2021 08:46:52 -0800
Message-ID: <CAF6AEGsd5B0R7H1noO+=LByx4zkdVvu1LALZWnevGbMRj76m2w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>, phone-devel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Jonathan <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 8, 2021 at 6:05 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> On 2021-01-08 19:09, Konrad Dybcio wrote:
> >> Konrad, can you please test this below change without your change?
> >
> > This brings no difference, a BUG still happens. We're still calling
> > to_a6xx_gpu on ANY device that's probed! Too bad it won't turn my A330
> > into an A640..
> >
> > Also, relying on disabling LLCC in the config is out of question as it
> > makes the arm32 kernel not compile with DRM/MSM and it just removes
> > the functionality on devices with a6xx.. (unless somebody removes the
> > dependency on it, which in my opinion is even worse and will cause
> > more problems for developers!).
> >
>
> Disabling LLCC is not the suggestion, I was under the impression that
> was the cause here for the smmu bug. Anyways, the check for llc slice
> in case llcc is disabled is not correct as well. I will send a patch for
> that as well.
>
> > The bigger question is how and why did that piece of code ever make it
> > to adreno_gpu.c and not a6xx_gpu.c?
> >
>
> My mistake, I will move it.

Thanks, since we don't have kernel-CI coverage for gpu, and there
probably isn't one person who has all the different devices supported
(or enough hours in the day to test them all), it is probably
better/safer to keep things in the backend code that is specific to a
given generation.

> > To solve it in a cleaner way I propose to move it to an a6xx-specific
> > file, or if it's going to be used with next-gen GPUs, perhaps manage
> > calling of this code via an adreno quirk/feature in adreno_device.c.
> > Now that I think about it, A5xx GPMU en/disable could probably managed
> > like that, instead of using tons of if-statements for each GPU model
> > that has it..
> >
> > While we're at it, do ALL (and I truly do mean ALL, including the
> > low-end ones, this will be important later on) A6xx GPUs make use of
> > that feature?
> >
>
> I do not have a list of all A6XX GPUs with me currently, but from what
> I know, A618, A630, A640, A650 has the support.
>

From the PoV of bringing up new a6xx, we should probably consider that
some of them may not *yet* have LLCC enabled.  I have an 8cx laptop
and once I find time to get the display working, the next step would
be bringing up a680.. and I'd probably like to start without LLCC..

BR,
-R

> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
