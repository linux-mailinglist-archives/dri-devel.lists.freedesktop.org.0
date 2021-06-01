Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9C0396DEA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 09:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17E76E841;
	Tue,  1 Jun 2021 07:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1470F6E243
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 07:28:33 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id v22so14619019oic.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 00:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7YWxZ4LYPadaEaLleuE6m94kneRRJG7Efk68kZp5Wpg=;
 b=JOavtG1PeB2XpJQM7EqfiqZBnFczKs7ZMLjCzGuXWiP4G73KYOxA5pnuBuBHxMRzk2
 eMkGgPvdwbwCK2oywXXElt87UMKnXRclo9pQRykfSUpqTzU5AjfnZ2xb0sZ5ieeisnWm
 MaNLy+Jjqd67rbHTh2yHMMvWDXBN/AAsLoaF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7YWxZ4LYPadaEaLleuE6m94kneRRJG7Efk68kZp5Wpg=;
 b=YJs7J+v+DCysg3Ypju77M4NO3TY1RV84EFXMBFe9eUd9Fr3nlIQEoJTpUf9esFvb4Z
 gB4xfp5nvx4JHFcmhWSq+T2tFbzGrrt5jurNNCDh3OkDJ0K9i4kWVgVfWTIp6AgOKTtC
 rGX7Tmfi9qgXkzl0En5h3Yn45ey7PLVH5ZKzwkxFCciU+bXWbFhOvLyXT9iEKc3b/z25
 3EWJJ4FtLdXgaVlHTG5Jel9kwJIY8NkpamMuzPiNSWOFpyoacxuS+PlBDnQTLICFNbyq
 XEV4PSceP5dHRnNGmLdFiLFMVskolIiVnXrca0m4M7mB8Ke/l7EFPuPAi6W4RJ4ePMQx
 0B3w==
X-Gm-Message-State: AOAM530Z4RrNMZ46aWCmFs+4KEGeliWPUXJdrEIn5LSni0B8oPKciFUX
 ZeizpakEhUGhGmgQrKhwYD7VnbbYnJQ/MwpERhCCeQ==
X-Google-Smtp-Source: ABdhPJxnqsP3l7lVMLKZMPPIb17LjqzUQ/8nUsAihHsoC77yCwzqB1NVHuNnS1wDlUEVeIkUMyUMZd+YQhkN8HUjqtM=
X-Received: by 2002:a05:6808:1142:: with SMTP id
 u2mr2072784oiu.101.1622532512233; 
 Tue, 01 Jun 2021 00:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210511083139.54002-1-zbigniew.kempczynski@intel.com>
 <YJq5OHIO8ThIiKCz@phenom.ffwll.local>
 <CAPM=9ty84uK-gT3uXZXGOEFno11SBRUh=btXb-B7OYUmnGiRoQ@mail.gmail.com>
 <YK9uwBAvUD+2NYlL@phenom.ffwll.local>
 <CAPM=9txR2ZDpLX1bwzgqq+f9nsiP0feWB+1=tpto2zf_qPKu=Q@mail.gmail.com>
In-Reply-To: <CAPM=9txR2ZDpLX1bwzgqq+f9nsiP0feWB+1=tpto2zf_qPKu=Q@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 1 Jun 2021 09:28:21 +0200
Message-ID: <CAKMK7uEJ7cajUO+TWijyAmGBkvRHaskusRrLJLiOVYSJ3xDKug@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add relocation exceptions for two
 other platforms
To: Dave Airlie <airlied@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 1, 2021 at 9:19 AM Dave Airlie <airlied@gmail.com> wrote:
> On Thu, 27 May 2021 at 20:04, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, May 26, 2021 at 10:35:49AM +1000, Dave Airlie wrote:
> > > On Wed, 12 May 2021 at 03:05, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Tue, May 11, 2021 at 10:31:39AM +0200, Zbigniew Kempczy=C5=84ski=
 wrote:
> > > > > We have established previously we stop using relocations starting
> > > > > from gen12 platforms with Tigerlake as an exception. Unfortunatel=
y
> > > > > we need extend transition period and support relocations for two
> > > > > other igfx platforms - Rocketlake and Alderlake.
> > > > >
> > > > > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@in=
tel.com>
> > > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > > > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > >
> > > > So the annoying thing here is that now media-driver is fixed:
> > > >
> > > > https://github.com/intel/media-driver/commit/144020c37770083974bedf=
59902b70b8f444c799
> > > >
> > > > Which means igt is really the only thing left.
> > > >
> > > > Dave, is this still ok for an acked exception, or is this now leani=
ng
> > > > towards "just fix igt"?
> > >
> > > Oh that isn't great is it, I had thought it was the media-driver,
> > > keeping a big uAPI like this open just for the test code seems a bit
> > > silly. I get the tests are testing more than just relocs, but it's a
> > > pretty big interface to leave lying around if we can avoid it.
> >
> > So since we need to do the work anyway for DG1+ what about some interim
> > hack? Currently ADL still has the require_force_probe flag set. We coul=
d
> > re-enable relocations just for ADL, only while this flag is set. This
> > gives us a bunch of wiggle room, unblocks everything else (CI is a bit =
on
> > fire right now due to this and practially unuseable on ADL gem areay) a=
nd
> > we'll still make sure that when ADL is all done we wont expose relocati=
ons
> > just for igt.
> >
> > Thoughts?
>
> I can handle that as a compromise, though I'd not want to block ADL
> getting out of alpha over some IGT that needs porting.

Uh given that EHL/JSL are still in require_force_probe =3D true mode
because of a random igt (and shipping since a while) ... I guess worst
case if it's not sorted in a few months latest we can undo that again.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
