Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2B4676BE4
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 10:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B9910E2C1;
	Sun, 22 Jan 2023 09:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E614710E2C1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 09:36:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BEC160B8B
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 09:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B525BC433A0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674380172;
 bh=ZhXF7Awwo1h8tePHEvpbC2rXjpmQ9EJWtH1hp7fpziU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k8laZo479qBe0R/u8DwdMjq+8NZ8NHfLvpGBOMDM/ftfFqW2TbkNEL1v9O3K/2O/Z
 76kGnvAGg279JF1R7OmrUd1cZF2AmnAvuW58PZwdESiv9wcqYMKRwIKA1Phxaz6skq
 vgzjSGOQI5hUNWnh7FCN1QAJ86J1FDnS+NcSjegOXXdX3ThQhmD6Jg3pi8iUOVs+F3
 cYK7Xu3SS3+NW4biwfw6YmtAdivDJDKYO2Y3Jf36cUc1CzEqKCVcZVlgS5VoZikeCv
 Gs6omqhVeD3O+vOYInXJnBkFtMypaZ6qdm4XdJI6TxFErKCj3tfU/qmcb7QHFBdX/T
 bxOnhIsyFrBlQ==
Received: by mail-yb1-f173.google.com with SMTP id 123so11559828ybv.6
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 01:36:12 -0800 (PST)
X-Gm-Message-State: AFqh2kpLxu8hoencSpCO3d7tVszzJ3QBb9Ble0kV6qmzmQOPgQTlpRZk
 Z4DNYefMlRDRybii6sghHq6oPaRuksitS2w3+Fg=
X-Google-Smtp-Source: AMrXdXsmsAO3UBkm78bn/WoLLPJuV/D0q2xlQYPdYAH6LwFfZrCDk6EXy98FeP9LfMgqYS+/Chcocg7P19eQ3O7FeWw=
X-Received: by 2002:a5b:511:0:b0:801:b1d4:329a with SMTP id
 o17-20020a5b0511000000b00801b1d4329amr733597ybp.443.1674380171778; Sun, 22
 Jan 2023 01:36:11 -0800 (PST)
MIME-Version: 1.0
References: <20230120123534.137413-1-bagasdotme@gmail.com>
 <20230120123534.137413-2-bagasdotme@gmail.com>
 <8a5c3cc6-c1e5-b6c4-e69d-441cf3a1fa7d@quicinc.com>
In-Reply-To: <8a5c3cc6-c1e5-b6c4-e69d-441cf3a1fa7d@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 22 Jan 2023 11:35:45 +0200
X-Gmail-Original-Message-ID: <CAFCwf12T3LketLMbTgY6fTi8x61F+H2wjmNM0x=7PAEHUgSrwA@mail.gmail.com>
Message-ID: <CAFCwf12T3LketLMbTgY6fTi8x61F+H2wjmNM0x=7PAEHUgSrwA@mail.gmail.com>
Subject: Re: [PATCH linux-next 1/3] Documentation: accel: escape wildcard in
 special file path
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Aaron Lewis <aaronlewis@google.com>, Linux KVM <kvm@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Sean Christopherson <seanjc@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Freedesktop DRI List <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 5:00 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 1/20/2023 5:35 AM, Bagas Sanjaya wrote:
> > Stephen Rothwell reported htmldocs warning then merging accel tree:
> >
> > Documentation/accel/introduction.rst:72: WARNING: Inline emphasis start-string without end-string.
> >
> > Sphinx confuses the file wildcards with inline emphasis (italics), hence
> > the warning.
> >
> > Fix the warning by escaping wildcards.
> >
> > Link: https://lore.kernel.org/linux-next/20230120132116.21de1104@canb.auug.org.au/
> > Fixes: f65c5dac207322 ("docs: accel: Fix debugfs path")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> Thanks for addressing this before I even saw the warning report.
>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Thanks.
Picked up to my tree (as the original commit is in my tree).
Oded
