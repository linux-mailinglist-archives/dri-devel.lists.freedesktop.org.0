Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA10A6EF659
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 16:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5E810E130;
	Wed, 26 Apr 2023 14:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9E910E130
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 14:25:58 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-38bed577755so2661565b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682519157; x=1685111157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U2Z7XiAW0682+1reJ9kRWOozvDk4jsLjeyU2Feerd6M=;
 b=Ckr3gjJC4ohUY80Uiv/StFVReuN7Rc/Zgf5sXykNetMtWkEAsjS3/sGlerQKA31CJf
 j+zAiol2T+QX+s7sV0nXfxXs+iBkfdruBQEccgKEWeZpx6OAB48Nh1KPFixCMX1abO5T
 POyK7SESM7xLzI8QZLj4QWWsOMNaQgSaymyMAODC0wDWN58sM7qy6BeeVYGZvLFlMp2M
 +Woxv+IHenH6vLcFCHGYJBpXKK6sH8T2GSdsAuH7KftZVA8d5jZbdaG5KpXY4xoUbfsQ
 +YtAu8VT/B8rvhULHQWVcyggakOQsobMmR8Y+lJdLKLVqVSun0ji37y/T0tDnEaApn+x
 zxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682519157; x=1685111157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U2Z7XiAW0682+1reJ9kRWOozvDk4jsLjeyU2Feerd6M=;
 b=fxCL3V1U7wNfai9vs57+q+RxrlXbzjneWrNdp7i/SdiJL49rpAUdIqsK6HFZSGGaqW
 EICtf713+uBZi/GtPGniHwA4ITB6bQV3jcTONoyg8q+LftNW9wUrsdQrLHrGxvnWWSd+
 0NEHm1mO8yREkh2Jr4088Ex8eeDmCMld/VfcYJB8iOQUq9rbHUNxRLVlK7QEk05vlsTj
 FLJ3e/QobS5iYofj3AYK49TUt9VWbdKzCMhYCZhcZCeprSmQrbRbmF5z6tDcOqVQX90A
 fYvvQvqhDazqOi4kq0oJBfOZQKTMvRhH5iadLgpRH+dd1b2M7BSf0KXuBDDLPpUbcxA1
 hlQg==
X-Gm-Message-State: AAQBX9eR93z1NkjBN2L1EVO3yTENpjwAQKUutNJS80GNKOuGRmv6dTDA
 X5h4ajITDTKjaPuaVtEW3DTaHtQvDq6eM7re7wM=
X-Google-Smtp-Source: AKy350YauJ4xPgnyMWMGeDhlSARLlh1kuR1DQZt0r0BQqKK7MzQN32EdHgsuQ8zASK/P/VuhRf2boiyHMKgZqJG/cS4=
X-Received: by 2002:a54:4589:0:b0:38e:4b50:161b with SMTP id
 z9-20020a544589000000b0038e4b50161bmr10689152oib.4.1682519157069; Wed, 26 Apr
 2023 07:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230426042906.724352-1-airlied@gmail.com>
 <20230426042906.724352-2-airlied@gmail.com>
In-Reply-To: <20230426042906.724352-2-airlied@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Apr 2023 10:25:45 -0400
Message-ID: <CADnq5_Ot6_RU5qCtJkM_mbv-=btkv_rN9ezrKBCaeLEKWDU0ZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] modules/firmware: add a new option to denote a
 firmware group to choose one.
To: Dave Airlie <airlied@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>,
 linux-modules@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 12:31=E2=80=AFAM Dave Airlie <airlied@gmail.com> wr=
ote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> This adds a tag that will go into the module info, only one firmware from
> the group given needs to be available for this driver to work. This allow=
s
> dracut to avoid adding in firmware that aren't needed.
>
> This just brackets a module list in the modinfo, the modules in the list
> will get entries in reversed order so the last module in the list is the
> preferred one.
>
> The corresponding dracut code it at:
> https://github.com/dracutdevs/dracut/pull/2309
>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Dave Airlie <airlied@redhat.com>

I think this is a very useful feature,
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  include/linux/module.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/include/linux/module.h b/include/linux/module.h
> index f9d072a7e198..d3e7085cedd0 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -306,6 +306,28 @@ extern typeof(name) __mod_##type##__##name##_device_=
table          \
>   */
>  #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
>
> +/**
> + * MODULE_FIRMWARE_GROUP_ONLY_ONE - Create a need only one firmware grou=
p
> + * @_grpname: group name
> + *
> + * This creates a group of which the driver only needs one firmware inst=
alled.
> + * This is to allow dracut to limit the number of firmwares in the initr=
amfs.
> + * This just creates a new entry in the modinfo section, there should be=
 one
> + * of these entries bracketing the group of MODULE_INFO lines.
> + * Due to how modinfo is constructed the ordering of the modinfo means t=
he
> + * last module info in the group will end up being the first one dracut =
will
> + * search for, so place the newest firmware last.
> + *
> + * ``MODULE_FIRMWARE_GROUP_ONLY_ONE("mygroup")``
> + *
> + * ``MODULE_FIRMWARE("firmwarev1")``
> + *
> + * ``MODULE_FIRMWARE("firmwarev2")``
> + *
> + * ``MODULE_FIRMWARE_GROUP_ONLY_ONE("mygroup")``
> + */
> +#define MODULE_FIRMWARE_GROUP_ONLY_ONE(_grpname) MODULE_INFO(firmware_gr=
oup_only_one, _grpname)
> +
>  /**
>   * MODULE_IMPORT_NS - Set the symbol namespace for the module.
>   * @ns: symbol namespace to import the module into.
> --
> 2.39.2
>
