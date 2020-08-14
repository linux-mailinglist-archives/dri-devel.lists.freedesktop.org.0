Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E353244B02
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 15:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AC36EB5F;
	Fri, 14 Aug 2020 13:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47B96EB5F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 13:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597413573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Zj+Zbl8uG0IkxzvkA3VLvAFmCY522+VIKTNpOs2VnE=;
 b=fOv8iCgCSCD+LGsGJD1Zqj1Hmw0ilvIih9Eefh8q1whZWfM/lSDfo4kMc0JxvsTWt8kGI/
 qCSWitcVKhS1i0VeuB0CMVU08ISr+jKpFXINXF8ww2hMWoZ+vF5q2x9GgQbupemOI2BdLo
 +28dWn1Kw4ls2ivE6eK51soCAniuMcM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-MGyxuuW7NEe3-rLiTlqv8Q-1; Fri, 14 Aug 2020 09:59:29 -0400
X-MC-Unique: MGyxuuW7NEe3-rLiTlqv8Q-1
Received: by mail-qt1-f200.google.com with SMTP id e14so7125000qtm.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 06:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Zj+Zbl8uG0IkxzvkA3VLvAFmCY522+VIKTNpOs2VnE=;
 b=DakuvgG+RTw33/cHFt7j06pV/avkP0C+CqgokXYyu3+h9svoRTiyzRSFD7VEUFB2rU
 IplJNmRUTNxGHOqbGwMeSe7+kk5LMPBrXWbpCs1sKXb3aDlp1pAukAH4VwGDHtXTM1ps
 QZz34QRXQ/ZWf6gEcphF8+BVX30KjZ6gWDSxMO+PcC/Bvd7fOWU9ge1ubmYV1YcenGhI
 2j0plWyi+WIVLHI4h6Ow0xGIGnd6JV4lZkVvpLYgrq63DIq+8Dfk7J2CrIVZHzAcIjft
 0o9jUXqOiyeAt+kV+QCaBOlV07ddLNvKpE23Ij5SB6rmiOW1DUWBqqLkGIXz8DTkWIqI
 K/RA==
X-Gm-Message-State: AOAM532PHxqYaMZO2k6yoB+OgItmqegX24lODSStUWzLWLAdKw6nto4I
 /u0WLai7iqRsXScfv9lOcqNeoikqAif9+zzrg4amzbuUDA5MDp1IdVgpijIbS7QM3uwbpExqp2T
 12rgQx6uM+S/ns9TyNc8kg2ORpfhKdS7hM6xZMGnyX85U
X-Received: by 2002:aed:24f2:: with SMTP id u47mr2116416qtc.137.1597413569328; 
 Fri, 14 Aug 2020 06:59:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSABxad6AAzOcmrnQIfzWJBGM956ZK0ws2SeQP5/stZ+jamaX776jK0i+WgyK48plqPsz7Enrc+B0CPzLY8Z0=
X-Received: by 2002:aed:24f2:: with SMTP id u47mr2116399qtc.137.1597413569092; 
 Fri, 14 Aug 2020 06:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
 <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
 <CACO55tsZAh4aThBSqiQJ5o6jCi+6vcfXDEfCueyBmOK62ZsW5Q@mail.gmail.com>
 <20200814135725.GC556087@ulmo>
In-Reply-To: <20200814135725.GC556087@ulmo>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 14 Aug 2020 15:59:16 +0200
Message-ID: <CACO55ts=LdniSVTEy6opRhAj_vsH0czjJrwy4ExpiWMnRRp3uA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Thierry Reding <thierry.reding@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.001
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 3:57 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Aug 13, 2020 at 07:48:39PM +0200, Karol Herbst wrote:
> > On Thu, Aug 13, 2020 at 7:45 PM James Jones <jajones@nvidia.com> wrote:
> > >
> > > I'll defer to Thierry, but I think that may be by design.  Tegra format
> > > modifiers were added to get things like this working in the first place,
> > > right?  It's not a regression, is it?
> > >
> >
> > That would be slightly annoying as this would mean by design it's
> > broken by default :/ Also, we have no Xorg release supporting
> > modifiers anyway and it does seem to work with X 1.20.8 (which doesn't
> > enable modifier support). And I talked with Jonas (working on mutter)
> > about it and there were no plans to turn on modifier support by
> > default at this point.
>
> I thought you said earlier that 1.20.8 didn't work and was hitting the
> assertion?
>

uhm, I forgot to mention that it works with the patch I wrote:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6300

> Thierry

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
