Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9F4857773
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 09:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0A910E109;
	Fri, 16 Feb 2024 08:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RIFzwYQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AFB10E109
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 08:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708071680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HsCdI41uNLdj9vWH20xULzyDarTlzF8V7YTORvhNJQ0=;
 b=RIFzwYQOdrOVoC+4e38DQKMTRMslJ8OGosxgeKEwTMRAIXxdWAMFSR0yLBpYNhX/MPJwdX
 76USLn6JStyXkBWuo8/4iTuDvXchdVt2bKHnj+kqF3JzlG04d7zFD4YZflkLfXDqw1+8Vg
 xZvtMqxKhUnbNUbWx/HKo5AA+MAeWmU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-daBfv3zRPz6V0z-34rBtog-1; Fri, 16 Feb 2024 03:21:19 -0500
X-MC-Unique: daBfv3zRPz6V0z-34rBtog-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-33d19eea6c3so244797f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 00:21:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708071678; x=1708676478;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HsCdI41uNLdj9vWH20xULzyDarTlzF8V7YTORvhNJQ0=;
 b=phbDE0MEsudO5uCJ1eyfoFiYYp4H81Qx6AbcH3C3kRE/YyBelwvwls/z4bJ/TbO5vu
 8n5m5XKio4193WOdeOXlv/kz74GuiqAa3CGjFykNqLy/nzAwV960k7EZJG4ZodbRKXZQ
 ZWBcjjBjATkbUo0H4EUuh7VTx5H1NjB44JDOLLYInH/r2ZyDMdvojyY7n79Q9tWV6OPX
 FW1sZOWClJaFHIFUo/EIRisYXlwvc9If8iNrrHHFl+5ou0A/v1hE7LY9s9RuWsWzP4xM
 h77yvnF5xktOCzM7BbaTaIvSJsY5MSUpe3Zp43nbrvbq2QVHpA1fGpeupeg30s+yunMl
 Kb0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZikTmmB11Huwa7ccr2sLfvAHCpgnBJkiU2QlZEwwRZ/35ZZIAtfbfDHBaCeovGD3UMg0QJiH8fcHePcYWtgYFmDQH5/iDFACQSZWItLjx
X-Gm-Message-State: AOJu0YxY/m+RS4nXOBokwNLThuWCv9hbNIo5bIUy4n+zky/s1RXxTwLd
 ezinroFgVnXOZ2RomxeaBMYuEk88uwALRtk3ElI9S8Gny7L4buW0J3gRQgyyXrNfWnyXoXh1Suj
 mxCkeg2/U4ACf8Gg54elPzqUsJI30gid2bI1YEWCOec4wVaqaVQnmHvqKisfEx4StmQ==
X-Received: by 2002:a5d:6109:0:b0:33d:228f:f4ab with SMTP id
 v9-20020a5d6109000000b0033d228ff4abmr105147wrt.15.1708071678169; 
 Fri, 16 Feb 2024 00:21:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFhNSykPbcaVP9rvuI+Pxyv/DedRPTjhi4bZfskagZIPLeSAgm7zKS8dwtr+tsW9UaRRKMAg==
X-Received: by 2002:a5d:6109:0:b0:33d:228f:f4ab with SMTP id
 v9-20020a5d6109000000b0033d228ff4abmr105131wrt.15.1708071677787; 
 Fri, 16 Feb 2024 00:21:17 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b7-20020a5d6347000000b0033d14455c99sm1468403wrw.101.2024.02.16.00.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 00:21:17 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Doug Anderson <dianders@chromium.org>, neil.armstrong@linaro.org
Cc: Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 dri-devel@lists.freedesktop.org, eizan@chromium.org, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Imre
 Deak <imre.deak@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Stanislav Lisovskiy
 <stanislav.lisovskiy@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
In-Reply-To: <CAD=FV=UtakQZ6OEKwERW5gNeAfS88EqkuQAHkrQoN=SicDG1JA@mail.gmail.com>
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
 <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
 <87sf1u58k0.fsf@intel.com>
 <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
 <cbcd981f-bd5d-477e-8482-d3414be17057@linaro.org>
 <CAD=FV=UtakQZ6OEKwERW5gNeAfS88EqkuQAHkrQoN=SicDG1JA@mail.gmail.com>
Date: Fri, 16 Feb 2024 09:21:16 +0100
Message-ID: <87frxskef7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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

Doug Anderson <dianders@chromium.org> writes:

Hello Doug,

> Hi,
>
> On Thu, Feb 15, 2024 at 8:53=E2=80=AFAM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> Hi Doug,
>>
>> On 15/02/2024 16:08, Doug Anderson wrote:
>> > Hi,
>> >
>> > On Thu, Feb 15, 2024 at 2:24=E2=80=AFAM Jani Nikula <jani.nikula@intel=
.com> wrote:
>> >>
>> >> On Wed, 14 Feb 2024, Doug Anderson <dianders@chromium.org> wrote:
>> >>> Hi,
>> >>>
>> >>> On Tue, Feb 13, 2024 at 10:25=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromi=
um.org> wrote:
>> >>>>
>> >>>> On Wed, Feb 14, 2024 at 2:23=E2=80=AFPM Douglas Anderson <dianders@=
chromium.org> wrote:
>> >>>>>
>> >>>>> If an eDP panel is not powered on then any attempts to talk to it =
over
>> >>>>> the DP AUX channel will timeout. Unfortunately these attempts may =
be
>> >>>>> quite slow. Userspace can initiate these attempts either via a
>> >>>>> /dev/drm_dp_auxN device or via the created i2c device.
>> >>>>>
>> >>>>> Making the DP AUX drivers timeout faster is a difficult propositio=
n.
>> >>>>> In theory we could just poll the panel's HPD line in the AUX trans=
fer
>> >>>>> function and immediately return an error there. However, this is
>> >>>>> easier said than done. For one thing, there's no hard requirement =
to
>> >>>>> hook the HPD line up for eDP panels and it's OK to just delay a fi=
xed
>> >>>>> amount. For another thing, the HPD line may not be fast to probe. =
On
>> >>>>> parade-ps8640 we need to wait for the bridge chip's firmware to bo=
ot
>> >>>>> before we can get the HPD line and this is a slow process.
>> >>>>>

[...]

>
> The kernel tree we landed on was the v5.15 tree, which is currently
> serving all Qualcomm sc7180-based Chromebooks, all Mediatek 8173
> Chromebooks and all Mediatek 8186 Chromebooks. There are also a pile
> of x86 Chromebooks running our v5.15 kernel. This code shouldn't
> affect them because (unless I'm mistaken) they don't use the two
> affected panel drivers. In any case, I haven't heard any screams from
> them either. Given my landing plans of "the week of the 26th", this
> still gives another 1.5 weeks for any screams to reach my ears.
>
> ...or are you looking for non-ChromeOS test reports? I'm not sure how
> to encourage those. I suppose sometimes folks at Red Hat end up
> stumbling over similar panel problems to those of us in ChromeOS.
> Maybe +Javier would be interested in providing a Tested-by?
>

I do have a SC7180 based HP X2 Chromebook and could test your patch (not
today but I could do it early next week), although I haven't followed so
if you could please let me know what exactly do you want me to verify.

AFAIU the problem is that the fwupd daemon tries to scan DP busses even if
the panel is turned off and that's what takes a lot of time (due retries),
and your patch makes the driver to bail out immediately ? If that's the
case, I guess that just starting fwupd daemon with an without your patch
while the panel is turned off could be a good test ?

> [1] https://crrev.com/c/5277322
> [2] https://crrev.com/c/5277736
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

