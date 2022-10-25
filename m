Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D24D960D6EB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 00:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF61710E15A;
	Tue, 25 Oct 2022 22:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A4610E15A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 22:18:00 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id j6so5450863qvn.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 15:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sBctOic5Jlqwv7dQ/OcbsCcYwMhW7gNKqj7DG4uh3kk=;
 b=a+L0eQQmLecyw0nknTLcGw/I7RrVyowZfcF3d2y+BIMofaBOYJ4McrsCEwcTEFSYZn
 NfY/oYnV48cHs+3vHUz4V4HRO6IkWdET4AqUgU5X5zETq4MsZGMdWmxaf5kaAWAIebgA
 bG1eqDVPEq34MjLvdkr/Z/33gCuG+t+yd/lGVsNphjS8Muzez6O+5RG4geeg8GXQ91Wv
 981Ug1LrzbF+aPqzZAHo4+z+csuOF90G6c9/HcojFmO/XCq1MkC8MziiJgdWIWsM3Bc+
 iMJkp+HJgDHG2WbkPg5NMRv2Fy3+HrfMJJNx2T9GuczkWqDRCHtnbHZyY9wdw8K++6by
 664g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sBctOic5Jlqwv7dQ/OcbsCcYwMhW7gNKqj7DG4uh3kk=;
 b=FW8alyrVBtrIr7Zo7+PUI6JSuYdhm+do44fBW25NwJmCtOn7R0Q2iAk0HVFboVTa2d
 l48UhyjqaTQ8dpiLnldWokquSslqrS7DQZh4+IvweeQgL1hcjO/CSFI3aei2qHefZSeL
 ve014AxBPapYvS2BygZ4X1B8VbxR9VeVXawAnzxJDNVfRzhttX+YiYOoHBcgzD/GhlPm
 ndr022yF122nqmWnUM4jGi7cb74oIlaOZSPpKR7eOFKSNDY5T39IT91EIp9DEhsuG58l
 PMNkQJ04F4xEFv1/rsle2bB5OoNvV2B4RJ5+yHLos27EGQYVrkrGsgMqYJhjFoJnnjt4
 uE1g==
X-Gm-Message-State: ACrzQf0qA5IfXMdS0rKB6NBbfg5vZRzfXKcXU0Yq+rQCVqd6EopoZt8Z
 B4u3ZtjeZZBNxhktxDsciC+52s6hsU+nrLN1Z9c=
X-Google-Smtp-Source: AMsMyM7bwRfU/9iNaQbyljheW233pohShNkzDsvX5eCeD0iJDN+6nYrObBDYS85GAmjuVNxoNOwdcyLqfGLtXD+JT/0=
X-Received: by 2002:a05:6214:e86:b0:4bb:7e1a:9dee with SMTP id
 hf6-20020a0562140e8600b004bb7e1a9deemr8414735qvb.96.1666736279438; Tue, 25
 Oct 2022 15:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221025203852.681822-1-helgaas@kernel.org>
In-Reply-To: <20221025203852.681822-1-helgaas@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 26 Oct 2022 08:17:47 +1000
Message-ID: <CAPM=9twkfjHh4SR2aQdB9WTRYEhTdWZG4A-f0n8oB8yw=dZgyw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] agp: Convert to generic power management
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Oct 2022 at 06:39, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Vaibhav converted several AGP drivers from legacy PCI power management to
> generic power management [1].  This series converts the rest of them.

Do you want to merge through the PCI tree?

Acked-by: Dave Airlie <airlied@redhat.com>

Dave.
>
> v1 posted at [2].
>
> Changes from v1 to v2:
>   - Convert from SIMPLE_DEV_PM_OPS() (which is deprecated) to
>     DEFINE_SIMPLE_DEV_PM_OPS() and remove __maybe_unused annotations.
>
> [1] https://lore.kernel.org/all/20210112080924.1038907-1-vaibhavgupta40@gmail.com/#t
> [2] https://lore.kernel.org/all/20220607034340.307318-1-helgaas@kernel.org/
>
> Bjorn Helgaas (8):
>   agp/efficeon: Convert to generic power management
>   agp/intel: Convert to generic power management
>   agp/amd-k7: Convert to generic power management
>   agp/ati: Convert to generic power management
>   agp/nvidia: Convert to generic power management
>   agp/amd64: Update to DEFINE_SIMPLE_DEV_PM_OPS()
>   agp/sis: Update to DEFINE_SIMPLE_DEV_PM_OPS()
>   agp/via: Update to DEFINE_SIMPLE_DEV_PM_OPS()
>
>  drivers/char/agp/amd-k7-agp.c   | 24 ++++--------------------
>  drivers/char/agp/amd64-agp.c    |  6 ++----
>  drivers/char/agp/ati-agp.c      | 22 ++++------------------
>  drivers/char/agp/efficeon-agp.c | 16 ++++------------
>  drivers/char/agp/intel-agp.c    | 11 +++++------
>  drivers/char/agp/nvidia-agp.c   | 24 ++++--------------------
>  drivers/char/agp/sis-agp.c      |  7 ++-----
>  drivers/char/agp/via-agp.c      |  6 ++----
>  8 files changed, 27 insertions(+), 89 deletions(-)
>
> --
> 2.25.1
>
