Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1579B5029
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 18:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646EB10E6AB;
	Tue, 29 Oct 2024 17:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y3GiyqXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2534110E6AB;
 Tue, 29 Oct 2024 17:13:16 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-71e74f35acaso470809b3a.2; 
 Tue, 29 Oct 2024 10:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730221996; x=1730826796; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ISkj2Ba2iXJsNtvKhhww/fpbPtoqWwWm4yhMQ09Pkc=;
 b=Y3GiyqXWJ817oTTUw/yTSVUrXgnWmHA32qZ2KpLcvaVNQmAlSgfhr9jOtdg+MUut5p
 n5m64yCL6gjd7IYcq5vJiFJZri1+5qB7M+NCwELDsPxzBZdfdYyUUI/wuyEDVh/RKum+
 ikJlVwbPXL4cSPEOOOQ/KeTc45Yaxfp/bLkoAEoZUj9yTvmtl+TPuQbrp02bqrrvzpKE
 Fkk9gZlu1AvH1mZ2cKcJtJmVZoufN6ymVh6KEM0Vic/ZiylnR5scgshBYLa/1m+ZKvhR
 JkbPnPeueRBcy9I9V5nwyFFnRlT0/O4iDF/MpQgIYQVzVNs+vZ3G/ZWoh64DsfOwOE+i
 Lpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730221996; x=1730826796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ISkj2Ba2iXJsNtvKhhww/fpbPtoqWwWm4yhMQ09Pkc=;
 b=GxeLnHfUfzJV1rihSIYJCPcz1NNNnFHvVrFulktZleFRGU4TEii3qXIICWbT7myfKL
 OrXgUMpjlBylAiCmCdjHBC05p9soeI6Dkl3HSYIN1CMmjP8QeuiXFcw2Md122A8syt+g
 J90VPElrCLqa7KIYKGgWpGwNZd1NvDHHoGqNwStTr+ufWINNPSVzMmdq+4cEyM0a5yS9
 FJXFNkNHxFi3gFHmu7tokS8dbT0TffaPccrD7emid3dzTgzUCJmsBF3dUhevNwyw5NVj
 R0Vc7jWI0MSvgaP+zLUiqm4gLtyD6noEGR7Ltv69XCqDbOnamUvk93R25jdXpqJWJj+P
 JJZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYCmqir0k2xBJcljJbLhKjzk44EJure6KJJOQs7lxbRzSnhNkyIS1LmEkbVUEBUCN+iJGX/XxQjxHx@lists.freedesktop.org,
 AJvYcCWfuP+Pbbvtp80MACrxEbXWrDWRb0Xrl0E2KS+d+HJYwRwA7cde/lt4ORYa6i361MHSa2BWu7UV@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfc9ANdSetvAqSLZ8PL+SyTCzXvAViG3GcpQ9FgKssvNSwdXHJ
 OGcIxekgAl6TopZp7xAOVmLRfZWllpboJBX/icktizyb/VsWBHqykVkXYd9GhiXwLe8OOIm1T5P
 1U+s7+u4wo2ErFbKv4xg7d8Sadg+gjw==
X-Google-Smtp-Source: AGHT+IFlYMr8oYy4eG6HH7R9vBgmgqNRSfIBoEQANg/2xkCVcwl67p0jEeFJ3FRp7rqggl/4qMNXfDF2TBQ5uT1l0j4=
X-Received: by 2002:a05:6a00:1ace:b0:71e:4842:55fe with SMTP id
 d2e1a72fcca58-720630065d6mr7821756b3a.4.1730221995539; Tue, 29 Oct 2024
 10:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241027140537.503264-1-prosunofficial@gmail.com>
 <CADnq5_M4QwRfROybHrQfNuiXNhHH7VFAUVZMWkriwZs7K4KLUQ@mail.gmail.com>
 <3d38112f-9235-4643-ae2c-ffb9fae7a5d2@gmail.com>
In-Reply-To: <3d38112f-9235-4643-ae2c-ffb9fae7a5d2@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Oct 2024 13:13:04 -0400
Message-ID: <CADnq5_N5ZpWSR5OGAqUu2HnySAhouUqWa36fATcv+oy7oHxdkA@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amdgpu: use string choice helpers
To: R Sundar <prosunofficial@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, tao.zhou1@amd.com,
 kevinyang.wang@amd.com, 
 Hawking.Zhang@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 luben.tuikov@amd.com, kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 29, 2024 at 1:05=E2=80=AFPM R Sundar <prosunofficial@gmail.com>=
 wrote:
>
> On 29/10/24 19:11, Alex Deucher wrote:
> > On Sun, Oct 27, 2024 at 10:18=E2=80=AFAM R Sundar <prosunofficial@gmail=
.com> wrote:
> >>
> >> Use string choice helpers for better readability.
> >
> > I personally find this less readable, but if this is the preferred
> > method going forward, I'm fine to take the patch.
> >
> > Alex
> >
>
> Hi,
>
> Thanks for the comments.
>
> I came across this comments in string_choices.h files, where
> str_read_write() helpers are present.
>
> Using these helpers offers the following benefits:
>
>   1) Reducing the hardcoding of strings, which makes the code more
> elegant through these simple literal-meaning helpers.
>
>   2) Unifying the output, which prevents the same string from being
> printed in various forms, such as enable/disable, enabled/disabled,
> en/dis.
>   3) Deduping by the linker, which results in a smaller binary file.
>

Thanks.  I've applied it.

Alex

> Kindly, I'm leaving the decision to maintainers.
>
> Thanks,
> Sundar
>
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> >> Closes: https://lore.kernel.org/r/202410161814.I6p2Nnux-lkp@intel.com/
> >> Signed-off-by: R Sundar <prosunofficial@gmail.com>
> >> ---
> >>
> >> reported in linux repository.
> >>
> >> tree:  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> >>
> >> cocci warnings: (new ones prefixed by >>)
> >>>> drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c:145:8-12: opportunity for=
 str_read_write(read)
> >>
> >> vim +145 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
> >>
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_eeprom.c
> >> index 35fee3e8cde2..8cd69836dd99 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
> >> @@ -200,7 +200,7 @@ static int amdgpu_eeprom_xfer(struct i2c_adapter *=
i2c_adap, u32 eeprom_addr,
> >>                  dev_err_ratelimited(&i2c_adap->dev,
> >>                                      "maddr:0x%04X size:0x%02X:quirk m=
ax_%s_len must be > %d",
> >>                                      eeprom_addr, buf_size,
> >> -                                   read ? "read" : "write", EEPROM_OF=
FSET_SIZE);
> >> +                                   str_read_write(read), EEPROM_OFFSE=
T_SIZE);
> >>                  return -EINVAL;
> >>          }
> >>
> >> --
> >> 2.34.1
> >>
>
