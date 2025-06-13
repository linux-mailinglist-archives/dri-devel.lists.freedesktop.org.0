Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565CBAD940A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 19:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701A010E1DE;
	Fri, 13 Jun 2025 17:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eRdnCl0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAD010E285
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 17:57:47 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-af6a315b491so2145203a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749837467; x=1750442267;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5jS9ENSnzPnUyHjAIVuhr0fGiDdRemDzfDFeNRMM30M=;
 b=eRdnCl0rc2e/yyyABp4OvCwQBITyS8HIsD787mQvsGW9+vVFwLt8Kcw/fsF+tOhzkX
 /rUI1qUWZpL+s83oxHcm5e4cgj9eMICllszwqYjTumnVKcSsnT1nl5eBMzP/tcBq12NJ
 rpSHrx6iUTISCCfS79ilQhQQPvnXzKPZ5/PFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749837467; x=1750442267;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5jS9ENSnzPnUyHjAIVuhr0fGiDdRemDzfDFeNRMM30M=;
 b=HqVOo1paSvBmcBCHEbnXp5dOO5t8BfzPBPLQ21NQ5p3OclkRaGuej4QhTcjhQI6MG1
 as+d5Ewiz2lxP3SNEFVXb7Igme0ws8cirCzBS1xn1LemrO65388ZqUHU0NJWmWBom2nk
 p/u67dPHILVdVT13cjQVaohFtawfg15va8YK1EXVJ5FlvsNjE4Z696inO32Z72fx2XEW
 eMj49YInFiDQXkiN1RPf/NhABJ5TOfCDxlq2+oR5pclWiF+tsAtVp/r9AHaYmoX5Xl8b
 w7FovGr2apgIl2rdWe4/PCIhnjJGuiWPIGfAiTc7Nnsm+mPFAjt1N2iToDaBH1AUAssB
 n62g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRbuhQIx+CANmL8MwAvLfXqklY65JnMleIdNqr9w0uD7JFq4NwKMotL91eS9/2jFgTHuQOWsz1fbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhJVrEzjX8YJTC3kn8O6CA9IY0T5rEfHXaz7uLhY2Q8DifVVpt
 8UZiiV5b4CGcmKe+Yi5FV2HN2DmZMhp8S4AxtWaFDG175h+PeGH+C/jVn/VS9TwpeA==
X-Gm-Gg: ASbGncv5HoCJDGXZhNkAf2aT9WDGpqnbbDVdZf0+BfP1ONcvUzSUsp+5T6BGNqyWdiS
 eqcC3Z7h22lGGEQS2dJ1ScNfr0wnyb4XuTZKvFOKOmO3QDVk5pLpOZ2oNCmts7XSYC1VffnIMiX
 mcOVVeg/NYztY7XoNIc+LdwVZOrGMD7SCz8TRj1nFNp9Nq0TQVussGkBp+trpwwGuN44VEV9kB/
 NbUHlaldY6EpdUx82d5Si11HtG78QWkhar5UBLRttekaUGWh2p6+jDn3A6SfHBMT5nV05tjVLhw
 DjogcpXOAAcaYeNwO74vP7AjqOfqPb+z0qgYog0X7DX09G7bWPJMK+xrmYKm3AJb4UvvQ19xkXX
 xBKLcfTpCJa/leycoVs3IAoPBtX+iDzz7MVeJ5Pc1ISUEwg==
X-Google-Smtp-Source: AGHT+IHIU98m80O096DyNz6FBKblaF+rI1qE9qq+RjCFY55Yz/YXcA6Wq3xnq+/T6AMxEMiZyVEmnA==
X-Received: by 2002:a17:90b:3d11:b0:311:a314:c2cf with SMTP id
 98e67ed59e1d1-313f1d1dd39mr887549a91.30.1749837467157; 
 Fri, 13 Jun 2025 10:57:47 -0700 (PDT)
Received: from justonli3.c.googlers.com
 (11.103.168.34.bc.googleusercontent.com. [34.168.103.11])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b49a3csm3698285a91.23.2025.06.13.10.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 10:57:46 -0700 (PDT)
Message-ID: <482c04039fe45c96925826b2f7d3cf00e02dcd97.camel@chromium.org>
Subject: Re: [PATCH v4 2/2] drm/xe/bo: add GPU memory trace points
From: Juston Li <justonli@chromium.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: Yiwei Zhang <zzyiwei@google.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 13 Jun 2025 10:57:46 -0700
In-Reply-To: <fpet5xjk7gqmqc7u4llr5v4eahfdayzcxqzp6o76l66jv4cu3w@ye2r3maxj2vh>
References: <20250611225145.1739201-1-justonli@chromium.org>
 <20250611225145.1739201-2-justonli@chromium.org>
 <mrfsys5djmsbotxlaahed5ogmofn4pkmgqfhl47rj3bwxdtlbv@7xbekwpkte57>
 <37a5f250-1c19-4b95-882b-b4ef3e5c6268@igalia.com>
 <p7wq3wrsddp7pk7bk5follhkc4f7ybgmc2o4e652jc2cfuqbhh@tckgwpy3khcn>
 <CAKT=dDkjYQUSwtYwFTvWppn-2sTdwYu_FE2jfhGXd6vWkQHvgg@mail.gmail.com>
 <3663ab48-6ac6-4903-aa08-f93c7b71ebf2@igalia.com>
 <yudr4466kytpf2l7jfu4oz3txismnupdlxk6fx3bxa5elweqdr@wmgeyur445pj>
 <fbc3d126-499e-4f7f-91d8-ce6bc80ae21e@igalia.com>
 <fpet5xjk7gqmqc7u4llr5v4eahfdayzcxqzp6o76l66jv4cu3w@ye2r3maxj2vh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.3-1 
MIME-Version: 1.0
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

On Fri, 2025-06-13 at 09:34 -0500, Lucas De Marchi wrote:
> On Fri, Jun 13, 2025 at 03:14:24PM +0100, Tvrtko Ursulin wrote:
> >=20
> > On 13/06/2025 15:10, Lucas De Marchi wrote:
> > > On Fri, Jun 13, 2025 at 09:02:27AM +0100, Tvrtko Ursulin wrote:
> > > >=20
> > > > On 12/06/2025 19:53, Yiwei Zhang wrote:
> > > > > On Thu, Jun 12, 2025 at 11:02=E2=80=AFAM Lucas De Marchi
> > > > > <lucas.demarchi@intel.com> wrote:
> > > > > >=20
> > > > > > On Thu, Jun 12, 2025 at 05:46:52PM +0100, Tvrtko Ursulin
> > > > > > wrote:
> > > > > > >=20
> > > > > > > On 12/06/2025 06:40, Lucas De Marchi wrote:
> > > > > > > > On Wed, Jun 11, 2025 at 03:51:24PM -0700, Juston Li
> > > > > > > > wrote:
> > > > > > > > > Add TRACE_GPU_MEM tracepoints for tracking global and
> > > > > > > > > per-process GPU
> > > > > > > > > memory usage.
> > > > > > > > >=20
> > > > > > > > > These are required by VSR on Android 12+ for
> > > > > > > > > reporting=20
> > > > > > > > > GPU driver memory
> > > > > > > > > allocations.
> > > > > > > > >=20
> > > > > > > > > v3:
> > > > > > > > > - Use now configurable CONFIG_TRACE_GPU_MEM instead
> > > > > > > > > of adding a
> > > > > > > > > =C2=A0per-driver Kconfig (Lucas)
> > > > > > > > >=20
> > > > > > > > > v2:
> > > > > > > > > - Use u64 as preferred by checkpatch (Tvrtko)
> > > > > > > > > - Fix errors in comments/Kconfig description (Tvrtko)
> > > > > > > > > - drop redundant "CONFIG" in Kconfig
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Juston Li <justonli@chromium.org>
> > > > > > > > > Reviewed-by: Tvrtko Ursulin
> > > > > > > > > <tvrtko.ursulin@igalia.com>
> > > > > > > > > ---
> > > > > > > > > drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 47=20
> > > > > > > > > +++++++++++++++++++++++ +++++
> > > > > > > > > drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
> > > > > > > > > 2 files changed, 63 insertions(+)
> > > > > > > > >=20
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > index 4e39188a021ab..89a3d23e3b800 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > @@ -19,6 +19,8 @@
> > > > > > > > >=20
> > > > > > > > > #include <kunit/static_stub.h>
> > > > > > > > >=20
> > > > > > > > > +#include <trace/events/gpu_mem.h>
> > > > > > > > > +
> > > > > > > > > #include "xe_device.h"
> > > > > > > > > #include "xe_dma_buf.h"
> > > > > > > > > #include "xe_drm_client.h"
> > > > > > > > > @@ -418,6 +420,35 @@ static void
> > > > > > > > > xe_ttm_tt_account_subtract(struct
> > > > > > > > > xe_device *xe, struct ttm_tt *tt)
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_shrinker_mod_page=
s(xe->mem.shrinker,=20
> > > > > > > > > -(long)tt- >num_pages, 0);
> > > > > > > > > }
> > > > > > > > >=20
> > > > > > > > > +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> > > > > > > > > +static void update_global_total_pages(struct
> > > > > > > > > ttm_device *ttm_dev,
> > > > > > > > > long num_pages)
> > > > > > > > > +{
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 struct xe_device *xe =3D
> > > > > > > > > ttm_to_xe_device(ttm_dev);
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 u64 global_total_pages =3D
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic64_add_=
return(num_pages, &xe-
> > > > > > > > > >global_total_pages);
> > > > > > > > > +
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 trace_gpu_mem_total(0, 0, global_tota=
l_pages <<
> > > > > > > > > PAGE_SHIFT);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static void update_process_mem(struct drm_file
> > > > > > > > > *file, ssize_t size)
> > > > > > > > > +{
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 struct xe_file *xef =3D to_xe_file(fi=
le);
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 u64 process_mem =3D atomic64_add_retu=
rn(size,
> > > > > > > > > &xef->process_mem);
> > > > > > > > > +
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 rcu_read_lock(); /* Locks file->pid! =
*/
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 trace_gpu_mem_total(0,
> > > > > > > > > pid_nr(rcu_dereference(file->pid)),
> > > > > > > > > process_mem);
> > > > > > > >=20
> > > > > > > > Isn't the first arg supposed to be the gpu id? Doesn't
> > > > > > > > this become
> > > > > > > > invalid when I have e.g. LNL + BMG and the trace is
> > > > > > > > enabled?
> > > > > > >=20
> > > > > > > Good point.
> > > > > > >=20
> > > > > > > u32 gpu_id does not seem possible to map to anything
> > > > > > > useful.
> > > > > >=20
> > > > > > maybe minor_id? although I'm not sure if the intention is
> > > > > > to share this
> > > > > > outside drm as seems the case.
> > > > >=20
> > > > > Yes, that was for render minor in the case of drm.
> > > >=20
> > > > Or to keep the field as integer we can use dev->primary->index,
> > > > which would then correlate with the /sys/class/drm/card%u, in
> > > > case=20
> > > > it needs to be mapped back.
> > > >=20
> > > > There is prior art in various drivers to use either dev_name or
> > > > dev- >primary->index, but for this one it is probably easier to
> > > > stick with the integer so both msm can keep passing the zero
> > > > and=20
> > > > we don't
> > >=20
> > > both msm?=C2=A0 In xe we'd use dev->primary->index, right?
> >=20
> > Right. I could have used some punctuation. Both as in 1) msm can
> > keep=20
> > passing hardcoded zero, 2) we don't have to even start thinking
> > about=20
> > Android userspace compatibility.
>=20
> ah.. ok, misunderstood that. Makes sense.
>=20
> thanks
> Lucas De Marchi

Tested with dev->primary->index and it works for us, will send v5.

Apologies this got missed, thanks for the guidance everyone!

Juston

> >=20
> > Regards,
> >=20
> > Tvrtko
> >=20
> > >=20
> > > Lucas De Marchi
> > >=20
> > > > have to think about Android userspace forward/backward
> > > > compatibility.
> > > >=20
> > > > Regards,
> > > >=20
> > > > Tvrtko
> > > >=20
> > > > >=20
> > > > > >=20
> > > > > > >=20
> > > > > > > Shall we replace it with a string obtained from
> > > > > > > dev_name(struct device
> > > > > > > *) ? As only Android parses them I think we can get still
> > > > > > > away with
> > > > > > > changing the tracepoints ABI.
> > > > > >=20
> > > > > > works for me too. Is Android actually parsing it or just
> > > > > > ignoring?
> > > > > > Because afaics it's always 0 in msm.
> > > > >=20
> > > > > Android has used it as part of the bpf map key:
> > > > > https://cs.android.com/android/platform/superproject/main/+/=C2=
=A0
> > > > > main:frameworks/native/services/gpuservice/bpfprogs/gpuMem.c
> > > > >=20
> > > > > >=20
> > > > > > Lucas De Marchi
> > > >=20
> >=20
