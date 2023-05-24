Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7937A710037
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 23:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D688010E5D7;
	Wed, 24 May 2023 21:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5228710E5D7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 21:54:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 640B963BD9;
 Wed, 24 May 2023 21:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5168EC433D2;
 Wed, 24 May 2023 21:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684965266;
 bh=F88GJ6vAwpF7GaNRxrTGbI4XIS1F/cwKB4bP/M/sqPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nm34SmeRRRuboq2DXC8KAsXOk5fBetJUa8L40dIfrTBG6JNZVc177pxEFd3g/4lHt
 W3H3KUpBSHEbX7a7lS/4gqi+NcoHgYZUgSexLbljemKvn6YyHGyKgCCzfsidsd90ma
 uVVsHKKP/+MC9lwtJVvLr+jUjrmZu9yUhcaa5IlchON1wWrJJJUNk9g7D3k9W8mHKa
 crn0j3rSqC4t4CzXdoI24ItziojE5XpUaIE1M4Ezi4U8NjNMIGwnuGo8N2LlgmRGOh
 k1b2ImKC7HtZkH2nxEgu4S6nHyh8pKmuXqeDqna33zX325Hj0FDqQbPNTk7cfqQno5
 9W7o6/PPQhDAQ==
Date: Wed, 24 May 2023 22:54:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v4 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Message-ID: <20230524-fountain-icing-eceec8fe6c96@spud>
References: <1684878827-40672-1-git-send-email-justin.chen@broadcom.com>
 <1684878827-40672-3-git-send-email-justin.chen@broadcom.com>
 <20230523-unfailing-twisting-9cb092b14f6f@spud>
 <CALSSxFYMm5NYw41ERr1Ah-bejDgf9EdJd1dGNL9_sKVVmrpg3g@mail.gmail.com>
 <20230524-scientist-enviable-7bfff99431cc@wendy>
 <20230524-resample-dingbat-8a9f09ba76a5@wendy>
 <CALSSxFabgO-YTQ-nzki6h+Y=n3SfzgC4giJk8BySgCErK6zrmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALSSxFabgO-YTQ-nzki6h+Y=n3SfzgC4giJk8BySgCErK6zrmw@mail.gmail.com>
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
Cc: andrew@lunn.ch, Conor Dooley <conor.dooley@microchip.com>,
 simon.horman@corigine.com, dri-devel@lists.freedesktop.org,
 edumazet@google.com, justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 sumit.semwal@linaro.org, f.fainelli@gmail.com,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux@armlinux.org.uk,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, richardcochran@gmail.com, opendmb@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 robh+dt@kernel.org, christian.koenig@amd.com, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 02:47:59PM -0700, Justin Chen wrote:
> On Tue, May 23, 2023 at 11:56=E2=80=AFPM Conor Dooley <conor.dooley@micro=
chip.com> wrote:

> Gotcha. I got something like this now.
>=20
>   compatible:
>     oneOf:
>       - items:
>           - enum:
>               - brcm,bcm74165-asp
>           - const: brcm,asp-v2.1
>       - items:
>           - enum:
>               - brcm,bcm72165-asp
>           - const: brcm,asp-v2.0

Yes, this is what I had in mind.

> Apologies, still getting used to this yaml stuff. Starting to make a
> bit more sense to me now.

No worries.

> > > valid fallback for "brcm,asp-v2.1"?
> > > The oneOf: also becomes redundant since you only have one items:.
> > >
> > > > Will submit a v5 tomorrow.
> > >
> > > BTW, when you do, could you use the address listed in MAINTAINERS rat=
her
> > > than the one you used for this version?
> > >
> I changed the address listed in MAINTAINERS from the previous versions
> of this patchset. The current version should match the address that
> this patch set was sent from. Looks like I forgot to add a changelog
> for that in v4.

Hmm, I must not have been clear. You sent it to <conor@kernel.org> and I
was hoping that you would use <conor+dt@kernel.org> instead so that you
end up hitting the right mail filters :) It's not a problem, I was just
added to it in -rc1 so get_maintainer.pl probably didn't spit my name
out for your original revision.

Thanks,
Conor.
