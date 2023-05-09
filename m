Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E87C6FCA69
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 17:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9706010E397;
	Tue,  9 May 2023 15:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637CE10E113
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 15:42:44 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-3ef34c49cb9so182261cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 08:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683646963; x=1686238963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8fiW2eMPa3JcRn87r8tgH6+Zw6xv+kBmIa1Z3UxaYsE=;
 b=liBfYH3VMjZJNljdRzneVIXYxFCVvNhvCaa9K+zpTNyp3TSvfKZm2kJBKZdtZrhkHg
 Jzu9UQbL7+AMMU8OmlymvReEYlwlWi+hcC+p//agUPD59j6myTKw3isrlNBZ4UZ5hhQE
 66dz8XMYpwnRwahBw1CybEUexL+G77JhdxqKorjS+/gMGredPkW3UzWUdWqpnj77+NJZ
 ian4cHr+/pkGzTHwMSNr0si20dbCuQL58ABSBzdm1tMqqfDtEWkduMk6wZhowpMawwPp
 qL/nJlcXAwOmX1Bz8vH3PTllyMYcHUB2V0eupd+7qcEMs7ZqYQ4PIpl7fkRywe1cHKbP
 VdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683646963; x=1686238963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8fiW2eMPa3JcRn87r8tgH6+Zw6xv+kBmIa1Z3UxaYsE=;
 b=PLJNzbhIZQGXFp139E6vMHdH3Tn5m3QgULH4Cbd715Mqwbb2hjFQCn7htffc4lVPN+
 kO2Q2+5yC/NszzW5Amdpgyylbv6fA70pJftkCUBx5MzvVppaoVUnxqrgFssI8vzq23GD
 8oODteUheJ36bvzTh+ANmn/oiMRRIK+6vcE5GjsYQfiFyiEJr8kia8FxbJlNYFti12tm
 cWVxTCbMNw2Xwa+ruy9dW5WPAhrw92nh+dXd6TZn7Hb6X6WOMRAfggM+kBiIeXc5SOzO
 9L30kfzkLMidVMNBMZYXfeNjZ/r2eRAoSq8Mpe93rk4TcyYuvNEOcbjdIoTSQX7oGz82
 58KQ==
X-Gm-Message-State: AC+VfDw7P+2XYWuh4i9jKkmYcv5mJo+AhWIJo1SSXQM4yIhI6jApph6y
 PVI6cnjfoYLFggWPl7gajbv/9aUDKCDZVL3CJi7/oA==
X-Google-Smtp-Source: ACHHUZ7C7pgU55PCY9BaDVb25aW2mHoo+2xQgp1Pu4YxvFKZXAYbhIAieDk9gBa8KMPxOXLu2jAPL0tYarLvHr5kP50=
X-Received: by 2002:a05:622a:c7:b0:3ef:3083:a437 with SMTP id
 p7-20020a05622a00c700b003ef3083a437mr436622qtw.18.1683646962948; Tue, 09 May
 2023 08:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAHwB_NLBLEUiu__fE9F=j0KFssq7Lxfz8WUnbR0C6yi=zsboJw@mail.gmail.com>
 <20230509025153.1321446-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230509025153.1321446-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 9 May 2023 08:42:30 -0700
Message-ID: <CAD=FV=Xp_OoxJH38skQswjK_AWwJ5P2OmgjnXLog9bAht0CL6A@mail.gmail.com>
Subject: Re: [v2] drm/panel: Modify innolux hj110iz panel inital code
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 8, 2023 at 7:52=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> There is a problem of screen shake on the old panel. So increase the
> panel GOP component pull-down circuit size in hardware, and update the
> initialization code at the same time. The new initialization code mainly
> modifles the following.
>
> a)adjusted for GOP timing. When Display sleep in, raise all GOP signals
> to VGHO and then drop to GND.
> b)Increased the Vertical back Porch and Vertical pulse width, so need to
> update vsync_end and vtotal and CLK in drm_display_mode.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
> v2: Modify commit message
>
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 397 +++++++++++-------
>  1 file changed, 235 insertions(+), 162 deletions(-)

Every time I see the opaque changes to the pile of "DCS_CMD" arrays I
feel obliged to grumble a bit, but as I've said before I guess it's
OK-ish...

Thus, this patch seems fine to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Just to make sure there are no objections, I'll give this ~1 week and
then I'll land it to drm-misc-next.

-Doug
