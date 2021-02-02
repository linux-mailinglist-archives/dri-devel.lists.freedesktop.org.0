Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8480930C79A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 18:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77E76E1F8;
	Tue,  2 Feb 2021 17:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C136D6E1F8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 17:28:40 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id v19so11554406vsf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Re1dLiCSK/orF1M9oplPl3M0+a/IjGtst3Dsn1P1sQ=;
 b=ldyPvBo1dxqf4Ro5S7/P6Zwr3DUYNdEeFsPdV0u70OV/pnNe4vQdHNEBXP4HWqLFEZ
 jEo4NPuJF4vzmKMYv981Y9Z4HYH49NVefkg/9I6EvIqVB0OcrTUYXuwCx9Oo7BoTWhJu
 KMi1QcmZD8XXJ2wmkW9Y3tffx7Nt1gW4fRT2ZgsvBZ8J4SEWh6xwyR66jiDZlsPDscvA
 2wussxQa8+dtqiY4RzTeqj10u8n/gvfM/MJzdyWAH6UAy0OHcZQtjM21xre3sUZ5jTKr
 9zRzI2pArG7GEwTLr2yQFX182xbvkBquwj6sP5oyw6B/8TvOpibotlwBNUZNjIV8iYXO
 /lFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Re1dLiCSK/orF1M9oplPl3M0+a/IjGtst3Dsn1P1sQ=;
 b=PCikI49+n0L3C7VDz+VVl8Xt0by60HvokUtSKEWAezAL7rrv8Rq/oLZpCN2dkfq405
 HkuOv+/qUCdqsZBrjWfVaSZqQb90QaDhjgw6pa8U5Qk9+H7ywR9m529pg9h5phFMIqA5
 dJvXgQ5adQ4PZC9reFskmM50I3M8NcilUA4yVurRxj4eMCahecIvsrQuVz5eQxcGKfy+
 O22QN2UTlUt7ADV1tkK6mBpndCcEG51Ex2camfEiFhHR3YG9VdaBTi3Zm6V/SaUvYquo
 +7T93QomtaklUWFsyee3r3Tq8/aw3Q57j4rpkUB6y+8xqMeoAs+aN3+OsSqZIJETM+Mk
 SXxg==
X-Gm-Message-State: AOAM532PhPuGVwhT3wX5zvJdCc2vgrTJkmWFMMFWzfa+IdOETVoDBpTv
 3S7jySJnk5AgIILO+6EwRpz0vQdaEvjIUfEKTJ4=
X-Google-Smtp-Source: ABdhPJyLKO+EvMBZvtDnMBkx7YeeYNXk/M0FAJgpNKNeGZLvnyT9R93YRIH78rN4ujxiFYemaIn6bxinje8K0Q9tV5g=
X-Received: by 2002:a67:882:: with SMTP id 124mr12567566vsi.33.1612286919809; 
 Tue, 02 Feb 2021 09:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20201210103553.1ae238d2@eldfell>
 <1607591574-949-1-git-send-email-jpark37@lagfreegames.com>
 <1607591574-949-2-git-send-email-jpark37@lagfreegames.com>
 <CABjik9eM1JGy42WgSpqVjxakjHMSr_sxpAPAHT5rrMSZ0Kwakg@mail.gmail.com>
In-Reply-To: <CABjik9eM1JGy42WgSpqVjxakjHMSr_sxpAPAHT5rrMSZ0Kwakg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Feb 2021 17:28:27 +0000
Message-ID: <CACvgo52y219pp=oD3FPT46YmVYhSwa3BfaQEoq6rj7KwqZE1NA@mail.gmail.com>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
To: James Park <james.park@lagfreegames.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi James,

On Tue, 2 Feb 2021 at 08:27, James Park <james.park@lagfreegames.com> wrote:
>
> Hello,
>
> Is there something I can do to help move this patch along?
>
> Thanks,
> James Park
>
> On Thu, Dec 10, 2020 at 1:13 AM James Park <jpark37@lagfreegames.com> wrote:
>>
>> Create drm_basic_types.h to define types previously defined by drm.h.
>>
>> Use DRM_FOURCC_STANDALONE to include drm_fourcc.h without drm.h.
>>
>> This will allow Mesa to port code to Windows more easily.
>>
>> Signed-off-by: James Park <jpark37@lagfreegames.com>
>> Acked-by: Simon Ser <contact@emersion.fr>
>> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>> ---
>>  include/uapi/drm/drm.h             | 12 ++-------
>>  include/uapi/drm/drm_basic_types.h | 52 ++++++++++++++++++++++++++++++++++++++
>>  include/uapi/drm/drm_fourcc.h      |  4 +++
>>  3 files changed, 58 insertions(+), 10 deletions(-)
>>  create mode 100644 include/uapi/drm/drm_basic_types.h
>>
Have you considered the possibility of having the ifdef block inlined
within drm_fourcc.h?

Sure some users might need to add an drm.h include in their code. At
the same time they also need to explicitly define
DRM_FOURCC_STANDALONE, so that is fine.
We had all sorts of issues with these headers in the past, so adding
another one might end up repeating some of those yet again.

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
