Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFD651491F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 14:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBEB10E3F6;
	Fri, 29 Apr 2022 12:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9CC10E3F6;
 Fri, 29 Apr 2022 12:21:30 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id kj18so5189711qvb.6;
 Fri, 29 Apr 2022 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yna8wfxABGYcAzA/m8WI3a3vsuDJiblFDn19JsbFVRw=;
 b=mtBUQ22TZn8EatYDxTYLdotsO7yJQYU4occVzmST8szXuuUBtaDiUfdLmtdVJgzQKN
 4O/+9oJLN1wjn7P1fz5QRDkRyv482CavphlzEDp/uHAM8efgaN/wepFB7bx6zxkvvK1S
 VpzrdArd7/AkVbG6uBRAYQ6pOy3tmwPcPQgVaEROhw2CcHTb+FF6aqwVSOBFi6Iw8KmG
 62eGFYC/PmNzdmAr+0kENSVG4fK5BNGPMlHTQJQBYfX6ZT5FvbpPm3VLbpdBN6o2/XRL
 nZ3IRHqsl2dBfm1Xrs26iuZ8LW93tlGlXiOMJOUs7ADgVNfp2uhG2ejsIOrkcsnCYL3f
 8bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yna8wfxABGYcAzA/m8WI3a3vsuDJiblFDn19JsbFVRw=;
 b=YvkVZvG6sLYOoM1QCIfaP9mT+AJ9YaUWJnJgLZHxZz53x1fJ+KziN9s2dgCJhcCTVn
 2XrJ2DLyho6XiYzarwAJOY6+bRSNn/icP4CW/uXRa8EE8H0UZ4GWP626r3CjLEbwPSfL
 tljozeGv/jWMCTGZIPv90D/9JczKu3pyAB1f02reGWKoXXQoKYJPhWit0It/0U3O7+9N
 aRiDjln237kupyE9CsFb0ENwrOgJ4IZBdrkpIIhCRFGq8RYhUlN2sdOzHs70oD9DUU+f
 p2IQ2uPvfNY/IO5Uy+wpXgk3YS9O3dvdrEk2NLnRI/oPp0N3cRkUOum82+8m2fGTPWJ5
 QWdQ==
X-Gm-Message-State: AOAM533ukF2cvI9WRqIm+Ab6ggpbEvWhzo6dsWLzXe3oXQyb10+5L+Mq
 3YXwW/tCgudKf4hejn6Fvc+XyxEMXhfZ5VSQ9+A=
X-Google-Smtp-Source: ABdhPJzw+2DEPrXqQevHuO9GHfmBTFnh+ki0GlhRcwAbobZhNKA9A0XYMVVgk810ZaNXFo/JjXG8qtMLgV71ZYYU3cw=
X-Received: by 2002:a05:6214:2344:b0:429:4d92:cec2 with SMTP id
 hu4-20020a056214234400b004294d92cec2mr26759380qvb.0.1651234889713; Fri, 29
 Apr 2022 05:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220425152317.4275-1-ramalingam.c@intel.com>
 <20220425152317.4275-2-ramalingam.c@intel.com>
In-Reply-To: <20220425152317.4275-2-ramalingam.c@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 29 Apr 2022 13:21:03 +0100
Message-ID: <CAM0jSHNff+p6ER=hLfNSK3Zo6DNr6jNcPStmOFMDtrz8HdZWEQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/xehpsdv/dg1/tgl: Fix issue with
 LRI relative addressing
To: Ramalingam C <ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Apr 2022 at 16:22, Ramalingam C <ramalingam.c@intel.com> wrote:
>
> From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>
> When bit 19 of MI_LOAD_REGISTER_IMM instruction opcode is set on tgl+
> devices, HW does not care about certain register address offsets, but
> instead check the following for valid address ranges on specific engines:
>         RCS && CCS: BITS(0 - 10)
>         BCS: BITS(0 - 11)
>         VECS && VCS: BITS(0 - 13)
> Also, tgl+ now support relative addressing for BCS engine - So, this
> patch fixes issue with live_gt_lrc selftest that is failing where there is
> mismatch between LRC register layout generated during init and HW
> default register offsets.
>
> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
