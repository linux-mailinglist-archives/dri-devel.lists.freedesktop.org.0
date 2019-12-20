Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1114B12857D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 00:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87186ECCF;
	Fri, 20 Dec 2019 23:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849556ECCF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 23:22:13 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id b10so11021332iof.11
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 15:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=iGnGaTzlaPQuDPbDuv+j/KpCNMFrc187P8QK8eCT+ho=;
 b=YU4o7B/nXV1MVmBSVgiOe6mw5xLK01bn5LP/yUtEChhPneBJPEx6fyaXDyyIXBIm3L
 vbWUav9BIjb290SUUUAND6h3B8aislrmnTR1+B7enx3YstBBTWXtOY+8z2VEofpmN0W8
 HM4IPvXegN1XCkdjN59FTaVPX/8b83J3vySLaghXpo4QemVzDOoYYTkZr8S3DxIJdWYX
 qYN/GqAi+xECJu8wK/WUjVc8/qeXuemhclGAjDjwHn6m86xzERytiAE01loLziiYG2X6
 l13Z7fFQvC0J9+wyC3mKkfjTrB6QL4yyU0kvHYrVfaEaFLyvL2cHrWYo/FCNPBrZtZcR
 C8nw==
X-Gm-Message-State: APjAAAXU4p2yPBKagLZMaVIpVLfMSG0iXsxl2l0Y4wKiYBouipA8dKxL
 Ci36P9HuSSXMH5sCkRPovg==
X-Google-Smtp-Source: APXvYqzaQq+TliM16DK84d0o/LALAuwPTz8TyJrdclzToZvqk8Pp/6zZyxjVWmtaX5B44P1whUENXA==
X-Received: by 2002:a05:6602:220b:: with SMTP id
 n11mr12411540ion.6.1576884132846; 
 Fri, 20 Dec 2019 15:22:12 -0800 (PST)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id d12sm5570826iln.63.2019.12.20.15.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 15:22:12 -0800 (PST)
Date: Fri, 20 Dec 2019 16:22:11 -0700
From: Rob Herring <robh@kernel.org>
To: Yannick Fertre <yannick.fertre@st.com>
Subject: Re: [PATCH] dt-bindings: display: Convert raydium,rm68200 panel to
 DT schema
Message-ID: <20191220232211.GA16273@bogus>
References: <1576853660-2083-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576853660-2083-1-git-send-email-yannick.fertre@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, David Airlie <airlied@linux.ie>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 03:54:20PM +0100, Yannick Fertre wrote:
> From: Yannick Fertr=E9 <yannick.fertre@st.com>
> =

> Convert the raydium,rm68200 panel binding to DT schema.
> =

> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>  .../bindings/display/panel/raydium,rm68200.txt     | 25 ---------
>  .../bindings/display/panel/raydium,rm68200.yaml    | 61 ++++++++++++++++=
++++++
>  2 files changed, 61 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/raydi=
um,rm68200.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/raydi=
um,rm68200.yaml

I already have a patch posted that converts this and almost all the =

other panels.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
