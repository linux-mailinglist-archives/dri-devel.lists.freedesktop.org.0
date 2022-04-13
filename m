Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446DB4FF8ED
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 16:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3517C10E889;
	Wed, 13 Apr 2022 14:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E32110EEE1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 14:29:02 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id s14so2109498plk.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W3hJGrmaAvxQ1Iq6K+QFDHPYd+AnBBrGQGYmAYimyFM=;
 b=Jws5h8+7lkW5dWJUO628L+BorIWyk9T5tBc726AJSWzLf5pJBLWUVKbwW6UOJukFGr
 waJ+8M/0jtPvdqefqOlUwzauP1OG5BnrNsmDCbbSlwK4hF/t16sPmj8ofalRaLbs+Zdw
 HlNmGZeBEtRx/Z18Lb5crO21/nhVD91XmaOpeYtJwKYVKsTGb8SBP4BdARSE1+TmbA45
 hwN1XewpTS2vSKhjD6MFZSWFShNGPmoS+bOZ/Kok9IOeqAHXJSpTKWx4L3TLcT05oTkF
 Y2kJxSTAJfQ1T1NnpOKijzutYmUy03NGxJNA3pPK/eSMUCrfe/Fbx1cZLfPl608iIEaN
 cMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W3hJGrmaAvxQ1Iq6K+QFDHPYd+AnBBrGQGYmAYimyFM=;
 b=JsdKYcmbz0yJlHXDS+Sfa9j8FcP/h3Lg2LbA4lAyHnzow4iRIRwKk3zP6c7fBnKtSJ
 izcIx08Amr88mABfWvuwct4j7eTsKTRlo/swhghwEq4snUgAcQz+O1/Lk9L1o8SyW+8+
 Qk0t40L18CXYgAzI2M9SpJFts7PjzI1/GVtveVqkCgSpaYTZyEP7A2iLjRnJzFJmAt6t
 DwL/IfM+8LgdldVvo4rtCIxoKgFlSvyDYHOjxcNVu3eOSNxYZx2V2xrKosuo8Hzt8RR+
 kDwKBFRY10ZD9SC3ryPhkQi8KzjgC6DqOxCyrm1bQQrzI8dDOKq7yJS0XQ+Ivn2lMqCe
 j9MA==
X-Gm-Message-State: AOAM532Gc3kCYzDDwNaATJIEkrS4n4Ce9LcKnVX50kK8xNWYN8B2wlaH
 /qINwe7M9qcXOyTbiP0CbbMkLwe+uF0Lk1DHvYoKIg==
X-Google-Smtp-Source: ABdhPJz3n3+dk2Krw4doJzCu1wCrOBh4/t9lU1aVQm4BPNjr3lisjMW5XOOnjfCrRT56oMgfkVfEXl3aKlZ/ZAOIbR4=
X-Received: by 2002:a17:902:c94c:b0:154:45c6:fbea with SMTP id
 i12-20020a170902c94c00b0015445c6fbeamr43212960pla.117.1649860142164; Wed, 13
 Apr 2022 07:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220328120956.1848795-1-xji@analogixsemi.com>
 <20220328120956.1848795-3-xji@analogixsemi.com>
 <YkswTpDiPYfdIFtE@robh.at.kernel.org>
 <20220409044740.GA595530@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20220409044740.GA595530@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 13 Apr 2022 16:28:51 +0200
Message-ID: <CAG3jFyt1Srtn2aTFQ6b8Rxc6F_GCzU2mKxiEiWwgskMwHHjj5Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: drm/bridge: anx7625: Change bus-type to
 7 (DPI)
To: Xin Ji <xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 9 Apr 2022 at 06:47, Xin Ji <xji@analogixsemi.com> wrote:
>
> On Mon, Apr 04, 2022 at 12:52:14PM -0500, Rob Herring wrote:
> > On Mon, Mar 28, 2022 at 08:09:54PM +0800, Xin Ji wrote:
> > > Change bus-type define for DPI.
> > >
> > > Fixes: a43661e7e819 ("dt-bindings:drm/bridge:anx7625:add vendor define")
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > index 0d38d6fe3983..4590186c4a0b 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > @@ -106,7 +106,7 @@ properties:
> > >                remote-endpoint: true
> > >
> > >                bus-type:
> > > -                enum: [1, 5]
> > > +                enum: [7]
> >
> > Changing is an ABI break, but didn't we revert adding this?
> Hi Rob, sorry, what do you mean about ABI break? Do I need remove this
> patch in this serial? Or do I need revert patch
> https://patchwork.freedesktop.org/patch/462331/, I don't know how to do
> it.
>

I contributed to the confusion about this, let's see if we can clear it up.

An issue was found related to which enum values were used to represent
what late in the last release cycle. As a result a revert[1] patch for
everything touching bus-type in anx7625 was merged.

This patch, does not apply to drm-misc-next due to the revert, and if
Xin Ji rebases his work on the drm-misc-next there should be no
ABI-change as this patch when fixed up will introduce bus-type to the
nax7625 ABI.

Xin: Does this make sense to you?

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=979452fbc43028675b5a5da156f91928b739dea8
