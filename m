Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E4B15390C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 20:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFCA898C4;
	Wed,  5 Feb 2020 19:24:55 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40CD898A7
 for <dri-devel@freedesktop.org>; Wed,  5 Feb 2020 19:24:53 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id n27so2139771vsa.0
 for <dri-devel@freedesktop.org>; Wed, 05 Feb 2020 11:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mAJctpXOp7118HERLXET2DrllCvao5vObxu/nw3+/Cg=;
 b=IrCdKZxlk9MGjOVLL8nvg7LIAvfP0+eaAMZGI14LPfO2Xsvm/Oni8/zwNx3GyuHFVk
 xSLsRYvA/h9GJOGwHl3TB+be2gSu88KN9DX+j1QFvvlPQfCSgm7+m++IUH5+Awt0SV1x
 kg/476pbpukR7JOK7GsTJOiWYUwIcxVk69Ivs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mAJctpXOp7118HERLXET2DrllCvao5vObxu/nw3+/Cg=;
 b=N4PdHhyLtKl7tpRH2mrNnoI2LJ6qPw0MOjIpXWOJ5SJr32wblXEgoVV8mfTnj8erdj
 UCGvqLi8hIMpP8kRR8obejMN/c42XuXVQcodZHN0Q1RT9ZrDpN/hOz25fWwuwq+7yiET
 TsOZ/FcNXFgfWydrRnCkHrxI18cnmtEefCJRg9JINm/g3+f1p4pfXBYaoVfa9NDADIcm
 gGkYwEnFOab12Vp6GqOLneEqid96X66Vie1N2coLSqnqPzhoaG6SzP4uXaefMuJmKT10
 eLSan2GX2/ahxbuG3GrgMGktie/s78ySQipfNeUvP/UJHU8Ly0gpddz8LdsCfn4MQLu4
 hADQ==
X-Gm-Message-State: APjAAAUH1om/hFq3P2WoIsage3R0YroZHOm9vSVg7ti/ctG5fTCatMDl
 TRxSHtNI/IqvTtvjFvClSfEEFHVY/QU=
X-Google-Smtp-Source: APXvYqyos9UWxOaeggsOnSpW7eu3kVRZ10PQdKAPpVibiaL96wkBbhE4hXabxGo+6h1r4rl4Dg69EA==
X-Received: by 2002:a05:6102:4a1:: with SMTP id
 r1mr24297794vsa.53.1580930692691; 
 Wed, 05 Feb 2020 11:24:52 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176])
 by smtp.gmail.com with ESMTPSA id v21sm241847vkd.54.2020.02.05.11.24.52
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 11:24:52 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id i4so898941vkc.3
 for <dri-devel@freedesktop.org>; Wed, 05 Feb 2020 11:24:52 -0800 (PST)
X-Received: by 2002:a1f:c686:: with SMTP id w128mr2748451vkf.34.1580930691696; 
 Wed, 05 Feb 2020 11:24:51 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
 <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2020 11:24:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ux9XjUQMy4zzaz9JxZzyuZJvNB_W9ANzE140W_pDmixA@mail.gmail.com>
Message-ID: <CAD=FV=Ux9XjUQMy4zzaz9JxZzyuZJvNB_W9ANzE140W_pDmixA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To: Sharat Masetty <smasetty@codeaurora.org>
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
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 4, 2020 at 11:02 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> +                       power-domains = <&gpucc CX_GDSC>, <&gpucc GX_GDSC>;

I should note that this is going to be a PITA to land because the
patch adding "GX_GDSC" should technically land in the "clk" tree.
Without extra work that's going to mean waiting for a full Linux
release before Bjorn and Andy can land.  It might be worth sticking
the hardcoded "1" in for now instead of "GX_GDSC".  That's what we
often do in cases like this.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
