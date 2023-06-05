Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A4A721E00
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 08:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EB410E180;
	Mon,  5 Jun 2023 06:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB37610E180
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 06:20:59 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-75ebccc2c9bso17862985a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 23:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685946058; x=1688538058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFAORiJMTRPxVEgeh1ndTFRmu3jSfy3cuQSdwmDzjko=;
 b=EHIkgTAmvEZmMwuAmuxuTPnBbWnXpbEf5cvOvLV1l+4CdkBMC4sEnPA3GgIYwWC3NZ
 PAay1CpIBJ8jFUPXGTXHnwYnX+Vcz/SWeMQUymzqOTqLHFHVvuY65LLdD96K61BoyBI7
 TLPNd5qXpe428zvQcaVm9BrPU/oW2rxnz5LGabcIFqmUdJJDETcaBzA5wIRiDPkaRla6
 irpbQ5BTqg+o/prUzE4Lmj6zDZLTTpGA5mXdDNvvY0miZb0S3Se8M0YNVB/Afnr6Argp
 7mXeUwqxIOrJznYQ1Jc14SBOwcsOev536Zr/PU60E+WP3IVWzcGi93aOiPr9ljRz2tYt
 qx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685946058; x=1688538058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFAORiJMTRPxVEgeh1ndTFRmu3jSfy3cuQSdwmDzjko=;
 b=MPsoXg+cs7fZbnuvEoTKn6Cx4UFd9nvcI/BPHiQ0Yryd8tk2imzzyJbCBZftmGgzaC
 FJDN7Jp+iWAPiksPBeSWNY8cFQdqOBHi6CIba6fY+FmLLGRuZRUqpDb0eDmnVmK8I2YO
 4xuMxxvZQyvi1AXjqRMNUIEWzueMi4/bSQsWk/ba70DKDMOevampuCdpm2zMYo6mpwdb
 6Yhh08Ta6xOQ6R5sOQ/WUbzEX7eI9moFGH17KYkKfWWeV1UBSX9QcGQ8UV+DkvFQDHzm
 CHMgjJEonzXTnCFMpiLpTzmMDY/iI4uMds3ZSNubRmhOtMKn/A5CCxlTrdOYd4Yle904
 7JTw==
X-Gm-Message-State: AC+VfDwEAo/1MRF9zPNl3z+Qaygub9JXgaZEJ7ordSy9JJ3OatkiiIYl
 ay7JrfweIeEVes0wi+MK7Pmm8gLKxgGQAC8ToSc=
X-Google-Smtp-Source: ACHHUZ7P1EX463Cq2OTmYff9AZF4wLx5SggxZnUfVSs+Sw6MnDyLjOnQXMaSct7979Y0PkgmHPmA8yvPPU3usGND0/w=
X-Received: by 2002:a05:620a:8f16:b0:75d:8e67:52d3 with SMTP id
 rh22-20020a05620a8f1600b0075d8e6752d3mr2614517qkn.73.1685946058695; Sun, 04
 Jun 2023 23:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230531093206.3893469-1-victor.liu@nxp.com>
 <20230531093206.3893469-2-victor.liu@nxp.com>
 <bd257ed0-71a7-0504-0bfe-14775ac93571@linaro.org>
 <CAOcKUNWkubMK1MJS73tpbm4bafQv2GAMuq_JOTFbvB9EVDRvxg@mail.gmail.com>
 <8c0b1e70-382d-669c-c0ee-438fada6e78a@linaro.org>
In-Reply-To: <8c0b1e70-382d-669c-c0ee-438fada6e78a@linaro.org>
From: Ying Liu <gnuiyl@gmail.com>
Date: Mon, 5 Jun 2023 14:20:46 +0800
Message-ID: <CAOcKUNUtXK==K4R2OHFz=_dUjTu9jwiYbcoG412qRxT35yWWmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add NXP i.MX93
 parallel display format configuration
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Liu Ying <victor.liu@nxp.com>, s.hauer@pengutronix.de, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 4, 2023 at 6:16=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 02/06/2023 05:54, Ying Liu wrote:
> > On Fri, Jun 2, 2023 at 1:45=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 31/05/2023 11:32, Liu Ying wrote:
> >>> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> >>> configures parallel display format by using the "PARALLEL_DISP_FORMAT=
"
> >>> field. Add device tree bindings for the display format configuration.
> >>>
> >>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>> ---
> >>> v1->v2:
> >>> * No change.
> >>
> >> How did you implement Rob's comment?
> >
> > Should have discussed more in v1 about Rob's comment, but
> > let me explain why this dt-binding makes sense here:
>
> "It needs to be defined as part of the mediamix blkctrl
> schema though."
>
> Where is it defined in mediamix blkctrl?

I've sent v3 patch set out to define it in mediamix blk-ctrl.

Regards,
Liu Ying
