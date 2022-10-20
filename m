Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDA6068A8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 21:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD3210EF8D;
	Thu, 20 Oct 2022 19:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B4910EF7E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 19:08:38 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id bb5so221748qtb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 12:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MtUDTErrWnMJNcxFkOcVTiq3wwaZ7wUEahic3MCoPRA=;
 b=iPLIUcSlm2SYaVOvBnk4lByH4wiVLGuGA7VRBSLFmyNcvSBZnfv25t2OkFPcAHIL4w
 +ONV7odWh8FPUPGS0jZzGCsIqxBD2F5q6nuIzhPlkRKCGn90rh7LE8YPGUJPoKXgh6eV
 n3JdBvj4I1QkievkaAuVQ47EwgW86b3x4d9so11WB8CkqNao1dy+9AuRPOUEQAqgG85K
 VJye77e4OaoaDfv23FVKrcJGu4JY8WMzqi0+qj4K3mLy4dNr695MO2VtoWmGjyZdnwxI
 I2iiJHtLCX83/J0CZs9YhatTwdI6NW+ka//1b2O2yYUM5BTGB1L0MfXsfUh7/onZUsvT
 Pdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MtUDTErrWnMJNcxFkOcVTiq3wwaZ7wUEahic3MCoPRA=;
 b=3ZyNj06Oscp7r7USTlPUEUXUi8T8PrtWUm/Hx0cwaD4w+amVX0X2S0R6ibwOur6JU+
 2oorjrJOghMwMW5xW1jhi2JnYZUP7IVAtN5X1HivfyMgGPa+EM0DeGnuAA3SJpAydNcY
 CHu22prhb0gGuswhwjgC76QxJd2yX2fu8GDbP3bDAnGXcWxIGIeWfbFw1mfxB04NCnN5
 AefnXEXE2+uUHwo+HnJ4OsCaEL5DxdwfZc01nD5YN37oy7R1N0lKQbTHmDrW6uloF0Cd
 evP9s3116DLMj4Fi+uxqVFoCuGk4Z/v+eH4kIo8p45QXo0j+YB740WvvT8rHvauXmrbC
 UAMg==
X-Gm-Message-State: ACrzQf3v7iYQprAWHDgs5cBIzInWj1fT7dF+Xw15ciaT1JfwGs5eDK2Y
 5xdb7r3ZjPE7NhLoCZf6igV2E3mVw06IMODt8Gk=
X-Google-Smtp-Source: AMsMyM5hOJrmcCOp09h4PvvYxc6yqG6pw/ScnnkTkQgBKTlH6j6sZpgOEcOOJ1me4PzlRL9Xo6DhNaBxdEyRHYnYU+M=
X-Received: by 2002:ac8:7c46:0:b0:39c:fa92:a27a with SMTP id
 o6-20020ac87c46000000b0039cfa92a27amr10252651qtv.61.1666292917399; Thu, 20
 Oct 2022 12:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Oct 2022 22:08:01 +0300
Message-ID: <CAHp75VfqKF9ZR7L5tZhv8BZ1hzvAOpSt6QNJv1=mkd6K94UFag@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:
>
> Dear kernel maintainers,
>
> This submission is a kernel driver to support Intel(R) Gaussian & Neural
> Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-processor
> available on multiple Intel platforms. AI developers and users can offload
> continuous inference workloads to an Intel(R) GNA device in order to free
> processor resources and save power. Noise reduction and speech recognition
> are the examples of the workloads Intel(R) GNA deals with while its usage
> is not limited to the two.
>
> For a list of processors equipped with Intel(R) GNA device, please refer to
> this link:
> https://docs.openvinotoolkit.org/latest/openvino_docs_IE_DG_supported_plugins_GNA.html
>
> We think contributing this driver to the upstream kernel project is the
> best way for developers and users to get the latest Intel(R) GNA support in
> a Linux kernel, through the mainline to any Linux distributions installed
> on their systems. Upstreaming also enables contribution from developers
> around the world to the driver once it is merged.

Can you replace all those dev_dbg():s by trace events/points?

-- 
With Best Regards,
Andy Shevchenko
