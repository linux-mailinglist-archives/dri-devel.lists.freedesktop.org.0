Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D946EECC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D706F10E471;
	Thu,  9 Dec 2021 16:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9D389FF6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 12:24:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D54C7B80CD8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 12:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FC1C341C6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639052652;
 bh=2VMAS+tZFZN8v3ZAgT3W7cwA7cVKF0lS3FeHtSesrS4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BUBvkiujkYb1Tj4h0Mc7MQ5n8O7XFyLxx/3HSAl7lxRaywskKoNoxJ5cysLS9tRkB
 BeJPjF4gbqxjJjC/1pkWZsj8N0p2rQUrftCtv9plDUI2QAGiZW7OBMW6VN0SV0V1qK
 cW+xbBg1kicjNnpYyHdOLamNz1EJOTbhQmFqqtwYDpSNxgZl4gOBH2ySjImhPdehLa
 z/7TYyW95Agzh/95n54M341N1ueSIkSReQjcneNA4n4dVA1WpSG8Ge02UVI32bTYAP
 GQ/Enr5K6leVZFaEKr14AdoINmevdpBhNEdVQuB25HJA9iZeoTOxHlRVDTbm7FejEu
 GNeEANLYAWD5w==
Received: by mail-yb1-f174.google.com with SMTP id f9so13229009ybq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 04:24:12 -0800 (PST)
X-Gm-Message-State: AOAM533KVFLU/u3VQZZaSSdQR7fDk+1TLrs0BcUPfPu+JFfYF3YpM3h8
 9zMl5aRZRX5lqAN7SrpNTbx0Q3l+aB+Q19PwKkA=
X-Google-Smtp-Source: ABdhPJz91+2p6VP/aEhUPyI1e+tsuVF0vgIate4Wab5wvh+3MthAWfPM2ihn4FXXee5EDRsJSWzM3Eq55oj/SqZgp4Q=
X-Received: by 2002:a25:b2a6:: with SMTP id k38mr6309015ybj.122.1639052651761; 
 Thu, 09 Dec 2021 04:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20211207071830.GA14915@chq-T47>
In-Reply-To: <20211207071830.GA14915@chq-T47>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 9 Dec 2021 14:23:45 +0200
X-Gmail-Original-Message-ID: <CAFCwf117oZaqMSSVUxqJDeJ1TmGzhXj0SZurfyK+dDV=0wYrYw@mail.gmail.com>
Message-ID: <CAFCwf117oZaqMSSVUxqJDeJ1TmGzhXj0SZurfyK+dDV=0wYrYw@mail.gmail.com>
Subject: Re: Habanalabs,
 Ask for the linux firmware code which loads by coprocesseor
To: Cai Huoqing <cai.huoqing@linux.dev>
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
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 7, 2021 at 9:19 AM Cai Huoqing <cai.huoqing@linux.dev> wrote:
>
> Hi Oded Gabbay and habanalabs folks.
>
> I'm insterested in this kind of AI acceralator.
>
> After scanning the driver code.
> It seems that there are a linux firmware which is loaded by
> coprocessor(an slave cpu ?).
> shows in the code.
>
> ./goya/goya.c:74:#define GOYA_LINUX_FW_FILE     "habanalabs/goya/goya-fit.itb"
> ./goya/goya.c:2436:     return hl_fw_load_fw_to_device(hdev, GOYA_LINUX_FW_FILE, dst, 0, 0);
> ./goya/goya.c:2507:     fw_loader->linux_img.image_name = GOYA_LINUX_FW_FILE;
> ./gaudi/gaudi.c:63:#define GAUDI_LINUX_FW_FILE  "habanalabs/gaudi/gaudi-fit.itb"
> ./gaudi/gaudi.c:3945:   return hl_fw_load_fw_to_device(hdev, GAUDI_LINUX_FW_FILE, dst, 0, 0);
> ./gaudi/gaudi.c:4011:   fw_loader->linux_img.image_name = GAUDI_LINUX_FW_FILE;
>
> And the host driver(/driver/misc/habanalabs) communicate with the slave firmware
> by MMIO or share memory, right?
>
> If that, would you mind provide the source code of linux firmware
> to avoid the confusion from code reading.
Hi Cai,

You can download the source code from:
https://vault.habana.ai/artifactory/misc/hl-linux.bz2

>
> BTW, where can I find the register description datasheet
We don't supply this information.
Thanks,
Oded
