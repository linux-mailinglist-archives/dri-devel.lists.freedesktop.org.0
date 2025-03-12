Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED1A5DC2F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 13:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BF510E772;
	Wed, 12 Mar 2025 12:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V3+xLaLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F6410E772
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 12:04:32 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-2c2504fa876so1758672fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741781072; x=1742385872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1NsLoWL4c/6afSlKeAF4VzN3dvO9GP2QodQUbiJAV4=;
 b=V3+xLaLOEf/9OKMyEJXaJiJ7LFXA/qtVekgpJ1FtyEPmihJ7RjOVt/5s38fv7Z3P2A
 UUxSYYNu1eyTeEgSiV3TT19R0aGyiXqXvdkiFQQ97EbaQwHkSxPCCnscyY6Jdb5dPRsT
 C9yj/xLXVR+MvXupTC2EGExz7kTis/5huPsQ8og8iQny6Z4wOEmRqgr4mxVtgnhJmNsH
 pgjdM2kwhU6jmSsN5tK7udjfJqTR7wHacsZQrORHjZRur/teI3yMQcKymwtsIyb68S4e
 JhnIClrsTHPoJZyS4r4FJiJVXIzE5434A7BhVRfrJM0pgO86C90rm8ijUZkA0FE3boO/
 vDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741781072; x=1742385872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1NsLoWL4c/6afSlKeAF4VzN3dvO9GP2QodQUbiJAV4=;
 b=XhyL5NLyfPihmZ35tIB5t7S+s6BYVl/XbPWkfb42geIIatrFQqLqMFSqeYrQgHEHU2
 9FEsO1Isrw06LTuIEadmPQIP+DZodQCpLHDVWbJPUOKzMQVogULe5gngxcTSh2T+gOIy
 ptGGpr03pe1Q1R4ATXw4mmxbFRnZTOB2Z4zpp58BR0SVbodmpwb/L/F/UKyitGWMyEIw
 KmpTro2wDEJo1bJcpPAn/jEZQgIdW5Z1mZrn5anUZoEAP91pVdH9ANBJyG/4SwFY+y99
 MsnMRUocMAAUdyRafL9tpAh/f9BqVZ9zye+npiXLO9kdqi6itP0uD160aEubBKr2rQ7L
 MAow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFX2L9jQd8SUXZ72tbvbC43kH5x6dVXi+avW3hU0kw3zaO43Rtg0Y6+CWNquAML8flnqs4cNKAboo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvM7Ff4Cjhu9BxBcxC4aADe8MLJlEBLkRdJmKoq1Vqyrs31TAE
 xl7ASgd8nVz8Le8HxX/dD7LVgNCGAle5kHs1C6Rrmb9x2/z29Ex0GZcBaoHhwzDRVU6oRmnR0VH
 WyHHocIHMGfbEJAw2EPWF97CyaQ4=
X-Gm-Gg: ASbGncsu7o4+JBtZnEQ7rT8bgGxy6g5u3owaieBJYyUVhrmIogoaHmWO1dwDDxTenXN
 +cOgRh9DEAWDWDgIReWqzWWsSF1NSF4fJrPfKV/Udd+0vEVW+lMdjfsyoNVSnFsAdV/O4ozzNt5
 dzL6lavhIX//wxu68hlw1rX9zt
X-Google-Smtp-Source: AGHT+IEkDOwCBhDPp+6gJ95iYeluJh5LwTnSUDRFvyA0v1nSDf4hd+j0OiX36tXrXRtCEbk8IRVfO0jXXpzfOEt34eM=
X-Received: by 2002:a05:6808:318d:b0:3fb:33d4:49ed with SMTP id
 5614622812f47-3fb33d44c58mr2209329b6e.5.1741781071872; Wed, 12 Mar 2025
 05:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250303145604.62962-1-tzimmermann@suse.de>
 <20250303145604.62962-2-tzimmermann@suse.de>
In-Reply-To: <20250303145604.62962-2-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 12 Mar 2025 13:04:21 +0100
X-Gm-Features: AQ5f1Jpkvimp2Qj2ZfVOgzFZyHt2fpIyZljbGE8li0CoNJCI_dwqBlocIsYQp3s
Message-ID: <CAMeQTsZnhdwLQRrNEeJiMXEZ+LZFUoSu_Kph13FeUG49aoWbBw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/udl: Unregister device before cleaning up on
 disconnect
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, simona@ffwll.ch, jfalempe@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 sean@poorly.run, dri-devel@lists.freedesktop.org, stable@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 3, 2025 at 4:09=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Disconnecting a DisplayLink device results in the following kernel
> error messages
>
> [   93.041748] [drm:udl_urb_completion [udl]] *ERROR* udl_urb_completion =
- nonzero write bulk status received: -115
> [   93.055299] [drm:udl_submit_urb [udl]] *ERROR* usb_submit_urb error ff=
fffffe
> [   93.065363] [drm:udl_urb_completion [udl]] *ERROR* udl_urb_completion =
- nonzero write bulk status received: -115
> [   93.078207] [drm:udl_submit_urb [udl]] *ERROR* usb_submit_urb error ff=
fffffe
>
> coming from KMS poll helpers. Shutting down poll helpers runs them
> one final time when the USB device is already gone.
>
> Run drm_dev_unplug() first in udl's USB disconnect handler. Udl's
> polling code already handles disconnects gracefully if the device has
> been marked as unplugged.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b1a981bd5576 ("drm/udl: drop drm_driver.release hook")
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.8+

Hi Thomas,
Looks good.

Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/udl/udl_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.=
c
> index 05b3a152cc33..7e7d704be0c0 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -127,9 +127,9 @@ static void udl_usb_disconnect(struct usb_interface *=
interface)
>  {
>         struct drm_device *dev =3D usb_get_intfdata(interface);
>
> +       drm_dev_unplug(dev);
>         drm_kms_helper_poll_fini(dev);
>         udl_drop_usb(dev);
> -       drm_dev_unplug(dev);
>  }
>
>  /*
> --
> 2.48.1
>
