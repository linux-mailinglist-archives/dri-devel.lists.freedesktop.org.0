Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE13F2770
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B506EA1C;
	Fri, 20 Aug 2021 07:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9833C6E98E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 14:00:56 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id j18so7762291ioj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 07:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T6c3uuIqhGJTSiY34t1mdYv7edPTrnbINRnZGTByZPE=;
 b=BlMEWmipA/cQoLoc7SiiP+A3MSQ66TNqzbkmNBmnpGvskMITjFn/AknohpkpB5Cx5K
 CZJB/KgpjJ8YDW9UClJg5zSSGiQN2ZGYlh1qm6kxQfhZ1Fceo8gNb1WMKwYp6bYJ9Ev4
 sEsHaqfDkM7c+VEPq5CWbYKowz4hdkol7jCFwbx5x4vdubM8Ow6Cy0Noq/+bjr2MNT0o
 HSXFBv6a8AuevGClVSgt0lQ5pJVx8B9YFcYRQ4X36dcLXKD/6fxw46A/4Y5L0v4ueiVo
 UFRKnu2N5wL4JIBvfiGjXjUVlddOIiH8eD8DOIA/4E8uIceRI6DMSOXpqwg8bpLRD/71
 YLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T6c3uuIqhGJTSiY34t1mdYv7edPTrnbINRnZGTByZPE=;
 b=IOF7kl6wQID01rRK0nFEcr2at0PRXNVRh2Agi8KiQ3wJOdHbp0NqdvL4ThX+Hmmc8B
 d7orAL7UJbN8AmMeFXXLfW4QI5ctuptMijcVO1uu82VhnNd6qQJ9uhN5u0gCSL7pb5li
 W9o0eb8MLusw4sCPRVlzsC9iXQn0z0Xvli2OnYFj6M2tkEHNG+B2rds9LfmttEtsTv7t
 EQYftdI+G5P0Q7aKe5rbnZUDzF4654WEgHaZsa/waQRmQgiHI1HpSFQjK/ZGVSr1jKHc
 SvMj2azehSdyEgM5NODqdMAhFArVYkcYD5ahE4sPUyK9gFCOIF8U3BnqtWisdfB4ZPB7
 ALjQ==
X-Gm-Message-State: AOAM533a+YxJ8baeIkTXsbL7NNrEfAag+pjcKixmIe4a384Z6vbMOkiO
 RAt6VTtq04Ch8825tlaXLY8ppYHIvAgCAlIyI9MfXw==
X-Google-Smtp-Source: ABdhPJw66n9J4IMrZVgTxO7APnBV7DuWIAEv3w+5J7Lcm4qG/FVJtex8/Nepg+hMnS2LSgzMkD3z3PWxcRR8LQrpXMs=
X-Received: by 2002:a02:cd2c:: with SMTP id h12mr13065060jaq.84.1629381655653; 
 Thu, 19 Aug 2021 07:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210819092943.719433-1-yangcong5@huaqin.corp-partner.google.com>
 <20210819092943.719433-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210819092943.719433-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 19 Aug 2021 07:00:42 -0700
Message-ID: <CAD=FV=VNLEcPjbUCC7W9Z1TEOud=We+OFdmQGa5Rhwi4TqLcBA@mail.gmail.com>
Subject: Re: [v1 2/2] dt-bindings: drm/panel: boe-tv101wum-nl6: Support
 enabling a 3.3V rail
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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

Hi,

On Thu, Aug 19, 2021 at 2:31 AM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The auo,b101uan08.3 panel (already supported by this driver) has
> a 3.3V rail that needs to be turned on. For previous users of
> this panel this voltage was directly output by pmic. On a new
> user (the not-yet-upstream sc7180-trogdor-mrbland board) we need
> to turn the 3.3V rail on.
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> index 38bc1d1b511e..e45de7a4360e 100644
> --- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> @@ -36,6 +36,9 @@ properties:
>    pp1800-supply:
>      description: core voltage supply
>
> +  pp3300-supply:
> +    description: core voltage supply
> +
>    avdd-supply:
>      description: phandle of the regulator that provides positive voltage
>
> @@ -52,6 +55,7 @@ required:
>    - reg
>    - enable-gpios
>    - pp1800-supply
> +  - pp3300-supply

Please send a v2 _without_ this line. Old device trees that don't
specify the 3.3V rail need to keep working fine and thus it's optional
(not required) for people to include the 3.3 V rail.

(NOTE: in the source code things will work fine without any changes
because the regulator framework will automatically create a "dummy"
regulator for you if one wasn't specified in the device tree).

-Doug
