Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E075AC21
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DBE10E0CF;
	Thu, 20 Jul 2023 10:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E298210E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:37:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B11A619F2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B799C433C9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689849439;
 bh=MmVgALAsrUuP5aBOhx/PxrX0BNHFsIr0eTeay0SopD0=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=EdRlFdjT2twhQBr1mJAIzPf9VCSiGHpkamkipuBVS+YKV2rAaYauY/Cb7iKvdWHIv
 TSKyxPwzlL9W0LaQelhKgbT598J/slaio0aKO74ckolFh+fyBxGmoY8pohngFvDwJf
 74RfzMUZaZI/ylTd9DpolA/aGd1qjDyilV57j0m/ITC45uJ7L/V9Q0nY7VCq1kCg/Q
 Jbl/TakdpntNDif/Xp2sp9QZYoxdEO0yFA4pIA3Aczjl8OGqVituI87h6pLvKBqE3P
 sW9n+wHU5YELmcI707+20MHMK0MkcFTAXKc1owO70rhktC0sUaJsKyAzBH31dAeU48
 2QCbEyvyy19iw==
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-76ad842d12fso22304285a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 03:37:19 -0700 (PDT)
X-Gm-Message-State: ABy/qLZxpm2Gt/H6A0MAy+FOYxMaXjUGgdH46z79T6XBdYJAVMLi6j4Q
 m3hddAQB9382BkPxobz+/O+E9Ue54ZR6F/NaCQE=
X-Google-Smtp-Source: APBJJlEYBeq/Mu01KFZdQ/y3x0gmVFb0aDhDwDR3iAHMSUaMpDxe+YKDLq2CHNUkbxa8fFK/LgwCxGjJjRkFvWrGizA=
X-Received: by 2002:a05:620a:3942:b0:768:b699:1746 with SMTP id
 qs2-20020a05620a394200b00768b6991746mr3263095qkn.51.1689849438589; Thu, 20
 Jul 2023 03:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230609120636.3969045-1-arnd@kernel.org>
 <b3a3e2f8-51d8-f8ce-95ce-1180f80cc2d2@habana.ai>
 <CAFCwf122kE8sNksXivPA+E=BWzjroKowwqDJrHVMNj-o3oJq0A@mail.gmail.com>
 <ZLkMjL8Aebipv4QR@phenom.ffwll.local>
In-Reply-To: <ZLkMjL8Aebipv4QR@phenom.ffwll.local>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 20 Jul 2023 13:36:52 +0300
X-Gmail-Original-Message-ID: <CAFCwf12Mot6LmoKF=5okXokKWRanCoxqRPbJV34EwL8__bcHfA@mail.gmail.com>
Message-ID: <CAFCwf12Mot6LmoKF=5okXokKWRanCoxqRPbJV34EwL8__bcHfA@mail.gmail.com>
Subject: Re: [PATCH] accel/habanalabs: add more debugfs stub helpers
To: Oded Gabbay <ogabbay@kernel.org>, Tomer Tayar <ttayar@habana.ai>, 
 Arnd Bergmann <arnd@kernel.org>, Ohad Sharabi <osharabi@habana.ai>,
 Arnd Bergmann <arnd@arndb.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dafna Hirschfeld <dhirschfeld@habana.ai>, Ofir Bitton <obitton@habana.ai>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 1:29=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Sun, Jun 11, 2023 at 12:50:31PM +0300, Oded Gabbay wrote:
> > On Fri, Jun 9, 2023 at 4:37=E2=80=AFPM Tomer Tayar <ttayar@habana.ai> w=
rote:
> > >
> > > On 09/06/2023 15:06, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > Two functions got added with normal prototypes for debugfs, but not
> > > > alternative when building without it:
> > > >
> > > > drivers/accel/habanalabs/common/device.c: In function 'hl_device_in=
it':
> > > > drivers/accel/habanalabs/common/device.c:2177:14: error: implicit d=
eclaration of function 'hl_debugfs_device_init'; did you mean 'hl_debugfs_i=
nit'? [-Werror=3Dimplicit-function-declaration]
> > > > drivers/accel/habanalabs/common/device.c:2305:9: error: implicit de=
claration of function 'hl_debugfs_device_fini'; did you mean 'hl_debugfs_re=
move_file'? [-Werror=3Dimplicit-function-declaration]
> > > >
> > > > Add stubs for these as well.
> > > >
> > > > Fixes: 553311fc7b76e ("accel/habanalabs: expose debugfs files later=
")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Thanks,
> > > Reviewed-by: Tomer Tayar <ttayar@habana.ai>
> >
> > Thanks,
> > Applied to -fixes.
>
> As requested applied to drm-fixes, hopeful for the next one your drm-misc
> account issue is fixed.
> -Daniel

Thanks Daniel for the help.
I also hope it will be fixed :)
Oded

>
> > Oded
> > >
> > > > ---
> > > >   drivers/accel/habanalabs/common/habanalabs.h | 9 +++++++++
> > > >   1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers=
/accel/habanalabs/common/habanalabs.h
> > > > index d92ba2e30e310..2f027d5a82064 100644
> > > > --- a/drivers/accel/habanalabs/common/habanalabs.h
> > > > +++ b/drivers/accel/habanalabs/common/habanalabs.h
> > > > @@ -3980,6 +3980,15 @@ static inline void hl_debugfs_fini(void)
> > > >   {
> > > >   }
> > > >
> > > > +static inline int hl_debugfs_device_init(struct hl_device *hdev)
> > > > +{
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static inline void hl_debugfs_device_fini(struct hl_device *hdev)
> > > > +{
> > > > +}
> > > > +
> > > >   static inline void hl_debugfs_add_device(struct hl_device *hdev)
> > > >   {
> > > >   }
> > >
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
