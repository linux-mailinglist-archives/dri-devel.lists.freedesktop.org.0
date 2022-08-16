Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F31B5954D5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 10:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35AFAD605;
	Tue, 16 Aug 2022 08:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2E7AB251
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 08:18:07 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id a22so8157416pfg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=yiBicl/xtck+sUvDa6HbwVr3KCpBiQ3kP9sWsGd0v+M=;
 b=uT3jiYPYFRn7lq9viYTDzroDVdXL8pYjwBzK6ZhdPWJ3ales5ct7XINz7ercxdfD7Y
 rvax/AK/RPxyH9Qyvj6cKGyu5Z9eSVcZeTL3ghWM02DMNeRTu1dNZ7beU/wveqK5kb+b
 cgTDsiraqeHQID8d9ZRhhEi710zRj0h9tNoJIy/ZIZdDiEU/5Tq3uSnDDCMR184RYyCg
 LVWxI+KwzGdKQ6ji/qPZRP+nel4pcCCfqXweiR63F69BqC+Nt+6QIM31Ab1sSdW2FTPk
 LjcGqOsRMi5qhAbnOjRjnE/4ICeEvzLIfRc/1JoVKPEsJ2GoYjX+SmVkYwcf+ocJax8W
 K0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=yiBicl/xtck+sUvDa6HbwVr3KCpBiQ3kP9sWsGd0v+M=;
 b=aRXDxqt2yfvmXBnhY8n5gFe9Xtjy0GqsV9Zc1pDp8uegHtvQfn5/UKCaqlkdJ1Cq0t
 i5cfUSgMUBpYO05ILoOhVxG+5GBzRYRA6wOEPrTHFIQ+QhyIo6ADX02ZFnrndeougX8J
 IieSdvzqfZcuxD5WDW6ydgATGJc6Z26azANvEP7SQSP7bHK5V5noOF3yslvGdur/iNhy
 RhIc2udm5lcm9wto4j/5omEfZ+DTk0JCaxNanL9dFPKAQzDGEZetKBqtV2ELl498OCHW
 SzIJRxgPdXNEL+3lH15n/MiXdtoR3KOhqnK1jVJ5uZb088FWKKPMLUwo2RGPANr6aTft
 PscA==
X-Gm-Message-State: ACgBeo0t4ZT/GV+M8hS+SiLzOGWvl02l56LmDqu/odnpkyhTZCaZonjh
 dn61hPb5bD77g70S0PLQFT4LzhWXfftRG0casuIZHQ==
X-Google-Smtp-Source: AA6agR7a2co2/3EHjLJWWfyl0Y9FC9Qup8Vvr947CQmLmaKAXgb15xFZYz1xNiLfRaHjV9zeEjmoSBme+mzy7PUZf/A=
X-Received: by 2002:a63:e217:0:b0:41a:69b1:a68e with SMTP id
 q23-20020a63e217000000b0041a69b1a68emr16488504pgh.428.1660637887011; Tue, 16
 Aug 2022 01:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220812143055.12938-1-olivier.masse@nxp.com>
In-Reply-To: <20220812143055.12938-1-olivier.masse@nxp.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 16 Aug 2022 10:17:56 +0200
Message-ID: <CAHUa44EgA1btRyj2ByooyLr9Q+8AmW=9EfjtQFxyr7DuCXASvA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
To: Olivier Masse <olivier.masse@nxp.com>
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
Cc: sumit.garg@linaro.org, clement.faure@nxp.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 etienne.carriere@linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Olivier,

On Fri, Aug 12, 2022 at 4:31 PM Olivier Masse <olivier.masse@nxp.com> wrote:
>
> Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
> shared memory from a dmabuf file descriptor.
> This new ioctl will allow the Linux Kernel to register a buffer
> to be used by the Secure Data Path OPTEE OS feature.
>
> Please find more information here:
> https://static.linaro.org/connect/san19/presentations/san19-107.pdf
>
> Patch tested on Hikey 6220.

What's new in this V2?

Thanks,
Jens

>
> Etienne Carriere (1):
>   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
>
>  drivers/tee/tee_core.c   | 38 +++++++++++++++
>  drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
>  include/linux/tee_drv.h  | 11 +++++
>  include/uapi/linux/tee.h | 29 ++++++++++++
>  4 files changed, 175 insertions(+), 2 deletions(-)
>
> --
> 2.25.0
>
