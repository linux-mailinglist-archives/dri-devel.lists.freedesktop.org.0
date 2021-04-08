Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BCB358264
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638116EAB7;
	Thu,  8 Apr 2021 11:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DAD6EAB7;
 Thu,  8 Apr 2021 11:44:41 +0000 (UTC)
Received: from mail-ot1-f52.google.com ([209.85.210.52]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MpUQm-1lvnYJ2a9E-00prB1; Thu, 08 Apr 2021 13:44:39 +0200
Received: by mail-ot1-f52.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so1961443otr.4; 
 Thu, 08 Apr 2021 04:44:39 -0700 (PDT)
X-Gm-Message-State: AOAM530C8cGVTBKzQYserPVP2DCBmWGeQV+rVHhh59aFYylGnMWdv5Ru
 ZjEZ2ZoyWyn/iodLuBO4aa955pxcd/+ka6s2azQ=
X-Google-Smtp-Source: ABdhPJw/Kt6oueYEiXqyZYSL7pDJ4LuFJYHMs1Y8FL1ZmuGq8xfxN7KNWR6IE58DyzqBWI3T+US+8jsx0JeptqGIBk4=
X-Received: by 2002:a9d:316:: with SMTP id 22mr7135730otv.210.1617882278035;
 Thu, 08 Apr 2021 04:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
 <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
In-Reply-To: <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 13:44:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
Message-ID: <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
X-Provags-ID: V03:K1:80jCu885HDHAazv8IPV6qg0Kxidays+c2L8SD4eKwg+/D5SGXnH
 i6oneiB/eB10mBMqaPzlofy+Qj9ERISbyebPspElbQMt35JusNlBi3OdWYwIA08JUXQHGex
 YfzvUDlW/VKzZjaOqM0N34v2j0uTrjcGOct88v/4BUg7wvm5rshTNI6O81Dn01GLBSIndEi
 BmhsT5oRPHBJXmJBuuFfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AXy44SuBWms=:/Nk9ILPqA475oGSfJ0HkBW
 CappE6Lm3zC23XDOLvR+Z0rk8211CE0rRHOi22n1cuu+KSwfgDJDCIgZyoyKwSb//VsEJeb5W
 IdTHiu/vKoASXa3lTsJpeWT2rc9v/fKwdrY5BrNPVEnPZqHoe/lMvBCtAPNtZPLjg7aTeCRNw
 KMDFo4eH0uzz3TwUkV5uA9e8PDanE8E22KNKEREcCBlFjRWn6XSNAaWLzpd1MELyik9WesNlr
 RFPHwp0TVfyT/GGNY8v8Ad33zM7rV84KivZskD6Qk/9iSJWNpIccd8qjrAf/wCzpyGTBn69tp
 BT75PjMvxGGqvWHF96JfBJVaBlvWHifz4WmoWYWoZw5UEAlLBAL2GgC1SRf2+JCuv3ZNlkcgD
 SFsI561vbAw32hY//MEgU4edPjEyXPLOdDjGerDpYZwvbN7oFONXuh9t2B0rBvv9zMSofA3jz
 oNCpF46Ex6R3fXErAJeVwHUZ/ww3j0RfDiu66xM0O+gGusRHnfePOCGjoau2gK9QGACSlc5t4
 lqkJNxMN0eNdDom70bqz9fF6YBAA18KtnW/YevpH4rneeNRae1Qbp/Z1r69nkYkirwGfpTEkt
 P4XAI3pmQ56IkgUaKJ3iN4aoQ8BM4J3AND
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 8, 2021 at 1:00 PM David Hildenbrand <david@redhat.com> wrote:
> >
> > It is a somewhat awkward way to say "prevent this symbol from
> > being =y if the dependency is =m".
>
> What would be the right thing to do in the case here then to achieve the
> "if DRMA_ASPEED_GFX is enabled, also enable DMA_CMA id possible"?
>
> One approach could be to have for DMA_CMA
>
> default y if DRMA_ASPEED_GFX
>
> but it feels like the wrong way to tackle this.

I'm still not sure what you are trying to achieve. Is the idea only to provide
a useful default for DMA_CMA depending on which drivers are enabled?

This is something you could do using a hidden helper symbol like

config DRMA_ASPEED_GFX
       bool "Aspeed display driver"
       select DRM_WANT_CMA

config DRM_WANT_CMA
       bool
       help
          Select this from any driver that benefits from CMA being enabled

config DMA_CMA
       bool "Use CMA helpers for DRM"
       default DRM_WANT_CMA

         Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
