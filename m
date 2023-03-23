Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2986C652B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 11:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EBC10EA57;
	Thu, 23 Mar 2023 10:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131A410EA57
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:34:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A21CB82038
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0730FC433D2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679567649;
 bh=fJu4buwju+aXou8+VwqF0BZQbX9HcKk4lN1aVLiCobw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NP9BcpC4iG0ZV2MbmZH201WUnV5YSjsNTzxzICfbYcfldnPbkMcSeoWyUZJdclUxs
 Gdyi6fsjL1ZTy0CvRoDbdNswtoqm5CrhVMuRNxe4wIKs+40r102n6rAIfrIIDsVCK7
 fOb+aZd7Ip7FWY90GVQ8dR4RCneXuLQb0FLc1i4u2rP16O5334F23+oJ5Go8UlevtL
 L7CqIvlNFxDuwoDmdYaQstPnNPVRUzdDfJABFD+Eq8z+/N7QjcmwajdurFBQ6Mbq56
 zXDfmmD0NpdKHebsDQZodGxq2z1SwmMVO+kPMS8QlfApKiBGJ12iDUIJIdMPFrSyxe
 DuEUGQTWh5lYQ==
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5447d217bc6so386886837b3.7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 03:34:08 -0700 (PDT)
X-Gm-Message-State: AAQBX9fjPsXYnF0E0Oor6+fcdOXk3fxkzx4F50flhSbRYFeiartYbBiF
 Jtpi2pjaC9HenmjJgISe+SRWVoUJdCMotnGpIkc=
X-Google-Smtp-Source: AKy350YPEjHVSAhmQPCXnKtsgwqbKyg8CBncmUaehuSDRZziR65QgWO4mv97VCOV/F7KkCRmjNdFTCgBA1Z28mbqmKU=
X-Received: by 2002:a81:4505:0:b0:544:5042:324a with SMTP id
 s5-20020a814505000000b005445042324amr1624643ywa.3.1679567647951; Thu, 23 Mar
 2023 03:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230323083553.16864-1-cai.huoqing@linux.dev>
 <20230323102952.GD2130371@linux.intel.com>
In-Reply-To: <20230323102952.GD2130371@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 23 Mar 2023 12:33:41 +0200
X-Gmail-Original-Message-ID: <CAFCwf13Xi+w6OiR=_6Lqu9LPBfpmr-0deLUMkqsXsjXD0iKqNg@mail.gmail.com>
Message-ID: <CAFCwf13Xi+w6OiR=_6Lqu9LPBfpmr-0deLUMkqsXsjXD0iKqNg@mail.gmail.com>
Subject: Re: [PATCH] accel/habanalabs: Remove redundant pci_clear_master
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
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
Cc: Tomer Tayar <ttayar@habana.ai>, Cai Huoqing <cai.huoqing@linux.dev>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 12:29=E2=80=AFPM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Thu, Mar 23, 2023 at 04:35:49PM +0800, Cai Huoqing wrote:
> > Remove pci_clear_master to simplify the code,
> > the bus-mastering is also cleared in do_pci_disable_device,
> > like this:
> > ./drivers/pci/pci.c:2197
> > static void do_pci_disable_device(struct pci_dev *dev)
> > {
> >       u16 pci_command;
> >
> >       pci_read_config_word(dev, PCI_COMMAND, &pci_command);
> >       if (pci_command & PCI_COMMAND_MASTER) {
> >               pci_command &=3D ~PCI_COMMAND_MASTER;
> >               pci_write_config_word(dev, PCI_COMMAND, pci_command);
> >       }
> >
> >       pcibios_disable_device(dev);
> > }.
> > And dev->is_busmaster is set to 0 in pci_disable_device.
> >
> > Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> LGTM
>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>
Applied to -next
Thanks,
Oded
