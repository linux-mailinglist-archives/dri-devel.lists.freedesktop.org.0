Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C6623B729
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 10:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3F36E44F;
	Tue,  4 Aug 2020 08:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87506E44F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596531543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v/OA7oaXVkEUj7APchqTq/vQ2frCzf9BUgWE20VzfRE=;
 b=bIred/9Gk8r94yjfENiShbt2mpjG53xUWsl2PPokuvZqd3dY7pHvOd2/UnKVVVL0qEB/uo
 DKkida0rVu7qPqI9DKk21SHfJVY/yYo6ZFCNJ6kbQzMPMqGfHoWzP26IrnT4r4Zhjyrd87
 zkC4QRUTcKwRcsnFy4B9PIDMRU4m8Fc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-QvQurKtkMw6oqsk0Khohlw-1; Tue, 04 Aug 2020 04:58:58 -0400
X-MC-Unique: QvQurKtkMw6oqsk0Khohlw-1
Received: by mail-qv1-f72.google.com with SMTP id r12so4036573qvx.20
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 01:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v/OA7oaXVkEUj7APchqTq/vQ2frCzf9BUgWE20VzfRE=;
 b=XexbfvvvnoOhxRRO8VEbPWKXnfx9emoSnHIlrvG54yM7KQfI+GqoZ6b0Z+26exUZhP
 bMAQ42nt/ipF9ivsYCJwdCe7Uc3hMvX+PAU3WNeg6p4iCIF3tKC1MBQc1h7T1cCnwAsX
 4gnHXMdashJjOImqA4Z5Mketyoy1jptDBxEUGUHocz1cKqzeylvX9OTf2qQqsVWmVaaV
 i/YyEvLelgLMHc0ZvPXMCyInhsGuEZ6QQqT+40HoKUlfNMiY1WgCV8ku2wRC+44/k0E1
 kjP0wx80yJEy1a9wxUtkOWv+RVQiWWkGIS5d9ZrxvEY7sHx59b61rerpvaGjaQZdRQy9
 L6MQ==
X-Gm-Message-State: AOAM531wcsNNsNbvbFTaCAJGGd6IiSn4wY/WYtdFzdVPorVop3hglm94
 cqLMOIu7FfQ3Jkkezvrhzx7W2z2oYICtgE2L1zJwanZS4gke2L0LmQS8yDAfoTrWE2LVKX+hohB
 MFRTvPHWAjS/o4oDOZOrUUo5WlFOsufq9xfG6ZqgtLDt0
X-Received: by 2002:a37:bdc4:: with SMTP id
 n187mr20515630qkf.192.1596531538216; 
 Tue, 04 Aug 2020 01:58:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy15WJOGmuudQjshZjN9EmiO1419tqcOmtObvWk7Ol8fkY5m8zFRr8hprwCkCIB+LmP4JykPu6U39DlI0oOxVQ=
X-Received: by 2002:a37:bdc4:: with SMTP id
 n187mr20515618qkf.192.1596531537952; 
 Tue, 04 Aug 2020 01:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <20200701075719.p7h5zypdtlhqxtgv@box> <20200701075902.hhmaskxtjsm4bcx7@box>
 <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
 <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
 <5ffa32db-4383-80f6-c0cf-a9bb12e729aa@nvidia.com>
 <a3d331e9-d17e-9135-68c7-8e3e10df184d@nvidia.com>
 <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
 <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
 <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
In-Reply-To: <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 4 Aug 2020 10:58:47 +0200
Message-ID: <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: James Jones <jajones@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi James,

I don't know if you knew, but on the Jetson nano we had the issue for
quite some time, that GLX/EGL through mesa on X was broken due to some
fix in mesa related to modifiers.

And I was wondering if the overall state just caused the issue we saw
here and wanted to know what branches/patches I needed for the various
projects to see if the work you have been doing since the last
upstream nouveau regression would be of any help here?

Mind pointing me towards everything I'd need to check that?

I'd really like to fix this, but didn't have the time to investigate
what the core problem here was, but I think it's very likely that a
fixed/improved modifier support could actually fix it as well.
Alternately I'd like to move to kmsro in mesa as this fixes it as
well, but that could just be by coincidence and would break other
devices..

Thanks

On Tue, Jul 14, 2020 at 4:32 PM James Jones <jajones@nvidia.com> wrote:
>
> Still testing.  I'll get a Sign-off version out this week unless I find
> a problem.
>
> Thanks,
> -James
>
> On 7/12/20 6:37 PM, Dave Airlie wrote:
> > How are we going with a fix for this regression I can commit?
> >
> > Dave.
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
