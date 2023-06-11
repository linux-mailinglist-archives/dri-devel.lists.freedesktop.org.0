Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7083172B13E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jun 2023 11:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D63910E047;
	Sun, 11 Jun 2023 09:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFBE10E047
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 09:51:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DF8361117
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 09:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88F8C433EF
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686477058;
 bh=jgmPc3VFPciiBOwfOr6D2N6SHwM4FCyXZkBC4lU756g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CEC67kSFEDlsGjc6n6f/8gQ3eqDc9NFsolfBJrkv0cTK0C8qWv07Zo57/WfWuaamI
 MGG+g4eNKQDZSqwePnOXkeS2gbzf1lBQ5KOF/vH122LoweJUQx0YNWsbMUEPYrfraa
 RDBQ/heBDfEC7bfhEysEQhxTKCJkD8myZehQg0rBoPhR/IAfN5fb/AseIGQsFWuQfk
 B9q4up8jYrJ6pd6iwSZ3TeJ1iGnZtqpNDODg/haBFKgw4sUj0zqJ1Ijf693OIcNYZV
 ncyl7k3mkiL/HlD8JQH4vcdXTF56wh9rcms/KRD7JUBkD3nmflNmgNB/r5wEsuJVlQ
 9uwvt/+7/bMYA==
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-53fb4ee9ba1so1558438a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 02:50:58 -0700 (PDT)
X-Gm-Message-State: AC+VfDw2nH5+/NUeBexC+viXIAkRO5j36gVthivwWT2Ait55TLOIjvgL
 E9ch6FY4J6fQOZlZRqQ1YsOKZFuouDO6g6p3zJQ=
X-Google-Smtp-Source: ACHHUZ7ZtYX6JFjreNiLVZ0dVifEH4YAGMivDTU1JOT0pyaqDXpnHueK7LrM6KrVv3wtY33XCkIIdlcVYlguwpNyBBo=
X-Received: by 2002:a17:90b:118c:b0:253:6a05:1bce with SMTP id
 gk12-20020a17090b118c00b002536a051bcemr4895092pjb.35.1686477058245; Sun, 11
 Jun 2023 02:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230609120636.3969045-1-arnd@kernel.org>
 <b3a3e2f8-51d8-f8ce-95ce-1180f80cc2d2@habana.ai>
In-Reply-To: <b3a3e2f8-51d8-f8ce-95ce-1180f80cc2d2@habana.ai>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 11 Jun 2023 12:50:31 +0300
X-Gmail-Original-Message-ID: <CAFCwf122kE8sNksXivPA+E=BWzjroKowwqDJrHVMNj-o3oJq0A@mail.gmail.com>
Message-ID: <CAFCwf122kE8sNksXivPA+E=BWzjroKowwqDJrHVMNj-o3oJq0A@mail.gmail.com>
Subject: Re: [PATCH] accel/habanalabs: add more debugfs stub helpers
To: Tomer Tayar <ttayar@habana.ai>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Ohad Sharabi <osharabi@habana.ai>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dafna Hirschfeld <dhirschfeld@habana.ai>, Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 9, 2023 at 4:37=E2=80=AFPM Tomer Tayar <ttayar@habana.ai> wrote=
:
>
> On 09/06/2023 15:06, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Two functions got added with normal prototypes for debugfs, but not
> > alternative when building without it:
> >
> > drivers/accel/habanalabs/common/device.c: In function 'hl_device_init':
> > drivers/accel/habanalabs/common/device.c:2177:14: error: implicit decla=
ration of function 'hl_debugfs_device_init'; did you mean 'hl_debugfs_init'=
? [-Werror=3Dimplicit-function-declaration]
> > drivers/accel/habanalabs/common/device.c:2305:9: error: implicit declar=
ation of function 'hl_debugfs_device_fini'; did you mean 'hl_debugfs_remove=
_file'? [-Werror=3Dimplicit-function-declaration]
> >
> > Add stubs for these as well.
> >
> > Fixes: 553311fc7b76e ("accel/habanalabs: expose debugfs files later")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks,
> Reviewed-by: Tomer Tayar <ttayar@habana.ai>

Thanks,
Applied to -fixes.
Oded
>
> > ---
> >   drivers/accel/habanalabs/common/habanalabs.h | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/acc=
el/habanalabs/common/habanalabs.h
> > index d92ba2e30e310..2f027d5a82064 100644
> > --- a/drivers/accel/habanalabs/common/habanalabs.h
> > +++ b/drivers/accel/habanalabs/common/habanalabs.h
> > @@ -3980,6 +3980,15 @@ static inline void hl_debugfs_fini(void)
> >   {
> >   }
> >
> > +static inline int hl_debugfs_device_init(struct hl_device *hdev)
> > +{
> > +     return 0;
> > +}
> > +
> > +static inline void hl_debugfs_device_fini(struct hl_device *hdev)
> > +{
> > +}
> > +
> >   static inline void hl_debugfs_add_device(struct hl_device *hdev)
> >   {
> >   }
>
>
