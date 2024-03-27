Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9064188EDE2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 19:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B510310FF17;
	Wed, 27 Mar 2024 18:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HhLKoxqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1914D10E674;
 Wed, 27 Mar 2024 18:13:16 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-29c14800a7fso117356a91.2; 
 Wed, 27 Mar 2024 11:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711563195; x=1712167995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F+Apmp+5NG0ozOI/JWe7g3FmXSoAcJcuTi09oKHmC84=;
 b=HhLKoxqjc+TxXtLByubOs8DeDRe+AIZY2+1Mip/qj8eDPvkz53lyGrYcUfKc/33vJ6
 I7XubOLod/KzFyinUfSjft6EekRR2R/EU9eew3EtprXqXxYuXAZ1bTUTASqnjbb5QGkD
 VMc2NNuXXHW05G8lrd+Lub94zKxx3JQR51vazT5KevGfhBNuno/cPD1HJ89foWuF/bSa
 W2MTGjiknzSiithNHFo61mRtdufdlKBfXVv0Z7PAagW3k8QIRbghxVtfafvT/aIGhhgT
 giP/kaueggKBxxf01V2QQi+SSJRSCdMs9DRxTioTVi26HdCxY8QccXpidLRq+RVzPMrb
 DCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711563195; x=1712167995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F+Apmp+5NG0ozOI/JWe7g3FmXSoAcJcuTi09oKHmC84=;
 b=ptzUnkOpUZ5vFe0FtbsrIqmzftdcRv0CbS+BrzbWkBVkI7BoYfAAD6GK724lJXHc5m
 KhefSXoQHgAhhcDoE8WtwTPkw1BL/mb+JW/k/LVR4XD0kudnvdsWG/INWyBqgDSS2jWP
 xJE8YnQeHvUsT5867TvD7pPyoTG7Vo0E8+k7K3X/S3V9x+rxYtCu0V2cCNtYD9QQqSXO
 J/tFInnOsQRlCzS91yf+wXgB4q696+6Ov4f0QMWkOQMueZyR+Py7iK/keGSCY5mIK4Tl
 0AR1U42WdeIPVSoMAZDfqQTTIheHbrCQBjE9TGyrjTD5U20MKujMPgVreI7jrVtFdPu6
 j0Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHaF4YkVSyJrgMSspoASIwOKPebFXyejeIhf7/uxcZdYvW+KTC/K4Dk8ql9OYavmYCPQqfqynmEbn/niVPNlS+hnOCV/4CuYUFaY8is88N6d/VsMGFwlEtuBSzLsRjdW9F1SlCnVSX4rDt72iOcVbbxLo=
X-Gm-Message-State: AOJu0YzbBnCMMLz+18ek+2ey0SsxD3/YC7+4/8w19ZS6m5sBW+9JxxMJ
 aL6pjbNbG+nI7klgXQdjNiWmHUNmdSVg3lM2IJHhDFNRh7ji8u204epv7sBUJOnWsyh/VYFQcIN
 pOVqUvoxuuIPH09kgs8E1SNzc/+o=
X-Google-Smtp-Source: AGHT+IHLikdTRV0YFY05LU+4dKjjaqnZE0r4ZhQYCDgh/j+5MZTT1jmReESMvyU/J8EN3USD/LkkQwkRCTSMfu5GTf8=
X-Received: by 2002:a17:90b:3702:b0:29d:dfae:4fac with SMTP id
 mg2-20020a17090b370200b0029ddfae4facmr514671pjb.23.1711563195269; Wed, 27 Mar
 2024 11:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mbsAYmR_dRPpQQ=9-NWhTtp0TWiOz0v=V-0AvwYbWw4A@mail.gmail.com>
 <20240327-magnetic-nonchalant-hare-bbe8d2@houat>
 <CANiq72kqqQfUxLkHJYqeBAhpc6YcX7bfR96gmmbF=j8hEOykqw@mail.gmail.com>
In-Reply-To: <CANiq72kqqQfUxLkHJYqeBAhpc6YcX7bfR96gmmbF=j8hEOykqw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 Mar 2024 19:12:47 +0100
Message-ID: <CANiq72=hguVfscJQSCAYS2FfL1VpUVvX_Chd4X8gAX4Twq-TLQ@mail.gmail.com>
Subject: Re: drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable 'count' set
 but not used
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Wed, Mar 27, 2024 at 3:43=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Will do -- I found another one when running the CI with the above one fix=
ed:
>
>     drivers/gpu/drm/qxl/qxl_ioctl.c:148:14: error: variable
> 'num_relocs' set but not used [-Werror,-Wunused-but-set-variable]
>
> I will send you one for that too then.

Done: https://lore.kernel.org/lkml/20240327175556.233126-1-ojeda@kernel.org=
/

Cheers,
Miguel
