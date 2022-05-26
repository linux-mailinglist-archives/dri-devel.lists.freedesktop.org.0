Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA084534BCF
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 10:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292BA10F02F;
	Thu, 26 May 2022 08:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A4110F02F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 08:32:45 +0000 (UTC)
Received: from mail-yw1-f179.google.com ([209.85.128.179]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1McYTD-1nHVFX41uP-00cy1D; Thu, 26 May 2022 10:32:43 +0200
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-3003cb4e064so8041797b3.3; 
 Thu, 26 May 2022 01:32:42 -0700 (PDT)
X-Gm-Message-State: AOAM531N/HudEZGorq3fKAydNowP3ip64qB7x/YEfHBE1lVlHXbVwT9y
 5RzUumB1vmL99K7ft9JLIubLX5tgcsLFW5IO9+Y=
X-Google-Smtp-Source: ABdhPJzd1Td84PUKl1aMompoBi/CI7Ij8UKcDh3J33F17cieCWlpkBhuvBB90C07npKSjm4gZ1dqj3OUo1L9/csGNzA=
X-Received: by 2002:a81:488c:0:b0:302:549f:ffbc with SMTP id
 v134-20020a81488c000000b00302549fffbcmr1085051ywa.495.1653553961173; Thu, 26
 May 2022 01:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
In-Reply-To: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 26 May 2022 10:32:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Message-ID: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
To: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:werSax4GIB20B3ktO8sePSa4Uwa9NWb+S1H6SkEJK5Yjs/WCrTH
 jMawQQYUm+Ms+ByahftALaGUx+GDqr8w8MTnGZXFjSPqexH7g/KY8oO4ZJZJAuqcmXEXSJ2
 0yXFST+jUfjXfzMC4bq9CS4BBNfSVywD3i7tP7y80FFtYv8yNtCPh174/6dA6mKBt2l+GOI
 YL/w7fEXvcSFhwbsEl1hw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LpHmOAiuIMs=:1go0z4Tzt2Rvy3DpkBylZ0
 5xKXNCVnnZWhOdxKxdSCi7QWgbEurvfjfPgMHLiFlqGNvjtfRMpU5QgbdozPJwoRQetXgXTNC
 iOS1s+AQH9pq6AP9wz4ToUhHisY62Kz0d1qy5TSJvBb7UXZxE6LxCPXDMN6JEMZsD55Zqh+NI
 MxrNITDLLi8GDMmsmBcUuiV4YrAjN/I2aiJLZPLV+fIm7gi9dlimyP7hGX0OfyZJD34ZKMVXb
 JK9RtRRBZke71RnVRoXOaJKBJR1x7NbcR3evI0y/mywzKxKl/a1Dg68UIq9T0TOG1OLEK/Wby
 LA5f/JAl5sGcDZayKqQ85hLDK2VUcZeuOCFDAEzZ8jt4DkmlIg+o5pZFF0KZJqGeQOoabBSvl
 UAbwysv6ta94HMZAH0jsaKI92cN9dT/+7fp75uCAtCxRC4qO05crLUdP8ODuZnlduBdYMaiZ4
 aoMAMbL8anCKmuWSNNIm0/o6U9LVR/uoOYRB/4nzenXJ7DzMAGAw66o0zG6ldHiFXOO5a1t+D
 hhwEEUXTVOltgAcXcm3h1jvDxi0VK2fduilzef8ZlYzh1ntLjGdcpJfZPWb9VbEKSJXEF5ulE
 ODGDNcY1oG6EgRI0zJjYSM1/lU3wagbu2605Uf4/q19t0g3y4gcQjK5qI9OaDoiNYlaBnDPf6
 rgBggBRjP7AldaqIK8gfLm7aJr94V4QybbaehChoBpXuDHy2gs2sGEv3DXNaPqf+fdJvTiz+w
 6sp3qsByI3SVtj3HRN3TYBPpN40DbPot7plkBzmtkWmDbhUJUmVuhvIRSfoPvHCSHcmVsi/vQ
 41RtljmWPxBB2tmHUCJSMDVtXnq0/0SKdpckH9btJA1m/3p8px1gBBwGPzlG4HmcYDpLKyL0W
 CA/gM0U5IRToF4un0CX0NB1sWkTBxsQccUCkveF04=
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-parport@lists.infradead.org, kvm list <kvm@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 linux-staging@lists.linux.dev, bpf <bpf@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 25, 2022 at 11:35 PM kernel test robot <lkp@intel.com> wrote:
> .__mulsi3.o.cmd: No such file or directory
> Makefile:686: arch/h8300/Makefile: No such file or directory
> Makefile:765: arch/h8300/Makefile: No such file or directory
> arch/Kconfig:10: can't open file "arch/h8300/Kconfig"

Please stop building h8300  after the asm-generic tree is merged, the
architecture is getting removed.

        Arnd
