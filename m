Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105105444E3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109A2112631;
	Thu,  9 Jun 2022 07:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D79C112D8B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 17:53:02 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-3137c877092so17133917b3.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=auWYjGrmO12LzarWgU8/f/He/qw8x0OfWAJAXSy8JA4=;
 b=ScaOGpRUTXvnCQlaUrqa38bGJWp6nx5WeYWo3sJhv9wR70OzuWBoJqnVw8uPBX+mQE
 IOn50VGwJcfsKLLTvE4jmR2ASgUPbmm7sL40828LtRfaHsF/DdThZcGrwzH3hr9j9vb3
 TD3SKF9DHaiJFIZDMdwB0heHW4RWLZfFFfBO71SJGQA0ZA2F0e7U39Cm3KGk5sTafI+0
 vncXdN7eelTAPPl1PPZR6otF9GZO7/sW84Q8yo05NgvFIX4JUK2l1VldaNhND6Kvw3ck
 8QihL/x7Xscyb2F+V8QKI/fhPijESsm8BQat2LTeNlF/2sOptnQrwJyszbte9VPetVGh
 lZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=auWYjGrmO12LzarWgU8/f/He/qw8x0OfWAJAXSy8JA4=;
 b=OlTqogvvPrIlLLY7dPxq+2hSVVnHBN/nnYN/QNOFhKWCJBsCW5EBfKWD8vVZ4INsBM
 npW/ICKzAktctEguB97FmuFdf+ulDDmYhn56LGwM0IL7lZPSX/SYlPCzDVFqwHEcxzfr
 Ubr8kPeRK5mU17LMr+ERkbo0ZgNtVSB2Fpv7rsk12R6TAZqo1gNTCFNgLJr9vpELOHQJ
 ZAHxE77pVyYsW2auWOv1Sube7SmlBoiGJIBiF91dI6Jwp4wz4Dw4ory9Z6dEClsKv/L7
 qIVTOgA3ZeunmqCO5ElV54er1ZBrMVJJPMY6Q4WBxLXSYNFgokwrzTiEc8xZkJOSiwcR
 WzEw==
X-Gm-Message-State: AOAM531wRfgi+ezKGuWVCY3p7u0JOvAgZjjjOSCd/ge1z3amMyYoLNfz
 0crY1J2W2z3sCxa1jtIBtmpwv4fJN+hS/zxW/WoNJg==
X-Google-Smtp-Source: ABdhPJxMIOaoKBRXUno4tnLibt0f7B15Qao1xtz+Mhz7w4xpjucvfVG0wz6VQHFD4YznuOECgMzAPjK+B35JLGEpuAE=
X-Received: by 2002:a81:b45:0:b0:30c:1c31:604b with SMTP id
 66-20020a810b45000000b0030c1c31604bmr40100617ywl.114.1654710781368; Wed, 08
 Jun 2022 10:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220401001810.81507-1-jo@jsfamily.in>
 <BY5PR02MB700935F5817128CB7C3991CDD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
 <BY5PR02MB70099A0E4C060E52284DCE46D9A59@BY5PR02MB7009.namprd02.prod.outlook.com>
 <CAO_48GH5V2-Z0cqGJoF68hzZjqhY6_aGxReSk+ByC_zrLWusYQ@mail.gmail.com>
 <BY5PR02MB7009AA50A0F7D570877DA646D9A49@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB7009AA50A0F7D570877DA646D9A49@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 8 Jun 2022 23:22:49 +0530
Message-ID: <CAO_48GEvQhMOst0KhM9CU9y1cv3q+4hbXM9MentRn7QPTs_mQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel: nt36672a: add backlight support
To: Joel Selvaraj <jo@jsfamily.in>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 09 Jun 2022 07:36:52 +0000
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joel,

On Wed, 8 Jun 2022 at 22:10, Joel Selvaraj <jo@jsfamily.in> wrote:
>
> Hi Sumit,
>
> On 08/06/22 22:00, Sumit Semwal wrote:
> > This is entirely my fault - It somehow missed my radar, and I didn't
> > queue it up. I will push it via drm-misc tree tonight. Apologies
> > again!
>
> No problem. Thanks for the update! So it will land on upcoming 5.19-rcs
> or 5.20-rc?
Not for 5.19-rcs for sure, but I think it should make it for 5.20-rcs?
>
> > Best,
> > Sumit.
>
> Best Regards,
> Joel Selvaraj

Best,
Sumit.
