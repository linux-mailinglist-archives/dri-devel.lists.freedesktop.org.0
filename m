Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9CC620054
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 22:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E45310E4A9;
	Mon,  7 Nov 2022 21:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3FF10E4A9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 21:06:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B381B816A6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 21:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4A0C43144
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 21:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667855161;
 bh=FG+7gA3fo0nBgnUWGCQeGAlAZyW5OFNCbT+NPx+534Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JpohgfVyAR1+t0eosNFa2GRGTW/ULZtWnPLB9HZ4ROca8k1vdcW+0N4uupbl8pN+P
 1KDlG8cXBHfnTDBO0UoenwooMLqZ2jDiV/NQ5KYFbDAHxhdxfpS8BPcQl051fNy9sr
 Y7E9ROyXt/Pa4Vf7DzZf+7/T0MpN4JDqIIA3nuB689+ruPgF+fo+aQhxpLQNaYatFt
 m18e4l6EK0EMaBjtjYPCi22HUvSR0t8tCagZEMNn9U9xckoKmZj/8JkUOmT9ShOZRp
 aEGlH8ZuPpsgYlXzxoHgWRc2gSxgp7ivgguIFw8bayynJO6G5MG/WvnKvaCmhz+mwc
 xhcVROd4Kua2g==
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-3321c2a8d4cso116556107b3.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 13:06:01 -0800 (PST)
X-Gm-Message-State: ACrzQf30B0ZEahNJsfWd2WxLHoW6Bq8SOsAD0WVOhdRVKppOMWMNIPnZ
 1ADRUiVa2lgE+8Hpayy5r+caXdQDyazjCDDjxKQ=
X-Google-Smtp-Source: AMsMyM79s61mlOpK+aqg4QRkCgNPCYjUWTxYdxewoPhDlxrrkRVd1ChmX/dKJmqMS/UXAOUP9xQYEnEByOuJRijTw0k=
X-Received: by 2002:a0d:f445:0:b0:345:89a2:9a8d with SMTP id
 d66-20020a0df445000000b0034589a29a8dmr49016100ywf.107.1667855160878; Mon, 07
 Nov 2022 13:06:00 -0800 (PST)
MIME-Version: 1.0
References: <20221106210225.2065371-1-ogabbay@kernel.org>
 <20221106210225.2065371-2-ogabbay@kernel.org>
 <5fe8e8c0-d28b-3666-e437-10fa0c591ed8@quicinc.com>
In-Reply-To: <5fe8e8c0-d28b-3666-e437-10fa0c591ed8@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 7 Nov 2022 23:05:34 +0200
X-Gmail-Original-Message-ID: <CAFCwf10iNhi7=O_c==0dzyiMVSL05R8bJQ1HPJJo04bwz86e=w@mail.gmail.com>
Message-ID: <CAFCwf10iNhi7=O_c==0dzyiMVSL05R8bJQ1HPJJo04bwz86e=w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] drivers/accel: define kconfig and register a
 new major
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 6:12 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 11/6/2022 2:02 PM, Oded Gabbay wrote:
> > +int __init accel_core_init(void)
> > +{
> > +     int ret;
> > +
> > +     ret = accel_sysfs_init();
> > +     if (ret < 0) {
> > +             DRM_ERROR("Cannot create ACCEL class: %d\n", ret);
> > +             goto error;
> > +     }
> > +
> > +     accel_debugfs_root = debugfs_create_dir("accel", NULL);
> > +
> > +     ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
> > +     if (ret < 0)
> > +             goto error;
>
> We are not jumping over anything here.  Seems like this whole if block
> could just be removed.
correct, will be fixed.
>
> > +
> > +error:
> > +     /* Any cleanup will be done in drm_core_exit() that will call
> > +      * to accel_core_exit()
> > +      */
>
> This doesn't look like the standard multi-line comment style.  Are we
> going to say that the accel subsystem follows net and differs from the
> kernel standard?
I'll change it to the kernel standard.
Thx,
Oded
>
> > +     return ret;
> > +}
