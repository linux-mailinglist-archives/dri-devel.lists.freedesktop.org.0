Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C0116A1E4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B066E2CA;
	Mon, 24 Feb 2020 09:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C318C6E972
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 19:42:32 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c7so6823591edu.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 11:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jxXwmG/BoLt3/DuSIM90nibgbKIiQUu8A/JCVZrI5aE=;
 b=UMIrgNyD6Xysh3omTsoSt+PHA41YQHPYK5cghpRVeHlz77TJ7VeDmYfWrDvhOmc1qI
 jHj7IHIBLOuwbuN1YbltxeLjSG+oGJTz9lKiXLh0GMtSkLa3f1CwAu3mApEn9rY6zIWW
 qnsZoJPouP5O0tOJ2Fg/kJvcf+p4ecUGrx6pfZfPCXo+4iInjRvgm14RUbXu0l9Elg0w
 EN2Xi+CKWIITk0Rucsz09925+BtHNYF+NBKK8MSOemJ6EYCxNgqaNmXop5RgFYxkjfd9
 I4IW9qJwpAxIZ8H6bp14M8B4losIzyNOG2OR4lniKVyn+PmOQhWAYji3fViIQWDlM1iY
 MG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jxXwmG/BoLt3/DuSIM90nibgbKIiQUu8A/JCVZrI5aE=;
 b=nz2NaoLZwD5C8Uj08luaPWp0QwKNhhnYdaj9h/cym9//IV53Bw6iioDjMh7dSsCDnF
 RYmSPZtq6V207/IyIESHDdLPBueRz3Nnr9QDOSZlJaIcJIYDtkMVGO11iwh/+U7zE/9/
 soP8hU/7c0Uv1ylfD4KpOHYAMdMQQ7g9J8R8pQMg3qob1A0CILiq7ivFeUMZ8rXHn3/F
 2wa/JznmKIG5FD3GqE7603pbZyH8pqzXZzHTsghKl+Qbo0IyXVmT9j1AM/I1lMXeznj6
 deyJBBddg4iNswTc7UX8T4qbhAklj0gA/2eiAaEkyWXgTNqEj9Ac6F/NwYVfJkhmQtxF
 nQSg==
X-Gm-Message-State: APjAAAXIR7JjE18e4QvXYG+92H5nKF19YLFAlXrCFBVd6GfczwQyh1bY
 vjilaPI0g13iNaLNjWLk/a1UeV8tl737CdHF82s=
X-Google-Smtp-Source: APXvYqwfAkL5gcMkA/17+706cDRZPOl9loVVEPtWeFZTvqzB7twy3wihTpHS8mLjeiRkAbjzkyTYXKADIgMaiqwtzIM=
X-Received: by 2002:a05:6402:b2e:: with SMTP id
 bo14mr41025601edb.13.1582400551407; 
 Sat, 22 Feb 2020 11:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20200112001623.2121227-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200112001623.2121227-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Feb 2020 20:42:20 +0100
Message-ID: <CAFBinCBLJyPxOBv0JNe7o0ME3rvPi+2Qv7Lwgw6T92f15ZXcxA@mail.gmail.com>
Subject: Re: [PATCH RFT v2 0/3] devfreq fixes for panfrost
To: steven.price@arm.com
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 sudeep.holla@arm.com, linux-amlogic@lists.infradead.org, robin.murphy@arm.com,
 alyssa@rosenzweig.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven,

On Sun, Jan 12, 2020 at 1:16 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> These are a bunch of devfreq fixes for panfrost that came up in a
> discussion with Robin Murphy during the code-review of the lima
> devfreq patches: [0]
>
> I am only able to test patch #1 properly because the only boards with
> panfrost GPU that I have are using an Amlogic SoC. We don't have
> support for the OPP tables or dynamic clock changes there yet.
> So patches #2 and #3 are compile-tested only.
>
>
> Changes since v1 at [1]
> - added Steven's Reviewed-by to patch #2 (thank you!)
> - only use dev_pm_opp_put_regulators() to clean up in
>   panfrost_devfreq_init() if regulators_opp_table is not NULL to fix
>   a potential crash inside dev_pm_opp_put_regulators() as spotted by
>   Steven Price (thank you!). While here, I also switched to "goto err"
>   pattern to avoid lines with more than 80 characters.
>
> Known discussion topics (I have no way to test either of these, so I am
> looking for help here):
> - Steven Price reported the following message on his firefly (RK3288)
>   board:
>   "debugfs: Directory 'ffa30000.gpu-mali' with parent 'vdd_gpu' already
>   present!"
> - Robin Murphy suggested that patch #1 may not work once the OPP table
>   for the GPU comes from SCMI
>
>
> [0] https://patchwork.freedesktop.org/patch/346898/
> [1] https://patchwork.freedesktop.org/series/71744/
>
>
> Martin Blumenstingl (3):
>   drm/panfrost: enable devfreq based the "operating-points-v2" property
>   drm/panfrost: call dev_pm_opp_of_remove_table() in all error-paths
>   drm/panfrost: Use the mali-supply regulator for control again
I don't have time to work on these patches in the near future
can you (or if someone else is interested then please speak up) please
take these over? you are familiar with the panfrost devfreq code and
you have at least one board where the GPU regulator actually has to
change the voltage (which means you can test this properly; on Amlogic
SoCs the GPU voltage is fixed across all frequencies).


Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
