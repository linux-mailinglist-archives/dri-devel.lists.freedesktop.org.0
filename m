Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D614DD1B7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 01:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59B810E8DD;
	Fri, 18 Mar 2022 00:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A3A10E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 00:12:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g20so8480460edw.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlfqT3gCisJBMTAg9owO2Ux8q0knKebgrHQt0YZbpxI=;
 b=nBDhznL6GSZim3PdexrPGQqpwQ4fFBAapWTmPPNrAt0uN427dmLC1mJrI8HXE1C1kx
 upaggKMpoTVkewUUN8f4G2ccK2tUnREtzjnOO9fkjvE2aXhO73VuvMgL2JxHG1mUNou7
 E4BgOMO9zLLV6AZpoxwm0FAG5//90kHjahP1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlfqT3gCisJBMTAg9owO2Ux8q0knKebgrHQt0YZbpxI=;
 b=muaZi44XGjhU2koHJ9k25STFAc8bo57+aWgxanx/nttUn3DmAlrwyEzWImjUJ2CbIK
 RZpEBNDfYfqDjg4vZykuwyUNUSF+nj2kvxbQuR+5nqs6/IXb9hkKPicxw2Y8/+hS4wJh
 Xeb9QHaAARC9rCNFyEbDhyB7V1AHzjMzrv/PookhCO8vjBvMBIT+/rEgODqdauGsGvzL
 q29CEbINAEy4+fzubDJm7GoxH7UnD52g5IUtdMO6naExvMU0s5AtzWH0UBMwPONqNgoo
 oJdyHvtn2sflq+tcrKUzKMd9nQqjFunEYQzUUFEIfBxMOPGFBkEWr/AvNwHsPlyOcnJg
 UJsQ==
X-Gm-Message-State: AOAM530aH4W/FO16YIjfF+8JjpMqkIR4jii3RqEPCY2lZwvUck0SgQIR
 0j7g10gMxmWoEB9AhM6qbqePRoC3Gdu7ADsJ92M=
X-Google-Smtp-Source: ABdhPJy6dclYhTh/m95Xv7EPqkb0JFMYAbmaUbxnv9DVyEhc/pC2muGb9im38qmf/kyiBRIHjuHCZA==
X-Received: by 2002:aa7:c4cd:0:b0:418:7c2b:e1c8 with SMTP id
 p13-20020aa7c4cd000000b004187c2be1c8mr7116563edr.4.1647562333625; 
 Thu, 17 Mar 2022 17:12:13 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 z3-20020a056402274300b004169771bd91sm3617256edd.39.2022.03.17.17.12.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:12:12 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id u16so8632902wru.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:12 -0700 (PDT)
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr6191933wrs.301.1647562331786; Thu, 17
 Mar 2022 17:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:11:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4SWtyz4fFEmvKD_N-2ioS4R65UDZRU7utQm=0CSzp=g@mail.gmail.com>
Message-ID: <CAD=FV=V4SWtyz4fFEmvKD_N-2ioS4R65UDZRU7utQm=0CSzp=g@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.
>
> Fixes: 25fdd5933("drm/msm: Add SDM845 DPU support")

The "Fixes:" format is a little wrong. Should have more digits and a
space before the parenthesis. AKA:

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

This looks good to me now other than the bad Fixes tag. I presume
you'll want to spin with the extra verbosity in the CL description
that Stephen asked for, though.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
