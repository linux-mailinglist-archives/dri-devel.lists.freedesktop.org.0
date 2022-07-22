Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2598E57E017
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 12:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4E514BBF3;
	Fri, 22 Jul 2022 10:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC0214BFFF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 10:35:54 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id r22so1691773uap.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 03:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZKnuW8mda+Pv5ODyCfzYHYQK47yGtIeMQTcXQHTm4vQ=;
 b=I5W7LvuxRkO874+1/M/uqpXEGVpFohH0JlBJSXwZFFkWKq8p0MC0R7WLPCseZA2JS3
 K6f5XQTAPEBao+OfyDWSrRP1l6XSBNiFmRTUaeAcXB+Wo7+qRHvRO6xSQZFVcMZYInbA
 DHfpMyllmWvLmwD6g1rKPNe+xX3lGd4LfZYMVdY1IQ3uqo/oC0wpMn9ZCVphjQ3XgQ2T
 Lub7Bwyumq3LX6ft7PPkSDyB0yYf4bd4jiok1HhQ3zjNZMkzGGWkF450AeC82Lyi4jMM
 1K/sX9K+nqOiWVtPjxmzbkJ2GkvOcmGRLK9VJTVWk535KHoNidA6f27Rvyl2VCeCiOBM
 HBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZKnuW8mda+Pv5ODyCfzYHYQK47yGtIeMQTcXQHTm4vQ=;
 b=XTy8onpBp6Mwer2PKN4p4x89kwtI74LnZ4RQd5z7+sgNtRuQIx13hZyBnrXuResYYj
 BTK5zxCulnbAb50i89zqrjNikOTJbcgW3d8xjRuPetSwohM8tKYyVnsTCIVHIV8ZIpwm
 Im0v6EzdeEBaURkUQmWeJghUCGhhxjGHFTARO+okGNhzzFITw1r2S6yG/Fv7ReIUD+In
 1B+sXi7h5TkKkeuPqrUchyqoqG+pAeLh6JRSVxer/vDjZEanHPdSkj3BrcJxeMix3gzI
 eFLZiB6yjIGzeMkc2FhMUQDezG6qlZzqmWLNgbyy+EJOYa+DanwEukvnRe6+7xuj/TZr
 H11g==
X-Gm-Message-State: AJIora+n9LSokHTEFsu4yaU6CPk/8Kah8h+J3319nC5rnQF35dH639co
 mHLYEmUGzaO7y3d3PsIFqQviHIsS7PhfAvpNYxk=
X-Google-Smtp-Source: AGRyM1utRwQRjz3mhWTLtpsFB6mhF2NbXXEDBgFnQ5cwOqFH2vmyeg5LbXrRR4m7MEEgLizLYgYCjg8eUcjJPiQnMaY=
X-Received: by 2002:ab0:20d7:0:b0:373:5c54:724c with SMTP id
 z23-20020ab020d7000000b003735c54724cmr841210ual.56.1658486153236; Fri, 22 Jul
 2022 03:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220708203052.236290-1-maira.canal@usp.br>
 <20220708203052.236290-10-maira.canal@usp.br>
In-Reply-To: <20220708203052.236290-10-maira.canal@usp.br>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 22 Jul 2022 11:35:26 +0100
Message-ID: <CAM0jSHNG8Ozs+NpvwMK6zvbRm3Ve=Wa1_H7jS0uQ8FeAWgvyoA@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] drm: selftest: convert drm_mm selftest to KUnit
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Arthur Grillo <arthur.grillo@usp.br>, siqueirajordao@riseup.net,
 David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kselftest@vger.kernel.org, n@nfraprado.net,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 magalilemes00@gmail.com, Javier Martinez Canillas <javierm@redhat.com>,
 kunit-dev@googlegroups.com, mwen@igalia.com, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 tales.aparecida@gmail.com, kernel list <linux-kernel@vger.kernel.org>,
 leandro.ribeiro@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Jul 2022 at 21:32, Ma=C3=ADra Canal <maira.canal@usp.br> wrote:
>
> From: Arthur Grillo <arthur.grillo@usp.br>
>
> Considering the current adoption of the KUnit framework, convert the
> DRM mm selftest to the KUnit API.

Is there a plan to convert the corresponding selftest IGT that was
responsible for running this (also drm_buddy) to somehow work with
kunit? Previously these IGTs were always triggered as part of
intel-gfx CI, but it looks like they are no longer run[1].

[1] https://gitlab.freedesktop.org/drm/intel/-/issues/6433
