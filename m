Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C6C2D3D7A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2D26E7FA;
	Wed,  9 Dec 2020 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01B26E999
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 18:33:13 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id a16so26035433ejj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 10:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbUzoXSmraRsXb/HlPMw5PQ5JJu5VptRDmle82sQsYM=;
 b=Gv0vyIus0i2Ht68M58bsN54P6D/KugieN6WEFyV7rebJ9qi4aF0d55CgZSq17nSNwL
 PTaS2ZldVXvI9UsiflbVDFynGR1tnnN+wTiW+ggujXK1RN4OjgZYMScNDzbd2u464nWm
 q00IuZWOVvrPCqt25YoebkjnejsfTwXXUsT/MpRAxKlrjQ3e76wwPe64cUQjqUTn6ikI
 64UhY1A2lQNYS0LePmnCHKwaltxs4qpoSUhBZCaTBZ1TV6C1kXFZLNmSZU63QQnOtr0o
 Y8qtOo85YxhxSwGB0I/C0TvsEu4d63Gndp8mmk/guw9KTSFRRzs5Jg1RSHrudtWerUny
 AraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbUzoXSmraRsXb/HlPMw5PQ5JJu5VptRDmle82sQsYM=;
 b=CNX6ImAapHpKJEPliQI3UCCA0ubUywmCA7BzZUeQdbJ7k3jdx+EnLqgZ3F6JHN0MVI
 ibmia/VmCjpMAvcmhy6h9skXHCOlxxvrbJzFxFQRmugyCbE0s+3TGN69WEWkqUUDHm1g
 BhDLkhImyvL+koVqg97173h/ubEzdU3l9Ho7TBaNmowFwYGwQPj/h5tddYg0MQ34JSCC
 LHzZ2zVo3LvPK2myCQ1almMYlP89TMtHGmQDx6PPmWg/0jjSwKwf7s1vuwdA8rmBVvXk
 nnaQupSW4Bek5U+ndBsJTlw0OieBC0MJZggkhoTB7MXJqRdsTUtspLXENnSYDxFWtpdt
 yX1A==
X-Gm-Message-State: AOAM530YE8PbjuldbJEGwCksCEKg4pDy6ktwwmRarJ6f2qnTXrNRYPP5
 qOHNmaxnqE/qD2dr7RZjNvLezh8SG+LfKEnIyqIuw7ssPUDbSfJC
X-Google-Smtp-Source: ABdhPJzwxWHZ5TTp/fknB/UdJvM5hBhRXoHjUvHv1YnzjaTTvcClaV0DtY7JSjp3c+Rt61bZd/o0zs8nxCGjMEECwEI=
X-Received: by 2002:a17:906:43c5:: with SMTP id
 j5mr7066318ejn.530.1607452392263; 
 Tue, 08 Dec 2020 10:33:12 -0800 (PST)
MIME-Version: 1.0
References: <202012080129.qAoCOovN-lkp@intel.com>
 <1607364939-640-1-git-send-email-jpark37@lagfreegames.com>
 <1607364939-640-2-git-send-email-jpark37@lagfreegames.com>
 <8GcCcwMpk0Rz_34xReIOuuL2JZBQ2P71fYo4-G8ZMcxdqu2GE7NVnsxUHIxbo7xOylM_lIO2sA6yIgI9W3MoSvErpLWFTRFJR1Om6dtN9wE=@emersion.fr>
In-Reply-To: <8GcCcwMpk0Rz_34xReIOuuL2JZBQ2P71fYo4-G8ZMcxdqu2GE7NVnsxUHIxbo7xOylM_lIO2sA6yIgI9W3MoSvErpLWFTRFJR1Om6dtN9wE=@emersion.fr>
From: James Park <james.park@lagfreegames.com>
Date: Tue, 8 Dec 2020 10:32:16 -0800
Message-ID: <CABjik9dKMGkuZXpMbdSjz9aPxn=_mQoU4kGAd6jdBKju82e1jw@mail.gmail.com>
Subject: Re: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
To: Simon Ser <contact@emersion.fr>
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>
Content-Type: multipart/mixed; boundary="===============2080769956=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2080769956==
Content-Type: multipart/alternative; boundary="000000000000d5af6105b5f82c21"

--000000000000d5af6105b5f82c21
Content-Type: text/plain; charset="UTF-8"

This was the message from kernel test robot.

>> usr/include/linux/kfd_ioctl.h:37: found __[us]{8,16,32,64} type without
#include <linux/types.h>

On Tue, Dec 8, 2020 at 4:31 AM Simon Ser <contact@emersion.fr> wrote:

> May I ask what exactly fails when you drop #include <linux/types.h>
> from drm.h?
>

--000000000000d5af6105b5f82c21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This was the message from kernel test robot.</div><di=
v><br></div>&gt;&gt; usr/include/linux/kfd_ioctl.h:37: found __[us]{8,16,32=
,64} type without #include &lt;linux/types.h&gt;<br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 8, 2020 at =
4:31 AM Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersi=
on.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">May I ask what exactly fails when you drop #include &lt;linux/types.h&=
gt;<br>
from drm.h?<br>
</blockquote></div>

--000000000000d5af6105b5f82c21--

--===============2080769956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2080769956==--
