Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D56DD755
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 12:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812D210E066;
	Tue, 11 Apr 2023 10:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DDA10E066
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 10:04:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2efbab42639so203835f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681207455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T7OUlx2hk0WL6qrNutnMhKLq7s67Zjq1XNtSqPzK4ww=;
 b=XgU3dRKCHEmFY+86EbIAmLsMaQo5TQQBBKj5i1CtSD0HhIrw1zDc5Tgjq5TAN/Izwn
 SvHcqwzlXpCRwzaFuWVg9oeIQVZBhyIME9v6lz0oHbBbp+qCYD0zlWDdB6QXmswd9OmL
 7lgJh0DjGmUYZJ8asAhegUGao/IC9M9y0sc20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681207455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7OUlx2hk0WL6qrNutnMhKLq7s67Zjq1XNtSqPzK4ww=;
 b=bUrZgR23QfyfEh/t+H44w/oUxIP2HLypy0FZILzfi63WUwFe0uxVEhHgggDy4wmzrH
 u38SlDLAtwnb++s1hscbKFWK/UmHvHUq4FwGcQPabe/sWIk+8eeIcxbPuvr3x1x58JtI
 rQ47Wd+PDI2VJK0tHZMgBkpc+qUjOKTmgjo6V/oAgAu8sAb6X6F1rKisHLQhbqzvub3c
 ZFhVCqgRWL0ciXOpTGdJMJOAiqPpVxZfI2ODYjljtxBYwleWyJU3BUC1Qw6WlY6gx9ud
 OAJtnHiZoZrAKANEs+k83bIVyqFI+5UL9S/W4VEsOQotvjVHA7MFzE5Eo3T3Of0vEIk6
 9EoQ==
X-Gm-Message-State: AAQBX9dhkbFdTCfJ+abYO9YKkeHJUjhvNaEHy5sspcGeQVtQyZKbyKna
 zslVKDSJEZq3Dhdx5x72oh4YqA==
X-Google-Smtp-Source: AKy350Yd10a0m5/a5f+0cFnmSNRyzWEcO7Io624BhSJE+9kmKuqNWpk2wKKAcQfrKnB07Nd+vJbbSw==
X-Received: by 2002:a5d:6a02:0:b0:2de:9a0b:a14 with SMTP id
 m2-20020a5d6a02000000b002de9a0b0a14mr6355110wru.5.1681207455131; 
 Tue, 11 Apr 2023 03:04:15 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 v18-20020adff692000000b002f006333c89sm6872826wrp.61.2023.04.11.03.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 03:04:14 -0700 (PDT)
Date: Tue, 11 Apr 2023 12:04:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [git pull] habanalabs for drm-next-6.4
Message-ID: <ZDUwnEXjn66fmZFK@phenom.ffwll.local>
References: <20230410124637.GA2441888@ogabbay-vm-u20.habana-labs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410124637.GA2441888@ogabbay-vm-u20.habana-labs.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 03:46:37PM +0300, Oded Gabbay wrote:
> Hi Dave, Daniel.
> 
> An additional pull request for 6.4.
> 
> Mostly bug fixes and cleanups.
> 
> Full details are in the signed tag.
> 
> Thanks,
> Oded
> 
> The following changes since commit 4d877b1a6e855d1c8685fa0e27ad7a521b31b6ca:
> 
>   Merge tag 'drm-intel-next-2023-04-06' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-04-06 16:31:33 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git tags/drm-habanalabs-next-2023-04-10
> 
> for you to fetch changes up to 56499c461589634f2c89ffbd9cfb78268191d349:
> 
>   accel/habanalabs: add missing error flow in hl_sysfs_init() (2023-04-08 10:44:23 +0300)

Pulled, thanks

> 
> ----------------------------------------------------------------
> This tag contains additional habanalabs driver changes for v6.4:
> 
> - uAPI changes:
>   - Add a definition of a new Gaudi2 server type. This is used by userspace
>     to know what is the connectivity between the accelerators inside the
>     server
> 
> - New features and improvements:
>   - speedup h/w queues test in Gaudi2 to reduce device initialization times.
> 
> - Firmware related fixes:
>   - Fixes to the handshake protocol during f/w initialization.
>   - Sync f/w events interrupt in hard reset to avoid warning message.
>   - Improvements to extraction of the firmware version.
> 
> - Misc bug fixes and code cleanups. Notable fixes are:
>   - Multiple fixes for interrupt handling in Gaudi2.
>   - Unmap mapped memory in case TLB invalidation fails.
> 
> ----------------------------------------------------------------
> Cai Huoqing (1):
>       accel/habanalabs: Remove redundant pci_clear_master
> 
> Dafna Hirschfeld (2):
>       accel/habanalabs: check return value of add_va_block_locked
>       accel/habanalabs: improvements to FW ver extraction
> 
> Dani Liberman (2):
>       accel/habanalabs: fix access error clear event
>       accel/habanalabs: fix handling of arc farm sei event
> 
> Koby Elbaz (3):
>       accel/habanalabs: unmap mapped memory when TLB inv fails
>       accel/habanalabs: change COMMS warning messages to error level
>       accel/habanalabs: don't wait for STS_OK after sending COMMS WFE
> 
> Moti Haimovski (1):
>       accel/habanalabs: speedup h/w queues test in Gaudi2
> 
> Oded Gabbay (1):
>       accel/habanalabs/uapi: new Gaudi2 server type
> 
> Ofir Bitton (5):
>       accel/habanalabs: fix HBM MMU interrupt handling
>       accel/habanalabs: print raw binning masks in debug level
>       accel/habanalabs: fix wrong reset and event flags
>       accel/habanalabs: fixes for unexpected error interrupt
>       accel/habanalabs: remove Gaudi1 multi MSI code
> 
> Tal Cohen (4):
>       accel/habanalabs: print event type when device is disabled
>       accel/habanalabs: remove duplicated disable pci msg
>       accel/habanalabs: send disable pci when compute ctx is active
>       accel/habanalabs: sync f/w events interrupt in hard reset
> 
> Tomer Tayar (3):
>       accel/habanalabs: remove completion from abnormal interrupt work name
>       accel/habanalabs: fix events mask of decoder abnormal interrupts
>       accel/habanalabs: add missing error flow in hl_sysfs_init()
> 
>  drivers/accel/habanalabs/common/command_buffer.c   |  15 +-
>  drivers/accel/habanalabs/common/decoder.c          |  40 ++-
>  drivers/accel/habanalabs/common/device.c           |  54 ++--
>  drivers/accel/habanalabs/common/firmware_if.c      |  17 +-
>  drivers/accel/habanalabs/common/habanalabs.h       |  14 +-
>  drivers/accel/habanalabs/common/irq.c              |  11 +-
>  drivers/accel/habanalabs/common/memory.c           |  11 +-
>  drivers/accel/habanalabs/common/mmu/mmu.c          |   8 +-
>  drivers/accel/habanalabs/common/pci/pci.c          |   2 -
>  drivers/accel/habanalabs/common/sysfs.c            |   6 +-
>  drivers/accel/habanalabs/gaudi/gaudi.c             |  86 +----
>  drivers/accel/habanalabs/gaudi/gaudiP.h            |  15 -
>  drivers/accel/habanalabs/gaudi2/gaudi2.c           | 347 +++++++++++++++------
>  drivers/accel/habanalabs/gaudi2/gaudi2P.h          |  17 +
>  drivers/accel/habanalabs/goya/goya.c               |   1 +
>  .../include/gaudi2/asic_reg/gaudi2_regs.h          |   4 +-
>  include/uapi/drm/habanalabs_accel.h                |   3 +-
>  17 files changed, 382 insertions(+), 269 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
