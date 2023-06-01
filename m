Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10EB71A38E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 18:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A861910E57B;
	Thu,  1 Jun 2023 16:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB38910E57F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 16:00:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F30A86472D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 16:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E0DC4339B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 16:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685635216;
 bh=AIs7fGWywv9lDOS0KsHCfIcGVpeS+FbYut2AZaEeGFk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C/mXYmf/L1k/vIY+9ryH7dc8PQuF1AQrDFZe3/rrEAqFcFytBTKIvVhrAHXt01mZU
 sy1RDxc9tyMc8JfA+oeB+K2J6p9UNhGPlTowtLyQkYslbkilhlIOXHyVjpOyH0DPka
 gobzHMENCaIjBTDjyrmrY045s8yieFsC84NrNgT8+jH7FqTHFE5GMqBCxKEgZQQ6wD
 K91XNLFKfF0JPVmMV6lOIj8g+VFY0fWZEx/rd5QJabfU8qMKjPIf9XPxGP420lEzub
 u4PxGKeFRo0wdV+JKyYE9jSaozPAXI06qr5LfRiIpCXTGYoczmWTgC7N5YY9pHTpwV
 7OeupCrQZbTOQ==
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-ba86ea269e0so1045589276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 09:00:16 -0700 (PDT)
X-Gm-Message-State: AC+VfDyzbP0A6TjwDGrZsTqunE99XsN/zxRScgPk+tIv9pB190oNdOpC
 kv+pAHQhK5pkqtsWIMU83NlFb1xpK7bi+b0H1Fw=
X-Google-Smtp-Source: ACHHUZ78tJoCpZN9s8oZXHyb6VtIe23xu3FjtF26POGYQv5xMvrBiNzAN83uLtOr1FHZCfxOg+karzSLuqkHSxsvZtM=
X-Received: by 2002:a25:d40f:0:b0:ba8:88d4:a4b9 with SMTP id
 m15-20020a25d40f000000b00ba888d4a4b9mr439073ybf.2.1685635215891; Thu, 01 Jun
 2023 09:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230412145206.2483-1-christian.koenig@amd.com>
In-Reply-To: <20230412145206.2483-1-christian.koenig@amd.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 1 Jun 2023 18:59:49 +0300
X-Gmail-Original-Message-ID: <CAFCwf10VBQNaSVsGNb1XKgrs+w-T=bM1p10-7KVfFg8gNaEBag@mail.gmail.com>
Message-ID: <CAFCwf10VBQNaSVsGNb1XKgrs+w-T=bM1p10-7KVfFg8gNaEBag@mail.gmail.com>
Subject: Re: DRM debugfs cleanup take 4
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org, mcanal@igalia.com,
 mwen@igalia.com, stanislaw.gruszka@linux.intel.com, maxime@cerno.tech,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 5:52=E2=80=AFPM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi guys,
>
> took me some tries to get the Intel CI happy with this patch set.
>
> This is the version rebased on drm-misc-next, for a CI run you actually
> need to rebase the last patch to drm-tip. So I'm planning to merge 1-4
> for this cycle and the last one after everything merged together again.
>
> Please review,
> Christian.
>
>
Hi Christian,
Are we on track with this plan ?
I think I didn't see the patches getting merged yet, but perhaps I'm wrong.
We are actually waiting for them to do the move in habanalabs to
/dev/accel nodes, so it will really be helpful if you can merge them
at your earliest convenience.
Thanks,
Oded
