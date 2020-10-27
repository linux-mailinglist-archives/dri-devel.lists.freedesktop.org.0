Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0129AB3D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 12:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754346E0CD;
	Tue, 27 Oct 2020 11:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFC96E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 11:53:52 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id h196so994091ybg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 04:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hnKwpVswYLVqzewBr97E5OQTzvwGSxL8/ltDolpPU9Y=;
 b=dI71zb0UmdzL/B+q1RdSJ8KkKEJ8m4cR+wPDwHQVORZyMZGEDe38s7fso5whqmEsdD
 365QBCoJLwuyPg0WpBK5EvVFzcXMRyHgEtUcHuiYrT+SBsSmw6exp7ta2xuyjMAtu9pw
 spaXlEt2R/bIWY1hWD120AZ+6jqbxtok83KuZja7zKxeqagh3nWaAkUqnmeNfy+d7it8
 9TNqWxUorsYSFZPNrQL7vSWA3AogI2dSDjGK/oeuY8xDusO1MuvZYQ6gHCl5VH09GL3M
 WFQ0+8gbpzp9cZXg2ruxNnQIeCTqvUdW9uqo5yoN+IoL67477UCIi0/aOMYo2SLZ9Nq/
 cxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hnKwpVswYLVqzewBr97E5OQTzvwGSxL8/ltDolpPU9Y=;
 b=QALld0XEiyoSiUq60yBUkTWX8vZArCuxUReN4t7biBwsok4uuaTOTgd0ZwVUbH2qi7
 YUC4hTPd/0RIAdQHEwy5gnzYiEQS1j/TchMBu1ArfEvEMcYMWZW0KQjiexf2VjMWoztP
 DugKU69k8Qbl+c96N4nX3Cuqv7bPRutQHkuz8xLk57EFRFf22YYL/1fgPw7pI2bZUVuB
 oe5RhoAlBxe4QD3emfL15GveFsp4pT0WzCDYLrG3C1KuN+V92qC09nhYZH8PiO+NveZ9
 Kbuv0InW2ITK5nJEDAeX5JMYpznjIaHw2igkAO6IKOybMr+cLijfMrjxkhpKx4Diyti1
 FL2w==
X-Gm-Message-State: AOAM532qrCCzTkFE0oJMHFDZ0HiJTeVE0zyq/c8E2ZQE401sTc3idkFZ
 O0E4hmAOG2bf9g8DQ3zpdc5myN89qJwbhziWInN6Wgj9w+A=
X-Google-Smtp-Source: ABdhPJy0GMztsPVPpTApPeNXwAXCDkmB82h1jBSV9loUkjCm8bLoKtVyJDRHOOkhS3RpTMPSJsYn2pOj9uIDKRfkZ4w=
X-Received: by 2002:a25:81d0:: with SMTP id n16mr2545067ybm.140.1603799631221; 
 Tue, 27 Oct 2020 04:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <9faa1070-d46e-5340-f6a2-5826614f306b@gmail.com>
 <CAGPDPzA3+NFO5meR-YHByaRc+unQvPOU-2sjGkpBEkwcdsJwWQ@mail.gmail.com>
 <CADnq5_OfGqShN+4hzK75UKj7OiBrYgXbXE_iFSCTV_bJUyKk-Q@mail.gmail.com>
In-Reply-To: <CADnq5_OfGqShN+4hzK75UKj7OiBrYgXbXE_iFSCTV_bJUyKk-Q@mail.gmail.com>
From: Sandeep <sandy.8925@gmail.com>
Date: Tue, 27 Oct 2020 17:23:40 +0530
Message-ID: <CAGPDPzBufXbfv=o0hJo=DsH=0GFtH+Anct0hsbH=u7nnz5_rvQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/radeon: Add new callback that exposes vddc
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Oct 2020 at 23:53, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> I don't see them on the mailing list.  Are you sure they went out?
>
> Alex

The original email in this chain is the v2, sent in the correct form.

>
> On Sat, Oct 24, 2020 at 1:47 PM Sandeep <sandy.8925@gmail.com> wrote:
> >
> > Hello,
> >
> > I've resent the patches in the correct format. Please review.
> >
> > - Sandeep
> >
> > On Fri, 9 Oct 2020 at 13:14, Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
> > >
> > > This patch adds a callback for reporting vddc, to the dpm field of the radeon_asic structure.
> > >
> > > Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
> > >
> > > ---
> > >  drivers/gpu/drm/radeon/radeon.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> > > index cc4f58d16589..85a1cafdf303 100644
> > > --- a/drivers/gpu/drm/radeon/radeon.h
> > > +++ b/drivers/gpu/drm/radeon/radeon.h
> > > @@ -1992,6 +1992,7 @@ struct radeon_asic {
> > >                 int (*get_fan_speed_percent)(struct radeon_device *rdev, u32 *speed);
> > >                 u32 (*get_current_sclk)(struct radeon_device *rdev);
> > >                 u32 (*get_current_mclk)(struct radeon_device *rdev);
> > > +               u16 (*get_current_vddc)(struct radeon_device *rdev);
> > >         } dpm;
> > >         /* pageflipping */
> > >         struct {
> > > --
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
