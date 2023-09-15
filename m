Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0837A203F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 15:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E01710E632;
	Fri, 15 Sep 2023 13:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4EC10E632
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 13:52:11 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9a21b6d105cso266866766b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 06:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694785929; x=1695390729;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4UHa0/oq66alw95ljztJJEQxyAHYh4BXAB2kPfRssY=;
 b=CtnWXY0dusJN33TsvcCx+c95U/lroHVjJ+vGcFNhzPKa7OheiBEIZLHgiR8srsH5IR
 eTJqNEENCZwARg2YDOzC75JxPty3GLZFUWWDlXDjPupsgtn1ndkx8rPlLWYaif8L87qy
 ca00jQxQUMr/VMEUROX2Vc8XWm8oVzI/Rj7qQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694785929; x=1695390729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/4UHa0/oq66alw95ljztJJEQxyAHYh4BXAB2kPfRssY=;
 b=V7TtsAIkEakCrMsYnRTeqzwwDgOctZZOk3p5rWVutUSfLzGABDo7vrLHa+HkTSy289
 6kqi5RZVVmXGiM/dGQKmEK3UhIcYjvFh+yic+I3h9cQhP7SUTmfw0f1PdXCgzFMSrD5x
 ckB/CkzM3hjoE2rt2F3GUFveG+aCe5GcE62zOr7jYFxftjWv13852idZCsyhUeTsxaVk
 yqqNjnoQ/7b3osE9l8oVcZtF7pniahzD50+YwJOo/t871w4YA8s4XYWrbfwgy2UKjns2
 AHSYVap1mwFyuzkxIvcHisKXEvGTNOemWIFM7Ox5C+oEjwl+aXg37TiCNOR4C0vKwLqC
 xiEw==
X-Gm-Message-State: AOJu0Yy2PRQ1LAGE4MPzOkvqURFuaNHT6n8ybNt9Qlb0TDjbhm+WaHGh
 NazmxjWT+VyG7L7SCeYOKNgYNfKFusoLdlI/MKwcqUPC
X-Google-Smtp-Source: AGHT+IH7TieQoVyZftJQTPt/lpOJMQLlQdVf9D5prhP5bubuY17DKnaZezt3z3AWl/G6rz3Jf/yyBw==
X-Received: by 2002:a17:906:10cd:b0:9a1:ea01:35b1 with SMTP id
 v13-20020a17090610cd00b009a1ea0135b1mr1484551ejv.62.1694785928915; 
 Fri, 15 Sep 2023 06:52:08 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 rh1-20020a17090720e100b009ad8ba6976bsm2475255ejb.9.2023.09.15.06.52.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 06:52:08 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so14720a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 06:52:08 -0700 (PDT)
X-Received: by 2002:a50:d09e:0:b0:525:573c:6444 with SMTP id
 v30-20020a50d09e000000b00525573c6444mr118963edd.1.1694785478523; Fri, 15 Sep
 2023 06:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234015.566018-1-dianders@chromium.org>
 <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
 <e7d855b6-327e-8c0c-5913-75bba9b6cfcd@loongson.cn>
In-Reply-To: <e7d855b6-327e-8c0c-5913-75bba9b6cfcd@loongson.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Sep 2023 06:44:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XF65otS2S+6sg6qga6Le3xb1f5GC6R6qpf27zx49DQ6w@mail.gmail.com>
Message-ID: <CAD=FV=XF65otS2S+6sg6qga6Le3xb1f5GC6R6qpf27zx49DQ6w@mail.gmail.com>
Subject: Re: [RFT PATCH 2/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown time for misc drivers
To: suijingfeng <suijingfeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alexandre.belloni@bootlin.com, xinliang.liu@linaro.org,
 tomi.valkeinen@ideasonboard.com, liviu.dudau@arm.com,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, wens@csie.org, jstultz@google.com,
 kraxel@redhat.com, sumit.semwal@linaro.org, yongqin.liu@linaro.org,
 samuel@sholland.org, sam@ravnborg.org, javierm@redhat.com,
 jernej.skrabec@gmail.com, drawat.floss@gmail.com,
 kong.kongxinwei@hisilicon.com, alain.volmat@foss.st.com,
 linux-sunxi@lists.linux.dev, tzimmermann@suse.de, alison.wang@nxp.com,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 paul.kocialkowski@bootlin.com, spice-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, tiantao6@hisilicon.com,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 15, 2023 at 2:11=E2=80=AFAM suijingfeng <suijingfeng@loongson.c=
n> wrote:
>
> Hi,
>
>
> On 2023/9/2 07:39, Douglas Anderson wrote:
> > Based on grepping through the source code these drivers appear to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > time. Among other things, this means that if a panel is in use that it
> > won't be cleanly powered off at system shutdown time.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case
> > of OS shutdown/restart comes straight out of the kernel doc "driver
> > instance overview" in drm_drv.c.
> >
> > All of the drivers in this patch were fairly straightforward to fix
> > since they already had a call to drm_atomic_helper_shutdown() at
> > remove/unbind time but were just lacking one at system shutdown. The
> > only hitch is that some of these drivers use the component model to
> > register/unregister their DRM devices. The shutdown callback is part
> > of the original device. The typical solution here, based on how other
> > DRM drivers do this, is to keep track of whether the device is bound
> > based on drvdata. In most cases the drvdata is the drm_device, so we
> > can just make sure it is NULL when the device is not bound. In some
> > drivers, this required minor code changes. To make things simpler,
> > drm_atomic_helper_shutdown() has been modified to consider a NULL
> > drm_device as a noop in the patch ("drm/atomic-helper:
> > drm_atomic_helper_shutdown(NULL) should be a noop").
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
>
> I have just tested the whole series, thanks for the patch. For drm/loongs=
on only:
>
>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>

Thanks!


> By the way, I add 'pr_info("lsdc_pci_shutdown\n");' into the lsdc_pci_shu=
tdown() function,
> And seeing that lsdc_pci_shutdown() will be called when reboot and shutdo=
wn the machine.
> I did not witness something weird happen at present. As you have said, th=
is is useful for
> drm panels drivers. But for the rest(drm/hibmc, drm/ast, drm/mgag200 and =
drm/loongson etc)
> drivers, you didn't mention what's the benefit for those drivers.

I didn't mention it because I have no idea! I presume that for
non-drm_panel use cases it's not a huge deal, otherwise it wouldn't
have been missing from so many drivers. Thus, my "one sentence" reason
for the non-drm_panel case is just "we should do this because the
documentation of the API says we should", which is already in the
commit message. ;-)

If you have a specific other benefit you'd like me to list then I'm happy t=
o.


> Probably, you can
> mention it with at least one sentence at the next version. I also prefer =
to alter the
> lsdc_pci_shutdown() function as the following pattern:
>
>
> static void lsdc_pci_shutdown(struct pci_dev *pdev)
> {
>
>      struct drm_device *ddev =3D pci_get_drvdata(pdev);
>
>      drm_atomic_helper_shutdown(ddev);
> }

I was hoping to land this patch without spinning it unless there's a
good reason. How strongly do you feel about needing to change the
above? I will note that I coded it the way I did specifically to try
to follow the style in the documentation in "drm_drv.c". In the
example "driver_shutdown()" function you can see that they combined it
into one line and so I followed that style. ;-) That being said, I
have no problem changing this if I spin the patch.

-Doug
