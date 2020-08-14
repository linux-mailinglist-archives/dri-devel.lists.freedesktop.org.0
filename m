Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBBD244B51
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 16:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAAB6EB6F;
	Fri, 14 Aug 2020 14:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8B86EB6F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597416300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpHDO/agRuieLZsjtfHt43xFmb6MjIQGVY/cb7FeiUA=;
 b=OoVeqbbmZIH3hbdjNXxvsQ83EHCzPYIIkGFBVcsYPSm0zjvIwBDuh5faaC4F3Q5s/cXweq
 ZlnAeYAdgOKOT5JaP8iC6qUuhQtVmRW7ndZNYVF0kczrsDJcG9Awb67sikwqYPtSVk7Wub
 7I/m4bni/VHqRdy2JCiGzEOGk6lyABk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-gx_vmWYOOVyCAhlGsRyJRg-1; Fri, 14 Aug 2020 10:44:56 -0400
X-MC-Unique: gx_vmWYOOVyCAhlGsRyJRg-1
Received: by mail-qk1-f197.google.com with SMTP id z1so6215425qkg.23
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 07:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qpHDO/agRuieLZsjtfHt43xFmb6MjIQGVY/cb7FeiUA=;
 b=GfwotN5Yce45AeDi4GJL1xK5qdyEyDNHDd/J0MShpn9wBrwlgFgbL+aQm4PQ3NtTfW
 uNfBTEIDcGrG0/+QR1qcipd1+JRuENgHhWPQsEmdv0gCy7akjiM2oblGesfc/yHsDogc
 XVbwZEKIGrg2ItlfArUFYXKadqY84qwJLU1qbbQRrbDdRd+agwosKN1/AFQv9MuMztjE
 rz39Qa5Y5FLctHA3HCTrehqj0yuQ108pGVAx0at7Bd84gWHnLF6vTBlJl3YPj1eXDa5x
 YnXFIHoB/TDVikESG89OKoBsRlSsVPshyLl0zGKi11gBaShst5AXXUxx4nr1J4VrNfhK
 Mo8w==
X-Gm-Message-State: AOAM5310zlfs/mBTVldGpWFIrVTD3PpeIexk0/mi9yhtdyaNJvdycZvc
 YWwrYj2GCfZkxGZYNpLZRgXqj0ljDiK1FQdezhoBJYfrt/CbBjFvYgxdvJsiIJNKzIWCv1/fWT3
 KiHvD8NgqIDpa+AteQsdApq+2Hg4N/BmgrCCaX2NbPZ3I
X-Received: by 2002:ac8:4cc2:: with SMTP id l2mr2299419qtv.130.1597416296337; 
 Fri, 14 Aug 2020 07:44:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZjPKVqN0SYtH4kugSGszzZu6iRRhkMvOQlcXphGD3R4QZan2ti3oREPGiAmC9c3ZCPxPbtd1ZHdyw991gNOY=
X-Received: by 2002:ac8:4cc2:: with SMTP id l2mr2299400qtv.130.1597416296073; 
 Fri, 14 Aug 2020 07:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
 <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
 <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
 <20200814140527.GD556087@ulmo>
In-Reply-To: <20200814140527.GD556087@ulmo>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 14 Aug 2020 16:44:43 +0200
Message-ID: <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Thierry Reding <thierry.reding@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.002
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

On Fri, Aug 14, 2020 at 4:05 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Aug 13, 2020 at 10:45:34AM -0700, James Jones wrote:
> > I'll defer to Thierry, but I think that may be by design.  Tegra format
> > modifiers were added to get things like this working in the first place,
> > right?  It's not a regression, is it?
>
> I recall that things used to work with or without modifiers at some
> point. That was basically the point of the "pitch-linear by default"
> patch, see:
>
>     https://gitlab.freedesktop.org/mesa/mesa/-/commit/9603d81df05105857b676f20dff964ef3ab0ecff
>
> If we don't force pitch-linear for cases where we don't have modifiers,
> there's no way we can properly display these as framebuffers because we
> lack the modifier information at the kernel level.
>

I suspect that's related to
https://gitlab.freedesktop.org/mesa/mesa/commit/c56fe4118a2dd991ff1b2a532c0f234eddd435e9

> Thierry

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
