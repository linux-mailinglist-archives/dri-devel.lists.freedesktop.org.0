Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9091DA5E0
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 01:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26336E454;
	Tue, 19 May 2020 23:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7763C6E454
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 23:57:11 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id o35so648172uao.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 16:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+cnvAUQNYKs3VkDpwfWv4fxsRnE6kle3O+DnR6zOBgw=;
 b=Z8E+4hgxDZFv5iqwN2fk0KRlGGfOe6IFqEVD52FGGpQxxQJLL4c+9K2F83y+/FqKTE
 K8vucQ7CqQXNyIROxpw48zQJSiTITikTSzX04jaSBBgSqJ8h/1MBUqLN7V+ChZvuOLRv
 jcdrqslZ58aZC/3PnJ5llUzW7nLIjem9X5Eab8klljok5NfIcs4iex0MYdIXXggEFV7C
 hR2UfoIhmU8IqmAUXfzDJxGmXsDHfBI6QY4Gf3x6/zVVEMUrR1Kad0ZuEFidiC1EFyUL
 RY699UwoxdYDcX0aJ3X3asCs1W1Qe4OTstVtxIm22NoKlJ8zgln6Z2ZoIjAgSGOWERhA
 Hebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+cnvAUQNYKs3VkDpwfWv4fxsRnE6kle3O+DnR6zOBgw=;
 b=BqtesSwPNM3/OetRJXbN3ZWiyGUjUY7KlD/Fi38TGyvGN4vLdjZo2u6oQ+khThCSyh
 bYmsqtMSU1gNgc955+7zFm9HDIfxq+lcGdGhZgqvxHjY15yE7XSuCPyIXBizrx4uIVFy
 eZABl/1ERzKFnzav4z1jmhqxIZKGwKIdZjrF6NXND9fi0LIcVcjusY3rfqrqrOVqWUrh
 oFmdMKLDuerm/dZ2qFz4NrEX+3f4io1M/JvkyVXjhjhwjxWqX4hHOxlopCtXf4ZGImKN
 qA340gNdgq9/QEx5Chs315/Asvvz87jDvPVWsbOB0RGLKyCHV6gUv0lg2ily4cUQUCmV
 fkFQ==
X-Gm-Message-State: AOAM530LK8b7geJAZG+STqLfKoGEn70h4McVfg+6IvfIaQFnNDvv5WC8
 XLOudLIfhxpJdQ+AqtSQBUpGqWr61YcHEo5lAoOlVw==
X-Google-Smtp-Source: ABdhPJwaASbypcchOy5IQX5bTaBIc/eEnp4N+la18WtZ7qHZh8xCseL0Q+G8zCRWwOZbvQEjPrXIwo7kZ2shPv8WqQM=
X-Received: by 2002:ab0:4e0d:: with SMTP id g13mr1652246uah.64.1589932630657; 
 Tue, 19 May 2020 16:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200517193655.3895087-1-emil.l.velikov@gmail.com>
 <20200518111043.GR159988@e110455-lin.cambridge.arm.com>
In-Reply-To: <20200518111043.GR159988@e110455-lin.cambridge.arm.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 20 May 2020 00:54:17 +0100
Message-ID: <CACvgo50zr5WzgwE33Fa=BRc+AuBzg+OjxBTEMaQ5qt1SpW-D_Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/arm: Kconfig annotate drivers as COMPILE_TEST
To: Liviu Dudau <liviu.dudau@arm.com>
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
Cc: Mali DP Maintainers <malidp@foss.arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 May 2020 at 12:10, Liviu Dudau <liviu.dudau@arm.com> wrote:
>
> On Sun, May 17, 2020 at 08:36:53PM +0100, Emil Velikov wrote:
> > Add the COMPILE_TEST conditional, so that people can at least build test
> > the drivers.
> >
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
>
> > Cc: Brian Starkey <brian.starkey@arm.com>
> > Cc: Mali DP Maintainers <malidp@foss.arm.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > ---
> > Please merge through the ARM tree.
>
> We're not using the ARM tree anymore, we push patches through drm-misc.
>
> I'm happy if you want to push the whole series or I can do the 2 patches
> that I've been Cc-ed on.
>
The third patch should be taken care of. So 1/3 + 2/3 need taking care of.
Please do a quick runtime test for 2/3. As you can see I've only compiled it.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
