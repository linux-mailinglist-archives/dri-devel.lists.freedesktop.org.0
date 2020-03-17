Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E194188732
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147A86E1BE;
	Tue, 17 Mar 2020 14:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BA06E4E3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 06:55:54 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n21so19796314ioo.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xWR9GR9zXt7FMFLwHnM9DNzADB3xyA+rYdWNj2AqhMs=;
 b=I1UzqDi1CI7BgLIIpE9p97OJKAijExbglYmN6z+rzZ+aGvdTYh1gw27m8JTkITzPxT
 Rilz8tMl3pOmagIK5plERd6lxmTFAtxgBRCz41ZDo/k0lfz/7mO6m6k/4hYhut0HhyXd
 cDIA4BqZ+8+i3tYMVWtC8e7WgWFF2/7IPXft4JrXPm+SFW8cPUe2NSkyIwAPd0u0UZZs
 FTRYP2iMLHSLfQEAn+MqzefPVG7v4E+zNbzK6HlRzc1Qw9o/YnazXDt/JNuyO3jlPOWk
 RipUqhWIyVOhokA39kwlbbAcfJXbAuAtFEpF6dgFz8Q0irkAJoR/ui8mXoLWqo7me+7S
 +vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xWR9GR9zXt7FMFLwHnM9DNzADB3xyA+rYdWNj2AqhMs=;
 b=TiTvE5eH39NiPsw7EbZSpI6gzWP9I5h7frG/O1A0cMOWWZkAzCSRz4Ln0Zt5jmUIUm
 3BZ/yojktkCvtMS1zO3eW4cGzHIfp8TpbVlLpuK7HfjxRbi43UaH1HH/C56BusC5QUs6
 wY8gRScEuxg2uuPoykn+MGrRNUQKsy6k3bjddQaRhivvg3onxxdt2irufHnPR3/ToXAg
 fcygwrtR15Ph/Bsb3p8NGUrCrHcZbE6yw/EES0wbvKmik+2WeCgUiNfLVHMsF9FEWISU
 x6wZaLYogfprvc4BWyHKFQ9+ym8tLxN9leqDNsd/PvV/u1DFyVTbfUNQaOm8uQ4eFrW/
 SBAw==
X-Gm-Message-State: ANhLgQ3VS9qgCdylPnGMLWbcO1lip28HxXE9XaIwLK2fpAX7VtQAhpVN
 qlEgArOKU7M9H/Q6hsX33oG4GHyPJOj49UAKvoE=
X-Google-Smtp-Source: ADFU+vsXQb/pFKtMWJ3JxvgCpZZOO72lwsnc1rP4K5qxjjSEXrdkUflkKDvQQlk2khti5gYEuUfJLY5cws3XT4bGDto=
X-Received: by 2002:a05:6638:f01:: with SMTP id
 h1mr3578763jas.36.1584428153800; 
 Mon, 16 Mar 2020 23:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
 <20200312151752.GA7490@bogus>
 <CAGWqDJ7DP3DuR7EWT6Ni8YxN3Adg3RgJZut6+AtpAak_HB=QCQ@mail.gmail.com>
In-Reply-To: <CAGWqDJ7DP3DuR7EWT6Ni8YxN3Adg3RgJZut6+AtpAak_HB=QCQ@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Tue, 17 Mar 2020 12:25:42 +0530
Message-ID: <CAGWqDJ4cAU98_xMk6f-bsT5LF5cD2JJk8_JCykwM=cd6CCfWtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-binding: Add DSI/LVDS tc358775 bridge bindings
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sam,

i need some inputs on the below  error. I had created this file
Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
by using vim editor. Do we have any tool to create yaml file?

i do not get the error when running 'make dt_binding_check' in my
build environment
Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml

is there any tool available similar to  scripts/checkpatch.pl -f
<file> , for yaml files?

On Sun, Mar 15, 2020 at 8:54 PM Vinay Simha B N <simhavcs@gmail.com> wrote:
>
> rob,
>
> i do not get the error when running 'make dt_binding_check' in my
> build environment
> Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
>
> is there any tool available similar to  scripts/checkpatch.pl -f
> <file> , for yaml files?
>
> On Thu, Mar 12, 2020 at 8:47 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, 11 Mar 2020 15:18:24 +0530, Vinay Simha BN wrote:
> > > Add yaml documentation for DSI/LVDS tc358775 bridge
> > >
> > > Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> > >
> > > ---
> > > v1:
> > >  Initial version
> > > ---
> > >  .../bindings/display/bridge/toshiba-tc358775.yaml  | 174 +++++++++++++++++++++
> > >  1 file changed, 174 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml:  while scanning for the next token
> > found character that cannot start any token
> >   in "<unicode string>", line 11, column 1
> > Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.example.dts' failed
> > make[1]: *** [Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.example.dts] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > warning: no schema found in file: Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml: ignoring, error parsing file
> > Makefile:1262: recipe for target 'dt_binding_check' failed
> > make: *** [dt_binding_check] Error 2
> >
> > See https://patchwork.ozlabs.org/patch/1252753
> > Please check and re-submit.
>
>
>
> --
> regards,
> vinaysimha



-- 
regards,
vinaysimha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
