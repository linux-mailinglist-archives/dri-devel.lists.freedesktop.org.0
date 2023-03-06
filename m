Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EC46ACED6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 21:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A650710E45A;
	Mon,  6 Mar 2023 20:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5266410E45A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 20:05:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C76DB81104
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 20:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6562CC433A1
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 20:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678133133;
 bh=7aGV60npvHqtpD2KZbj09/ATSzY6ifh/i1if6W3gd4g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D1K+iOlR+AIRbRv93QXZnzeNuquqsYjjqN4/YcPp/fZ6sUbv8KhpRrgL+ncUSlD07
 D5O0IYHWh7BRaLxbTo01mwwKB0TYCJcEd3QK3+aJpNXiycJtWiePMIzL/xVk3Tx2KN
 rDVC5N/jeZ4Qk3HR+uye77zvmWXuoP9GV8lRNFAIHlZW0fjT6XDoAMW60SZrvApIU8
 ksDqOYGBLmZ5OZRhMGA8udfSaAKU6ImROnXQ8rjbTAtadPkipuxhOQi5+WcxLIqEU8
 s7Zf2By11p7YhjJLYz1fxcJZHcH2qx9lDHqG2fNREvzhRYG7NNlaWgA2fLb2szHoHY
 mnf+BaH3AvHNA==
Received: by mail-ed1-f54.google.com with SMTP id j11so24105663edq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 12:05:33 -0800 (PST)
X-Gm-Message-State: AO0yUKUqfc9laMUGYr7VCK2/YttGInLFmDfvoEZmdtiSHXR4ufAuoWFc
 Nme2G/VIHiD8OPX5bCZefpSIZblRud3VW/rEkus=
X-Google-Smtp-Source: AK7set/1eKTbJwQDLH579qb/v4dU5t+rNalaL06DcZNQXB8YFSECcnZJKc8FFLD3DOzXqQpD5dLXg9oxaE3QLoFBwDs=
X-Received: by 2002:a50:d581:0:b0:4bf:5fd5:da40 with SMTP id
 v1-20020a50d581000000b004bf5fd5da40mr6349414edi.4.1678133131533; Mon, 06 Mar
 2023 12:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-23-tzimmermann@suse.de>
In-Reply-To: <20230306160016.4459-23-tzimmermann@suse.de>
From: Timur Tabi <timur@kernel.org>
Date: Mon, 6 Mar 2023 14:04:54 -0600
X-Gmail-Original-Message-ID: <CAOZdJXUtkyg5Gv3HYCK-U1pQpY0_QBk99wtqUvz5RVy2W3Ak9w@mail.gmail.com>
Message-ID: <CAOZdJXUtkyg5Gv3HYCK-U1pQpY0_QBk99wtqUvz5RVy2W3Ak9w@mail.gmail.com>
Subject: Re: [PATCH 22/99] fbdev/fsl-diu-fb: Duplicate video-mode option string
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, adaplas@gmail.com, timur@kernel.org,
 corbet@lwn.net, deller@gmx.de, thomas@winischhofer.net, mbroemme@libmpq.org,
 linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, pjones@redhat.com, paulus@samba.org, geert+renesas@glider.be,
 shawnguo@kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 6, 2023 at 10:01 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Assume that the driver does not own the option string or its substrings
> and hence duplicate the option string for the video mode. The driver only
> parses the option string once as part of module initialization, so use
> a static buffer to store the duplicated mode option. Linux automatically
> frees the memory upon releasing the module.

So after module_init is finished, mode_option_buf[] no longer exists?

> +                       static char mode_option_buf[256];
> +                       int ret;
> +
> +                       ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s", opt);
> +                       if (WARN(ret < 0, "fsl-diu-fb: ignoring invalid option, ret=%d\n", ret))
> +                               continue;
> +                       if (WARN(ret >= sizeof(mode_option_buf), "fsl-diu-fb: option too long\n"))
> +                               continue;
> +                       fb_mode = mode_option_buf;

If so, then I'm not sure that's going to work.  fb_mode is used after
module_init, in install_fb(), which is called by fsl_diu_probe().
