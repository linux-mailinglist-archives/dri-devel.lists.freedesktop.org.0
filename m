Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07D970FCA6
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 19:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47B810E031;
	Wed, 24 May 2023 17:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F66710E031
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 17:29:32 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7747df5b674so100675039f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684949372; x=1687541372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yq6BLiBB15ZpThHz2GQJH12upVOih5oQeiwfZRvJZIs=;
 b=bH+sXSbXZp8RHLYTq/K0OUSg075jA0Oq9cOOJggv39jUnsy54WOQT1vfeRh6HM829V
 ToWma5ngCXUBD5wGmC7RAev0GyONVyUjB+NcGWgL8mw0htimVwRSdzztZmW7M6eDgtgT
 3eOgyE2ZUP+h+BDMqtLUfmji/WDlUUOzmtTf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684949372; x=1687541372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yq6BLiBB15ZpThHz2GQJH12upVOih5oQeiwfZRvJZIs=;
 b=F6/G2z9soUzXR/zmUk23fogP/b1oNQIiGgWYxWbjEPZI5wdNpH0L13C5f4+FdohkFn
 8awcU1KmKoChb94aiFfKPfJVd9LB4kt0jIbhCvShD4StPLsJ3s2cKI4Y64Qvj2D/Kg0l
 G1qMHYZlvM//wmWYitjeCP2lBiGGRW8A9eyVOhW3ie7Lc6kEgUufiCUeUFEzqZt9cYOG
 aFK2XPfrkMKpDsYSlT+tgOGUdI0Iet0S/+OjpwePIKPzIp4+h+q0EitcrU6Pq5AA8jyx
 gnnj8U7U0YyvgmfSYU5etCGQ3V5+7fMzdBi7nwsRTPgiSW58cJq5Qvv1FGY/vbZCo94U
 8LUw==
X-Gm-Message-State: AC+VfDxxpA5zO5/uaSkmH3vmy1vdIMYP7Xh740M/LQfudYFSK17FfK9v
 d55KhkFZAPmpdXpWdXPHwV+3rjBlx5T/acfsn74=
X-Google-Smtp-Source: ACHHUZ5ykqvYK8BkvZKtsxFJYDj/ZFYFubTc5chBTdunwSHWN518bjTdg8KmKOtvMDeCjiL9JMIoiQ==
X-Received: by 2002:a5e:c107:0:b0:76c:8877:861c with SMTP id
 v7-20020a5ec107000000b0076c8877861cmr11593317iol.1.1684949371857; 
 Wed, 24 May 2023 10:29:31 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178]) by smtp.gmail.com with ESMTPSA id
 dl9-20020a056638278900b0040f91082a4fsm3110144jab.75.2023.05.24.10.29.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 10:29:31 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-33164ec77ccso9645ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:29:31 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b09:b0:335:a48:f668 with SMTP id
 i9-20020a056e021b0900b003350a48f668mr199716ilv.15.1684949370785; Wed, 24 May
 2023 10:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230523193017.4109557-1-dianders@chromium.org>
 <20230523122802.7.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
In-Reply-To: <20230523122802.7.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 May 2023 10:29:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ucn7BeWWGOOEX0ho7yH31VF-w7U60KFB8qSn4L1xn3fw@mail.gmail.com>
Message-ID: <CAD=FV=Ucn7BeWWGOOEX0ho7yH31VF-w7U60KFB8qSn4L1xn3fw@mail.gmail.com>
Subject: Re: [PATCH 7/9] HID: i2c-hid: Support being a panel follower
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 23, 2023 at 12:31=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the patch ("drm/panel: Add a way for other devices
> to follow panel state"), we really want to keep the power states of a
> touchscreen and the panel it's attached to in sync with each other. In
> that spirit, add support to i2c-hid to be a panel follower. This will
> let the i2c-hid driver get informed when the panel is powered on and
> off. From there we can match the i2c-hid device's power state to that
> of the panel.
>
> NOTE: this patch specifically _doesn't_ use pm_runtime to keep track
> of / manage the power state of the i2c-hid device, even though my
> first instinct said that would be the way to go. Specific problems
> with using pm_runtime():
> * The initial power up couldn't happen in a runtime resume function
>   since it create sub-devices and, apparently, that's not good to do
>   in your resume function.
> * Managing our power state with pm_runtime meant fighting to make the
>   right thing happen at system suspend to prevent the system from
>   trying to resume us only to suspend us again. While this might be
>   able to be solved, it added complexity.
> Overall the code without pm_runtime() ended up being smaller and
> easier to understand.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/hid/i2c-hid/i2c-hid-core.c | 82 +++++++++++++++++++++++++++++-
>  1 file changed, 81 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c=
-hid-core.c
> index 34c0d98b4976..f1bb89377e8d 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -38,6 +38,8 @@
>  #include <linux/mutex.h>
>  #include <asm/unaligned.h>
>
> +#include <drm/drm_panel.h>
> +
>  #include "../hid-ids.h"
>  #include "i2c-hid.h"
>
> @@ -107,6 +109,8 @@ struct i2c_hid {
>         struct mutex            reset_lock;
>
>         struct i2chid_ops       *ops;
> +       struct drm_panel_follower panel_follower;
> +       bool                    is_panel_follower;
>  };
>
>  static const struct i2c_hid_quirks {
> @@ -1058,6 +1062,34 @@ int i2c_hid_core_initial_power_up(struct i2c_hid *=
ihid)
>         return ret;
>  }
>
> +int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)

As pointed out by the kernel test robot, I clearly missed making
several functions "static" in this patch series. :( I'll fix that in
v2, but for now I'll hold off sending v2 to wait for additional
feedback.

-Doug
