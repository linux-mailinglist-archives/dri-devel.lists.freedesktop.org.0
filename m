Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DED5436CB3C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 20:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3B76E558;
	Tue, 27 Apr 2021 18:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CF66E558
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 18:41:09 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m5so5594175wmf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 11:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SMVILXNkaIdjnAEpffSPCfWKcsb7tYMas3YWPPQugHY=;
 b=TqsgvgFyk/O9vlWSVgRBNnvFSDLI1oOk30nWrjz5A9XR6nzojkqT2duK91vaH9tvXX
 ZrpOBxSJfcFU4wNQwKr9llN9qxRsg38ppWuOtcQZXVWNSe26Hb8MQhMXcu9HhEar/8uI
 IhfvBo8RfYvS2mHn3hiXnRkNNwiZ/6lheE/s1nB7ZYkuJznM+J5U7Iqu6e8YkOhQCviD
 GkFa+Fftkkyos9JGoXIODxYWZoOY3nJPwHRKZ587c/XqmgG0DlN9+gmaBwz+vJrgYkfI
 vWfAMR8qsXul72NbeBn/UAHMO3IjjZAxzfu3535hE6EmDfBm82SJpCnHhi8qUx7mjRal
 /jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SMVILXNkaIdjnAEpffSPCfWKcsb7tYMas3YWPPQugHY=;
 b=Ja3YjalRyRu281qKrdjD9/PPHDEtckeB/6WovA1GZbkqsflyRIIIGbUPKkH968bz8d
 +mQRxKcYtqzR3IKl8OcOdCX8yd6w6PocRyMzRzlCuuMzYGq2jpuKY/ADGboGMUyJfn9t
 upkzm2UCAPZqjoUSmgB30QuIAy7GSfN5NC8hm0+fHm30mZ8hhho2S/7ZWaas9sFZ3Mj/
 TBKYXS/iB2C6c6yzq89F0EfwsWnQ1nrvHs1u0T6hbhMhHgmC/UCiNBglmI5asERQtqIm
 TDQxUQQaxPQNLVg38pal/rFa5VHMt1NhFYbIsZpoxCDDkKz+xxn/sVEDQrvV1seio+Qd
 yvsQ==
X-Gm-Message-State: AOAM533NBPTZ/VGVg+xmAZIrNShqv2oZ3tDO4o7A8WQgOA2pb23B9vmg
 eTbUUjuPclPeWDzlj4WXBgAsPYPBa2H+rq30KSP5DmgZyLqjsA==
X-Google-Smtp-Source: ABdhPJximzxU2rKgxAzotvHJRIRA+otDxGjvqfhpfmPKY2F60DQYMt0xhlztzIf6KxxR6GD2l10h3C6PFu2chp1ssxA=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr27024182wmj.84.1619548868114; 
 Tue, 27 Apr 2021 11:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-2-thierry.reding@gmail.com>
 <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
 <YF4L3kq9UN6PWh/h@orome.fritz.box>
In-Reply-To: <YF4L3kq9UN6PWh/h@orome.fritz.box>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 27 Apr 2021 19:40:14 +0100
Message-ID: <CAPj87rO_RsEPpuC9-DyVEJ=K6OLeknHhOnjvbQ2EEnPPPrq+dg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add macros to determine the modifier
 vendor
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
Content-Type: multipart/mixed; boundary="===============0471804223=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0471804223==
Content-Type: multipart/alternative; boundary="000000000000fb11bd05c0f89ac8"

--000000000000fb11bd05c0f89ac8
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Mar 2021 at 16:29, Thierry Reding <thierry.reding@gmail.com>
wrote:

> On Fri, Mar 26, 2021 at 02:54:22PM +0000, Simon Ser wrote:
> > LGTM, thanks!
> >
> > Reviewed-by: Simon Ser <contact@emersion.fr>
> >
> > Let me know if you need me to push this to drm-misc-next.
>
> I do have commit access for drm-misc-next, but I was thinking that I
> could take this through the drm/tegra tree along with the subsequent
> patches because of the dependency.
>
> Anyone willing to provide an Acked-by for that?
>

Yep, no harm if that makes your life easier, so for both the patch itself
and merging through tegra:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

--000000000000fb11bd05c0f89ac8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"">On Fri, 26 Mar 2021 at 1=
6:29, Thierry Reding &lt;<a href=3D"mailto:thierry.reding@gmail.com">thierr=
y.reding@gmail.com</a>&gt; wrote:</span><br></div><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Mar 26, 2021 at=
 02:54:22PM +0000, Simon Ser wrote:<br>
&gt; LGTM, thanks!<br>
&gt; <br>
&gt; Reviewed-by: Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" targ=
et=3D"_blank">contact@emersion.fr</a>&gt;<br>
&gt; <br>
&gt; Let me know if you need me to push this to drm-misc-next.<br>
<br>
I do have commit access for drm-misc-next, but I was thinking that I<br>
could take this through the drm/tegra tree along with the subsequent<br>
patches because of the dependency.<br>
<br>
Anyone willing to provide an Acked-by for that?<br></blockquote><div><br></=
div><div>Yep, no harm if that makes your life easier, so for both the patch=
 itself and merging through tegra:</div><div>Acked-by: Daniel Stone &lt;<a =
href=3D"mailto:daniels@collabora.com">daniels@collabora.com</a>&gt;</div><d=
iv><br></div><div>Cheers,</div><div>Daniel</div></div></div>

--000000000000fb11bd05c0f89ac8--

--===============0471804223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0471804223==--
