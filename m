Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3A520E10
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F9D10ED67;
	Tue, 10 May 2022 06:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480D110E0EB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:23:28 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u23so18083895lfc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1K2obVx3YG8QEPrenU4QI5guJQ8Phbo/6yP70JTaawU=;
 b=ctuOdHCyg4DfJDMuVyrfXjafqsIBGrPq9u27BiBAquJftMSjYFJ55Dztcsr8bNMn0w
 oeM//L+QbMc5cqR/YL4ZYXu9SspJYNvQLipuO/dxUV/COK7qJD4YPieEuwN+Da6gnICg
 tiL5ifQOF61sLM7j5k+TfKf3keD2QE9+mfbjkcLau1uokLQ0TJXXWGRj10hWZc6mNTCY
 ZiPlrCXkxh/d8AP+hVzj144bdbLZ6gunWEeo3XTOHdZMf+1T4Dk4fDvhUDM82hKq6q3x
 a24gfPwl0eQuynyAnF+v9tUB7WbmPEsnBDi3opOHoOjQkJbqyH8fYmRySBDQ1lHi3t+I
 lY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1K2obVx3YG8QEPrenU4QI5guJQ8Phbo/6yP70JTaawU=;
 b=mnosZ/eNEi87+L5z9YccamSrpiN7xMRD3xbw1U8rHyz9h8Ed8cL9rpIFztvBRWVlK6
 5kloEv6r3vr2v8Znv6o8N8vUr35aC5cT0bfesAy5mLDVUVF216u8DFOSyfuMxdLyPtEE
 NhfCZayhK2/AUE2eEU6VdHd8AUu5An8rXQpQn2F+r8v3iy8ZMT0mO+VB/NXVpViAprK9
 dNfxOJqh2/kD3lr+OcO4P+6V03cZ3cF0t9PECez4lg0YidxN+NNmRHScdMrlr2UBKeiS
 8Rdkvk5sbiy5p2XdV5oNgR34on8wBlTB+sPGt9Ut4ApCsAH9yfbb4I6MtmgVz1CVdXXI
 PoYg==
X-Gm-Message-State: AOAM533008EE3KADtRvw7F8TvbOyl45C0apEfhbxGNKPMSx2qstMCg1k
 Fzq1dXp0NbyH+aRO+cGikdI=
X-Google-Smtp-Source: ABdhPJy54uNV0a0Y5a5xZUhU6QHCMVecZmAJ2frVW6KAYppShjM44jXuH8rdrMemcTVYgMIiSG1E7g==
X-Received: by 2002:ac2:4c49:0:b0:473:ca4f:9345 with SMTP id
 o9-20020ac24c49000000b00473ca4f9345mr12622420lfk.203.1652102606387; 
 Mon, 09 May 2022 06:23:26 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a056512338500b0047255d2111csm1941442lfg.75.2022.05.09.06.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 06:23:25 -0700 (PDT)
Subject: Re: [PATCH v3 00/21] xen: simplify frontend side ring setup
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-integrity@vger.kernel.org, linux-pci@vger.kernel.org
References: <20220505081640.17425-1-jgross@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <409fb110-646a-2973-aff3-c97fdfb9bfbc@gmail.com>
Date: Mon, 9 May 2022 16:23:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220505081640.17425-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 May 2022 06:48:43 +0000
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
Cc: Jens Axboe <axboe@kernel.dk>, alsa-devel@alsa-project.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>, Peter Huewe <peterhuewe@gmx.de>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05.05.22 11:16, Juergen Gross wrote:

Hello Juergen.



> Many Xen PV frontends share similar code for setting up a ring page
> (allocating and granting access for the backend) and for tearing it
> down.
>
> Create new service functions doing all needed steps in one go.
>
> This requires all frontends to use a common value for an invalid
> grant reference in order to make the functions idempotent.
>
> Changes in V3:
> - new patches 1 and 2, comments addressed
>
> Changes in V2:
> - new patch 9 and related changes in patches 10-18
>
> Juergen Gross (21):
>    xen: update grant_table.h
>    xen/grant-table: never put a reserved grant on the free list
>    xen/blkfront: switch blkfront to use INVALID_GRANT_REF
>    xen/netfront: switch netfront to use INVALID_GRANT_REF
>    xen/scsifront: remove unused GRANT_INVALID_REF definition
>    xen/usb: switch xen-hcd to use INVALID_GRANT_REF
>    xen/drm: switch xen_drm_front to use INVALID_GRANT_REF
>    xen/sound: switch xen_snd_front to use INVALID_GRANT_REF
>    xen/dmabuf: switch gntdev-dmabuf to use INVALID_GRANT_REF
>    xen/shbuf: switch xen-front-pgdir-shbuf to use INVALID_GRANT_REF
>    xen: update ring.h
>    xen/xenbus: add xenbus_setup_ring() service function
>    xen/blkfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/netfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/tpmfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/drmfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/pcifront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/scsifront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/usbfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/sndfront: use xenbus_setup_ring() and xenbus_teardown_ring()
>    xen/xenbus: eliminate xenbus_grant_ring()


For the patches that touch PV display (#07, #16), PV sound (#08, #20) 
and shared buffer framework used by both frontends (#10):

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


Also I didn't see any issues with these frontends while testing on Arm64 
based board.
So, you can also add:

[Arm64 only]
Tested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


Thanks!


>
>   drivers/block/xen-blkfront.c                |  57 +++----
>   drivers/char/tpm/xen-tpmfront.c             |  18 +--
>   drivers/gpu/drm/xen/xen_drm_front.h         |   9 --
>   drivers/gpu/drm/xen/xen_drm_front_evtchnl.c |  43 ++----
>   drivers/net/xen-netfront.c                  |  85 ++++-------
>   drivers/pci/xen-pcifront.c                  |  19 +--
>   drivers/scsi/xen-scsifront.c                |  31 +---
>   drivers/usb/host/xen-hcd.c                  |  65 ++------
>   drivers/xen/gntdev-dmabuf.c                 |  13 +-
>   drivers/xen/grant-table.c                   |  12 +-
>   drivers/xen/xen-front-pgdir-shbuf.c         |  18 +--
>   drivers/xen/xenbus/xenbus_client.c          |  82 +++++++---
>   include/xen/grant_table.h                   |   2 -
>   include/xen/interface/grant_table.h         | 161 ++++++++++++--------
>   include/xen/interface/io/ring.h             |  19 ++-
>   include/xen/xenbus.h                        |   4 +-
>   sound/xen/xen_snd_front_evtchnl.c           |  44 ++----
>   sound/xen/xen_snd_front_evtchnl.h           |   9 --
>   18 files changed, 287 insertions(+), 404 deletions(-)
>
-- 
Regards,

Oleksandr Tyshchenko

