Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3555A86E4
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 21:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6AB10E080;
	Wed, 31 Aug 2022 19:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E6810E080
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 19:40:17 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id 21so5652694ybl.6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=sOPdRmF0K1JRDB7HzDBS2IrjwMwL3LRAyZ1lJrQO0WI=;
 b=PAfjqsjIgJCWRCdIT4OZIywTyYcWSJWwqQ5azTB2AXrmed1W54jb/q/LNrYaMDb+1o
 4rKdXsLYjr3/viZbSGOsbYMy4yJrRjOf7K65A6LZg2agAD0/xwT8GeRyTk1mtGCGofzC
 Fwd985o6v2F4IWV+uzhO+elLE9gvF9+2QqqmOXVGMc206Y2n5PEL0E6REUgyw6TJpe3r
 JGM4Wr5cS1OW0iR8jG6FojXY3jnRvbhDQMdD4Lf953IczCZBH/FgNbfvBQRSehlax69r
 dy9XwGe5LRpgdaImsFb7iA/ylfTV2YBxEASu1iSsXyn6Stn3XLmrsDM1S2/+WDmn2jWt
 fWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=sOPdRmF0K1JRDB7HzDBS2IrjwMwL3LRAyZ1lJrQO0WI=;
 b=haS9DjmT8dsyhlyEv0ulLqggu8oPdCbYhMs5fHn3x/pJfkjQp5O608YYzacoutpGtR
 zHTWowLg9BOPjTULjVzqTcLjPx1z69tlzzHdEC+hst9GxqRJl4xCxXkKDgWgMaL5UV08
 8n8zWKd7aC9E85PJlL/8vyfoQfq+Y05fdGcv/6gRyEUC7eT59RGinSTtTUm4ygc8KcrW
 NxvmJPXrKZM1mqPrS2MX7+BdcXlYMb0bd+jaqc49zQiXbIXOSVE+eJf4hezYiDOuhymG
 /Y5NIJ8cr6JsaPQTfkFT4hkohwktOQbNiRgpMvnAUuunZchN+1AF5Et6I6oLweymrUjU
 k3HA==
X-Gm-Message-State: ACgBeo3rvwwcU6elHFULEO2As2cDW71MmNZyCJqd0my0kRi93SGhgViu
 euNVm6zTOmtlobbs7Xd41a3AV5lBF3FaGg00t751kQ==
X-Google-Smtp-Source: AA6agR49GWFMNHjNnc4qF9RIGIh7N6FJLlqVu8z47qf9uxdXIVXJ7fgKUgsEStjyxdlWe78OShPfSs4yeaf3/0LoHBk=
X-Received: by 2002:a25:4d1:0:b0:69c:a114:5d3a with SMTP id
 200-20020a2504d1000000b0069ca1145d3amr5647002ybe.201.1661974816436; Wed, 31
 Aug 2022 12:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220831190601.1295129-1-olvaffe@gmail.com>
In-Reply-To: <20220831190601.1295129-1-olvaffe@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 31 Aug 2022 20:38:43 +0100
Message-ID: <CAPj87rOJY752AFXpT4jDwbi6QAVQV_HqokcF62s10t78=4te2g@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: set fb_modifiers_not_supported
To: Chia-I Wu <olvaffe@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008f4bab05e78eaa15"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Shao-Chuan Lee <shaochuan@chromium.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Tomohito Esaki <etom@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000008f4bab05e78eaa15
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Aug 2022 at 20:06, Chia-I Wu <olvaffe@gmail.com> wrote:

> Without this, the drm core advertises LINEAR modifier which is
> incorrect.
>
> Also userspace virgl does not support modifiers.  For example, it causes
> chrome on ozone/drm to fail with "Failed to create scanout buffer".
>
> Fixes: 2af104290da5 ("drm: introduce fb_modifiers_not_supported flag in
> mode_config")
> Suggested-by: Shao-Chuan Lee <shaochuan@chromium.org>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>


 Reviewed-by: Daniel Stone <daniels@collabora.com>

--0000000000008f4bab05e78eaa15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 31 Aug 2022 at 20:06, Chia-I Wu &=
lt;<a href=3D"mailto:olvaffe@gmail.com">olvaffe@gmail.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Without this, the drm core advertises LINEAR modifier which is<b=
r>
incorrect.<br>
<br>
Also userspace virgl does not support modifiers.=C2=A0 For example, it caus=
es<br>
chrome on ozone/drm to fail with &quot;Failed to create scanout buffer&quot=
;.<br>
<br>
Fixes: 2af104290da5 (&quot;drm: introduce fb_modifiers_not_supported flag i=
n mode_config&quot;)<br>
Suggested-by: Shao-Chuan Lee &lt;<a href=3D"mailto:shaochuan@chromium.org" =
target=3D"_blank">shaochuan@chromium.org</a>&gt;<br>
Signed-off-by: Chia-I Wu &lt;<a href=3D"mailto:olvaffe@gmail.com" target=3D=
"_blank">olvaffe@gmail.com</a>&gt;</blockquote><div><br></div><div>=C2=A0Re=
viewed-by: Daniel Stone &lt;<a href=3D"mailto:daniels@collabora.com">daniel=
s@collabora.com</a>&gt;=C2=A0</div></div></div>

--0000000000008f4bab05e78eaa15--
