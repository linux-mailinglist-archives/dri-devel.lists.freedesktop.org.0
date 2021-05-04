Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAD4372D3D
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 17:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AD889DC9;
	Tue,  4 May 2021 15:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CD589DBA;
 Tue,  4 May 2021 15:48:27 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id m17so4967143vsn.10;
 Tue, 04 May 2021 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zWkhFmFfcn11T3BepO4TImcK6jj0L9mDhIUI9DngYuM=;
 b=JUxRGxeJ9hcHIvp4f/XVUPTVkQGlDuyYvTfcdhLw1kRb17SjZzc9YTgzXJE+UxViXu
 q2Fvfjfr/jNv8CEFfGpaAu6D8LtUBF02HATIkwt+S+8RYcGJq072umsswK7FzMxPPsIs
 DLNovAKpEqSX8H0zX/vux0mh3HEs77y6CF4Ww+x3r5CaglVkUs1J4J+Qt07vi9MqksFi
 LDfMYEa8pf34XgPrDcIIupWfEwom5sGOY+1SZgur+LnTIqp+hNbBot8hz6sbr5iQiaTk
 QMUt2cFoIDX45qvikeHzcUtdVbe3KJ4NVFBPN4oKuafjuttrMsiuUcZZzORafaUMbRKy
 kfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zWkhFmFfcn11T3BepO4TImcK6jj0L9mDhIUI9DngYuM=;
 b=G3rWUJIFs8dbQMGndvDNkJ00F3il9FCLl8MuRN5j5U2yYhVgIO5bGHHivi3wSXcDT6
 mnOh6l05Z/8H8eSxlMrX6DcGfir+zPB041JyIe+bBw4H1mS4E9QeKMH/uc+HPFiy/lFj
 owY7m7eEsTITQ8oIgUzSraB6bsYB8ym+j2gR1Eu6IRprfQZ0qWgTriaLoOPba7sOCyTB
 PVEmlSzRtQ6ORWYh6JC6GRRbzGpevbagTvYlqSjhrRQ7YH8ik/aACLDUsJMD2reh9qL7
 tynOFhwZRy7cDB3K18xmqEspspMueeqNYqIzSp1W6NR4b4rcd8XM2DPqElQ3O0l+vkeW
 aKPw==
X-Gm-Message-State: AOAM53324ZJ3IVIYVa++YD4rsfhzBcbmuhYJVTGzceY7WPQirkn6tabt
 a4RWCW4ohBMPnSZl/aLugbcK5RBC8LU0wGFM7NY=
X-Google-Smtp-Source: ABdhPJyTKmR/g5V5pIQSMJK8qCM+0AM+Gi+oTchsA7cD6zqCWBYomiZPW0yNveq1Bf4O/rCXpeA/1KVhdCzCtJ2PUhw=
X-Received: by 2002:a05:6102:3588:: with SMTP id
 h8mr22526607vsu.31.1620143306368; 
 Tue, 04 May 2021 08:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
 <20210427092018.832258-8-daniel.vetter@ffwll.ch>
 <CACvgo51rQJmHc1K-MSq-WLZkwVt34MY73csgEyxorrYsKPwQiA@mail.gmail.com>
 <YIgB76WmQijHCJeV@phenom.ffwll.local>
 <CACvgo50frye2h5L78YKnHm8TaE9xM=fn-7fNNtHbSwiv+GnYVA@mail.gmail.com>
 <_ICN4Ho9WvMf55FvcWEqbzvApWTRd3hIiVAJ8vkrc0XTljEiq3f5aOB8ElxJL3WTL--P1-VZddkcjLcwdL3YxdPkYClHuyMhtQ0-Zv88Fh0=@emersion.fr>
In-Reply-To: <_ICN4Ho9WvMf55FvcWEqbzvApWTRd3hIiVAJ8vkrc0XTljEiq3f5aOB8ElxJL3WTL--P1-VZddkcjLcwdL3YxdPkYClHuyMhtQ0-Zv88Fh0=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 4 May 2021 16:48:15 +0100
Message-ID: <CACvgo51On7=M28b9X+k-SGe4q2btGOoe+2_1-nBTrqjr7XTjQw@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/modifiers: Enforce consistency between the cap an
 IN_FORMATS
To: Simon Ser <contact@emersion.fr>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 May 2021 at 15:58, Simon Ser <contact@emersion.fr> wrote:
>
> Continuing on that idea to push for enabling the cap in more cases: do
> we have a policy to require new drivers to always support modifiers?
>
> That would be nice, even if it's just about enabling LINEAR.

Sounds perfectly reasonable IMHO. I think we ought to document this
policy (requirement ideally) somewhere - say alongside the "all new
KMS drivers must support atomic modeset", which lives in ...

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
