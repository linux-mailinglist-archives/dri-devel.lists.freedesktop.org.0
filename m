Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483377E7D1B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0689B10E0AC;
	Fri, 10 Nov 2023 14:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E8710E0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:44:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40837124e1cso183535e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 06:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699627471; x=1700232271;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=10OEd7QT7TQMRLL1rtLuH43/neHocTKp/HU4MqBMxu0=;
 b=yEhn1fjlNYzNU1f+TzA2wQApQ6ahaMFg+DlRWP+SY64dJnJpAETFD2fCfkIATyRxEB
 wY3/q8nIYsDYzReDLxJtyAghQYuZ5uZmZ62UJPaYRcIdyuWeqVAv6am3DkDNtoJh4dRU
 jgIOTRzzFih+f4U+7ctal7J3OJNQ0OvW/zfjylDvKHXnOncWxQwsATs2b6kZm7S8W6ES
 CuPlYswGM4eqqRWVxyPvYafofgOlWC7ZpW6Mlt2mEmQhqy2Gc6+CAe1jJ/RZjAZapFXr
 /HT1xZ/rXMWWlPu4BVPOXgPOSEVKh3+QqNO+i7EFGhdwjUGDWvDGfMbWq8oWbok3B2ut
 CpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699627471; x=1700232271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=10OEd7QT7TQMRLL1rtLuH43/neHocTKp/HU4MqBMxu0=;
 b=PPID019v/MaCtXXRIRi7kD5dhL6rednUToPPl2dCu05ZkQM5CJDb8Lulq/q4hYa3cY
 3nXAxA77ssadOBoHv/FRep/SDoChnhGv5gkAukvdHtZqX1XtUkosYHTKPSyAf6Xg1uXf
 7wqLknXSYHcE7bQgKpEwaMnVGgVPqzsmkyKtOAMqWJWwmc1mjx4FBxMH+YoTUTpYSeVb
 LqvIzUxtqoYscf//yApyIpaPqoa6Oalk+9rQc1gei/BxddOiMEDacLnipVtB8kMaR5zC
 VICe0FspJ+TYk0Cn0g+cumjbBab1OODmU7ZUCSRRHH+ZfgGV31VwaSCF7Q3dqb2zUNrS
 j4xA==
X-Gm-Message-State: AOJu0YzE3uRWrV7l4ntcQu6lU9KuRg0Z/6C34BixrRClkktM9wKyL6FU
 XhSdtz3ptMkhEaap4DPxyvezJQsQWObNFMT4oETMBQ==
X-Google-Smtp-Source: AGHT+IE5FXYGSgPFXoXtBFZ/aR7LWB3EeBWSPwp3SiMKQVhxi/p83QC6vx+njb0turh9PF6w2RlHWJfsime4QvXZBNg=
X-Received: by 2002:a05:600c:6013:b0:400:c6de:6a20 with SMTP id
 az19-20020a05600c601300b00400c6de6a20mr356475wmb.3.1699627470599; Fri, 10 Nov
 2023 06:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20231109092634.1694066-1-xuxinxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20231109092634.1694066-1-xuxinxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 10 Nov 2023 06:44:14 -0800
Message-ID: <CAD=FV=VxQJFWFaGHD+zpr4dxB85jMQpJiTDAmFZk67CTYNcg=w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: auo,
 b101uan08.3: Fine tune the panel power sequence
To: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 9, 2023 at 1:26=E2=80=AFAM Xuxin Xiong
<xuxinxiong@huaqin.corp-partner.google.com> wrote:
>
> For "auo,b101uan08.3" this panel, it is stipulated in the panel spec that
> MIPI needs to keep the LP11 state before the lcm_reset pin is pulled high=
.
>
> BUG=3Db:309908277
> TEST=3Demerge-kukui chromeos-kernel-5_10

BUG=3D and TEST=3D are not something that should be included in a patch to
the upstream mailing list.


> Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>

Can you add a "Fixes:" tag, too?


> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 +
>  1 file changed, 1 insertion(+)

Once BUG=3D and TEST=3D are removed and a fixes tag is added, this is fine
with me. Please send a v2. Feel free to add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
