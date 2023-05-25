Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E877118FC
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 23:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7CC10E774;
	Thu, 25 May 2023 21:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C50310E775
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 21:24:06 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-565a77af71fso2020367b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 14:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685049845; x=1687641845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pqBKWrOrEI+zbEK9OlZBpSdzBnSQCmjwQcZsxLNFq34=;
 b=Keu12C8b9pEdKe7GwX1dC9eCui1aDDVD+Q7tBnATclYFz7PoRomFtL2TdFCKJy75V9
 Hi1CCszSwVsyuNWuX4NeEl1tRgpVVDcgZHZDYxo5cTbyIBCH4vfte/K7F8lkInEL0Ceq
 Ta5bQOVbrutBQ+Cn+AuDpKlsna5sjHxsiwrIgyhpFlZvSuYy+veNQ8v4LtCrl3Qli40A
 8EJOmPJMIUtHjIm6IKFb5/OGNBm+CpnqFh6TMYXX1BN/eLJiweBUBOCa3a+Zj9sCdfDF
 MlU0B0fTsFgvIjGuhROYoVLT4Asewjvz+t+UBhPSLU/vcQB458hBCo62xXv3VJFmkM8K
 Eo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685049845; x=1687641845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pqBKWrOrEI+zbEK9OlZBpSdzBnSQCmjwQcZsxLNFq34=;
 b=g2mrqp2Z/p7I6epHSp7PbtnCl8naI6Hhm7n1AeU+K7IszHmdEZDosEddYIpbTcMd7I
 s2L+LIQcuesK10QFWgro2X0ykXLDW3ZDnooeaGLcWiykS38Gcza7xJSZTW3FEJfEDBcJ
 7PeyyJ/DRtt35mhUW3+ii+aOJHWjOGTdMSncjQGTBbUC6MJ9Oxym85IoORAZjsAGC4wC
 enKrOiFNgvEuT1eLDlCVR2Ik+WR/MBdk1r/R9AIeLVk0h2VQr4lIa2DoiouaCZFQYhzd
 eVeMGRlvKTODcp3ebTTgUF/TPjtOLqvadcBpesvZ5qjTMumO8oHlvIjnAXSn5B+p9G4D
 M9KA==
X-Gm-Message-State: AC+VfDxnMTCOKKOulgTPsWsPWGddYAGxhBKrNSv/EeGtfd9nKgXSxgxq
 zWucUIdUKGyvWRi/iMZEuxrDLwYTXK3DDVk9eb42CA==
X-Google-Smtp-Source: ACHHUZ4YstKIvO4GH8WsZOBXogGoInnhvvSgR7JQOxu5XIhdLUFoqTlzHFOoauc8qgBelFTIZtCQ3uOGwhBuI8EBMIw=
X-Received: by 2002:a81:8341:0:b0:55a:8226:6192 with SMTP id
 t62-20020a818341000000b0055a82266192mr1061968ywf.7.1685049844900; Thu, 25 May
 2023 14:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v14-3-bafc7be95691@quicinc.com>
 <7e5axjbnbhtdbrvtpcqnapp3p2xe2ekgj3aizssps2zesfhs22@trhwxetiif7p>
 <7ed799fe-1f0a-3d14-3244-7ca351feaf83@quicinc.com>
 <czjefqca2ye4ntnqw7smy5uiyle3hxnhsxi3so3z3ezigejikd@imtsdfvgr5p4>
In-Reply-To: <czjefqca2ye4ntnqw7smy5uiyle3hxnhsxi3so3z3ezigejikd@imtsdfvgr5p4>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 May 2023 00:23:53 +0300
Message-ID: <CAA8EJprrwnaXXstJmH-jSXZP-XiPA74reZU40+q07uTCjjav-w@mail.gmail.com>
Subject: Re: [PATCH v14 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 May 2023 at 23:18, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-24 15:38:23, Jessica Zhang wrote:
> <snip>
> > >> +  WARN_ON_ONCE(vdsc_cfg->bits_per_pixel & 0xf);
> > >
> > > You did not add linux/bug.h back, presumably because Dmitry added
> > > another use of WARN_ON_ONCE to this file in a previous series and it
> > > compiles fine as the definition trickles in via another header?
> >
> > Yep, this compiles fine without any error or warning.
>
> Yes it does, just curious (CC Dmitry) if that is expected/intended: I am
> not familiar enough with the current header includes to say for sure.
>
> Dmitry seemed to rely on it already being available in
> https://git.kernel.org/torvalds/c/2b470e5531f57c1b9bfa129cca0ee17a2ecd2183

I think I did not care about including <linux/bug.h> I checked that
current set of headers provides WARN_ON_ONCE, that's all.

> but that could have been an oversight?
>
> - Marijn



-- 
With best wishes
Dmitry
