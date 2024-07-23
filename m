Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E73C93A997
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 01:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3453210E02F;
	Tue, 23 Jul 2024 23:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lg9ll7yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38E110E0A9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 23:07:39 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso193161cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 16:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721776059; x=1722380859;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6C+fkFukNiGp5ISGUxgRcyilQiJzLpuodr5Eof9VBJg=;
 b=lg9ll7ygi298axPAJ3i4PINIGc0/2/0KQ5K6YbEpDs43HEUkDKfcsuUuncX9kE6IM6
 oy7wDhvSQI5viXKhCmQJstTVu6i0lyQJVeIyOZ1/6uwN6klIe9l0WkhR5KEL5BBIQy6+
 UxOwrYsgPIuoRx7Ji1I9sdv3Lq0cFOoq0nY9Le4bk0PmMl0DzZDdsuOSLByn4Z//ZQwE
 x6FtgZdpLGCFWq4mokGgpswzEeaxDlB/3o0MHLg6Tkj/c/db/Rr4oF1vD8GsNdG/sQ1T
 cHtjqMhqD7jtmhfwRPmBb9xmGM7VLz84E+ItDxEwbXv6CEMNJhyGrhynxntvWv/EYydl
 4mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721776059; x=1722380859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6C+fkFukNiGp5ISGUxgRcyilQiJzLpuodr5Eof9VBJg=;
 b=wyhJJHjgL6lcCfBi443Iwf0eksVCxQCf5TMXKhKDU+F9ddBZx4RvmsIE2tNANeqTiJ
 H5VETKVtaOYzz5BWfQxPrMFYWwFRdy5eEWbZGrkb4zZDuRi/dThPAOeFtJ9zlVDVs0rS
 nbvu5it9p4iI3mqCtAkjMEfY+GNiqxBflL3Pd+Nf0E2+Wk4R0XsKoInudYovuNXMbueN
 iNeO5MFscoYa4WbIuBfU98cYqitN6AAgX5hVyWyjU7cnHE9OM0YrtwAn30N06XE5+hAb
 miA2D/BPLXbvwTkTwZGc1nz+iE5gNDiWBzahmNLuwmA7e88CCGLU6n8pvrKeydbRB3Uy
 H97g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYUEkdImNY9mvT97an5ad3CZ8vV9W1IlahB928H/Q8a6HMIuo6lrPfF8FtIrAYHYp3z9ZV5vO5rEu0EvYkvMCdeVJt4YhVMjza2thaW7Ur
X-Gm-Message-State: AOJu0Yx/e47f/l9Z8h8ZgHakWMZksSG602TgNYIyAaLbxKSndHSByE+c
 RFr5GdgqbGhSIlsf/oC7wzRT4GHP8fH+HWOSgWaZwqRsMCHYRbgHAi6MiKqxx8W+yHOussEBApN
 oRV5WutAmNcll/PxSsusKZwtQ62Qt6zMEKBwf
X-Google-Smtp-Source: AGHT+IFgGTZzHeugui0RzmvFiY7doQ86K2Y0h52nLIG0c9YpVHS5634BVNFZRzQv9vFzIFzEs6QM3K+ectPLd0aerco=
X-Received: by 2002:a05:622a:248:b0:444:ccc5:f4c0 with SMTP id
 d75a77b69052e-44fd4ac8c3dmr1983041cf.15.1721776058474; Tue, 23 Jul 2024
 16:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
 <20240722210648.80892-2-lucas.demarchi@intel.com>
In-Reply-To: <20240722210648.80892-2-lucas.demarchi@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 23 Jul 2024 16:07:27 -0700
Message-ID: <CAP-5=fUgxQB-pzxNHZXGzFh1B3yL=ui0izM-dp_K7oubh8UOOg@mail.gmail.com>
Subject: Re: [PATCH 1/7] perf/core: Add pmu get/put
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, linux-perf-users@vger.kernel.org, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org
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

On Mon, Jul 22, 2024 at 2:07=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> If a pmu is unregistered while there's an active event, perf will still
> access the pmu via event->pmu, even after the event is destroyed. This
> makes it difficult for drivers like i915 that take a reference on the
> device when the event is created and put it when it's destroyed.
> Currently the following use-after-free happens just after destroying the
> event:
>
>         BUG: KASAN: use-after-free in exclusive_event_destroy+0xd8/0xf0
>         Read of size 4 at addr ffff88816e2bb63c by task perf/7748
>
> Whenever and event is created, get a pmu reference to use in event->pmu
> and just before calling module_put(), drop the reference..
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  include/linux/perf_event.h |  3 +++
>  kernel/events/core.c       | 32 ++++++++++++++++++++++++++++----
>  2 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index a5304ae8c654..7048a505e93c 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -540,6 +540,9 @@ struct pmu {
>          * Check period value for PERF_EVENT_IOC_PERIOD ioctl.
>          */
>         int (*check_period)             (struct perf_event *event, u64 va=
lue); /* optional */
> +
> +       struct pmu *(*get)              (struct pmu *pmu); /* optional: g=
et a reference */
> +       void (*put)                     (struct pmu *pmu); /* optional: p=
ut a reference */
>  };
>
>  enum perf_addr_filter_action_t {
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 1b6f5dc7ed32..cc7541b644b0 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -5208,6 +5208,8 @@ static void perf_addr_filters_splice(struct perf_ev=
ent *event,
>
>  static void _free_event(struct perf_event *event)
>  {
> +       struct module *module;
> +
>         irq_work_sync(&event->pending_irq);
>
>         unaccount_event(event);
> @@ -5259,7 +5261,13 @@ static void _free_event(struct perf_event *event)
>                 put_ctx(event->ctx);
>
>         exclusive_event_destroy(event);
> -       module_put(event->pmu->module);
> +
> +       module =3D event->pmu->module;
> +       event->pmu->put(event->pmu);
> +       /* can't touch pmu anymore */
> +       event->pmu =3D NULL;
> +
> +       module_put(module);
>
>         call_rcu(&event->rcu_head, free_event_rcu);
>  }
> @@ -11331,6 +11339,11 @@ static int perf_pmu_nop_int(struct pmu *pmu)
>         return 0;
>  }
>
> +static struct pmu *perf_pmu_nop_pmu(struct pmu *pmu)
> +{
> +       return pmu;
> +}
> +
>  static int perf_event_nop_int(struct perf_event *event, u64 value)
>  {
>         return 0;
> @@ -11617,6 +11630,12 @@ int perf_pmu_register(struct pmu *pmu, const cha=
r *name, int type)
>         if (!pmu->event_idx)
>                 pmu->event_idx =3D perf_event_idx_default;
>
> +       if (!pmu->get)
> +               pmu->get =3D perf_pmu_nop_pmu;
> +
> +       if (!pmu->put)
> +               pmu->put =3D perf_pmu_nop_void;
> +
>         list_add_rcu(&pmu->entry, &pmus);
>         atomic_set(&pmu->exclusive_cnt, 0);
>         ret =3D 0;
> @@ -11695,7 +11714,8 @@ static int perf_try_init_event(struct pmu *pmu, s=
truct perf_event *event)
>                 BUG_ON(!ctx);
>         }
>
> -       event->pmu =3D pmu;
> +       event->pmu =3D pmu->get(pmu);
> +
>         ret =3D pmu->event_init(event);
>
>         if (ctx)
> @@ -11714,8 +11734,12 @@ static int perf_try_init_event(struct pmu *pmu, =
struct perf_event *event)
>                         event->destroy(event);
>         }
>
> -       if (ret)
> -               module_put(pmu->module);
> +       if (ret) {
> +               struct module *module =3D pmu->module;
> +
> +               pmu->put(pmu);

I think this is a great fix, a nit here, wouldn't it be good to do:

event->pmu =3D NULL;

Thanks,
Ian

> +               module_put(module);
> +       }
>
>         return ret;
>  }
> --
> 2.43.0
>
>
