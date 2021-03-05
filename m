Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2078832ED60
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 15:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3276EB52;
	Fri,  5 Mar 2021 14:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393936EB97
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 14:46:06 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id a9so2111572qkn.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 06:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1y/3OThWLETFyGdIs2GM7bY5FBTWrwVWxjtUJk7Af1U=;
 b=KIrwsOeh/7pz4aR4vESLCMaliowa+XM5t3gHAg5vRVK0IgIPkDyKPBQW8wECY/MSDB
 MrXn1Bmq9Yx+Jz69Qu4bb9fg0CX6uEhhMWZ95LNLSJgRT20x2DhgGBAbz8JWlhnIowoM
 VZFBBW5XnajDdRSTATdU4LM5Y9jKNPiNdNsoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1y/3OThWLETFyGdIs2GM7bY5FBTWrwVWxjtUJk7Af1U=;
 b=a6hW0nFC8sAequhs/P1fGkHZ1q4jXcauyYbfawUh6cZ69SZNDpNgpNBnl4a6Go8fAi
 IRmWeBk348U6JEGkiJ/VuHnwEmbwjRw8rRWzZj3+zZvTgrqjagg2RxC9P450TyYjlcmU
 jQqGO6OqJ6I1VHGL1xFKFhWTIzMpWVePDtZ2nvCToJg1fHoWFWKXQu8ZeVcCNV1Z4E7e
 +/2c8xoGTLc52229JxFAbGlVsMnREGpxI4QfdrztjAwjOrgSakoH2Rdoolhk1lGdH35z
 +Knk38EyUxi0m6JcS1zMMlYNkyZu5Aq0FSf85+0tvFxPQnndVZbEnth6vZsDdUAt02Re
 BkTg==
X-Gm-Message-State: AOAM533Ca9OJrvdmXP5d5J2gYqM3VoxF2sHD7KkU5we6BYHX6a5+bNIL
 Zxax269Hi9lbrQEgj/sS82sBzTeEKQU2jA==
X-Google-Smtp-Source: ABdhPJyuTabUPd8a+xyZQbvPWyfG4LXIyrE1Ps+pm7eooxXSb1vI6Y0RIoQafuF1vn//qzAh2Ve+8g==
X-Received: by 2002:a05:620a:1206:: with SMTP id
 u6mr8921767qkj.173.1614955565122; 
 Fri, 05 Mar 2021 06:46:05 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id l65sm1829976qkf.113.2021.03.05.06.46.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 06:46:04 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id p193so2197572yba.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 06:46:03 -0800 (PST)
X-Received: by 2002:a25:d3c5:: with SMTP id
 e188mr14649712ybf.345.1614955563317; 
 Fri, 05 Mar 2021 06:46:03 -0800 (PST)
MIME-Version: 1.0
References: <20210227002603.3260599-1-dianders@chromium.org>
 <20210226162521.1.Ib5ae69a80704c3a2992100b9b5bac1a6cc470249@changeid>
 <6ce9f5b8-50b4-e655-f6c5-4e095c1d7e19@linaro.org>
In-Reply-To: <6ce9f5b8-50b4-e655-f6c5-4e095c1d7e19@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Mar 2021 06:45:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uq1sVDuJxy3N3C0i-FOMPKiJ5cUoJbh6WDoGfGHXXNDQ@mail.gmail.com>
Message-ID: <CAD=FV=Uq1sVDuJxy3N3C0i-FOMPKiJ5cUoJbh6WDoGfGHXXNDQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm: Fix speed-bin support not to access outside
 valid memory
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Niklas Cassel <niklas.cassel@linaro.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 5, 2021 at 2:28 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 27/02/2021 00:26, Douglas Anderson wrote:
> > When running the latest kernel on an sc7180 with KASAN I got this
> > splat:
> >    BUG: KASAN: slab-out-of-bounds in a6xx_gpu_init+0x618/0x644
> >    Read of size 4 at addr ffffff8088f36100 by task kworker/7:1/58
> >    CPU: 7 PID: 58 Comm: kworker/7:1 Not tainted 5.11.0+ #3
> >    Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
> >    Workqueue: events deferred_probe_work_func
> >    Call trace:
> >     dump_backtrace+0x0/0x3a8
> >     show_stack+0x24/0x30
> >     dump_stack+0x174/0x1e0
> >     print_address_description+0x70/0x2e4
> >     kasan_report+0x178/0x1bc
> >     __asan_report_load4_noabort+0x44/0x50
> >     a6xx_gpu_init+0x618/0x644
> >     adreno_bind+0x26c/0x438
> >
> > This is because the speed bin is defined like this:
> >    gpu_speed_bin: gpu_speed_bin@1d2 {
> >      reg = <0x1d2 0x2>;
> >      bits = <5 8>;
> >    };
> >
> > As you can see the "length" is 2 bytes. That means that the nvmem
> > subsystem allocates only 2 bytes. The GPU code, however, was casting
> > the pointer allocated by nvmem to a (u32 *) and dereferencing. That's
> > not so good.
> >
> > Let's fix this to just use the nvmem_cell_read_u16() accessor function
> > which simplifies things and also gets rid of the splat.
> >
> > Let's also put an explicit conversion from little endian in place just
> > to make things clear. The nvmem subsystem today is assuming little
> > endian and this makes it clear. Specifically, the way the above sc7180
> > cell is interpreted:
> >
> > NVMEM:
> >   +--------+--------+--------+--------+--------+
> >   | ...... | 0x1d3  | 0x1d2  | ...... | 0x000  |
> >   +--------+--------+--------+--------+--------+
> >                ^       ^
> >               msb     lsb
> >
> > You can see that the least significant data is at the lower address
> > which is little endian.
> >
> > NOTE: someone who is truly paying attention might wonder about me
> > picking the "u16" version of this accessor instead of the "u8" (since
> > the value is 8 bits big) or the u32 version (just for fun). At the
> > moment you need to pick the accessor that exactly matches the length
> > the cell was specified as in the device tree. Hopefully future
> > patches to the nvmem subsystem will fix this.
> >
> > Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++--------------------
> >   1 file changed, 8 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index ba8e9d3cf0fe..0e2024defd79 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1350,35 +1350,20 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> >               u32 revn)
> >   {
> >       struct opp_table *opp_table;
> > -     struct nvmem_cell *cell;
> >       u32 supp_hw = UINT_MAX;
> > -     void *buf;
> > -
> > -     cell = nvmem_cell_get(dev, "speed_bin");
> > -     /*
> > -      * -ENOENT means that the platform doesn't support speedbin which is
> > -      * fine
> > -      */
> > -     if (PTR_ERR(cell) == -ENOENT)
> > -             return 0;
> > -     else if (IS_ERR(cell)) {
> > -             DRM_DEV_ERROR(dev,
> > -                             "failed to read speed-bin. Some OPPs may not be supported by hardware");
> > -             goto done;
> > -     }
> > +     u16 speedbin;
> > +     int ret;
> >
> > -     buf = nvmem_cell_read(cell, NULL);
>
> I think the issue here is not passing len pointer which should return
> how many bytes the cell is!
>
> Then from there we can decide to do le16_to_cpu or le32_to_cpu or not!
> This will also future proof the code to handle speed_bins of different
> sizes!

I think what you're saying is that you want to copy/paste this code
(or something similar) everywhere that accesses an nvmem cell.  Is
that correct?  ...or maybe you can suggest some smaller / shorter code
that I'm missing?

---

{
  struct nvmem_cell *cell;
  ssize_t len;
  char *ret;
  int i;

  *data = 0;

  cell = nvmem_cell_get(dev, cname);
  if (IS_ERR(cell)) {
    if (PTR_ERR(cell) != -EPROBE_DEFER)
      dev_err(dev, "undefined cell %s\n", cname);
    return PTR_ERR(cell);
  }

  ret = nvmem_cell_read(cell, &len);
  nvmem_cell_put(cell);
  if (IS_ERR(ret)) {
    dev_err(dev, "can't read cell %s\n", cname);
    return PTR_ERR(ret);
  }

  for (i = 0; i < len; i++)
    *data |= ret[i] << (8 * i);

  kfree(ret);
  dev_dbg(dev, "efuse read(%s) = %x, bytes %zd\n", cname, *data, len);

  return 0;
}

---

The above code is from cpr_read_efuse() in "cpr.c".  I mentioned in
the cover letter that I thought about doing this and decided it wasn't
a great idea.  There should be _some_ function in the nvmem core that
says: there's an integer that's 32-bits or less stored in nvmem.
Please read it for me.  If you don't think we can use one of the
existing functions for that, would you be opposed to me creating a new
one?

---

In any case, while we discuss what we should do long term, I still
hope that Rob can merge this patch since it fixes the bug.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
