Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FCC4D66FB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 18:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC0C10E03B;
	Fri, 11 Mar 2022 17:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8CF10E03B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 17:00:54 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 132so7927994pga.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 09:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EHaG9nWRlLaw6yB3xb7CSc3W36oXMnwjPEKkW41dEDQ=;
 b=Y0hY/Xvu6jmOAvcndI/MOgflznvOdJQxrYLluU6H7H3OAwG1AfgjQ+jso9h8st2w5A
 WePPeAQG/rD29JvYX8MNfBGYb5UdN/J1ykrzJRJw4AiW/4p8cl6bWAtXHu/9kDJ60cWS
 6v31OAeES1WHTyyaXjESgSrDoUtDVWVsd7zJbnBJKfAOQvi/kSqiwwaiCCmIlT6rokA+
 J9oTY8v5pfE5c44Nq4W3QspJBHZ1dHo9wOEQrDPm+tbaP07xq0+5c3suJDkPbRpcCAfX
 4lVKlgXHOJBgXhw9+BkgFg54VsPlk2bUMHTekbQCaDkBB1aehTqj3ouNELDLevNyTfpJ
 ew+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EHaG9nWRlLaw6yB3xb7CSc3W36oXMnwjPEKkW41dEDQ=;
 b=U4uUm1AAa77nNhEcnvn8NKK4fi8x2795XPEc3xvOtbyaJXLAe6m+vIne+1ra2N09XG
 czbq/WzDJ4lyIBy+tHKX44lKNMTns5n9Qi2z6sfu5NKnMjv47iEkZpTQ/wEWSfL30uC9
 OmcAxh3GF3Hpm4zccbpGpzvnaPvnA8USovz/7YDR9QNnVx0Op5xosDFi0tfCkChx/Yli
 8xzEyC/U3s2xRDac+AKzWeJZVi7pf9O2zQerZT8lCIpUxrMkpWCbutsM8cvjukLuVGKC
 Yl4rh/krDF42yu9APQZYXYfGEL8jMx4Zx511Df0OA5DpbVSOfoGfhYDa6FbPTEAy2mbR
 y1YQ==
X-Gm-Message-State: AOAM530zdLfsDjbYvN0t9DwNGuzkt0EoNkOqEFE3XSSNzNNZkUc5mCm9
 bUPZ2xgkFCe542M15vIo/xBLmPFfxBysG5EVAQE=
X-Google-Smtp-Source: ABdhPJz3vwUydJutGEzbm5Giy2dHerMp0mVgpZFL2g963E9F44+jEU9tjdf9RbIrbVG6NhwS+f4gmeaWzibR/QgB8ig=
X-Received: by 2002:a05:6a00:2444:b0:4f7:71bd:892 with SMTP id
 d4-20020a056a00244400b004f771bd0892mr10004535pfj.81.1647018054130; Fri, 11
 Mar 2022 09:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20220311120453.163297-1-cbranchereau@gmail.com>
 <20220311120453.163297-5-cbranchereau@gmail.com>
 <YitjvmxpKHARVcYk@robh.at.kernel.org>
In-Reply-To: <YitjvmxpKHARVcYk@robh.at.kernel.org>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Fri, 11 Mar 2022 18:00:41 +0100
Message-ID: <CAFsFa87t_YrNP3LQs8Ft2JKfOpCPQ7-5jLV13zL4m4p4WoZSwg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: display/panel: Add Leadtek
 ltk035c5444t
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Sorry something I can't explain happened with git rebase

v4 on its way

On Fri, Mar 11, 2022 at 3:59 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Mar 11, 2022 at 01:04:53PM +0100, Christophe Branchereau wrote:
> > Add binding for the leadtek ltk035c5444t, which is a 640x480
> > mipi-dbi over spi / 24-bit RGB panel based on the newvision
> > NV03052C chipset.
> >
> > It is found in the Anbernic RG350M mips handheld.
> >
> > Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> > ---
> >  .../display/panel/leadtek,ltk035c5444t.yaml   | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
> > new file mode 100644
> > index 000000000000..9e728f8ce0cd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: GPL-2.0
>
> Why did you change the license? It was correct before.
>
> Rob
