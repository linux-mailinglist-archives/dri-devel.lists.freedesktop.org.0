Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0334B0FF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 22:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720536F475;
	Fri, 26 Mar 2021 21:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3496F475
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 21:01:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D120761A2D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 21:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616792509;
 bh=jlkeGi9j17trfQ6S6m1guFm6W28IQ6cuMyY9jRNcnjE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CAz8OKIf9UsIG/W3Ed/my6oJhgz76p3AmM7HesB0vpUmMSpu4iFfIa5MuWVZggTWB
 nPwHzQlu9ifrwr+cTGL6s/KwzrUkkBkiBoqTpibdcDmZUeIFYxqli+Hejh+SWgj5cq
 9QJDolE1Ekc5IBm0qGU3iCUxZPt6iJJdp+4x1VdqYFsKL3i6mf5o0lYw9zk0ippUI0
 P82AZOxQ4YE9Vhso6tcXZLjrdYMSuAkMRqkGbYlVayCDFLJ6dgYppYGRi5Dkrx0klR
 181ipADnB6TNzOrzSucVtNUrVcytq6ORORJEJRS9i/G27l27QF+kpLm+XKfVBFLU6P
 P6MlsVyy6KV7w==
Received: by mail-ej1-f42.google.com with SMTP id r12so10388123ejr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:01:48 -0700 (PDT)
X-Gm-Message-State: AOAM530WHhLgI/bZUPpWxvJ6Zk9zBNduoYFgO3+U0Jhzxc0wm8MwufiA
 G2s3v6vPeFTRoB5t4wyl3W73pY22+U1c5tPuoQ==
X-Google-Smtp-Source: ABdhPJxe7HVKVAhRaeZmT0fSiqd+rP9S0dwUe9synkBMGqpzO4koufs4H1Nvzg/U7Pb2BUV7WfFne1leI7eV7LPz2Hc=
X-Received: by 2002:a17:906:d153:: with SMTP id
 br19mr16892035ejb.360.1616792507280; 
 Fri, 26 Mar 2021 14:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210218152837.1080819-1-maxime@cerno.tech>
 <20210223212624.GA89721@robh.at.kernel.org>
In-Reply-To: <20210223212624.GA89721@robh.at.kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Mar 2021 15:01:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKtGz3mtzc1KTASVtAcc7PSV7Z8Y-n8JjOzxua8EpQ5ZQ@mail.gmail.com>
Message-ID: <CAL_JsqKtGz3mtzc1KTASVtAcc7PSV7Z8Y-n8JjOzxua8EpQ5ZQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: bcm2711-hdmi: Fix broken schema
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 2:26 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 18 Feb 2021 16:28:37 +0100, Maxime Ripard wrote:
> > For some reason, unevaluatedProperties doesn't work and
> > additionalProperties is required. Fix it by switching to
> > additionalProperties.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../devicetree/bindings/display/brcm,bcm2711-hdmi.yaml          | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
> Applied, thanks!

Something weird is going on with this fix. linux-next doesn't end up
with the change even though 5.12-rc2 has it. I suspect it's because
the original commit is in 2 branches (drm-misc-next and
drm-misc-fixes), but the fix was applied by me. I'm not sure how
linux-next didn't have a manual merge for this.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
