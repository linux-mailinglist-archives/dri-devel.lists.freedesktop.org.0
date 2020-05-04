Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1E41C3B4B
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 15:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D15891BA;
	Mon,  4 May 2020 13:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55F18916C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 13:31:12 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id h30so11083018vsr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CKVu8p9mULpUJV26UBlO0ZNVdeoAZyl4GvIcj32jLfc=;
 b=Mdj8ICMvEINKyngRw0C56nn/l70As9jUYBHBkF7cB5XPbu+mS0V+QXTSGwZ9vlwKq/
 lkS7FbUhHKFI1QZLjxbDEtVDHihnWopja1AsKIp/YiO6vlZuHplAaKzMuaf5NSWarM2f
 KE6OzrRJue09kKbucJDol8hpl92GUJw5LCudHtr2vwmQhIff8Z7LW3KuKoGvJ/9c8lUU
 DobuZ7uqytasqL9HeMiFXjeogYQTH2QtTtcOfKk05IDThTnqhz0uwt8isZ9nrz4Vg/S7
 1m6i83pXMaNaZW/a0QUdFo3Fo/YLOU2tkt1jq1akV8fUi/jwrnk8jfSWaUZs/RdsCMzo
 yFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CKVu8p9mULpUJV26UBlO0ZNVdeoAZyl4GvIcj32jLfc=;
 b=fpOmCtc1C8u7UaKxc0kT7oYdyiYyusWSrMeAfKWTt+aHQfVscmhWU5LU0rsaT2S7/w
 hRy5A70fKeGje7+QOHYKOCT/0o113TbUqS98M7ANv6PorCn05iVkHMg+M6GnRefHggPr
 LrgUOp/PGMsdMyCKvY/ewXx4f1ut4N+G4oECASyMPnOCBAtOZZC+7dIzi0eYxl/h3miU
 ZQjhyYg4/CP1N9zpX9E57dlfLj3ebIPTUYQSttvoaTwaVRZC3hMS/KyLShRpuqW6VopF
 ALsw9kHk5kV1QeO5JTPF1+ibMcu7gCkMj0VvkhpaKt535wDbXtMskSAk2YhaEUntUj0d
 i1gg==
X-Gm-Message-State: AGi0PuY3CWX4DQhqr57RIOHlSLFYzwNdh2Ob5Baz0sVU2wkGEp5/R74h
 jwJ1oVwlmlw/Ebie6OPSqbM+2SPSX2wVm3oX+Bg=
X-Google-Smtp-Source: APiQypJrs2cq7AvRRR2YZKwloVT46aVj/YrXmcbh7EbV/r3x3vAWHo4cobHouut4syrWSDqbQsPB2Tivz++SgHG/97k=
X-Received: by 2002:a67:c482:: with SMTP id d2mr12058478vsk.37.1588599071846; 
 Mon, 04 May 2020 06:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200430192746.1866325-1-paul.kocialkowski@bootlin.com>
 <20200430192746.1866325-3-paul.kocialkowski@bootlin.com>
In-Reply-To: <20200430192746.1866325-3-paul.kocialkowski@bootlin.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 4 May 2020 14:28:47 +0100
Message-ID: <CACvgo51mRse3su4exyTqXYJRPPc0VqaX9+tRyKUuBPtm5Q+6XQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm: Add support for the LogiCVC display controller
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

Just had a casual quick look for custom KMS properties, since new
drivers made that mistake in the past.
Thanks for not including any o/

I made a couple of trivial suggestions - if you agree, feel free to
keep them as follow-up patches.

On Thu, 30 Apr 2020 at 20:28, Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> +int logicvc_of_property_parse_u32(struct device_node *of_node,
> +                                 const char *name, u32 *target)
> +{
> +       struct logicvc_of_property *property;
> +       const char *string;
> +       u32 value;
> +       int ret;
> +
> +       property = logicvc_of_property_lookup(name);
> +       if (!property)
> +               return -EINVAL;
> +
One could have the logicvc_of_properties[] entries indexed with the
logicvc_of_property_parse_{u32,bool} caller, using that instead of the
name string.

Aside: I suspect the array (as most other arrays in this patch) should
be annotated const, correct?


> +       if (property->range[0] || property->range[1])
> +               if (value < property->range[0] || value > property->range[1])
Combine the two ifs?

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
