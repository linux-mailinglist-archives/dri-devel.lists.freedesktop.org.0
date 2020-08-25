Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11490251CC9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 18:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB506E395;
	Tue, 25 Aug 2020 16:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01576E395
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 16:02:14 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z9so2597412wmk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tTxeNahv5q1FXtG4qVWxMsRTv7XdCLwkd20q56V8+2I=;
 b=OmgvobhW1+4wUwztCxo9jyR+SPzYBjWffxCQjTAXmY7Mj0rcbvtXLh0GIJ2zAFgTR4
 424w8VwynEJM9uR+bqi5cYA1ACQ2ToMXh+b9qRPrEzhINMIQcnZKvNoEAss8S52OPNGr
 Pa9o3yVGOSOy5wKaRSbGxkA0c0wrQPQv+T+iuIwdv5umPngXd5hGdpAG+Q7FI6xH35gg
 EuHgSLDjEGOJanVZf9591vSeH7uQTzsp+I7mxxBUleeb7NnZIZ1edyWm/b71BB3eguMB
 tOcsgkWAuc36az2J9dgSwe/kn3mE8jZMmseO98jEgzUYqCcljKBTgLIeQHFQnPuDJRi0
 QU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tTxeNahv5q1FXtG4qVWxMsRTv7XdCLwkd20q56V8+2I=;
 b=HFKZ/Y7l1IkLb2AdC90h2aRZKKRojoGz2esC2t7UnTrpt5ra+mAetd++n43NHAbZ64
 +txfLTDB9OTq/z0xHw9kBlRsXadUO82+ZWcv1usKndgSW4y+lmaSmRSw9gHLpqoTOzEb
 85T/qdQwaUNb3p7ZaWemUXYPu7zPhlfwKbqWF6PaScV3tQJ2WMWjEEzFFzGUzkiIcf++
 X1SCTSdDuxC3eH8D7QSy/r8KmaZhFJe9sv70lWdc/twKG40Kq4JJweNNjKEPv0aiUZqQ
 mCTwgob9SXmjqmDrnSoODbAHJknrNNE4QKLNj82ujz2jfEcCohNR8NwRDPFqujuXOAeV
 SEEg==
X-Gm-Message-State: AOAM531ZeW2yiJIPtDXfVyUpEpF78sDeyMQRqJuFHZ4+K8t0+4QyA9oR
 wHX6GhwMd9Z6GaL4kb5j8Yc=
X-Google-Smtp-Source: ABdhPJxATi2/nACkk9huMF7nAKfQT11rcTxjVkx+7ijD2XDfrF49ww0RbwnuIie3KoZRrhmScvMytw==
X-Received: by 2002:a1c:7902:: with SMTP id l2mr2695006wme.101.1598371333323; 
 Tue, 25 Aug 2020 09:02:13 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id g18sm32633985wru.27.2020.08.25.09.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 09:02:12 -0700 (PDT)
Date: Tue, 25 Aug 2020 13:02:06 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH v5 0/3] drm/vkms: Introduces writeback support
Message-ID: <20200825160206.jpdxrdbswaogayzu@smtp.gmail.com>
References: <20200825023142.2561220-1-rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825023142.2561220-1-rodrigosiqueiramelo@gmail.com>
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
Cc: daniels@collabora.com, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

Nice work!

I tested this on the kms_writeback set of subtests and works fine.

I have also checked it on the other IGT tests that I usually uses:
- kms_cursor_crc/cursor-alpha-transparent was affected by a small
  problem in the bitmap_clear of the get_pixel_from_buffer function,
  that I pointed out inline. Please, check it.
- kms_flip and kms_pipe_crc_basic works as expected (was not affected).

Best regards,

Melissa Wen

On 08/24, Rodrigo Siqueira wrote:
> This is the V5 version of a series that introduces the writeback support
> to VKMS. The first two patches of this series are a pre-work for the
> latest patch that adds the writeback connector, this patchset can be seen
> in two parts: 
> 
> * A pre-work that aims to make vkms composer operations a little bit more
>   generic; these patches try to centralize the vkms framebuffer operations.
> * The final patch enables the support for writeback in vkms.
> 
> In the previous review, Emil suggested multiple changes in the series. I
> tried to apply most of the recommendations except for some suggestions
> which I was not able to incorporate due to compilation issues, or other
> suggestions that may complicate this series review. I left some changes
> for future patches for keeping this patchset simple with the hope of
> landing this feature soon in order to support VKMS user's requirements.
> Emil, let me know if you want me to change any other thing.
> 
> It is important to highlight that from the previous series to the
> current version of this patchset we had some changes in the VKMS that
> made it unstable.  In particular, our previous writeback series stopped
> working properly due to changes in our commit tail.  Thanks to Melissa
> working in the instability issue and her latest fixes to VKMS, I finally
> could update writeback and make it work again. The main update in the
> latest patch is the use of vkms_set_composer when the writeback work
> starts (enable composer) and after the writeback end (disable composer).
> 
> Best Regard
> 
> Rodrigo Siqueira (3):
>   drm/vkms: Decouple crc operations from composer
>   drm/vkms: Compute CRC without change input data
>   drm/vkms: Add support for writeback
> 
>  drivers/gpu/drm/vkms/Makefile         |   9 +-
>  drivers/gpu/drm/vkms/vkms_composer.c  | 102 +++++++++++-------
>  drivers/gpu/drm/vkms/vkms_drv.h       |  11 +-
>  drivers/gpu/drm/vkms/vkms_output.c    |   4 +
>  drivers/gpu/drm/vkms/vkms_writeback.c | 143 ++++++++++++++++++++++++++
>  5 files changed, 231 insertions(+), 38 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_writeback.c
> 
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
