Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9208312B46D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 13:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1BE6E054;
	Fri, 27 Dec 2019 12:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3664D6E054
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 12:06:48 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id s15so22345801iln.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 04:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WmfgYIlZWxDaZizS0/2PUuLY/qX43M07m582qEI148o=;
 b=X98BOIzumlFPEjdZ9sUuhS3iBBqL1VUK/pjvCrlYXSS/VMjrahfV6GK8V4NLfCKstl
 FcnTl8ezBueGukai4CUwLYopsLt6rhnipVOq02y3UOM+V7ta4pYmlEnbudPT6SoSqQ0Q
 Juv11hh4tpO9NcgZfbm1TSYgDn5hSdsHO8H24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WmfgYIlZWxDaZizS0/2PUuLY/qX43M07m582qEI148o=;
 b=qOi0GJT0TlI4O+qCEgAfrlCSQwLbn7MsXJdxhTgt4htx5FkeLiBLcOxX/ar8DhC/Bj
 PybXGd0ykNom1LcGEMdlvJG0aRjyxhPG6Nz4NYx+hyAx/y98I6Jw+KPpqJJ2qSlYHzua
 Mx31Rdn71QO4zgIb3IF2z+bBaFiyteZty6hjJ4V2uSQCvgnWT4rN1rgrA+MaLgPRhSao
 ZI/avviKgvGj80J96vVgNmFx3KK4bhcSBiHbfRYaKFcLf+xBNWZqBrv5njf65TqDP9zF
 qZ+NHbpOb8SwRo8Jy5qbsJFwl3/3cPtqZVEWUk6O8RHrVu9pNW0JlyYpenMZeX+yuZLW
 3PnQ==
X-Gm-Message-State: APjAAAUFjRyGI+4nUkRMAXGg0jfodmmmL7IESCShrgOAnhlMn3FsjJph
 VNhoKdTldT2ags8NION9FU9b27EaWxaMRzmmkUQGyw==
X-Google-Smtp-Source: APXvYqz0avfFPQ7KqEa1gHijLD//RP3wLx7cUiHD8+e66tZOfTYRzPwEjDOnRq8Z7uRAutkXR/PIyTrnPMOIPxZ6x2s=
X-Received: by 2002:a92:860f:: with SMTP id g15mr42716158ild.297.1577448407609; 
 Fri, 27 Dec 2019 04:06:47 -0800 (PST)
MIME-Version: 1.0
References: <20191222132229.30276-1-jagan@amarulasolutions.com>
 <20191226093952.i2jttp7tr5hie6jl@hendrix.home>
In-Reply-To: <20191226093952.i2jttp7tr5hie6jl@hendrix.home>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 27 Dec 2019 17:36:36 +0530
Message-ID: <CAMty3ZA9VBj6OxaLYE21Qt01nnTYGhsS8c2JHc5esDMeWe0qYw@mail.gmail.com>
Subject: Re: [PATCH v14 0/7] drm/sun4i: Allwinner A64 MIPI-DSI support
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 26, 2019 at 3:08 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Sun, Dec 22, 2019 at 06:52:22PM +0530, Jagan Teki wrote:
> > This is v14 version for Allwinner A64 MIPI-DSI support
> > and here is the previous version set[1]
>
> I applied the patches 1 to 6, and fixed checkpatch warnings in the
> patch 5. Make sure to run it before sending patches.

Looks like I missed this time, sorry but usually I would do. Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
