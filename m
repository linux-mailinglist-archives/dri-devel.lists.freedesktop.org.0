Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8051621E5DC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 04:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71226E894;
	Tue, 14 Jul 2020 02:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1046E894
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 02:45:15 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id a12so15716700ion.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 19:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s7/p0LKnwYztNP3yOyVMCmJC/s32uIp93cOd4bT8YX0=;
 b=Wc1487qXQqFi6+DGiOLQ3n8bo7o9TrpNzHwWufcxj5yGxGDVVN48FQ/5iFmpFQ0jud
 xgNHIobE3aXPl4/AQzZ11/g72KAIMaCtLfwvqgMhi68rcJJiWJNsMep/X7MYnVwzLnFm
 hk6Lfvc7+5F5663e2lxlAi3ClqTm0SIb7wrdx5QGvkNDu3xK0wssr0S9cA0Jewk6xcjh
 1MLERq55gGAW+JVjUBKkp2YE9QJ7JWeDjoi+Dpk2u+yhOdEXql4i0QWg4B6wDlCWEmS+
 9wTC9/zfusXuHZ9qmO+nSjnVyc3+/oMQBuHm45jo4dFZYkDjs9LQnd24MPOBNODpJISQ
 hOpg==
X-Gm-Message-State: AOAM531jfSaqHz1mfoESqO6iqbfi700DkqSBTqfkxJ8/O6uqBA6JOIbL
 d50gkTmBsehE9Tpyaw+SiQ==
X-Google-Smtp-Source: ABdhPJyx8UdIhIEKvxzTLlJNVLkJWx6cbMd1XvZ0aLeHH8iTfpfkEERxAxkFXceQErzACPH/C0jATg==
X-Received: by 2002:a5d:9699:: with SMTP id m25mr2884313ion.74.1594694714687; 
 Mon, 13 Jul 2020 19:45:14 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id i12sm4158331ioi.48.2020.07.13.19.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 19:45:13 -0700 (PDT)
Received: (nullmailer pid 1181804 invoked by uid 1000);
 Tue, 14 Jul 2020 02:45:12 -0000
Date: Mon, 13 Jul 2020 20:45:12 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2.1 1/8] dt-bindings: media: renesas, fcp: Convert
 binding to YAML
Message-ID: <20200714024512.GA1181735@bogus>
References: <20200701060349.GE5963@pendragon.ideasonboard.com>
 <20200701060525.9748-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701060525.9748-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 01 Jul 2020 09:05:25 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car FCP text binding to YAML.
> =

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Changes since v2:
> =

> - Refer to the correct device in the comment above the example
> =

> Changes since v1:
> =

> - Simplify comments on compatible strings
> - Update MAINTAINERS
> ---
>  .../devicetree/bindings/media/renesas,fcp.txt | 34 -----------
>  .../bindings/media/renesas,fcp.yaml           | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 57 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.t=
xt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.y=
aml
> =


Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
